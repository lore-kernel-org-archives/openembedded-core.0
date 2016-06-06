Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CCA30771CA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jun 2016 08:15:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u568FbxQ012251
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 6 Jun 2016 01:15:37 -0700 (PDT)
Received: from yow-bashfiel-d4.corp.ad.wrs.com (128.224.21.120) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 6 Jun 2016 01:15:36 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 6 Jun 2016 04:15:28 -0400
Message-ID: <aad7b71d7fa6e50b4b4e259d0804278c3551076f.1465200824.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1465200824.git.bruce.ashfield@windriver.com>
References: <cover.1465200824.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] yocto-bsps: add i2c definitions to beaglebone
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
X-List-Received-Date: Mon, 06 Jun 2016 08:15:40 -0000
Content-Type: text/plain

Importing i2c dtsi support from linux-omap. This enables the
busses for future development and application support.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 24cc0ac07703..a43007bb21c4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "e22280e8c2905d96c7cc5917df202b6ed904d042"
+SRCREV_machine ?= "f719f69e00afd9982fbbbe9995640cffabfea704"
 SRCREV_meta ?= "4b4199bd24f206d459061bb0a920d009429d5ed3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index bf7d6c5959e1..dd2b46675255 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.1.24"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "403eda4633e9037fb715d0d1e8ae847b2bd0651a"
+SRCREV_machine ?= "57f17e7008c57885ef5c41bda2829589e499ae28"
 SRCREV_meta ?= "4b4199bd24f206d459061bb0a920d009429d5ed3"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index c325bc59c6c8..50bb38a42700 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "cadb80aa4bcee282f1b0798ef35ad8b96ec44931"
-SRCREV_machine_qemuarm64 ?= "403eda4633e9037fb715d0d1e8ae847b2bd0651a"
-SRCREV_machine_qemumips ?= "737eda6388a529d0937e9d91daa3644b11f322dc"
-SRCREV_machine_qemuppc ?= "403eda4633e9037fb715d0d1e8ae847b2bd0651a"
-SRCREV_machine_qemux86 ?= "403eda4633e9037fb715d0d1e8ae847b2bd0651a"
-SRCREV_machine_qemux86-64 ?= "403eda4633e9037fb715d0d1e8ae847b2bd0651a"
-SRCREV_machine_qemumips64 ?= "f276d128428b031521d766bfbfe84f9f9f992930"
-SRCREV_machine ?= "403eda4633e9037fb715d0d1e8ae847b2bd0651a"
+SRCREV_machine_qemuarm ?= "a7b999561115b0b84814a2a27fe3f8c5b0599b0d"
+SRCREV_machine_qemuarm64 ?= "57f17e7008c57885ef5c41bda2829589e499ae28"
+SRCREV_machine_qemumips ?= "ce9d4e563925e65c7a4b73fd6027ed8d2a4fc5e4"
+SRCREV_machine_qemuppc ?= "57f17e7008c57885ef5c41bda2829589e499ae28"
+SRCREV_machine_qemux86 ?= "57f17e7008c57885ef5c41bda2829589e499ae28"
+SRCREV_machine_qemux86-64 ?= "57f17e7008c57885ef5c41bda2829589e499ae28"
+SRCREV_machine_qemumips64 ?= "75260c1966188a38e070420624ac65b188f77948"
+SRCREV_machine ?= "57f17e7008c57885ef5c41bda2829589e499ae28"
 SRCREV_meta ?= "4b4199bd24f206d459061bb0a920d009429d5ed3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


