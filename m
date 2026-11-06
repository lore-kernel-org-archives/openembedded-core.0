Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1485.1793986360893605479
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 09:32:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=gHNCOs50;
 spf=pass (domain: gmail.com, ip: 209.85.222.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-9909e82513fso550383241.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 09:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793986360; x=1794591160; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e8LpKTU6it2L8eanVeCEE+/sIV0Elm5cOljaThuddZc=;
        b=gHNCOs50VnMfev5YOc2p1a5xpx2FON0NSm4xM54sOnbU4vkXQ8CSSjldkVPBdeXpvD
         4mjKzu4siRkkLCU9vikRCx5xFNw1oNYm3KG4U64EnBZHgJsHlH+sBm/Zh07oicVoeeaT
         s2F8sgjQDJNxIMGnabsGGTks/72GtAcRKGcNvspbhU2qU+y+hSH0wBv3pC1RfP9K8lH1
         hCFd5982m4jV0sY0xkLYfCFRFFgx10TXYyfXNHgduuCwuMl+D5036S0680ztFj+qZJzS
         CeMAk/0NoICPDgJHkDCofXMReXM6XleF5kngVyQITYUlRmwfHxgGyQTlX5aMtE0fzYR9
         VNSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793986360; x=1794591160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e8LpKTU6it2L8eanVeCEE+/sIV0Elm5cOljaThuddZc=;
        b=oyFy0N6qEwihKrYg+yLISxDfVyjhMXqxmDrR5Oejw4TvP9HomjIrV8j1TiD11Z/gH1
         JBdqOjXZsF9yUy2GTSeJTey2m/OWEomU6djpNHvjYU7P1yulyRfRbhb1BU0Hi0hG58uS
         ZvqJxtCAfzHBwOsQWVPhObePNDrk14Z79UJD8YnSGVcxrQ0dCmBWrzRZ6IzxEy865wd6
         IdQPO+jLNyfXR9FMAwsz/+iiiDUozrxW3VKDOURoDW4//Y/MP9XsATPFWqxBgX7NRjzW
         sxLJAzkmoTybWiZFHfoSLZ9wY+erPgGUngATI1wdtecduRdDjie3/0gVGT5v7zpgXwJZ
         8KPQ==
X-Gm-Message-State: APuU4Z9VMoeX23Ia8Gwf3WAyz3lAs9TYLo2sKyhf4+xgIq0A36d/TqNX
	P+2ARvwi0IFjAQy0JYEkpRncG/CLp7mAmi7Vfmz7O3pvR8tjGz/s41d+
X-Gm-Gg: AYBFou2/zoEdjqk5b4NlrMFa6Np8QPLBpUZyE8BitEakLh08cZFuU8YwJBSln5k19uD
	O8ZOkDnqb1N/N/p9FsweX9vk8ApIb95UJoHBRv3CHaIisU/PbA+NkvVoYnoBMGkOVm8yGDo58Hf
	0C9WJJhVDqiz1fzjOmNPSGcYvroBp/jP9vRMXGbGDvrlPWUW3EJd1ul1kmF9w5Muc+5yvkxXtTG
	e4Rrdr0QuCtB7Gq/neqYGM1nnlhzfko7dc7B/aqWplBLb6bfjOLFxBLp3rGlDP3Cknvla2NfJ4v
	q0hlNJ+a5zeXVZcwCe2jgm7lyYmaCO0nWyWWNUwKuKQN8rjS4J6ddbJ6XeRKBUlCg6UTNOplReZ
	XeTu77K8rQFwmjBR2DzpkOMdL30Gheqn2odiKoX3Hbb7hFg6ZZmxrKvRqWLtQFVbFY0wpO9jB7t
	AQ0uO9xRlkiuW3FW8wWC7KnQNWrihZpJrSEHedbhVkugTd9oWxtAcbvHYvdh6Z7jnV1s9mkdW8g
	IL1uVzSqHJgbp3bTn2BsFDx/YfwYd5D+sjQQDcRimS8WjWefIehHYZoTr50caTUYNoTZ135cUkB
	iZQXMVm0m23vOeQRvLAJf7+UH/WkcK6zG1nNN7sQjroL77a7VhMYNMSsNYmeopAL6h81Y8KKqid
	YFHE5jCfgUhwJ7Zakxy/J0pwYweqmJoyJFqgVF0kFY5qHHUZcnRP05nWY1qVF3CtSOqWLlJy91P
	ucdDTQb/5HIOXu3AnIVzqIbqCkmt7t4STWc1YfJTkcwaBtHFw=
X-Received: by 2002:a05:6102:c94:b0:7ce:a873:731e with SMTP id ada2fe7eead31-7d286ae0c00mr2842727137.29.1793986359576;
        Fri, 06 Nov 2026 09:32:39 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from bruce-XPS-8940.localdomain (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99ba74a6964sm2335848241.0.2026.11.06.09.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:32:39 -0800 (PST)
From: bruce.ashfield@gmail.com
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][RFC PATCH 03/08] kernel-devsrc: add build and source PACKAGECONFIG levels
Date: Fri,  6 Nov 2026 12:32:30 -0500
Message-ID: <20261106173235.4155305-4-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106173235.4155305-1-bruce.ashfield@gmail.com>
References: <20261106173235.4155305-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 17:32:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249703
Content-Type: text/plain; charset="utf-8"

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Debugging the kernel from a debug rootfs needs its source at
/usr/src/kernel, where the debug info points, but kernel-devsrc only
carries what is needed to build modules, and installing it pulls in the
build tools (bc, bison, flex, gcc-plugins, openssl-dev, ...).

Split the content of the one kernel-devsrc tree into PACKAGECONFIG
levels instead of adding a second source package:

  build:  today's content and RDEPENDS ('make scripts prepare' on
          target). The default, so nothing changes for existing users.
  source: a curated spine (KERNELDEV_SOURCE_SPINE plus arch/${ARCH})
          and the drivers/sound files the kernel build read, taken from
          the kernel's kernel-source-files manifest. Only source files
          are copied, never scripts, so there are no runtime or file
          dependencies.

