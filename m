Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C5AB960557
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2016 17:29:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8RHTaQh015907
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 Sep 2016 10:29:36 -0700 (PDT)
Received: from yow-bashfiel-d4.corp.ad.wrs.com (147.11.118.177) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 27 Sep 2016 10:29:35 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 27 Sep 2016 13:29:34 -0400
Message-ID: <5fd39a0543d9564b27767e8d39a6c1503efce1e1.1474997154.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1474997154.git.bruce.ashfield@windriver.com>
References: <cover.1474997154.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] linux-yocto/4.8: update to -rc8
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
X-List-Received-Date: Tue, 27 Sep 2016 17:29:36 -0000
Content-Type: text/plain

Updating linux-yocto*4.8 to -rc8.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.8.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
index ab5b0bdd1a00..8548af71c4b3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "fcd201c964c1092e8cdc39be4ba86fb9248d7aa7"
-SRCREV_meta ?= "a9240b538ce4de29ff1fc7eaf328450c51ab9e80"
+SRCREV_machine ?= "5e21764783494fe8cafa9a107775040d54a4d4d1"
+SRCREV_meta ?= "d0937e67c3c11fd0e6429bd050a86f6c295560e1"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.8-rc7"
+LINUX_VERSION ?= "4.8-rc8"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
index 5df5e0c3c0b9..18214e3925d6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.8-rc7"
+LINUX_VERSION ?= "4.8-rc8"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "eb9c19c72d40a4bb8a6a3b7b949e41e5c31c0d94"
-SRCREV_meta ?= "fb4159467f0f46f788b59f0aff31e3fcd757d00d"
+SRCREV_machine ?= "8edbf10bb6e0759bfb6f18035d1b4773f573d33c"
+SRCREV_meta ?= "d0937e67c3c11fd0e6429bd050a86f6c295560e1"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.8.bb b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
index 2e0dbfa34625..cf4b9b729ea1 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "ba792fae8c979ae4ecaae5e8403b150863173509"
-SRCREV_machine_qemuarm64 ?= "eb9c19c72d40a4bb8a6a3b7b949e41e5c31c0d94"
-SRCREV_machine_qemumips ?= "19b41be93a8fefc65ef4c1c1ab3e8b2d815de93d"
-SRCREV_machine_qemuppc ?= "eb9c19c72d40a4bb8a6a3b7b949e41e5c31c0d94"
-SRCREV_machine_qemux86 ?= "eb9c19c72d40a4bb8a6a3b7b949e41e5c31c0d94"
-SRCREV_machine_qemux86-64 ?= "eb9c19c72d40a4bb8a6a3b7b949e41e5c31c0d94"
-SRCREV_machine_qemumips64 ?= "c6e9e8d1caacea5deca7e41b47fd6076a747b6fa"
-SRCREV_machine ?= "eb9c19c72d40a4bb8a6a3b7b949e41e5c31c0d94"
-SRCREV_meta ?= "fb4159467f0f46f788b59f0aff31e3fcd757d00d"
+SRCREV_machine_qemuarm ?= "3a2b4be23e0d3115962cd49302f80679c86a2df4"
+SRCREV_machine_qemuarm64 ?= "8edbf10bb6e0759bfb6f18035d1b4773f573d33c"
+SRCREV_machine_qemumips ?= "fc863e7a0f5664eef65ff36f35cc41c0be59ef3b"
+SRCREV_machine_qemuppc ?= "8edbf10bb6e0759bfb6f18035d1b4773f573d33c"
+SRCREV_machine_qemux86 ?= "8edbf10bb6e0759bfb6f18035d1b4773f573d33c"
+SRCREV_machine_qemux86-64 ?= "8edbf10bb6e0759bfb6f18035d1b4773f573d33c"
+SRCREV_machine_qemumips64 ?= "dd0e6bc1cb1973d72ff9d3b4ee44a0edc04fea3c"
+SRCREV_machine ?= "8edbf10bb6e0759bfb6f18035d1b4773f573d33c"
+SRCREV_meta ?= "d0937e67c3c11fd0e6429bd050a86f6c295560e1"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.8-rc7"
+LINUX_VERSION ?= "4.8-rc8"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


