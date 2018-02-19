Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D1B6C7856A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 15:53:57 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Feb 2018 07:53:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,535,1511856000"; d="scan'208";a="18774975"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga007.jf.intel.com with ESMTP; 19 Feb 2018 07:53:58 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 55DA5580382
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 07:53:58 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Feb 2018 17:56:33 +0200
Message-Id: <1519055794-21177-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 1/2] mmc-utils: Upgrade to latest revision
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
X-List-Received-Date: Mon, 19 Feb 2018 15:53:57 -0000

updates:

mmc-utils: manpage: fix arguments for TH macro
mmc-utils: remove unused #includes
mmc-utils: move offsetof from mmc.h to only user
mmc-utils: expand .gitignore
mmc-utils: make use of dependency information
mmc-utils: drop unused header
mmc-utils: drop macro CHECK

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-devtools/mmc/mmc-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index efaabc1..8977a87 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=20;md5=fae32792e20f4d27ade1c5a762d16b7d"
 
 SRCBRANCH ?= "master"
-SRCREV = "37c86e60c0442fef570b75cd81aeb1db4d0cbafd"
+SRCREV = "7bcad171173fd9a9401e7ce81906605bd6f4eddc"
 
 PV = "0.1"
 
-- 
2.4.0