The RDEPENDS are split out, so they are only added when the 'build'
level is enabled.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 107 +++++++++++++++------
 1 file changed, 80 insertions(+), 27 deletions(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 90bdbfc534..3b83fd145c 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -28,30 +28,31 @@ B = "${STAGING_KERNEL_BUILDDIR}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+# The flags choose what goes in the kernel-devsrc tree:
+#   build:  what is needed to build out of tree modules against the kernel
+#           ('make scripts prepare' on target). The default, and what
+#           kernel-devsrc has always been.
+#   source: the source needed to debug a kernel built for a specific
+#           MACHINE, see KERNELDEV_SOURCE_SPINE. No runtime dependencies,
+#           so it can go in a debug rootfs without the build tools.
+PACKAGECONFIG ?= "build"
+PACKAGECONFIG[build] = ",,,${KERNELDEV_BUILD_RDEPENDS}"
+PACKAGECONFIG[source] = ",,"
+
+# The curated part of the 'source' level, copied in full along with
+# arch/${ARCH}. The rest (drivers, sound, samples, ...) is not curated: the
+# files the kernel build read are discovered from the manifest the kernel
+# stages in do_shared_workdir. The manifest could find the spine's files too,
+# but the spine is listed so that 'source' always has a sane default.
+KERNELDEV_SOURCE_SPINE ?= "block certs crypto fs include init io_uring ipc kernel lib mm net security virt"
+
 KERNEL_BUILD_ROOT = "${nonarch_base_libdir}/modules/"
 
-do_install() {
+# The 'build' level: what is needed to build out of tree modules against the
+# kernel ('make scripts prepare' on target), and what kernel-devsrc has
+# always contained.
+kernel_devsrc_install_build() {
     kerneldir=${D}${KERNEL_BUILD_ROOT}${KERNEL_VERSION}
-    install -d $kerneldir
-
-    # create the directory structure
-    rm -f $kerneldir/build
-    rm -f $kerneldir/source
-    mkdir -p $kerneldir/build
-
-    # for compatibility with some older variants of this package, we
-    # create  a /usr/src/kernel symlink to /lib/modules/<version>/source
-    mkdir -p ${D}/usr/src
-    (
-        cd ${D}/usr/src
-        ln -rs ${D}${KERNEL_BUILD_ROOT}${KERNEL_VERSION}/source kernel
-    )
-
-    # for on target purposes, we unify build and source
-    (
-        cd $kerneldir
-        ln -s build source
-    )
 
     # first copy everything
     (
@@ -448,7 +449,58 @@ do_install() {
         sed -i 's,/usr/bin/env python2,/usr/bin/env python3,' "$ss"
         sed -i 's,/usr/bin/python$,/usr/bin/env python3,' "$ss"
     done
+}
+
+# The 'source' level: the curated spine plus the files the kernel build read,
+# from the manifest the kernel stages in do_shared_workdir. Only source files
+# are copied, never scripts, so the package gets no interpreter dependencies.
+kernel_devsrc_install_source() {
+    kerneldir=${D}${KERNEL_BUILD_ROOT}${KERNEL_VERSION}
 
+    if [ ! -s ${B}/kernel-source-files ]; then
+        bbfatal "${B}/kernel-source-files is missing, the kernel did not stage its source manifest"
+    fi
+    (
+        cd ${S}
+        {
+            find ${KERNELDEV_SOURCE_SPINE} arch/${ARCH} -type f
+            cat ${B}/kernel-source-files
+        } | grep -E '\.([chS]|rs)$' | sort -u | cpio --quiet -pdlu $kerneldir/build
+    )
+}
+
+do_install() {
+    kerneldir=${D}${KERNEL_BUILD_ROOT}${KERNEL_VERSION}
+    install -d $kerneldir
+
+    # create the directory structure
+    rm -f $kerneldir/build
+    rm -f $kerneldir/source
+    mkdir -p $kerneldir/build
+
+    # for compatibility with some older variants of this package, we
+    # create  a /usr/src/kernel symlink to /lib/modules/<version>/source
+    mkdir -p ${D}/usr/src
+    (
+        cd ${D}/usr/src
+        ln -rs ${D}${KERNEL_BUILD_ROOT}${KERNEL_VERSION}/source kernel
+    )
+
+    # for on target purposes, we unify build and source
+    (
+        cd $kerneldir
+        ln -s build source
+    )
+
+    if [ -n "${@bb.utils.contains('PACKAGECONFIG', 'build', '1', '', d)}" ]; then
+        kernel_devsrc_install_build
+    fi
+
+    # The 'source' level goes in the same tree, at /usr/src/kernel, which is
+    # where the kernel's debug info points.
+    if [ -n "${@bb.utils.contains('PACKAGECONFIG', 'source', '1', '', d)}" ]; then
+        kernel_devsrc_install_source
+    fi
     chown -R root:root ${D}
 }
 
@@ -457,14 +509,15 @@ do_install[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
 
 FILES:${PN} = "${KERNEL_BUILD_ROOT} ${KERNEL_SRC_PATH}"
 
-RDEPENDS:${PN} = "bc python3-core flex bison ${TCLIBC}-utils gawk"
+# Added to RDEPENDS:${PN} by the 'build' PACKAGECONFIG
+KERNELDEV_BUILD_RDEPENDS = "bc python3-core flex bison ${TCLIBC}-utils gawk"
 # 4.15+ needs these next two RDEPENDS
-RDEPENDS:${PN} += "openssl-dev util-linux"
+KERNELDEV_BUILD_RDEPENDS += "openssl-dev util-linux"
 # and x86 needs a bit more for 4.15+
-RDEPENDS:${PN} += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-dev', '', d)}"
+KERNELDEV_BUILD_RDEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-dev', '', d)}"
 # powerpc needs elfutils on 6.3+
-RDEPENDS:${PN} += "${@bb.utils.contains('ARCH', 'powerpc', 'elfutils-dev', '', d)}"
+KERNELDEV_BUILD_RDEPENDS += "${@bb.utils.contains('ARCH', 'powerpc', 'elfutils-dev', '', d)}"
 # 5.8+ needs gcc-plugins libmpc-dev
-RDEPENDS:${PN} += "gcc-plugins libmpc-dev"
+KERNELDEV_BUILD_RDEPENDS += "gcc-plugins libmpc-dev"
 # 5.13+ needs grep for powerpc
-RDEPENDS:${PN}:append:powerpc = " grep"
+KERNELDEV_BUILD_RDEPENDS:append:powerpc = " grep"
-- 
2.43.0

