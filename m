Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D8A986D6C3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2013 05:56:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rA45uT4I014861
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 3 Nov 2013 21:56:29 -0800 (PST)
Received: from yow-bashfiel-d3.corp.ad.wrs.com (128.224.130.89) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Sun, 3 Nov 2013 21:56:29 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 4 Nov 2013 00:56:25 -0500
Message-ID: <c0f533c45bcceba86994590704218035da7ea0d1.1383544482.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1383544482.git.bruce.ashfield@windriver.com>
References: <cover.1383544482.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] linux-yocto/3.8: add crystalforest bsp legacy block drivers configurations
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

Updating the meta SRCREV to include the latest crystalforest configuration
updates.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_3.8.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
index 9706948..4d59b16 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
@@ -10,7 +10,7 @@ KMETA = "meta"
 
 SRCREV_machine ?= "4fb187301ca153d496b2a96293dffde34d3b1a56"
 SRCREV_machine_qemuppc ?= "547c4ea570933ab7ece9f10d2c46875b460cd337"
-SRCREV_meta ?= "cb96851e7e559f9247d616d08406db6135c357cb"
+SRCREV_meta ?= "19e686b473ebf018c56c9eb839f5fbd88ecd9a5a"
 
 PR = "${INC_PR}.1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb
index 41b9f9f..4f34691 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb
@@ -13,7 +13,7 @@ LINUX_VERSION ?= "3.8.13"
 KMETA = "meta"
 
 SRCREV_machine ?= "f20047520a57322f05d95a18a5fbd082fb15cb87"
-SRCREV_meta ?= "cb96851e7e559f9247d616d08406db6135c357cb"
+SRCREV_meta ?= "19e686b473ebf018c56c9eb839f5fbd88ecd9a5a"
 
 PR = "${INC_PR}.1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.8.bb b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
index 6f34480..20fce1b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
@@ -10,7 +10,7 @@ SRCREV_machine_qemuppc ?= "698eada61d9385b42dd117858b943655b565084b"
 SRCREV_machine_qemux86 ?= "f20047520a57322f05d95a18a5fbd082fb15cb87"
 SRCREV_machine_qemux86-64 ?= "f20047520a57322f05d95a18a5fbd082fb15cb87"
 SRCREV_machine ?= "f20047520a57322f05d95a18a5fbd082fb15cb87"
-SRCREV_meta ?= "cb96851e7e559f9247d616d08406db6135c357cb"
+SRCREV_meta ?= "19e686b473ebf018c56c9eb839f5fbd88ecd9a5a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.8.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
1.8.1.2


