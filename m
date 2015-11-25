Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 673E460670
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 13:43:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAPDh4CS029539
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 25 Nov 2015 05:43:04 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 25 Nov 2015 05:41:59 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 25 Nov 2015 08:41:54 -0500
Message-ID: <a0e19d36369fcb6ba58bfe3f16292451fd5933bc.1448458595.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1448458595.git.bruce.ashfield@windriver.com>
References: <cover.1448458595.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] linux-yocto/4.1: fsl-mpc8315e-rdb: Enable EEPROM
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
X-List-Received-Date: Wed, 25 Nov 2015 13:43:17 -0000
Content-Type: text/plain

Updating the 4.1 SRCREVs for:

  Update the mpc8315erdb.dts to contain the eeprom device
  information. Coupled with adding "MISC_DEVICES" into the
  kernel configuration, we have a working eeprom.

  Signed-off-by: Jingdong Lu <jingdong.lu@windriver.com>
  Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 18 +++++++++---------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 412691501bc5..be48f954f300 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -2,8 +2,8 @@ KBRANCH ?= "standard/preempt-rt/base"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "a4b5d54fc4fc0e2b3035642559279a27c57a3391"
-SRCREV_meta ?= "1fb60461e4522bba62b4b34e9520128c959d2437"
+SRCREV_machine ?= "79cf0aa35a608fea70ecbdfe452a2eb1c003a133"
+SRCREV_meta ?= "6c775bde6b542a42ec8a84be61ecf34f42865a30"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 69bfbad0da31..11d375cc4a6a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.1.13"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "49e2f2d48ac2bb3f0fc379ee87651a2eaeab2cc7"
-SRCREV_meta ?= "1fb60461e4522bba62b4b34e9520128c959d2437"
+SRCREV_machine ?= "ec44c165aa1d30bde477196ee428d82530e55485"
+SRCREV_meta ?= "6c775bde6b542a42ec8a84be61ecf34f42865a30"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 4f4e6ad14847..09d675a77f0a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "52340eea58baf03f41f0b0a9410d8e6038e3124a"
-SRCREV_machine_qemuarm64 ?= "49e2f2d48ac2bb3f0fc379ee87651a2eaeab2cc7"
-SRCREV_machine_qemumips ?= "f821004dd2dae30004c54b2d2ec2563aee11be8a"
-SRCREV_machine_qemuppc ?= "49e2f2d48ac2bb3f0fc379ee87651a2eaeab2cc7"
-SRCREV_machine_qemux86 ?= "49e2f2d48ac2bb3f0fc379ee87651a2eaeab2cc7"
-SRCREV_machine_qemux86-64 ?= "49e2f2d48ac2bb3f0fc379ee87651a2eaeab2cc7"
-SRCREV_machine_qemumips64 ?= "0cf340000b9c2b91d1086d4c34f88eecfc257562"
-SRCREV_machine ?= "49e2f2d48ac2bb3f0fc379ee87651a2eaeab2cc7"
-SRCREV_meta ?= "1fb60461e4522bba62b4b34e9520128c959d2437"
+SRCREV_machine_qemuarm ?= "5039adac938a19aa547f94551126a8421ce62745"
+SRCREV_machine_qemuarm64 ?= "ec44c165aa1d30bde477196ee428d82530e55485"
+SRCREV_machine_qemumips ?= "203b315e50e32ce39f9831b0518ef18f16f61025"
+SRCREV_machine_qemuppc ?= "ec44c165aa1d30bde477196ee428d82530e55485"
+SRCREV_machine_qemux86 ?= "ec44c165aa1d30bde477196ee428d82530e55485"
+SRCREV_machine_qemux86-64 ?= "ec44c165aa1d30bde477196ee428d82530e55485"
+SRCREV_machine_qemumips64 ?= "9223cd7daecddcbdb0818aaa6edfbd90060d1b84"
+SRCREV_machine ?= "ec44c165aa1d30bde477196ee428d82530e55485"
+SRCREV_meta ?= "6c775bde6b542a42ec8a84be61ecf34f42865a30"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
-- 
2.1.0


