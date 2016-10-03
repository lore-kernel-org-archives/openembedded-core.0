Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 597D560939
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2016 12:18:11 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id j129so9886461qkd.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2016 05:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=qGeBwhkg1QcXkEBrqRcwMdIokPr/zsH2esYUBI54iys=;
	b=T/rTHl/dMlaE15nASInPPiwSIf4soJXQF3s6YstAw0FAgtNY7JzjrVCr3L8vAnGrKE
	feQIldhbcSiBT95oKBhPPQ7fluNdew0N5BYnyFM1uuWFGar0dBAc2lEZXAPpfN8VBu2J
	iJF2f1qJ9uCsfiBdOSGVfTTR80v0CwPCcqlm5ll7QmR6w6bnHcficlPuPH1IhczStuwo
	lLFiwduIt+AOt+fJcAvfWFaPTVpMxqv4cXG54lQ/sc07Azedmn0TxNNVnCChR+/J25Sk
	GxrszVCNl8CfjFcpksdbxpGLjWkNBsp9N8NWJ1CSvnRONCJtGhrUcTuixy1nAuy8ptsW
	TabA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=qGeBwhkg1QcXkEBrqRcwMdIokPr/zsH2esYUBI54iys=;
	b=TLKZ7N9ctIM2rNmFPoXjlc6g02lBjs7EBjZ8W2Z4veLRqw+TJ8HdMh/eRbFAbd1bNc
	7oPsniSkEySH3kM/9uuhIoPDxx5JpP0LIqt38/GjHzfiYMJJVTSQJHL8DTDdt/JtKQDP
	MxcJVujX73RUtC3HTBEOc6Awmw3wiwmQYsMUk4nseCiq/cp4efkQo4duUVTpDjesNW9d
	CHKRmdFQ+CrIxAkcheGrJOzURsgtE6iyuU/pPsmEnTt7vdLWQwzNWQ9hxX2TOZpbU913
	Ofy0AdLGuNTArwpghCCLzz7jsWmxf5XK95+9bLLp+ez56L4ykqRodm0SA3F8La1GDvoj
	Ejvg==
X-Gm-Message-State: AA6/9RmCU2XPC4JphwlS547uPeBkOPxR6EGn77JsEeXRUkD3/63dLQsziU8nmwymZ1AgbA==
X-Received: by 10.55.190.193 with SMTP id o184mr19109563qkf.101.1475497093136; 
	Mon, 03 Oct 2016 05:18:13 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.100.224.38])
	by smtp.gmail.com with ESMTPSA id
	k65sm16842311qkf.7.2016.10.03.05.18.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 03 Oct 2016 05:18:12 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Oct 2016 09:17:34 -0300
Message-Id: <1475497055-1059-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 1/2] classes/uboot-extlinux-config: Add class
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
X-List-Received-Date: Mon, 03 Oct 2016 12:18:12 -0000

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
 meta/classes/uboot-extlinux-config.bbclass | 130 +++++++++++++++++++++++++++++
 1 file changed, 130 insertions(+)
 create mode 100644 meta/classes/uboot-extlinux-config.bbclass

diff --git a/meta/classes/uboot-extlinux-config.bbclass b/meta/classes/uboot-extlinux-config.bbclass
new file mode 100644
index 0000000..a4dc0c0
--- /dev/null
+++ b/meta/classes/uboot-extlinux-config.bbclass
@@ -0,0 +1,130 @@
+# uboot-extlinux-config.bbclass
+#
+# This class allow the extlinux.conf generation for U-Boot use. The
+# U-Boot support for it is given to allow the Generic Distribution
+# Configuration specification use by OpenEmbedded-based products.
+#
+# External variables:
+#
+# UBOOT_EXTLINUX_CONFIG            - Configuration file default set to source dir.
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
+UBOOT_EXTLINUX_CONFIG ??= "${S}/extlinux.conf"
+UBOOT_EXTLINUX_LABELS ??= "linux"
+UBOOT_EXTLINUX_FDTDIR ??= "../"
+UBOOT_EXTLINUX_KERNEL_IMAGE ??= "../${KERNEL_IMAGETYPE}"
+UBOOT_EXTLINUX_KERNEL_ARGS ??= "rootwait rw"
+UBOOT_EXTLINUX_MENU_DESCRIPTION_linux ??= "${DISTRO_NAME}"
+
+python create_extlinux_config() {
+    if d.getVar("UBOOT_EXTLINUX", False) == "1":
+        workdir = d.getVar('WORKDIR', True)
+        if not workdir:
+            bb.error("WORKDIR not defined, unable to package")
+            return
+
+        labels = d.getVar('UBOOT_EXTLINUX_LABELS', True)
+        if not labels:
+            bb.fatal(1, "UBOOT_EXTLINUX_LABELS not defined, nothing to do")
+            return
+
+        if labels == []:
+            bb.fatal(1, "No labels, nothing to do")
+            return
+
+        cfile = d.getVar('UBOOT_EXTLINUX_CONFIG', True)
+        if not cfile:
+            bb.fatal('Unable to read UBOOT_EXTLINUX_CONFIG')
+
+        try:
+            cfgfile = open(cfile, 'w')
+        except OSError:
+            bb.fatal('Unable to open %s' % (cfile))
+
+        cfgfile.write('# Generic Distro Configuration file generated by OpenEmbedded\n')
+
+        if len(labels.split()) > 1:
+            cfgfile.write('menu title Select the boot mode\n')
+
+        for label in labels.split():
+            localdata = bb.data.createCopy(d)
+
+            overrides = localdata.getVar('OVERRIDES', True)
+            if not overrides:
+                bb.fatal('OVERRIDES not defined')
+
+            localdata.setVar('OVERRIDES', label + ':' + overrides)
+            bb.data.update_data(localdata)
+
+            extlinux_console = localdata.getVar('UBOOT_EXTLINUX_CONSOLE', True)
+
+            menu_description = localdata.getVar('UBOOT_EXTLINUX_MENU_DESCRIPTION', True)
+            if not menu_description:
+                menu_description = label
+
+            root = localdata.getVar('UBOOT_EXTLINUX_ROOT', True)
+            if not root:
+                bb.fatal('UBOOT_EXTLINUX_ROOT not defined')
+
+            kernel_image = localdata.getVar('UBOOT_EXTLINUX_KERNEL_IMAGE', True)
+            fdtdir = localdata.getVar('UBOOT_EXTLINUX_FDTDIR', True)
+            if fdtdir:
+                cfgfile.write('LABEL %s\n\tKERNEL %s\n\tFDTDIR %s\n' %
+                             (menu_description, kernel_image, fdtdir))
+            else:
+                cfgfile.write('LABEL %s\n\tKERNEL %s\n' % (menu_description, kernel_image))
+
+            kernel_args = localdata.getVar('UBOOT_EXTLINUX_KERNEL_ARGS', True)
+
+            initrd = localdata.getVar('UBOOT_EXTLINUX_INITRD', True)
+            if initrd:
+                cfgfile.write('\tINITRD %s\n'% initrd)
+
+            kernel_args = root + " " + kernel_args
+            cfgfile.write('\tAPPEND %s %s\n' % (kernel_args, extlinux_console))
+
+        cfgfile.close()
+}
+
+do_install[prefuncs] += "create_extlinux_config"
-- 
2.1.4


