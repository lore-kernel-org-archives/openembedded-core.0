Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id EEBD06131F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2020 14:55:30 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id u124so1824254qkh.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2020 06:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=3sew/TlYIjrAM191ItQY5o6UFuCAc5rYmXXcZpQemXA=;
	b=F8glzEozNEHDiv2ekvYHTSjbd2KmLuF8il+MRYAOyjDNsKE7ia8RSGbl4F2OvStxBe
	GViTjV0DbbetsAD7aO/qx4l2jr9shNz5wy3mebXrW56sifZMqDEtZ/hqySiYT3bcjykk
	ZZM2Fu18wawlc81EH7oy055Nbr+Il/Ta138XwENm0Jp0Wop3GZWDRTLG4kF6aga8O6Nc
	l+m0RcCXr5mjdHoykYgWfauuMHzzRo0JOlNfJZsEiSFhw9Vm4GOa0h1Hspt0AKaJnLfr
	Xke3Dp2qQPxKVzQcIqzxy+RjhON9FWiGHYuu37UH5rdWk5ZHGSVanQ8yRlkjFj4w3BfO
	ShWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=3sew/TlYIjrAM191ItQY5o6UFuCAc5rYmXXcZpQemXA=;
	b=UCKLMgmGHVvlz7NYwjZtu+SbLfLRs+oPMETLtqqQhrT2KmSgBR7uNI45yRGh7alyuW
	penDAGI26OJvb/cvaqEwhFYYB9/4IQqUGc/g2eDD3vjLxcIGRz8bfds0aixPP2rwB5I6
	++JFCLLJPFLruOtPMOhCvFzJJRDvtPZy5rMhLTMNID22QZLa06Wvw8JmLt1r1UVYRJG6
	s7FrQzFElqT8SXlbsyaC7+9+alLv1m+ceMzAe1W5+NNyTE9TXDnWnVai3AoaY/31TuEW
	kKFZDA9KskQZvLc/4Y7BDrQWVGVmNrTkRBMycLgl4MNjKhLQFOewvFmuDztR55lNoyTw
	5BxA==
X-Gm-Message-State: ANhLgQ3U/l3S5NdCJFrszKXhs6Db4fe7kOJ69MgcHnmyn3mpcWsQHGLg
	DP2bS3eDnjwhKq+jf2n9S9dXsgQg2PXQZA==
X-Google-Smtp-Source: ADFU+vuhdgKoRhoQK17lygwB9WheXr9EkCQ185LoaHFVIXGpxmyITlfjWczBWJ7XSTX7xj3G8+OcAg==
X-Received: by 2002:ae9:e003:: with SMTP id m3mr3408649qkk.250.1583333731699; 
	Wed, 04 Mar 2020 06:55:31 -0800 (PST)
Received: from localhost.localdomain
	(CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.240.214]) by smtp.gmail.com with ESMTPSA id
	w83sm13455065qkb.83.2020.03.04.06.55.30
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Mar 2020 06:55:31 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Wed,  4 Mar 2020 09:55:24 -0500
Message-Id: <8141796746818f0e5ba8f9eece7ee5a4f0b4218b.1583333447.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1583333447.git.bruce.ashfield@gmail.com>
References: <cover.1583333447.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] linux-yocto: drop 5.2 recipes
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
X-List-Received-Date: Wed, 04 Mar 2020 14:55:31 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

linux-yocto 5.4 will serve as the versioned reference kernel in
the upcoming release, and -dev will serve as the "newer" kernel.

As such, we drop v5.2 from master, but will continue to update
and support it in released branches.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.2.bb               | 44 ---------------
 .../linux/linux-yocto-tiny_5.2.bb             | 32 -----------
 meta/recipes-kernel/linux/linux-yocto_5.2.bb  | 54 -------------------
 3 files changed, 130 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto_5.2.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
