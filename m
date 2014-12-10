Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6FAA272341
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 14:16:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBAEGMdS014097
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 10 Dec 2014 06:16:22 -0800 (PST)
Received: from yow-bashfiel-d4.corp.ad.wrs.com (128.224.92.225) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 10 Dec 2014 06:16:21 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 10 Dec 2014 09:16:10 -0500
Message-ID: <a51eac8c29bffe0afbd9e184cbce34c4d196a3ef.1418220684.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1418220684.git.bruce.ashfield@windriver.com>
References: <cover.1418220684.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/9] linux-yocto/3.17: update to v3.17.2
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
X-List-Received-Date: Wed, 10 Dec 2014 14:16:29 -0000
Content-Type: text/plain

Updating to the korg 3.17.2 -stable release.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.17.bb      | 18 +++++++++---------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb
index 357e050a2407..f5aa05d89a5d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb
@@ -4,12 +4,12 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "3.17.1"
+LINUX_VERSION ?= "3.17.2"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "0caf16d38536e3dec8a02ea657e1960f1216f174"
-SRCREV_meta ?= "229ce533868773f201f9ab36e2b4248b381309ec"
+SRCREV_machine ?= "cad8f6f70717e54604315db0c9b8889199871e50"
+SRCREV_meta ?= "3283372105ee2f22c1d93ea63fa754179c203e98"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.17.bb b/meta/recipes-kernel/linux/linux-yocto_3.17.bb
index 872441389dde..dfaf6f48a8c4 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.17.bb
@@ -10,18 +10,18 @@ KBRANCH_qemux86  ?= "standard/common-pc"
 KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "6b57ab98e37cda3b4a4cd50483a43e053ae73d1b"
-SRCREV_machine_qemumips ?= "80b24085b50144088cdfca737b5925a15ae9e312"
-SRCREV_machine_qemuppc ?= "12a5e6b10d6d34878f26592160ff64668b021ab4"
-SRCREV_machine_qemux86 ?= "0caf16d38536e3dec8a02ea657e1960f1216f174"
-SRCREV_machine_qemux86-64 ?= "0caf16d38536e3dec8a02ea657e1960f1216f174"
-SRCREV_machine_qemumips64 ?= "3b77b2d556103b86f787913385a7655b92adcc03"
-SRCREV_machine ?= "0caf16d38536e3dec8a02ea657e1960f1216f174"
-SRCREV_meta ?= "229ce533868773f201f9ab36e2b4248b381309ec"
+SRCREV_machine_qemuarm ?= "6d85563640cf2377d702637150ea8314ae915350"
+SRCREV_machine_qemumips ?= "bfc1ee46ed29b1bac18deef51620536c66fa83c5"
+SRCREV_machine_qemuppc ?= "f4c541bbad8b2a119f86fdc86d3a9d4b8546218b"
+SRCREV_machine_qemux86 ?= "cad8f6f70717e54604315db0c9b8889199871e50"
+SRCREV_machine_qemux86-64 ?= "cad8f6f70717e54604315db0c9b8889199871e50"
+SRCREV_machine_qemumips64 ?= "d6f80d8d30197a278cd386f987998a85e9754a40"
+SRCREV_machine ?= "cad8f6f70717e54604315db0c9b8889199871e50"
+SRCREV_meta ?= "3283372105ee2f22c1d93ea63fa754179c203e98"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.17.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.17.1"
+LINUX_VERSION ?= "3.17.2"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.1.0


