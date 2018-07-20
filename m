Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com
	[209.85.218.47])
	by mail.openembedded.org (Postfix) with ESMTP id 68F9778A90
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 16:07:03 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id q11-v6so22205816oic.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 09:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zqqsv3bYvHAEzTE6P7ETizk3QpI4m82uZ3/1Vzsxjjg=;
	b=YMGX0akktxvybZrPXoaZXN79C9dszPLp18u9DGMd3gMAVks0MVuWty2F/VabfjCeSk
	YrirmK/js4EBFtWroxZV5cC7RsnETA/kXrR4brSWNx48xpnlLeLDMIzgwRFi+L4kxE4Q
	vbSgYltpXphGr8SNUhNzvKdofKcx3MDDP2x+nepDmEeBot2hmweCha/8hZx1cOQw01NY
	bPpr8YmTOBZR/k/m8V8S35i+/xgt0XtVoK1/yNi/skiYDsYEUZTdA4vVBHahcDP3Q9pr
	d6aT/d4wqfTmZuqvd5BUh8SuY2NrmvJLGAMNjj5vxfGfqVi/nfSMGPFCP6bYpHOw57zn
	lzYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zqqsv3bYvHAEzTE6P7ETizk3QpI4m82uZ3/1Vzsxjjg=;
	b=lzJhEzJQJwHluG1FjgFeuxTRCGA2v9DJlM6f8crX04YcPOY/Xw59Gp3zM4BwwylfrM
	SELHFUGy0tA/oidQzoOymGo9Gtzr3fAn6mF+XwjWlaIyQeT2iFYwjhjHTRosknMw6dbt
	Kvhdnp2kRPD19PSVLfpn98q3AdWh3nZEShndTCqP0hlyz8QejwNZl+SZJmeCuA0wiZ46
	5m7qcDnWoFpl+GrT4WB6uEtGIa3vyf0V3OyRtkqf52vy7rBeyI/wAjvsxw3BW2xG7iTH
	bBu0XoWeKQxvVuPF5pVa5kDerj9tj7IDNiXl7KBeNMlKesEacRPwSBtLVe+00v89dBb2
	Q7sw==
X-Gm-Message-State: AOUpUlG8zBCYvlUvhKXQAY+uPOYmyU2c0SuOvE24EMRXNgcPFNv00jK7
	3ac/BEHBF+RYkVeSYekoMQjELTYQW+NIRCEBVJo=
X-Google-Smtp-Source: AAOMgpdmzuVhuoDOUqiLPO806chAQ6neK6onD0D0aNPO3rZL9nzLWXSg8xFdDx91f/PbbALBB5lg7aEe8OVaICwXz7k=
X-Received: by 2002:aca:e80c:: with SMTP id
	f12-v6mr2919577oih.38.1532102824338; 
	Fri, 20 Jul 2018 09:07:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90c5:0:0:0:0:0 with HTTP; Fri, 20 Jul 2018 09:07:03
	-0700 (PDT)
In-Reply-To: <20180720160326.18935-1-Martin.Jansa@gmail.com>
References: <CA+chaQe0U+-KTqnMe015uKuF5ExFY4qq0Brbnx7thOzNLoFvSA@mail.gmail.com>
	<20180720160326.18935-1-Martin.Jansa@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 20 Jul 2018 18:07:03 +0200
Message-ID: <CANNYZj9REEsX_vrXVT=Si1o+Dyo8QKj-QAALga+Ly+h6kq8Czw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [sumo][PATCH] gio-module-cache.bbclass: disable update_gio_module_cache postinst script for nativesdk
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
X-List-Received-Date: Fri, 20 Jul 2018 16:07:03 -0000
Content-Type: text/plain; charset="UTF-8"

FWIW, I am fine with this.

Alex

