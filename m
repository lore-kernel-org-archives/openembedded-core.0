Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1454.1793986362619698978
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 09:32:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=vkyOiOhx;
 spf=pass (domain: gmail.com, ip: 209.85.217.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7a6e560f580so641288137.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 09:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793986361; x=1794591161; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y90kFveby8FF6WuOtb+2jm9NE8wu830ZG3ljZvDpM/4=;
        b=vkyOiOhxV8b3sUGGMoCHVtyuf0ROeodxDeu4utClIQgtz2wOcMrTk2WpsrV8hxyDlA
         1S5jLWQTnAOOLd9oFaaoHqnhDDWhs7sqanPLHhOsECx2yEWKSOXmHFgtRpMmt9B+7VgY
         /ZiQXEO45SIo54Xg1JEfx8hrrqWIPF3d7ME21lj9pkm5g13fVaRv+fxoRr9ffigLD7Tn
         KwuGnUg7Zdi1iFsJDw0gLbQGP6VV3JhQ7n3wLEtbEjD+xq3mjbaMX0/wbAU50Cw5/FEE
         gX1pK4GVpcFPP+KS3bpE5oDOTRWhyKUAjSpqI6eOp+Hu+EedwOVa9PlEeYWkB5bOlEyf
         miVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793986361; x=1794591161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y90kFveby8FF6WuOtb+2jm9NE8wu830ZG3ljZvDpM/4=;
        b=AhUF5HXeYmk6S8MK5OfCaaEZGJILS1dRF/pqLunLRiQHzdMBBzzCKUEv+ER414NBhl
         j7O/FHXKzcjGXu6rzNdUn4mM+dSOx9I//aD3DD2cqJU1phe7glDjRQwYba1tCKSfeQ4r
         9X77DsvvBXRtZHAykmjpAciDjztYdr7GA/ra8aAOIUmRMyCr2iNWL2DO6ydczJ4UEEIB
         gxf2sYg5lmScR5FvlPv/U/rYMOF5IqWirY/JTw9g/W+2wG+gNy/gde/ejZ8XtpkdmZ7I
         tJ12OBvF5jJxEL+ErvY1VI4mjdYCRCwh47U7d9yUEL11+RlcvAQ+WysJlHJnNJBmB1nF
         hcmg==
X-Gm-Message-State: APuU4Z9vVGF6DJ86jEllihU15MLvH2cIQn7NwgK8tThv8ZWYG8hm8QS6
	aLvtW9dV7iDA0CzZHZu0/SEuBhMu7OuudZuT0gZXObwB6+r25aQL/Ysc
X-Gm-Gg: AYBFou1SPXxYoXOmt/sC6jBODafUHbEuZAnQjyn/IOvAfDc5gCNiY6tPaOXAudp2c6Q
	yOUNSEkIDlG8AVM+4kcAgw3Y8F9EXeg6mJlSnYdeq0hS8Gnm2I1F5H+4G5i8UYkO33MrvKB5B+R
	3gdoea0V+eXw0Mmgl19x9O2VyKtk7VzmfMQU+u9oqrndrhj8+veksmLa1eQIWX1cpvv7KDpt5od
	JIkPvMz3tJ6NCF3q9J2FZGa/dbq2wwUpwjszC87onHlwvM66GNXEsnbT81tBpQzMWVqDIK2+k2e
	N/eUO6ZhX20UDlLLNn5owTWl9a7p6TzfaDnppAeTfRbFDUUiYqnmPQB6ZTiMv3CNgarC0Kt+als
	D6MjVz89pdvK1zHbPH8EF0AvdCuFOz+wtINtwbAulU5edKsuEglCZlJEAAD+HHOonqcPRjRAmeL
	dsUuFenWiSONfNpb1GHr2DroU+zdGTpWUKALlIuO1lK+uC9g9tI32T3w6wvpAJlZcjxIq2juTah
	M4sv0h3CeYwVg7kLpMvmvLfGchbDWL0AUbB7+5VnJhy6dZGtQL1sI5eGL/+ei+Dc3j4tOG9ufgq
	HjsVY3yZH1chdLvtkYM2BEZk4GLrluHF/f8BcaH7SjyL4ote8ei5sVtY2eFxrzfRMxav9Y9fJgS
	1zpz7MlY7bY6w6uDgt6ILd1gukBRI/ikrTMOJlE0DJaXQCSv/2AePbLplZIPRm8B48vqTy2qnqq
	e87jA8CVubTG5+3IddcRwIxcjo1mb5gmYXWBFhIS45HheZgLTD30lF1fRH58RA1mgqYCeS
X-Received: by 2002:a05:6102:5815:b0:7cc:1274:aba3 with SMTP id ada2fe7eead31-7d2a15ed551mr1782520137.22.1793986361150;
        Fri, 06 Nov 2026 09:32:41 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from bruce-XPS-8940.localdomain (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99ba74a6964sm2335848241.0.2026.11.06.09.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:32:40 -0800 (PST)
From: bruce.ashfield@gmail.com
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][RFC PATCH 05/08] kernel-devsrc: optionally version the package
Date: Fri,  6 Nov 2026 12:32:32 -0500
Message-ID: <20261106173235.4155305-6-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106173235.4155305-1-bruce.ashfield@gmail.com>
References: <20261106173235.4155305-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 17:32:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249705
Content-Type: text/plain; charset="utf-8"

From: Bruce Ashfield <bruce.ashfield@gmail.com>

kernel-devsrc is one package name for every kernel version, so the trees
of two kernel versions can't be installed side by side (an upgrade
replaces the old one).

