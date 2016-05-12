Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id F39BD6FFC7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 13:16:46 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 May 2016 06:16:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,610,1455004800"; d="scan'208";a="951784868"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 12 May 2016 06:16:41 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 50CFF6A4007
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 07:04:12 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 May 2016 16:16:53 +0300
Message-Id: <1463059013-4222-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1463059013-4222-1-git-send-email-maxin.john@intel.com>
References: <1463059013-4222-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 3/3] mmc-utils: update to latest git version
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
X-List-Received-Date: Thu, 12 May 2016 13:16:47 -0000

LIC_FILES_CHKSUM has changed due to modifications related to
field firmware update support. However, License remains the same.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-devtools/mmc/mmc-utils_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index 64b8910..0a8da19 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -1,10 +1,10 @@
 SUMMARY = "Userspace tools for MMC/SD devices"
 HOMEPAGE = "http://git.kernel.org/cgit/linux/kernel/git/cjb/mmc-utils.git/"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=17;md5=d7747fc87f1eb22b946ef819969503f0"
+LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=20;md5=fae32792e20f4d27ade1c5a762d16b7d"
 
 SRCBRANCH ?= "master"
-SRCREV = "44f94b925894577f9ffcf2c418dd013a5e582648"
+SRCREV = "bb779acfc385d135b32a6998c1d1fceef0491400"
 
 PV = "0.1"
 
-- 
2.4.0


