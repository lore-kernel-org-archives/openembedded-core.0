Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 425EC785FA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 05:04:01 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id l64so4332320pge.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 22:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=F3MTeHDcWIxMYLvpuM4tgXx7xSKtMiYyRKi8ekysqLE=;
	b=OjP7Tt9Kb1meRphnDy4k/FIE7BE0Z60PfwfJGNuRgJTdJyzmzGkhy3Bo47s0XfI1Fp
	SehvS1TE+rRVBLeyINuHo0lTkws+c4zU5TYMNUrpzdBXAtTZsjWs9n/SgSc9P8HoNJpZ
	W6RSKlNdCecEJf3KEsjuLIxoScuyeh+uvo8DhMbqESQZygN3jJbvMROt/ITWn+fkCv4J
	hniVTItvTr2/O7mprgUlQDZCimACGhRY70vCDcCia7aPHU+jSvtD3PhOm7uTOanJ00Og
	bX3jFdfdPigI/aKI3oG9fidbUGEUhpNqgvtp8kqAc4xoyq9n2Cc7iWDixnj+Hrv/TRun
	C1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=F3MTeHDcWIxMYLvpuM4tgXx7xSKtMiYyRKi8ekysqLE=;
	b=jEIMnkmNQKfLQxbVfZfCqZ5dgYmNdi3USKlPSrttYVjYFrElYCazPRCQNtrArbqnFK
	gPW3mBIoTNO64qMzc4icxPvssLwdtpZ5dV9/31zd4i8zedEb9xTsVrShWMXLJRwK8EMW
	Dt+jvOIQ8QDtHmWsh23F5QonsRT7rmnjHxoA3je8F64vhReJEuc2PlMGQxPD3rzAE5n0
	72C5LrLNW5uiUdAfXri0/InrWPvpo9J7QDKtR0aLXFPqm4sT9DwMI+FvjoBRgXu3ZgPZ
	vmeSn7XvWetM5aoIFXfG+icODKBvSN1Fk1H+FlcIx7ECWPwQeFJ1vcymWep1bitrXcHY
	deCQ==
X-Gm-Message-State: AHYfb5gpZCfRH4LMjhQ1vg+aX/XZGTXJfE2MjLXdbHoZo1GKza5MZ8wm
	sQytjdcRK+JCUwYo
X-Received: by 10.84.228.200 with SMTP id y8mr585408pli.102.1502859843101;
	Tue, 15 Aug 2017 22:04:03 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:9b7:5cee:9e0b:bac6?
	([2601:202:4001:9ea0:9b7:5cee:9e0b:bac6])
	by smtp.gmail.com with ESMTPSA id s8sm7022pfd.77.2017.08.15.22.04.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Aug 2017 22:04:02 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20170812003455.27183-1-Martin.Jansa@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <df8df74b-3186-4aa0-e4ac-81f439d0bea5@gmail.com>
Date: Tue, 15 Aug 2017 22:04:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170812003455.27183-1-Martin.Jansa@gmail.com>
Subject: Re: [PATCH][pyro 1/4] v86d, qemuboot-x86.inc: use KERNEL_MODULE_AUTOLOAD+KERNEL_MODULE_PROBECONF for uvesafb instead of fbsetup init script
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
X-List-Received-Date: Wed, 16 Aug 2017 05:04:02 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 08/11/2017 05:34 PM, Martin Jansa wrote:
> * also add UVESA_MODE variable for easier change of resolution and respect it in QB_KERNEL_CMDLINE_APPEND
>    as well
> * don't use init script just to call modprobe
> * I wasn't able to test this all the way with runqemu, because runqemu
>    doesn't work on my system, but I've verified that the right params
>    appear there and that I can easily change UVESA_MODE from
>    conf/local.conf, the modules.d and modprobe.d files look OK:
>    OE qemux86@ ~/build/oe-core/tmp-glibc/deploy/images/qemux86/core-image-sato-qemux86-20170427212613.rootfs
>    $ cat etc/modules-load.d/uvesafb.conf
>    uvesafb
>
>    OE qemux86@ ~/build/oe-core/tmp-glibc/deploy/images/qemux86/core-image-sato-qemux86-20170427212613.rootfs
>    $ cat etc/modprobe.d/uvesafb.conf
>    options uvesafb mode_option=1600x1200-32
>
>    so I'll be able to drop this KERNEL_MODULE_AUTOLOAD +
>    KERNEL_MODULE_PROBECONF from my DISTRO conf.

All 4 merged to stagging.

