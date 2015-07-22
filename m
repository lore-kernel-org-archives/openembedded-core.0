Return-Path: <amarnath.valluri@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 10E5775791
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jul 2015 07:54:50 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 22 Jul 2015 00:54:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,522,1432623600"; d="scan'208";a="528153440"
Received: from theory.fi.intel.com ([10.237.72.51])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Jul 2015 00:54:49 -0700
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jul 2015 10:55:43 +0300
Message-Id: <1437551743-15104-1-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][PATCH] cronie: Upgrade v1.4.12 to v1.5.0
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
X-List-Received-Date: Wed, 22 Jul 2015 07:54:54 -0000

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 meta/recipes-extended/cronie/{cronie_1.4.12.bb => cronie_1.5.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/cronie/{cronie_1.4.12.bb => cronie_1.5.0.bb} (95%)

diff --git a/meta/recipes-extended/cronie/cronie_1.4.12.bb b/meta/recipes-extended/cronie/cronie_1.5.0.bb
similarity index 95%
rename from meta/recipes-extended/cronie/cronie_1.4.12.bb
rename to meta/recipes-extended/cronie/cronie_1.5.0.bb
index 977332b..38bd593 100644
--- a/meta/recipes-extended/cronie/cronie_1.4.12.bb
+++ b/meta/recipes-extended/cronie/cronie_1.5.0.bb
@@ -23,8 +23,8 @@ SRC_URI = "https://fedorahosted.org/releases/c/r/cronie/cronie-${PV}.tar.gz \
 PAM_SRC_URI = "file://crond_pam_config.patch"
 PAM_DEPS = "libpam libpam-runtime pam-plugin-access pam-plugin-loginuid"
 
-SRC_URI[md5sum] = "199db91e514a4d75e3222d69874b132f"
-SRC_URI[sha256sum] = "0f5c9bf32f352599451c4ca0d6bc076d19e73ecfa5a90b34ecfe47c918c8bafd"
+SRC_URI[md5sum] = "9db75e1884d83a45e002d145c6c54d45"
+SRC_URI[sha256sum] = "9cf0e3f4f5042a9c09413d62c8e0c055e12401f70b112465f0f81f2c84ebfb3f"
 
 inherit autotools update-rc.d useradd systemd
 
-- 
2.1.4

---------------------------------------------------------------------
Intel Finland Oy
Registered Address: PL 281, 00181 Helsinki 
Business Identity Code: 0357606 - 4 
Domiciled in Helsinki 

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


