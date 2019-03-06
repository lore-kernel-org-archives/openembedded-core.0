Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id A36717CD66
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Mar 2019 16:37:20 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id v2so10451310ith.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Mar 2019 08:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=LPhhLnNuXajp/71oCYTx5LmFp2NDjBuPs7uCuI/MaGU=;
	b=u9cpt9Oud64unfkzS+w66KgkYQsESxzs0klHrEZdQgRD4QlEdF7OHEtIaPucPPJlZi
	/4SYdb/OElhfRJSSFJ7j3ihlTrnknHz26Osr11e7vLYOHy6BcXZyW2r2JlRU9W6HVqH/
	twsVKTzDWrxs3E30d7ML0nY7ZANhmquNSk5glOzLyO8ruDCMtuGUQKk+/GgvKUplQs7V
	wBmCe9wu32pAXAAkH2C+RCIt8ow5CNte0T6yZ3OL/PPc2+ez9sjN+euCADP6eISuCxi+
	1k87ZbQMeJPIdZTUeweTZL+j3yvUOlInD3WA0davvhWReikxf2oxzSs5dhFpVg8zR3Ta
	pdeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=LPhhLnNuXajp/71oCYTx5LmFp2NDjBuPs7uCuI/MaGU=;
	b=I/nU2pclcvI+7D9KCdC78RCbqqFYlYkdrdQzB66cVNns5jTf+CjwTQMkR9Fs9yTOYk
	Atg4Wpqub4IOwGRgZdSN0zOA3zauKpU1d1eTQKMDRWFQVs76VY/AX2+GYXww3GVRJ6uD
	VCIRYCoUKIQVq8UD2xm/vDxz+dyjMKaQTVTOzmmPsLkS2Bhc9TeM2kn3f/eK3gvwzX56
	BwB6Q+p9yR1cRmnrjPT1CBknGX3wDidNJ8oq+PooiXVlnnRmUh8eH+ZChUb0mVHxTd+S
	kA94Uf+GUJ68EP/aUjQKEoS7P8PlON5s6q5A8FcyESPDqwh6Z9LmYT+GYcVI6S0Gof/H
	3CeA==
X-Gm-Message-State: APjAAAUpiTlTKKVhokwNSRvogTuS7QYSoBfBR6Turhc6Zcd8hs2j0Kms
	dnCnGO0QBNhyDxFd3PvST6oxVKyASMc=
X-Google-Smtp-Source: APXvYqwZKTUSOdigFQMthRHAjoMMPewN/U5lmidNkIKujCRklNLmyV6js1/GMPVnRCJRK91gs426Ng==
X-Received: by 2002:a24:1444:: with SMTP id 65mr2405530itg.137.1551890241589; 
	Wed, 06 Mar 2019 08:37:21 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.116.254.195]) by smtp.gmail.com with ESMTPSA id
	x191sm1072550itb.8.2019.03.06.08.37.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Mar 2019 08:37:20 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Wed,  6 Mar 2019 11:37:11 -0500
Message-Id: <9ae0407206567de2b89c37be8a030aeb697ada0c.1551889557.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1551889557.git.bruce.ashfield@gmail.com>
References: <cover.1551889557.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] linux-yocto: introduce 5.0 versioned recipe
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
X-List-Received-Date: Wed, 06 Mar 2019 16:37:21 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Introducing the 5.0 linux-yocto reference kernel, which will become
the "latest" kernel as part of the spring yocto release.

qemu* has been built and sanity tested against this kernel, and it
is suitable to become the default build for the emulated references.

Some minor configuration cleanup was performed, but otherwise, things
are very similar to the 4.19 kernel config:

  7fdb966db86 (HEAD -> yocto-5.0) aufs4: kbuild patch
  c76b027a8b2 iosched: remove configs for removed legacy io schedules
  5d1f8102244 netfilter: drop removed config options
  8ff16f508f5 kernel-yocto: 5.0 kernel prep

Feature wise, this is a match for 4.19, with yaffs2 and aufs4 being
kept around for another release. Aufs is scheduled for removal in
the fall release.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.0.bb               | 43 ++++++++++++++++
 .../linux/linux-yocto-tiny_5.0.bb             | 32 ++++++++++++
 meta/recipes-kernel/linux/linux-yocto_5.0.bb  | 51 +++++++++++++++++++
 3 files changed, 126 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_5.0.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
