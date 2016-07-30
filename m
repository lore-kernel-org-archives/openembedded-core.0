Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 78F4860746
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jul 2016 11:00:49 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id m60so4810985uam.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jul 2016 04:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=pyslct3xZvmU7bhWVJnFTw+dTMqEwhZN2yC0FtTfoxI=;
	b=dtK1x8u3UYbsnjkF+AttSVPKaNGhiI5iO4EyWjGDdGha2oF4th+Y3/13BBKv6jV0ex
	M5UzKzCzQX9nHQJJliZrBAGp8t8J8yLnPis3FIyWai0TGfyfvoIW/nPALRfGr/DInuVa
	3+z678v57epToALGuTNG7UIDNgaMM3wpMjnJBPKZEe/cGjYTtB8KRMQw9YSltP0gh7SG
	UC8bAN0k8n2PiE0w2+FYoMNtEaESs0LuYqXh7+50B6JCPN88GHd7FXinh8EfgFecV+r8
	Akb2dUsbFK6XWEoIjZsjeWHD1LfsA+yp5XIM453+oyk0EuF3rRI7ZaGkJ3vY6ClvRiMN
	Q+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=pyslct3xZvmU7bhWVJnFTw+dTMqEwhZN2yC0FtTfoxI=;
	b=kHd9EusI/WDoylXOJWJLfcs7e/joVL4dPV9dWutETAufkPgm4dPnxcpwpUGNLDL66p
	Bw2hnk68YLSP0XGDVnWCmge6XpeSzE5l0eUIn4u/cXWO0ikCdGYezvN0yMhbktt+qDGv
	n6zVnyY4TabcJ222o1iUPRjVW7KjsJXlJsG/Ny5IZzQvfMjHLrjaq+TNXSh7vGdmokqa
	+ofok+rqYI2uWCSy7l7dbsw+hLR2A+jvSI6OFNrneYvJ4tNop2XujTqlAOyewCEj4cqC
	2pruZkUDk/zpKyK56b2sZqGZ1KDqa2D+K4EfbSI0cHRO7qN/uMXpWZkAVSg52m00Vqkd
	pqHg==
X-Gm-Message-State: AEkoousveAzHFQwEZUqaDOLFRV9Y6P4TpYXDSSj/ELkqzahWw/FMU6+2FBEMX+ApvtaKbg==
X-Received: by 10.159.38.56 with SMTP id 53mr20620460uag.153.1469876449243;
	Sat, 30 Jul 2016 04:00:49 -0700 (PDT)
Received: from mail-vk0-f52.google.com (mail-vk0-f52.google.com.
	[209.85.213.52])
	by smtp.gmail.com with ESMTPSA id f69sm3431483vka.9.2016.07.30.04.00.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 30 Jul 2016 04:00:47 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vk0-f52.google.com with SMTP id w127so70695495vkh.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jul 2016 04:00:47 -0700 (PDT)
X-Received: by 10.31.193.20 with SMTP id r20mr20638299vkf.4.1469876446703;
	Sat, 30 Jul 2016 04:00:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.138.78 with HTTP; Sat, 30 Jul 2016 04:00:45 -0700 (PDT)
