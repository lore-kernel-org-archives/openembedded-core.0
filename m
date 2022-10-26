Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE9BEECDFA1
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 00:41:49 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web08.1917.1666744905934982219
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Oct 2022 17:41:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mjDXA6kW;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id a13-20020a9d6e8d000000b00668d65fc44fso921598otr.9
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Oct 2022 17:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vtcr6w6mViQOVf/4ll5r5Vlnpc9k3DDsGYbZxKy331M=;
        b=mjDXA6kWBncBwtd/+otZf1EKvjmY9quASWVJvIjyjSfmiAmpJVx0Yj15D+V3nqPBxB
         UqCplfRYuUj/np+ee5sW3fL1DOnjmNgEkoZILZ7qKS1cYaEg2AP79i34X/5Jdy2BBqUS
         p/UBum/XnOV37iPh0e9qRRNIXTg6VCmRIy+dm8GySmcMr0pX0pLnAfmXl9i02wmt1AZh
         wGZTELpfBO0kKjIysD1mtIX+hFNhNWkZr1ku5Ix47PYubm6atL8rnmdGEoedvmgiGI8F
         2Ly1e40fNTwq/R/deNKGdRfQW1XWhAayMeNGJmTbeF/oI7jf8tkfiEXrC/+KkrrsmaFV
         JyNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vtcr6w6mViQOVf/4ll5r5Vlnpc9k3DDsGYbZxKy331M=;
        b=iuxsd6vx7W3KHFLDe2PjHBdZTcVZPJJn442WcsqOAygQyq4tpfVNT4tIY3fMuq4Ze1
         g0gpvDKVGURzbsII9swUXlNXFIJoYHMoiiB8AMEx4QkTrlj12dj9qXI8NqaCPJCLE0XT
         VklCmls/u00vxfctlyukOm5f3QirDdjqhbtK3O+cb8KYNqoUIbLsc0yM5k20qLdaa/NQ
         v+LANvoLW97xrPXEwWMFhz3PXd4JSVz7WmpmeU0Ymel13POE5/OnCtvHywmcn++wUaP3
         KDBlam94FN9lkfonYiYuMYfKE4+njjpwoYIk1Ji3ndJKz6AuvlIyIlZ0PR6x6BMXLZEg
         rGuA==
X-Gm-Message-State: ACrzQf0iFKGULOieLSTpwy7Wh1q5b4XR/vf+8t43JNzmsMeizfh134Z7
	1cU//tNXSKg3UjDD7ziLBSJLOS8qmLtrYbBC2SY=
X-Google-Smtp-Source: AMsMyM5wAtBRNKGDYs3ZsWS7nq8VXB1TWmJo6ZiPE/GQtEXewbKkwa+shkMyjOYLzYnG0RNP/u2Arp84AQhyW8pQDdc=
X-Received: by 2002:a9d:74c6:0:b0:661:c309:f0cf with SMTP id
 a6-20020a9d74c6000000b00661c309f0cfmr19764938otl.55.1666744905124; Tue, 25
 Oct 2022 17:41:45 -0700 (PDT)
MIME-Version: 1.0
References: <20221025184427.399850-1-alex@linutronix.de>
In-Reply-To: <20221025184427.399850-1-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Oct 2022 17:41:19 -0700
Message-ID: <CAMKF1sqTPNKL00Fc5a5b66mp9+Y_UOKBfogK-PL4tp4egW1NHw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] rust-target-config: match riscv target
 names with what rust expects
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 00:41:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172143

On Tue, Oct 25, 2022 at 11:44 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Official rust risc-v targets are prefixed with riscv32gc- and riscv64gc-:
> https://doc.rust-lang.org/nightly/rustc/platform-support.html
>
> Particularly crossbeam-utils make important build time decisions
> for atomics based on those names, and so we need to match ours
> with official targets.
>
> On the other hand, the actual definitions for those targets do not
> use the 'gc' suffix in 'arch' and 'llvm-target' fields, and so we
> need to follow that too, to avoid cryptic mismatch errors from rust-llvm:
> https://github.com/rust-lang/rust/blob/master/compiler/rustc_target/src/spec/riscv32gc_unknown_linux_gnu.rs
>

This approach seems good to me. I wonder if rust_sys_to_llvm_target
would be problematic
for vardep calculations on native targets.

> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  .../classes-recipe/rust-target-config.bbclass | 40 ++++++++++++-------
>  meta/lib/oe/rust.py                           |  2 +
>  2 files changed, 28 insertions(+), 14 deletions(-)
>
> diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
> index 9e1d81bf5c..2710b4325d 100644
> --- a/meta/classes-recipe/rust-target-config.bbclass
> +++ b/meta/classes-recipe/rust-target-config.bbclass
> @@ -231,19 +231,19 @@ TARGET_POINTER_WIDTH[powerpc64le] = "64"
>  TARGET_C_INT_WIDTH[powerpc64le] = "64"
>  MAX_ATOMIC_WIDTH[powerpc64le] = "64"
>
> -## riscv32-unknown-linux-{gnu, musl}
> -DATA_LAYOUT[riscv32] = "e-m:e-p:32:32-i64:64-n32-S128"
> -TARGET_ENDIAN[riscv32] = "little"
> -TARGET_POINTER_WIDTH[riscv32] = "32"
> -TARGET_C_INT_WIDTH[riscv32] = "32"
> -MAX_ATOMIC_WIDTH[riscv32] = "32"
> -
> -## riscv64-unknown-linux-{gnu, musl}
> -DATA_LAYOUT[riscv64] = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
> -TARGET_ENDIAN[riscv64] = "little"
> -TARGET_POINTER_WIDTH[riscv64] = "64"
> -TARGET_C_INT_WIDTH[riscv64] = "64"
> -MAX_ATOMIC_WIDTH[riscv64] = "64"
> +## riscv32gc-unknown-linux-{gnu, musl}
> +DATA_LAYOUT[riscv32gc] = "e-m:e-p:32:32-i64:64-n32-S128"
> +TARGET_ENDIAN[riscv32gc] = "little"
> +TARGET_POINTER_WIDTH[riscv32gc] = "32"
> +TARGET_C_INT_WIDTH[riscv32gc] = "32"
> +MAX_ATOMIC_WIDTH[riscv32gc] = "32"
> +
> +## riscv64gc-unknown-linux-{gnu, musl}
> +DATA_LAYOUT[riscv64gc] = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
> +TARGET_ENDIAN[riscv64gc] = "little"
> +TARGET_POINTER_WIDTH[riscv64gc] = "64"
> +TARGET_C_INT_WIDTH[riscv64gc] = "64"
> +MAX_ATOMIC_WIDTH[riscv64gc] = "64"
>
>  # Convert a normal arch (HOST_ARCH, TARGET_ARCH, BUILD_ARCH, etc) to something
>  # rust's internals won't choke on.
> @@ -258,9 +258,21 @@ def arch_to_rust_target_arch(arch):
>          return "arm"
>      elif arch == "powerpc64le":
>          return "powerpc64"
> +    elif arch == "riscv32gc":
> +        return "riscv32"
> +    elif arch == "riscv64gc":
> +        return "riscv64"
>      else:
>          return arch
>
> +# Convert a rust target string to a llvm-compatible triplet
> +def rust_sys_to_llvm_target(sys):
> +    if sys.startswith('riscv32gc-'):
> +        return sys.replace('riscv32gc-', 'riscv32-', 1)
> +    if sys.startswith('riscv64gc-'):
> +        return sys.replace('riscv64gc-', 'riscv64-', 1)
> +    return sys
> +
>  # generates our target CPU value
>  def llvm_cpu(d):
>      cpu = d.getVar('PACKAGE_ARCH')
> @@ -334,7 +346,7 @@ def rust_gen_target(d, thing, wd, arch):
>
>      # build tspec
>      tspec = {}
> -    tspec['llvm-target'] = rustsys
> +    tspec['llvm-target'] = rust_sys_to_llvm_target(rustsys)
>      tspec['data-layout'] = d.getVarFlag('DATA_LAYOUT', arch_abi)
>      if tspec['data-layout'] is None:
>          bb.fatal("No rust target defined for %s" % arch_abi)
> diff --git a/meta/lib/oe/rust.py b/meta/lib/oe/rust.py
> index 1dc9cf150d..185553eeeb 100644
> --- a/meta/lib/oe/rust.py
> +++ b/meta/lib/oe/rust.py
> @@ -8,4 +8,6 @@
>  def arch_to_rust_arch(arch):
>      if arch == "ppc64le":
>          return "powerpc64le"
> +    if arch in ('riscv32', 'riscv64'):
> +        return arch + 'gc'
>      return arch
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172141): https://lists.openembedded.org/g/openembedded-core/message/172141
> Mute This Topic: https://lists.openembedded.org/mt/94565465/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

