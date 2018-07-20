Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id CD6CC78A90
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 16:03:27 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id z13-v6so10316185wma.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 09:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=FyjJyvuFTxDWxYsNOB6Sq5i+ChLQL74ZhXMH6d+9bPE=;
	b=TAzjV60ppE52iXenm1eP3MXkUX3GYXYG+M4ROvfwZavmo7QCqngJPR8OldP39l7gso
	irPOjVCnpJ/MNt8y9CcxE2iyYjX00ICPEMrP5Kof/aVNNBHi8AWJlEkxiqNU0gsd451K
	Mp1IDBcDt4AjoA1f0a4tlgUxqoHczgjU5XWkmr/y2xLONEMTRPuKWOd+76RHA6ndzDYY
	tnlLlwCTk9+DlT6oCZmoHgNxJ3Ki3X0PV+j/lITRcfUvLOOyCoLwMzTUsRdd1IQVjgBE
	jWo+NmcOK0BXfae4JHZsSvuy7xYQe1uH7YXs2MJr9nS3FuToVzILuO++WRFYVX0iOdDp
	PSpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=FyjJyvuFTxDWxYsNOB6Sq5i+ChLQL74ZhXMH6d+9bPE=;
	b=pE8EE6WniuzRH4i2k5iD7rRsDkvkchiT2wSj40//IlR45vYbD9J4ViLvgVtqxET2vS
	nDyEMWy2WxEVRMbILQX2BZCeedZS5mr0nufVFqyPBWCOsryAhIfTjYvQQoUku9oNBxz8
	wrGtNZB+ibR9gRMbwIAZBEvGRP8DGXDUQTVS6YlTKW3gAWSFQZlo0kyw3rVSWuHj0dfP
	YvOwxyNELL8jH9UkTgXzp6vgKr/T7YKdO3QuSfbMg4XxKa3QINbZ3MKeigZVBZYvlK4v
	v+tjai6QeZNeHfhe9lndOrUZsTbJJb1+YjX1Zr4AjT+VFhWb3yOZv0OT9mCxCa5h2CLC
	JrAA==
X-Gm-Message-State: AOUpUlEZzpP0pairBZ1KXmPTWbpLfXemY05qneeX/pz714NY1OJfzPjs
	tat2VTJxzNPYF7xeLPbp7Qz8OHKt
X-Google-Smtp-Source: AAOMgpfblOj9RD4tUSqWMm0tLD/aq477/Jr1bRfze9emw8R2xVUXczOR8SuL0goXNCN08xQXc3OzXA==
X-Received: by 2002:a1c:700a:: with SMTP id
	l10-v6mr1916094wmc.90.1532102608303; 
	Fri, 20 Jul 2018 09:03:28 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	e196-v6sm4599197wmf.46.2018.07.20.09.03.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 20 Jul 2018 09:03:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jul 2018 16:03:26 +0000
Message-Id: <20180720160326.18935-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CA+chaQe0U+-KTqnMe015uKuF5ExFY4qq0Brbnx7thOzNLoFvSA@mail.gmail.com>
References: <CA+chaQe0U+-KTqnMe015uKuF5ExFY4qq0Brbnx7thOzNLoFvSA@mail.gmail.com>
Subject: [sumo][PATCH] gio-module-cache.bbclass: disable update_gio_module_cache postinst script for nativesdk
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
X-List-Received-Date: Fri, 20 Jul 2018 16:03:28 -0000

* it fails to execute native binary inside the qemu usermode for target
  arch as shown e.g. for qemuarm and raspberrypi3 build on x86_64
  builder:

  qemuarm-webos-linux-gnueabi/webos-ndk-basic/1.0.0-1-r3/temp/log.do_populate_sdk:
    NOTE: > Executing update_gio_module_cache-nativesdk intercept ...
    WARNING: The postinstall intercept hook 'update_gio_module_cache-nativesdk' failed, details in log.do_populate_sdk
    qemuarm-webos-linux-gnueabi/webos-ndk-basic/1.0.0-1-r3/sdk/image/opt/webos-sdk-x86_64/7.0~s14/sysroots/x86_64-webossdk-linux/usr/libexec/nativesdk-gio-querymodules: Invalid ELF image for this architecture

  qemuarm-webos-linux-gnueabi/my-sdk/1.0.0-1-r3/sdk/image/opt/webos-sdk-x86_64/7.0~s14/sysroots/armv5te-webos-linux-gnueabi/usr/libexec/gio-querymodules:
    ELF 32-bit LSB  executable, ARM, EABI5 version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 3.2.0, BuildID[sha1]=5b7f0c77e8ee9587f4e02eaf1d54a1e230e539bd, stripped
  qemuarm-webos-linux-gnueabi/my-sdk/1.0.0-1-r3/sdk/image/opt/webos-sdk-x86_64/7.0~s14/sysroots/x86_64-webossdk-linux/usr/libexec/nativesdk-gio-querymodules:
    ELF 64-bit LSB  executable, x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 3.2.0, BuildID[sha1]=eeded124aa53c7ac997dd6326e5d9b75e8d9c43d, stripped

  qemuarm-webos-linux-gnueabi/webos-ndk-basic/1.0.0-1-r3/intercept_scripts-ac629c4abfb418548877d2a412f7e552bd21e66f0b645b8875dc56ed9f0df40d/update_gio_module_cache-nativesdk
