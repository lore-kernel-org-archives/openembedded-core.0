Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 42E816D6C8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2013 05:56:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rA45uU1g017730
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 3 Nov 2013 21:56:30 -0800 (PST)
Received: from yow-bashfiel-d3.corp.ad.wrs.com (128.224.130.89) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Sun, 3 Nov 2013 21:56:29 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 4 Nov 2013 00:56:26 -0500
Message-ID: <84a857c08f0b208dbd7dd14f022e58e90a329ca9.1383544482.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1383544482.git.bruce.ashfield@windriver.com>
References: <cover.1383544482.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] linux-yocto/3.10: common-pc: add missing dependencies for BRCMSMAC
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
X-List-Received-Date: Mon, 04 Nov 2013 05:56:29 -0000
Content-Type: text/plain

Updating the meta branch SRCREV to import some configuration updates
for the common-pc-wifi feature:

   CONFIG_WEXT_CORE=y
   CONFIG_WEXT_PROC=y
   CONFIG_CFG80211_WEXT=y

   CONFIG_BCMA=m
   CONFIG_BCMA_HOST_PCI_POSSIBLE=y
   CONFIG_BCMA_HOST_PCI=y
   CONFIG_BCMA_DRIVER_GMAC_CMN=y

   CONFIG_CRC8=m
   CONFIG_CORDIC=m

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
index ce7c789..53d546c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
@@ -5,7 +5,7 @@ KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
 SRCREV_machine ?= "919b378578a8f931ee87092f1ce2608a6c2815db"
 SRCREV_machine_qemuppc ?= "be60fd54789f04941b51665970ef121089f9b93e"
-SRCREV_meta ?= "aa4a6574195b220cacd9c1e8dcbba7b0b1085eb6"
+SRCREV_meta ?= "f1c9080cd27f99700fa59b5375d1ddd0afe625ad"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
index f0c781f..c769517 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
@@ -10,7 +10,7 @@ LINUX_VERSION ?= "3.10.17"
 KMETA = "meta"
 
 SRCREV_machine ?= "375aee37c2508899b6a8c0bdff7d4d67cb75fb36"
-SRCREV_meta ?= "aa4a6574195b220cacd9c1e8dcbba7b0b1085eb6"
+SRCREV_meta ?= "f1c9080cd27f99700fa59b5375d1ddd0afe625ad"
 
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
index 2c2b74b..af50b5c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
@@ -10,7 +10,7 @@ SRCREV_machine_qemux86 ?= "375aee37c2508899b6a8c0bdff7d4d67cb75fb36"
 SRCREV_machine_qemux86-64 ?= "375aee37c2508899b6a8c0bdff7d4d67cb75fb36"
 SRCREV_machine_qemumips64 ?= "44eaa7b02aa1e4b8e539c2227702f74f9fcbcfea"
 SRCREV_machine ?= "375aee37c2508899b6a8c0bdff7d4d67cb75fb36"
-SRCREV_meta ?= "aa4a6574195b220cacd9c1e8dcbba7b0b1085eb6"
+SRCREV_meta ?= "f1c9080cd27f99700fa59b5375d1ddd0afe625ad"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
1.8.1.2


