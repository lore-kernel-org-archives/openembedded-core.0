Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5643C74242
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 22:17:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8OMHucC016077
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 24 Sep 2015 15:17:56 -0700 (PDT)
Received: from yow-bashfiel-d4.corp.ad.wrs.com (147.11.116.147) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Thu, 24 Sep 2015 15:17:56 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 24 Sep 2015 18:17:54 -0400
Message-ID: <8ff7cb2aad70e8c4c5ee970ba34cb35b0fef901a.1443132765.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1443132765.git.bruce.ashfield@windriver.com>
References: <cover.1443132765.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] linux-yocto/4.1: rt update to 4.1.x-rt8
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
X-List-Received-Date: Thu, 24 Sep 2015 22:17:58 -0000
Content-Type: text/plain

The -rt build suffered the same breakage in master as the standard
kernel builds: due to a bad git history merge, existing patches were
dropped from branches.

This meant that we were missing the -rt changes, which re-introduced
some failures with linux-yocto-rt.

With these SRCREV updates, we have the latest 4.1.x-rt and all
architectures build.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   | 4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 0d9ecf50cc19..352ac3ddfa72 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -2,8 +2,8 @@ KBRANCH ?= "standard/preempt-rt"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "79a31b9d23db126f8a6be3eb88fd683056a213f1"
-SRCREV_meta ?= "5ecf2a70fee383f13388a97086c4a8766fc9cbcc"
+SRCREV_machine ?= "eefb205d7ff4afc66a95fd06d31d4e69c3deec39"
+SRCREV_meta ?= "d6b2416f396f03e73c1d53352ebd0acb6133e5ba"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 69aac25e74bb..833b11b010af 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "79a31b9d23db126f8a6be3eb88fd683056a213f1"
-SRCREV_meta ?= "5ecf2a70fee383f13388a97086c4a8766fc9cbcc"
+SRCREV_meta ?= "d6b2416f396f03e73c1d53352ebd0acb6133e5ba"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 0d8d28136736..0645134b023b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "79a31b9d23db126f8a6be3eb88fd683056a213f1"
 SRCREV_machine_qemux86-64 ?= "79a31b9d23db126f8a6be3eb88fd683056a213f1"
 SRCREV_machine_qemumips64 ?= "049105492e5657dd735bad1aa3a32f4f752a9edd"
 SRCREV_machine ?= "79a31b9d23db126f8a6be3eb88fd683056a213f1"
-SRCREV_meta ?= "5ecf2a70fee383f13388a97086c4a8766fc9cbcc"
+SRCREV_meta ?= "d6b2416f396f03e73c1d53352ebd0acb6133e5ba"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
-- 
2.1.0


