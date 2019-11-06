Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7BCA67D278
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 20:55:04 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id z23so580728qkj.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Nov 2019 12:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=MUL50DGeyACLZ54NDnqxrKiQTNnT1UIdeXiiroVUNcE=;
	b=UgDpygynyW0/CubyzI6i0LJhmMfxOINogQxjcV+kliswLSUgU10RVvR0uSKDXBaqId
	8S7NsqGLX32yrAyI5lf7qXq25AaVg81Mr0vp+avFDiKN0nFuFgzYVxKLqF3KXUnUoxKQ
	zhi2RoDGMu1UUZQKtprHVX63MUPrqRXotJzBzjqnJvZOwDN2vDUajpzkNaJ9ICe0GtOD
	wyJAm217VrAcyvzZgAECRaz8f41OZ06UMDPPvEHqatRRAxP83CtZRlBsX7hL5FRVM8z7
	UiSuRchHoEQkzUcOJlxEihJ/M5ejIUUGMm36iXCAV+AcHwPubtFO/1eNpujrd4RP5x5w
	PHiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MUL50DGeyACLZ54NDnqxrKiQTNnT1UIdeXiiroVUNcE=;
	b=dzn+CiUu8UUeJm27VszWXfGI64ZCrlsPoUrSCmtCiYuHyjC1shnfHryyHwDEBYZoUV
	wWu/t+gWOygGUd3B/qqU4EeJ+msF/hv/xmWBrdQS18gEc9VSL00v+WWcMVJw41hw7lOM
	BzhpA2TSaddtrBOHwUVLUT7WXp3XWkqEwgoBWUw5EEgDd1xES69kZaIlNM64mp3Y9p5y
	5RL7JYdKZrA8IMy2cVpppj/XdOByqI5Sqi3pet0a0UVxEm+nu5bBGiHNzzm9uQULjArl
	jzplcIop7GQ5NuFnp9tKglpzWyMOliSbXJOQNGI9bUn7qKPw8s1/2kjLWqGIxWOgPE1i
	WUqQ==
X-Gm-Message-State: APjAAAWjMma6GednpsvxA9JUfFW1DYGw+Dj56F0if2N30ksD56MgRFZG
	u520v5MLuA7Ovj+/CPsYhAlqjhyyJEl7JXYcoms=
X-Google-Smtp-Source: APXvYqwFeBmt+gTr+or6FYk1miKZ3knIDIGJMEnI6cl/AHXDopx5Vzv7FTaiJdbLNkRD+6qOrAse5woC669jjhqVdsw=
X-Received: by 2002:a37:84b:: with SMTP id 72mr4103742qki.337.1573073705078;
	Wed, 06 Nov 2019 12:55:05 -0800 (PST)
MIME-Version: 1.0
References: <20191106181819.12517-1-alistair.francis@wdc.com>
In-Reply-To: <20191106181819.12517-1-alistair.francis@wdc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Nov 2019 12:54:38 -0800
Message-ID: <CAMKF1soM-bediaxsN9n5Ra_LK1ydR=_gpy5dyzxaH9yGu5Ar2Q@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 06 Nov 2019 20:55:04 -0000
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
>
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

 its better to add riscv64sf and keep existing tunes as it is. since
sf is going to be rare
compared to rv64gc

> --
> 2.23.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

