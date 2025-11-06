Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 500A4CCFA13
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 21:29:32 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9116.1762464567909336429
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Nov 2025 13:29:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=S+MCw8lt;
 spf=pass (domain: smile.fr, ip: 209.85.167.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5945510fd7aso71611e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 13:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1762464566; x=1763069366; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Svdl1qOuGfubmkMSOyBFoOfE9FeCg6GA97ocKFErLpA=;
        b=S+MCw8lt5T/ojlH2RZT7siXxFL7OjmiQdDZN+xC6KpeLG4bwW/l3Dz9JF93IsM/5a6
         NasDPGOsLXarpxzQtqgRmtnCv/vyDURsKxEzgmfZlY7MfmBf+caRUwPMsafakscUhk6n
         Z7xhWnfR2gLxCTihPN+sO4IGWgGyWntPyFy7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762464566; x=1763069366;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Svdl1qOuGfubmkMSOyBFoOfE9FeCg6GA97ocKFErLpA=;
        b=lzJ5pweCxw72xzfE3QRS8mUZMkQZ+d++ZJqZRLdbVO8QNk7QNqrrQ4z9IY5cfA1a/U
         13uMa75VomEPjoSfJPu5D+2bdTT9ImGg1Y5+ryhTvhcIhQiiJYpK8cMF5PjrI/dbPQAl
         IwNKj24toZr1UbyFpNTU4NECzaInv8Sw0ShMH8oE4Opq9zEwl1igjFxPMIybx1QFXPPV
         CuUFqZlYY/8IQLz+ZpOsVMOdnNezslBzjmzrmPdt3GhxwUtYxlESyEby28m8WXe4O+BQ
         XY7h+tIe56zlAtzAzps+E+xdbQo/XL5npmjf0poSca22YvMbK0wZYs9YvwgCSUn4l/mC
         Jk7Q==
X-Forwarded-Encrypted: i=1; AJvYcCW1vL0HY1AYZHL3srpG99VSh+Z682DmAiGo2Izlean8RX75eHyY0F0JHAHid6XkpKxET0sChV1i0rdC0gbZ76xDqw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzP9rCgwCudBGlY2+AfY6QSUZ5SFvsnn7278zjJexKKUREoqLvB
	nkB9Opo6jPSKP5lZumeSah+txvYPnkgDM0gLsYgWGZO7C7gK6WArfrNJD7DnTwkBcVU=
X-Gm-Gg: ASbGnctANnT85xU+yeRIlF04NlGO5wtCC7CFO4els9/HWzGqcYcbiMUPFzJZLSiyYte
	GGS4H9N3aiTwbeSkNEme2ZhQZHVKPhO5rrj4H0u0J0Ms2IiS8f/AmlKPXi5CgNFNFOXah57Wkt9
	mDK2zv7BhbLEuW8inuqdAnwgoXVSOQlW7G+JAIa4H1JCxNyer8FR0uzSUJwhulaSR3JP7g/weV2
	1K0ur+/+7fuuLBkbSQM1lhwLLdrpWuypU2yKngTIC0lMhXhKqM7MZwgXKiaNYhtjgvvHJT/7t8o
	UuKZcsrlyOIPqC+YXx4Z+w63JvPKOX4alG+oGBuuumY2EoMhWZCTETRmSvpTQwzmZ6FqYXTxauM
	EeeSfxt60RdkCPMkknCVH8tWRnjqj+99lJYs31+ZMRNOdcs+m/JrNZPtpXdMZv8StTRXEq9rNkS
	rdzUWkJuAUx8LVuFcL8pFoJfBUojcmVWhTibOMAc5Jswsz8OJEXVduArffue0+Y1j2tcVs/xxyT
	IaWPRRXBhun1atlbtXg/5QxxHiG3ZpcC82a+uVXdWM=
X-Google-Smtp-Source: AGHT+IGL2jCtcwJLTKeyNiw5bwxk+NRcVUGNbKk55IAjkK42ZcrHvpvs4JUAxEL8U2TF1/9dXspMXg==
X-Received: by 2002:a05:6512:4028:b0:594:2f72:2f73 with SMTP id 2adb3069b0e04-59456b6b034mr182946e87.25.1762464565604;
        Thu, 06 Nov 2025 13:29:25 -0800 (PST)
Received: from ?IPV6:2a01:cb00:1331:aa00:328f:d57b:7553:b0cf? (2a01cb001331aa00328fd57b7553b0cf.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:328f:d57b:7553:b0cf])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a0b74b6sm977333e87.64.2025.11.06.13.29.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 13:29:24 -0800 (PST)
Message-ID: <679504b4-60de-4551-acb9-65a6ec296873@smile.fr>
Date: Thu, 6 Nov 2025 22:29:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH RFC v2 0/8] Enable rust support for linux kernel
To: Harish.Sadineni@windriver.com, openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, bruce.ashfield@gmail.com,
 sundeep.kokkonda@windriver.com, elmehdi.younes@smile.fr
