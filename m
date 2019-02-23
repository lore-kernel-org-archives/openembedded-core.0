Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0B9227C6EC
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 20:05:06 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id p25so6402878qtb.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 12:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RFSkpB0o8yPg09xKNn5QJUJ8WA1Ne5BpjOAx4F6XiTE=;
	b=pEihTFl8LHBc0QXoI886b0M0aXbezve5zgXkERTdn3P+8gNZNxSqhf5BFXIWBYDQE4
	KNAelqC9yIP9Xump3fvguNZck8zq8ukZMrV+S1/vuBjATHzoJt9cM9LqkC0mrmgays/A
	MO26mNrdwmSa115ysS2/y3I7k2b+fM49vC51RwKz1d/V5CYLnOfmdJacEzquStXoJMnP
	GuZ2ivGe7Bpd53pwmEwoLWfHkHpz6mSOPiHJ1Jzn6EDDteVliUvh3kUZpWSDy2z56gCO
	PW3vK4eSEwIVgB7bteltX1VZqKDhPSyv5a7WPip5twg6t554MHCZ8LiHrpByiRcs00zw
	I5Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RFSkpB0o8yPg09xKNn5QJUJ8WA1Ne5BpjOAx4F6XiTE=;
	b=SjdPz85Wj6Gu33Rm2r+Z+mI/AjZCh9VMnYvlJCoPwbUKFb/+VO4uGC0OgG4GBfGttg
	PxUOtZ0PFxK1BVoW7NvTvRZfwvIqr6G24fMNaqhHovRq8GN7Ivleg3/2TiK+9GK6mZtx
	ebxEizRz3ta7HyuO+wqT0B2UrYz32DRwtHE8InlE91xhz1ZHxdATBUl191S8fkv5LKq5
	6ZIWG4q28EY6VUVEjL8PQjqv90S4Rr0ZBQXyVgrtdLNkZnsd0NRORn0N4XC8PQnrv08K
	bcYO/aJ6Si/qp8T7jCbSPNX5+HUramWz530PTK+dINTCeYGc6BS9FZvd09jDVqyGmmT+
	VTTA==
X-Gm-Message-State: AHQUAuZw9y8qV11bG25D8P3CmYnEqsMYCF+PNRPV2PcHARCGL6+ATLHL
	obsLRk4PWIom8GXR2TSlgPiQ2xufS4d2dDDf2lo=
X-Google-Smtp-Source: AHgI3IZ2fbMieLdjbFEU6iBiJPYHAilEQX26ywSBehL+z/ERNR0xIKu9XL0F3eVGcMBLezZCMLMfGZm/xorHa0A7wkY=
X-Received: by 2002:a0c:8971:: with SMTP id 46mr7964317qvq.224.1550952307498; 
	Sat, 23 Feb 2019 12:05:07 -0800 (PST)
MIME-Version: 1.0
References: <20190205025727.1937-1-raj.khem@gmail.com>
	<20190223193731.hccdkg3vych4y6jr@mcrowe.com>