2018-07-20 18:03 GMT+02:00 Martin Jansa <martin.jansa@gmail.com>:
> * it fails to execute native binary inside the qemu usermode for target
>   arch as shown e.g. for qemuarm and raspberrypi3 build on x86_64
>   builder:
>
>   qemuarm-webos-linux-gnueabi/webos-ndk-basic/1.0.0-1-r3/temp/log.do_populate_sdk:
>     NOTE: > Executing update_gio_module_cache-nativesdk intercept ...
>     WARNING: The postinstall intercept hook 'update_gio_module_cache-nativesdk' failed, details in log.do_populate_sdk
>     qemuarm-webos-linux-gnueabi/webos-ndk-basic/1.0.0-1-r3/sdk/image/opt/webos-sdk-x86_64/7.0~s14/sysroots/x86_64-webossdk-linux/usr/libexec/nativesdk-gio-querymodules: Invalid ELF image for this architecture
>
>   qemuarm-webos-linux-gnueabi/my-sdk/1.0.0-1-r3/sdk/image/opt/webos-sdk-x86_64/7.0~s14/sysroots/armv5te-webos-linux-gnueabi/usr/libexec/gio-querymodules:
>     ELF 32-bit LSB  executable, ARM, EABI5 version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 3.2.0, BuildID[sha1]=5b7f0c77e8ee9587f4e02eaf1d54a1e230e539bd, stripped
>   qemuarm-webos-linux-gnueabi/my-sdk/1.0.0-1-r3/sdk/image/opt/webos-sdk-x86_64/7.0~s14/sysroots/x86_64-webossdk-linux/usr/libexec/nativesdk-gio-querymodules:
>     ELF 64-bit LSB  executable, x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 3.2.0, BuildID[sha1]=eeded124aa53c7ac997dd6326e5d9b75e8d9c43d, stripped
>
>   qemuarm-webos-linux-gnueabi/webos-ndk-basic/1.0.0-1-r3/intercept_scripts-ac629c4abfb418548877d2a412f7e552bd21e66f0b645b8875dc56ed9f0df40d/update_gio_module_cache-nativesdk
> bindir=/opt/webos-sdk-x86_64/7.0~s14/sysroots/x86_64-webossdk-linux/usr/bin
> base_libdir=/opt/webos-sdk-x86_64/7.0~s14/sysroots/x86_64-webossdk-linux/lib
> libexecdir=/opt/webos-sdk-x86_64/7.0~s14/sysroots/x86_64-webossdk-linux/usr/libexec
> libdir=/opt/webos-sdk-x86_64/7.0~s14/sysroots/x86_64-webossdk-linux/usr/lib
> binprefix=nativesdk-
>
> set -e
>
> PSEUDO_UNLOAD=1 qemuwrapper -L $D -E
> LD_LIBRARY_PATH=$D${libdir}:$D${base_libdir} \
>         $D${libexecdir}/${binprefix}gio-querymodules
> $D${libdir}/gio/modules/
>
> [ ! -e $D${libdir}/gio/modules/giomodule.cache ] ||
>         chown root:root $D${libdir}/gio/modules/giomodule.cache
>
>   raspberrypi3-webos-linux-gnueabi/webos-ndk-basic/1.0.0-1-r3/temp/log.do_populate_sdk:
>     NOTE: > Executing update_gio_module_cache-nativesdk intercept ...
>     WARNING: The postinstall intercept hook 'update_gio_module_cache-nativesdk' failed, details in log.do_populate_sdk
>     raspberrypi3-webos-linux-gnueabi/webos-ndk-basic/1.0.0-1-r3/sdk/image/opt/webos-sdk-x86_64/7.0~s14/sysroots/x86_64-webossdk-linux/usr/libexec/nativesdk-gio-querymodules: Invalid ELF image for this architecture
>
>   raspberrypi3-webos-linux-gnueabi/my-sdk/1.0.0-1-r3/sdk/image/opt/webos-sdk-x86_64/7.0~s14/sysroots/cortexa7t2hf-neon-vfpv4-webos-linux-gnueabi/usr/libexec/gio-querymodules:
>     ELF 32-bit LSB  executable, ARM, EABI5 version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 3.2.0, BuildID[sha1]=5267f1e542b014522af5ab54443d768ba6b47351, stripped
>   raspberrypi3-webos-linux-gnueabi/my-sdk/1.0.0-1-r3/sdk/image/opt/webos-sdk-x86_64/7.0~s14/sysroots/x86_64-webossdk-linux/usr/libexec/nativesdk-gio-querymodules:
>     ELF 64-bit LSB  executable, x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 3.2.0, BuildID[sha1]=eeded124aa53c7ac997dd6326e5d9b75e8d9c43d, stripped
>
>   raspberrypi3-webos-linux-gnueabi/webos-ndk-basic/1.0.0-1-r3/intercept_scripts-a4270d1427cca0a9d172dbcd8dc262957c8e081c657e1123cc9ad551d65f22ea/update_gio_module_cache-nativesdk
> bindir=/opt/webos-sdk-x86_64/7.0~s14/sysroots/x86_64-webossdk-linux/usr/bin
> base_libdir=/opt/webos-sdk-x86_64/7.0~s14/sysroots/x86_64-webossdk-linux/lib
> libexecdir=/opt/webos-sdk-x86_64/7.0~s14/sysroots/x86_64-webossdk-linux/usr/libexec
> libdir=/opt/webos-sdk-x86_64/7.0~s14/sysroots/x86_64-webossdk-linux/usr/lib
> binprefix=nativesdk-
>
> set -e
>
> PSEUDO_UNLOAD=1 qemuwrapper -L $D -E
> LD_LIBRARY_PATH=$D${libdir}:$D${base_libdir} \
>         $D${libexecdir}/${binprefix}gio-querymodules
> $D${libdir}/gio/modules/
>
> [ ! -e $D${libdir}/gio/modules/giomodule.cache ] ||
>         chown root:root $D${libdir}/gio/modules/giomodule.cache
>
> * it isn't needed in master, because nativesdk postinst were fixed by:
>   commit d10fd6ae3fe46290c6e3a5250878966d9f12ca3f
>   Author: Alexander Kanavin <alexander.kanavin@linux.intel.com>
>   Date:   Mon Jun 11 16:38:20 2018 +0300
>   Subject: qemuwrapper-cross: enable multilib and nativesdk variants of the script
> * which depends on:
>   commit d4f5b8e26acaadffac6df10f9a9d9ebfb3045f5f
>   Author: Alexander Kanavin <alexander.kanavin@linux.intel.com>
>   Date:   Mon Jun 11 16:38:17 2018 +0300
>   Subject: gtk-immodules-cache.bbclass: convert cache creation to postinst_intercept mechanism
>
> * backporting just these 2 isn't enough, we would need to backport
>   something else as well, otherwise it fails with:
>   webos-ndk-basic/1.0.0-1-r3/intercept_scripts-a4270d1427cca0a9d172dbcd8dc262957c8e081c657e1123cc9ad551d65f22ea/update_gio_module_cache-nativesdk:
>   nativesdk-qemuwrapper: not found
>
>   and at this point I would rather safely disable it for nativesdk
>   in sumo instead of backporting bunch more commits to stable branch
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/gio-module-cache.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes/gio-module-cache.bbclass b/meta/classes/gio-module-cache.bbclass
> index e429bd3197..0520c2257f 100644
> --- a/meta/classes/gio-module-cache.bbclass
> +++ b/meta/classes/gio-module-cache.bbclass
> @@ -2,6 +2,7 @@ PACKAGE_WRITE_DEPS += "qemu-native"
>  inherit qemu
>
>  GIO_MODULE_PACKAGES ??= "${PN}"
> +GIO_MODULE_PACKAGES_class-nativesdk = ""
>
>  gio_module_cache_common() {
>  if [ "x$D" != "x" ]; then
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

