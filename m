Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 328E56C002
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2013 15:16:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r83FGp38024997
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 3 Sep 2013 08:16:51 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 3 Sep 2013 08:16:49 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 3 Sep 2013 11:16:45 -0400
Message-ID: <54544711d68cd001d57a458aa70183614b9d6e1f.1378221277.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1378221277.git.bruce.ashfield@windriver.com>
References: <cover.1378221277.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] linux-yocto/3.10: update to v3.10.10
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
X-List-Received-Date: Tue, 03 Sep 2013 15:16:50 -0000
Content-Type: text/plain

Updating the BSP SRCREVs for the 3.10.10 korg -stable release.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |    6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |    4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      |   16 ++++++++--------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
index 797cad7..a2e0310 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
@@ -3,13 +3,13 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-SRCREV_machine ?= "94e63f0640ef3680a605e82ee19f3de688f0ec59"
-SRCREV_machine_qemuppc ?= "2c0455935f1964ce69c70d0f7980a656040e50ea"
+SRCREV_machine ?= "38793e629654f6b3e3f371a6b1f1745df26450f4"
+SRCREV_machine_qemuppc ?= "d4c836c55fce6f1a7f299bba2104f457b201c63d"
 SRCREV_meta ?= "cd502a88148ab214b54860f97a96f41858fd6446"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
-LINUX_VERSION ?= "3.10.9"
+LINUX_VERSION ?= "3.10.10"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
index 2d85537..8b3dbe0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
@@ -5,11 +5,11 @@ KBRANCH = "${KBRANCH_DEFAULT}"
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
 
-LINUX_VERSION ?= "3.10.9"
+LINUX_VERSION ?= "3.10.10"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "b76f4452b72080a538406abc9b290a5d811d61f8"
+SRCREV_machine ?= "ebc8428fdd938cfdfcdcadd77c3308ece6a57de1"
 SRCREV_meta ?= "cd502a88148ab214b54860f97a96f41858fd6446"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
index b6d9eae..1d29f6b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
@@ -3,18 +3,18 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH_DEFAULT = "standard/base"
 KBRANCH = "${KBRANCH_DEFAULT}"
 
-SRCREV_machine_qemuarm ?= "d8c48090a1272c69e009c4ef5fa675fc8db178cc"
-SRCREV_machine_qemumips  ?= "181188440e96896fbc69fa2c5ea5d2ee43304da0"
-SRCREV_machine_qemuppc ?= "c0a23bc4b4d6be3d2f09a81dfeb3456f51b8d439"
-SRCREV_machine_qemux86 ?= "b76f4452b72080a538406abc9b290a5d811d61f8"
-SRCREV_machine_qemux86-64 ?= "b76f4452b72080a538406abc9b290a5d811d61f8"
-SRCREV_machine_qemumips64 ?= "3a0d015e9908b69666c7f7780502aed4d115de1d"
-SRCREV_machine ?= "b76f4452b72080a538406abc9b290a5d811d61f8"
+SRCREV_machine_qemuarm ?= "6a38a13d2aa6058d7e7d88c3dc44b0bdfc4fe551"
+SRCREV_machine_qemumips  ?= "ad273773bee951fc63ab54f9fda672263bf919b4"
+SRCREV_machine_qemuppc ?= "677afd6cdbfb5c23a9e5479acafb7ba484789837"
+SRCREV_machine_qemux86 ?= "ebc8428fdd938cfdfcdcadd77c3308ece6a57de1"
+SRCREV_machine_qemux86-64 ?= "ebc8428fdd938cfdfcdcadd77c3308ece6a57de1"
+SRCREV_machine_qemumips64 ?= "6fdcd396b40373a63f57aeaf4fd59b4b4da05f8a"
+SRCREV_machine ?= "ebc8428fdd938cfdfcdcadd77c3308ece6a57de1"
 SRCREV_meta ?= "cd502a88148ab214b54860f97a96f41858fd6446"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.10.9"
+LINUX_VERSION ?= "3.10.10"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
1.7.10.4


