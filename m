Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web11.7722.1614918147768864035
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 20:22:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: cTgzpHEi4JxblCf1/SKgBQ+QCuTMrFQTRbWfmgZY5/5d8kxiDXOQtzu63dnpHluUy/L7D5Qh5A
 RnYsiPZ83HHA==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="187670945"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="187670945"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:20 -0800
IronPort-SDR: lQM34vGEfmswDBdQzFFC6YMgSEbY0JKy1rxtp4JPCkqYXKO/QzwDEIewuw2qcu0LQFETmPtpnL
 2oifF6+pzuIA==
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="408128851"
Received: from selvan2x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.249])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:19 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 16/52] mtd-utils: Remove duplicate assignments to alternative link names
Date: Fri,  5 Mar 2021 12:20:52 +0800
Message-Id: <680942b5c1efde895fbcfad6d0f3464f65932f9c.1614917620.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614917620.git.anuj.mittal@intel.com>
References: <cover.1614917620.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thomas Viehweger <patchesThomas.Vie@web.de>

The two duplicate lines are not needed. The existence is confusing.

Signed-off-by: Thomas Viehweger <patchesThomas.Vie@web.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 36bdb4faa90dc18bc020481eba82ee570b968c39)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/mtd/mtd-utils_git.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index 8d6bbfca3f..ff42219513 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -42,11 +42,9 @@ ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE_${PN} = "flashcp flash_eraseall flash_lock flash_unlock nanddump nandwrite"
 ALTERNATIVE_${PN}-ubifs = "ubiattach ubidetach ubimkvol ubirename ubirmvol ubirsvol ubiupdatevol"
 
-ALTERNATIVE_LINK_NAME[flash_eraseall] = "${sbindir}/flash_eraseall"
 ALTERNATIVE_LINK_NAME[nandwrite] = "${sbindir}/nandwrite"
 ALTERNATIVE_LINK_NAME[nanddump] = "${sbindir}/nanddump"
 ALTERNATIVE_LINK_NAME[ubiattach] = "${sbindir}/ubiattach"
-ALTERNATIVE_LINK_NAME[ubiattach] = "${sbindir}/ubiattach"
 ALTERNATIVE_LINK_NAME[ubidetach] = "${sbindir}/ubidetach"
 ALTERNATIVE_LINK_NAME[ubimkvol] = "${sbindir}/ubimkvol"
 ALTERNATIVE_LINK_NAME[ubirename] = "${sbindir}/ubirename"
-- 
2.29.2

