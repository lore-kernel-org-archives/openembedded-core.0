Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5637B78D99
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 05:59:39 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id d24-v6so34063947lfa.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 22:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=geP8Mz2Om3RJzIoWyAM4d/U/IgAdoV7y/IbKWgVsl1A=;
	b=NMU6KgempEtZyKXHzRxNkqCNTJ+wX5tM9DS3o803i5JXJRhzfYHznZHyOZHrtCYDha
	DUvutHPZhQrzn3cl7C/i35u42DP/UXriu6XABbOeDgvTR4dUIcyHdp95G315hvVE+MQ/
	sErjV9p7hCN861/VSIOac+B0zxYjXZiwrwxoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=geP8Mz2Om3RJzIoWyAM4d/U/IgAdoV7y/IbKWgVsl1A=;
	b=QwtD3AyDdDK/axGFnfGA0hptaBidNZESY/+wZgN00Ti5wY1VVfm/eYtG48Y07pVcq7
	Ct3u+nDHI3oLc8sMbO+yKKgmXywjQnwSpaVkkEN3BbIkQxgHVe8/j5Serv1faYCtXekH
	Hc+uNJ6cmRQkoq26gYbHdI+1Bnzj9iAGJc3KI37RHQXqsUGGwaGH9SPaerUkoyAfPzXr
	SU42c4AUOOW5W1Z8mwKDSYbscLV14Pw6N/ECYcjYNd7dJblpXuZ/DMg9ms4IyQIXD6bm
	b6AKAbgH9rCHgKa9yuBVXUUEcsOPmLES27fDc1+ed2Ny3tkEdwkXsd3cpuIlSqBlbREm
	eylw==
X-Gm-Message-State: APt69E3WdgHnk2+csGyhBFFdkS4yCI6StDnZ1KJYFMBEGKhEq+VDpYXV
	2kCqZe/dDRQ/TTZ2DyWZKr38aE3pY6QnxFKvnIVPK7sCVpU=
X-Google-Smtp-Source: ADUXVKJnJ0CfLFoCM314JFhBPw9GHSJkrmgvRGqXKq9IWmsocN2F0hj54SEsttkhn9gWNq0GvGl/HvWiDzxMuCKF8FM=
X-Received: by 2002:a2e:9b91:: with SMTP id
	z17-v6mr1303974lji.121.1528783179869; 
	Mon, 11 Jun 2018 22:59:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:a03:0:0:0:0:0 with HTTP;
	Mon, 11 Jun 2018 22:59:19 -0700 (PDT)
In-Reply-To: <20180609062628.32364-2-ayaka@soulik.info>
References: <20180609062628.32364-1-ayaka@soulik.info>
	<20180609062628.32364-2-ayaka@soulik.info>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Tue, 12 Jun 2018 07:59:19 +0200
Message-ID: <CAP71WjwrpycR8Zs_n0kECq83if7Eg0afWEjxv5Mj3UgQSj2MsQ@mail.gmail.com>
To: Randy Li <ayaka@soulik.info>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/4] arch-armv8a.inc: add tune include for armv8
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
X-List-Received-Date: Tue, 12 Jun 2018 05:59:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Jun 9, 2018 at 8:26 AM, Randy Li <ayaka@soulik.info> wrote:
> There are some addtional instructions apart from bare armv8,
> also there is armv8.1, armv8.2.
>
> Most the processor would support crc, except X-gene 1.

the commit message doesn't really explain what is going on in this patch..

>
> Signed-off-by: Randy Li <ayaka@soulik.info>
> ---
>  meta/conf/machine/include/arm/arch-armv8.inc  |  1 -
>  meta/conf/machine/include/arm/arch-armv8a.inc | 22 ++++++++++++++++++++++
>  2 files changed, 22 insertions(+), 1 deletion(-)
>  delete mode 100644 meta/conf/machine/include/arm/arch-armv8.inc
^^ this file is used by probably any armv8 machine out there, even
inside oe-core:

$ git grep "arch-armv8\.inc"
include/tune-thunderx.inc:require conf/machine/include/arm/arch-armv8.inc
qemuarm64.conf:require conf/machine/include/arm/arch-armv8.inc

so this change would break many things. and it's used in many BSP layers.

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
> index 0000000000..b8b9e44c54
> --- /dev/null
> +++ b/meta/conf/machine/include/arm/arch-armv8a.inc
> @@ -0,0 +1,22 @@
> +DEFAULTTUNE ?= "armv8a-crc"

even without taking into consideration that this is changing all
default configs for arm64.. which should for sure be discussed and
agreed upon... the crc and crypto flags you are adding here, are not
defined anywhere.

please review how the armv7 variants were designed/introduced, and try
to mimic that for armv8 if you think it's needed.

> +
> +TUNEVALID[armv8] = "Enable instructions for ARMv8-a"
> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8a', ' -march=armv8-a', '', d)}"
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
> +TUNE_FEATURES_tune-armv8a                  = "armv8a simd"
> +TUNE_FEATURES_tune-armv8a-crc              = "${ARMPKGARCH_tune-armv8a} crc"
> +TUNE_FEATURES_tune-armv8a-crypto           = "${TUNE_FEATURES_tune-armv8a} crypto"
> +TUNE_FEATURES_tune-armv8a-crc-crypto       = "${TUNE_FEATURES_tune-armv8a-crc} crypto"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a            = "aarch64 armv8a simd"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc        = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} crc"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crypto     = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} crypto"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} crypto"
> --
> 2.14.3
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

