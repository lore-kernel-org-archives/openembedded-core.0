Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 10ACB7C0C6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 18:34:41 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id t13so22462933qtn.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 10:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Wt2CCv8XyhBAFKbHj5HyGDkD08tZdb4ZnrqDL2H10UY=;
	b=InSW6YT44lUVSP9KtMUbd73zA7k1GdqiEKwK6DsREmFWmbQ3mCTCsC50C6ykrj/o9g
	Cwu3vimzuMES39NOyZtopPAcaV4m3HW3iTlyvLcFjQ77yjwosICyHx32NQKXxrtCPG3A
	9SdU2DC/1EujC87xSaHabg1A7J/WpnB+9dYuSvjYqJ//muDspGB+xc90IB7/PJqKN5Hk
	rzmIRZfQEkmrV4MRIwpAr78C3hJ2Axk1+vdp24ntpLOrfk0nmGQglD7pn9AoZMopAG6V
	Ge9/wBpQF/iFcQSSnYaeuBP5j65US9jxeMjIs71+KwfxKmSi99yptRTf5LwharMzgSE2
	m1rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Wt2CCv8XyhBAFKbHj5HyGDkD08tZdb4ZnrqDL2H10UY=;
	b=F9ioW2Q1JZR+3UvyC/5LPZtGU7ka721QoT43ggBtjY8vAMNi8luQsfdUUH5epVGusB
	8e9ckwBib8+xrUteqJA9KrlNV7Fokw2mgBjx2vnMUj/g9XskUso+Ssli7YAiYjTgqLbC
	c62U46yHyvt6wXdi4jm6hZ1IOUJHIGb1+q6U8C7EFK5krfdtSvh8BMkvAQpRvQk8aeT2
	W3cDV3ORypcWZJtapolUUbAuXNqK5w42KMbLkx3iX/KZPhA3fwwSEwjt79x+QYKR0p0B
	CB+w7jlzAFR/ZOG8CfQQsM5wimk1dAwFVKgIW4XyiwBvC1fVLwYfuyoLf0cbhOcZ8v8d
	g0tQ==
X-Gm-Message-State: AJcUukf907FbgMGZZJCC/yu+diAISYnf6p0F2sEOBLBPADrh5ENTYdzC
	6/X0Tp7u17o6ifoOYYn+Ufx2mOWiuuqpzW8llMM=
X-Google-Smtp-Source: ALg8bN5JZAuoKsJ1K+lDWgE/r5DgexUnu9cbXBsgLLCUldG4hOfgEf29+ono9EpsZPVqxm1Rq2pu65lsu5YqsT4B1Ro=
X-Received: by 2002:ac8:36ba:: with SMTP id a55mr17984447qtc.236.1547318082730;
	Sat, 12 Jan 2019 10:34:42 -0800 (PST)
MIME-Version: 1.0
References: <cover.1547316462.git.bruce.ashfield@windriver.com>
	<a5bbd32ecd957f036a9b1e47cc4e3c813d206111.1547316462.git.bruce.ashfield@windriver.com>
