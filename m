Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0EA84731B5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 08:14:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u4A8EAsw025959
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 01:14:10 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 10 May 2016 01:14:10 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 May 2016 01:14:01 -0700
Message-ID: <e5a221231cd334453478f0d9037f3ceddd1b44f8.1462867278.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1462867278.git.liezhi.yang@windriver.com>
References: <cover.1462867278.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [RFC PATCH 3/8] qemuarm.conf: set vars for runqemu
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
X-List-Received-Date: Tue, 10 May 2016 08:14:10 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/conf/machine/include/arm/arch-armv6.inc | 2 ++
 meta/conf/machine/include/tune-cortexa8.inc  | 2 ++
 meta/conf/machine/qemuarm.conf               | 3 +++
 3 files changed, 7 insertions(+)

diff --git a/meta/conf/machine/include/arm/arch-armv6.inc b/meta/conf/machine/include/arm/arch-armv6.inc
index 4c93f2c..d7cb0f8 100644
--- a/meta/conf/machine/include/arm/arch-armv6.inc
+++ b/meta/conf/machine/include/arm/arch-armv6.inc
@@ -48,3 +48,5 @@ PACKAGE_EXTRA_ARCHS_tune-armv6b        = "${PACKAGE_EXTRA_ARCHS_tune-armv5eb-vfp
 PACKAGE_EXTRA_ARCHS_tune-armv6tb       = "${PACKAGE_EXTRA_ARCHS_tune-armv5teb-vfp} armv6b armv6tb armv6b-vfp armv6tb-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv6hfb      = "${PACKAGE_EXTRA_ARCHS_tune-armv5ehfb-vfp}  armv6hfb-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv6thfb     = "${PACKAGE_EXTRA_ARCHS_tune-armv5tehfb-vfp} armv6hfb-vfp armv6thfb-vfp"
+
+QEMU_CPU_SUBTYPE = "-cpu arm1136"
diff --git a/meta/conf/machine/include/tune-cortexa8.inc b/meta/conf/machine/include/tune-cortexa8.inc
index c8ce021..737171d 100644
--- a/meta/conf/machine/include/tune-cortexa8.inc
+++ b/meta/conf/machine/include/tune-cortexa8.inc
@@ -34,3 +34,5 @@ PACKAGE_EXTRA_ARCHS_tune-cortexa8hf             = "${PACKAGE_EXTRA_ARCHS_tune-ar
 PACKAGE_EXTRA_ARCHS_tune-cortexa8thf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa8hf-vfp cortexa8t2hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa8hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  cortexa8hf-vfp cortexa8hf-neon"
 PACKAGE_EXTRA_ARCHS_tune-cortexa8thf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa8hf-vfp cortexa8hf-neon cortexa8t2hf-vfp cortexa8t2hf-neon"
+
+QEMU_CPU_SUBTYPE = "-cpu cortex-a8"
diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.conf
index cdad03f..a628b9d 100644
--- a/meta/conf/machine/qemuarm.conf
+++ b/meta/conf/machine/qemuarm.conf
@@ -10,3 +10,6 @@ KERNEL_IMAGETYPE = "zImage"
 
 SERIAL_CONSOLES = "115200;ttyAMA0 115200;ttyAMA1"
 
+QEMU_MAHINE_SUBTYPE = "-machine versatilepb"
+QEMU_SYSTEM_OPTIONS = "-no-reboot"
+QEMU_KERNEL_OPTIONS = "console=ttyAMA0,115200 console=tty"
-- 
2.7.4


