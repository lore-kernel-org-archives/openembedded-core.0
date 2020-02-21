Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 86B2861716
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 17:46:12 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id j8so2553891qka.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 09:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=LcqZYZTO9tweqSQwI8suE1YjPU/3GB+9ezue7AwknOc=;
	b=W8JVueWFvXn5yw0tRZnxPGFZTCWMzV9Yju8skDMf2qVGDYl+AaXc4rVrKFdqN1nawr
	BpW9uyBIwnMoxTyLiVCOs14uen78k8dKc2HIPnzEzMprzbaO4wlTjSe+Ku68WgvDDE0Q
	MxSbjT82tGoQRcs1DfH6Wt6oORPKL8/EZRV92fQLOxgX5FNSn61lgwtINa7+rljC0DHI
	H3wv0F8qzXZ4EhIT4Z0BYDO10xoyM3MU745mTQPuHanPo3pTSHOSJzVuGK7rRV1WDFkD
	+Z5o7eKCo+wi6gyfzsvt0xjG8t+VX6F+87snxZ8a35hI0MbO8uhHzXQa1RVpt4JrGQie
	ZisA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=LcqZYZTO9tweqSQwI8suE1YjPU/3GB+9ezue7AwknOc=;
	b=YUBctZ5epyGWr0RcEOYBm6z4b0A3qQH7x4qB2orBYv8/9X8WhMDLKkbz+VywxCwlDM
	iffqZXoWSephwzYNouooAetpSkBfjW9ts/ZZ2fWGPbeaG1cEnIM2m7aOvkYMWSU9aBsn
	uo8U1pJSpmx4l8S8epJ1g1dfTvjC+rrGS7ifK4Cept8LdkEI1lCfNLpveVVFLQopEMoy
	CBrXO5ibfALv3BTJ1onJj+Smnimsiqc2PmI0k2eDsL6a9MmxGCd0J1n2+zrPjtfMQgMq
	3bgJer4zH++owK5h1BB8LfbzlmGq9cu77KDVd+OjYDNp0ZS9Tn8CfcfZo6aCfdcFVyen
	CQwA==
X-Gm-Message-State: APjAAAXtLlkhlG4tiTWIFoijO7hsjJIhM7iV4dAOzDBMwZQMDCo8cFGV
	fnMZAakY7a5TM/13dKpYCWQ=
X-Google-Smtp-Source: APXvYqyc6hM3Wzie0w1WpGRX9/xIVSrDH2qUzPshj13nobesWr9w9sBf1yuhek+zzRFrrWfjpoVD/g==
X-Received: by 2002:a37:9d4b:: with SMTP id g72mr33367478qke.195.1582307173422;
	Fri, 21 Feb 2020 09:46:13 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95]) by smtp.gmail.com with ESMTPSA id
	g17sm1855153qtq.29.2020.02.21.09.46.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 21 Feb 2020 09:46:12 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Fri, 21 Feb 2020 12:46:01 -0500
Message-Id: <2d24da0fda13bbe9ebc8ee1273ecaf9092487733.1582306887.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1582306887.git.bruce.ashfield@gmail.com>
References: <cover.1582306887.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/10] linux-yocto: drop 4.19 recipes
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
X-List-Received-Date: Fri, 21 Feb 2020 17:46:12 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

5.4 is the next LTS kernel, so we drop the 4.19 recipes from master.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_4.19.bb              | 44 ----------------
 .../linux/linux-yocto-tiny_4.19.bb            | 32 ------------
 meta/recipes-kernel/linux/linux-yocto_4.19.bb | 50 -------------------
 3 files changed, 126 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto_4.19.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
deleted file mode 100644
index b6e0a1e9e2..0000000000
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
+++ /dev/null
@@ -1,44 +0,0 @@
-KBRANCH ?= "v4.19/standard/preempt-rt/base"
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
-SRCREV_machine ?= "2fbf678238302f33b3aec5a2cba829f260744f24"
-SRCREV_meta ?= "4f5d761316a9cf14605e5d0cc91b53c1b2e9dc6a"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
-
-LINUX_VERSION ?= "4.19.87"
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
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
deleted file mode 100644
index e2626ab4c9..0000000000
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-KBRANCH ?= "v4.19/standard/tiny/base"
-KBRANCH_qemuarm  ?= "v4.19/standard/tiny/arm-versatile-926ejs"
-
-LINUX_KERNEL_TYPE = "tiny"
-KCONFIG_MODE = "--allnoconfig"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-LINUX_VERSION ?= "4.19.87"
-LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-
-DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
-DEPENDS += "openssl-native util-linux-native"
-
-KMETA = "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL = "2"
-
-SRCREV_machine_qemuarm ?= "bd239fb802a15c2759ea456dd1f09f5e106fc88a"
-SRCREV_machine ?= "b44ad1b1e7c685e75b7788a026a2416edc2ee656"
-SRCREV_meta ?= "4f5d761316a9cf14605e5d0cc91b53c1b2e9dc6a"
-
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
-
-COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm|qemuarmv5"
-
-# Functionality flags
-KERNEL_FEATURES = ""
-
-KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
deleted file mode 100644
index c6e482a984..0000000000
--- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
+++ /dev/null
@@ -1,50 +0,0 @@
-KBRANCH ?= "v4.19/standard/base"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-# board specific branches
-KBRANCH_qemuarm  ?= "v4.19/standard/arm-versatile-926ejs"
-KBRANCH_qemuarm64 ?= "v4.19/standard/qemuarm64"
-KBRANCH_qemumips ?= "v4.19/standard/mti-malta32"
-KBRANCH_qemuppc  ?= "v4.19/standard/qemuppc"
-KBRANCH_qemux86  ?= "v4.19/standard/base"
-KBRANCH_qemux86-64 ?= "v4.19/standard/base"
-KBRANCH_qemumips64 ?= "v4.19/standard/mti-malta64"
-
-SRCREV_machine_qemuarm ?= "19fa1657d1d82d01647c6f73a2bbf39305505294"
-SRCREV_machine_qemuarm64 ?= "b44ad1b1e7c685e75b7788a026a2416edc2ee656"
-SRCREV_machine_qemumips ?= "8fb7ab96b84852ee3d9e1d9d9e7bc35e1249b653"
-SRCREV_machine_qemuppc ?= "b44ad1b1e7c685e75b7788a026a2416edc2ee656"
-SRCREV_machine_qemux86 ?= "b44ad1b1e7c685e75b7788a026a2416edc2ee656"
-SRCREV_machine_qemux86-64 ?= "b44ad1b1e7c685e75b7788a026a2416edc2ee656"
-SRCREV_machine_qemumips64 ?= "c8a036abd7d469013dddab15a23e0d2dde1d0000"
-SRCREV_machine ?= "b44ad1b1e7c685e75b7788a026a2416edc2ee656"
-SRCREV_meta ?= "4f5d761316a9cf14605e5d0cc91b53c1b2e9dc6a"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA} \
-          "
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "4.19.87"
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
-COMPATIBLE_MACHINE = "qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
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


