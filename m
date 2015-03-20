Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E31336013D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2015 17:06:09 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 20 Mar 2015 10:05:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,437,1422950400"; d="scan'208";a="668237841"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 20 Mar 2015 10:05:19 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 5EDF76A408F;
	Fri, 20 Mar 2015 10:05:00 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Mar 2015 19:05:01 +0200
Message-Id: <1426871101-25001-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] linux-yocto-tiny: Enable CONFIG_BINFMT_SCRIPT
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
X-List-Received-Date: Fri, 20 Mar 2015 17:06:12 -0000

This SRCREV update fixes the failure of running /init
for poky-tiny image.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
index f6b95a2..fd0fa26 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
@@ -10,7 +10,7 @@ KMETA = "meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "3bab81113682d3a5ffc8ea60cf770beed4831492"
-SRCREV_meta ?= "6eddbf47875ef48ddc5864957a7b63363100782b"
+SRCREV_meta ?= "4c54da246369a9da73f8b4571ea7c9e61faa4d69"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
index d10449a..c05af4a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
@@ -10,7 +10,7 @@ KMETA = "meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "43b9eced9ba8a57add36af07736344dcc383f711"
-SRCREV_meta ?= "f7a81274b461d0c748964d75c24bea8574d350fb"
+SRCREV_meta ?= "76bc151242d7f97f7eebc7591f83801cf07dc9af"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.1.4


