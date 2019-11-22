Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
	[209.85.217.68])
	by mail.openembedded.org (Postfix) with ESMTP id B17577FC80
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2019 00:33:40 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id k15so3657360vsp.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 16:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=soShk39n0usGMS8eXLkfl0JCmPcTvoBHDmuxOkF+aE4=;
	b=HczxXHCVP/ZbTDxA0hXiQyJUEbAM6jQFaqOqm092DrmQKxN8+UIC+5G9y/juovAgkp
	ofAn8NNUbD61COwDnVcDdjEVyUi0DN6aShxQuwShlNmF3VZUpB4A5bALE8nDVSlWbfnu
	MmrADf+ZJ/EMnKOCrJMK2dO9Udq7f4ybnihzV+b4dxv4OwN3TdEr6EDCIm+gopnr8UdR
	ObqvlErcwYRfmBUwBgPWAfqKQPLZwgykPGmnvduh4DKfiTowwuWsZwMjNoIjXBicYD6k
	xdCKU/HgAz0TPmutCA5MYHF96rqvguKXSUZodR6hPTATvEuiG02jBpQSoW4jxY15ImHG
	Wiqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=soShk39n0usGMS8eXLkfl0JCmPcTvoBHDmuxOkF+aE4=;
	b=AiQpdsL7T/3mOof6TCl05moMPMtGgEKVGZS9FiRZ+DVki5KfDC0tAi8lyGrhm/8CK6
	+JonyqBqibspLIpegFFK1F1u8z1bsU8qy3ekDvPizd9UdJiLQ1/hiH9h07xyBKfpqLpo
	QDg5cbbd345IZgCCbMpi0qiKjcyvxoxjSNFdu8i8+Il/eAICvKmWZBEhDH5EVQiC7XX6
	4kHE04DvWW6yBIlZ8BlEuSMenzLFELbbvGCRtjVmCxQvg4fnTuNhEfPYun+mtxcsSj7A
	8kdxXkS/sF1/6gdh9eZm3Rs3qviyzwCIN6Apx0WZ/zlvJANDvpNXJbYuovKdzp7cPK1f
	gzcw==
X-Gm-Message-State: APjAAAVz63pebOpR3oFpBkMpjhbUrRMFxLVOnyKWDEP0oY+KCnqhvgsV
	Nc/2B/X+Z3SIVzVwCML2l1n0zNMO8OKmq46ecPE2NmYB
X-Google-Smtp-Source: APXvYqxgp1ZkQ5q5fFALiyUtFABft45BlCZ56Sr/8qCV9PDcp+GeRo8xK+S4yeYWAKmntTBK0RsDkipsyiPd4VzuZvw=
X-Received: by 2002:a05:6102:835:: with SMTP id
	k21mr8233821vsb.11.1574382821278; 
	Thu, 21 Nov 2019 16:33:41 -0800 (PST)
MIME-Version: 1.0
References: <20191122000251.28530-1-alistair.francis@wdc.com>
In-Reply-To: <20191122000251.28530-1-alistair.francis@wdc.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 21 Nov 2019 16:33:29 -0800
Message-ID: <CAJ86T=UfrtbT4n3JYfiLVCEi86Ua5EeYLzvrFsgJBDUcqFmQgQ@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 22 Nov 2019 00:33:41 -0000
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

This seems to be saying that a riscv64nf machine can also use riscv64 packages.

Should that be the other way around (ie riscv64 machine can also use
riscv64nf packages)?

(I thought there was a sanity check somewhere to check that
PACKAGE_EXTRA_ARCHS_tune-foo must at least contain "foo", ie a
particular tune must be able to use it's own packages. I don't
remember how or when that's triggered though... maybe it's ARM
specific?).

> +TUNE_FEATURES_tune-riscv32nf = "${TUNE_FEATURES_tune-riscv32} riscv32nf"
> +TUNE_ARCH_tune-riscv32nf = "riscv32"
> +TUNE_PKGARCH_tune-riscv32nf = "riscv32"
> +PACKAGE_EXTRA_ARCHS_tune-riscv32nf = "riscv32"
> --
> 2.24.0

