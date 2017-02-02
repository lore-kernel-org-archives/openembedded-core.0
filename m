Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id E0FB471ADD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Feb 2017 16:39:11 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id 203so43287657ith.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Feb 2017 08:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=NzHJvQ7OifYn486iECxm6bHNPjlivDP0bVxVo/ZhjPY=;
	b=En9h0dG+qedk+uqle8zT1tGV3F3vUTWA/df5Cpm9hnjcy51LH89fiydWO+RHM7yKMz
	Uo6dTVn/tB21XruFMmP6ryKaGX3XOvxDIlZgGNn6ssLgHvewLhBOidT/VjEQdnplgXbg
	DqZcuhgGTraASaY0Y+Kaej7LAzjdtBqmbtU1lba7JCWTEHwYlWtn7qy9mx/9V8JsMJiZ
	ghAgz/BFnxprybWR3jCh3IKZUzKsuiX0y3CcoqCLiA4ZlRea941drttSmKebi2C6woA/
	NhNMQvgp9Ar3GoAFl2E8Gas184XClzXZaJIi5dTEYoHBy7JYZiD/vfn/JC2laPdCi9bU
	Xa7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=NzHJvQ7OifYn486iECxm6bHNPjlivDP0bVxVo/ZhjPY=;
	b=Kn6TvgAw8uDU/E6z526QbIA8t/yTl7CHpQhgJo7Bkf0BW2iVgkB+sanyomiHP031oq
	kXIbTpiP4DZjXA0F5L6PNFrcj0aftO/aiIwY0QosCUduRfSHGEmGqAz1YyVJ37t5dBtu
	dTv+tEq77ZabCZHkbpzzbfYkNhPYrA5icXAXWmFu4uhaiTKLAdzqmBsnPGuYsXr7iaKQ
	8PSMx3lBGr5oLl8flCO+zOtj+BtY6QY3TgAtZvvvB3fe7AeXj7RDLhXUAvPAGPYgPj+O
	8dxzTb1PSLTdWyMtB2oj71HI6eHhtO6Iufv29F8r2Ml0vl7qMSS9cP3HAuPMqmQeqFBK
	Clyg==
X-Gm-Message-State: AIkVDXKu69Re+BgoQ3u5MJ+lQgs0TBtzjQRrvLTVU/A2ek6axx/+wFYCpYpanrzacUZzEpvu
X-Received: by 10.36.103.142 with SMTP id u136mr7255837itc.89.1486053551010;
	Thu, 02 Feb 2017 08:39:11 -0800 (PST)
Received: from pohly-mobl1 (p5DE8E270.dip0.t-ipconnect.de. [93.232.226.112])
	by smtp.gmail.com with ESMTPSA id o13sm1135592ith.5.2017.02.02.08.39.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Feb 2017 08:39:10 -0800 (PST)
Message-ID: <1486053547.14889.50.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Seebs <seebs@seebs.net>
Date: Thu, 02 Feb 2017 17:39:07 +0100
In-Reply-To: <20170202102105.07a3bb91@seebsdell>
References: <1486031880.14889.35.camel@intel.com>
	<20170202102105.07a3bb91@seebsdell>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OpenEmbedded <openembedded-core@lists.openembedded.org>
Subject: Re: host-user-contaminated QA check
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Feb 2017 16:39:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-02-02 at 10:21 -0600, Seebs wrote:
> On Thu, 02 Feb 2017 11:38:00 +0100
> Patrick Ohly <patrick.ohly@intel.com> wrote:
> 
> > Why do we make the real user ID on the build system visible at all
> > when running under pseudo? The uid and user name have no meaning
> > there, as the user won't exist on the target system. Instead we could
> > map the owner of all files to root:root by default, i.e. in those
> > cases where no other ownership is recorded in the pseudo database.
> 
> We could. Honestly, the underlying reason we don't is at least in part
> that that makes the behavior differ more from the behavior of "sudo";
> with sudo, you see actual ownerships. But that's less applicable here.
> 
> I would be more inclined to report a Definitely Absolutely Not Okay
> user ID, like 65533. (65534 and 65535 have both been used as Magic
> Cookies in the past, I think.)

I had considered that approach myself, too. It would make the QA check
reliable and in that sense solve the problem.

But I find mapping to root:root more attractive because it makes
packaging simpler (less worries about accidentally copying the original
uid) and the builds faster (no need to run the QA check).

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




