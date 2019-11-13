Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3A17C7F363
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 08:48:21 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id j85so814703vsd.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 00:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QDNr3Yh8+1X874mYEG214TJ2Q/fMz0jldR6+Urthre4=;
	b=QFLLkCW60K4OFTjwzE4uKMrDAH+n1ELOdQxzU3K20drEpIA9JhjzWzWap3Wl5ABKjN
	TDo7hM7AHMz98eF7dUTJTVzQT87YGzXtaNoPbikkm6RZXAP63uZzpIEwfykFLO3rylzK
	9OAOjIlVjr5DmuYQqwE314H8BYOTjVXatU2DsBOZnY+djw3DF7Yi7UKuXEMRrUVlURBj
	MIUJR/EimIbvhgdGDSEbf6B3rmzt1CPDjPa8q7FJjccaRTCy/tLLQ2HIz1lOmQa6NoTY
	585BN1OSvRYYX4mqcNulWK+Fam2DNscsJy42PG5KOVy+PJ0npYlTiCD3jqij5ubaapoh
	vmHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QDNr3Yh8+1X874mYEG214TJ2Q/fMz0jldR6+Urthre4=;
	b=c4NkJjfJumviFHjtjZHxAQbf4gRwPajHwUl+NkPkqdN0838HtI7A0CMJ8sci6VF3yw
	ftK1bocX1VapLLxFzfzW917EdfgZwmD7rbz8J31sRffOnzYOFsGL8Mlp4Ht9meGva96T
	nzZlLd94n2lyfIGwuFgti5Lp2kTl1vT791+vLTPV5jN1gQ89EKngTyyxVWHa582JNT81
	7r8X1EjhnFnTy9N1YiEG1/vKwCdA/N0hkA3jVEbpdJmRDVvmMxGkeNTx/2rdXt5i+VcW
	pmvTVV1K5EJeWUpqIam53JSKPN2cYK4kTvdxpX8wWq2EeNcoDJIIjy39IfM0KEjSANX8
	rz4A==
X-Gm-Message-State: APjAAAUEvBQhFOmFL/WE+DC8YgxV0CQRqcFY8X+bKKojuPXtaTWxTdvu
	X4lnzEBe1/h8yXv7L31oKi3PwhZp427H8ppZu9M=
X-Google-Smtp-Source: APXvYqxwYYglBngFbrMM9/hrxNmwMij1jyLK3yHb8HsHpG+9L3DsYJs0OXA61LNsapdVbCIm+DsYO8hCfPcqgEaH+ic=
X-Received: by 2002:a05:6102:519:: with SMTP id
	l25mr1139555vsa.222.1573634901978; 
	Wed, 13 Nov 2019 00:48:21 -0800 (PST)
MIME-Version: 1.0
References: <20191106181819.12517-1-alistair.francis@wdc.com>
In-Reply-To: <20191106181819.12517-1-alistair.francis@wdc.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 13 Nov 2019 00:48:15 -0800
Message-ID: <CAJ86T=WzWLngcY1B968u7aNyxfmt2eP5T+wMnyFRj+fU0Y7MWA@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] tune-riscv: Add support for hard and soft float
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
X-List-Received-Date: Wed, 13 Nov 2019 08:48:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 6, 2019 at 12:37 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  meta/conf/machine/include/riscv/arch-riscv.inc |  3 ++-
>  meta/conf/machine/include/riscv/tune-riscv.inc | 17 +++++++++++++++--
>  2 files changed, 17 insertions(+), 3 deletions(-)
>
> diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc b/meta/conf/machine/include/riscv/arch-riscv.inc
> index f3edcc39f7..6737545e00 100644
> --- a/meta/conf/machine/include/riscv/arch-riscv.inc
> +++ b/meta/conf/machine/include/riscv/arch-riscv.inc
> @@ -4,7 +4,8 @@ DEFAULTTUNE ?= "riscv64"
>
>  TUNE_ARCH = "${TUNE_ARCH_tune-${DEFAULTTUNE}}"
>  TUNE_PKGARCH = "${TUNE_PKGARCH_tune-${DEFAULTTUNE}}"
> -TUNE_CCARGS .= ""
> +TUNE_CCARGS_riscv64 .= "${@bb.utils.contains('TUNE_FEATURES', 'riscv64-f', ' -mabi=lp64d', ' -mabi=lp64', d)}"
> +TUNE_CCARGS_riscv32 .= "${@bb.utils.contains('TUNE_FEATURES', 'riscv32-f', ' -mabi=ilp32f', ' -mabi=ilp32', d)}"

Using an over-ride to set TUNE_CCARGS is probably going to cause
problems if/when you need to add something else to TUNE_CCARGS in the
future.

In general using += .= etc with an over-ride is discouraged as it
doesn't do what most people might expect...

>  # QEMU usermode fails with invalid instruction error (For riscv32)
>  MACHINE_FEATURES_BACKFILL_CONSIDERED_append = "${@bb.utils.contains('TUNE_FEATURES', 'riscv32', ' qemu-usermode', '', d)}"
> diff --git a/meta/conf/machine/include/riscv/tune-riscv.inc b/meta/conf/machine/include/riscv/tune-riscv.inc
> index 25d0463492..631653f2a2 100644
> --- a/meta/conf/machine/include/riscv/tune-riscv.inc
> +++ b/meta/conf/machine/include/riscv/tune-riscv.inc
> @@ -1,12 +1,26 @@
>  require conf/machine/include/riscv/arch-riscv.inc
>
>  TUNEVALID[riscv64] = "Enable 64-bit RISC-V optimizations"
> +TUNEVALID[riscv64-f] = "Enable 64-bit RISC-V optimizations with hard float"
>  TUNEVALID[riscv32] = "Enable 32-bit RISC-V optimizations"
> +TUNEVALID[riscv32-f] = "Enable 32-bit RISC-V optimizations with hard float"
>
>  TUNEVALID[bigendian] = "Big endian mode"
>
> -AVAILTUNES += "riscv64 riscv32"
> +AVAILTUNES += "riscv64 riscv64-f riscv32 riscv32-f"
>
> +# Hard float
> +TUNE_FEATURES_tune-riscv64-f = "${TUNE_FEATURES_tune-riscv64} riscv64-f"
> +TUNE_ARCH_tune-riscv64-f = "riscv64"
> +TUNE_PKGARCH_tune-riscv64-f = "riscv64"
> +PACKAGE_EXTRA_ARCHS_tune-riscv64-f = "riscv64"
> +
> +TUNE_FEATURES_tune-riscv32-f = "${TUNE_FEATURES_tune-riscv32} riscv32-f"
> +TUNE_ARCH_tune-riscv32-f = "riscv32"
> +TUNE_PKGARCH_tune-riscv32-f = "riscv32"
> +PACKAGE_EXTRA_ARCHS_tune-riscv32-f = "riscv32"
> +
> +# Soft float
>  TUNE_FEATURES_tune-riscv64 = "riscv64"
>  TUNE_ARCH_tune-riscv64 = "riscv64"
>  TUNE_PKGARCH_tune-riscv64 = "riscv64"
> @@ -16,4 +30,3 @@ TUNE_FEATURES_tune-riscv32 = "riscv32"
>  TUNE_ARCH_tune-riscv32 = "riscv32"
>  TUNE_PKGARCH_tune-riscv32 = "riscv32"
>  PACKAGE_EXTRA_ARCHS_tune-riscv32 = "riscv32"
> -
> --
> 2.23.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

