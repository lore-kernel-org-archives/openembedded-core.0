Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 33BCE60125
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 15:09:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2NF98k0008282
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 23 Mar 2016 08:09:08 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 23 Mar 2016 08:09:08 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 23 Mar 2016 11:09:00 -0400
Message-ID: <3193f6e650617a0f86616af378d80da67439fa54.1458745322.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1458745322.git.bruce.ashfield@windriver.com>
References: <cover.1458745322.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] linux-yocto: ktypes/standard: Add tmpfs-posix-acl feature
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
X-List-Received-Date: Wed, 23 Mar 2016 15:09:10 -0000
Content-Type: text/plain

This enables the CONFIG_TMPFS_POSIX_ACL, which is wanted by things like
systemd. We also explicitly enable the features's dependencies and
options selected by the feature for clarity.

[YOCTO #9269]

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index 2faad1d5749e..2a41420d853e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -3,7 +3,7 @@ KBRANCH ?= "standard/preempt-rt"
 require recipes-kernel/linux/linux-yocto.inc
 
 SRCREV_machine ?= "dfa88200087a7ef73741383c05c14ff2f3978947"
-SRCREV_meta ?= "ce5b35bc76bb65d93d0897535c088f51dae4048b"
+SRCREV_meta ?= "32e84686fc87413612e108cc4ab0e7a0d21cb4fd"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 8a6e921647f5..7f1b655fd5f3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "3d2455f9da30f923c6bd69014fad4cc4ea738be6"
-SRCREV_meta ?= "ce5b35bc76bb65d93d0897535c088f51dae4048b"
+SRCREV_meta ?= "32e84686fc87413612e108cc4ab0e7a0d21cb4fd"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index d410b7c1040d..5ab4da6d0106 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "3d2455f9da30f923c6bd69014fad4cc4ea738be6"
 SRCREV_machine_qemux86-64 ?= "3d2455f9da30f923c6bd69014fad4cc4ea738be6"
 SRCREV_machine_qemumips64 ?= "8b25338045fdb88a9cdff808003102643f03083e"
 SRCREV_machine ?= "3d2455f9da30f923c6bd69014fad4cc4ea738be6"
-SRCREV_meta ?= "ce5b35bc76bb65d93d0897535c088f51dae4048b"
+SRCREV_meta ?= "32e84686fc87413612e108cc4ab0e7a0d21cb4fd"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
-- 
2.5.0


