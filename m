Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id B0AC96014F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 13:30:38 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id n1so6982004pfn.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 06:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=La3w5frcLm/9lsAyIkgLOmYQzS8CgL9myhLx+KKdpiU=;
	b=O9Vr9Nr+Fn7r0uSyKEoy/9yMYCkqFa/nrNWQd/mDsM+3uGqhEsOnuMdqeO2vVVrQIM
	GOEDVfikkMHzxN7eHvPnW7iErD3Vfj+m3FEmW6Eeyv8xSXj8T5xreQOFJx/lZNrvcljD
	d2Kzcyk1ftE4RxYFT2czLkAgzmInM87EhOxCgBydDWRTMiuD+gme1JypSjWCM9RcMC6l
	Bgj832PRzR6JgzPCOGPYQt9Iz6oVbZcfS70zeEtcr+O1kXq4YiFGERxFwCB0e17BJOIl
	5nzqow9pGp/wFm9pTKKb5HKrnbycHMRMwNBkaL3ctXiTph6/AdYfD+CbYcBcO5gp9xD/
	vvHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=La3w5frcLm/9lsAyIkgLOmYQzS8CgL9myhLx+KKdpiU=;
	b=ZNtlgycWf80j0N+vhQPZCBhff6lbcomcyjOiLh3ZS+z23dXONEi0eeye4CoPQwOW9K
	AYWUXo6nmauuF5qdXjdgJp+w/SVhiyntyEpAasdqs/IUOy4YxbRJ023uq8Ru+HzZRUGX
	Xs+KZBZvvy0BsIVgKtVGOimAHDziunB5DkJ+u38eYCZmP5pNIxcPoB6IOzrNY9T20X1B
	fk0yi+425D2p/GvAvP7l4tiHpQD6gPFUw+u5t6/D65IB6NJJZmHGDh518IxznQlBabMH
	tdIp/McKbUB41OTRNPNUUp8J7dDaJdRCei66jCxcgkR33IJFLAZbuPd6NwWjZpFynv/4
	OP8g==
X-Gm-Message-State: AOPr4FVCiBrxh6S7KNDx6tldcSTjbLDQe0cGvCyXeOut4EaQ4YdTZfXqs0Vk9q3V2hm1OQ==
X-Received: by 10.98.33.144 with SMTP id o16mr4144117pfj.108.1461072638963;
	Tue, 19 Apr 2016 06:30:38 -0700 (PDT)
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com.
	[209.85.220.53]) by smtp.gmail.com with ESMTPSA id
	ee5sm4026285pac.35.2016.04.19.06.30.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Apr 2016 06:30:37 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f53.google.com with SMTP id zm5so6829855pac.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 06:30:37 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.66.235.9 with SMTP id ui9mr4010160pac.135.1461072637075;
	Tue, 19 Apr 2016 06:30:37 -0700 (PDT)
Received: by 10.66.231.37 with HTTP; Tue, 19 Apr 2016 06:30:37 -0700 (PDT)
In-Reply-To: <1461070003-12494-2-git-send-email-yannick.gicquel@iot.bzh>
References: <1461070003-12494-1-git-send-email-yannick.gicquel@iot.bzh>
	<1461070003-12494-2-git-send-email-yannick.gicquel@iot.bzh>
Date: Tue, 19 Apr 2016 10:30:37 -0300
X-Gmail-Original-Message-ID: <CAP9ODKprhOzhzVyb4Z_vRChr-WzAo1uuEm4Rd1-_PwAHEx_efA@mail.gmail.com>
Message-ID: <CAP9ODKprhOzhzVyb4Z_vRChr-WzAo1uuEm4Rd1-_PwAHEx_efA@mail.gmail.com>
To: Yannick Gicquel <yannick.gicquel@iot.bzh>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 1/4] u-boot: basic support of device tree blob reassembly
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
X-List-Received-Date: Tue, 19 Apr 2016 13:30:40 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 19, 2016 at 9:46 AM, Yannick Gicquel
<yannick.gicquel@iot.bzh> wrote:
> This introduces a new task 'assemble_dtb' to handle the concatenation of U-Boot
> without DTB and the compiled U-Boot DTB while using CONFIG_OF_SEPARATE.
> Basically, this task merges the u-boot-nodtb.bin and the device tree blob using
> the 'cat' command and overrides the u-boot.bin file which is generated
> at the compilation step.
>
> This task is intended to be used in the verified-boot image generation process
> after the kernel-fitimage class had appended a public key to the device tree
> blob. It is placed after the do_deploy and before the do_install tasks and it
> replaces the u-boot binaries in both deploy directory and build directory
> in order to minimize the changes in later tasks.
>
> Signed-off-by: Yannick Gicquel <yannick.gicquel@iot.bzh>
> ---
>  meta/recipes-bsp/u-boot/u-boot-sign.inc | 21 +++++++++++++++++++++
>  meta/recipes-bsp/u-boot/u-boot.inc      | 22 ++++++++++++++++++++++
>  2 files changed, 43 insertions(+)
>  create mode 100644 meta/recipes-bsp/u-boot/u-boot-sign.inc
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot-sign.inc b/meta/recipes-bsp/u-boot/u-boot-sign.inc
> new file mode 100644
> index 0000000..c88a2a1
> --- /dev/null
> +++ b/meta/recipes-bsp/u-boot/u-boot-sign.inc

