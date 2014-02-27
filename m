Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8DC3A6F3A1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 21:12:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s1RLCnPH008934
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 27 Feb 2014 13:12:49 -0800 (PST)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 27 Feb 2014 13:12:49 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 27 Feb 2014 16:12:37 -0500
Message-ID: <2c3435aa9f793ce009017fdd8fa952445e5b28bc.1393535348.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1393535348.git.bruce.ashfield@windriver.com>
References: <cover.1393535348.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] linux-yocto/3.4: update to v3.4.82 and latest LTSI
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
X-List-Received-Date: Thu, 27 Feb 2014 21:12:52 -0000
Content-Type: text/plain

Updating the 3.4 tree to the 3.4.82 -stable update, and integrating
the latest LTSI changes.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb   |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.4.bb      | 16 ++++++++--------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index 73fd3a930e91..ef380adafe8d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -3,14 +3,14 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-LINUX_VERSION ?= "3.4.69"
+LINUX_VERSION ?= "3.4.82"
 LINUX_KERNEL_TYPE = "preempt-rt"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "f59ffc4762503e4d6eaa8d934dbf1464d966f51e"
-SRCREV_machine_qemuppc ?= "60a0fa3cf1a08778b70bf64e19f8733019e9abd7"
-SRCREV_meta ?= "f36797c2df3fbe9491c8ac5977fb691f4a75e9b7"
+SRCREV_machine ?= "74369c14c79dbb546ce1e387b1363e808ea4f5b1"
+SRCREV_machine_qemuppc ?= "71694a302cda24cc8a7c5f772e8306111ffcfb6c"
+SRCREV_meta ?= "8e88bf72b72afb3b638e751ea2a5c89394cc196b"
 
 PR = "${INC_PR}.1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
index 0b43dabd1c66..6ed19500e367 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
@@ -8,12 +8,12 @@ KBRANCH = "${KBRANCH_DEFAULT}"
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
 
-LINUX_VERSION ?= "3.4.69"
+LINUX_VERSION ?= "3.4.82"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "7f4d818b0450a5dc79f81b51dc7d13d0682b1287"
-SRCREV_meta ?= "f36797c2df3fbe9491c8ac5977fb691f4a75e9b7"
+SRCREV_machine ?= "c29f5c8952c0f3ef27773d78e5cc64e437a357cb"
+SRCREV_meta ?= "8e88bf72b72afb3b638e751ea2a5c89394cc196b"
 
 PR = "${INC_PR}.1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index 765d4deec7ae..1a3ccdd7bd1f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -11,17 +11,17 @@ KBRANCH_qemux86  = "standard/common-pc/base"
 KBRANCH_qemux86-64  = "standard/common-pc-64/base"
 KBRANCH_qemumips64 = "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "38fe75106c5faa3ea49d0a285769de3d08478f90"
-SRCREV_machine_qemumips  ?= "67c8918ce3cfd66f19f23b46381993ff488b3fe0"
-SRCREV_machine_qemuppc ?= "0e81c96b36e05746ae978a830fe3dbdac8a51e58"
-SRCREV_machine_qemux86 ?= "7f4d818b0450a5dc79f81b51dc7d13d0682b1287"
-SRCREV_machine_qemux86-64 ?= "7f4d818b0450a5dc79f81b51dc7d13d0682b1287"
-SRCREV_machine ?= "7f4d818b0450a5dc79f81b51dc7d13d0682b1287"
-SRCREV_meta ?= "f36797c2df3fbe9491c8ac5977fb691f4a75e9b7"
+SRCREV_machine_qemuarm ?= "6c34763a9e4e05e1fcaa32d915bd05cccd0abc1d"
+SRCREV_machine_qemumips  ?= "fa9377eda8d2dceccb218f229551424c64ef0c28"
+SRCREV_machine_qemuppc ?= "85868d48f06911b7dddaf0180af96c8f2e874922"
+SRCREV_machine_qemux86 ?= "c29f5c8952c0f3ef27773d78e5cc64e437a357cb"
+SRCREV_machine_qemux86-64 ?= "c29f5c8952c0f3ef27773d78e5cc64e437a357cb"
+SRCREV_machine ?= "c29f5c8952c0f3ef27773d78e5cc64e437a357cb"
+SRCREV_meta ?= "8e88bf72b72afb3b638e751ea2a5c89394cc196b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.4.69"
+LINUX_VERSION ?= "3.4.82"
 
 PR = "${INC_PR}.5"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.8.1.2


