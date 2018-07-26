Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 53BC578C0C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 14:15:25 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id q12-v6so1664049qtp.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 07:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZLqXM6xMb5P12sOvm0XoV4uKQPMyRNZC7ZOCdNtno/I=;
	b=mPsj7C1qSLojxCSbXs57wgKzcELTX1W/NsgA93B15wF+LyQt6hawRzI3HQkl5qV4G/
	RCJLiLCH3l6o1/GE8J0iv7IWFqckGVIoRxDHvRCnNg4jpjcbPU9f0GR29qopBr2fAF5I
	GEZuyAvyeAchD9ItxdiBXhZKsiiAYP8r5EorEcGy0y2Ro6PAfdIr6QfOpgbqJ+2iAQN8
	/yOFrAKscwqcQWcjBj2ewEwzR+rkykqelf4fenNZD4tugQMCCodgE2H5uQ/UBSb/wZ4E
	nFWgWqlpHA27yVWMn5HTxXX4vHUAkrGyZryk8tmzsFdrehvzNtBiPvuMUG280w0JGujK
	5YZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZLqXM6xMb5P12sOvm0XoV4uKQPMyRNZC7ZOCdNtno/I=;
	b=M88j3m2/SAxrPSAywtsYTXK/+mNcKRZABh5bY7g+ZFt0dWmreobzqcxnjdueNxwjBW
	qaDBE5bKXIZj+sUCYlfdwNM1E/r4iBY96X2f8klOTjKL+enikjvL1xipJYyzncdeFlG7
	CNFpUA+89SMbouS73C/IIT86e7ufnfmGxfmYCcK43RvbBIQcrSgwy8d49Ok/nBS3v57c
	fiCO4YTCpv+05/2R+86pIMPo+J+cGvSEOFYIW4i0PnZBGSz3E7zubM1Gcb8axEugkych
	FNBTMmPdT0+HfeugYFA9kT+GzNbqY+/TJiqWPnREIObn5tMQgNVHRo2c5fFZF743T1YS
	ETeQ==
X-Gm-Message-State: AOUpUlF4LCu/hCz3hxCRNJzglEYFqlurzbHUtSDD3CQXIwP5iRU4/TT0
	aEUX2w5i4Qw+ge8jQ9Jd0Vf0x+q0xIK1rDRJyqI=
X-Google-Smtp-Source: AAOMgpe6CvCa10rJZk3jx1WMzW2n/oQmrEcH5bs4QiUkWmgre13iku/9rkVCni1Let2R4xfN/dSPIieEQaI44n5vMTg=
X-Received: by 2002:ac8:3209:: with SMTP id
	x9-v6mr2060363qta.128.1532614525877; 
	Thu, 26 Jul 2018 07:15:25 -0700 (PDT)
MIME-Version: 1.0
References: <1532562394-27081-1-git-send-email-christopher.w.clark@gmail.com>
	<4dc8f36e3667d46e4df740f35c4a47349b25541f.camel@linuxfoundation.org>
In-Reply-To: <4dc8f36e3667d46e4df740f35c4a47349b25541f.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 26 Jul 2018 07:14:59 -0700
Message-ID: <CAMKF1srU3arodZ57ZG22qWZ1haYvJ3OVL=1JHoTn7WNArDmT_A@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] binutils : enable x86_64-pep for producing EFI binaries
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
X-List-Received-Date: Thu, 26 Jul 2018 14:15:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 26, 2018 at 5:48 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2018-07-25 at 16:46 -0700, Christopher Clark wrote:
> > From: Christopher Clark <christopher.clark6@baesystems.com>
> >
> > On EFI architectures (arm/x86/x86_64/aarch64) add the x86_64-pep
> > emulation support to the linker to enable production of Portable
> > Executables for EFI binaries.
> >
> > Enables building the EFI variant of the Xen hypervisor.
> >
> > Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> > ---
> >  meta/recipes-devtools/binutils/binutils.inc | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-devtools/binutils/binutils.inc
> > b/meta/recipes-devtools/binutils/binutils.inc
> > index 37813dd..b3efbad 100644
> > --- a/meta/recipes-devtools/binutils/binutils.inc
> > +++ b/meta/recipes-devtools/binutils/binutils.inc
> > @@ -69,12 +69,19 @@ python do_package_prepend() {
> >
> >  B = "${S}/build.${HOST_SYS}.${TARGET_SYS}"
> >
> > +def enable_efi_targets(d):
> > +    translated_arch = d.getVar('TRANSLATED_TARGET_ARCH')
> > +    if translated_arch in ["x86-64", "i586", "i686", "arm",
> > "aarch64"]:
> > +        return "--enable-targets=x86_64-pep"
> > +    return ""

may be we can just use  overrides instead of function

>
> Just to double check, is "x86_64-pep" the right value even on arm?
>

right, It should be PE emulation for the given arch I believe

> Cheers,
>
> Richard
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

