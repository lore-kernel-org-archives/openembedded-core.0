Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4DBD1725CE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 14:16:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBAEGRlr014103
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 10 Dec 2014 06:16:27 -0800 (PST)
Received: from yow-bashfiel-d4.corp.ad.wrs.com (128.224.92.225) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 10 Dec 2014 06:16:26 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 10 Dec 2014 09:16:14 -0500
Message-ID: <7c1068d01c4600ae03cea078edf9a3a8f03b1268.1418220684.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1418220684.git.bruce.ashfield@windriver.com>
References: <cover.1418220684.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/9] linux-yocto/3.17: update to v3.17.6
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

Integrating the latest korg -stable update for v3.17

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.17.bb      | 18 +++++++++---------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb
index f5aa05d89a5d..1a4f9a81454f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb
@@ -4,12 +4,12 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "3.17.2"
+LINUX_VERSION ?= "3.17.6"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "cad8f6f70717e54604315db0c9b8889199871e50"
-SRCREV_meta ?= "3283372105ee2f22c1d93ea63fa754179c203e98"
+SRCREV_machine ?= "5ff54d8fbf74278e9e5074cbba516a14f0915ff7"
+SRCREV_meta ?= "b81030f9ec2de3dc6c048e142dcbff62e305cc40"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.17.bb b/meta/recipes-kernel/linux/linux-yocto_3.17.bb
index dfaf6f48a8c4..71a82a722305 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.17.bb
@@ -10,18 +10,18 @@ KBRANCH_qemux86  ?= "standard/common-pc"
 KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "6d85563640cf2377d702637150ea8314ae915350"
-SRCREV_machine_qemumips ?= "bfc1ee46ed29b1bac18deef51620536c66fa83c5"
-SRCREV_machine_qemuppc ?= "f4c541bbad8b2a119f86fdc86d3a9d4b8546218b"
-SRCREV_machine_qemux86 ?= "cad8f6f70717e54604315db0c9b8889199871e50"
-SRCREV_machine_qemux86-64 ?= "cad8f6f70717e54604315db0c9b8889199871e50"
-SRCREV_machine_qemumips64 ?= "d6f80d8d30197a278cd386f987998a85e9754a40"
-SRCREV_machine ?= "cad8f6f70717e54604315db0c9b8889199871e50"
-SRCREV_meta ?= "3283372105ee2f22c1d93ea63fa754179c203e98"
+SRCREV_machine_qemuarm ?= "a1183153c56ace9f9140c73ce730ec181f78dc0f"
+SRCREV_machine_qemumips ?= "18c8db2009f25524a29a5258d041e0442c10817d"
+SRCREV_machine_qemuppc ?= "6d2bbdac0e6560542fa2252d91eee9ae0f17f9c7"
+SRCREV_machine_qemux86 ?= "5ff54d8fbf74278e9e5074cbba516a14f0915ff7"
+SRCREV_machine_qemux86-64 ?= "5ff54d8fbf74278e9e5074cbba516a14f0915ff7"
+SRCREV_machine_qemumips64 ?= "2306cb2dd019c8b731879331ba314035a7271e7b"
+SRCREV_machine ?= "5ff54d8fbf74278e9e5074cbba516a14f0915ff7"
+SRCREV_meta ?= "b81030f9ec2de3dc6c048e142dcbff62e305cc40"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.17.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.17.2"
+LINUX_VERSION ?= "3.17.6"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.1.0


