Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id C25A57FD60
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 22:14:12 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id h23so15114667qkh.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 14:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=U6K/+LVxcl8YqR67oH4uJjn1BFGx1a/pub4JKDmzzXc=;
	b=RhjAra65UMJod1NgzGwIAeQGXftpKW2FVXNsvxndBfzbCbw/V4DfscmQsy2uuL3J5v
	MHzutlO+cbwX4l/6dnhSAp/wyrU0C1wGCAos4IKExPFylBdBLnN28Gljw8nhIX/97SSU
	PBFoaAGDg/ck5Bz9XbJfzSO9Go/kLtezESkpYHjtbXsoetVCOHPG68RQs1BxImQwZpWj
	rh6c0qSVpx1ygu3gM+24NYOymCVJjdIU5sEge/eBmas0avCD5tpLDmE4gMHNUSDDGvID
	og+NJTBllB5LVATVl1CzDY/Y4cXfrnjGqMzA71daLkLUpILAzyHHtq7shMFFa4yUSIEA
	dVcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=U6K/+LVxcl8YqR67oH4uJjn1BFGx1a/pub4JKDmzzXc=;
	b=JTFoJ/B5lrko7dNIGnT+/Rna0qaQ0sxOXtZZJyy2xZev7m1Zfjokz99AlLYEJzQGgZ
	kI6IQPP0I6d2uJN5y0xvxi/Dm5dmuf6y1/KPipDTbIQmNGcXczRhgkQjPAL3fj+8GW1M
	+kThrCNzG6Zpb8x6UFSXonv7FiTsOxcXwDc5+nPbDHG5GUDdip5ObeOD4PQ1MP7/3FK9
	Ad4XsMmP1FZHBOqF20CvP0SdxkGHdhZOmMw+D2VfCP8cAXS6NWfVsFhnWCBgfTlSCfhz
	KHsL3EZmGYU7A5iu8Omlg1umclSdABCi9LgqCxTfOejCfsfQPwTNq5KRHVljtIk7z3hq
	2UNg==
X-Gm-Message-State: APjAAAW8kGDI+8+dSaU3CjC4mUyhe4YQdwhfpQKw8tWJ5ZV+qyjoPzaW
	ZppCnHBGCGO3OrLpkBplZYA=
X-Google-Smtp-Source: APXvYqxIuHn8wv9T/Nub9D0KFwulPtIvRqsRvmbRhmjW4ouDwlhwmQbyL9AybmU/zOrP0SgiafffHA==
X-Received: by 2002:a37:a085:: with SMTP id j127mr23287781qke.89.1580249653621;
	Tue, 28 Jan 2020 14:14:13 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95]) by smtp.gmail.com with ESMTPSA id
	l184sm13194994qkc.107.2020.01.28.14.14.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 28 Jan 2020 14:14:12 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Tue, 28 Jan 2020 17:14:08 -0500
Message-Id: <e6b6484beb730f63714567d89da06834fbbbbd3c.1580248809.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1580248809.git.bruce.ashfield@gmail.com>
References: <cover.1580248809.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] linux-yocto: introduce 5.4 recipes
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
X-List-Received-Date: Tue, 28 Jan 2020 22:14:13 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

This creates recipes for the v5.4/* branches of the linux-yocto
reference kernel.

preempt-rt, yaffs2, aufs5 and reference board specific patches are
part of these branches. All major architectures: x86,x86-64,ARM,
ARM64,ppc,mips and mips64 have been feature tested against this
reference.

5.4 is a LTS release, and as such will receive -stable updates
for the duration of upstream korg support.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               | 44 +++++++++++++++
 .../linux/linux-yocto-tiny_5.4.bb             | 32 +++++++++++
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 54 +++++++++++++++++++
 3 files changed, 130 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_5.4.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
new file mode 100644
index 0000000000..52f0e3b833
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -0,0 +1,44 @@
+KBRANCH ?= "v5.4/standard/preempt-rt/base"
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
+SRCREV_machine ?= "5d5d4070c5f8b10a4c6bda37e77071ce37f102d5"
+SRCREV_meta ?= "a48522779fae4887c47268e5f650bf10c94a165c"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
+
+LINUX_VERSION ?= "5.4.15"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
+
+DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
+DEPENDS += "openssl-native util-linux-native"
+
+PV = "5.4.15"
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
+KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
+KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES_append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
new file mode 100644
index 0000000000..a028b37548
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -0,0 +1,32 @@
+KBRANCH ?= "v5.4/standard/tiny/base"
+KBRANCH_qemuarm  ?= "v5.4/standard/tiny/arm-versatile-926ejs"
+
+LINUX_KERNEL_TYPE = "tiny"
+KCONFIG_MODE = "--allnoconfig"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+LINUX_VERSION ?= "5.4.15"
+LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
+
+DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
+DEPENDS += "openssl-native util-linux-native"
+
+KMETA = "kernel-meta"
+KCONF_BSP_AUDIT_LEVEL = "2"
+
+SRCREV_machine_qemuarm ?= "9eeafafc19278b5c5376ba1fd9eae26626730458"
+SRCREV_machine ?= "cdda35317561d2741b396efa623ace0bd2212c16"
+SRCREV_meta ?= "a48522779fae4887c47268e5f650bf10c94a165c"
+
+PV = "5.4.15"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
+
+COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm|qemuarmv5"
+
+# Functionality flags
+KERNEL_FEATURES = ""
+
+KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
new file mode 100644
index 0000000000..9fbc47d79e
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -0,0 +1,54 @@
+KBRANCH ?= "v5.4/standard/base"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+# board specific branches
+KBRANCH_qemuarm  ?= "v5.4/standard/arm-versatile-926ejs"
+KBRANCH_qemuarm64 ?= "v5.4/standard/qemuarm64"
+KBRANCH_qemumips ?= "v5.4/standard/mti-malta32"
+KBRANCH_qemuppc  ?= "v5.4/standard/qemuppc"
+KBRANCH_qemuriscv64  ?= "v5.4/standard/base"
+KBRANCH_qemux86  ?= "v5.4/standard/base"
+KBRANCH_qemux86-64 ?= "v5.4/standard/base"
+KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
+
+SRCREV_machine_qemuarm ?= "637086def651a00b1274a80cd3ca740e271eb0f9"
+SRCREV_machine_qemuarm64 ?= "cdda35317561d2741b396efa623ace0bd2212c16"
+SRCREV_machine_qemumips ?= "bfe04753d00b0f36848bb8204020b69d0e78f02a"
+SRCREV_machine_qemuppc ?= "cdda35317561d2741b396efa623ace0bd2212c16"
+SRCREV_machine_qemuriscv64 ?= "cdda35317561d2741b396efa623ace0bd2212c16"
+SRCREV_machine_qemux86 ?= "cdda35317561d2741b396efa623ace0bd2212c16"
+SRCREV_machine_qemux86-64 ?= "cdda35317561d2741b396efa623ace0bd2212c16"
+SRCREV_machine_qemumips64 ?= "81cd255c72add4dcf06603250869f739bb4f05cb"
+SRCREV_machine ?= "cdda35317561d2741b396efa623ace0bd2212c16"
+SRCREV_meta ?= "a48522779fae4887c47268e5f650bf10c94a165c"
+
+# remap qemuarm to qemuarma15 for the 5.4 kernel
+# KMACHINE_qemuarm ?= "qemuarma15"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
+LINUX_VERSION ?= "5.4.15"
+
+DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
+DEPENDS += "openssl-native util-linux-native"
+
+PV = "5.4.15"
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
+KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
+KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
+KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
-- 
2.19.1


