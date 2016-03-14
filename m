Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A8E846FFA4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 07:15:47 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 14 Mar 2016 00:15:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,334,1455004800"; d="scan'208";a="923424793"
Received: from rebeccas-ilbpg3.png.intel.com ([10.88.227.80])
	by fmsmga001.fm.intel.com with ESMTP; 14 Mar 2016 00:15:46 -0700
From: Rebecca Chang <rebecca.swee.fun.chang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Mar 2016 15:15:41 +0800
Message-Id: <1457939741-29071-1-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 1.9.1
Cc: Rebecca Chang <rebecca.swee.fun.chang@intel.com>
Subject: [master][PATCH] rpm: enable xz/lzma compression
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
X-List-Received-Date: Mon, 14 Mar 2016 07:15:47 -0000

From: Anuj Mittal <anujx.mittal@intel.com>

Enable lzma compression support in rpm.

[YOCTO #9246]

Signed-off-by: Anuj Mittal <anujx.mittal@intel.com>
Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
---
 meta/recipes-devtools/rpm/rpm_5.4.16.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4.16.bb b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
index 5fea53f..44ccc70 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.16.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
@@ -238,7 +238,7 @@ RPM_SELF_SIGN_ALGO ?= "DSA"
 
 # Note: perl and sqlite w/o db specified does not currently work.
 #       tcl, augeas, nss, gcrypt, xar and keyutils support is untested.
-PACKAGECONFIG ??= "db bzip2 zlib popt openssl libelf python"
+PACKAGECONFIG ??= "db bzip2 zlib popt openssl libelf python xz"
 
 # Note: switching to internal popt may not work, as it will generate
 # a shared library which will intentionally not be packaged.
-- 
1.9.1


