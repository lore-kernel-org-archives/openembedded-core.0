Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id ECD2971951
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Nov 2016 17:51:05 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id 20so21191088uak.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Nov 2016 09:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8LSBxpTA1KUlByjN0J0pj/uTT5Kmwsn2RSJ69tQpsKQ=;
	b=kSueBo2FNaZlWFjySzdNm0gX+xsM3AZNBBydgJDFUOWwO2k058n0+4+Oi9h39oMBCX
	kAoskvbcfdfA4k3xhcBO5Wtv3Pq7wbTRTi0MFw3C3Ref1hRHO3McaS5R08MOFSqYHNh0
	qP3GgRKDrViYeIuJeOdOjFDn5sS2YttfL4YoqpnxVeItpKCE37czYgJWq1DsmAfnQVGZ
	AX3DycmF87n7FOVOg5I/6sgO3fIwRQa32w9MAhEz9NvtCBOa8E2b33SXmHtwteadJAAz
	me5u7tBCT3BXScB8W2XAn1BO4jBK0vl7vlURUDhfj6P7JhOZTsQO7LeywJmiwWv/69DO
	mvvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8LSBxpTA1KUlByjN0J0pj/uTT5Kmwsn2RSJ69tQpsKQ=;
	b=S9VMiEOZqejssm1SHtC29R9owK8nuE7JJSg9XobT+G3ygGvbsSrqE6T1did8sWx64/
	8IVN4xzhSZFqNdbR5vzZvlETyN83PG+i/gN2S5EyJO33M0v7guMzr5bDhuPX7SqVq0mP
	2SzcTWTiIz7occrkaPuhb1uEpA2ND5U79memZl/iES183I9xRLRN+2M8aHC0DC0iGhQE
	3szsoeRD2EHrLCdYKUYwdZ5BLyLPXm8lPU6FqZpiy7e5JX1WiZh66u03qpjX152p77cC
	/EkkvwrL45LN/6eThIsUCZOethBU3widm0mWtON/lq3Yo5iNgUk2Uafv1GNnt/buygGF
	zX2A==
X-Gm-Message-State: AKaTC022L0htzJ5Xtb79DlzNZvjrjBp3edzh9cl/0Jzq2QjsyRIDiJ3KqpaCpr3M1ob3OngoeGFCFnapoZPufg==
X-Received: by 10.176.82.181 with SMTP id v50mr2763197uav.31.1479577867053;
	Sat, 19 Nov 2016 09:51:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.5.136 with HTTP; Sat, 19 Nov 2016 09:50:36 -0800 (PST)
In-Reply-To: <1479559833-128256-2-git-send-email-herve.jourdain@neuf.fr>
References: <1479559833-128256-1-git-send-email-herve.jourdain@neuf.fr>
	<1479559833-128256-2-git-send-email-herve.jourdain@neuf.fr>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 19 Nov 2016 09:50:36 -0800
Message-ID: <CAMKF1so0YG5cy49tG2Efm-arFfxDbEoZgrP_5JNM9+ch_pr=cg@mail.gmail.com>
To: Herve Jourdain <herve.jourdain@neuf.fr>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/1] Add a tune file for cortexa53, valid for 32 bits and 64 bits
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
X-List-Received-Date: Sat, 19 Nov 2016 17:51:06 -0000
Content-Type: text/plain; charset=UTF-8

This seems fine to me. There is a tune checker that Martin has, it would be good
to run that and see if this new tune is tested.

http://git.openembedded.org/openembedded-core-contrib/log/?h=jansa/tune2-test


On Sat, Nov 19, 2016 at 4:50 AM, Herve Jourdain <herve.jourdain@neuf.fr> wrote:
> Signed-off-by: Herve Jourdain <herve.jourdain@neuf.fr>
> ---
>  meta/conf/machine/include/tune-cortexa53.inc | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 meta/conf/machine/include/tune-cortexa53.inc
>
> diff --git a/meta/conf/machine/include/tune-cortexa53.inc b/meta/conf/machine/include/tune-cortexa53.inc
> new file mode 100644
> index 0000000..ff5edb6
> --- /dev/null
> +++ b/meta/conf/machine/include/tune-cortexa53.inc
> @@ -0,0 +1,22 @@
> +DEFAULTTUNE ?= "cortexa53-32"
> +
> +require conf/machine/include/arm/arch-armv8.inc
> +
> +TUNEVALID[cortexa53] = "Enable Cortex-A53 specific processor optimizations"
> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa53', ' -mcpu=cortex-a53 ', '',d)}"
> +
> +# Extra tune selections
> +AVAILTUNES += "cortexa53-32"
> +ARMPKGARCH_tune-cortexa53-32 ?= "cortexa53"
> +TUNE_FEATURES_tune-cortexa53-32 = "${TUNE_FEATURES_tune-armv7ve-neon-vfpv4} cortexa53"
> +BASE_LIB_tune-cortexa53-32 = "lib"
> +TUNE_PKGARCH_tune-cortexa53-32 = "cortexa53-32"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa53-32 = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon-vfpv4} cortexa53-32 cortexa53-neon-vfpv4"
> +
> +AVAILTUNES += "cortexa53-64"
> +ARMPKGARCH_tune-cortexa53-64 ?= "cortexa53"
> +TUNE_FEATURES_tune-cortexa53-64 = "${TUNE_FEATURES_tune-aarch64} cortexa53"
> +BASE_LIB_tune-cortexa53-64 = "lib64"
> +TUNE_PKGARCH_tune-cortexa53-64 = "cortexa53-64"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa53-64 = "${PACKAGE_EXTRA_ARCHS_tune-aarch64} cortexa53-64"
> +
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

