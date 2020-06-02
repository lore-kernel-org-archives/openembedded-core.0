Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web10.9341.1591100780405283427
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 05:26:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: yni+3CieMc8Vpfb1fT/jOkIJWnT63a1XSvW2jtUZbo9Lvukf+lKwi5e3CQklz9OJq3pzPfLVyD
 ifqRmRjiU69A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2020 05:26:19 -0700
IronPort-SDR: li20fb+pv3pyRjcawoeWa9cs08anSwx9OJVSqXoPRIiTI1eRVLOqxVb7tfSDfHcM8ohba1YIGc
 ZGJ3zuXtUmeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,464,1583222400"; 
   d="scan'208";a="347385651"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by orsmga001.jf.intel.com with ESMTP; 02 Jun 2020 05:26:15 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] glib-networking: 2.64.2 -> 2.64.3
Date: Tue,  2 Jun 2020 20:26:14 +0800
Message-Id: <20200602122614.53886-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1

From: Lee Chee Yang <chee.yang.lee@intel.com>

update to 2.64.3 which include fix for CVE-2020-13645, see:
https://gitlab.gnome.org/GNOME/glib-networking/-/issues/135

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../{glib-networking_2.64.2.bb => glib-networking_2.64.3.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/glib-networking/{glib-networking_2.64.2.bb => glib-networking_2.64.3.bb} (88%)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.64.2.bb b/meta/recipes-core/glib-networking/glib-networking_2.64.3.bb
similarity index 88%
rename from meta/recipes-core/glib-networking/glib-networking_2.64.2.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.64.3.bb
index 8300d20e0c..a79e0e4988 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.64.2.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.64.3.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 DEPENDS = "glib-2.0"
 
-SRC_URI[archive.md5sum] = "7f8c7ffe2616be4ef4232f2574353dab"
-SRC_URI[archive.sha256sum] = "45def0715c551f9b0b41a4e4f730ac95f3d5d4f3de8162260fbf9421cff695a7"
+SRC_URI[archive.md5sum] = "eb382907ec941fe2fb1a9676b75acf7a"
+SRC_URI[archive.sha256sum] = "937a06b124052813bfc0b0b86bff42016ff01067582e1aca65bb6dbe0845a168"
 
 PACKAGECONFIG ??= "gnutls"
 
-- 
2.17.1

