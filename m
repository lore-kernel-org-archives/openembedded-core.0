Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 559757807D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Dec 2017 16:34:46 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id bi12so3355617plb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Dec 2017 08:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=GNsXPhfo1ImDBbETC7CQKYGBQNOzvwrqiYsMG0p/nbw=;
	b=opCteUAY2T+NriajteFJ3CUycidHYuNqYVRoEFSedLi5OT+pf9OCV5r2os3BeMS26o
	/ZcoubugDm5HGKZ74XZyAXkg17U10aN/Ype04Y2DASOogVTJXEY/bI46w+uT77fPT6jV
	roVSxGwHABFHd5/ro2CJ8fQsc3V8ei0Cw07+JAmgntVBb30JJXw4B5ygDqm7uw7TsSR+
	HzFshVhXfT7cMf9/nIU/N9CnbsN4QFRwofx+hNi7hiQRICwZXi2Q0LT8VvIZLLZ0nMoU
	g5Q31vvXud6uj7wrqdscAd0apQ8FVwOFY/JXqqCnGAMPB9xCt5rbymQPPtqtnzZoriiY
	B2ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=GNsXPhfo1ImDBbETC7CQKYGBQNOzvwrqiYsMG0p/nbw=;
	b=ZPo22Iu53GM6kqmaV2N6QoOeaP5UCPBegdHLNscHQYzSJkF/8fz/CJY/UpGsy0D0To
	xhoORZUBTopqXOyy5M+K4RHNhtRp5srA3q+VnT0PdlOkk5MCqaJ508HLf5pWyBNmPX8k
	h+mWgNBvN3LrJnLmGJ59OYk9DP7iTEANWx/Im+PsT+802/g0r9V/1gaZoJ14weA/c9aB
	3QnqyRGzdaDakqU02z6s2/GY09fpoX2qnvbwwPBSw/ZplBBfm70ycdufIgSnzyWPEK6k
	VTG+JmS+VPc/If8nr+6QAYNLDtjWGwDb/Y80CSh8BD4IvKiDtpens/IVIzZZrHqSmyqd
	Rerg==
X-Gm-Message-State: AKGB3mKjeSxHPBtqIMq+1OenH9kCFfymAMyarZtF5M/hWfJ68AGME300
	HdXwvxtayhyb1x2CZlyP2TQ=
X-Google-Smtp-Source: ACJfBovK+IAZipsHW9NIjQrNbhnQRvMjEgwPnOzk4RJ1TfqYjIcTsq9grwyHksP2WBf2AbqDd0NeRw==
X-Received: by 10.84.232.141 with SMTP id i13mr19832749plk.315.1513528487969; 
	Sun, 17 Dec 2017 08:34:47 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:35e6:5321:54f2:87e6])
	by smtp.gmail.com with ESMTPSA id
	t202sm18393035pgb.75.2017.12.17.08.34.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Dec 2017 08:34:47 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sun, 17 Dec 2017 08:34:36 -0800
Message-Id: <9b554ada3ff7ac9bce0edda9dbde67bf6464c37c.1513527416.git.akuster@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1513527416.git.akuster@mvista.com>
References: <cover.1513527416.git.akuster@mvista.com>
Subject: [PATCH 7/8] kexec-tools: update to 2.0.16 and simplify
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
X-List-Received-Date: Sun, 17 Dec 2017 16:34:46 -0000

From: Armin Kuster <akuster@mvista.com>

combine .inc with bb file

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-kernel/kexec/kexec-tools.inc          | 38 ----------
 ...kexec-tools_2.0.15.bb => kexec-tools_2.0.16.bb} | 84 +++++++++++++++-------
 2 files changed, 59 insertions(+), 63 deletions(-)
 delete mode 100644 meta/recipes-kernel/kexec/kexec-tools.inc
 rename meta/recipes-kernel/kexec/{kexec-tools_2.0.15.bb => kexec-tools_2.0.16.bb} (44%)

