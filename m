Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 09A1960721
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 21:35:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u4BLZ5ED017261
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 11 May 2016 14:35:06 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 11 May 2016 14:35:05 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 11 May 2016 17:35:00 -0400
Message-ID: <683f1b3df216a7a3862e4b06ceae58450aca3a62.1463002334.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1463002334.git.bruce.ashfield@windriver.com>
References: <cover.1463002334.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] linux-yocto/4.4: update to v4.4.9
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
X-List-Received-Date: Wed, 11 May 2016 21:35:07 -0000
Content-Type: text/plain

Updating to the v4.4.9 korg -stable release:

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index adc63b5a69a7..69a0af2f5246 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -2,13 +2,13 @@ KBRANCH ?= "standard/preempt-rt"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "4da435e403bbe6dd8fbc5cdda4411cb6afe72053"
-SRCREV_meta ?= "9ab4787fe2aea2ae0fcc31a5e067eaba19ef64c8"
+SRCREV_machine ?= "1ae11b6ab3f6b8a5e2f57451ff7bbb17726f0ba5"
+SRCREV_meta ?= "812e62b35ac2b88bbee80b7c8436d9df7065a90e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.8"
+LINUX_VERSION ?= "4.4.9"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 312d2ccc1e25..b2d26301ed3f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.4.8"
+LINUX_VERSION ?= "4.4.9"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "b18090556c1d1b449233cd555c27a04d38272d6d"
-SRCREV_meta ?= "9ab4787fe2aea2ae0fcc31a5e067eaba19ef64c8"
+SRCREV_machine ?= "242f3e2d6ec292c84813b0e8a577cc24a55335e7"
+SRCREV_meta ?= "812e62b35ac2b88bbee80b7c8436d9df7065a90e"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index b8a59428d31b..9ee198665816 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "1394eb1f0a1988da223dfc93304222f4543d19c3"
-SRCREV_machine_qemuarm64 ?= "b18090556c1d1b449233cd555c27a04d38272d6d"
-SRCREV_machine_qemumips ?= "6a063a7239fd16e7a796ce4876e8677d5d02e8cc"
-SRCREV_machine_qemuppc ?= "b18090556c1d1b449233cd555c27a04d38272d6d"
-SRCREV_machine_qemux86 ?= "b18090556c1d1b449233cd555c27a04d38272d6d"
-SRCREV_machine_qemux86-64 ?= "b18090556c1d1b449233cd555c27a04d38272d6d"
-SRCREV_machine_qemumips64 ?= "3a1c6d7576908a2dd21746b1d4ab4f43b83cd824"
-SRCREV_machine ?= "b18090556c1d1b449233cd555c27a04d38272d6d"
-SRCREV_meta ?= "9ab4787fe2aea2ae0fcc31a5e067eaba19ef64c8"
+SRCREV_machine_qemuarm ?= "7f8b040efb7b442799a0cdd5d9b1bc31d852494b"
+SRCREV_machine_qemuarm64 ?= "242f3e2d6ec292c84813b0e8a577cc24a55335e7"
+SRCREV_machine_qemumips ?= "3aa28eea959c0b1a408efc683c94941003aecfe8"
+SRCREV_machine_qemuppc ?= "242f3e2d6ec292c84813b0e8a577cc24a55335e7"
+SRCREV_machine_qemux86 ?= "242f3e2d6ec292c84813b0e8a577cc24a55335e7"
+SRCREV_machine_qemux86-64 ?= "242f3e2d6ec292c84813b0e8a577cc24a55335e7"
+SRCREV_machine_qemumips64 ?= "816cc8e84ef0e1f2669ecc432bdd0362135bfe2b"
+SRCREV_machine ?= "242f3e2d6ec292c84813b0e8a577cc24a55335e7"
+SRCREV_meta ?= "812e62b35ac2b88bbee80b7c8436d9df7065a90e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.8"
+LINUX_VERSION ?= "4.4.9"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


