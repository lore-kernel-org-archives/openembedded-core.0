Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com
	[209.85.217.50])
	by mail.openembedded.org (Postfix) with ESMTP id 2912B6BD08
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 23:11:41 +0000 (UTC)
Received: by mail-vs1-f50.google.com with SMTP id u11so2383792vsp.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 15:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6HianJQOjGTHamqpLn7V3OL0zqyGWi4k5MnFW9wFyY0=;
	b=j/nxT4oHCV0E7LgbReTZQ4rnzwyV1RWXLC/+CXmPIidfEJvfr/7JvRZATYVRkFskZc
	en4jdLG8nDatVObjs+GqwVjdUsxY+k/niWp+8gPadQGe563cV1MMhPRHXd2qX/OeyLbN
	qv4uds4xRaO54Ce3RMRw223VGSeEmPQlisy5em/xcSDaPboSFfK+3kWB+8Lr7+BEs0Qh
	bOO6wDRQmTS7m7jbgUNcjs+BQWBJHL2FSOzu8hzKKjQ5vzKVV/h38BfQxWq1COb68qg3
	0pwLaNCSLhiBT4odrk6j3nP+nXAUNT1krcDSp+2aptND10Av1oFMhQRhHKB0xYgrbR8d
	g3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6HianJQOjGTHamqpLn7V3OL0zqyGWi4k5MnFW9wFyY0=;
	b=L2Mqz4b/76ytoe5etI8INlCZbuOLqHZHVAznDstSIRO2dPOS6QLmyQjnqvc81PknaU
	T/w08B4ASgAD8/Rs/dE4Ca9NxOF30QumLJMG8VOJy2mptwLlq8IbyGUNkcYIAld6c2KO
	jrdZ40MkwdHXBl5vVLVcalZYAFI+HrUlP+qqx91kKL7iEJkYIZx0iiX/g9a7cSnVEz4h
	KCEE4z48RPOUyal+X1wgaiVOr0wk/ezfNq6zB/o8K34rLoq1KQCeODs2DSgj1c9D0cNl
	Y+9DZfD9jc86UMdB7P9/UwaasbjcY4s0DtHOgZ1WxLc/P5lfrWs3/8dFa7mlbgpBOov5
	4SYQ==
X-Gm-Message-State: AJcUukeV7DiacXsx5J0rwPUVrKBJMoO15Pxb6KVEJrvUall3SA4OxRzr
	SdQX3OgOUtUMTEkvrknV06FRBHZs04hV3QUDpSY=
X-Google-Smtp-Source: ALg8bN5JcKGbyzKUBxbK3pF3nMNGYOpz0uZJ7g/TT7g2LbW34ilYGu3akzwMytA531p6jkqkodEAcIVJqBZMitEff6U=
X-Received: by 2002:a67:7c92:: with SMTP id x140mr1617051vsc.137.1548285102705;
	Wed, 23 Jan 2019 15:11:42 -0800 (PST)
MIME-Version: 1.0
References: <20190123200520.14956-1-raj.khem@gmail.com>
	<CAJ86T=XF3Xr0x6zEH2nsHhLQ3afEMP3Ot31pbK9-66ORrCjnsg@mail.gmail.com>
	<CAMKF1srPt+fiSotytF2jczPEoCsCP5x7U=bODNe23476CA_ABQ@mail.gmail.com>
In-Reply-To: <CAMKF1srPt+fiSotytF2jczPEoCsCP5x7U=bODNe23476CA_ABQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 23 Jan 2019 15:11:30 -0800
Message-ID: <CAJ86T=Xp_KgsZWv=oj4kEdWqAihMNASpOMc0s7nLHgcpVozWsg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] arch-arm: Do not add -march options for arm architecture
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
X-List-Received-Date: Wed, 23 Jan 2019 23:11:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 23, 2019 at 2:50 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Wed, Jan 23, 2019 at 5:27 PM Andre McCurdy <armccurdy@gmail.com> wrote:
> >
> > On Wed, Jan 23, 2019 at 12:05 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > tune files which inherit the arch definitions already define appropriate
> > > -mcpu option, which is equivalent of right -march and -mtune combination
> >
> > And what about machines which inherit an arch definition instead of a
> > cpu definition? Is that no longer supported?
>
> I could not find such a machine configuration in several BSP layers I looked at.
> Do you know of machine definitions where these files are included
> directly in machine configs ?