deleted file mode 100644
index a23a5e6f93..0000000000
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
+++ /dev/null
@@ -1,44 +0,0 @@
-KBRANCH ?= "v5.2/standard/preempt-rt/base"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-# Skip processing of this recipe if it is not explicitly specified as the
-# PREFERRED_PROVIDER for virtual/kernel. This avoids errors when trying
-# to build multiple virtual/kernel providers, e.g. as dependency of
-# core-image-rt-sdk, core-image-rt.
-python () {
-    if d.getVar("KERNEL_PACKAGE_NAME") == "kernel" and d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-yocto-rt":
-        raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
-}
-
-SRCREV_machine ?= "78e147f949b5b18524aa7bd72f1cc8f7ae8039f8"
-SRCREV_meta ?= "bb2776d6beaae64b1a0fc902b64376f082085498"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.2;destsuffix=${KMETA}"
-
-LINUX_VERSION ?= "5.2.32"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-
-DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
-DEPENDS += "openssl-native util-linux-native"
-
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-KMETA = "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL = "2"
-
-LINUX_KERNEL_TYPE = "preempt-rt"
-
-COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuarmv5|qemuarm64|qemuppc|qemumips)"
-
-KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
-
-# Functionality flags
-KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
-KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
-KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
-KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES_append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
deleted file mode 100644
index ac9904f415..0000000000
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-KBRANCH ?= "v5.2/standard/tiny/base"
-KBRANCH_qemuarm  ?= "v5.2/standard/tiny/arm-versatile-926ejs"
-
-LINUX_KERNEL_TYPE = "tiny"
-KCONFIG_MODE = "--allnoconfig"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-LINUX_VERSION ?= "5.2.32"
-LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-
-DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
-DEPENDS += "openssl-native util-linux-native"
-
-KMETA = "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL = "2"
-
-SRCREV_machine_qemuarm ?= "e0a3a01b24070b15121e938ea19755091bf0d662"
-SRCREV_machine ?= "73b12de4c879e4569bef3b2d0ee9c783a9788b27"
-SRCREV_meta ?= "bb2776d6beaae64b1a0fc902b64376f082085498"
-
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.2;destsuffix=${KMETA}"
-
-COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm|qemuarmv5"
-
-# Functionality flags
-KERNEL_FEATURES = ""
-
-KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.2.bb b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
deleted file mode 100644
index eab142e1c6..0000000000
--- a/meta/recipes-kernel/linux/linux-yocto_5.2.bb
+++ /dev/null
@@ -1,54 +0,0 @@
-KBRANCH ?= "v5.2/standard/base"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-# board specific branches
-KBRANCH_qemuarm  ?= "v5.2/standard/arm-versatile-926ejs"
-KBRANCH_qemuarm64 ?= "v5.2/standard/qemuarm64"
-KBRANCH_qemumips ?= "v5.2/standard/mti-malta32"
-KBRANCH_qemuppc  ?= "v5.2/standard/qemuppc"
-KBRANCH_qemuriscv64  ?= "v5.2/standard/base"
-KBRANCH_qemux86  ?= "v5.2/standard/base"
-KBRANCH_qemux86-64 ?= "v5.2/standard/base"
-KBRANCH_qemumips64 ?= "v5.2/standard/mti-malta64"
-
-SRCREV_machine_qemuarm ?= "fdb7cd1bb5e4238e5b3d120ce9db31119ec2b5ee"
-SRCREV_machine_qemuarm64 ?= "73b12de4c879e4569bef3b2d0ee9c783a9788b27"
-SRCREV_machine_qemumips ?= "eb7faee13cfce200e9add4ba1852a3fe5d8b92e6"
-SRCREV_machine_qemuppc ?= "73b12de4c879e4569bef3b2d0ee9c783a9788b27"
-SRCREV_machine_qemuriscv64 ?= "73b12de4c879e4569bef3b2d0ee9c783a9788b27"
-SRCREV_machine_qemux86 ?= "73b12de4c879e4569bef3b2d0ee9c783a9788b27"
-SRCREV_machine_qemux86-64 ?= "73b12de4c879e4569bef3b2d0ee9c783a9788b27"
-SRCREV_machine_qemumips64 ?= "8e3bfeb7e9b5aa92c5bea941d361ff5b081a2aaa"
-SRCREV_machine ?= "73b12de4c879e4569bef3b2d0ee9c783a9788b27"
-SRCREV_meta ?= "bb2776d6beaae64b1a0fc902b64376f082085498"
-
-# remap qemuarm to qemuarma15 for the 5.2 kernel
-# KMACHINE_qemuarm ?= "qemuarma15"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.2;destsuffix=${KMETA}"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.2.32"
-
-DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
-DEPENDS += "openssl-native util-linux-native"
-
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-KMETA = "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL = "2"
-
-KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
-
-COMPATIBLE_MACHINE = "qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemuriscv64"
-
-# Functionality flags
-KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
-KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
-KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
-KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
-KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
-- 
2.19.1


