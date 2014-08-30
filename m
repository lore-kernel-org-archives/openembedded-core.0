Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5EF5071218
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Aug 2014 04:38:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7U4cm9o013748
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 29 Aug 2014 21:38:48 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 29 Aug 2014 21:38:48 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sat, 30 Aug 2014 00:38:19 -0400
Message-ID: <0fa15b534104769251654b9d0e42fdd45d9343ce.1409345003.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1409345003.git.bruce.ashfield@windriver.com>
References: <cover.1409345003.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 16/18] linux-yocto/3.14: update to v3.14.17
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
X-List-Received-Date: Sat, 30 Aug 2014 04:38:48 -0000
Content-Type: text/plain

Updating the 3.14 repository to the latest korg stable udpate.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 16 ++++++++--------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
index 4d26d3307cdc..406004f760ec 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
@@ -3,13 +3,13 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH ?= "standard/preempt-rt/base"
 KBRANCH_qemuppc ?= "standard/preempt-rt/qemuppc"
 
-SRCREV_machine ?= "21561a4c2865f79bd3489087eed19b26839e33f1"
-SRCREV_machine_qemuppc ?= "61cd09f76a3632ccc02a9e471220f7b5fcb61b93"
+SRCREV_machine ?= "12f9e966eb249c3bdcc935612e2a372e90bad950"
+SRCREV_machine_qemuppc ?= "52ceb28926768c49f06db4e7e08d2226c2a473fd"
 SRCREV_meta ?= "ccad961c4cb6be245ed198bd2c17c27ab33cfcd7"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
-LINUX_VERSION ?= "3.14.13"
+LINUX_VERSION ?= "3.14.17"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
index ebb85058f33f..2ab3e1c067f3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
@@ -4,11 +4,11 @@ KBRANCH ?= "standard/tiny/base"
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
 
-LINUX_VERSION ?= "3.14.13"
+LINUX_VERSION ?= "3.14.17"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "42477caf6bfda5ca7439121d348e474cff44ab5c"
+SRCREV_machine ?= "5a47bbc4c3c2472f3746a8cf1485db7134cf9245"
 SRCREV_meta ?= "ccad961c4cb6be245ed198bd2c17c27ab33cfcd7"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
index f78699db0f2e..2024d8e49536 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
@@ -10,18 +10,18 @@ KBRANCH_qemux86  ?= "standard/common-pc/base"
 KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "65c9b3a3996f541eb26e5918de0ce02ec81a36e2"
-SRCREV_machine_qemumips ?= "e6a4a3bd2e332e2d1b01b4008497775d1ccfea19"
-SRCREV_machine_qemuppc ?= "05e7be95eb9d48590cf7e8dea2538b927a8ba1c6"
-SRCREV_machine_qemux86 ?= "3270ea3cf75d58316913b42ea51ad85068a595de"
-SRCREV_machine_qemux86-64 ?= "42477caf6bfda5ca7439121d348e474cff44ab5c"
-SRCREV_machine_qemumips64 ?= "f2317d326cce17a7a595e0c346e0f15b1a1df981"
-SRCREV_machine ?= "42477caf6bfda5ca7439121d348e474cff44ab5c"
+SRCREV_machine_qemuarm ?= "5130b21b5ef3562c3cb03ad401bc9960fdedf49a"
+SRCREV_machine_qemumips ?= "ef22686356ce614f4bb3637ce6ee0dab068ea5e7"
+SRCREV_machine_qemuppc ?= "c7fed96ea15a49706582d84866f6552a33b3cac4"
+SRCREV_machine_qemux86 ?= "e0f04763abba7d487357f98f4267117fd5e79262"
+SRCREV_machine_qemux86-64 ?= "5a47bbc4c3c2472f3746a8cf1485db7134cf9245"
+SRCREV_machine_qemumips64 ?= "2af2cebe7e8c3755ac1f031c241b0cacad032d93"
+SRCREV_machine ?= "5a47bbc4c3c2472f3746a8cf1485db7134cf9245"
 SRCREV_meta ?= "ccad961c4cb6be245ed198bd2c17c27ab33cfcd7"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.14.13"
+LINUX_VERSION ?= "3.14.17"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
1.8.1.2


