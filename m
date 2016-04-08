Return-Path: <anders@chargestorm.se>
Received: from mail-lb0-f178.google.com (mail-lb0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id ADD52731C4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Apr 2016 09:54:51 +0000 (UTC)
Received: by mail-lb0-f178.google.com with SMTP id bk9so38995060lbc.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Apr 2016 02:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=nsDlYeMGnUfyIRbaeRlyhz1IGQyoJxXvCvlogMhRfI8=;
	b=Hsk/Wv0zWH3A8jy97HzxVsyeGs32f9Lz98PJGxRGjveHY8l4uEPL1QOlG12rDbnDLP
	gMLt0keVCguWTOnP9bBpwaQ8sl3a4U/+degzdOT6qi6HF/UBD0haGVM4kztpmgw2vlAZ
	gEv4OHbDX9ijqZ0AP8nQgbvK9Es2adIT5Js84FNIcoi1jp1V/PkNLrWOGA0l0PjalqS1
	4tEgs6Hq4mISXePenq2AWuQdDiP1Z+uM7drAZYhcwFUKw8zXr2XpXF8FVubtNQAoOIee
	CUQyDULGl0V0+4AuElsINnWYz35jNbrQgZMHX1nE2aCJgcLyhZVFLeu5CR+/liLC0kpH
	L2Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to
	:organization:user-agent;
	bh=nsDlYeMGnUfyIRbaeRlyhz1IGQyoJxXvCvlogMhRfI8=;
	b=fCyth92QSF0IR/N3OI38BDvnaDwnw5qfPGd22KE9+lo7YtQFiN0HrAcQ5WCil9t7DZ
	VtgZoHviDtrilfYobN5bW2ngpAkVj3sFhQfoT2UDEX0Cy3XYtilAs4V+kxCO+/y95Bjx
	bCdEqdTpoFDKQQchrDUXWtk7WsAkT0w8UzbAOEC1pygAhd6slnBb1i5EQKTzdyOBN8lR
	emUHKrou56XcdiRYdkPIDT63jXCISGEgeGUVvmbBOv3uAcvlFhS/hnvwWTv0MLaDNf7Z
	n85nvVVE7WpP+9FHba2engexnJZ5+ySHS868SxmaSC0coGiwi3V+7EGQqW3rm3PKJLsz
	TWPg==
X-Gm-Message-State: AD7BkJKH5IlY0wvYQ6IvzwxItH+r8sTVj01EyomceUuXIFtaC1v0R7o55Ela8GWbtE34yA==
X-Received: by 10.112.122.244 with SMTP id lv20mr2800198lbb.63.1460109290527; 
	Fri, 08 Apr 2016 02:54:50 -0700 (PDT)
Received: from ad.chargestorm.se (213-64-219-84-no126.business.telia.com.
	[213.64.219.84])
	by smtp.gmail.com with ESMTPSA id i9sm1938581lfe.31.2016.04.08.02.54.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Apr 2016 02:54:49 -0700 (PDT)
Date: Fri, 8 Apr 2016 11:54:48 +0200
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Message-ID: <20160408095448.GA4953@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <cover.1460099653.git.liezhi.yang@windriver.com>
	<088e89118818dccb4f19c73795d7ae2a724e6473.1460099653.git.liezhi.yang@windriver.com>
	<57077543.1010708@denx.de>
MIME-Version: 1.0
In-Reply-To: <57077543.1010708@denx.de>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH 2/4] image_types.bbclass: fix ubi ubifs and multiubi
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
X-List-Received-Date: Fri, 08 Apr 2016 09:54:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Stefano Babic <sbabic@denx.de> [160408 11:19]:
> On 08/04/2016 09:15, Robert Yang wrote:
> > Fixed when do_image_ubi:
> > | DEBUG: Executing shell function do_image_ubifs
> > | Error: min. I/O unit was not specified (use -h for help)
> > | WARNING: exit code 255 from a shell command.

NAK

> > +MKUBIFS_ARGS ?= "-m 1KiB -e 128KiB -c $ROOTFS_SIZE"
> > +UBINIZE_ARGS ?= "-m 1KiB -p 128KiB"
> > +

> These are machine specific and are generally set in the machine
> configuration file. Default values you set here could be wrong in most
> cases, depending on the NAND chip.

> Is it not better to get the error ? Then I know that I forget to set the
> two variables and I can easy fix it. If no error is raised, we get a
> ubifs that never run on the machine and as rootfs is not mounted - and
> finding the reason is much more difficult.

I agree with Stefano here; I'd also prefer a build failure instead of a
non-working image.

Cheers,
Anders

-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