In-Reply-To: <20160729222801.9806-1-raj.khem@gmail.com>
References: <20160729222801.9806-1-raj.khem@gmail.com>
Date: Sat, 30 Jul 2016 08:00:45 -0300
X-Gmail-Original-Message-ID: <CAP9ODKr5zc+cB-iGcze7Uq8DswUko=2cReYhWLyURe5DwLuE2Q@mail.gmail.com>
Message-ID: <CAP9ODKr5zc+cB-iGcze7Uq8DswUko=2cReYhWLyURe5DwLuE2Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] linux-dtb.inc: Support for .dtbo files for dtb overlays
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
X-List-Received-Date: Sat, 30 Jul 2016 11:00:50 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 29, 2016 at 7:27 PM, Khem Raj <raj.khem@gmail.com> wrote:
> From: Herve Jourdain <herve.jourdain@neuf.fr>
>
> Signed-off-by: Herve Jourdain <herve.jourdain@neuf.fr>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-kernel/linux/linux-dtb.inc | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
> index 74f5ef8..8528d64 100644
> --- a/meta/recipes-kernel/linux/linux-dtb.inc
> +++ b/meta/recipes-kernel/linux/linux-dtb.inc
> @@ -33,12 +33,13 @@ do_compile_append() {
>  do_install_append() {
>         for DTB in ${KERNEL_DEVICETREE}; do
>                 DTB=`normalize_dtb "${DTB}"`
> -               DTB_BASE_NAME=`basename ${DTB} .dtb`
> +               DTB_EXT=${DTB##*.}

Bashism, no?

> +               DTB_BASE_NAME=`basename ${DTB} ."${DTB_EXT}"`
>                 for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
>                         symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
>                         DTB_SYMLINK_NAME=`echo ${symlink_name} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
>                         DTB_PATH=`get_real_dtb_path_in_kernel "${DTB}"`
> -                       install -m 0644 ${DTB_PATH} ${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.dtb
> +                       install -m 0644 ${DTB_PATH} ${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT}
>                 done
>         done
>  }
> @@ -46,7 +47,8 @@ do_install_append() {
>  do_deploy_append() {
>         for DTB in ${KERNEL_DEVICETREE}; do
>                 DTB=`normalize_dtb "${DTB}"`
> -               DTB_BASE_NAME=`basename ${DTB} .dtb`
> +               DTB_EXT=${DTB##*.}
> +               DTB_BASE_NAME=`basename ${DTB} ."${DTB_EXT}"`
>                 for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
>                         base_name=${type}"-"${KERNEL_IMAGE_BASE_NAME}
>                         symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
> @@ -54,8 +56,8 @@ do_deploy_append() {
>                         DTB_SYMLINK_NAME=`echo ${symlink_name} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
>                         DTB_PATH=`get_real_dtb_path_in_kernel "${DTB}"`
>                         install -d ${DEPLOYDIR}
> -                       install -m 0644 ${DTB_PATH} ${DEPLOYDIR}/${DTB_NAME}.dtb
> -                       ln -sf ${DTB_NAME}.dtb ${DEPLOYDIR}/${DTB_SYMLINK_NAME}.dtb
> +                       install -m 0644 ${DTB_PATH} ${DEPLOYDIR}/${DTB_NAME}.${DTB_EXT}
> +                       ln -sf ${DTB_NAME}.${DTB_EXT} ${DEPLOYDIR}/${DTB_SYMLINK_NAME}.${DTB_EXT}
>                 done
>         done
>  }
> @@ -65,9 +67,10 @@ pkg_postinst_kernel-devicetree () {
>         for DTB in ${KERNEL_DEVICETREE}; do
>                 for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
>                         symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
> +                       DTB_EXT=${DTB##*.}
>                         DTB_BASE_NAME=`basename ${DTB} | awk -F "." '{print $1}'`
>                         DTB_SYMLINK_NAME=`echo ${symlink_name} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> -                       update-alternatives --install /${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.dtb ${DTB_BASE_NAME}.dtb /boot/devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
> +                       update-alternatives --install /${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.${DTB_EXT} ${DTB_BASE_NAME}.${DTB_EXT} /boot/devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT} ${KERNEL_PRIORITY} || true
>                 done
>         done
>  }
> @@ -77,9 +80,10 @@ pkg_postrm_kernel-devicetree () {
>         for DTB in ${KERNEL_DEVICETREE}; do
>                 for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
>                         symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
> +                       DTB_EXT=${DTB##*.}
>                         DTB_BASE_NAME=`basename ${DTB} | awk -F "." '{print $1}'`
>                         DTB_SYMLINK_NAME=`echo ${symlink_name} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> -                       update-alternatives --remove ${DTB_BASE_NAME}.dtb /boot/devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
> +                       update-alternatives --remove ${DTB_BASE_NAME}.${DTB_EXT} /boot/devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT} ${KERNEL_PRIORITY} || true
>                 done
>         done
>  }
> --
> 2.9.0
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

