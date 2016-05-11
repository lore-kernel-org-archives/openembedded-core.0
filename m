Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 10D696FFFE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 21:35:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u4BLZ7uE029404
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 11 May 2016 14:35:08 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 11 May 2016 14:35:07 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 11 May 2016 17:35:02 -0400
Message-ID: <967ac0ddbeff07c27b49db19b1e4230372d078c0.1463002334.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1463002334.git.bruce.ashfield@windriver.com>
References: <cover.1463002334.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] linux-yocto/4.4: bump to v4.4.10
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
X-List-Received-Date: Wed, 11 May 2016 21:35:09 -0000
Content-Type: text/plain

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index 9d4b7d39c821..5e3937409b1e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -2,13 +2,13 @@ KBRANCH ?= "standard/preempt-rt"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "1ae11b6ab3f6b8a5e2f57451ff7bbb17726f0ba5"
-SRCREV_meta ?= "344bfd3a9df9247b2aaf47b123916a94b23ab097"
+SRCREV_machine ?= "449fe1dca2c1f972f1ec02091a20691f3e19a28b"
+SRCREV_meta ?= "b7ce076447c0e3cc07f8d3ed4a11070fdeae41e6"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.9"
+LINUX_VERSION ?= "4.4.10"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 67137442322d..abafe756eb7a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.4.9"
+LINUX_VERSION ?= "4.4.10"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "242f3e2d6ec292c84813b0e8a577cc24a55335e7"
-SRCREV_meta ?= "344bfd3a9df9247b2aaf47b123916a94b23ab097"
+SRCREV_machine ?= "fe7ff38448d530db27ac31cbb086cb6fdf94bb7f"
+SRCREV_meta ?= "b7ce076447c0e3cc07f8d3ed4a11070fdeae41e6"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index c08641d1dabf..a665b5ce8807 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "7f8b040efb7b442799a0cdd5d9b1bc31d852494b"
-SRCREV_machine_qemuarm64 ?= "242f3e2d6ec292c84813b0e8a577cc24a55335e7"
-SRCREV_machine_qemumips ?= "3aa28eea959c0b1a408efc683c94941003aecfe8"
-SRCREV_machine_qemuppc ?= "242f3e2d6ec292c84813b0e8a577cc24a55335e7"
-SRCREV_machine_qemux86 ?= "242f3e2d6ec292c84813b0e8a577cc24a55335e7"
-SRCREV_machine_qemux86-64 ?= "242f3e2d6ec292c84813b0e8a577cc24a55335e7"
-SRCREV_machine_qemumips64 ?= "816cc8e84ef0e1f2669ecc432bdd0362135bfe2b"
-SRCREV_machine ?= "242f3e2d6ec292c84813b0e8a577cc24a55335e7"
-SRCREV_meta ?= "344bfd3a9df9247b2aaf47b123916a94b23ab097"
+SRCREV_machine_qemuarm ?= "bdda97014e55200e704ecd8d112da09176dcb7dc"
+SRCREV_machine_qemuarm64 ?= "fe7ff38448d530db27ac31cbb086cb6fdf94bb7f"
+SRCREV_machine_qemumips ?= "f60887555f78ae5f5338d41181e848082109429b"
+SRCREV_machine_qemuppc ?= "fe7ff38448d530db27ac31cbb086cb6fdf94bb7f"
+SRCREV_machine_qemux86 ?= "fe7ff38448d530db27ac31cbb086cb6fdf94bb7f"
+SRCREV_machine_qemux86-64 ?= "fe7ff38448d530db27ac31cbb086cb6fdf94bb7f"
+SRCREV_machine_qemumips64 ?= "b783512062c5081fa9b01e89e811d0508e62895f"
+SRCREV_machine ?= "fe7ff38448d530db27ac31cbb086cb6fdf94bb7f"
+SRCREV_meta ?= "b7ce076447c0e3cc07f8d3ed4a11070fdeae41e6"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.9"
+LINUX_VERSION ?= "4.4.10"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


