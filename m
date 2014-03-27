Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A8F296F877
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 18:25:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2RIPDF1015803
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 27 Mar 2014 11:25:13 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 27 Mar 2014 11:25:13 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 27 Mar 2014 14:24:56 -0400
Message-ID: <b13574d6340fa48c2c1b8bc877aec2011883a55e.1395944068.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1395944068.git.bruce.ashfield@windriver.com>
References: <cover.1395944068.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 01/13] linux-yocto/3.10: intel-core*/common configuration updates
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
X-List-Received-Date: Thu, 27 Mar 2014 18:25:15 -0000
Content-Type: text/plain

Importing the following configuration changes to support the latest intel
common BSPs:

  6e0e756d5137 intel-common: Remove GMA500 support
  226c3b7a2b82 intel-core*: Add baytrail soc support
  25df7acf2cc4 baytrail: Add feature/soc/baytrail
  8715856ab617 meta: input: add CONFIG_INPUT dependency

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
index f0c732b4e7c6..72af2d8d8adb 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
@@ -5,7 +5,7 @@ KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
 SRCREV_machine ?= "5f466af88f885705efe0f018c027b2631f6724e4"
 SRCREV_machine_qemuppc ?= "e497cba7496e4ae6fc4d018bce57695a61766d22"
-SRCREV_meta ?= "7b3b87d4d5e4c41c235da13aaa9f45d5d338e2c6"
+SRCREV_meta ?= "6e0e756d51372c8b176c5d1e6f786545bceed351"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
index 2ceb946160b1..b2ddb10f3976 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
@@ -10,7 +10,7 @@ LINUX_VERSION ?= "3.10.32"
 KMETA = "meta"
 
 SRCREV_machine ?= "78afd3095c9b37efbbfbfdc25eb3833ef3c6a718"
-SRCREV_meta ?= "7b3b87d4d5e4c41c235da13aaa9f45d5d338e2c6"
+SRCREV_meta ?= "6e0e756d51372c8b176c5d1e6f786545bceed351"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
index 9bc873570ca0..c950199559da 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
@@ -18,7 +18,7 @@ SRCREV_machine_qemux86 ?= "78afd3095c9b37efbbfbfdc25eb3833ef3c6a718"
 SRCREV_machine_qemux86-64 ?= "78afd3095c9b37efbbfbfdc25eb3833ef3c6a718"
 SRCREV_machine_qemumips64 ?= "3e1899546c014808fed8d336b777bf8d81f50d7b"
 SRCREV_machine ?= "78afd3095c9b37efbbfbfdc25eb3833ef3c6a718"
-SRCREV_meta ?= "7b3b87d4d5e4c41c235da13aaa9f45d5d338e2c6"
+SRCREV_meta ?= "6e0e756d51372c8b176c5d1e6f786545bceed351"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
1.8.1.2