In-Reply-To: <a5bbd32ecd957f036a9b1e47cc4e3c813d206111.1547316462.git.bruce.ashfield@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 12 Jan 2019 10:34:16 -0800
Message-ID: <CAMKF1sokO=RakSBuZy-o4cMBB5EYzDrEJ+R7ZtfzyddNaxqKQw@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] linux-yocto/4.19: introduce qemuriscv64 and qemuarma15 BSP definitions
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
X-List-Received-Date: Sat, 12 Jan 2019 18:34:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 12, 2019 at 10:14 AM Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
>
> Incorporating the BSP definitions for two new qemu targets.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Jon Mason <jdmason@kudzu.us>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb   |  4 ++--
>  meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb |  6 +++---
>  meta/recipes-kernel/linux/linux-yocto_4.19.bb      | 18 +++++++++---------
>  3 files changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> index cdcdff2e1746..f823683526ee 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> @@ -11,8 +11,8 @@ python () {
>          raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
>  }
>
> -SRCREV_machine ?= "bd456d13d8bea4c416209a59f9e0bf50f8511c47"
> -SRCREV_meta ?= "ced14887c323f1cb6b3befe2b29e471e8fee1bc6"
> +SRCREV_machine ?= "78404e3a73613f8e07c276e55112989f897cdd04"
> +SRCREV_meta ?= "096c8bd3bd11801f95683bbe4bcc885a2318f51d"
>
>  SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
>             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
> index 89c4b9f14d4c..0a79f442a075 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
> @@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
>  KMETA = "kernel-meta"
>  KCONF_BSP_AUDIT_LEVEL = "2"
>
> -SRCREV_machine_qemuarm ?= "b8f2e8e00f8ddbdf5d7d7614c14eab52f8ee9275"
> -SRCREV_machine ?= "e727c70583a78cf1dc53e8e219722e2f9d1bc858"
> -SRCREV_meta ?= "ced14887c323f1cb6b3befe2b29e471e8fee1bc6"
> +SRCREV_machine_qemuarm ?= "2594d14d76ae2c49ad43b626662fe53da807ddca"
> +SRCREV_machine ?= "1114697c04b9699112e78dd8fc6ec849609ca1cb"
> +SRCREV_meta ?= "096c8bd3bd11801f95683bbe4bcc885a2318f51d"
>
>  PV = "${LINUX_VERSION}+git${SRCPV}"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
> index bf4fec71d86c..f410cc8cdb31 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
> @@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "v4.19/standard/base"
>  KBRANCH_qemux86-64 ?= "v4.19/standard/base"
>  KBRANCH_qemumips64 ?= "v4.19/standard/mti-malta64"
>
> -SRCREV_machine_qemuarm ?= "ec8e55a97ad8a88107c5af069ece1b7f203f4ac4"
> -SRCREV_machine_qemuarm64 ?= "e727c70583a78cf1dc53e8e219722e2f9d1bc858"
> -SRCREV_machine_qemumips ?= "3b5fba0207a870c1de76c5dd80d8d3c0e42aa1cf"
> -SRCREV_machine_qemuppc ?= "e727c70583a78cf1dc53e8e219722e2f9d1bc858"
> -SRCREV_machine_qemux86 ?= "e727c70583a78cf1dc53e8e219722e2f9d1bc858"
> -SRCREV_machine_qemux86-64 ?= "e727c70583a78cf1dc53e8e219722e2f9d1bc858"
> -SRCREV_machine_qemumips64 ?= "d21ff98864241c971c7a42a3c4f1eb940b9b8855"
> -SRCREV_machine ?= "e727c70583a78cf1dc53e8e219722e2f9d1bc858"
> -SRCREV_meta ?= "ced14887c323f1cb6b3befe2b29e471e8fee1bc6"
> +SRCREV_machine_qemuarm ?= "8b378ac8aca51207085c8df616a6fe56af19f0b4"
> +SRCREV_machine_qemuarm64 ?= "1114697c04b9699112e78dd8fc6ec849609ca1cb"
> +SRCREV_machine_qemumips ?= "58f59c2213a657515a158379db153ad618986235"
> +SRCREV_machine_qemuppc ?= "1114697c04b9699112e78dd8fc6ec849609ca1cb"
> +SRCREV_machine_qemux86 ?= "1114697c04b9699112e78dd8fc6ec849609ca1cb"
> +SRCREV_machine_qemux86-64 ?= "1114697c04b9699112e78dd8fc6ec849609ca1cb"
> +SRCREV_machine_qemumips64 ?= "6f56a58c214379efe8949da6921b1c00c2af353a"
> +SRCREV_machine ?= "1114697c04b9699112e78dd8fc6ec849609ca1cb"
> +SRCREV_meta ?= "096c8bd3bd11801f95683bbe4bcc885a2318f51d"

Dont we need qemuriscv64 locks here too ?

>
>  SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
>             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
> --
> 2.5.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

