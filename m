Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A2E78785E4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 13:47:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v8EDlAGw030762
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 14 Sep 2017 06:47:10 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 14 Sep 2017 06:47:09 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 14 Sep 2017 09:47:00 -0400
Message-ID: <ea276117b3bf83304196904a4ec44b84eafe4eb1.1505396619.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1505396619.git.bruce.ashfield@windriver.com>
References: <cover.1505396619.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/9] linux-yocto/4.12: bluetooth: CVE-2017-1000251
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
X-List-Received-Date: Thu, 14 Sep 2017 13:47:09 -0000
Content-Type: text/plain

Integrating the following commit:

[
    commit 16de0149674ed12d983b77a453852ac2e64584b4
    Author: Ben Seri <ben@armis.com>
    Date:   Sat Sep 9 23:15:59 2017 +0200

    Bluetooth: Properly check L2CAP config option output buffer length

    Validate the output buffer length for L2CAP config requests and
    responses to avoid overflowing the stack buffer used for building the
    option blocks.

    Cc: stable@vger.kernel.org
    Signed-off-by: Ben Seri <ben@armis.com>
    Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
    Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
index 491e5b05a23a..c49a9340f8e2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "c86fccf85be960294703ca9882dde9ee62aaa9e4"
+SRCREV_machine ?= "16de0149674ed12d983b77a453852ac2e64584b4"
 SRCREV_meta ?= "eda4d18ce4b259c84ccd5c249c3dc5958c16928c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
index 05debd338b99..efd876aee5ef 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.12.12"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "c86fccf85be960294703ca9882dde9ee62aaa9e4"
+SRCREV_machine ?= "16de0149674ed12d983b77a453852ac2e64584b4"
 SRCREV_meta ?= "eda4d18ce4b259c84ccd5c249c3dc5958c16928c"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.12.bb b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
index d060e2496b8d..a2624090d3f8 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "42a4ca618610964560fcf6e4b6d7540f5449e992"
-SRCREV_machine_qemuarm64 ?= "c86fccf85be960294703ca9882dde9ee62aaa9e4"
-SRCREV_machine_qemumips ?= "9252e9261b0a606df2f3f49004c23f8a110962ad"
-SRCREV_machine_qemuppc ?= "c86fccf85be960294703ca9882dde9ee62aaa9e4"
-SRCREV_machine_qemux86 ?= "c86fccf85be960294703ca9882dde9ee62aaa9e4"
-SRCREV_machine_qemux86-64 ?= "c86fccf85be960294703ca9882dde9ee62aaa9e4"
-SRCREV_machine_qemumips64 ?= "bbcf4a8ae8af56687938a7412a9da92f4d1b6552"
-SRCREV_machine ?= "c86fccf85be960294703ca9882dde9ee62aaa9e4"
+SRCREV_machine_qemuarm ?= "67b62d8d7bd9f19f0f4fad044787d947ebc4ec25"
+SRCREV_machine_qemuarm64 ?= "16de0149674ed12d983b77a453852ac2e64584b4"
+SRCREV_machine_qemumips ?= "371926551d44c140a0fb869cec34762b40bdf1a6"
+SRCREV_machine_qemuppc ?= "16de0149674ed12d983b77a453852ac2e64584b4"
+SRCREV_machine_qemux86 ?= "16de0149674ed12d983b77a453852ac2e64584b4"
+SRCREV_machine_qemux86-64 ?= "16de0149674ed12d983b77a453852ac2e64584b4"
+SRCREV_machine_qemumips64 ?= "9d63d9c11c44ceabd452d7ee49cf55a88c39383f"
+SRCREV_machine ?= "16de0149674ed12d983b77a453852ac2e64584b4"
 SRCREV_meta ?= "eda4d18ce4b259c84ccd5c249c3dc5958c16928c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


