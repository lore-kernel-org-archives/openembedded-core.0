Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
	[209.85.166.54])
	by mail.openembedded.org (Postfix) with ESMTP id B887B7F291
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 20:10:27 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id n197so159927iod.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 13:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=n2nOnWtV5mP6i5n1W1BzNZ8kEVNnJ/V8R+TfK/ZD9io=;
	b=SNzf4NS/MV9P5dHcRIr/5H28QPkV+5eX5jT4JWL7nZPcmVu3LRtBmSOz/kWQtF5c6r
	zHw/1j+Dmz8Rxt9ihtAqTAsmJ9n8S4qshanqOPDLS19P3/3GVh42buj1R2BiD+YX5Pgq
	x/AGEU19uzp33dV07iOb7VPkZ75u8ekkFFJvqj8HYujCx5xrpma/Ae0WirTax+d6u32X
	fMCrntU5DPVPh9U1Z2v4TIsRxhIWkRB4X+sB9ARtwfZuYzznhdfN7aFhGucUsGIuPn84
	/hD4MpckJUUBaSvcwpC4nw0eSGl5kpbo3v22YGiQlaZuitqKNKVttjZDZ6j1NEG/DuzK
	0OZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=n2nOnWtV5mP6i5n1W1BzNZ8kEVNnJ/V8R+TfK/ZD9io=;
	b=mLzxQJGS0FWGM/+xrhnm5q/UjCdGdn1RXRlUy40ZSf0Fc1Ij3R99aQxVk4riWfZnZb
	vWE3IK61f3oVtt3znBJ0MB2q2q4og0ywClYb3uoQxtDrUDfhOSS27OUC51A76zGgKq2N
	l80Y5Zuq+3u/zsIwHVyBfIh3dv1GK8GF8JYQlEzHNmiFCbgdm7nvG5pZqmZL1bzSFfGX
	F/UPDSWu0fCVw30gTZoE7pGfBG227PEHh8WQags1KpgH3HoT91ma/uOq73ZBZ6BMWf6L
	V0o/5B5NOAzRRp3N6ksCs48Mc7ftvS59pUMW6gM3vExGMvHdiTIMlyj6chBSpTHs7AXw
	fRpg==
X-Gm-Message-State: APjAAAVoPl52azp/y0GN7xkcKmhKephBSL8VDCdWcLmCExwA1wCXC9R8
	oRCFdkZZta5GOjq2LmFJQks=
X-Google-Smtp-Source: APXvYqzoDwEmZ8J0dDHzPi2gtF/RJ181nxMH55cSmoll+esNaApv3Wu8rXRuh4mdignCpeztEMeRtg==
X-Received: by 2002:a02:a492:: with SMTP id d18mr6551394jam.27.1567023028260; 
	Wed, 28 Aug 2019 13:10:28 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208])
	by smtp.gmail.com with ESMTPSA id s4sm56386iop.25.2019.08.28.13.10.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 28 Aug 2019 13:10:27 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Wed, 28 Aug 2019 16:10:25 -0400
Message-Id: <20190828201025.35999-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] linux-yocto: introduce 5.2 recipes
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
X-List-Received-Date: Wed, 28 Aug 2019 20:10:28 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Introducing the 5.2 linux-yocto reference kernels. 5.0 is EOL and will
be removed, leaving 4.19 (LTS) and 5.2 as the reference kernels.

This has been build/boot tested on all qemu architectures for
core-image-kernel-dev, and graphics tesed via core-image-sato. No
blocking issues have been found.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

v2: dropped the bogus "foo.patch" which crept in during the git add.

Bruce

 .../linux/linux-yocto-rt_5.2.bb               | 44 +++++++++++++++
 .../linux/linux-yocto-tiny_5.2.bb             | 32 +++++++++++
 meta/recipes-kernel/linux/linux-yocto_5.2.bb  | 54 +++++++++++++++++++
 3 files changed, 130 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_5.2.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