new file mode 100644
index 0000000000..b7e0e5da23
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
@@ -0,0 +1,43 @@
+KBRANCH ?= "v5.0/standard/preempt-rt/base"
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
+SRCREV_machine ?= "1a0da7e50b77c82841efb501c648dbaca699eac2"
+SRCREV_meta ?= "8ae7073a934d80c4f4b808bc01884777454aae8f"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=${KMETA}"
+
+LINUX_VERSION ?= "5.0"
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
+COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuarm64|qemuppc|qemumips)"
+
+KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
+
+# Functionality flags
+KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
+KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
+KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
+KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
new file mode 100644
index 0000000000..b95efa9306
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
@@ -0,0 +1,32 @@
+KBRANCH ?= "v5.0/standard/tiny/base"
+KBRANCH_qemuarm  ?= "v5.0/standard/tiny/arm-versatile-926ejs"
+
+LINUX_KERNEL_TYPE = "tiny"
+KCONFIG_MODE = "--allnoconfig"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+LINUX_VERSION ?= "5.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
+
+DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
+DEPENDS += "openssl-native util-linux-native"
+
+KMETA = "kernel-meta"
+KCONF_BSP_AUDIT_LEVEL = "2"
+
+SRCREV_machine_qemuarm ?= "6da91ac9afd3b8c144760e3ceacc6a812ddfa3f6"
+SRCREV_machine ?= "1a0da7e50b77c82841efb501c648dbaca699eac2"
+SRCREV_meta ?= "8ae7073a934d80c4f4b808bc01884777454aae8f"
+
+PV = "${LINUX_VERSION}+git${SRCPV}"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=${KMETA}"
+
+COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm"
+
+# Functionality flags
+KERNEL_FEATURES = ""
+
+KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
new file mode 100644
index 0000000000..768036e298
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
@@ -0,0 +1,51 @@
+KBRANCH ?= "v5.0/standard/base"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+# board specific branches
+KBRANCH_qemuarm  ?= "v5.0/standard/arm-versatile-926ejs"
+KBRANCH_qemuarm64 ?= "v5.0/standard/qemuarm64"
+KBRANCH_qemumips ?= "v5.0/standard/mti-malta32"
+KBRANCH_qemuppc  ?= "v5.0/standard/qemuppc"
+KBRANCH_qemux86  ?= "v5.0/standard/base"
+KBRANCH_qemux86-64 ?= "v5.0/standard/base"
+KBRANCH_qemumips64 ?= "v5.0/standard/mti-malta64"
+
+SRCREV_machine_qemuarm ?= "1fbecad0e6a68b6c57b4f6ef8207e7e90ea764a3"
+SRCREV_machine_qemuarm64 ?= "1a0da7e50b77c82841efb501c648dbaca699eac2"
+SRCREV_machine_qemumips ?= "d9dd6d4cfe689efd5cb7bbacd118a3888ac7c517"
+SRCREV_machine_qemuppc ?= "1a0da7e50b77c82841efb501c648dbaca699eac2"
+SRCREV_machine_qemux86 ?= "1a0da7e50b77c82841efb501c648dbaca699eac2"
+SRCREV_machine_qemux86-64 ?= "1a0da7e50b77c82841efb501c648dbaca699eac2"
+SRCREV_machine_qemumips64 ?= "5f072445126e6a9e44f9435a552f4fcf6fc15499"
+SRCREV_machine ?= "1a0da7e50b77c82841efb501c648dbaca699eac2"
+SRCREV_meta ?= "8ae7073a934d80c4f4b808bc01884777454aae8f"
+
+# remap qemuarm to qemuarma15 for the 5.0 kernel
+# KMACHINE_qemuarm ?= "qemuarma15"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=${KMETA}"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
+LINUX_VERSION ?= "5.0"
+
+DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
+DEPENDS += "openssl-native util-linux-native"
+
+PV = "${LINUX_VERSION}+git${SRCPV}"
+
+KMETA = "kernel-meta"
+KCONF_BSP_AUDIT_LEVEL = "2"
+
+KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
+
+COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
+
+# Functionality flags
+KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
+KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
+KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
+KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
-- 
2.19.1


