Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id F3E326E64A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2016 13:54:51 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id 49so3062153uac.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Oct 2016 06:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=86b7bVuCzCeJhH2FhzgQ6/kOm/aGWjUvDBtSsE9KlC0=;
	b=o4aVuBdbwtR8ddafwvSmqi9eQjRh1T6HhQqPfFKLQmCrKmqKQn9/vKSRdpWRZ0Ec+L
	Yuvk9Jl5DBn6J4oSj75ty95+d5rgnwzqfHOmoozYIzG+g7y+1W5o15ArQNGhTTG3Dijc
	UJXKFHlKnjQVPBmHidbEfHS6x0zNV23EKH80m7GJa9lfPHEgavxKZKVNYXnnknD1WAgs
	nwjcTsy+M9tGau9iJoJRFHOHHikzN7zmF8mU0Tw1u7K9W6cT+9mk5vXfsfqCUkXtzkUH
	6pDCqZzLwdjnVoG8pPw3+1BqRtzw6xwbY9d60LZtr/13IxgCGYvHpRAvM3a2pVkCfoEy
	qN1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=86b7bVuCzCeJhH2FhzgQ6/kOm/aGWjUvDBtSsE9KlC0=;
	b=jzxq4GdOGP7ge/6VUdjmmR1lUlHkaPPHQZGhVo4hIIR0kihCyud5gPH2fiuCYNQLyT
	FZfH5IYrtmSg84A1EQ40NonmjX7vn72SbdPhK/4OtqVDVv6AYRdMCQizoWEATsqvJaOp
	50LIe3xWLl9K58ybD8I4bKGsoIXOD847FcrLjW1joss8Pn/HZgBl1RLfzpnbxENGiHqJ
	JRMyURS+Gw6jMI2fQeYWvGq7bmgr3zbjLRFGpjebovTjsskXzxOqg5DBCNCSsZ/v0pJA
	p+wA6jA3sAoS1fBRYzUbz9VGB1xcPIXn05hxRmYQEHj/8mMmsTQLMZ26d9B8qQzcQ96Y
	Dn/A==
X-Gm-Message-State: AA6/9RmgP3VCUcrjFX9GtznhTXTZfENApNZix1GdTo1Xmg+buEQsoXahWGBf2MHltukjTA==
X-Received: by 10.176.16.10 with SMTP id f10mr1836298uab.129.1475589292598;
	Tue, 04 Oct 2016 06:54:52 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([187.23.155.148])
	by smtp.gmail.com with ESMTPSA id p129sm934057vkd.4.2016.10.04.06.54.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 04 Oct 2016 06:54:51 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Oct 2016 10:54:10 -0300
Message-Id: <1475589251-19942-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v3 1/2] classes/uboot-extlinux-config: Add class
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
X-List-Received-Date: Tue, 04 Oct 2016 13:54:52 -0000

This class allow the extlinux.conf generation for U-Boot use.
The U-Boot support for it is given to allow the Generic Distribution
Configuration specification use by OpenEmbedded-based products.

This class can be inherited by u-boot recipes to create extlinux.conf
and boot using menu options.

U-boot with extlinux support is machine dependent, so to use this class
you need to set UBOOT_EXTLINUX to 1 in machine configuration file and
also set root= kernel cmdline UBOOT_EXTLINUX_ROOT. This variable is used
to pass root kernel cmdline, e.g:

UBOOT_EXTLINUX_ROOT = "root=/dev/mmcblk2p2"

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/uboot-extlinux-config.bbclass | 126 +++++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)
 create mode 100644 meta/classes/uboot-extlinux-config.bbclass

