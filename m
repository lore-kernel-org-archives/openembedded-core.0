Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 30692725CD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 14:16:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBAEGJE2028945
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 10 Dec 2014 06:16:19 -0800 (PST)
Received: from yow-bashfiel-d4.corp.ad.wrs.com (128.224.92.225) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 10 Dec 2014 06:16:18 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 10 Dec 2014 09:16:08 -0500
Message-ID: <3742985d6696938f0db950ef8c926b5dd296afff.1418220684.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1418220684.git.bruce.ashfield@windriver.com>
References: <cover.1418220684.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/9] linux-yocto/3.17: update to v3.17.1
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
X-List-Received-Date: Wed, 10 Dec 2014 14:16:30 -0000
Content-Type: text/plain

Updating to the kver to the latest korg stable update. This fixes some
important bugs (as well as the usual mix of more minor ones), in particular
libata bugs and SSD corruption issues are fixed.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.17.bb      | 18 +++++++++---------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb
index 77855d956e9d..357e050a2407 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb
@@ -4,12 +4,12 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "3.17"
+LINUX_VERSION ?= "3.17.1"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "1a6dd1205de5b7c6135a42fec00550738ff777b5"
-SRCREV_meta ?= "9ba007f8d0abf3cc5499e8eee13065b7f0713e81"
+SRCREV_machine ?= "0caf16d38536e3dec8a02ea657e1960f1216f174"
+SRCREV_meta ?= "229ce533868773f201f9ab36e2b4248b381309ec"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.17.bb b/meta/recipes-kernel/linux/linux-yocto_3.17.bb
index 3838dbfa57a5..872441389dde 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.17.bb
@@ -10,18 +10,18 @@ KBRANCH_qemux86  ?= "standard/common-pc"
 KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "e86f70699655d1f5bf2518c8dcdb949a39161c86"
-SRCREV_machine_qemumips ?= "0acaa5991a61fbab0d897157049ac2e638e9c7bf"
-SRCREV_machine_qemuppc ?= "50e33fec112527de12c2833cd8a283dd4a75ae33"
-SRCREV_machine_qemux86 ?= "1a6dd1205de5b7c6135a42fec00550738ff777b5"
-SRCREV_machine_qemux86-64 ?= "1a6dd1205de5b7c6135a42fec00550738ff777b5"
-SRCREV_machine_qemumips64 ?= "c0558aaa8251a022447a4ac782d4e707401c52d3"
-SRCREV_machine ?= "1a6dd1205de5b7c6135a42fec00550738ff777b5"
-SRCREV_meta ?= "9ba007f8d0abf3cc5499e8eee13065b7f0713e81"
+SRCREV_machine_qemuarm ?= "6b57ab98e37cda3b4a4cd50483a43e053ae73d1b"
+SRCREV_machine_qemumips ?= "80b24085b50144088cdfca737b5925a15ae9e312"
+SRCREV_machine_qemuppc ?= "12a5e6b10d6d34878f26592160ff64668b021ab4"
+SRCREV_machine_qemux86 ?= "0caf16d38536e3dec8a02ea657e1960f1216f174"
+SRCREV_machine_qemux86-64 ?= "0caf16d38536e3dec8a02ea657e1960f1216f174"
+SRCREV_machine_qemumips64 ?= "3b77b2d556103b86f787913385a7655b92adcc03"
+SRCREV_machine ?= "0caf16d38536e3dec8a02ea657e1960f1216f174"
+SRCREV_meta ?= "229ce533868773f201f9ab36e2b4248b381309ec"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.17.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.17"
+LINUX_VERSION ?= "3.17.1"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.1.0


