Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7117B72E35
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Feb 2015 16:31:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t16GVCk3001338
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 6 Feb 2015 08:31:12 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 6 Feb 2015 08:31:12 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 6 Feb 2015 11:31:04 -0500
Message-ID: <b5b58b2e465dfed2a274c19bd1edc4d1330136e3.1423237494.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1423237494.git.bruce.ashfield@windriver.com>
References: <cover.1423237494.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/8] linux-yocto/3.17: update to v3.17.8
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
X-List-Received-Date: Fri, 06 Feb 2015 16:31:12 -0000
Content-Type: text/plain

Updating to the latest korg stable version.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.17.bb      | 20 ++++++++++----------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb
index 1a4f9a81454f..c399adcd5e87 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb
@@ -4,12 +4,12 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "3.17.6"
+LINUX_VERSION ?= "3.17.8"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "5ff54d8fbf74278e9e5074cbba516a14f0915ff7"
-SRCREV_meta ?= "b81030f9ec2de3dc6c048e142dcbff62e305cc40"
+SRCREV_machine ?= "0409b1fbed221e61212e17b7637fa54f908d83f6"
+SRCREV_meta ?= "f24c2bf9c298595d00a9d8600841f2b0206e1fba"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.17.bb b/meta/recipes-kernel/linux/linux-yocto_3.17.bb
index 973d8aaa845a..f57d9c200256 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.17.bb
@@ -11,19 +11,19 @@ KBRANCH_qemux86  ?= "standard/common-pc"
 KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "a1183153c56ace9f9140c73ce730ec181f78dc0f"
-SRCREV_machine_qemuarm64 ?= "268b7677421eef003a84f31c6bd0b8ec3acc1e36"
-SRCREV_machine_qemumips ?= "18c8db2009f25524a29a5258d041e0442c10817d"
-SRCREV_machine_qemuppc ?= "6d2bbdac0e6560542fa2252d91eee9ae0f17f9c7"
-SRCREV_machine_qemux86 ?= "5ff54d8fbf74278e9e5074cbba516a14f0915ff7"
-SRCREV_machine_qemux86-64 ?= "5ff54d8fbf74278e9e5074cbba516a14f0915ff7"
-SRCREV_machine_qemumips64 ?= "2306cb2dd019c8b731879331ba314035a7271e7b"
-SRCREV_machine ?= "5ff54d8fbf74278e9e5074cbba516a14f0915ff7"
-SRCREV_meta ?= "b81030f9ec2de3dc6c048e142dcbff62e305cc40"
+SRCREV_machine_qemuarm ?= "12991e8ac40c51ef3e337f17f12aa59c6500fc7f"
+SRCREV_machine_qemuarm64 ?= "0409b1fbed221e61212e17b7637fa54f908d83f6"
+SRCREV_machine_qemumips ?= "1f4735ed314defc95ab9929258ad12844cc2c676"
+SRCREV_machine_qemuppc ?= "3231dececf867215ecab7c7f9ec3a7a7640a3f32"
+SRCREV_machine_qemux86 ?= "0409b1fbed221e61212e17b7637fa54f908d83f6"
+SRCREV_machine_qemux86-64 ?= "0409b1fbed221e61212e17b7637fa54f908d83f6"
+SRCREV_machine_qemumips64 ?= "7005c584078109dae03567e9c597a847a2bc5136"
+SRCREV_machine ?= "0409b1fbed221e61212e17b7637fa54f908d83f6"
+SRCREV_meta ?= "f24c2bf9c298595d00a9d8600841f2b0206e1fba"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.17.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.17.6"
+LINUX_VERSION ?= "3.17.8"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.1.0