The tree itself is already versioned (/lib/modules/<version>/build), only
the /usr/src/kernel link is shared. So add KERNELDEV_VERSIONED_PACKAGE.
When it is "1", the tree is packaged as kernel-devsrc-<version>, and
kernel-devsrc keeps only the link and depends on the version it points
at, the way the kernel's kernel-image and kernel-modules packages depend
on their versioned packages.

The link stays a packaged file, so installing or upgrading kernel-devsrc
moves it with no postinst or postrm, and nothing has to run at rootfs
time. The debug info always records /usr/src/kernel, so the link pointing
at the current kernel is what debuggers expect; an older version installed
directly is reached through its own /lib/modules/<version>/source.
Anything that looks for kernel-devsrc by name (OEHasPackage in the
kernelmodule and stap runtime tests, IMAGE_INSTALL, the SDK) still finds
it.

The 'build' RDEPENDS go on the versioned package too, so a tree installed
on its own still has what it needs to build modules.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 46337bd79b..c2021002d4 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -59,6 +59,14 @@ KERNELDEV_SOURCE_SPINE ?= "block certs crypto fs include init io_uring ipc kerne
 
 KERNEL_BUILD_ROOT = "${nonarch_base_libdir}/modules/"
 
+# Set to "1" to package the tree as kernel-devsrc-<kernel version>, so the
+# trees of two kernel versions can be installed side by side. kernel-devsrc
+# then only holds the /usr/src/kernel link and depends on the version it
+# points at, like the kernel's own kernel-image/kernel-modules packages.
+# Installing or upgrading kernel-devsrc moves the link to that version, and
+# anything that looks for kernel-devsrc by name still finds it.
+KERNELDEV_VERSIONED_PACKAGE ?= ""
+
 # The 'build' level: what is needed to build out of tree modules against the
 # kernel ('make scripts prepare' on target), and what kernel-devsrc has
 # always contained.
@@ -566,6 +574,15 @@ do_install[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
 
 FILES:${PN} = "${KERNEL_BUILD_ROOT} ${KERNEL_SRC_PATH} /usr/src/kernel-source-*.tar.bz2"
 
+# The versioned tree (KERNELDEV_VERSIONED_PACKAGE). It is ahead of ${PN} in
+# PACKAGES, so it takes everything but the /usr/src/kernel link.
+PACKAGES =+ "${@'${PN}-tree' if d.getVar('KERNELDEV_VERSIONED_PACKAGE') == '1' else ''}"
+PKG:${PN}-tree = "${PN}-${@legitimize_package_name(d.getVar('KERNEL_VERSION') or '')}"
+FILES:${PN}-tree = "${KERNEL_BUILD_ROOT} /usr/src/kernel-source-*.tar.bz2"
+RDEPENDS:${PN}-tree = "${@bb.utils.contains('PACKAGECONFIG', 'build', '${KERNELDEV_BUILD_RDEPENDS}', '', d)}"
+SKIP_FILEDEPS:${PN}-tree = "${SKIP_FILEDEPS:${PN}}"
+RDEPENDS:${PN} += "${@'${PN}-tree (= ${EXTENDPKGV})' if d.getVar('KERNELDEV_VERSIONED_PACKAGE') == '1' else ''}"
+
 # Added to RDEPENDS:${PN} by the 'build' PACKAGECONFIG
 KERNELDEV_BUILD_RDEPENDS = "bc python3-core flex bison ${TCLIBC}-utils gawk"
 # 4.15+ needs these next two RDEPENDS
-- 
2.43.0

