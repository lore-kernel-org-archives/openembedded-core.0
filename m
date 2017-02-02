Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id D69CB71A65
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Feb 2017 19:43:52 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id 203so47115376ith.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Feb 2017 11:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=P4NzPt2xJMPLiNv0e9rEv+KENo3PYrN3QUbX9u/AhcY=;
	b=wxIeopLLiudEADwrji/+Lv5Hp4UsYxI8LOrtjK+H/lroaXspDmhyfTp718gtijz2Tb
	SXyPWEhLILZrqtPDiMCP5eLP3KC9f9A/AKQJBBXNdawzD+hZhsk6NG8wQADbGsQJGyEv
	/a5zdFpfh9fgHOSzqHJec6YIRwyeA4hPpzHEXJS/JwCmOx9T36UstFTXr3FRrsCXOQUY
	jdTMiBqLYWuSId7jQDrzhW5t/o4NdGXsp4rBiZ74IgwXF3p81Z+CSEipFQtA8qTKxCP4
	AseXl+saXyLcNq5znn/yvEPxncEw8jrE5iHeQANa3m6rqyQ+sh9UbVwzD1kHVf+8UMxD
	oAKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=P4NzPt2xJMPLiNv0e9rEv+KENo3PYrN3QUbX9u/AhcY=;
	b=ucS2hI81Po3NefLBsZFoNZcDhZXDqtx9eaClBJP7crwVIIVRIxFbDsm6nFZlYSqQge
	Xda8a/8Ok7Kn/WxqDMaimtjmXgXbIGanKUD47V8eZ21rHj30U9qZKoAA7FXV9xks/FmV
	PlZfn5sm2iZJkya0K/1F3s8zZOZp4VlgFv1JZG7y9ov++wPeLXKG/rPhdaushDBw+MUO
	s5dM0DL4PgsvdpbLsO39IC4gttdSx0fjB5YZJ4uEWIqOp5H3r1CZDhdnZj+qA8tt0dXM
	6VCAb5i53HJqnIdYmB7rZW6YpNzhI79YIhPe4dnE7WYmbL2krDJ5wb7+xfqV2OTaXmkG
	5EVw==
X-Gm-Message-State: AIkVDXJOC/D3iHGP//CViiAAD7fOK5I5QsaBYenIK0Nvjw+WSZ01cMCFmz3FdkjrbHGOgWXO
X-Received: by 10.36.90.194 with SMTP id v185mr28596327ita.85.1486064632631;
	Thu, 02 Feb 2017 11:43:52 -0800 (PST)
Received: from pohly-mobl1 (p5DE8E270.dip0.t-ipconnect.de. [93.232.226.112])
	by smtp.gmail.com with ESMTPSA id
	y124sm12257790itd.19.2017.02.02.11.43.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Feb 2017 11:43:51 -0800 (PST)
Message-ID: <1486064629.14889.62.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Seebs <seebs@seebs.net>
Date: Thu, 02 Feb 2017 20:43:49 +0100
In-Reply-To: <20170202131123.038be11f@seebsdell>
References: <1486031880.14889.35.camel@intel.com>
	<20170202102105.07a3bb91@seebsdell>
	<1486053547.14889.50.camel@intel.com>
	<20170202111201.3fcee3fa@seebsdell>
	<1486055849.14889.52.camel@intel.com>
	<20170202131123.038be11f@seebsdell>
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
X-List-Received-Date: Thu, 02 Feb 2017 19:43:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-02-02 at 13:11 -0600, Seebs wrote:
> On Thu, 02 Feb 2017 18:17:29 +0100
> Patrick Ohly <patrick.ohly@intel.com> wrote:
> 
> > On Thu, 2017-02-02 at 11:12 -0600, Seebs wrote:
> > > > But I find mapping to root:root more attractive because it makes
> > > > packaging simpler (less worries about accidentally copying the
> > > > original uid) and the builds faster (no need to run the QA check).
> 
> > > Hmm. I think I would rather have the QA check, because if a file's
> > > supposed to be non-root, and ends up root instead, that could cause
> > > subtle problems, but we'd no longer have a way to *detect* those
> > > problems.
> 
> > But that's not the kind of the problem detected by the QA check, is
> > it?
> > 
> > It warns when the owner of the file is the same as the user who did
> > the build, but because root isn't (normally) used for building, files
> > accidentally owned by root on the target won't trigger the warning.
> 
> Right. But the purpose of that is to detect files which didn't get
> their ownership correctly set. If we change to a default which we can't
> detect, then we can't detect "files which were supposed to have an
> ownership but didn't get it".

Got it - that's the same concern I had with 'it hides
such sloppy use of "cp"'.

> ("Created under pseudo" is enough to count as "ownership determined by
> recipe", it doesn't have to be an explicit chown.)

One could argue that an implicit "created during build -> owned by root"
follows the same logic. But as the check as it is now did find a real
issue and also others in the past (the pseudo bugs that Chris
mentioned), let's keep it.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




