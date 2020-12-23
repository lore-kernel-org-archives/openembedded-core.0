Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.10233.1608736733177759099
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 07:19:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 3RewA8jzhnLV3xn/6MGWfOrkpwZ8+OIgD1wKkxeHqPPZ0Dd3lSRDaZ3OOVK08hBpsVDxlQJTU5
 LYTgnvRA62DA==
X-IronPort-AV: E=McAfee;i="6000,8403,9843"; a="155236100"
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="155236100"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:24 -0800
IronPort-SDR: 3WoP4fh2YwchWesr7C7nLdVBXYINSSlRjyMG20pG0Hyc0t9a1JIjrbc0f114bYPSdg3ivOq4Zn
 3dfdCs1Jrs0w==
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="374027640"
Received: from btang1-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.75.173])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:23 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 23/35] man-db: Avoid reproducibility failures after fixing groff-native
Date: Wed, 23 Dec 2020 23:18:33 +0800
Message-Id: <d0a09d4970050a2e0c16b0cea058b3e1e63c780c.1608735614.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1608735614.git.anuj.mittal@intel.com>
References: <cover.1608735614.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Add some temporary bumps to versions to change the output hash so we
really can take advantage of the groff-native reproducibility fix.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit af9bd5a03ecf45e92868bc49b1de5c27d94eff6f)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-extended/man-db/man-db_2.9.3.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-extended/man-db/man-db_2.9.3.bb b/meta/recipes-extended/man-db/man-db_2.9.3.bb
index 0e6016a73c..a28f77b750 100644
--- a/meta/recipes-extended/man-db/man-db_2.9.3.bb
+++ b/meta/recipes-extended/man-db/man-db_2.9.3.bb
@@ -20,6 +20,11 @@ inherit gettext pkgconfig autotools systemd
 EXTRA_OECONF = "--with-pager=less --with-systemdsystemunitdir=${systemd_unitdir}/system"
 EXTRA_AUTORECONF += "-I ${S}/gl/m4"
 
+# Can be dropped when the output next changes, avoids failures after
+# reproducibility issues
+PR = "r1"
+HASHEQUIV_HASH_VERSION .= ".1"
+
 do_install() {
 	autotools_do_install
 
-- 
2.29.2

