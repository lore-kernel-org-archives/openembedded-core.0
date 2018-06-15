Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3C20B74F35
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 09:57:52 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id u4-v6so13782146lff.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 02:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dlgFJYakw1PYCSz+IWzyYOuaJ1MUz6Cv82hoeLtxJps=;
	b=hNY41kYT70qy/IJOusOkJeNG5OSQ6T7PPO76Ow4RSyMuIk2MimvBk35hkfbiqcFJpa
	RyRnw75Hd5Dd5SxFh+ijYP7JDZiXs/G7FnnlduARQLywCnXcGVX9ycxDHF2HjkOnOks9
	2K7zMzyg2BnuBeN9tMbwa9Nn9ZNnB/h1mKmOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dlgFJYakw1PYCSz+IWzyYOuaJ1MUz6Cv82hoeLtxJps=;
	b=qkA4rcecsPtAwOr88n7j+m0NrmZzLHk/VGIs0iVAjBtKFtiUt7tFFeHtJ+oeGOcosl
	4LZxIBm06EhSslDizTbTbY7rqL4cwDVrRpgxN6nwbde+vx/oRCQpymfBy89L8sPRdHS+
	GbTXXZCXESuQXJFRxS/mntDxbJzvDsuvWiZcufB+UM+GmNTjHMfvIEEFjb2b5+DYTd35
	B3h0QezbuzXiQZYaXPhX41wrwFUMk+vYapPJAtmaSyfApp0dVgnuW5Bq6LcLxPO8n97A
	K2i9UUORcbv5KOSRY7TnoE8I3DAMMkjWTfYJwrqwBmbbfUobPYvJD3O6nGo32akdCNrL
	3dVA==
X-Gm-Message-State: APt69E08+UgwShsz4NqueHENz5SDZi0/Dv/T+ScxE93yJVedtsKKg5w3
	r2IoqDcqvmYMsUC7EAZ0cYSQTTKXrg9gtOgCuAWLiQ==
X-Google-Smtp-Source: ADUXVKInrQ47hG0a6oTMDUG6/dxGk33phOXlMlFmF4rtjtrH4FSJrg4JjzbI1MgtT3PhN9IOVNbZp//lh7lmjppQIF4=
X-Received: by 2002:a2e:249:: with SMTP id 70-v6mr880402ljc.41.1529056672641; 
	Fri, 15 Jun 2018 02:57:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:a03:0:0:0:0:0 with HTTP;
	Fri, 15 Jun 2018 02:57:31 -0700 (PDT)
In-Reply-To: <20180615032226.9899-2-ayaka@soulik.info>
References: <20180615032226.9899-1-ayaka@soulik.info>
	<20180615032226.9899-2-ayaka@soulik.info>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 15 Jun 2018 11:57:31 +0200
Message-ID: <CAP71Wjz91m61fs9kxg1F7NCTq=X8Mtkc-CeBFNKZGgi=6tEgmA@mail.gmail.com>
To: Randy Li <ayaka@soulik.info>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 1/5] arch-armv8a.inc: add tune include for armv8
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
X-List-Received-Date: Fri, 15 Jun 2018 09:57:52 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 15, 2018 at 5:22 AM, Randy Li <ayaka@soulik.info> wrote:
> There are some addtional instructions apart from bare armv8,
> also there is armv8.1, armv8.2.
>
> Most the processor would support crc, except X-gene 1.
>
> Signed-off-by: Randy Li <ayaka@soulik.info>
> ---
>  meta/conf/machine/include/arm/arch-armv8.inc  |  1 -
>  meta/conf/machine/include/arm/arch-armv8a.inc | 28 +++++++++++++++++++++++++++
>  2 files changed, 28 insertions(+), 1 deletion(-)
>  delete mode 100644 meta/conf/machine/include/arm/arch-armv8.inc

My previous comment still applies here. You can't just delete this
file. It's used by many BSP. and it's even used in oe-core itself:

layers/openembedded-core/meta/conf/machine/include/tune-thunderx.inc:require
conf/machine/include/arm/arch-armv8.inc
layers/openembedded-core/meta/conf/machine/qemuarm64.conf:require
conf/machine/include/arm/arch-armv8.inc

>  create mode 100644 meta/conf/machine/include/arm/arch-armv8a.inc
>
> diff --git a/meta/conf/machine/include/arm/arch-armv8.inc b/meta/conf/machine/include/arm/arch-armv8.inc
> deleted file mode 100644
> index 5e832fae6d..0000000000
> --- a/meta/conf/machine/include/arm/arch-armv8.inc
> +++ /dev/null
> @@ -1 +0,0 @@
> -require conf/machine/include/arm/arch-arm64.inc
> diff --git a/meta/conf/machine/include/arm/arch-armv8a.inc b/meta/conf/machine/include/arm/arch-armv8a.inc
> new file mode 100644
> index 0000000000..323d0d7f0f
> --- /dev/null
> +++ b/meta/conf/machine/include/arm/arch-armv8a.inc
> @@ -0,0 +1,28 @@
> +DEFAULTTUNE ?= "armv8a-crc"
> +
> +TUNEVALID[armv8a] = "Enable instructions for ARMv8-a"
> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8a', ' -march=armv8-a', '', d)}"
> +TUNEVALID[simd] = "Enable instructions for ARMv8-a Advanced SIMD and floating-point"
> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'simd', '+simd', '', d)}"
> +TUNEVALID[crc] = "Enable instructions for ARMv8-a Cyclic Redundancy Check (CRC)"
> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'crc', '+crc', '', d)}"
> +TUNEVALID[crypto] = "Enable instructions for ARMv8-a cryptographic"
> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'crypto', '+crypto', '', d)}"
> +MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8a', 'armv8a:', '' ,d)}"
> +
> +require conf/machine/include/arm/arch-arm64.inc
> +
> +# Little Endian base configs
> +AVAILTUNES += "armv8a armv8a-crc armv8a-crc-crypto armv8a-crypto"
> +ARMPKGARCH_tune-armv8a                    ?= "armv8a"
> +ARMPKGARCH_tune-armv8a-crc                ?= "armv8a"
> +ARMPKGARCH_tune-armv8a-crypto             ?= "armv8a"
> +ARMPKGARCH_tune-armv8a-crc-crypto         ?= "armv8a"
> +TUNE_FEATURES_tune-armv8a                  = "aarch64 armv8a simd"
> +TUNE_FEATURES_tune-armv8a-crc              = "${TUNE_FEATURES_tune-armv8a} crc"
> +TUNE_FEATURES_tune-armv8a-crypto           = "${TUNE_FEATURES_tune-armv8a} crypto"
> +TUNE_FEATURES_tune-armv8a-crc-crypto       = "${TUNE_FEATURES_tune-armv8a-crc} crypto"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a            = "aarch64 armv8a simd"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc        = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} crc"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crypto     = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} crypto"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} crypto"
> --
> 2.14.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