thanks,
Armin
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   meta/conf/machine/include/qemuboot-x86.inc |  7 +++++-
>   meta/recipes-bsp/v86d/v86d/fbsetup         |  3 ---
>   meta/recipes-bsp/v86d/v86d/uvesafb.conf    |  2 --
>   meta/recipes-bsp/v86d/v86d_0.1.10.bb       | 36 ------------------------------
>   4 files changed, 6 insertions(+), 42 deletions(-)
>   delete mode 100755 meta/recipes-bsp/v86d/v86d/fbsetup
>   delete mode 100644 meta/recipes-bsp/v86d/v86d/uvesafb.conf
>
> diff --git a/meta/conf/machine/include/qemuboot-x86.inc b/meta/conf/machine/include/qemuboot-x86.inc
> index acd03a1ce8..acf9d55c40 100644
> --- a/meta/conf/machine/include/qemuboot-x86.inc
> +++ b/meta/conf/machine/include/qemuboot-x86.inc
> @@ -10,6 +10,11 @@ QB_CPU_KVM_x86-64 = "-cpu core2duo"
>   
>   QB_AUDIO_DRV = "alsa"
>   QB_AUDIO_OPT = "-soundhw ac97,es1370"
> -QB_KERNEL_CMDLINE_APPEND = "vga=0 uvesafb.mode_option=640x480-32 oprofile.timer=1 uvesafb.task_timeout=-1"
> +QB_KERNEL_CMDLINE_APPEND = "vga=0 uvesafb.mode_option=${UVESA_MODE} oprofile.timer=1 uvesafb.task_timeout=-1"
>   # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
>   QB_OPT_APPEND = "-vga vmware -show-cursor -usb -usbdevice tablet -device virtio-rng-pci"
> +
> +KERNEL_MODULE_AUTOLOAD += "uvesafb"
> +KERNEL_MODULE_PROBECONF += "uvesafb"
> +UVESA_MODE ?= "640x480-32"
> +module_conf_uvesafb = "options uvesafb mode_option=${UVESA_MODE}"
> diff --git a/meta/recipes-bsp/v86d/v86d/fbsetup b/meta/recipes-bsp/v86d/v86d/fbsetup
> deleted file mode 100755
> index 2a409cc529..0000000000
> --- a/meta/recipes-bsp/v86d/v86d/fbsetup
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -#!/bin/sh
> -
> -/sbin/modprobe uvesafb
> diff --git a/meta/recipes-bsp/v86d/v86d/uvesafb.conf b/meta/recipes-bsp/v86d/v86d/uvesafb.conf
> deleted file mode 100644
> index 43789755d3..0000000000
> --- a/meta/recipes-bsp/v86d/v86d/uvesafb.conf
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -# Load uvesafb.ko at boot
> -uvesafb
> diff --git a/meta/recipes-bsp/v86d/v86d_0.1.10.bb b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
> index eab466d30d..579a0a27eb 100644
> --- a/meta/recipes-bsp/v86d/v86d_0.1.10.bb
> +++ b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
> @@ -11,8 +11,6 @@ PR = "r2"
>   
>   SRC_URI = "http://distfiles.gentoo.org/distfiles/${BP}.tar.bz2 \
>              file://Update-x86emu-from-X.org.patch \
> -           file://fbsetup \
> -           file://uvesafb.conf \
>              file://ar-from-env.patch \
>              file://aarch64-host.patch \
>   "
> @@ -23,9 +21,6 @@ SRC_URI[sha256sum] = "634964ae18ef68c8493add2ce150e3b4502badeb0d9194b4bd81241d25
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
>   
> -INITSCRIPT_NAME = "fbsetup"
> -INITSCRIPT_PARAMS = "start 0 S ."
> -
>   do_configure () {
>   	./configure --with-x86emu
>   }
> @@ -37,35 +32,4 @@ do_compile () {
>   do_install () {
>   	install -d ${D}${base_sbindir}
>   	install v86d ${D}${base_sbindir}/
> -
> -        # Only install fbsetup script if 'sysvinit' is in DISTRO_FEATURES
> -        if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
> -            install -d ${D}${sysconfdir}/init.d/
> -            install -m 0755 ${WORKDIR}/fbsetup ${D}${sysconfdir}/init.d/fbsetup
> -        fi
> -
> -        # Install systemd related configuration file
> -        if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> -            install -d ${D}${sysconfdir}/modules-load.d
> -            install -m 0644 ${WORKDIR}/uvesafb.conf ${D}${sysconfdir}/modules-load.d
> -        fi
> -}
> -
> -# As the recipe doesn't inherit systemd.bbclass, we need to set this variable
> -# manually to avoid unnecessary postinst/preinst generated.
> -python __anonymous() {
> -    if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
> -        d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
> -}
> -
> -inherit update-rc.d
> -
> -PACKAGE_WRITE_DEPS_append = " ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd-systemctl-native','',d)}"
> -pkg_postinst_${PN} () {
> -	if ${@bb.utils.contains('DISTRO_FEATURES','systemd sysvinit','true','false',d)}; then
> -		if [ -n "$D" ]; then
> -			OPTS="--root=$D"
> -		fi
> -		systemctl $OPTS mask fbsetup.service
> -	fi
>   }


