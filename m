Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 04CC370799
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 20:42:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6OKgDYa017269
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 24 Jul 2014 13:42:13 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 24 Jul 2014 13:42:13 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 24 Jul 2014 16:41:47 -0400
Message-ID: <aeecae21f4fd22308c0f6d3b0e0b59998723148d.1406234258.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1406234258.git.bruce.ashfield@windriver.com>
References: <cover.1406234258.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/8] linux-yocto/3.14: vexpress and MVM firmware support
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
X-List-Received-Date: Thu, 24 Jul 2014 20:42:20 -0000
Content-Type: text/plain

Updating the 3.14 SRCREVs to integrate the following changes:

 meta: iwlwifi: Add MVM firmware support
 vexpress: Pass LOADADDR to Makefile

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 16 ++++++++--------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
index 6d5096cd8565..61f9dbc9a14e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
@@ -3,9 +3,9 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-SRCREV_machine ?= "5c79217cdf1c16a3cacd28968e8c3e417e994c86"
-SRCREV_machine_qemuppc ?= "1ad208565754a1122df5500246f3142e2a3eff39"
-SRCREV_meta ?= "602be954ac45e8aea06cb93d6766bbf83c242090"
+SRCREV_machine ?= "568f018a22474939695a31709802bb8863c483d9"
+SRCREV_machine_qemuppc ?= "6af424a3a76a7fcf0cc7718b93f7a9db52383c25"
+SRCREV_meta ?= "b2af4e3528e65583c98f3a08c6edb0cad7a120b0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
index 7eb90a6929a8..98381606ebb0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
@@ -8,8 +8,8 @@ LINUX_VERSION ?= "3.14.5"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "96930820e0cb6d4b31d5e0c8f3174805f4a868b3"
-SRCREV_meta ?= "602be954ac45e8aea06cb93d6766bbf83c242090"
+SRCREV_machine ?= "686b9ddf58ea6b533be70fe9f4a6407557b263d2"
+SRCREV_meta ?= "b2af4e3528e65583c98f3a08c6edb0cad7a120b0"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
index 1bdf520a9249..02909b79c029 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
@@ -10,14 +10,14 @@ KBRANCH_qemux86  = "standard/common-pc/base"
 KBRANCH_qemux86-64  = "standard/common-pc-64/base"
 KBRANCH_qemumips64 = "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "2489f1f4d7aa27bf0808d7fa80a50399c643516d"
-SRCREV_machine_qemumips ?= "63b4ca3223d9481baa77f527f50d906d15747141"
-SRCREV_machine_qemuppc ?= "e5dfe8f89b45effe445d04e0f9b391948eb108ae"
-SRCREV_machine_qemux86 ?= "41d5fe27dc3d3e769cb6af01770cac3d75a91e1a"
-SRCREV_machine_qemux86-64 ?= "96930820e0cb6d4b31d5e0c8f3174805f4a868b3"
-SRCREV_machine_qemumips64 ?= "103df748c6e83d5874a8385592f758feeb818324"
-SRCREV_machine ?= "96930820e0cb6d4b31d5e0c8f3174805f4a868b3"
-SRCREV_meta ?= "602be954ac45e8aea06cb93d6766bbf83c242090"
+SRCREV_machine_qemuarm ?= "e3cbee86dcbc6c9b23a7cf69fe579da77c3836d1"
+SRCREV_machine_qemumips ?= "431de4758042fab2d62269574bb4ec3a783b43a0"
+SRCREV_machine_qemuppc ?= "1fc7009c9c8de594d75090b188c11a6ddd0d369e"
+SRCREV_machine_qemux86 ?= "116dacb5cebba538bc70e8056ebfa81d7ca6c061"
+SRCREV_machine_qemux86-64 ?= "686b9ddf58ea6b533be70fe9f4a6407557b263d2"
+SRCREV_machine_qemumips64 ?= "966c54ceb8cb797eafe987f9a16d306735057b42"
+SRCREV_machine ?= "686b9ddf58ea6b533be70fe9f4a6407557b263d2"
+SRCREV_meta ?= "b2af4e3528e65583c98f3a08c6edb0cad7a120b0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
1.8.1.2


