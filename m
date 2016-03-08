Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 14A3D7326D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Mar 2016 04:34:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u284Y5V6017009
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 7 Mar 2016 20:34:05 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 7 Mar 2016 20:34:04 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 7 Mar 2016 23:33:59 -0500
Message-ID: <118158a1d36a3a6c40ca15a0977c72780a551dae.1457411284.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1457411284.git.bruce.ashfield@windriver.com>
References: <cover.1457411284.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] linux-yocto/4.4: explicitly enable ftrace in tracing fragment
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
X-List-Received-Date: Tue, 08 Mar 2016 04:34:06 -0000
Content-Type: text/plain

The recent split/factoring between production and development
kernel configurations, EXPERT, EMBEDDED and DEBUG_KERNEL are no longer
selected for all kernel types. This means that ftrace is no longer
selected by default in in standard BSPs, causing breakage in things
that relied on it.

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index d24c119973d7..eeca178f616f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -3,7 +3,7 @@ KBRANCH ?= "standard/preempt-rt"
 require recipes-kernel/linux/linux-yocto.inc
 
 SRCREV_machine ?= "19e3ed348aefd0802dc8747cc143bea1155edc12"
-SRCREV_meta ?= "da47accec6c17c22cecf064be1da29b5bf3d7583"
+SRCREV_meta ?= "89419d8b902aa81cb4c52f9dd12a6c9e083ce198"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index c31f637155b2..b14eeaf1980b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "dadb4369046246d7788db1f3cdf0a34298e35b4b"
-SRCREV_meta ?= "da47accec6c17c22cecf064be1da29b5bf3d7583"
+SRCREV_meta ?= "89419d8b902aa81cb4c52f9dd12a6c9e083ce198"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index ba39bb48dbf5..d9138688eda6 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "dadb4369046246d7788db1f3cdf0a34298e35b4b"
 SRCREV_machine_qemux86-64 ?= "dadb4369046246d7788db1f3cdf0a34298e35b4b"
 SRCREV_machine_qemumips64 ?= "79b496614c5d0b4862796928ef9890f2eb375a3b"
 SRCREV_machine ?= "dadb4369046246d7788db1f3cdf0a34298e35b4b"
-SRCREV_meta ?= "da47accec6c17c22cecf064be1da29b5bf3d7583"
+SRCREV_meta ?= "89419d8b902aa81cb4c52f9dd12a6c9e083ce198"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
-- 
2.5.0


