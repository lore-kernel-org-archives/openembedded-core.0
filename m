Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4914E7BDAD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 03:39:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wBH3cieJ003581
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 16 Dec 2018 19:38:54 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Sun, 16 Dec 2018 19:38:33 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sun, 16 Dec 2018 22:38:14 -0500
Message-ID: <1c702b91ad47c577994453a693068d06af6e1999.1545017774.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1545017774.git.bruce.ashfield@windriver.com>
References: <cover.1545017774.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/17] linux-yocto/4.14: configuration cleanups
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
X-List-Received-Date: Mon, 17 Dec 2018 03:39:20 -0000
Content-Type: text/plain

Integrating the following configuration cleanups/tweaks:

 19c174f547e6 sound.cfg: enable SND_SOC_INTEL_SKYLAKE explicitly

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.14.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
index d6d37ed315d7..7e7911aea039 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "eafe398ca1404953c2a01559c83d3a983f8717b1"
-SRCREV_meta ?= "3435617380af107e31ec4e36173b9cf1f8a371a0"
+SRCREV_meta ?= "19c174f547e63ca9ce71ca9861bfada0a5a98fc3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
index d613ff05f7d5..df8510fadaa5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
@@ -13,7 +13,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "c5aca000e387da12ce375251c829f653503d32b4"
-SRCREV_meta ?= "3435617380af107e31ec4e36173b9cf1f8a371a0"
+SRCREV_meta ?= "19c174f547e63ca9ce71ca9861bfada0a5a98fc3"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.14.bb b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
index cb4a66b71149..e287868a442e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "2c5caa7e84311f2a0097974a697ac1f59030530e"
 SRCREV_machine_qemux86-64 ?= "2c5caa7e84311f2a0097974a697ac1f59030530e"
 SRCREV_machine_qemumips64 ?= "512b0a8df98e49746548444cc4c9543ef0c23369"
 SRCREV_machine ?= "2c5caa7e84311f2a0097974a697ac1f59030530e"
-SRCREV_meta ?= "3435617380af107e31ec4e36173b9cf1f8a371a0"
+SRCREV_meta ?= "19c174f547e63ca9ce71ca9861bfada0a5a98fc3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
-- 
2.5.0


