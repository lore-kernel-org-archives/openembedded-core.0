Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C0C496FFE8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jun 2014 15:26:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5HFQSu8029839
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 17 Jun 2014 08:26:28 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 17 Jun 2014 08:26:28 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 17 Jun 2014 11:26:14 -0400
Message-ID: <168d56d5b9a59696b79f1d1e943632108b4621bc.1403016995.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1403016995.git.bruce.ashfield@windriver.com>
References: <cover.1403016995.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] linux-yocto/3.14: enable mpc8315e NAND and Yaffs2 gcc 4.9 fix
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
X-List-Received-Date: Tue, 17 Jun 2014 15:26:35 -0000
Content-Type: text/plain

Updating the meta branch with configuration changes to enable NAND
booting on the mpc8315e reference board.

We also update the BSP SRCREVs to fix a compilation issue with
date/time on Yaffs2 and gcc 4.9.

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 16 ++++++++--------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
index 29df6b722ea9..6d5096cd8565 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
@@ -3,9 +3,9 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-SRCREV_machine ?= "ec7945d3abac66557de452e9c81f6f3692f187db"
-SRCREV_machine_qemuppc ?= "ec7945d3abac66557de452e9c81f6f3692f187db"
-SRCREV_meta ?= "135b9fb4b8d66b8df9abcd22f325e77614d35d2e"
+SRCREV_machine ?= "5c79217cdf1c16a3cacd28968e8c3e417e994c86"
+SRCREV_machine_qemuppc ?= "1ad208565754a1122df5500246f3142e2a3eff39"
+SRCREV_meta ?= "602be954ac45e8aea06cb93d6766bbf83c242090"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
index e619fded4167..7eb90a6929a8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
@@ -8,8 +8,8 @@ LINUX_VERSION ?= "3.14.5"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "8e552bfb9824bbfdda3b5353dab290519a7332c7"
-SRCREV_meta ?= "135b9fb4b8d66b8df9abcd22f325e77614d35d2e"
+SRCREV_machine ?= "96930820e0cb6d4b31d5e0c8f3174805f4a868b3"
+SRCREV_meta ?= "602be954ac45e8aea06cb93d6766bbf83c242090"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
index 6a500653bc1d..1bdf520a9249 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
@@ -10,14 +10,14 @@ KBRANCH_qemux86  = "standard/common-pc/base"
 KBRANCH_qemux86-64  = "standard/common-pc-64/base"
 KBRANCH_qemumips64 = "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "57c7d98c639aa69ed4640aaf0077dfc6f6213b62"
-SRCREV_machine_qemumips ?= "0c95bd5e4fd9834de451197edb2f0acb7d93d1e8"
-SRCREV_machine_qemuppc ?= "9a15b569a7c7340e895327ba464e8cd852914c2b"
-SRCREV_machine_qemux86 ?= "4aa0cb556f1a3457d0cb3285d0ba2aa073b745eb"
-SRCREV_machine_qemux86-64 ?= "8e552bfb9824bbfdda3b5353dab290519a7332c7"
-SRCREV_machine_qemumips64 ?= "42cb63ec0929a3e488b3c61cef31c6ee5b0e1005"
-SRCREV_machine ?= "8e552bfb9824bbfdda3b5353dab290519a7332c7"
-SRCREV_meta ?= "135b9fb4b8d66b8df9abcd22f325e77614d35d2e"
+SRCREV_machine_qemuarm ?= "2489f1f4d7aa27bf0808d7fa80a50399c643516d"
+SRCREV_machine_qemumips ?= "63b4ca3223d9481baa77f527f50d906d15747141"
+SRCREV_machine_qemuppc ?= "e5dfe8f89b45effe445d04e0f9b391948eb108ae"
+SRCREV_machine_qemux86 ?= "41d5fe27dc3d3e769cb6af01770cac3d75a91e1a"
+SRCREV_machine_qemux86-64 ?= "96930820e0cb6d4b31d5e0c8f3174805f4a868b3"
+SRCREV_machine_qemumips64 ?= "103df748c6e83d5874a8385592f758feeb818324"
+SRCREV_machine ?= "96930820e0cb6d4b31d5e0c8f3174805f4a868b3"
+SRCREV_meta ?= "602be954ac45e8aea06cb93d6766bbf83c242090"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
1.8.1.2


