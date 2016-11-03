Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C8D2A71BC4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 13:25:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uA3DPKxx026607
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 3 Nov 2016 06:25:20 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 3 Nov 2016 06:25:20 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 3 Nov 2016 09:25:15 -0400
Message-ID: <462bc3cbbaf64d1e0f1c55f67c7dd0b0d5482171.1478179369.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1478179369.git.bruce.ashfield@windriver.com>
References: <cover.1478179369.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] linux-yocto/4.4: update to v4.4.30
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
X-List-Received-Date: Thu, 03 Nov 2016 13:25:21 -0000
Content-Type: text/plain

Updating to the korg -stable release.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index 6c1138277e54..27a4fa36bcd3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "652b564985db555b549ef73405aea6c38919eefc"
-SRCREV_meta ?= "3030330b066a33ce21164a8b30d0503cf9f68e5b"
+SRCREV_machine ?= "634050bef6cb967f654a62557bc18dd620bf2e95"
+SRCREV_meta ?= "d2d1decbd11e8f78b1aee36605d3653015d710e5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.26"
+LINUX_VERSION ?= "4.4.30"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 76c41639c0d2..7e4fca43f3e8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.4.26"
+LINUX_VERSION ?= "4.4.30"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "ca6a08bd7f86ebef11f763d26f787f7d65270473"
-SRCREV_meta ?= "3030330b066a33ce21164a8b30d0503cf9f68e5b"
+SRCREV_machine ?= "3c15255fd62c2202d76b5c110265f16d33010b9d"
+SRCREV_meta ?= "d2d1decbd11e8f78b1aee36605d3653015d710e5"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index e3a3d901d1b2..0678448f054c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "187bcc13f3023c3ae0a3ba5c69ae85c4e5e693ac"
-SRCREV_machine_qemuarm64 ?= "ca6a08bd7f86ebef11f763d26f787f7d65270473"
-SRCREV_machine_qemumips ?= "2f273556495dd2871f08c73fc3f40d1ad546c638"
-SRCREV_machine_qemuppc ?= "ca6a08bd7f86ebef11f763d26f787f7d65270473"
-SRCREV_machine_qemux86 ?= "ca6a08bd7f86ebef11f763d26f787f7d65270473"
-SRCREV_machine_qemux86-64 ?= "ca6a08bd7f86ebef11f763d26f787f7d65270473"
-SRCREV_machine_qemumips64 ?= "0a19cacf5738876666a4b530a9fa14f05b355299"
-SRCREV_machine ?= "ca6a08bd7f86ebef11f763d26f787f7d65270473"
-SRCREV_meta ?= "3030330b066a33ce21164a8b30d0503cf9f68e5b"
+SRCREV_machine_qemuarm ?= "d752c82364bf890681c161d80717d174419e7512"
+SRCREV_machine_qemuarm64 ?= "3c15255fd62c2202d76b5c110265f16d33010b9d"
+SRCREV_machine_qemumips ?= "ebf27c56cf862b2d5fd08e229e027b5e4dff3609"
+SRCREV_machine_qemuppc ?= "3c15255fd62c2202d76b5c110265f16d33010b9d"
+SRCREV_machine_qemux86 ?= "3c15255fd62c2202d76b5c110265f16d33010b9d"
+SRCREV_machine_qemux86-64 ?= "3c15255fd62c2202d76b5c110265f16d33010b9d"
+SRCREV_machine_qemumips64 ?= "de5b483095712c0c347689ef98e2a9b95bed4c7a"
+SRCREV_machine ?= "3c15255fd62c2202d76b5c110265f16d33010b9d"
+SRCREV_meta ?= "d2d1decbd11e8f78b1aee36605d3653015d710e5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.26"
+LINUX_VERSION ?= "4.4.30"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


