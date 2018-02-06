Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 059FF78548
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Feb 2018 16:22:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w16GM5O1025774
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 6 Feb 2018 08:22:06 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 6 Feb 2018 08:22:02 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 6 Feb 2018 11:21:55 -0500
Message-ID: <3cfe7870f353b8ea3bfa58d528496cc9abb8ee2c.1517931042.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1517931042.git.bruce.ashfield@windriver.com>
References: <cover.1517931042.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/9] linux-yocto/4.12: pinctrl backports
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
X-List-Received-Date: Tue, 06 Feb 2018 16:22:05 -0000
Content-Type: text/plain

Backporting the following pinctrl commits to enable controllers on
Intel Cannon Lake:

  4b7a5c1b4ec5 pinctrl: intel: Add Intel Cannon Lake PCH-H pin controller support
  044631ce1937 pinctrl: intel: Add Intel Cannon Lake PCH pin controller support
  2054b0ea59a7 pinctrl: intel: Make it possible to specify mode per pin in a group
  55b9053b5a5a pinctrl: intel: Add support for variable size pad groups

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 18 +++++++++---------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
index 11ff3cfecd12..f54bf8f2e903 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "f095b0588b491bb81854fbc168479cf5ff8a03ff"
-SRCREV_meta ?= "44a22d45cbcd7e14ea635d36949e14135f540fe0"
+SRCREV_machine ?= "21541338928449e6131e73bfd529f5214027d918"
+SRCREV_meta ?= "7986844d9de597218a23f82e68b01e5bf060d576"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
index c516d5de69af..5ac407c4dce3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.12.19"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "257f843ea367744620f1d92910afd2f454e31483"
-SRCREV_meta ?= "44a22d45cbcd7e14ea635d36949e14135f540fe0"
+SRCREV_machine ?= "4b7a5c1b4ec5536806942340755bcfbf6f3584d9"
+SRCREV_meta ?= "7986844d9de597218a23f82e68b01e5bf060d576"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.12.bb b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
index d7b6e2750d50..f2db5174ac86 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "dafca619b2bd44966042bba76aa00edb0ca002df"
-SRCREV_machine_qemuarm64 ?= "257f843ea367744620f1d92910afd2f454e31483"
-SRCREV_machine_qemumips ?= "99c30bfd13f4cc364e55b67138705976bab193c9"
-SRCREV_machine_qemuppc ?= "257f843ea367744620f1d92910afd2f454e31483"
-SRCREV_machine_qemux86 ?= "257f843ea367744620f1d92910afd2f454e31483"
-SRCREV_machine_qemux86-64 ?= "257f843ea367744620f1d92910afd2f454e31483"
-SRCREV_machine_qemumips64 ?= "135d85c1f8cded6b68d533a0018b2897230b880c"
-SRCREV_machine ?= "257f843ea367744620f1d92910afd2f454e31483"
-SRCREV_meta ?= "44a22d45cbcd7e14ea635d36949e14135f540fe0"
+SRCREV_machine_qemuarm ?= "77d25f21501511f01eb3df3c58dd8cf10a90adce"
+SRCREV_machine_qemuarm64 ?= "4b7a5c1b4ec5536806942340755bcfbf6f3584d9"
+SRCREV_machine_qemumips ?= "567ea03f6c5844bed62957b20747b4315851e3c3"
+SRCREV_machine_qemuppc ?= "4b7a5c1b4ec5536806942340755bcfbf6f3584d9"
+SRCREV_machine_qemux86 ?= "4b7a5c1b4ec5536806942340755bcfbf6f3584d9"
+SRCREV_machine_qemux86-64 ?= "4b7a5c1b4ec5536806942340755bcfbf6f3584d9"
+SRCREV_machine_qemumips64 ?= "4796b8299a405d1428f000cc4a2e8800a3670541"
+SRCREV_machine ?= "4b7a5c1b4ec5536806942340755bcfbf6f3584d9"
+SRCREV_meta ?= "7986844d9de597218a23f82e68b01e5bf060d576"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
-- 
2.5.0


