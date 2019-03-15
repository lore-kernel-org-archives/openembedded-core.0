Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id B1B937C6AB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Mar 2019 05:10:15 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id z17so8803450qtn.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Mar 2019 22:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=IAJMzfVs7EneST+oTMbcVfc/ZZYEghQtpQOM0KnHRA8=;
	b=YCs/WS+szMbuZ3oDFTWkxb2f7htN6beeq5tAVb6130z6kycKlvJ9o3WgdqIXLKXc0E
	3ExxSaa2XXwDyFPMFtpp5kaY37fINUc+8ESx+3p8uW2+1L0EeSZlsFXpJJwP1UQCsE+3
	xO/JYG/+GNKTr4SiwWUMU/BIIfb4JvaGaEZg1Eosyn/tBwjJIIhNiB/qRydDtyr6kkyD
	qYI8bXCDwd9869FdZXqXUxG7G4SSMoJDB98CBqJzMVVUAos7aY9kgeLsd6bVIIyCn+TN
	XsfaamQgH1wfQ1xnV7pcCf/o8HnYT2X/+V/S2NmSS5K/Tn7kVc7gwL4FtvihXCXsaBAX
	4d8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IAJMzfVs7EneST+oTMbcVfc/ZZYEghQtpQOM0KnHRA8=;
	b=III9XpXbl4ORIdl3rMMaVmd5kLmdRAc4QGu7bdNy5XU/lO2iRlPCNMC8XGDFziMayY
	TqCnq2YqRtvUBEcm+7G/5zGvv7hkWF+wAr4EWQEKvpJvf0QHJxwOx/7AXDjLEcDjARAe
	S+7VQbefgBkHgop+69/HqVYlrIWOzUlWUhOl51Oj/vwD/ANlPR893QW07rJZoS3TSIS2
	FcpJMzOBOjDa0dx98XvgGFQT2njtlS3WbpnU+OMdoxsV0K7gQDlWWnFJv8ll+drhEdjI
	odQj/7qtVbx10eX2WK401suYPyYREF5vLR5jV+Rk9bUnKhKLEAt0tSEnm6eSidPR6Ta9
	YRCQ==
X-Gm-Message-State: APjAAAXA7uY+i9xgfxtow5zPbU4HUA07lWkPEZgJhQHQxmEDhhpGsthO
	AEphSoc7QplrVV27XEQFx2i/rYgpF4QD2/YNPQ+YgRL3
X-Google-Smtp-Source: APXvYqyzjN90u0fSOa2xFAH0x0yyl+5Fd8woDNH1Y6vIihE8xAiUsQ6Aj4cuDEQlrYh4wiEvJpyEL0cS1IOq/X8XfEU=
X-Received: by 2002:aed:2268:: with SMTP id o37mr1349197qtc.29.1552626616230; 
	Thu, 14 Mar 2019 22:10:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190314150403.4332-1-pkj@axis.com>
In-Reply-To: <20190314150403.4332-1-pkj@axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Mar 2019 22:09:50 -0700
Message-ID: <CAMKF1sp3gpOShnEOmK2SCmAgd8MHFLLFf49FwbUrEnFh4LoK3g@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv4 1/2] Revert "arm-tunes: Remove -march option if mcpu is already added"
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
X-List-Received-Date: Fri, 15 Mar 2019 05:10:16 -0000
Content-Type: text/plain; charset="UTF-8"

I have sent an alternative, please see if that works for you. I think
that could be simpler

