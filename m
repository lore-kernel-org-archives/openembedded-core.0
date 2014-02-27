Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D8B606F3A1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 21:12:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s1RLCoPj029690
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 27 Feb 2014 13:12:50 -0800 (PST)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 27 Feb 2014 13:12:50 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 27 Feb 2014 16:12:38 -0500
Message-ID: <f3621116af5bc08ddcfdb7b888db561f35e49ac1.1393535348.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1393535348.git.bruce.ashfield@windriver.com>
References: <cover.1393535348.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] linux-yocto/3.10: integrate latest LTSI changes
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
X-List-Received-Date: Thu, 27 Feb 2014 21:12:53 -0000
Content-Type: text/plain

Integrating the latest 3.10 LTSI changes into the yocto tree.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 14 +++++++-------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
index 31ff0361c3c4..f0c732b4e7c6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
@@ -3,8 +3,8 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-SRCREV_machine ?= "a2475c1d9dc32b7171de28d196ace4a9df06edbd"
-SRCREV_machine_qemuppc ?= "84ab418469d7da9b710ce9e3cbc49e6fb9bd4e05"
+SRCREV_machine ?= "5f466af88f885705efe0f018c027b2631f6724e4"
+SRCREV_machine_qemuppc ?= "e497cba7496e4ae6fc4d018bce57695a61766d22"
 SRCREV_meta ?= "7b3b87d4d5e4c41c235da13aaa9f45d5d338e2c6"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
index 34bb276527f1..2ceb946160b1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "3.10.32"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "a86e2b1eadd1f607d0d6ac5c4ab20a902714ddb1"
+SRCREV_machine ?= "78afd3095c9b37efbbfbfdc25eb3833ef3c6a718"
 SRCREV_meta ?= "7b3b87d4d5e4c41c235da13aaa9f45d5d338e2c6"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
index 55d46fa993d9..9bc873570ca0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
@@ -11,13 +11,13 @@ KBRANCH_qemux86  = "standard/common-pc/base"
 KBRANCH_qemux86-64  = "standard/common-pc-64/base"
 KBRANCH_qemumips64 = "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "df5844fa448e31927884d1850cfcc9bea981165c"
-SRCREV_machine_qemumips ?= "4ffaa6116722ced25c4f775990f445c353d5b8e9"
-SRCREV_machine_qemuppc ?= "db7c6be000d0a07d8b31561753c83ccbb4ae41ab"
-SRCREV_machine_qemux86 ?= "a86e2b1eadd1f607d0d6ac5c4ab20a902714ddb1"
-SRCREV_machine_qemux86-64 ?= "a86e2b1eadd1f607d0d6ac5c4ab20a902714ddb1"
-SRCREV_machine_qemumips64 ?= "fe0da5cbc516f7686af316cdeafaf7b7e8d34d7d"
-SRCREV_machine ?= "a86e2b1eadd1f607d0d6ac5c4ab20a902714ddb1"
+SRCREV_machine_qemuarm ?= "c295c53987007a5d0c87cc9b23125e9ff85900bd"
+SRCREV_machine_qemumips ?= "2833be8c96671b24a203a5dc45a21c38d5d841c3"
+SRCREV_machine_qemuppc ?= "cf413ddca8b974a473b72635e1499223a02d7949"
+SRCREV_machine_qemux86 ?= "78afd3095c9b37efbbfbfdc25eb3833ef3c6a718"
+SRCREV_machine_qemux86-64 ?= "78afd3095c9b37efbbfbfdc25eb3833ef3c6a718"
+SRCREV_machine_qemumips64 ?= "3e1899546c014808fed8d336b777bf8d81f50d7b"
+SRCREV_machine ?= "78afd3095c9b37efbbfbfdc25eb3833ef3c6a718"
 SRCREV_meta ?= "7b3b87d4d5e4c41c235da13aaa9f45d5d338e2c6"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
-- 
1.8.1.2


