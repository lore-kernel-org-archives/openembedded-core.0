Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E85B171512
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 14:57:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8NEvqpI025461
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 23 Sep 2014 07:57:52 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 23 Sep 2014 07:57:51 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 23 Sep 2014 10:57:41 -0400
Message-ID: <e6501b124d6c8c6f7de5f4ac7e83e142f558082c.1411483823.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1411483823.git.bruce.ashfield@windriver.com>
References: <cover.1411483823.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/7] linux-yocto/3.17: update to v3.17-rc5
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
X-List-Received-Date: Tue, 23 Sep 2014 14:57:52 -0000
Content-Type: text/plain

Bumping the SRCREVs to import the latest korg -rc.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.17.bb      | 18 +++++++++---------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb
index c1cb47ba9057..4da9c851e275 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb
@@ -4,12 +4,12 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "3.17-rc4"
+LINUX_VERSION ?= "3.17-rc5"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "1a3939eb747a635b23b4234f785795c52dce72a8"
-SRCREV_meta ?= "7df849fc7eba54765368e26634341dbe6e2ad161"
+SRCREV_machine ?= "724ab25b085554741753709941e768cae1a2121e"
+SRCREV_meta ?= "62a1fd63023ab6b18114dd093be86d0854474c41"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.17.bb b/meta/recipes-kernel/linux/linux-yocto_3.17.bb
index 7fe7fdaa4afb..b37ae3cc4e9c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.17.bb
@@ -10,18 +10,18 @@ KBRANCH_qemux86  ?= "standard/common-pc"
 KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "4bacea69cf78bdf42bcf7619239294b8996c5dac"
-SRCREV_machine_qemumips ?= "69d4e97c23d4d031f55645cd0486064979e4db5c"
-SRCREV_machine_qemuppc ?= "4e5f8849093f71f8caebedd8af4660baace9bccb"
-SRCREV_machine_qemux86 ?= "1a3939eb747a635b23b4234f785795c52dce72a8"
-SRCREV_machine_qemux86-64 ?= "1a3939eb747a635b23b4234f785795c52dce72a8"
-SRCREV_machine_qemumips64 ?= "5e036fb17397a241fda2211a6caaa6e6f3121250"
-SRCREV_machine ?= "1a3939eb747a635b23b4234f785795c52dce72a8"
-SRCREV_meta ?= "7df849fc7eba54765368e26634341dbe6e2ad161"
+SRCREV_machine_qemuarm ?= "8aa46f1d04208040be52feb422f2aae48655b51f"
+SRCREV_machine_qemumips ?= "b32a452b97972bcaba5a67383f209cec06dfe089"
+SRCREV_machine_qemuppc ?= "72b05f144a4d5331ae33bff0b6f4a70fb90d2b3a"
+SRCREV_machine_qemux86 ?= "724ab25b085554741753709941e768cae1a2121e"
+SRCREV_machine_qemux86-64 ?= "724ab25b085554741753709941e768cae1a2121e"
+SRCREV_machine_qemumips64 ?= "6dabf96a2fe457e4cb8821721936e9fb72556494"
+SRCREV_machine ?= "724ab25b085554741753709941e768cae1a2121e"
+SRCREV_meta ?= "62a1fd63023ab6b18114dd093be86d0854474c41"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.17-rc4"
+LINUX_VERSION ?= "3.17-rc5"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
1.8.1.2


