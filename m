Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
	[209.85.160.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0BC4F7F404
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 17:12:34 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id r15so7805054qtn.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2019 10:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=knvPBWSfz6zzEZ/1DqSx8Iq2MhFvtqDwwdHoFEfbMQo=;
	b=GQKLCBuwSdbeq9E0dx3xb069sV7nxBbOtButim2uohUYAl67mhy0L2+0ZcMvziQjjq
	bzXIzgB82VKIIRENt2Qt4f05/aZNI8ml+z45htndGJv0obL8z906+CEFeg3J8x5PLWvx
	WL5SfxnY/lgCUEPNHIQgFlH3KD4TJ3egL/QV1EST+gwqZe9ErPIwt0zLnMIpe1c/ZzGQ
	Rovzk3iky69j73H5U7GtyzaqAYmnDIeAzYS073vxv7FBLoAYLXdyU++rqHEMBGzKsK+k
	ckuLHIbGOXO2pYTKjJR0de+QAi8qMpNWr5PqKzOASEMd/FcTKTcA0wMrDVjJDgmnKP8n
	L22A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=knvPBWSfz6zzEZ/1DqSx8Iq2MhFvtqDwwdHoFEfbMQo=;
	b=KZsLk8o2dnh9zsrncilEpWuWbVi6RjkhOMmJaDFYP28/qkjTGqDNec0yL526o7nOFd
	aOtd2En+6lY2TbCYgKee19r7QPo6k1EX1JR8a0FdkO4fe5jGNNqyeH+pfstudZVrE7wd
	dqfbpiS+Q1ljS1WmxAczR9UWeFTyAntxpguPIeSQkbhBHjjf2T7flOqbQJOvyE0LJOU9
	nyvIJ6XkpBpQvFeCBS6Hfb9jI8I1MapHIJpEdT0CMlPnNKd41pcDOn2TCn4LjzcAyITb
	/6ae7XLosmonujDaInItKF4XKYcCJ+I5BtvhgmxIkLGDRxdpN7LJbzPp5ucEmXYSQ5fW
	4oTg==
X-Gm-Message-State: APjAAAW/Mgi+T6xEZXKW6JTKYCmyIqpN64Z2hJrBWgMXJKtDEP5Iz2bj
	nBDktavcxfhgiFS2iP+cmJ8=
X-Google-Smtp-Source: APXvYqyf7FszBXvULxSIRHE3cBIm/fzWtD57N/NSB4wAqlGmm3ZvSiwLvSkKsblqEkUpYAcXM83QSw==
X-Received: by 2002:ac8:53c9:: with SMTP id c9mr8716709qtq.160.1567789955481; 
	Fri, 06 Sep 2019 10:12:35 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	u132sm3313330qka.50.2019.09.06.10.12.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Sep 2019 10:12:34 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Fri,  6 Sep 2019 13:12:33 -0400
Message-Id: <20190906171233.65273-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto: drop 5.0 recipes
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
X-List-Received-Date: Fri, 06 Sep 2019 17:12:35 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The 5.2 reference kernels replace the EOL 5.0 series. So we drop
the named recipes.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

I checked all the layers that I typically use (as well as core) and
can't find any references to 5.0 .. but I'm sure I missed one somewhere.

Here's the patch to drop the 5.0 recipes, so we'll find out what I
missed shortly.

Bruce


 .../linux/linux-yocto-rt_5.0.bb               | 44 ---------------
 .../linux/linux-yocto-tiny_5.0.bb             | 32 -----------
 meta/recipes-kernel/linux/linux-yocto_5.0.bb  | 54 -------------------
 3 files changed, 130 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto_5.0.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
deleted file mode 100644
index 22f3bf1951..0000000000
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
+++ /dev/null
@@ -1,44 +0,0 @@
-KBRANCH ?= "v5.0/standard/preempt-rt/base"
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
-SRCREV_machine ?= "e6cb812b5532630b6fc6dfd7778d57a4907d3180"
-SRCREV_meta ?= "7f6e97c357746382d4339e7e0463637e715acd4b"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=${KMETA}"
-
-LINUX_VERSION ?= "5.0.19"
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
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
deleted file mode 100644
index 33672c6d49..0000000000
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-KBRANCH ?= "v5.0/standard/tiny/base"
-KBRANCH_qemuarm  ?= "v5.0/standard/tiny/arm-versatile-926ejs"
-
-LINUX_KERNEL_TYPE = "tiny"
-KCONFIG_MODE = "--allnoconfig"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-LINUX_VERSION ?= "5.0.19"
-LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-
-DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
-DEPENDS += "openssl-native util-linux-native"
-
-KMETA = "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL = "2"
-
-SRCREV_machine_qemuarm ?= "b9001287984b0066814c8739f38d629de73739b7"
-SRCREV_machine ?= "55dd15336b7301b686a0c183f5372b49c1003d03"
-SRCREV_meta ?= "7f6e97c357746382d4339e7e0463637e715acd4b"
-
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=${KMETA}"
-
-COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm|qemuarmv5"
-
-# Functionality flags
-KERNEL_FEATURES = ""
-
-KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
deleted file mode 100644
index 887e88e087..0000000000
--- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
+++ /dev/null
@@ -1,54 +0,0 @@
-KBRANCH ?= "v5.0/standard/base"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-# board specific branches
-KBRANCH_qemuarm  ?= "v5.0/standard/arm-versatile-926ejs"
-KBRANCH_qemuarm64 ?= "v5.0/standard/qemuarm64"
-KBRANCH_qemumips ?= "v5.0/standard/mti-malta32"
-KBRANCH_qemuppc  ?= "v5.0/standard/qemuppc"
-KBRANCH_qemuriscv64  ?= "v5.0/standard/base"
-KBRANCH_qemux86  ?= "v5.0/standard/base"
-KBRANCH_qemux86-64 ?= "v5.0/standard/base"
-KBRANCH_qemumips64 ?= "v5.0/standard/mti-malta64"
-
-SRCREV_machine_qemuarm ?= "d1ed980ad989252d42386c8bc63b2f5f11985ea4"
-SRCREV_machine_qemuarm64 ?= "55dd15336b7301b686a0c183f5372b49c1003d03"
-SRCREV_machine_qemumips ?= "1520e78195e64f27be46a46a8d6711c8470fb083"
-SRCREV_machine_qemuppc ?= "55dd15336b7301b686a0c183f5372b49c1003d03"
-SRCREV_machine_qemuriscv64 ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
-SRCREV_machine_qemux86 ?= "55dd15336b7301b686a0c183f5372b49c1003d03"
-SRCREV_machine_qemux86-64 ?= "55dd15336b7301b686a0c183f5372b49c1003d03"
-SRCREV_machine_qemumips64 ?= "9d4105b32cf123a861bc754377d2f2e156278a7e"
-SRCREV_machine ?= "55dd15336b7301b686a0c183f5372b49c1003d03"
-SRCREV_meta ?= "7f6e97c357746382d4339e7e0463637e715acd4b"
-
-# remap qemuarm to qemuarma15 for the 5.0 kernel
-# KMACHINE_qemuarm ?= "qemuarma15"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=${KMETA}"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.0.19"
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