diff --git a/meta/recipes-kernel/kexec/kexec-tools.inc b/meta/recipes-kernel/kexec/kexec-tools.inc
deleted file mode 100644
index c689bec..0000000
--- a/meta/recipes-kernel/kexec/kexec-tools.inc
+++ /dev/null
@@ -1,38 +0,0 @@
-SUMMARY = "Kexec fast reboot tools"
-DESCRIPTION = "Kexec is a fast reboot feature that lets you reboot to a new Linux kernel"
-AUTHOR = "Eric Biederman"
-HOMEPAGE = "http://kernel.org/pub/linux/utils/kernel/kexec/"
-SECTION = "kernel/userland"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ea5bed2f60d357618ca161ad539f7c0a \
-                    file://kexec/kexec.c;beginline=1;endline=20;md5=af10f6ae4a8715965e648aa687ad3e09"
-DEPENDS = "zlib xz"
-
-SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz \
-           file://kdump \
-           file://kdump.conf \
-           file://kdump.service \
-"
-
-PR = "r1"
-
-inherit autotools
-
-COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*|powerpc.*|mips.*)-(linux|freebsd.*)'
-
-INSANE_SKIP_${PN} = "arch"
-
-do_compile_prepend() {
-    # Remove the prepackaged config.h from the source tree as it overrides
-    # the same file generated by configure and placed in the build tree
-    rm -f ${S}/include/config.h
-
-    # Remove the '*.d' file to make sure the recompile is OK
-    for dep in `find ${B} -type f -name '*.d'`; do
-        dep_no_d="`echo $dep | sed 's#.d$##'`"
-        # Remove file.d when there is a file.o
-        if [ -f "$dep_no_d.o" ]; then
-            rm -f $dep
-        fi
-    done
-}
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.15.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.16.bb
similarity index 44%
rename from meta/recipes-kernel/kexec/kexec-tools_2.0.15.bb
rename to meta/recipes-kernel/kexec/kexec-tools_2.0.16.bb
index 6bd9025..ebb4832 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.15.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.16.bb
@@ -1,19 +1,64 @@
-require kexec-tools.inc
+
+SUMMARY = "Kexec fast reboot tools"
+DESCRIPTION = "Kexec is a fast reboot feature that lets you reboot to a new Linux kernel"
+AUTHOR = "Eric Biederman"
+HOMEPAGE = "http://kernel.org/pub/linux/utils/kernel/kexec/"
+SECTION = "kernel/userland"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ea5bed2f60d357618ca161ad539f7c0a \
+                    file://kexec/kexec.c;beginline=1;endline=20;md5=af10f6ae4a8715965e648aa687ad3e09"
+DEPENDS = "zlib xz"
+
+PR = "r1"
+
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz \
+           file://kdump \
+           file://kdump.conf \
+           file://kdump.service \
+           file://0002-powerpc-change-the-memory-size-limit.patch \
+           file://0001-purgatory-Pass-r-directly-to-linker.patch \
+           file://0010-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch \
+           file://kexec-x32.patch \
+           file://0001-Disable-PIE-during-link.patch \
+         "
+
+SRC_URI[md5sum] = "5198968de79b5ded96f97f3c2ea9637b"
+SRC_URI[sha256sum] = "cf17fc99bf77c9b39f06ee88ac0e86d0349c4a0c3f8214a3cc78eece872f6f3a"
+
+inherit autotools update-rc.d systemd
+
 export LDFLAGS = "-L${STAGING_LIBDIR}"
 EXTRA_OECONF = " --with-zlib=yes"
 
-SRC_URI += "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz \
-            file://0002-powerpc-change-the-memory-size-limit.patch \
-            file://0001-purgatory-Pass-r-directly-to-linker.patch \
-            file://0010-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch \
-            file://kexec-x32.patch \
-            file://0001-Disable-PIE-during-link.patch \
-         "
+do_compile_prepend() {
+    # Remove the prepackaged config.h from the source tree as it overrides
+    # the same file generated by configure and placed in the build tree
+    rm -f ${S}/include/config.h
+
+    # Remove the '*.d' file to make sure the recompile is OK
+    for dep in `find ${B} -type f -name '*.d'`; do
+        dep_no_d="`echo $dep | sed 's#.d$##'`"
+        # Remove file.d when there is a file.o
+        if [ -f "$dep_no_d.o" ]; then
+            rm -f $dep
+        fi
+    done
+}
 
-SRC_URI[md5sum] = "78906fdc255656fa2b9996c8acb3ef62"
-SRC_URI[sha256sum] = "42dbd0dab9964cd1ed89fa4571c8d13191eb7132b361ade5ac44517c91ecb97e"
+do_install_append () {
+        install -d ${D}${sysconfdir}/sysconfig
+        install -m 0644 ${WORKDIR}/kdump.conf ${D}${sysconfdir}/sysconfig
 
-SECURITY_PIE_CFLAGS_remove = "-fPIE -pie"
+        if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+                install -D -m 0755 ${WORKDIR}/kdump ${D}${sysconfdir}/init.d/kdump
+        fi
+
+        if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+                install -D -m 0755 ${WORKDIR}/kdump ${D}${libexecdir}/kdump-helper
+                install -D -m 0644 ${WORKDIR}/kdump.service ${D}${systemd_unitdir}/system/kdump.service
+                sed -i -e 's,@LIBEXECDIR@,${libexecdir},g' ${D}${systemd_unitdir}/system/kdump.service
+        fi
+}
 
 PACKAGES =+ "kexec kdump vmcore-dmesg"
 
@@ -30,23 +75,12 @@ FILES_kdump = "${sbindir}/kdump \
 
 FILES_vmcore-dmesg = "${sbindir}/vmcore-dmesg"
 
-inherit update-rc.d systemd
-
 INITSCRIPT_PACKAGES = "kdump"
 INITSCRIPT_NAME_kdump = "kdump"
 INITSCRIPT_PARAMS_kdump = "start 56 2 3 4 5 . stop 56 0 1 6 ."
 
-do_install_append () {
-        install -d ${D}${sysconfdir}/sysconfig
-        install -m 0644 ${WORKDIR}/kdump.conf ${D}${sysconfdir}/sysconfig
+SECURITY_PIE_CFLAGS_remove = "-fPIE -pie"
 
-        if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
-                install -D -m 0755 ${WORKDIR}/kdump ${D}${sysconfdir}/init.d/kdump
-        fi
+COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*|powerpc.*|mips.*)-(linux|freebsd.*)'
 
-        if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
-                install -D -m 0755 ${WORKDIR}/kdump ${D}${libexecdir}/kdump-helper
-                install -D -m 0644 ${WORKDIR}/kdump.service ${D}${systemd_unitdir}/system/kdump.service
-                sed -i -e 's,@LIBEXECDIR@,${libexecdir},g' ${D}${systemd_unitdir}/system/kdump.service
-        fi
-}
+INSANE_SKIP_${PN} = "arch"
-- 
2.7.4


