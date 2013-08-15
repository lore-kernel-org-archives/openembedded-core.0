Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id 2FEED61037
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 14:41:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r7FEfN4b020217
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 15 Aug 2013 10:41:24 -0400 (EDT)
Received: from yow-bashfiel-d3.corp.ad.wrs.com (128.224.130.143) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Thu, 15 Aug 2013 07:41:23 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 15 Aug 2013 10:41:13 -0400
Message-ID: <4b9c08456c5e52d739598fe90b136bd1ae0aac59.1376577495.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1376577495.git.bruce.ashfield@windriver.com>
References: <cover.1376577495.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] linux-yocto-3.8/meta: enable ALTIVEC for qemuppc
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
X-List-Received-Date: Thu, 15 Aug 2013 14:41:28 -0000
Content-Type: text/plain

As part of the qemuppc tuning activities, we are aligning on ppc74xx, and
as a result we can enable ALTIVEC support in the base BSP config.

[YOCTO #1914]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb   |    2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.8.bb      |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
index 47e76d4..647ace6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
@@ -10,7 +10,7 @@ KMETA = "meta"
 
 SRCREV_machine ?= "4fb187301ca153d496b2a96293dffde34d3b1a56"
 SRCREV_machine_qemuppc ?= "547c4ea570933ab7ece9f10d2c46875b460cd337"
-SRCREV_meta ?= "f706bd410c80a20ff437a53bb3f9f076ba31a17e"
+SRCREV_meta ?= "e7f42a416a60499db3771181357b29b3b3c424cc"
 
 PR = "${INC_PR}.1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb
index 04cf22b..06d6b12 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb
@@ -13,7 +13,7 @@ LINUX_VERSION ?= "3.8.13"
 KMETA = "meta"
 
 SRCREV_machine ?= "f20047520a57322f05d95a18a5fbd082fb15cb87"
-SRCREV_meta ?= "f706bd410c80a20ff437a53bb3f9f076ba31a17e"
+SRCREV_meta ?= "e7f42a416a60499db3771181357b29b3b3c424cc"
 
 PR = "${INC_PR}.1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.8.bb b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
index d47d3b7..790e3e3 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
@@ -10,7 +10,7 @@ SRCREV_machine_qemuppc ?= "698eada61d9385b42dd117858b943655b565084b"
 SRCREV_machine_qemux86 ?= "f20047520a57322f05d95a18a5fbd082fb15cb87"
 SRCREV_machine_qemux86-64 ?= "f20047520a57322f05d95a18a5fbd082fb15cb87"
 SRCREV_machine ?= "f20047520a57322f05d95a18a5fbd082fb15cb87"
-SRCREV_meta ?= "f706bd410c80a20ff437a53bb3f9f076ba31a17e"
+SRCREV_meta ?= "e7f42a416a60499db3771181357b29b3b3c424cc"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.8.git;protocol=git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
1.7.10.4