On Thu, Mar 14, 2019 at 8:04 AM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> This reverts commit ac83d22eb5031f7fdd09d34a1a46d92fd3e39a3c.
>
> This solution had unforeseen side effects, which, e.g., lead to the
> following sanity error if trying to build with the arm926ejs default
> tune:
>
>     Error, the PACKAGE_ARCHS variable (all any noarch arm armv4 armv4t
>     armv5 armv5t armv5e armv5te arm926ejste arm926ejse <BSP name
>     withheld>) for DEFAULTTUNE (arm926ejs) does not contain
>     TUNE_PKGARCH (arm926ejst).
>
> An alternative solution will follow, which only affects the -mcpu and
> -march options without other side effects.
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/conf/machine/include/tune-arm1136jf-s.inc   |  4 +---
>  meta/conf/machine/include/tune-arm920t.inc       |  4 +---
>  meta/conf/machine/include/tune-arm926ejs.inc     |  4 +---
>  meta/conf/machine/include/tune-arm9tdmi.inc      |  4 +---
>  meta/conf/machine/include/tune-cortexa15.inc     | 27 ++++++++++-------------
>  meta/conf/machine/include/tune-cortexa17.inc     | 27 ++++++++++-------------
>  meta/conf/machine/include/tune-cortexa5.inc      | 27 ++++++++++-------------
>  meta/conf/machine/include/tune-cortexa7.inc      | 27 ++++++++++-------------
>  meta/conf/machine/include/tune-cortexa8.inc      | 19 +++++++---------
>  meta/conf/machine/include/tune-cortexa9.inc      | 28 ++++++++++--------------
>  meta/conf/machine/include/tune-ep9312.inc        |  1 -
>  meta/conf/machine/include/tune-iwmmxt.inc        |  3 +--
>  meta/conf/machine/include/tune-strongarm1100.inc |  3 +--
>  meta/conf/machine/include/tune-xscale.inc        |  7 ++----
>  14 files changed, 76 insertions(+), 109 deletions(-)
>
> diff --git a/meta/conf/machine/include/tune-arm1136jf-s.inc b/meta/conf/machine/include/tune-arm1136jf-s.inc
> index d883eba7c9..c5de63e1cc 100644
> --- a/meta/conf/machine/include/tune-arm1136jf-s.inc
> +++ b/meta/conf/machine/include/tune-arm1136jf-s.inc
> @@ -4,10 +4,8 @@ require conf/machine/include/arm/arch-armv6.inc
>
>  TUNEVALID[arm1136jfs] = "Enable arm1136jfs specific processor optimizations"
>  TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'arm1136jfs', ' -mcpu=arm1136jf-s', '', d)}"
> -MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'arm1136jfs', 'armv6:', '' ,d)}"
>
>  AVAILTUNES += "arm1136jfs"
>  ARMPKGARCH_tune-arm1136jfs = "arm1136jfs"
> -# mcpu is used so don't use armv6 as we don't want march
> -TUNE_FEATURES_tune-arm1136jfs = "arm arm1136jfs"
> +TUNE_FEATURES_tune-arm1136jfs = "${TUNE_FEATURES_tune-armv6} arm1136jfs"
>  PACKAGE_EXTRA_ARCHS_tune-arm1136jfs = "${PACKAGE_EXTRA_ARCHS_tune-armv6} arm1136jfs-vfp"
> diff --git a/meta/conf/machine/include/tune-arm920t.inc b/meta/conf/machine/include/tune-arm920t.inc
> index 42e8ed2b51..c6e74b6772 100644
> --- a/meta/conf/machine/include/tune-arm920t.inc
> +++ b/meta/conf/machine/include/tune-arm920t.inc
> @@ -4,10 +4,8 @@ require conf/machine/include/arm/arch-armv4.inc
>
>  TUNEVALID[arm920t] = "Enable arm920t specific processor optimizations"
>  TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'arm920t', ' -mcpu=arm920t', '', d)}"
> -MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'arm920t', 'armv4:', '' ,d)}"
>
>  AVAILTUNES += "arm920t"
>  ARMPKGARCH_tune-arm920t = "arm920t"
> -# mcpu is used so don't use armv4t as we don't want march
> -TUNE_FEATURES_tune-arm920t = "arm thumb arm920t"
> +TUNE_FEATURES_tune-arm920t = "${TUNE_FEATURES_tune-armv4t} arm920t"
>  PACKAGE_EXTRA_ARCHS_tune-arm920t = "${PACKAGE_EXTRA_ARCHS_tune-armv4t} arm920t arm920tt"
> diff --git a/meta/conf/machine/include/tune-arm926ejs.inc b/meta/conf/machine/include/tune-arm926ejs.inc
> index 563d53bc4e..81bcda339b 100644
> --- a/meta/conf/machine/include/tune-arm926ejs.inc
> +++ b/meta/conf/machine/include/tune-arm926ejs.inc
> @@ -4,10 +4,8 @@ require conf/machine/include/arm/arch-armv5-dsp.inc
>
>  TUNEVALID[arm926ejs] = "Enable arm926ejs specific processor optimizations"
>  TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'arm926ejs', ' -mcpu=arm926ej-s', '', d)}"
> -MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'arm926ejs', 'armv5:', '' ,d)}"
>
>  AVAILTUNES += "arm926ejs"
>  ARMPKGARCH_tune-arm926ejs = "arm926ejs"
> -# mcpu is used so don't use armv5te as we don't want march
> -TUNE_FEATURES_tune-arm926ejs = "arm thumb dsp arm926ejs"
> +TUNE_FEATURES_tune-arm926ejs = "${TUNE_FEATURES_tune-armv5te} arm926ejs"
>  PACKAGE_EXTRA_ARCHS_tune-arm926ejs = "${PACKAGE_EXTRA_ARCHS_tune-armv5te} arm926ejste arm926ejse"
> diff --git a/meta/conf/machine/include/tune-arm9tdmi.inc b/meta/conf/machine/include/tune-arm9tdmi.inc
> index e03a8b86a0..e9c2b8fcf5 100644
> --- a/meta/conf/machine/include/tune-arm9tdmi.inc
> +++ b/meta/conf/machine/include/tune-arm9tdmi.inc
> @@ -4,10 +4,8 @@ require conf/machine/include/arm/arch-armv4.inc
>
>  TUNEVALID[arm9tdmi] = "Enable arm9tdmi specific processor optimizations"
>  TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'arm9tdmi', ' -mcpu=arm9tdmi', '', d)}"
> -MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'arm9tdmi', 'armv4:', '' ,d)}"
>
>  AVAILTUNES += "arm9tdmi"
>  ARMPKGARCH_tune-arm9tdmi = "arm9tdmi"
> -# mcpu is used so don't use armv4t as we don't want march
> -TUNE_FEATURES_tune-arm9tdmi = "arm thumb arm9tdmi"
> +TUNE_FEATURES_tune-arm9tdmi = "${TUNE_FEATURES_tune-armv4t} arm9tdmi"
>  PACKAGE_EXTRA_ARCHS_tune-arm9tdmi = "${PACKAGE_EXTRA_ARCHS_tune-armv4t} arm9tdmit"
> diff --git a/meta/conf/machine/include/tune-cortexa15.inc b/meta/conf/machine/include/tune-cortexa15.inc
> index d53403af35..25e99f93d7 100644
> --- a/meta/conf/machine/include/tune-cortexa15.inc
> +++ b/meta/conf/machine/include/tune-cortexa15.inc
> @@ -4,7 +4,6 @@ require conf/machine/include/arm/arch-armv7ve.inc
>
>  TUNEVALID[cortexa15] = "Enable Cortex-A15 specific processor optimizations"
>  TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa15', ' -mcpu=cortex-a15', '', d)}"
> -MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'cortexa15', 'armv7ve:', '' ,d)}"
>
>  # Little Endian base configs
>  AVAILTUNES += "cortexa15 cortexa15t cortexa15-neon cortexa15t-neon cortexa15-neon-vfpv4 cortexa15t-neon-vfpv4"
> @@ -14,13 +13,12 @@ ARMPKGARCH_tune-cortexa15-neon        = "cortexa15"
>  ARMPKGARCH_tune-cortexa15t-neon       = "cortexa15"
>  ARMPKGARCH_tune-cortexa15-neon-vfpv4  = "cortexa15"
>  ARMPKGARCH_tune-cortexa15t-neon-vfpv4 = "cortexa15"
> -# mcpu is used so don't use armv7ve as we don't want march
> -TUNE_FEATURES_tune-cortexa15             = "arm vfp cortexa15"
> -TUNE_FEATURES_tune-cortexa15t            = "${TUNE_FEATURES_tune-cortexa15} thumb"
> -TUNE_FEATURES_tune-cortexa15-neon        = "${TUNE_FEATURES_tune-cortexa15} neon"
> -TUNE_FEATURES_tune-cortexa15t-neon       = "${TUNE_FEATURES_tune-cortexa15-neon} thumb"
> -TUNE_FEATURES_tune-cortexa15-neon-vfpv4  = "${TUNE_FEATURES_tune-cortexa15-neon} vfpv4"
> -TUNE_FEATURES_tune-cortexa15t-neon-vfpv4 = "${TUNE_FEATURES_tune-cortexa15-neon-vfpv4} thumb"
> +TUNE_FEATURES_tune-cortexa15             = "${TUNE_FEATURES_tune-armv7ve} cortexa15"
> +TUNE_FEATURES_tune-cortexa15t            = "${TUNE_FEATURES_tune-armv7vet} cortexa15"
> +TUNE_FEATURES_tune-cortexa15-neon        = "${TUNE_FEATURES_tune-armv7ve-neon} cortexa15"
> +TUNE_FEATURES_tune-cortexa15t-neon       = "${TUNE_FEATURES_tune-armv7vet-neon} cortexa15"
> +TUNE_FEATURES_tune-cortexa15-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7ve-neon-vfpv4} cortexa15"
> +TUNE_FEATURES_tune-cortexa15t-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7vet-neon-vfpv4} cortexa15"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa15             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve} cortexa15-vfp"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa15t            = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet} cortexa15-vfp cortexa15t2-vfp"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon} cortexa15-vfp cortexa15-neon"
> @@ -36,13 +34,12 @@ ARMPKGARCH_tune-cortexa15hf-neon        = "cortexa15"
>  ARMPKGARCH_tune-cortexa15thf-neon       = "cortexa15"
>  ARMPKGARCH_tune-cortexa15hf-neon-vfpv4  = "cortexa15"
>  ARMPKGARCH_tune-cortexa15thf-neon-vfpv4 = "cortexa15"
> -# mcpu is used so don't use armv7ve as we don't want march
> -TUNE_FEATURES_tune-cortexa15hf             = "${TUNE_FEATURES_tune-cortexa15} callconvention-hard"
> -TUNE_FEATURES_tune-cortexa15thf            = "${TUNE_FEATURES_tune-cortexa15t} callconvention-hard"
> -TUNE_FEATURES_tune-cortexa15hf-neon        = "${TUNE_FEATURES_tune-cortexa15-neon} callconvention-hard"
> -TUNE_FEATURES_tune-cortexa15thf-neon       = "${TUNE_FEATURES_tune-cortexa15t-neon} callconvention-hard"
> -TUNE_FEATURES_tune-cortexa15hf-neon-vfpv4  = "${TUNE_FEATURES_tune-cortexa15-neon-vfpv4} callconvention-hard"
> -TUNE_FEATURES_tune-cortexa15thf-neon-vfpv4 = "${TUNE_FEATURES_tune-cortexa15t-neon-vfpv4} callconvention-hard"
> +TUNE_FEATURES_tune-cortexa15hf             = "${TUNE_FEATURES_tune-armv7vehf} cortexa15"
> +TUNE_FEATURES_tune-cortexa15thf            = "${TUNE_FEATURES_tune-armv7vethf} cortexa15"
> +TUNE_FEATURES_tune-cortexa15hf-neon        = "${TUNE_FEATURES_tune-armv7vehf-neon} cortexa15"
> +TUNE_FEATURES_tune-cortexa15thf-neon       = "${TUNE_FEATURES_tune-armv7vethf-neon} cortexa15"
> +TUNE_FEATURES_tune-cortexa15hf-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7vehf-neon-vfpv4} cortexa15"
> +TUNE_FEATURES_tune-cortexa15thf-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7vethf-neon-vfpv4} cortexa15"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa15hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf} cortexa15hf-vfp"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa15thf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf} cortexa15hf-vfp cortexa15t2hf-vfp"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon} cortexa15hf-vfp cortexa15hf-neon"
> diff --git a/meta/conf/machine/include/tune-cortexa17.inc b/meta/conf/machine/include/tune-cortexa17.inc
> index 3ffc02bf9f..40392f9bcc 100644
> --- a/meta/conf/machine/include/tune-cortexa17.inc
> +++ b/meta/conf/machine/include/tune-cortexa17.inc
> @@ -4,7 +4,6 @@ require conf/machine/include/arm/arch-armv7ve.inc
>
>  TUNEVALID[cortexa17] = "Enable Cortex-A17 specific processor optimizations"
>  TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa17', ' -mcpu=cortex-a17', '', d)}"
> -MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'cortexa17', 'armv7ve:', '' ,d)}"
>
>  # Little Endian base configs
>  AVAILTUNES += "cortexa17 cortexa17t cortexa17-neon cortexa17t-neon cortexa17-neon-vfpv4 cortexa17t-neon-vfpv4"
> @@ -14,13 +13,12 @@ ARMPKGARCH_tune-cortexa17-neon        = "cortexa17"
>  ARMPKGARCH_tune-cortexa17t-neon       = "cortexa17"
>  ARMPKGARCH_tune-cortexa17-neon-vfpv4  = "cortexa17"
>  ARMPKGARCH_tune-cortexa17t-neon-vfpv4 = "cortexa17"
> -# mcpu is used so don't use armv7ve as we don't want march
> -TUNE_FEATURES_tune-cortexa17             = "arm vfp cortexa17"
> -TUNE_FEATURES_tune-cortexa17t            = "${TUNE_FEATURES_tune-cortexa17} thumb"
> -TUNE_FEATURES_tune-cortexa17-neon        = "${TUNE_FEATURES_tune-cortexa17} neon"
> -TUNE_FEATURES_tune-cortexa17t-neon       = "${TUNE_FEATURES_tune-cortexa17-neon} thumb"
> -TUNE_FEATURES_tune-cortexa17-neon-vfpv4  = "${TUNE_FEATURES_tune-cortexa17-neon} vfpv4"
> -TUNE_FEATURES_tune-cortexa17t-neon-vfpv4 = "${TUNE_FEATURES_tune-cortexa17-neon-vfpv4} thumb"
> +TUNE_FEATURES_tune-cortexa17             = "${TUNE_FEATURES_tune-armv7ve} cortexa17"
> +TUNE_FEATURES_tune-cortexa17t            = "${TUNE_FEATURES_tune-armv7vet} cortexa17"
> +TUNE_FEATURES_tune-cortexa17-neon        = "${TUNE_FEATURES_tune-armv7ve-neon} cortexa17"
> +TUNE_FEATURES_tune-cortexa17t-neon       = "${TUNE_FEATURES_tune-armv7vet-neon} cortexa17"
> +TUNE_FEATURES_tune-cortexa17-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7ve-neon-vfpv4} cortexa17"
> +TUNE_FEATURES_tune-cortexa17t-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7vet-neon-vfpv4} cortexa17"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa17             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve} cortexa17-vfp"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa17t            = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet} cortexa17-vfp cortexa17t2-vfp"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa17-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon} cortexa17-vfp cortexa17-neon"
> @@ -36,13 +34,12 @@ ARMPKGARCH_tune-cortexa17hf-neon        = "cortexa17"
>  ARMPKGARCH_tune-cortexa17thf-neon       = "cortexa17"
>  ARMPKGARCH_tune-cortexa17hf-neon-vfpv4  = "cortexa17"
>  ARMPKGARCH_tune-cortexa17thf-neon-vfpv4 = "cortexa17"
> -# mcpu is used so don't use armv7ve as we don't want march
> -TUNE_FEATURES_tune-cortexa17hf             = "${TUNE_FEATURES_tune-cortexa17} callconvention-hard"
> -TUNE_FEATURES_tune-cortexa17thf            = "${TUNE_FEATURES_tune-cortexa17t} callconvention-hard"
> -TUNE_FEATURES_tune-cortexa17hf-neon        = "${TUNE_FEATURES_tune-cortexa17-neon} callconvention-hard"
> -TUNE_FEATURES_tune-cortexa17thf-neon       = "${TUNE_FEATURES_tune-cortexa17t-neon} callconvention-hard"
> -TUNE_FEATURES_tune-cortexa17hf-neon-vfpv4  = "${TUNE_FEATURES_tune-cortexa17-neon-vfpv4} callconvention-hard"
> -TUNE_FEATURES_tune-cortexa17thf-neon-vfpv4 = "${TUNE_FEATURES_tune-cortexa17t-neon-vfpv4} callconvention-hard"
> +TUNE_FEATURES_tune-cortexa17hf             = "${TUNE_FEATURES_tune-armv7vehf} cortexa17"
> +TUNE_FEATURES_tune-cortexa17thf            = "${TUNE_FEATURES_tune-armv7vethf} cortexa17"
> +TUNE_FEATURES_tune-cortexa17hf-neon        = "${TUNE_FEATURES_tune-armv7vehf-neon} cortexa17"
> +TUNE_FEATURES_tune-cortexa17thf-neon       = "${TUNE_FEATURES_tune-armv7vethf-neon} cortexa17"
> +TUNE_FEATURES_tune-cortexa17hf-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7vehf-neon-vfpv4} cortexa17"
> +TUNE_FEATURES_tune-cortexa17thf-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7vethf-neon-vfpv4} cortexa17"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa17hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf} cortexa17hf-vfp"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa17thf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf} cortexa17hf-vfp cortexa17t2hf-vfp"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa17hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon} cortexa17hf-vfp cortexa17hf-neon"
> diff --git a/meta/conf/machine/include/tune-cortexa5.inc b/meta/conf/machine/include/tune-cortexa5.inc
> index 496739e454..e9eddb407f 100644
> --- a/meta/conf/machine/include/tune-cortexa5.inc
> +++ b/meta/conf/machine/include/tune-cortexa5.inc
> @@ -4,7 +4,6 @@ require conf/machine/include/arm/arch-armv7a.inc
>
>  TUNEVALID[cortexa5] = "Enable Cortex-A5 specific processor optimizations"
>  TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa5', ' -mcpu=cortex-a5', '', d)}"
> -MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'cortexa5', 'armv7a:', '' ,d)}"
>
>  # Little Endian base configs
>  AVAILTUNES += "cortexa5 cortexa5t cortexa5-neon cortexa5t-neon cortexa5-neon-vfpv4 cortexa5t-neon-vfpv4"
> @@ -14,13 +13,12 @@ ARMPKGARCH_tune-cortexa5-neon        = "cortexa5"
>  ARMPKGARCH_tune-cortexa5t-neon       = "cortexa5"
>  ARMPKGARCH_tune-cortexa5-neon-vfpv4  = "cortexa5"
>  ARMPKGARCH_tune-cortexa5t-neon-vfpv4 = "cortexa5"
> -# mcpu is used so don't use armv7a as we don't want march
> -TUNE_FEATURES_tune-cortexa5             = "arm vfp cortexa5"
> -TUNE_FEATURES_tune-cortexa5t            = "${TUNE_FEATURES_tune-cortexa5} thumb"
> -TUNE_FEATURES_tune-cortexa5-neon        = "${TUNE_FEATURES_tune-cortexa5} neon"
> -TUNE_FEATURES_tune-cortexa5t-neon       = "${TUNE_FEATURES_tune-cortexa5-neon} thumb"
> -TUNE_FEATURES_tune-cortexa5-neon-vfpv4  = "${TUNE_FEATURES_tune-cortexa5-neon} vfpv4"
> -TUNE_FEATURES_tune-cortexa5t-neon-vfpv4 = "${TUNE_FEATURES_tune-cortexa5-neon-vfpv4} thumb"
> +TUNE_FEATURES_tune-cortexa5             = "${TUNE_FEATURES_tune-armv7a} cortexa5"
> +TUNE_FEATURES_tune-cortexa5t            = "${TUNE_FEATURES_tune-armv7at} cortexa5"
> +TUNE_FEATURES_tune-cortexa5-neon        = "${TUNE_FEATURES_tune-armv7a-neon} cortexa5"
> +TUNE_FEATURES_tune-cortexa5t-neon       = "${TUNE_FEATURES_tune-armv7at-neon} cortexa5"
> +TUNE_FEATURES_tune-cortexa5-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7a-neon-vfpv4} cortexa5"
> +TUNE_FEATURES_tune-cortexa5t-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7at-neon-vfpv4} cortexa5"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa5             = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortexa5-vfp"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa5t            = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa5-vfp cortexa5t2-vfp"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa5-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortexa5-vfp cortexa5-neon"
> @@ -36,13 +34,12 @@ ARMPKGARCH_tune-cortexa5hf-neon        = "cortexa5"
>  ARMPKGARCH_tune-cortexa5thf-neon       = "cortexa5"
>  ARMPKGARCH_tune-cortexa5hf-neon-vfpv4  = "cortexa5"
>  ARMPKGARCH_tune-cortexa5thf-neon-vfpv4 = "cortexa5"
> -# mcpu is used so don't use armv7a as we don't want march
> -TUNE_FEATURES_tune-cortexa5hf             = "${TUNE_FEATURES_tune-cortexa5} callconvention-hard"
> -TUNE_FEATURES_tune-cortexa5thf            = "${TUNE_FEATURES_tune-cortexa5t} callconvention-hard"
> -TUNE_FEATURES_tune-cortexa5hf-neon        = "${TUNE_FEATURES_tune-cortexa5-neon} callconvention-hard"
> -TUNE_FEATURES_tune-cortexa5thf-neon       = "${TUNE_FEATURES_tune-cortexa5t-neon} callconvention-hard"
> -TUNE_FEATURES_tune-cortexa5hf-neon-vfpv4  = "${TUNE_FEATURES_tune-cortexa5-neon-vfpv4} callconvention-hard"
> -TUNE_FEATURES_tune-cortexa5thf-neon-vfpv4 = "${TUNE_FEATURES_tune-cortexa5t-neon-vfpv4} callconvention-hard"
> +TUNE_FEATURES_tune-cortexa5hf             = "${TUNE_FEATURES_tune-armv7ahf} cortexa5"
> +TUNE_FEATURES_tune-cortexa5thf            = "${TUNE_FEATURES_tune-armv7athf} cortexa5"
> +TUNE_FEATURES_tune-cortexa5hf-neon        = "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa5"
> +TUNE_FEATURES_tune-cortexa5thf-neon       = "${TUNE_FEATURES_tune-armv7athf-neon} cortexa5"
> +TUNE_FEATURES_tune-cortexa5hf-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7ahf-neon-vfpv4} cortexa5"
> +TUNE_FEATURES_tune-cortexa5thf-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7athf-neon-vfpv4} cortexa5"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa5hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} cortexa5hf-vfp"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa5thf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa5hf-vfp cortexa5t2hf-vfp"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa5hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} cortexa5hf-vfp cortexa5hf-neon"
> diff --git a/meta/conf/machine/include/tune-cortexa7.inc b/meta/conf/machine/include/tune-cortexa7.inc
> index 34a77b4788..52415d9c8b 100644
> --- a/meta/conf/machine/include/tune-cortexa7.inc
> +++ b/meta/conf/machine/include/tune-cortexa7.inc
> @@ -4,7 +4,6 @@ require conf/machine/include/arm/arch-armv7ve.inc
>
>  TUNEVALID[cortexa7] = "Enable Cortex-A7 specific processor optimizations"
>  TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa7', ' -mcpu=cortex-a7', '', d)}"
> -MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'cortexa7', 'armv7ve:', '' ,d)}"
>
>  # Little Endian base configs
>  AVAILTUNES += "cortexa7 cortexa7t cortexa7-neon cortexa7t-neon cortexa7-neon-vfpv4 cortexa7t-neon-vfpv4"
> @@ -14,13 +13,12 @@ ARMPKGARCH_tune-cortexa7-neon        = "cortexa7"
>  ARMPKGARCH_tune-cortexa7t-neon       = "cortexa7"
>  ARMPKGARCH_tune-cortexa7-neon-vfpv4  = "cortexa7"
>  ARMPKGARCH_tune-cortexa7t-neon-vfpv4 = "cortexa7"
> -# mcpu is used so don't use armv7ve as we don't want march
> -TUNE_FEATURES_tune-cortexa7             = "arm vfp cortexa7"
> -TUNE_FEATURES_tune-cortexa7t            = "${TUNE_FEATURES_tune-cortexa7} thumb"
> -TUNE_FEATURES_tune-cortexa7-neon        = "${TUNE_FEATURES_tune-cortexa7} neon"
> -TUNE_FEATURES_tune-cortexa7t-neon       = "${TUNE_FEATURES_tune-cortexa7-neon} thumb"
> -TUNE_FEATURES_tune-cortexa7-neon-vfpv4  = "${TUNE_FEATURES_tune-cortexa7-neon} vfpv4"
> -TUNE_FEATURES_tune-cortexa7t-neon-vfpv4 = "${TUNE_FEATURES_tune-cortexa7-neon-vfpv4} thumb"
> +TUNE_FEATURES_tune-cortexa7             = "${TUNE_FEATURES_tune-armv7ve} cortexa7"
> +TUNE_FEATURES_tune-cortexa7t            = "${TUNE_FEATURES_tune-armv7vet} cortexa7"
> +TUNE_FEATURES_tune-cortexa7-neon        = "${TUNE_FEATURES_tune-armv7ve-neon} cortexa7"
> +TUNE_FEATURES_tune-cortexa7t-neon       = "${TUNE_FEATURES_tune-armv7vet-neon} cortexa7"
> +TUNE_FEATURES_tune-cortexa7-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7ve-neon-vfpv4} cortexa7"
> +TUNE_FEATURES_tune-cortexa7t-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7vet-neon-vfpv4} cortexa7"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa7             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve} cortexa7-vfp"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa7t            = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet} cortexa7-vfp cortexa7t2-vfp"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa7-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon} cortexa7-vfp cortexa7-neon"
> @@ -36,13 +34,12 @@ ARMPKGARCH_tune-cortexa7hf-neon        = "cortexa7"
>  ARMPKGARCH_tune-cortexa7thf-neon       = "cortexa7"
>  ARMPKGARCH_tune-cortexa7hf-neon-vfpv4  = "cortexa7"
>  ARMPKGARCH_tune-cortexa7thf-neon-vfpv4 = "cortexa7"
> -# mcpu is used so don't use armv7ve as we don't want march
> -TUNE_FEATURES_tune-cortexa7hf             = "${TUNE_FEATURES_tune-cortexa7} callconvention-hard"
> -TUNE_FEATURES_tune-cortexa7thf            = "${TUNE_FEATURES_tune-cortexa7t} callconvention-hard"
> -TUNE_FEATURES_tune-cortexa7hf-neon        = "${TUNE_FEATURES_tune-cortexa7-neon} callconvention-hard"
> -TUNE_FEATURES_tune-cortexa7thf-neon       = "${TUNE_FEATURES_tune-cortexa7t-neon} callconvention-hard"
> -TUNE_FEATURES_tune-cortexa7hf-neon-vfpv4  = "${TUNE_FEATURES_tune-cortexa7-neon-vfpv4} callconvention-hard"
> -TUNE_FEATURES_tune-cortexa7thf-neon-vfpv4 = "${TUNE_FEATURES_tune-cortexa7t-neon-vfpv4} callconvention-hard"
> +TUNE_FEATURES_tune-cortexa7hf             = "${TUNE_FEATURES_tune-armv7vehf} cortexa7"
> +TUNE_FEATURES_tune-cortexa7thf            = "${TUNE_FEATURES_tune-armv7vethf} cortexa7"
> +TUNE_FEATURES_tune-cortexa7hf-neon        = "${TUNE_FEATURES_tune-armv7vehf-neon} cortexa7"
> +TUNE_FEATURES_tune-cortexa7thf-neon       = "${TUNE_FEATURES_tune-armv7vethf-neon} cortexa7"
> +TUNE_FEATURES_tune-cortexa7hf-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7vehf-neon-vfpv4} cortexa7"
> +TUNE_FEATURES_tune-cortexa7thf-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7vethf-neon-vfpv4} cortexa7"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa7hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf} cortexa7hf-vfp"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa7thf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf} cortexa7hf-vfp cortexa7t2hf-vfp"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon} cortexa7hf-vfp cortexa7hf-neon"
> diff --git a/meta/conf/machine/include/tune-cortexa8.inc b/meta/conf/machine/include/tune-cortexa8.inc
> index 6551ba4952..8ee8de97f1 100644
> --- a/meta/conf/machine/include/tune-cortexa8.inc
> +++ b/meta/conf/machine/include/tune-cortexa8.inc
> @@ -4,7 +4,6 @@ require conf/machine/include/arm/arch-armv7a.inc
>
>  TUNEVALID[cortexa8] = "Enable Cortex-A8 specific processor optimizations"
>  TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa8', ' -mcpu=cortex-a8', '', d)}"
> -MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'cortexa8', 'armv7a:', '' ,d)}"
>
>  # Little Endian base configs
>  AVAILTUNES += "cortexa8 cortexa8t cortexa8-neon cortexa8t-neon"
> @@ -12,11 +11,10 @@ ARMPKGARCH_tune-cortexa8             = "cortexa8"
>  ARMPKGARCH_tune-cortexa8t            = "cortexa8"
>  ARMPKGARCH_tune-cortexa8-neon        = "cortexa8"
>  ARMPKGARCH_tune-cortexa8t-neon       = "cortexa8"
> -# mcpu is used so don't use armv7a as we don't want march
> -TUNE_FEATURES_tune-cortexa8             = "arm vfp cortexa8"
> -TUNE_FEATURES_tune-cortexa8t            = "${TUNE_FEATURES_tune-cortexa8} thumb"
> -TUNE_FEATURES_tune-cortexa8-neon        = "${TUNE_FEATURES_tune-cortexa8} neon"
> -TUNE_FEATURES_tune-cortexa8t-neon       = "${TUNE_FEATURES_tune-cortexa8-neon} thumb"
> +TUNE_FEATURES_tune-cortexa8             = "${TUNE_FEATURES_tune-armv7a} cortexa8"
> +TUNE_FEATURES_tune-cortexa8t            = "${TUNE_FEATURES_tune-armv7at} cortexa8"
> +TUNE_FEATURES_tune-cortexa8-neon        = "${TUNE_FEATURES_tune-armv7a-neon} cortexa8"
> +TUNE_FEATURES_tune-cortexa8t-neon       = "${TUNE_FEATURES_tune-armv7at-neon} cortexa8"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa8             = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortexa8-vfp"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa8t            = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa8-vfp cortexa8t2-vfp"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa8-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortexa8-vfp cortexa8-neon"
> @@ -28,11 +26,10 @@ ARMPKGARCH_tune-cortexa8hf             = "cortexa8"
>  ARMPKGARCH_tune-cortexa8thf            = "cortexa8"
>  ARMPKGARCH_tune-cortexa8hf-neon        = "cortexa8"
>  ARMPKGARCH_tune-cortexa8thf-neon       = "cortexa8"
> -# mcpu is used so don't use armv7a as we don't want march
> -TUNE_FEATURES_tune-cortexa8hf             = "${TUNE_FEATURES_tune-cortexa8} callconvention-hard"
> -TUNE_FEATURES_tune-cortexa8thf            = "${TUNE_FEATURES_tune-cortexa8t} callconvention-hard"
> -TUNE_FEATURES_tune-cortexa8hf-neon        = "${TUNE_FEATURES_tune-cortexa8-neon} callconvention-hard"
> -TUNE_FEATURES_tune-cortexa8thf-neon       = "${TUNE_FEATURES_tune-cortexa8t-neon} callconvention-hard"
> +TUNE_FEATURES_tune-cortexa8hf             = "${TUNE_FEATURES_tune-armv7ahf} cortexa8"
> +TUNE_FEATURES_tune-cortexa8thf            = "${TUNE_FEATURES_tune-armv7athf} cortexa8"
> +TUNE_FEATURES_tune-cortexa8hf-neon        = "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa8"
> +TUNE_FEATURES_tune-cortexa8thf-neon       = "${TUNE_FEATURES_tune-armv7athf-neon} cortexa8"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa8hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} cortexa8hf-vfp"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa8thf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa8hf-vfp cortexa8t2hf-vfp"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa8hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} cortexa8hf-vfp cortexa8hf-neon"
> diff --git a/meta/conf/machine/include/tune-cortexa9.inc b/meta/conf/machine/include/tune-cortexa9.inc
> index ecc7908cd7..0cf323c960 100644
> --- a/meta/conf/machine/include/tune-cortexa9.inc
> +++ b/meta/conf/machine/include/tune-cortexa9.inc
> @@ -4,7 +4,6 @@ require conf/machine/include/arm/arch-armv7a.inc
>
>  TUNEVALID[cortexa9] = "Enable Cortex-A9 specific processor optimizations"
>  TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa9', ' -mcpu=cortex-a9', '', d)}"
> -MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'cortexa9', 'armv7a:', '' ,d)}"
>
>  # Little Endian base configs
>  AVAILTUNES += "cortexa9 cortexa9t cortexa9-neon cortexa9t-neon"
> @@ -12,11 +11,10 @@ ARMPKGARCH_tune-cortexa9             = "cortexa9"
>  ARMPKGARCH_tune-cortexa9t            = "cortexa9"
>  ARMPKGARCH_tune-cortexa9-neon        = "cortexa9"
>  ARMPKGARCH_tune-cortexa9t-neon       = "cortexa9"
> -# mcpu is used so don't use armv7a as we don't want march
> -TUNE_FEATURES_tune-cortexa9             = "arm vfp cortexa9"
> -TUNE_FEATURES_tune-cortexa9t            = "${TUNE_FEATURES_tune-cortexa9} thumb"
> -TUNE_FEATURES_tune-cortexa9-neon        = "${TUNE_FEATURES_tune-cortexa9} neon"
> -TUNE_FEATURES_tune-cortexa9t-neon       = "${TUNE_FEATURES_tune-cortexa9-neon} thumb"
> +TUNE_FEATURES_tune-cortexa9             = "${TUNE_FEATURES_tune-armv7a} cortexa9"
> +TUNE_FEATURES_tune-cortexa9t            = "${TUNE_FEATURES_tune-armv7at} cortexa9"
> +TUNE_FEATURES_tune-cortexa9-neon        = "${TUNE_FEATURES_tune-armv7a-neon} cortexa9"
> +TUNE_FEATURES_tune-cortexa9t-neon       = "${TUNE_FEATURES_tune-armv7at-neon} cortexa9"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa9             = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortexa9-vfp"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa9t            = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa9-vfp cortexa9t2-vfp"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa9-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortexa9-vfp cortexa9-neon"
> @@ -28,11 +26,10 @@ ARMPKGARCH_tune-cortexa9hf             = "cortexa9"
>  ARMPKGARCH_tune-cortexa9thf            = "cortexa9"
>  ARMPKGARCH_tune-cortexa9hf-neon        = "cortexa9"
>  ARMPKGARCH_tune-cortexa9thf-neon       = "cortexa9"
> -# mcpu is used so don't use armv7a as we don't want march
> -TUNE_FEATURES_tune-cortexa9hf             = "${TUNE_FEATURES_tune-cortexa9} callconvention-hard"
> -TUNE_FEATURES_tune-cortexa9thf            = "${TUNE_FEATURES_tune-cortexa9t} callconvention-hard"
> -TUNE_FEATURES_tune-cortexa9hf-neon        = "${TUNE_FEATURES_tune-cortexa9-neon} callconvention-hard"
> -TUNE_FEATURES_tune-cortexa9thf-neon       = "${TUNE_FEATURES_tune-cortexa9t-neon} callconvention-hard"
> +TUNE_FEATURES_tune-cortexa9hf             = "${TUNE_FEATURES_tune-armv7ahf} cortexa9"
> +TUNE_FEATURES_tune-cortexa9thf            = "${TUNE_FEATURES_tune-armv7athf} cortexa9"
> +TUNE_FEATURES_tune-cortexa9hf-neon        = "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa9"
> +TUNE_FEATURES_tune-cortexa9thf-neon       = "${TUNE_FEATURES_tune-armv7athf-neon} cortexa9"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa9hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} cortexa9hf-vfp"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa9thf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa9hf-vfp cortexa9t2hf-vfp"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa9hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} cortexa9hf-vfp cortexa9hf-neon"
> @@ -44,11 +41,10 @@ ARMPKGARCH_tune-cortexa9-vfpv3          = "cortexa9"
>  ARMPKGARCH_tune-cortexa9t-vfpv3         = "cortexa9"
>  ARMPKGARCH_tune-cortexa9hf-vfpv3        = "cortexa9"
>  ARMPKGARCH_tune-cortexa9thf-vfpv3       = "cortexa9"
> -# mcpu is used so don't use armv7a as we don't want march
> -TUNE_FEATURES_tune-cortexa9-vfpv3           = "${TUNE_FEATURES_tune-cortexa9} vfpv3"
> -TUNE_FEATURES_tune-cortexa9t-vfpv3          = "${TUNE_FEATURES_tune-cortexa9t} vfpv3"
> -TUNE_FEATURES_tune-cortexa9hf-vfpv3         = "${TUNE_FEATURES_tune-cortexa9hf} vfpv3"
> -TUNE_FEATURES_tune-cortexa9thf-vfpv3        = "${TUNE_FEATURES_tune-cortexa9thf} vfpv3"
> +TUNE_FEATURES_tune-cortexa9-vfpv3           = "${TUNE_FEATURES_tune-armv7a-vfpv3} cortexa9"
> +TUNE_FEATURES_tune-cortexa9t-vfpv3          = "${TUNE_FEATURES_tune-armv7at-vfpv3} cortexa9"
> +TUNE_FEATURES_tune-cortexa9hf-vfpv3         = "${TUNE_FEATURES_tune-armv7ahf-vfpv3} cortexa9"
> +TUNE_FEATURES_tune-cortexa9thf-vfpv3        = "${TUNE_FEATURES_tune-armv7athf-vfpv3} cortexa9"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa9-vfpv3           = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-vfpv3} cortexa9-vfp cortexa9-vfpv3"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa9t-vfpv3          = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-vfpv3} cortexa9-vfp cortexa9-vfpv3 cortexa9t2-vfp cortexa9t2-vfpv3"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa9hf-vfpv3         = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-vfpv3} cortexa9hf-vfp cortexa9hf-vfpv3"
> diff --git a/meta/conf/machine/include/tune-ep9312.inc b/meta/conf/machine/include/tune-ep9312.inc
> index 4d92821628..84ca528d6d 100644
> --- a/meta/conf/machine/include/tune-ep9312.inc
> +++ b/meta/conf/machine/include/tune-ep9312.inc
> @@ -4,7 +4,6 @@ require conf/machine/include/arm/arch-armv4.inc
>
>  TUNEVALID[ep9312] = "Enable Intel PXA27x specific processor optimizations"
>  TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'ep9312', ' -march=ep9312 -mcpu=ep9312', '', d)}"
> -MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'ep9312', 'armv4:', '' ,d)}"
>
>  AVAILTUNES += "ep9312"
>  ARMPKGARCH_tune-ep9312 = "ep9312"
> diff --git a/meta/conf/machine/include/tune-iwmmxt.inc b/meta/conf/machine/include/tune-iwmmxt.inc
> index 9a6cd23c99..f27423cb2e 100644
> --- a/meta/conf/machine/include/tune-iwmmxt.inc
> +++ b/meta/conf/machine/include/tune-iwmmxt.inc
> @@ -6,8 +6,7 @@ DEFAULTTUNE ?= "iwmmxt"
>  require conf/machine/include/arm/arch-armv5-dsp.inc
>
>  TUNEVALID[iwmmxt] = "Enable Intel PXA27x specific processor optimizations"
> -TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'iwmmxt', ' -mcpu=iwmmxt', '', d)}"
> -MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'iwmmxt', 'armv5:', '' ,d)}"
> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'iwmmxt', ' -march=iwmmxt -mcpu=iwmmxt', '', d)}"
>
>  AVAILTUNES += "iwmmxt"
>  ARMPKGARCH_tune-iwmmxt = "iwmmxt"
> diff --git a/meta/conf/machine/include/tune-strongarm1100.inc b/meta/conf/machine/include/tune-strongarm1100.inc
> index e978e925d2..80cfb8ab8a 100644
> --- a/meta/conf/machine/include/tune-strongarm1100.inc
> +++ b/meta/conf/machine/include/tune-strongarm1100.inc
> @@ -4,9 +4,8 @@ require conf/machine/include/arm/arch-armv4.inc
>
>  TUNEVALID[strongarm] = "Enable Strongarm 1100 series processor optimizations"
>  TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'strongarm', ' -mcpu=strongarm1100', '', d)}"
> -MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'strongarm', 'armv4:', '' ,d)}"
>
>  AVAILTUNES += "strongarm"
>  ARMPKGARCH_tune-strongarm = "strongarm"
> -TUNE_FEATURES_tune-strongarm = "arm strongarm"
> +TUNE_FEATURES_tune-strongarm = "${TUNE_FEATURES_tune-armv4} strongarm"
>  PACKAGE_EXTRA_ARCHS_tune-strongarm = "${PACKAGE_EXTRA_ARCHS_tune-armv4} strongarm"
> diff --git a/meta/conf/machine/include/tune-xscale.inc b/meta/conf/machine/include/tune-xscale.inc
> index 19d5e13e61..0d07333955 100644
> --- a/meta/conf/machine/include/tune-xscale.inc
> +++ b/meta/conf/machine/include/tune-xscale.inc
> @@ -4,16 +4,13 @@ require conf/machine/include/arm/arch-armv5-dsp.inc
>
>  TUNEVALID[xscale] = "Enable PXA255/PXA26x Xscale specific processor optimizations"
>  TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'xscale', ' -mcpu=xscale', '', d)}"
> -MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'xscale', 'armv5:', '' ,d)}"
>
>  AVAILTUNES += "xscale"
>  ARMPKGARCH_tune-xscale = "xscale"
> -# mcpu is used so don't use armv5te as we don't want march
> -TUNE_FEATURES_tune-xscale = "arm thumb dsp xscale"
> +TUNE_FEATURES_tune-xscale = "${TUNE_FEATURES_tune-armv5te} xscale"
>  PACKAGE_EXTRA_ARCHS_tune-xscale = "${PACKAGE_EXTRA_ARCHS_tune-armv5te} xscale xscalet xscalee xscalete"
>
>  AVAILTUNES += "xscale-be"
>  ARMPKGARCH_tune-xscale-be = "xscale"
> -# mcpu is used so don't use armv5te as we don't want march
> -TUNE_FEATURES_tune-xscale-be = "${TUNE_FEATURES_tune-xscale} bigendian"
> +TUNE_FEATURES_tune-xscale-be = "${TUNE_FEATURES_tune-armv5teb} xscale bigendian"
>  PACKAGE_EXTRA_ARCHS_tune-xscale-be = "${PACKAGE_EXTRA_ARCHS_tune-armv5teb} xscaleb xscaletb xscaleeb xscaleteb"
> --
> 2.12.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