new file mode 100644
index 0000000000..b4376b431d
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
@@ -0,0 +1,44 @@
+KBRANCH ?= "v5.2/standard/preempt-rt/base"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+# Skip processing of this recipe if it is not explicitly specified as the
+# PREFERRED_PROVIDER for virtual/kernel. This avoids errors when trying
+# to build multiple virtual/kernel providers, e.g. as dependency of
+# core-image-rt-sdk, core-image-rt.
+python () {
+    if d.getVar("KERNEL_PACKAGE_NAME") == "kernel" and d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-yocto-rt":
+        raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
+}
+
+SRCREV_machine ?= "ea07aa34bed4e662fe374d04d50b6ddb9882bb19"
+SRCREV_meta ?= "b53e99257175fd6f41f31e5ebec46c1bd11076b8"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.2;destsuffix=${KMETA}"
+
+LINUX_VERSION ?= "5.2.10"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
+
+DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
+DEPENDS += "openssl-native util-linux-native"
+
+PV = "${LINUX_VERSION}+git${SRCPV}"
+
+KMETA = "kernel-meta"
+KCONF_BSP_AUDIT_LEVEL = "2"
+
+LINUX_KERNEL_TYPE = "preempt-rt"
+
+COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuarmv5|qemuarm64|qemuppc|qemumips)"
+
+KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
+
+# Functionality flags
+KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
+KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
+KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
+KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES_append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
new file mode 100644
index 0000000000..f55e607b97
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
@@ -0,0 +1,32 @@
+KBRANCH ?= "v5.2/standard/tiny/base"
+KBRANCH_qemuarm  ?= "v5.2/standard/tiny/arm-versatile-926ejs"
+
+LINUX_KERNEL_TYPE = "tiny"
+KCONFIG_MODE = "--allnoconfig"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+LINUX_VERSION ?= "5.2.10"
+LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
+
+DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
+DEPENDS += "openssl-native util-linux-native"
+
+KMETA = "kernel-meta"
+KCONF_BSP_AUDIT_LEVEL = "2"
+
+SRCREV_machine_qemuarm ?= "ab7b49b196280d4289f18c35cf6ea534f364d104"
+SRCREV_machine ?= "77c28ea0e55cabb0b22b47d4eb2cc94b0940dfe6"
+SRCREV_meta ?= "b53e99257175fd6f41f31e5ebec46c1bd11076b8"
+
+PV = "${LINUX_VERSION}+git${SRCPV}"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.2;destsuffix=${KMETA}"
+
+COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm|qemuarmv5"
+
+# Functionality flags
+KERNEL_FEATURES = ""
+
+KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.2.bb b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
new file mode 100644
index 0000000000..d873a1f2b3
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
@@ -0,0 +1,54 @@
+KBRANCH ?= "v5.2/standard/base"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+# board specific branches
+KBRANCH_qemuarm  ?= "v5.2/standard/arm-versatile-926ejs"
+KBRANCH_qemuarm64 ?= "v5.2/standard/qemuarm64"
+KBRANCH_qemumips ?= "v5.2/standard/mti-malta32"
+KBRANCH_qemuppc  ?= "v5.2/standard/qemuppc"
+KBRANCH_qemuriscv64  ?= "v5.2/standard/base"
+KBRANCH_qemux86  ?= "v5.2/standard/base"
+KBRANCH_qemux86-64 ?= "v5.2/standard/base"
+KBRANCH_qemumips64 ?= "v5.2/standard/mti-malta64"
+
+SRCREV_machine_qemuarm ?= "97808f75eb3a63e9df6101b628720d06d656d79c"
+SRCREV_machine_qemuarm64 ?= "77c28ea0e55cabb0b22b47d4eb2cc94b0940dfe6"
+SRCREV_machine_qemumips ?= "c9fd15c35d77ca0c0a3e815df8284e2e99cabe8c"
+SRCREV_machine_qemuppc ?= "77c28ea0e55cabb0b22b47d4eb2cc94b0940dfe6"
+SRCREV_machine_qemuriscv64 ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
+SRCREV_machine_qemux86 ?= "77c28ea0e55cabb0b22b47d4eb2cc94b0940dfe6"
+SRCREV_machine_qemux86-64 ?= "77c28ea0e55cabb0b22b47d4eb2cc94b0940dfe6"
+SRCREV_machine_qemumips64 ?= "7a4b7a5518fb27bff55d4f5632e515289dc3fbb6"
+SRCREV_machine ?= "77c28ea0e55cabb0b22b47d4eb2cc94b0940dfe6"
+SRCREV_meta ?= "b53e99257175fd6f41f31e5ebec46c1bd11076b8"
+
+# remap qemuarm to qemuarma15 for the 5.2 kernel
+# KMACHINE_qemuarm ?= "qemuarma15"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.2;destsuffix=${KMETA}"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
+LINUX_VERSION ?= "5.2.10"
+
+DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
+DEPENDS += "openssl-native util-linux-native"
+
+PV = "${LINUX_VERSION}+git${SRCPV}"
+
+KMETA = "kernel-meta"
+KCONF_BSP_AUDIT_LEVEL = "2"
+
+KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
+
+COMPATIBLE_MACHINE = "qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemuriscv64"
+
+# Functionality flags
+KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
+KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
+KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
+KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
+KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
-- 
2.19.1


