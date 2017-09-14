Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A1AA6785BC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 13:47:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v8EDlB7L029269
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Sep 2017 06:47:11 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 14 Sep 2017 06:47:10 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 14 Sep 2017 09:47:01 -0400
Message-ID: <c5fec3d945a25900900c7ad085ccf0b57a957f6d.1505396619.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1505396619.git.bruce.ashfield@windriver.com>
References: <cover.1505396619.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/9] linux-yocto/4.9: bluetooth: CVE-2017-1000251
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
X-List-Received-Date: Thu, 14 Sep 2017 13:47:10 -0000
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
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.9.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
index 23c445a814af..6734dc0d05e2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "1e3f9281ed3043b83d31a3f3dfd28cfb0343873f"
+SRCREV_machine ?= "0817a7b3a853d1bdd3b87a2654ed2ee62f624806"
 SRCREV_meta ?= "6acae6f7200af17b3c2be5ecab2cffdc59a02b35"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
index 0c2ff0acb272..e0c523661883 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.9.49"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "0a2c7ae3c42cd9009df2df20afd2df78332c3ae3"
+SRCREV_machine ?= "480ee599fb8df712c10dcf4b7aa6398b79f7d404"
 SRCREV_meta ?= "6acae6f7200af17b3c2be5ecab2cffdc59a02b35"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.9.bb b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
index dbb5d54117f2..dbe40a338d88 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "072093c81a9329cec188905dfadb19c983be14f7"
-SRCREV_machine_qemuarm64 ?= "0a2c7ae3c42cd9009df2df20afd2df78332c3ae3"
-SRCREV_machine_qemumips ?= "0c66ebad24541c7673620ca433cd8478e5d06e3b"
-SRCREV_machine_qemuppc ?= "0a2c7ae3c42cd9009df2df20afd2df78332c3ae3"
-SRCREV_machine_qemux86 ?= "0a2c7ae3c42cd9009df2df20afd2df78332c3ae3"
-SRCREV_machine_qemux86-64 ?= "0a2c7ae3c42cd9009df2df20afd2df78332c3ae3"
-SRCREV_machine_qemumips64 ?= "6ac61462925ac9d6f668286bc29ee54f05e8f5e9"
-SRCREV_machine ?= "0a2c7ae3c42cd9009df2df20afd2df78332c3ae3"
+SRCREV_machine_qemuarm ?= "8caa35a74753d45178720933f03d8d5150a8ff17"
+SRCREV_machine_qemuarm64 ?= "480ee599fb8df712c10dcf4b7aa6398b79f7d404"
+SRCREV_machine_qemumips ?= "fc2a3b9f932779fdf053675a5a73e8f9917507a5"
+SRCREV_machine_qemuppc ?= "480ee599fb8df712c10dcf4b7aa6398b79f7d404"
+SRCREV_machine_qemux86 ?= "480ee599fb8df712c10dcf4b7aa6398b79f7d404"
+SRCREV_machine_qemux86-64 ?= "480ee599fb8df712c10dcf4b7aa6398b79f7d404"
+SRCREV_machine_qemumips64 ?= "aee63978005c04ea853099764acaa08130e65554"
+SRCREV_machine ?= "480ee599fb8df712c10dcf4b7aa6398b79f7d404"
 SRCREV_meta ?= "6acae6f7200af17b3c2be5ecab2cffdc59a02b35"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


