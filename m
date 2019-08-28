Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
	[209.85.166.54])
	by mail.openembedded.org (Postfix) with ESMTP id 93B9D7F27C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 19:28:48 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id p12so1904209iog.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 12:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=BDbRSWFHZosR1/3Hy49X5gqVq6R/dg564ypt5cCoK/8=;
	b=J83L9au/N4IYIc9yWL8lye1QZmryS4JAC8jOcydH2xnC2svY6FSMoJAHzwWN/+h6GW
	8U9jUcL92Tc6s6zEBDCJ0TyD6qDwM9XKQtXbeJ3jeCsHYZHOKHFwYVMVmAAXjMcEVrpl
	9sqPMtbtUl9+h42yL4L8DPEvRz2Uv8EwnNUC5qN6EUR3l7Q+QBILOmYRgVpVYqEgA6lu
	IaxChAcSLLjno/b1HhaLxiIeAW2O29vRALZhTBiT+aPEO4IgoYJkIiAtx5k8fq1+MBb7
	uUKOGbiCq+X+y17VO8U5zwlY9OsHhAVeJRlbu03wQE7Yh3Pn82V2HgoebjsssihLt9uH
	PcrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=BDbRSWFHZosR1/3Hy49X5gqVq6R/dg564ypt5cCoK/8=;
	b=occx1R/JmkU0AogeAi+YZz4VMAqiAI6TD5iIS5twfZlukVsm/Xj5ShMxqX5N3K2BK+
	qS3TkvyepGgeoyipzkM81L1spy/VhwWLzRXicTt2CeWAaE1j1GQxuNW/eIXXkXXRyHkZ
	asl7l7r8bsprHxlgDHcTBuw5gDcNJ8UJm7uq8v5CnOrg93ih+0HyUJ7TXUQZAyFD7U5o
	EIYYUoeVuguL7+PSDN5BTiI7VgtZ6cHBTBlEBNCykEfOqMkYBpEmlVh/7eszGZXnKOAT
	rev0vEHAIQqQF6o6LzLpR820YCuDuorb2hsmfn70PP5nSbq+050uxmC0oeg9aYolbAbw
	Jt1g==
X-Gm-Message-State: APjAAAV2o6G9Q7MbYJonemCxMZG/WFEa8ChN7jCyuTONaehgFSlSUX+z
	Y2HwAuaCuuzgotv5Lrfs5eTUBFDtKso=
X-Google-Smtp-Source: APXvYqwmSKpkXcbK1LeMKlOL1pLjqiOrgxsi1uUS9Eg2C2bcgBNLfEoeDzJQndTXrMZXU1oAbpQr5A==
X-Received: by 2002:a5e:db0a:: with SMTP id q10mr6213404iop.58.1567020529337; 
	Wed, 28 Aug 2019 12:28:49 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208])
	by smtp.gmail.com with ESMTPSA id d6sm4454375iod.17.2019.08.28.12.28.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 28 Aug 2019 12:28:47 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Wed, 28 Aug 2019 15:28:36 -0400
Message-Id: <2b7778d3ad843f67d5e844902a16af93a9e5c6d3.1567019771.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1567019771.git.bruce.ashfield@gmail.com>
References: <cover.1567019771.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/8] linux-yocto: introduce 5.2 recipes
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
X-List-Received-Date: Wed, 28 Aug 2019 19:28:48 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Introducing the 5.2 linux-yocto reference kernels. 5.0 is EOL and will
be removed, leaving 4.19 (LTS) and 5.2 as the reference kernels.

This has been build/boot tested on all qemu architectures for
core-image-kernel-dev, and graphics tesed via core-image-sato. No
blockin issues have been found.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../recipes-kernel/linux/files/0001-foo.patch | 25 +++++++++
 .../linux/linux-yocto-rt_5.2.bb               | 44 +++++++++++++++
 .../linux/linux-yocto-tiny_5.2.bb             | 32 +++++++++++
 meta/recipes-kernel/linux/linux-yocto_5.2.bb  | 54 +++++++++++++++++++
 4 files changed, 155 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/files/0001-foo.patch
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_5.2.bb

diff --git a/meta/recipes-kernel/linux/files/0001-foo.patch b/meta/recipes-kernel/linux/files/0001-foo.patch
new file mode 100644
index 0000000000..0cd4578f33
--- /dev/null
+++ b/meta/recipes-kernel/linux/files/0001-foo.patch
@@ -0,0 +1,25 @@
+From 9ddc5e377434e28f1f3c74c9be011b0c9dfb1de4 Mon Sep 17 00:00:00 2001
+From: Bruce Ashfield <bruce.ashfield@gmail.com>
+Date: Fri, 1 Mar 2019 10:09:43 -0500
+Subject: [PATCH] foo
+
+Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
+---
+ bsp/common-pc-64/common-pc-64-cpu.cfg | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/bsp/common-pc-64/common-pc-64-cpu.cfg b/bsp/common-pc-64/common-pc-64-cpu.cfg
+index 8dced733815..63bc167cf6f 100644
+--- a/bsp/common-pc-64/common-pc-64-cpu.cfg
++++ b/bsp/common-pc-64/common-pc-64-cpu.cfg
+@@ -12,6 +12,6 @@
+ #.........................................................................
+ 
+ CONFIG_MCORE2=y
+-CONFIG_IA32_EMULATION=y
++#CONFIG_IA32_EMULATION is not set
+ CONFIG_NR_CPUS=24
+ CONFIG_PM=y
+-- 
+2.19.1
+
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


