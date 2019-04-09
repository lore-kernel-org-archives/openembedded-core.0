Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id DB5077D6BF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Apr 2019 15:38:07 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id x7so14681123ioh.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2019 08:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=DF+fwWbEfDqFaLXhnznFdZRHbjGpJJA+dqYdSZjdLW4=;
	b=UUiJWW2Kw3FZw1imqTTzbxc5QcjhiObbyCXkZP/kFYQnU1hbGoVlfvO/WjLeAZQAPp
	hjkfAzaRQu7IM62xnxFHHrs8jXDlcKpdb6E6Ws29MNnn+OQ6m5iJx0nlKs+QZACnuU/h
	t0fcpaGBqrf52evxGI5YZxe97WVMSFYHlyY3BS5ru1ZW6uW+P+yg7nt00USeF2TCE6aU
	OQzZbFjN5WiyqR+OHLhUuK/xoqC0Aik0Z60hIpoJn+EuI9YLK8cJ/LIq8hC3nIWlKZY6
	ThWX6GYXhMUZKkfoDXPglD8uBIVuI9t0bXIoDXbm3M9kP73ICiukRLspvtc+ogGMjtB3
	1qlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=DF+fwWbEfDqFaLXhnznFdZRHbjGpJJA+dqYdSZjdLW4=;
	b=TAeNkzsWZc5wH3H9INW8y/qacDTW3EazrYKMHQEAzDzWHJT2Wct+380HEHIrZGnnlT
	0v/Gl9ml1AjjYmYzF8zd7ZyjoTZbNc1MolYDtznO9BhsZ3ZIm4UexUMPYpfJW0xvIfqt
	6qrr/D+PrxV+8SkaBpWec4zQs3hur12cxQQAHCFkYv3f0VTmyM5s5QFtgRkDY3UTYaqv
	4UkGEzNKP4g7rvqQfLL9Qxu+bBDIiE9oblppYUdYYB4+5JBiYJez2dUFFGQAEib8G7d9
	mWQKt0kLm/V5L1yxw9KMXUcsDBJkxVMcn5vC2bZUDQDK+uIj1UmzvX3dyvqXh3bMeP+L
	AxYQ==
X-Gm-Message-State: APjAAAVgg14X8slR+srufcRIuYdCELed+5AWOcY5wultHORO82pIdIyo
	mkTbHhN1fw8cydehRXGJ09rvM2DyHgQ=
X-Google-Smtp-Source: APXvYqxQIXIfhv1qUqMVsWCsQ8wqi4VNCuH4B69yk4N4y2T/vwbovlnqYfMNL9Vt0y5n96g26kNhcA==
X-Received: by 2002:a5e:9912:: with SMTP id t18mr24261591ioj.157.1554824288680;
	Tue, 09 Apr 2019 08:38:08 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	y24sm12376510iol.8.2019.04.09.08.38.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Apr 2019 08:38:07 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Tue,  9 Apr 2019 11:37:57 -0400
Message-Id: <c57be81ca38116ee6ba43369dba26fe55d4d6119.1554824014.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1554824014.git.bruce.ashfield@gmail.com>
References: <cover.1554824014.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/7] linux-yocto/4.18: remove versioned recipes
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
X-List-Received-Date: Tue, 09 Apr 2019 15:38:08 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The 4.18 kernel has been replaced by 4.19 and 5.0 in master.
poky-tiny has been tested against 5.0, so we can now remove
the 4.18 recipes.

The 4.18 branches will continue to be maintained, but we only
want two active kernels in the master/releases branches.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_4.18.bb              | 43 -----------------
 .../linux/linux-yocto-tiny_4.18.bb            | 32 -------------
 meta/recipes-kernel/linux/linux-yocto_4.18.bb | 48 -------------------
 3 files changed, 123 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto_4.18.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
deleted file mode 100644
index 91bb5765d1..0000000000
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
+++ /dev/null
@@ -1,43 +0,0 @@
-KBRANCH ?= "v4.18/standard/preempt-rt/base"
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
-SRCREV_machine ?= "60b23779def52cac86267bdef0da0f2750dce287"
-SRCREV_meta ?= "865683fc87deee7030cd168f295e8afd70894d6c"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
-
-LINUX_VERSION ?= "4.18.33"
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
-COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuarm64|qemuppc|qemumips)"
-
-KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
-
-# Functionality flags
-KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
-KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
-KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
-KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
deleted file mode 100644
index c986eb8bac..0000000000
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-KBRANCH ?= "v4.18/standard/tiny/base"
-KBRANCH_qemuarm  ?= "v4.18/standard/tiny/arm-versatile-926ejs"
-
-LINUX_KERNEL_TYPE = "tiny"
-KCONFIG_MODE = "--allnoconfig"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-LINUX_VERSION ?= "4.18.33"
-LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-
-DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
-DEPENDS += "openssl-native util-linux-native"
-
-KMETA = "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL = "2"
-
-SRCREV_machine_qemuarm ?= "bc69d96021b7407a636cb7bc56334bf95a525e76"
-SRCREV_machine ?= "1a564c76f41cff5c9e9011c4dbb5ef8453836b5d"
-SRCREV_meta ?= "865683fc87deee7030cd168f295e8afd70894d6c"
-
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
-
-COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm"
-
-# Functionality flags
-KERNEL_FEATURES = ""
-
-KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.18.bb b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
deleted file mode 100644
index 3be72a3a57..0000000000
--- a/meta/recipes-kernel/linux/linux-yocto_4.18.bb
+++ /dev/null
@@ -1,48 +0,0 @@
-KBRANCH ?= "v4.18/standard/base"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-# board specific branches
-KBRANCH_qemuarm  ?= "v4.18/standard/arm-versatile-926ejs"
-KBRANCH_qemuarm64 ?= "v4.18/standard/qemuarm64"
-KBRANCH_qemumips ?= "v4.18/standard/mti-malta32"
-KBRANCH_qemuppc  ?= "v4.18/standard/qemuppc"
-KBRANCH_qemux86  ?= "v4.18/standard/base"
-KBRANCH_qemux86-64 ?= "v4.18/standard/base"
-KBRANCH_qemumips64 ?= "v4.18/standard/mti-malta64"
-
-SRCREV_machine_qemuarm ?= "813d81df5defc4e552b7c3085673437eaba4eea7"
-SRCREV_machine_qemuarm64 ?= "1a564c76f41cff5c9e9011c4dbb5ef8453836b5d"
-SRCREV_machine_qemumips ?= "12620f16df220007dfda3b70cc5044ec2322142c"
-SRCREV_machine_qemuppc ?= "1a564c76f41cff5c9e9011c4dbb5ef8453836b5d"
-SRCREV_machine_qemux86 ?= "1a564c76f41cff5c9e9011c4dbb5ef8453836b5d"
-SRCREV_machine_qemux86-64 ?= "1a564c76f41cff5c9e9011c4dbb5ef8453836b5d"
-SRCREV_machine_qemumips64 ?= "104cdfbbf95981e31a32dfe3bdeaff3afb517ad4"
-SRCREV_machine ?= "1a564c76f41cff5c9e9011c4dbb5ef8453836b5d"
-SRCREV_meta ?= "865683fc87deee7030cd168f295e8afd70894d6c"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "4.18.33"
-
-DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
-DEPENDS += "openssl-native util-linux-native"
-
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-KMETA = "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL = "2"
-
-KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
-
-COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
-
-# Functionality flags
-KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
-KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
-KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
-KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
-- 
2.19.1