In-Reply-To: <20190223193731.hccdkg3vych4y6jr@mcrowe.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 23 Feb 2019 12:04:41 -0800
Message-ID: <CAMKF1sqYyaME_X6VcV_obkKLfEgP30Vw1EM0xeuuMPuAfYmzjQ@mail.gmail.com>
To: Mike Crowe <mac@mcrowe.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/6] arch-armv8a.inc: add tune include for armv8
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
X-List-Received-Date: Sat, 23 Feb 2019 20:05:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 23, 2019 at 11:37 AM Mike Crowe <mac@mcrowe.com> wrote:
>
> On Monday 04 February 2019 at 18:57:22 -0800, Khem Raj wrote:
> > From: ayaka <ayaka@soulik.info>
> >
> > There are some addtional instructions apart from bare armv8,
> > also there is armv8.1, armv8.2.
> >
> > Most the processor would support crc, except X-gene 1.
> >
> > Signed-off-by: Randy Li <ayaka@soulik.info>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/conf/machine/include/arm/arch-armv8.inc  |  1 -
> >  meta/conf/machine/include/arm/arch-armv8a.inc | 28 +++++++++++++++++++
> >  2 files changed, 28 insertions(+), 1 deletion(-)
> >  delete mode 100644 meta/conf/machine/include/arm/arch-armv8.inc
> >  create mode 100644 meta/conf/machine/include/arm/arch-armv8a.inc
> >
> > diff --git a/meta/conf/machine/include/arm/arch-armv8.inc b/meta/conf/machine/include/arm/arch-armv8.inc
> > deleted file mode 100644
> > index 5e832fae6d..0000000000
> > --- a/meta/conf/machine/include/arm/arch-armv8.inc
> > +++ /dev/null
> > @@ -1 +0,0 @@
> > -require conf/machine/include/arm/arch-arm64.inc
> > diff --git a/meta/conf/machine/include/arm/arch-armv8a.inc b/meta/conf/machine/include/arm/arch-armv8a.inc
> > new file mode 100644
> > index 0000000000..323d0d7f0f
> > --- /dev/null
> > +++ b/meta/conf/machine/include/arm/arch-armv8a.inc
> > @@ -0,0 +1,28 @@
> > +DEFAULTTUNE ?= "armv8a-crc"
> > +
> > +TUNEVALID[armv8a] = "Enable instructions for ARMv8-a"
> > +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8a', ' -march=armv8-a', '', d)}"
> > +TUNEVALID[simd] = "Enable instructions for ARMv8-a Advanced SIMD and floating-point"
> > +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'simd', '+simd', '', d)}"
> > +TUNEVALID[crc] = "Enable instructions for ARMv8-a Cyclic Redundancy Check (CRC)"
> > +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'crc', '+crc', '', d)}"
> > +TUNEVALID[crypto] = "Enable instructions for ARMv8-a cryptographic"
> > +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'crypto', '+crypto', '', d)}"
> > +MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8a', 'armv8a:', '' ,d)}"
> > +
> > +require conf/machine/include/arm/arch-arm64.inc
> > +
> > +# Little Endian base configs
> > +AVAILTUNES += "armv8a armv8a-crc armv8a-crc-crypto armv8a-crypto"
> > +ARMPKGARCH_tune-armv8a                    ?= "armv8a"
> > +ARMPKGARCH_tune-armv8a-crc                ?= "armv8a"
> > +ARMPKGARCH_tune-armv8a-crypto             ?= "armv8a"
> > +ARMPKGARCH_tune-armv8a-crc-crypto         ?= "armv8a"
> > +TUNE_FEATURES_tune-armv8a                  = "aarch64 armv8a simd"
> > +TUNE_FEATURES_tune-armv8a-crc              = "${TUNE_FEATURES_tune-armv8a} crc"
> > +TUNE_FEATURES_tune-armv8a-crypto           = "${TUNE_FEATURES_tune-armv8a} crypto"
> > +TUNE_FEATURES_tune-armv8a-crc-crypto       = "${TUNE_FEATURES_tune-armv8a-crc} crypto"
> > +PACKAGE_EXTRA_ARCHS_tune-armv8a            = "aarch64 armv8a simd"
> > +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc        = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} crc"
> > +PACKAGE_EXTRA_ARCHS_tune-armv8a-crypto     = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} crypto"
> > +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} crypto"
> > --
> > 2.20.1
>
> I believe that this change, along with
> 6719de403620dded075dc74f2976669d95bffd7a, may have broken multilib for
> AArch64. :(
>
> When I enable multilib in local.conf with:
>
>  require conf/multilib.conf
>  MULTILIBS = "multilib:lib32"
>  DEFAULTTUNE_virtclass-multilib-lib32 = "armv7at-neon"
>
> then both the primary target and lib32- packages end up installing stuff
> into /usr/lib (and would presumably conflict, if I got as far as installing
> them.)
>
> If I revert 6719de403620dded075dc74f2976669d95bffd7a and
> d1db78b0e284e1a1f370e71183ded0cbdc1475db then the primary target packages
> end up installing stuff in /usr/lib64 as would be expected.
>
> This appears to be because baselib = "lib" rather than "lib64". That in
> turn may be because BASE_LIB_tune-armv8a-crc does not exist.
>
> If I apply this patch:
>
> diff --git a/meta/conf/machine/include/arm/arch-armv8a.inc b/meta/conf/machine/include/arm/arch-armv8a.inc
> index 323d0d7f0f..649deca61b 100644
> --- a/meta/conf/machine/include/arm/arch-armv8a.inc
> +++ b/meta/conf/machine/include/arm/arch-armv8a.inc
> @@ -26,3 +26,4 @@ PACKAGE_EXTRA_ARCHS_tune-armv8a            = "aarch64 armv8a simd"
>  PACKAGE_EXTRA_ARCHS_tune-armv8a-crc        = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} crc"
>  PACKAGE_EXTRA_ARCHS_tune-armv8a-crypto     = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} crypto"
>  PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} crypto"
> +BASE_LIB_tune-armv8a-crc = "lib64"
>
> then multilib behaves as it did before. Is this the correct fix?

it is in right direction, while you are at it also add it for other armv8 tunes

BASE_LIB_tune-armv8a                    = "lib64"
BASE_LIB_tune-armv8a-crc                = "lib64"
BASE_LIB_tune-armv8a-crypto             = "lib64"
BASE_LIB_tune-armv8a-crc-crypto         = "lib64"

>
> Thanks.
>
> Mike.