References: <20251105130942.833204-1-Harish.Sadineni@windriver.com>
From: Yoann Congal <yoann.congal@smile.fr>
Content-Language: en-US, fr
Organization: Smile ECS
In-Reply-To: <20251105130942.833204-1-Harish.Sadineni@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 21:29:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226005

Hello,

Le 05/11/2025 à 14:09, Sadineni, Harish via lists.openembedded.org a écrit :
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
> 
> v2: 
>  - Addressed Bruce review comments for Making rust support for linux kernel as optional via distro feature.
>  - Fixed buildpaths errors by appending --remap-path-prefix to RUST_DEBUG_REMAP
>  - Removed unnecessary flags from rust.cfg 
> 
> This patch series introduces Rust support into the linux-yocto kernel recipe
> and related build infrastructure in the Yocto Project. The goal is to enable
> building the Linux kernel with Rust components and provide support for
> building kernel module which is written in rust inside sdk.
> 
> Summary of changes:
> 
> - Patch 1: Extend 'bindgen-cli' to support 'nativesdk', allowing it to be available in the SDK environment.
> - Patch 2: Add required dependencies ('clang-native', 'rust-native', 'bindgen-cli-native') to the kernel to support Rust binding generation.
> - Patch 3: Install the Rust standard library source ('library/') into `work-shared` and which will be later copied to
>            linux-yocto recipe-sysroot-native.
> - Patch 4: Stage the Rust sources into `recipe-sysroot-native` for kernel build compatibility, making them visible during native builds.
> - Patch 5: Update `kernel-yocto.bbclass` to invoke `make rustavailable` during 'do_kernel_configme', ensuring Rust readiness.
> - Patch 6: Add kernel configuration support for Rust (via 'rust.cfg' and 'rust.scc'), enabling the Rust build options in kernel config.
> - Patch 7: Fixed buildpaths errors when rust is enabled for kernel by appending --remap-path-prefix to RUST_DEBUG_REMAP 
> - patch 8: Copy Rust kernel sources into kernel-devsrc build directory which will be required while running 'make prepare' in sdk.
> 
> Harish Sadineni (8):
>   bindgen-cli: extend BBCLASSEXTEND to include nativesdk
>   linux-yocto: add clang-native,rust-native and bindgen-cli-native to
>     DEPENDS
>   rust: install Rust library sources for 'make rustavailable' support
>   rust: stage rustlib sources for linux-yocto make rustavailable support
>   kernel-yocto: add rust support via make rustavailable in
>     do_kernel_configme
>   linux-yocto: enable Rust support in kernel configuration
>   kernel-yocto: Fix for buildpaths errors when rust is enabled for
>     kernel
>   kernel-devsrc: copying rust-kernel soucre to $kerneldir/build
> 
>  meta/classes-recipe/kernel-yocto.bbclass         | 16 ++++++++++++++++
>  .../bindgen-cli/bindgen-cli_0.72.1.bb            |  2 +-
>  meta/recipes-devtools/rust/rust_1.90.0.bb        | 12 ++++++++++++
>  meta/recipes-kernel/linux/files/rust.cfg         |  9 +++++++++
>  meta/recipes-kernel/linux/files/rust.scc         |  1 +
>  meta/recipes-kernel/linux/kernel-devsrc.bb       |  4 ++++
>  meta/recipes-kernel/linux/linux-yocto.inc        |  9 +++++++++
>  meta/recipes-kernel/linux/linux-yocto_6.16.bb    |  3 +++
>  8 files changed, 55 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-kernel/linux/files/rust.cfg
>  create mode 100644 meta/recipes-kernel/linux/files/rust.scc
I made some comments inline in the patches.

I've tested the series with the rust samples inside the kernel sources:
In a basic(*) Yocto/Poky master build:

In local.conf:
  DISTRO_FEATURES:append = ' rust-kernel'
  CORE_IMAGE_EXTRA_INSTALL += "kernel-module-rust-minimal"

Then,
  bitbake core-image-minimal
  runqemu kvm snapshot nographic serial
  root@qemux86-64:~# modprobe rust_minimal
  [    9.394264] rust_minimal: Rust minimal sample (init)
  [    9.394915] rust_minimal: Am I built-in? false
=> Samples are working. Nice!


(*) I lied, my setup is not entirely basic: I use ccache.
With ccache, I get this error:
| error: multiple input filenames provided (first two filenames are gcc and .../tmp/work-shared/qemux86-64/kernel-source/scripts/generate_rust_target.rs)
So I had to add in local.conf:
CCACHE_DISABLE:pn-linux-yocto = "1"

Can you integrate in your patch series the fix El Mehdi did for this?
In meta/recipes-kernel/linux/linux-yocto.inc, he added
+# TODO: Kernel rust code compilation breaks under ccache, disable it for now
+CCACHE_DISABLE ?= "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', '1', '', d)}"

Obviously, we will need to investigate why that break and fix it but in
the meantime, that mean that your RFC is testable in more configuration

Thanks!

Regards,
-- 
Yoann Congal
Smile ECS


