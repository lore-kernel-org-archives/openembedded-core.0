Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id AC1DB7FA3E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2019 00:48:02 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id m125so4823515qkd.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 16:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=500HTF1D/GWeSIiWRUwOAZJe7A2TFNpjyX0syUq/EhY=;
	b=vAZd9HtKGUGeZPv+CivK7DZT9QB66ModF24e8bjq442nNE6EI5e1SehvjeneriKpMH
	TtZctadHRS2zpcHzDTxW4b8NWl7DaZuyivwVdRx9N6jz30/713sExdmQxODbQKpu8W1r
	QcmXsZQoHk6GEGLLZ9VFQ9B1u3GB5d+ao4j2CTJlV89zZE5gaFhrn4zVQh0A7u3oqbvM
	XwP4QYWE3iEYVNRG7Kc7yWnUbQb+Nd+eynOuOob4Cu6WumHTZaCDUMkuH63PpaEp/6/j
	HsX1v6Hqaq2OlzPKHcseGd/fy3vATmrXQrToPuOPQCydqo0U8MSoLWkgsEg5LJc4WPlz
	Glrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=500HTF1D/GWeSIiWRUwOAZJe7A2TFNpjyX0syUq/EhY=;
	b=IDe1qucHxLQfPdwMF/3WpsEDAYNaiO5EdBBUeeHn+i4kvlDf0BdLvxaQoEp0XmYdmw
	NkflY3ljBXWTYogIQ1FP/AC53jNh3GM9Y77JsCL8glhU+VdTFWoUWYs9ryaKweUFQblH
	gsS7EV0ILWwnl545sjwLt4pn+JBrztoIof5xE1kHwuUjhP+1HfdxckAh1GtxbU/hPpLS
	6+GOC9kNI2KQqU6bt91okiw6U2u+jsxVVUUQyEP9Whh6FR1LmpEfc/RRKChwsvOkhmrd
	e161E+O3Ud5FhFv7fiqn2tBlyDVA41Z/zXDlM6t0rXCFC2/NuWNrzIEBtBWOFnljJy+j
	7L6A==
X-Gm-Message-State: APjAAAUq6AG5U87euwTzLqDJjUuhY0u5XWwH/Db2HgEWncIiVNsDphhM
	Qn1Irirrz54DHtcMyoM8j6LRPI+FhCk27DTcHyE=
X-Google-Smtp-Source: APXvYqxzfxlcaVhGTBLbNeVST4efK3vXImETuOj+ruPfyZBEoGvrfStrvmtYEAIx9HfPYU6A2M7haCkhtwdf5AvW0Vs=
X-Received: by 2002:a37:a2c3:: with SMTP id
	l186mr10866382qke.337.1574383683061; 
	Thu, 21 Nov 2019 16:48:03 -0800 (PST)
MIME-Version: 1.0
References: <20191122000251.28530-1-alistair.francis@wdc.com>
In-Reply-To: <20191122000251.28530-1-alistair.francis@wdc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Nov 2019 16:47:35 -0800
Message-ID: <CAMKF1spDA-Ta4AMUq1vYwLdHf_M+pHh=naENmRV00qoTG0nskA@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] tune-riscv: Add support for no float
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
X-List-Received-Date: Fri, 22 Nov 2019 00:48:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 21, 2019 at 4:08 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  meta/conf/machine/include/riscv/arch-riscv.inc |  3 ++-
>  meta/conf/machine/include/riscv/tune-riscv.inc | 16 +++++++++++++++-
>  2 files changed, 17 insertions(+), 2 deletions(-)
>
> diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc b/meta/conf/machine/include/riscv/arch-riscv.inc
> index f3edcc39f7..33ad6a28e1 100644
> --- a/meta/conf/machine/include/riscv/arch-riscv.inc
> +++ b/meta/conf/machine/include/riscv/arch-riscv.inc
> @@ -4,7 +4,8 @@ DEFAULTTUNE ?= "riscv64"
>
>  TUNE_ARCH = "${TUNE_ARCH_tune-${DEFAULTTUNE}}"
>  TUNE_PKGARCH = "${TUNE_PKGARCH_tune-${DEFAULTTUNE}}"
> -TUNE_CCARGS .= ""
> +TUNE_CCARGS_append_riscv64 = "${@bb.utils.contains('TUNE_FEATURES', 'riscv64nf', ' -mabi=lp64', ' ', d)}"
> +TUNE_CCARGS_append_riscv32 = "${@bb.utils.contains('TUNE_FEATURES', 'riscv32nf', ' -mabi=ilp32', ' ', d)}"
>

using overrides here is not required. riscv64nf and riscv32 should
conflict with each other and such a combination would
then not exist.

>  # QEMU usermode fails with invalid instruction error (For riscv32)
>  MACHINE_FEATURES_BACKFILL_CONSIDERED_append = "${@bb.utils.contains('TUNE_FEATURES', 'riscv32', ' qemu-usermode', '', d)}"
> diff --git a/meta/conf/machine/include/riscv/tune-riscv.inc b/meta/conf/machine/include/riscv/tune-riscv.inc
> index 25d0463492..b7dcd244d6 100644
> --- a/meta/conf/machine/include/riscv/tune-riscv.inc
> +++ b/meta/conf/machine/include/riscv/tune-riscv.inc
> @@ -3,10 +3,14 @@ require conf/machine/include/riscv/arch-riscv.inc
>  TUNEVALID[riscv64] = "Enable 64-bit RISC-V optimizations"
>  TUNEVALID[riscv32] = "Enable 32-bit RISC-V optimizations"
>
> +TUNEVALID[riscv64nf] = "Enable 64-bit RISC-V optimizations no floating point"
> +TUNEVALID[riscv32nf] = "Enable 32-bit RISC-V optimizations no floating point"
> +
>  TUNEVALID[bigendian] = "Big endian mode"
>
> -AVAILTUNES += "riscv64 riscv32"
> +AVAILTUNES += "riscv64 riscv32 riscv64nf riscv32nf"
>
> +# Default
>  TUNE_FEATURES_tune-riscv64 = "riscv64"
>  TUNE_ARCH_tune-riscv64 = "riscv64"
>  TUNE_PKGARCH_tune-riscv64 = "riscv64"
> @@ -17,3 +21,13 @@ TUNE_ARCH_tune-riscv32 = "riscv32"
>  TUNE_PKGARCH_tune-riscv32 = "riscv32"
>  PACKAGE_EXTRA_ARCHS_tune-riscv32 = "riscv32"
>
> +# No float
> +TUNE_FEATURES_tune-riscv64nf = "${TUNE_FEATURES_tune-riscv64} riscv64nf"
> +TUNE_ARCH_tune-riscv64nf = "riscv64"
> +TUNE_PKGARCH_tune-riscv64nf = "riscv64"
> +PACKAGE_EXTRA_ARCHS_tune-riscv64nf = "riscv64"
> +
> +TUNE_FEATURES_tune-riscv32nf = "${TUNE_FEATURES_tune-riscv32} riscv32nf"
> +TUNE_ARCH_tune-riscv32nf = "riscv32"
> +TUNE_PKGARCH_tune-riscv32nf = "riscv32"
> +PACKAGE_EXTRA_ARCHS_tune-riscv32nf = "riscv32"

this is not right. rv32 with float-abi wont execute on rv with soft float abi.

> --
> 2.24.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