I think it could be moved to a class, so the U-Boot can inherit it.

> @@ -0,0 +1,21 @@
> +# This file is part of U-Boot verified boot support and is intended to be
> +# included from u-boot recipe and from kernel-fitimage.bbclass
> +#
> +# The signature procedure requires the user to generate an RSA key and
> +# certificate in a directory and to define the following variable:
> +#
> +# UBOOT_SIGN_KEYDIR = "/keys/directory"
> +# UBOOT_SIGN_KEYNAME = "dev" # keys name in keydir (eg. "dev.crt", "dev.key")
> +# UBOOT_SIGN_ENABLE = "1"
> +#
> +# The signature support is limited to the use of CONFIG_OF_SEPARATE in U-Boot.
> +#
> +# For more details, please refer to U-boot documentation.
> +
> +UBOOT_SIGN_ENABLE ?= "0"
> +UBOOT_DTB_IMAGE ?= "u-boot-${MACHINE}-${PV}-${PR}.dtb"
> +UBOOT_DTB_BINARY ?= "u-boot.dtb"
> +UBOOT_DTB_SYMLINK ?= "u-boot-${MACHINE}.dtb"
> +UBOOT_NODTB_IMAGE ?= "u-boot-nodtb-${MACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
> +UBOOT_NODTB_BINARY ?= "u-boot-nodtb.${UBOOT_SUFFIX}"
> +UBOOT_NODTB_SYMLINK ?= "u-boot-nodtb-${MACHINE}.${UBOOT_SUFFIX}"
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
> index 3ba866d..29b0b95 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -65,6 +65,28 @@ UBOOT_ENV_BINARY ?= "${UBOOT_ENV}.${UBOOT_ENV_SUFFIX}"
>  UBOOT_ENV_IMAGE ?= "${UBOOT_ENV}-${MACHINE}-${PV}-${PR}.${UBOOT_ENV_SUFFIX}"
>  UBOOT_ENV_SYMLINK ?= "${UBOOT_ENV}-${MACHINE}.${UBOOT_ENV_SUFFIX}"
>
> +# The use of verified boot requires to share environment variables with kernel
> +# fitImage class as the mkimage call requires dtb filepath to append signature
> +# public key.
> +require u-boot-sign.inc
> +
> +do_assemble_dtb() {
> +       # Concatenate U-Boot w/o DTB & DTB with public key
> +       # (cf. kernel-fitimage.bbclass for more details)
> +       cd ${DEPLOYDIR}
> +       if [ "x${UBOOT_SIGN_ENABLE}" = "x1" ]; then
> +               if [ -e "${UBOOT_NODTB_IMAGE}" -a -e "${UBOOT_DTB_IMAGE}" ]; then
> +                       cat ${UBOOT_NODTB_IMAGE} ${UBOOT_DTB_IMAGE} > ${UBOOT_IMAGE}
> +                       cat ${UBOOT_NODTB_IMAGE} ${UBOOT_DTB_IMAGE} > ${S}/${UBOOT_BINARY}
> +               else
> +                       bbwarn "Failure while adding public key to u-boot binary. Verified boot won't be available."
> +               fi
> +       fi
> +}
> +
> +addtask assemble_dtb after do_deploy before do_install
> +do_assemble_dtb[depends] += "${@' ${PREFERRED_PROVIDER_virtual/kernel}:do_assemble_fitimage' if '${UBOOT_SIGN_ENABLE}' == '1' else ''}"
> +

This should be part of the class, not another .inc file.

>  do_compile () {
>         if [ "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', 'ld-is-gold', '', d)}" = "ld-is-gold" ] ; then
>                 sed -i 's/$(CROSS_COMPILE)ld$/$(CROSS_COMPILE)ld.bfd/g' config.mk
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

