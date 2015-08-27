Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 5B77676DDA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 14:08:01 +0000 (UTC)
Received: by iodv127 with SMTP id v127so58005474iod.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 07:08:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=FiwAFKKDYWhrJMknOmq6BGBS9uFg8es1r+Uxv32F2F8=;
	b=Ecg4ayu6LR2zwzP3EX06CcL/qoGxDY3Eb2gcGuyXeGjx1pta9VVX/N+jwp2bCuyo3f
	LAhnbyQuWYqDVynH4gotsZqGXaL+gOnrdekcdNwGUqiZnwCDVoAm29m1pDjPjdVrfB9G
	X9K/gRKZabo0aAdC+57XkefwZ/irakHroyfPqVcS1FKR7s+eWi0HBmAHo3Owkkpmr10m
	Ka+cCaArRSB6Ws52MROFFZAh+se24HqXp4YfyqU4/ROdeLFAftuxzAOyfl1cqWs/3W70
	otMPAeC+uJ5YW84KnnrqqO0vfM917HfchZhWnWUi/nXBQs48X+IXTt076VPa1AX7zvWO
	jJEw==
X-Gm-Message-State: ALoCoQmLpY4/JL+fFRgp0+8cnT7kexk+UsSQeb5tET1Fi5gEX48RDX/Wz2UmvWiRK3F6A6hZrj12
X-Received: by 10.107.6.14 with SMTP id 14mr11369373iog.171.1440684481847;
	Thu, 27 Aug 2015 07:08:01 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8F2EE.dip0.t-ipconnect.de. [93.232.242.238])
	by smtp.gmail.com with ESMTPSA id
	j134sm1739426ioj.7.2015.08.27.07.08.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Aug 2015 07:08:01 -0700 (PDT)
Message-ID: <1440684479.3006.45.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Aug 2015 16:07:59 +0200
In-Reply-To: <CAMKF1spMTUv-kZPS7D2wY5Y=h1PDMeDDn2aZUnY7=gVTXzGZpQ@mail.gmail.com>
References: <1440605035.20082.20.camel@intel.com>
	<f1fe5d98cb0737847778531368eab04778076750.1440603928.git.patrick.ohly@intel.com>
	<CAMKF1speSYjijUeuHAyVXRQf5DQtaWsCRjZ3=02dXPOeOdRb=g@mail.gmail.com>
	<1440657827.20082.26.camel@intel.com>
	<CAMKF1spMTUv-kZPS7D2wY5Y=h1PDMeDDn2aZUnY7=gVTXzGZpQ@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] mtd-utils: add xattr PACKAGECONFIG and fix acl dependency
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
X-List-Received-Date: Thu, 27 Aug 2015 14:08:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-08-27 at 06:32 -0700, Khem Raj wrote:
> On Wed, Aug 26, 2015 at 11:43 PM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> > The one in bb.utils.contains()? That is there intentionally: it's for
> > the "xattr enabled" case, in which case nothing gets added to
> > EXTRA_OEMAKE.
> 
> is it required to have extra " ?
> can it work without it

bb.utils.contains() expects exactly 5 parameters and has no defaults, so
no, that empty string cannot be omitted.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




