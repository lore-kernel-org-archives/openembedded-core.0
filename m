Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 510A473B9F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Mar 2015 18:57:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t2OIvuC9010666
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 24 Mar 2015 11:57:56 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 24 Mar 2015 11:57:56 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 24 Mar 2015 14:57:51 -0400
Message-ID: <65fd1dbdd25accaf8986d05f8b8e9d651363d155.1427222980.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1427222980.git.bruce.ashfield@windriver.com>
References: <cover.1427222980.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] linux-yocto/3.14: integrate korg stable and meta data changes
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
X-List-Received-Date: Tue, 24 Mar 2015 18:57:56 -0000
Content-Type: text/plain

Updating the 3.14 SRCREVs to import the v3.14.36 korg stable changes and
configuration changes to the meta branch.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 20 ++++++++++----------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
index aff670271cb8..4b602b1b03f6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
@@ -3,13 +3,13 @@ KBRANCH_qemuppc ?= "standard/preempt-rt/qemuppc"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "eb2c9c93de9b806f2a52c26bba229089a7a71385"
-SRCREV_machine_qemuppc ?= "bd470d1c8337323b0f7d1529df70a1c68108df0b"
-SRCREV_meta ?= "6eddbf47875ef48ddc5864957a7b63363100782b"
+SRCREV_machine ?= "3fb54cf8f4c3254f628e6c4720fe3c731a9de0b2"
+SRCREV_machine_qemuppc ?= "ab935c000435b6f5af42543f8e2300e473995d5a"
+SRCREV_meta ?= "162dfe3bb092c1a792e5ed224fe09672e9814b24"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
-LINUX_VERSION ?= "3.14.29"
+LINUX_VERSION ?= "3.14.36"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
index f6b95a218ad7..afcc4dd6206c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "3.14.29"
+LINUX_VERSION ?= "3.14.36"
 
 KMETA = "meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "3bab81113682d3a5ffc8ea60cf770beed4831492"
-SRCREV_meta ?= "6eddbf47875ef48ddc5864957a7b63363100782b"
+SRCREV_machine ?= "4434aa71ff7043c570f9eae493df1ccadbda9b85"
+SRCREV_meta ?= "162dfe3bb092c1a792e5ed224fe09672e9814b24"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
index 0d0d8b2ee22a..b71aea2b18e9 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
@@ -11,19 +11,19 @@ KBRANCH_qemux86  ?= "standard/common-pc/base"
 KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "38d0249598bef8263f1f1e280badf6b92a0bc668"
-SRCREV_machine_qemuarm64 ?= "3bab81113682d3a5ffc8ea60cf770beed4831492"
-SRCREV_machine_qemumips ?= "d2138247c6f1ba8f082f7c2b0d4a6a4efb0cf908"
-SRCREV_machine_qemuppc ?= "2ec2927314d58a012403cbaccdf0a8a1f5c5d666"
-SRCREV_machine_qemux86 ?= "9ed9a63eeafbcbee0e378e304a1029bb14d45697"
-SRCREV_machine_qemux86-64 ?= "3bab81113682d3a5ffc8ea60cf770beed4831492"
-SRCREV_machine_qemumips64 ?= "afdaa94d540bf671f4d4d198ec6b891df22fb323"
-SRCREV_machine ?= "3bab81113682d3a5ffc8ea60cf770beed4831492"
-SRCREV_meta ?= "6eddbf47875ef48ddc5864957a7b63363100782b"
+SRCREV_machine_qemuarm ?= "d1cea997ae512ee325600a247d75027e65655e0a"
+SRCREV_machine_qemuarm64 ?= "4434aa71ff7043c570f9eae493df1ccadbda9b85"
+SRCREV_machine_qemumips ?= "c37155f99472e7dc9f94b3bda72c73a3f718fdbf"
+SRCREV_machine_qemuppc ?= "521b9fd001dc25a446d39f349cdfb7f9f5697d05"
+SRCREV_machine_qemux86 ?= "f7cbba6012312f5bf9b7279bafa8bb09d18b547d"
+SRCREV_machine_qemux86-64 ?= "4434aa71ff7043c570f9eae493df1ccadbda9b85"
+SRCREV_machine_qemumips64 ?= "a777f11a26f075b71becb47b5133252c5d8fafff"
+SRCREV_machine ?= "4434aa71ff7043c570f9eae493df1ccadbda9b85"
+SRCREV_meta ?= "162dfe3bb092c1a792e5ed224fe09672e9814b24"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.14.29"
+LINUX_VERSION ?= "3.14.36"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.1.0


