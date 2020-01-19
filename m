Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id EE5947FC0D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2020 18:38:39 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id g17so27283378wro.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2020 10:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=/XszDexXKX4VwEGOY8yfpP+slka3jQYTG3ptgd+BVRM=;
	b=Qe9gT8qsaG9UwkH9s0OzJTgxyCsULYamISEzyFZPGEVo3KrGYEoZ7fcsh9IAVtPd2Q
	pdOado+sNSCr1AjbnwVyLLsycgNUNKMr82+NxFwEN4DyYHxdW9fWKRrVFoexoQGD975Q
	611f4Cw9Qti1qT/lUyHT7mPqA+ZCVUQeuShqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=/XszDexXKX4VwEGOY8yfpP+slka3jQYTG3ptgd+BVRM=;
	b=pwQg2QSp1NOMcS9D+jpUB0L1KbZeJoOY1Mfxsyh/nuk4X6BrPMbvmByT0J7y/59EpG
	ZgVdUqY6TgTQNsAUUTrjxKppSSfYVluKWR/eN9SYFEmZAGlziE3Xrm1PXaHp0Xm60w5+
	/dVXd2y9fFK/HrqRN+dqW8ZipoUseG2WDITL2fz6hxqys1PucMpxfPc/ZtuhPhQm+9xW
	yBhd1gOyFmIjDFHw6N08L2I986YjiEC41BcN5lruj2EsakZVHbMt6x4J9nlmzh46atZT
	rmD3xI5DpOi3SliRD1vqSTgOahF/qSGeABS32g+fGI0nbYC/WNCFTHhDemSSpAU06YA9
	RbPw==
X-Gm-Message-State: APjAAAUoFuuXv8qCrCVjwxIH2a7eu60/fQBEAQ7DhWQ7kJ4zaMmfzcYa
	0u9tnX73bO9kE0hdHdbm+BeeHA==
X-Google-Smtp-Source: APXvYqwllMr1BCj9HqiJMX/gPpmiPz+VASwkolPCXYZnMx3HbHhu8G19h2I/ZJdfa4XC0nw/TlFwrg==
X-Received: by 2002:adf:f6c8:: with SMTP id y8mr14162471wrp.167.1579459120491; 
	Sun, 19 Jan 2020 10:38:40 -0800 (PST)
Received: from hex.config (5751ab90.skybroadband.com. [87.81.171.144])
	by smtp.gmail.com with ESMTPSA id
	o15sm44763842wra.83.2020.01.19.10.38.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 19 Jan 2020 10:38:39 -0800 (PST)
Message-ID: <f0138e477cd9e9d7f7eac4836974aaa8857ff288.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Sun, 19 Jan 2020 18:38:37 +0000
In-Reply-To: <20200119100615.2057319-1-raj.khem@gmail.com>
References: <20200119100615.2057319-1-raj.khem@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] qemu: Enable ppc64le support for qemu-usermode
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
X-List-Received-Date: Sun, 19 Jan 2020 18:38:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-01-19 at 02:06 -0800, Khem Raj wrote:
> glibc defines minimum kernel needed to be 3.10.0 for LE ppc64
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/classes/qemu.bbclass           | 3 +++
>  meta/conf/bitbake.conf              | 1 +
>  meta/recipes-devtools/qemu/qemu.inc | 2 +-
>  3 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
> index f5c5780125..55bdff816b 100644
> --- a/meta/classes/qemu.bbclass
> +++ b/meta/classes/qemu.bbclass
> @@ -16,6 +16,8 @@ def qemu_target_binary(data):
>          target_arch = "ppc"
>      elif target_arch == "powerpc64":
>          target_arch = "ppc64"
> +    elif target_arch == "powerpc64le":
> +        target_arch = "ppc64le"
>  
>      return "qemu-" + target_arch
>  
> @@ -62,3 +64,4 @@ QEMU_EXTRAOPTIONS_ppc64e5500 = " -cpu e500mc"
>  QEMU_EXTRAOPTIONS_ppce6500 = " -cpu e500mc"
>  QEMU_EXTRAOPTIONS_ppc64e6500 = " -cpu e500mc"
>  QEMU_EXTRAOPTIONS_ppc7400 = " -cpu 7400"
> +QEMU_EXTRAOPTIONS_powerpc64le = " -cpu POWER8"
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index ce89b80ade..2da7c5849a 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -430,6 +430,7 @@ SDKPATHNATIVE = "${SDKPATH}/sysroots/${SDK_SYS}"
>  OLDEST_KERNEL = "3.2.0"
>  OLDEST_KERNEL_aarch64 = "3.14"
>  OLDEST_KERNEL_nios2 = "3.19"
> +OLDEST_KERNEL_powerpc64le = "3.10.0"
>  OLDEST_KERNEL_riscv32 = "4.15"
>  OLDEST_KERNEL_riscv64 = "4.15"
>  
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-
> devtools/qemu/qemu.inc
> index dff5762b80..eb9f060997 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -59,7 +59,7 @@ do_install_ptest() {
>  }
>  
>  # QEMU_TARGETS is overridable variable
> -QEMU_TARGETS ?= "arm aarch64 i386 mips mipsel mips64 mips64el ppc
> ppc64 riscv32 riscv64 sh4 x86_64"
> +QEMU_TARGETS ?= "arm aarch64 i386 mips mipsel mips64 mips64el ppc
> ppc64 ppc64le riscv32 riscv64 sh4 x86_64"
> 


https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/1482

(and most other builds unfortunately)

Cheers,

Richard


