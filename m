Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4A16977A8D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 11:02:50 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id o81so4206536wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 04:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/xemWxCNmxfAJQROsSEqO269Ej1Br8O4BumwM5GoXGc=;
	b=rHeAXOnpSx5LJ2hLA5RwOsqc0M+ZNVxxxDOwTt/VTPs9M2Vr1v8aP1SBTr+0vY76C5
	A7/eJP1FR+LzIIxrJ6RHTDaRBQ3TnZhgD0NLwGBCNmsl+LB2jd+/sgWMKOpmhQCxaeLy
	b77zfxagR5Tqvdg/PSIjDCfYCvfEIwXkOcXFbPBt3tfk76dM5/BfYj/MYd6w6Z4kBcTM
	lIBPkZlizGh29dbK2ufS05VIFSTNQqp5mHrNTmuIKAyOZjfiBVwdZluW/jZ3j6yUim1a
	cLOquQo5T5tyvHpzTHt/3hm5BvilT+p2vrm65kPcNd+roh8ReiLBrpwPK5EEV+uYTKtN
	e+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/xemWxCNmxfAJQROsSEqO269Ej1Br8O4BumwM5GoXGc=;
	b=AdSmlDHyhwGexT3txZTZItUmlxx1PFjlYmoBdM9MxvXpi4YG9Eqpu9Uf8ugVun0B2n
	IbcY26ww7bzERJ0E933gCK01Kx1FK89eTcNDbwd2rlV+vN89JtuWMz9nldkc0GBEUxOO
	AzLpqqpYkof6T7JhGuEOobej14mQPBCfCGTs9vtxgtN09qmbLHQd7WwA+qJxJ67MaH8/
	a/HmB1029nFy0k+erKR6o7pDT6/DsTkNxiAQEdDNV/3tEeLs2GbBI5MlUtxgBAPRrUN7
	YSHFW20I6kATVfv2dH5sAHjudPV6jUz7vDdblqqcXU2ofKPd8vW6gR7pkFxi8U21iKWe
	QYbw==
X-Gm-Message-State: AN3rC/7rY3YWVrw29E294NE7Ct3M3/FFGx0qIOVviMXPyCd4nGlZrVxl
	BTBiUwhEyS5/8gU/gY+/BohOrlquBg==
X-Received: by 10.28.195.7 with SMTP id t7mr7790626wmf.62.1492772571656; Fri,
	21 Apr 2017 04:02:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.150.196 with HTTP; Fri, 21 Apr 2017 04:02:51 -0700 (PDT)
In-Reply-To: <1492771191-4445-1-git-send-email-obi@opendreambox.org>
References: <1492771191-4445-1-git-send-email-obi@opendreambox.org>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Fri, 21 Apr 2017 13:02:51 +0200
Message-ID: <CAAQYJAs_8am0azk+0_3MNvwrNU6WiX2_5HgH0ouwWdyK6F8rAA@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Revert "kernel: Fix symlinks"
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
X-List-Received-Date: Fri, 21 Apr 2017 11:02:52 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Apr 21, 2017 at 12:39 PM, Andreas Oberritter
<obi@opendreambox.org> wrote:
> This reverts commit c7bc46b9bc29dd0953ab8d63b50fa105bb66892e.
>
> It broke dpkg's update-alternatives, which requires absolute paths.

This is really uncommon.

I had already expressed my negative opinion about absolute paths for kernel [1].
Personally, I had to patch the bootloader (kexecboot).

So please try some workaround instead of changing it back.

Cheers
Andrea

[1] http://lists.openembedded.org/pipermail/openembedded-core/2014-July/093988.html

>
> | update-alternatives: error: alternative path is not absolute as it should be
>
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  meta/classes/kernel.bbclass             | 6 +++---
>  meta/recipes-kernel/linux/linux-dtb.inc | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 12a748d..8cf357f 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -49,11 +49,10 @@ python __anonymous () {
>
>      for type in types.split():
>          typelower = type.lower()
> -        imagedest = d.getVar('KERNEL_IMAGEDEST')
>
>          d.appendVar('PACKAGES', ' ' + 'kernel-image-' + typelower)
>
> -        d.setVar('FILES_kernel-image-' + typelower, '/' + imagedest + '/' + type + '-${KERNEL_VERSION_NAME}')
> +        d.setVar('FILES_kernel-image-' + typelower, '/boot/' + type + '-${KERNEL_VERSION_NAME}')
>
>          d.appendVar('RDEPENDS_kernel-image', ' ' + 'kernel-image-' + typelower)
>
> @@ -61,8 +60,9 @@ python __anonymous () {
>
>          d.setVar('ALLOW_EMPTY_kernel-image-' + typelower, '1')
>
> +        imagedest = d.getVar('KERNEL_IMAGEDEST')
>          priority = d.getVar('KERNEL_PRIORITY')
> -        postinst = '#!/bin/sh\n' + 'update-alternatives --install /' + imagedest + '/' + type + ' ' + type + ' ' + type + '-${KERNEL_VERSION_NAME} ' + priority + ' || true' + '\n'
> +        postinst = '#!/bin/sh\n' + 'update-alternatives --install /' + imagedest + '/' + type + ' ' + type + ' ' + '/' + imagedest + '/' + type + '-${KERNEL_VERSION_NAME} ' + priority + ' || true' + '\n'
>          d.setVar('pkg_postinst_kernel-image-' + typelower, postinst)
>
>          postrm = '#!/bin/sh\n' + 'update-alternatives --remove' + ' ' + type + ' ' + type + '-${KERNEL_VERSION_NAME} || true' + '\n'
> diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
> index 22e374f..41aad7c 100644
> --- a/meta/recipes-kernel/linux/linux-dtb.inc
> +++ b/meta/recipes-kernel/linux/linux-dtb.inc
> @@ -63,7 +63,7 @@ pkg_postinst_kernel-devicetree () {
>                         DTB_EXT=${DTB##*.}
>                         DTB_BASE_NAME=`basename ${DTB} ."${DTB_EXT}"`
>                         DTB_SYMLINK_NAME=`echo ${symlink_name} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> -                       update-alternatives --install /${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.${DTB_EXT} ${DTB_BASE_NAME}.${DTB_EXT} devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT} ${KERNEL_PRIORITY} || true
> +                       update-alternatives --install /${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.${DTB_EXT} ${DTB_BASE_NAME}.${DTB_EXT} /boot/devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT} ${KERNEL_PRIORITY} || true
>                 done
>         done
>  }
> @@ -76,7 +76,7 @@ pkg_postrm_kernel-devicetree () {
>                         DTB_EXT=${DTB##*.}
>                         DTB_BASE_NAME=`basename ${DTB} ."${DTB_EXT}"`
>                         DTB_SYMLINK_NAME=`echo ${symlink_name} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> -                       update-alternatives --remove ${DTB_BASE_NAME}.${DTB_EXT} devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT} ${KERNEL_PRIORITY} || true
> +                       update-alternatives --remove ${DTB_BASE_NAME}.${DTB_EXT} /boot/devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT} ${KERNEL_PRIORITY} || true
>                 done
>         done
>  }
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