diff --git a/meta/classes/uboot-extlinux-config.bbclass b/meta/classes/uboot-extlinux-config.bbclass
new file mode 100644
index 0000000..df91386
--- /dev/null
+++ b/meta/classes/uboot-extlinux-config.bbclass
@@ -0,0 +1,126 @@
+# uboot-extlinux-config.bbclass
+#
+# This class allow the extlinux.conf generation for U-Boot use. The
+# U-Boot support for it is given to allow the Generic Distribution
+# Configuration specification use by OpenEmbedded-based products.
+#
+# External variables:
+#
+# UBOOT_EXTLINUX_CONSOLE           - Set to "console=ttyX" to change kernel boot
+#                                    default console.
+# UBOOT_EXTLINUX_LABELS            - A list of targets for the automatic config.
+# UBOOT_EXTLINUX_KERNEL_ARGS       - Add additional kernel arguments.
+# UBOOT_EXTLINUX_KERNEL_IMAGE      - Kernel image name.
+# UBOOT_EXTLINUX_FDTDIR            - Device tree directory.
+# UBOOT_EXTLINUX_INITRD            - Indicates a list of filesystem images to
+#                                    concatenate and use as an initrd (optional).
+# UBOOT_EXTLINUX_MENU_DESCRIPTION  - Name to use as description.
+# UBOOT_EXTLINUX_ROOT              - Root kernel cmdline.
+#
+# If there's only one label system will boot automatically and menu won't be
+# created. If you want to use more than one labels, e.g linux and alternate,
+# use overrides to set menu description, console and others variables.
+#
+# Ex:
+#
+# UBOOT_EXTLINUX_LABELS ??= "default fallback"
+#
+# UBOOT_EXTLINUX_KERNEL_IMAGE_default ??= "../zImage"
+# UBOOT_EXTLINUX_MENU_DESCRIPTION_default ??= "Linux Default"
+#
+# UBOOT_EXTLINUX_KERNEL_IMAGE_fallback ??= "../zImage-fallback"
+# UBOOT_EXTLINUX_MENU_DESCRIPTION_fallback ??= "Linux Fallback"
+#
+# Results:
+#
+# menu title Select the boot mode
+# LABEL Linux Default
+#   KERNEL ../zImage
+#   FDTDIR ../
+#   APPEND root=/dev/mmcblk2p2 rootwait rw console=${console}
+# LABEL Linux Fallback
+#   KERNEL ../zImage-fallback
+#   FDTDIR ../
+#   APPEND root=/dev/mmcblk2p2 rootwait rw console=${console}
+#
+# Copyright (C) 2016, O.S. Systems Software LTDA.  All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+#
+# The kernel has an internal default console, which you can override with
+# a console=...some_tty...
+UBOOT_EXTLINUX_CONSOLE ??= "console=${console}"
+UBOOT_EXTLINUX_LABELS ??= "linux"
+UBOOT_EXTLINUX_FDTDIR ??= "../"
+UBOOT_EXTLINUX_KERNEL_IMAGE ??= "../${KERNEL_IMAGETYPE}"
+UBOOT_EXTLINUX_KERNEL_ARGS ??= "rootwait rw"
+UBOOT_EXTLINUX_MENU_DESCRIPTION_linux ??= "${DISTRO_NAME}"
+
+UBOOT_EXTLINUX_CONFIG = "${B}/extlinux.conf"
+
+python create_extlinux_config() {
+    if d.getVar("UBOOT_EXTLINUX", True) != "1":
+      return
+
+    if not d.getVar('WORKDIR', True):
+        bb.error("WORKDIR not defined, unable to package")
+
+    labels = d.getVar('UBOOT_EXTLINUX_LABELS', True)
+    if not labels:
+        bb.fatal("UBOOT_EXTLINUX_LABELS not defined, nothing to do")
+
+    if not labels.strip():
+        bb.fatal("No labels, nothing to do")
+
+    cfile = d.getVar('UBOOT_EXTLINUX_CONFIG', True)
+    if not cfile:
+        bb.fatal('Unable to read UBOOT_EXTLINUX_CONFIG')
+
+    try:
+        with open(cfile, 'w') as cfgfile:
+            cfgfile.write('# Generic Distro Configuration file generated by OpenEmbedded\n')
+
+            if len(labels.split()) > 1:
+                cfgfile.write('menu title Select the boot mode\n')
+
+            for label in labels.split():
+                localdata = bb.data.createCopy(d)
+
+                overrides = localdata.getVar('OVERRIDES', True)
+                if not overrides:
+                    bb.fatal('OVERRIDES not defined')
+
+                localdata.setVar('OVERRIDES', label + ':' + overrides)
+                bb.data.update_data(localdata)
+
+                extlinux_console = localdata.getVar('UBOOT_EXTLINUX_CONSOLE', True)
+
+                menu_description = localdata.getVar('UBOOT_EXTLINUX_MENU_DESCRIPTION', True)
+                if not menu_description:
+                    menu_description = label
+
+                root = localdata.getVar('UBOOT_EXTLINUX_ROOT', True)
+                if not root:
+                    bb.fatal('UBOOT_EXTLINUX_ROOT not defined')
+
+                kernel_image = localdata.getVar('UBOOT_EXTLINUX_KERNEL_IMAGE', True)
+                fdtdir = localdata.getVar('UBOOT_EXTLINUX_FDTDIR', True)
+                if fdtdir:
+                    cfgfile.write('LABEL %s\n\tKERNEL %s\n\tFDTDIR %s\n' %
+                                 (menu_description, kernel_image, fdtdir))
+                else:
+                    cfgfile.write('LABEL %s\n\tKERNEL %s\n' % (menu_description, kernel_image))
+
+                kernel_args = localdata.getVar('UBOOT_EXTLINUX_KERNEL_ARGS', True)
+
+                initrd = localdata.getVar('UBOOT_EXTLINUX_INITRD', True)
+                if initrd:
+                    cfgfile.write('\tINITRD %s\n'% initrd)
+
+                kernel_args = root + " " + kernel_args
+                cfgfile.write('\tAPPEND %s %s\n' % (kernel_args, extlinux_console))
+
+    except OSError:
+        bb.fatal('Unable to open %s' % (cfile))
+}
+
+do_install[prefuncs] += "create_extlinux_config"
-- 
2.1.4


