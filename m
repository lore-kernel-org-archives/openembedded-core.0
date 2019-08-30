Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
	[209.85.166.49])
	by mail.openembedded.org (Postfix) with ESMTP id 501EA7F44E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 16:06:37 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id o9so15097077iom.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 09:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=8iabhD7vUlklJfV2IjN/QhMdjkUTo6VPYPXseOj+UgA=;
	b=n8UHQkimNuEr2Bg3UxKVy9VHD1DpT9xDSuUSkfPAVpkKqUqxlNucQT20sto0DDVmEo
	m1voivxf19obOfnaiHkbu0oemgvF5u5FN9/fh3w63tYywg60jmT9dWudYdLySfZPFUwy
	ZZQ+JG+iu5D2Rg/oSWItZCYrpgFBf8KfIRSULbtGlXNmdTb9b+Hz1gAA+pS65KDQucav
	5dhSzY9vURRiar8Ej4ABGezVJwsK0kNpCLMqEVcFkxJ+70Ci9je1NHY08KPL3cSlnOHl
	vIYB0nAY96wpJugpLT2CTMfiiOWD22Zzgp3kDI9uTMwDW487jnT04V/oRtXX7bR2y1jD
	ADUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=8iabhD7vUlklJfV2IjN/QhMdjkUTo6VPYPXseOj+UgA=;
	b=L0BFO50vYjLoVJ77/dggp5rPVMIzSAFgaJhwSYDT8YMANf3KKphcf/o3My+q3M0fCQ
	+F9tT9zBHbcmDofVCoGWGgJn+h657mGUnzU1hvafVNC5sAdGeAU3RiYANe8OZpmggK1i
	jxKdNB0Z5z69tREu+854VIX6bVZnWXDUCxrMwYMCM2LXTzNsDqD8kRcYfZgExXp0p5Dq
	Y1bp/e/E1gjg42dzpjNd865UPs0x4gEPAjkCFREUVmt/BkOc164RW5lc598uC3nzY94Q
	WT1LtSBBKY5BEDRNclXJQXtvyXCkGZSBtmdt8h0++5qFak5ojLFlV5Z6BP/LCTqcbsqz
	ksgw==
X-Gm-Message-State: APjAAAXlmqszqR6QotSvKfox/E9t1smQWoVa/26Th/jCgRC48yjkZH9/
	TchX/BGcjOf/34UoUagbpdc=
X-Google-Smtp-Source: APXvYqxc/PVM7pRfryMORDQ6OWrIPnO43J8hg5bVI9TLA6q7NFvEXBKfUjHMJfnbBYi5Jiq+SwOHYw==
X-Received: by 2002:a02:6983:: with SMTP id e125mr3371880jac.41.1567181198160; 
	Fri, 30 Aug 2019 09:06:38 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208])
	by smtp.gmail.com with ESMTPSA id p3sm4514672iom.7.2019.08.30.09.06.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 30 Aug 2019 09:06:36 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Fri, 30 Aug 2019 12:06:31 -0400
Message-Id: <8808749c65285dd434105d0583d5f16b7bbf2ac8.1567181039.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1567181039.git.bruce.ashfield@gmail.com>
References: <cover.1567181039.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] linux-yocto: introduce 5.2 recipes
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
X-List-Received-Date: Fri, 30 Aug 2019 16:06:37 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Introducing the 5.2 linux-yocto reference kernels. 5.0 is EOL and will
be removed, leaving 4.19 (LTS) and 5.2 as the reference kernels.

This has been build/boot tested on all qemu architectures for
core-image-kernel-dev, and graphics tesed via core-image-sato. No
blocking issues have been found.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.2.bb               | 44 +++++++++++++++
 .../linux/linux-yocto-tiny_5.2.bb             | 32 +++++++++++
 meta/recipes-kernel/linux/linux-yocto_5.2.bb  | 54 +++++++++++++++++++
 3 files changed, 130 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_5.2.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
new file mode 100644
index 0000000000..1126734dbb
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
+SRCREV_machine ?= "abe36b584560b3ab9c4c2ece15d5e44494f02427"
+SRCREV_meta ?= "552f94eb15525c2be2e56615880f1018c3bfbb8a"
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
+KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
+KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES_append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
new file mode 100644
index 0000000000..03525509df
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
+SRCREV_machine_qemuarm ?= "de3456fa6c9c2bec7ffc907be0d19c0ffb8ef459"
+SRCREV_machine ?= "35276d20c01a78ee3640a074446b0c15c486c5d0"
+SRCREV_meta ?= "552f94eb15525c2be2e56615880f1018c3bfbb8a"
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
index 0000000000..8bafeb3c46
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
+SRCREV_machine_qemuarm ?= "c9b6ba7aba803fdf715e93c22fe5927767b08a64"
+SRCREV_machine_qemuarm64 ?= "35276d20c01a78ee3640a074446b0c15c486c5d0"
+SRCREV_machine_qemumips ?= "31f1ce49e00a7bbb136a81480da135865da0ea90"
+SRCREV_machine_qemuppc ?= "35276d20c01a78ee3640a074446b0c15c486c5d0"
+SRCREV_machine_qemuriscv64 ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
+SRCREV_machine_qemux86 ?= "35276d20c01a78ee3640a074446b0c15c486c5d0"
+SRCREV_machine_qemux86-64 ?= "35276d20c01a78ee3640a074446b0c15c486c5d0"
+SRCREV_machine_qemumips64 ?= "898f35c813f9d89acd456c193b9005771ab37a60"
+SRCREV_machine ?= "35276d20c01a78ee3640a074446b0c15c486c5d0"
+SRCREV_meta ?= "552f94eb15525c2be2e56615880f1018c3bfbb8a"
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
+KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
+KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
+KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
-- 
2.19.1