Using a CPU specific include but then leaving the generic DEFAULTTUNE
(ie not enabling any CPU specific TUNE_CCARGS) is equivalent, and I
guess quite common.

> if so, then we have to either use _remove or introduce a weak variable
> to set march only if
> mcpu is not set which

I think the solution is to ensure that the CPU specific tuning options
are always compatible with any architecture specific options which may
be active.

In general our CPU specific tuning files are a little sloppy (e.g.
defaulting to combinations of VFP versions and architecture levels
which never exist in the real world). If newer versions of gcc are
making those issues more apparent then why not take the opportunity to
fix them properly?

> > > and is preferred since gcc is getting stricter and stricter with option
> > > check semantics and can now find incompatible -march and -mcpu options
> > > better with every release. It does internal feature consistency check
> > > and if it finds out discrepency between what -mcpu would expand to as
> > > compared to -march it will flag the options to be incompatible, for
> > > naked eye it sounds wrong but gcc would translate -mcpu to a given
> > > -march internally and it might not match to what we set in these arch
> > > files.
> > >
> > > The effects are quite subtle, where this can result in configure test
> > > failing to compile due to these incompatible options and a feature
> > > option getting disabled for a recipe for no reason.
> > >
> > > e.g. with gcc9 which can now detect that -mcpu=cortex-a5 and
> > > -march=armv7-a are incompatible, many features in libstdc++ ends up
> > > disabled due to configure check failures e.g. size_t size, ptrdiff_t
> > > sizes, which inturn results in compiling libstdc++ with unwanted
> > > disabled features.
> >
> > It would be interesting to see more specific details of this.
>
> These are configure tests which fail when -Werror is in use and is not
> limited to libstdc++
> it can happen in any package. Since the diagnostic about incompatible
> march mcpu pair
> is a warning in general, it does not matter, but when we have -Werror
> enabled this turns
> into error, You can simply try a small helloworld example to see the effects.
>
> >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  meta/conf/machine/include/arm/arch-armv4.inc   | 1 -
> > >  meta/conf/machine/include/arm/arch-armv5.inc   | 1 -
> > >  meta/conf/machine/include/arm/arch-armv6.inc   | 1 -
> > >  meta/conf/machine/include/arm/arch-armv7a.inc  | 1 -
> > >  meta/conf/machine/include/arm/arch-armv7ve.inc | 1 -
> > >  meta/conf/machine/include/tune-iwmmxt.inc      | 2 +-
> > >  6 files changed, 1 insertion(+), 6 deletions(-)
> > >
> > > diff --git a/meta/conf/machine/include/arm/arch-armv4.inc b/meta/conf/machine/include/arm/arch-armv4.inc
> > > index 47a7ad2830..52d8ab1e8f 100644
> > > --- a/meta/conf/machine/include/arm/arch-armv4.inc
> > > +++ b/meta/conf/machine/include/arm/arch-armv4.inc
> > > @@ -2,7 +2,6 @@ DEFAULTTUNE ?= "armv4"
> > >
> > >  TUNEVALID[arm] = "Enable ARM instruction set"
> > >  TUNEVALID[armv4] = "Enable instructions for ARMv4"
> > > -TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv4', ' -march=armv4t', '', d)}"
> > >  # enable --fix-v4bx when we have armv4 in TUNE_FEATURES, but then disable it when we have also armv5 or thumb
> > >  # maybe we should extend bb.utils.contains to support check for any checkvalues in value, now it does
> > >  # checkvalues.issubset(val) which cannot be used for negative test of foo neither bar in value
> > > diff --git a/meta/conf/machine/include/arm/arch-armv5.inc b/meta/conf/machine/include/arm/arch-armv5.inc
> > > index f9068af9de..1fe1b6b8e4 100644
> > > --- a/meta/conf/machine/include/arm/arch-armv5.inc
> > > +++ b/meta/conf/machine/include/arm/arch-armv5.inc
> > > @@ -2,7 +2,6 @@ DEFAULTTUNE ?= "armv5"
> > >
> > >  TUNEVALID[armv5] = "Enable instructions for ARMv5"
> > >  TUNECONFLICTS[armv5] = "armv4"
> > > -TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv5', ' -march=armv5t${ARMPKGSFX_DSP}', '', d)}"
> > >  MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv5', 'armv5:', '' ,d)}"
> > >
> > >  require conf/machine/include/arm/arch-armv4.inc
> > > diff --git a/meta/conf/machine/include/arm/arch-armv6.inc b/meta/conf/machine/include/arm/arch-armv6.inc
> > > index 6c838e999c..adb9be8050 100644
> > > --- a/meta/conf/machine/include/arm/arch-armv6.inc
> > > +++ b/meta/conf/machine/include/arm/arch-armv6.inc
> > > @@ -2,7 +2,6 @@ DEFAULTTUNE ?= "armv6hf"
> > >
> > >  TUNEVALID[armv6] = "Enable instructions for ARMv6"
> > >  TUNECONFLICTS[armv6] = "armv4 armv5"
> > > -TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv6', ' -march=armv6', '', d)}"
> > >  MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv6', 'armv6:', '' ,d)}"
> > >
> > >  require conf/machine/include/arm/arch-armv5-dsp.inc
> > > diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/machine/include/arm/arch-armv7a.inc
> > > index a2663d8008..09d2c03a5d 100644
> > > --- a/meta/conf/machine/include/arm/arch-armv7a.inc
> > > +++ b/meta/conf/machine/include/arm/arch-armv7a.inc
> > > @@ -3,7 +3,6 @@ ARM_INSTRUCTION_SET ?= "thumb"
> > >
> > >  TUNEVALID[armv7a] = "Enable instructions for ARMv7-a"
> > >  TUNECONFLICTS[armv7a] = "armv4 armv5 armv6 armv7"
> > > -TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7a', ' -march=armv7-a', '', d)}"
> > >  MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'armv7a:', '' ,d)}"
> > >
> > >  require conf/machine/include/arm/arch-armv6.inc
> > > diff --git a/meta/conf/machine/include/arm/arch-armv7ve.inc b/meta/conf/machine/include/arm/arch-armv7ve.inc
> > > index 4d9260fecb..31e334f645 100644
> > > --- a/meta/conf/machine/include/arm/arch-armv7ve.inc
> > > +++ b/meta/conf/machine/include/arm/arch-armv7ve.inc
> > > @@ -2,7 +2,6 @@ DEFAULTTUNE ?= "armv7vethf"
> > >
> > >  TUNEVALID[armv7ve] = "Enable instructions for ARMv7ve"
> > >  TUNECONFLICTS[armv7ve] = "armv4 armv5 armv6 armv7 armv7a"
> > > -TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve', ' -march=armv7ve', '', d)}"
> > >  MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve', 'armv7ve:', '' ,d)}"
> > >
> > >  require conf/machine/include/arm/arch-armv7a.inc
> > > diff --git a/meta/conf/machine/include/tune-iwmmxt.inc b/meta/conf/machine/include/tune-iwmmxt.inc
> > > index f27423cb2e..6e577697cc 100644
> > > --- a/meta/conf/machine/include/tune-iwmmxt.inc
> > > +++ b/meta/conf/machine/include/tune-iwmmxt.inc
> > > @@ -6,7 +6,7 @@ DEFAULTTUNE ?= "iwmmxt"
> > >  require conf/machine/include/arm/arch-armv5-dsp.inc
> > >
> > >  TUNEVALID[iwmmxt] = "Enable Intel PXA27x specific processor optimizations"
> > > -TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'iwmmxt', ' -march=iwmmxt -mcpu=iwmmxt', '', d)}"
> > > +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'iwmmxt', ' -mcpu=iwmmxt', '', d)}"
> > >
> > >  AVAILTUNES += "iwmmxt"
> > >  ARMPKGARCH_tune-iwmmxt = "iwmmxt"
> > > --
> > > 2.20.1
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core