bindir=/opt/webos-sdk-x86_64/7.0~s14/sysroots/x86_64-webossdk-linux/usr/bin
base_libdir=/opt/webos-sdk-x86_64/7.0~s14/sysroots/x86_64-webossdk-linux/lib
libexecdir=/opt/webos-sdk-x86_64/7.0~s14/sysroots/x86_64-webossdk-linux/usr/libexec
libdir=/opt/webos-sdk-x86_64/7.0~s14/sysroots/x86_64-webossdk-linux/usr/lib
binprefix=nativesdk-

set -e

PSEUDO_UNLOAD=1 qemuwrapper -L $D -E
LD_LIBRARY_PATH=$D${libdir}:$D${base_libdir} \
        $D${libexecdir}/${binprefix}gio-querymodules
$D${libdir}/gio/modules/

[ ! -e $D${libdir}/gio/modules/giomodule.cache ] ||
        chown root:root $D${libdir}/gio/modules/giomodule.cache

  raspberrypi3-webos-linux-gnueabi/webos-ndk-basic/1.0.0-1-r3/temp/log.do_populate_sdk:
    NOTE: > Executing update_gio_module_cache-nativesdk intercept ...
    WARNING: The postinstall intercept hook 'update_gio_module_cache-nativesdk' failed, details in log.do_populate_sdk
    raspberrypi3-webos-linux-gnueabi/webos-ndk-basic/1.0.0-1-r3/sdk/image/opt/webos-sdk-x86_64/7.0~s14/sysroots/x86_64-webossdk-linux/usr/libexec/nativesdk-gio-querymodules: Invalid ELF image for this architecture

  raspberrypi3-webos-linux-gnueabi/my-sdk/1.0.0-1-r3/sdk/image/opt/webos-sdk-x86_64/7.0~s14/sysroots/cortexa7t2hf-neon-vfpv4-webos-linux-gnueabi/usr/libexec/gio-querymodules:
    ELF 32-bit LSB  executable, ARM, EABI5 version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 3.2.0, BuildID[sha1]=5267f1e542b014522af5ab54443d768ba6b47351, stripped
  raspberrypi3-webos-linux-gnueabi/my-sdk/1.0.0-1-r3/sdk/image/opt/webos-sdk-x86_64/7.0~s14/sysroots/x86_64-webossdk-linux/usr/libexec/nativesdk-gio-querymodules:
    ELF 64-bit LSB  executable, x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 3.2.0, BuildID[sha1]=eeded124aa53c7ac997dd6326e5d9b75e8d9c43d, stripped

  raspberrypi3-webos-linux-gnueabi/webos-ndk-basic/1.0.0-1-r3/intercept_scripts-a4270d1427cca0a9d172dbcd8dc262957c8e081c657e1123cc9ad551d65f22ea/update_gio_module_cache-nativesdk
bindir=/opt/webos-sdk-x86_64/7.0~s14/sysroots/x86_64-webossdk-linux/usr/bin
base_libdir=/opt/webos-sdk-x86_64/7.0~s14/sysroots/x86_64-webossdk-linux/lib
libexecdir=/opt/webos-sdk-x86_64/7.0~s14/sysroots/x86_64-webossdk-linux/usr/libexec
libdir=/opt/webos-sdk-x86_64/7.0~s14/sysroots/x86_64-webossdk-linux/usr/lib
binprefix=nativesdk-

set -e

PSEUDO_UNLOAD=1 qemuwrapper -L $D -E
LD_LIBRARY_PATH=$D${libdir}:$D${base_libdir} \
        $D${libexecdir}/${binprefix}gio-querymodules
$D${libdir}/gio/modules/

[ ! -e $D${libdir}/gio/modules/giomodule.cache ] ||
        chown root:root $D${libdir}/gio/modules/giomodule.cache

* it isn't needed in master, because nativesdk postinst were fixed by:
  commit d10fd6ae3fe46290c6e3a5250878966d9f12ca3f
  Author: Alexander Kanavin <alexander.kanavin@linux.intel.com>
  Date:   Mon Jun 11 16:38:20 2018 +0300
  Subject: qemuwrapper-cross: enable multilib and nativesdk variants of the script
* which depends on:
  commit d4f5b8e26acaadffac6df10f9a9d9ebfb3045f5f
  Author: Alexander Kanavin <alexander.kanavin@linux.intel.com>
  Date:   Mon Jun 11 16:38:17 2018 +0300
  Subject: gtk-immodules-cache.bbclass: convert cache creation to postinst_intercept mechanism

* backporting just these 2 isn't enough, we would need to backport
  something else as well, otherwise it fails with:
  webos-ndk-basic/1.0.0-1-r3/intercept_scripts-a4270d1427cca0a9d172dbcd8dc262957c8e081c657e1123cc9ad551d65f22ea/update_gio_module_cache-nativesdk:
  nativesdk-qemuwrapper: not found

  and at this point I would rather safely disable it for nativesdk
  in sumo instead of backporting bunch more commits to stable branch

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/gio-module-cache.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/gio-module-cache.bbclass b/meta/classes/gio-module-cache.bbclass
index e429bd3197..0520c2257f 100644
--- a/meta/classes/gio-module-cache.bbclass
+++ b/meta/classes/gio-module-cache.bbclass
@@ -2,6 +2,7 @@ PACKAGE_WRITE_DEPS += "qemu-native"
 inherit qemu
 
 GIO_MODULE_PACKAGES ??= "${PN}"
+GIO_MODULE_PACKAGES_class-nativesdk = ""
 
 gio_module_cache_common() {
 if [ "x$D" != "x" ]; then
-- 
2.17.1


