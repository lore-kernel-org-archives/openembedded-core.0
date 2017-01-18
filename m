Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7827071A92
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2017 13:54:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v0IDsb8M020805
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 18 Jan 2017 05:54:37 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 18 Jan 2017 05:54:36 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 18 Jan 2017 08:54:21 -0500
Message-ID: <ce7ba0252d2da3df52d018f54361ea3a0573fd94.1484747560.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1484747560.git.bruce.ashfield@windriver.com>
References: <cover.1484747560.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/14] kernel-yocto: firewire and audio configuration updates
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
X-List-Received-Date: Wed, 18 Jan 2017 13:54:37 -0000
Content-Type: text/plain

Integrating firewire and audio configuration updates from Jussi:

    Add support for IEEE-1394 (Firewire)

    Adds support for IEEE-1394 aka Firewire bus and some commonly used
    devices.

    Signed-off-by: Jussi Laako <jussi.laako@linux.intel.com>

    Update audio support

    Updates audio support to work with modern audio hardware while
    dropping some legacy parts.

    Signed-off-by: Jussi Laako <jussi.laako@linux.intel.com>

Signed-off-by: Jussi Laako <jussi.laako@linux.intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.9.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
index 1dd3b38362ac..647030b9c5a0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "1eb33152d655c73193cec17c4de04499e52b2faa"
-SRCREV_meta ?= "0cf14593694d33518aabd4846d50adeeb7f559ed"
+SRCREV_meta ?= "62afd8f4635269a59baf47d6fb894d73edfa9449"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
index f4b03a72cb3d..99c12a6b6284 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "617635e43afee1aaf98a8f8300596f7a112513c0"
-SRCREV_meta ?= "0cf14593694d33518aabd4846d50adeeb7f559ed"
+SRCREV_meta ?= "62afd8f4635269a59baf47d6fb894d73edfa9449"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.9.bb b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
index 256d3dbea0f1..2765b3711f77 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "617635e43afee1aaf98a8f8300596f7a112513c0"
 SRCREV_machine_qemux86-64 ?= "617635e43afee1aaf98a8f8300596f7a112513c0"
 SRCREV_machine_qemumips64 ?= "3183d61d4d00d8b7faf10d11b3da8cf3db432e6f"
 SRCREV_machine ?= "617635e43afee1aaf98a8f8300596f7a112513c0"
-SRCREV_meta ?= "0cf14593694d33518aabd4846d50adeeb7f559ed"
+SRCREV_meta ?= "62afd8f4635269a59baf47d6fb894d73edfa9449"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
-- 
2.5.0


