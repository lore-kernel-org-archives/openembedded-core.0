Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D7C6C785E4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 13:47:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v8EDl8KL029262
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Sep 2017 06:47:08 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 14 Sep 2017 06:47:07 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 14 Sep 2017 09:46:58 -0400
Message-ID: <33686a31e66d9b8cae2f424269a3113052ec6fa1.1505396619.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1505396619.git.bruce.ashfield@windriver.com>
References: <cover.1505396619.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/9] linux-yocto/4.12: integrate aufs4 core support
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
X-List-Received-Date: Thu, 14 Sep 2017 13:47:08 -0000
Content-Type: text/plain

The aufs4 now has a 4.12 port, so we can integrate it into the
reference kernel and stay consistent with previous releases.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 18 +++++++++---------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
index f19e1248a90a..491e5b05a23a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "873830670b1af7765428166db40d413018c40e28"
-SRCREV_meta ?= "4fdd56fe602ceb2690407df44283e45ff1c9cd0e"
+SRCREV_machine ?= "c86fccf85be960294703ca9882dde9ee62aaa9e4"
+SRCREV_meta ?= "eda4d18ce4b259c84ccd5c249c3dc5958c16928c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
index fa3cd2075b8f..05debd338b99 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.12.12"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "873830670b1af7765428166db40d413018c40e28"
-SRCREV_meta ?= "4fdd56fe602ceb2690407df44283e45ff1c9cd0e"
+SRCREV_machine ?= "c86fccf85be960294703ca9882dde9ee62aaa9e4"
+SRCREV_meta ?= "eda4d18ce4b259c84ccd5c249c3dc5958c16928c"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.12.bb b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
index e9838247f45e..d060e2496b8d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "1f5c932260cac2118d256d38b475a2811a8551e5"
-SRCREV_machine_qemuarm64 ?= "873830670b1af7765428166db40d413018c40e28"
-SRCREV_machine_qemumips ?= "a9f98cc2715a65537877c86808a101429028d48b"
-SRCREV_machine_qemuppc ?= "873830670b1af7765428166db40d413018c40e28"
-SRCREV_machine_qemux86 ?= "873830670b1af7765428166db40d413018c40e28"
-SRCREV_machine_qemux86-64 ?= "873830670b1af7765428166db40d413018c40e28"
-SRCREV_machine_qemumips64 ?= "1863c93b44aeb6badb4993fd9a6ab3d360bf30d1"
-SRCREV_machine ?= "873830670b1af7765428166db40d413018c40e28"
-SRCREV_meta ?= "4fdd56fe602ceb2690407df44283e45ff1c9cd0e"
+SRCREV_machine_qemuarm ?= "42a4ca618610964560fcf6e4b6d7540f5449e992"
+SRCREV_machine_qemuarm64 ?= "c86fccf85be960294703ca9882dde9ee62aaa9e4"
+SRCREV_machine_qemumips ?= "9252e9261b0a606df2f3f49004c23f8a110962ad"
+SRCREV_machine_qemuppc ?= "c86fccf85be960294703ca9882dde9ee62aaa9e4"
+SRCREV_machine_qemux86 ?= "c86fccf85be960294703ca9882dde9ee62aaa9e4"
+SRCREV_machine_qemux86-64 ?= "c86fccf85be960294703ca9882dde9ee62aaa9e4"
+SRCREV_machine_qemumips64 ?= "bbcf4a8ae8af56687938a7412a9da92f4d1b6552"
+SRCREV_machine ?= "c86fccf85be960294703ca9882dde9ee62aaa9e4"
+SRCREV_meta ?= "eda4d18ce4b259c84ccd5c249c3dc5958c16928c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
-- 
2.5.0


