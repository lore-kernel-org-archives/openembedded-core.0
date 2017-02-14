Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A6CD360745
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 21:14:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v1ELEWaN018503
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 14 Feb 2017 13:14:32 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 14 Feb 2017 13:14:32 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 14 Feb 2017 16:14:19 -0500
Message-ID: <4f2efa11538a6554dae5f008e3f7bc2e3b1fa7be.1487106757.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1487106757.git.bruce.ashfield@windriver.com>
References: <cover.1487106757.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/11] linux-yocto/4.9: Intel-quark: Add intel-quark-preempt-rt bsp configuration
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
X-List-Received-Date: Tue, 14 Feb 2017 21:14:32 -0000
Content-Type: text/plain

While there are intel-quark configurations for the KTYPEs standard and
tiny in bsp/intel-common, there's none for the preempt-rt KTYPE.
Trying to build preempt-rt enabled kernels such as linux-yocto-rt for
intel-quark yields a .config having a potentially misconfigured
architecture. More importantly, however, preempt-rt related CONFIG
options are not enabled. Hence, a build of, e.g., linux-yocto-rt, does
not result in a preempt-rt enabled kernel.

Signed-off-by: Christian Storm <christian.storm@siemens.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.9.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
index 94697ee98694..7521bc437f46 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "01a64b0469256a432af0b8a0f27d32694e908e8b"
-SRCREV_meta ?= "8d1042fc4b23d184688b0e6931dd4e7ff4807273"
+SRCREV_meta ?= "f9cb76e24e3a73b8eda70ea9bd91ba5a52711521"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
index 34354f02722c..d92f49f50d03 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "c85c54f5bf53b98afe8105e91bffcdb6c60afe8f"
-SRCREV_meta ?= "8d1042fc4b23d184688b0e6931dd4e7ff4807273"
+SRCREV_meta ?= "f9cb76e24e3a73b8eda70ea9bd91ba5a52711521"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.9.bb b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
index 6795d2cb1fa3..ff9fda822b55 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "c85c54f5bf53b98afe8105e91bffcdb6c60afe8f"
 SRCREV_machine_qemux86-64 ?= "c85c54f5bf53b98afe8105e91bffcdb6c60afe8f"
 SRCREV_machine_qemumips64 ?= "13818cbe0b9f0e2e7542b7c088b5719c7a463da9"
 SRCREV_machine ?= "c85c54f5bf53b98afe8105e91bffcdb6c60afe8f"
-SRCREV_meta ?= "8d1042fc4b23d184688b0e6931dd4e7ff4807273"
+SRCREV_meta ?= "f9cb76e24e3a73b8eda70ea9bd91ba5a52711521"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
-- 
2.5.0


