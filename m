Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.6020.1589860675342367427
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2020 20:57:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: NgZHnBglZc5uW5vkZyTtbL13BA1HSaXxWwmpGb9Fz6nCy+OomI+doHv2YoSma6BSepMq4XQtqh
 wXfZQc1rcLHQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2020 20:57:57 -0700
IronPort-SDR: 5em35QD5WNQly6KQ5M1BG03iwEvI0xr480jFlbMR4be+zse/9C4SScW7yvYE1R6Iv3bucmfbJ/
 u+MxtUNywNbA==
X-IronPort-AV: E=Sophos;i="5.73,408,1583222400"; 
   d="scan'208";a="267749407"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.165.26])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2020 20:57:55 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] libsoup-2.4: upgrade 2.68.4 -> 2.70.0
Date: Tue, 19 May 2020 11:57:26 +0800
Message-Id: <20200519035726.405506-3-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200519035726.405506-1-anuj.mittal@intel.com>
References: <20200519035726.405506-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../libsoup/{libsoup-2.4_2.68.4.bb => libsoup-2.4_2.70.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.68.4.bb => libsoup-2.4_2.70.0.bb} (91%)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.68.4.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.70.0.bb
similarity index 91%
rename from meta/recipes-support/libsoup/libsoup-2.4_2.68.4.bb
rename to meta/recipes-support/libsoup/libsoup-2.4_2.70.0.bb
index 6731b3373e..d10db7940a 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.68.4.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.70.0.bb
@@ -10,8 +10,8 @@ DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 intltool-native libpsl"
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
-SRC_URI[md5sum] = "603f3a945cd6ecc1fda644d7853b3b81"
-SRC_URI[sha256sum] = "2d50b12922cc516ab6a7c35844d42f9c8a331668bbdf139232743d82582b3294"
+SRC_URI[md5sum] = "c539f5b5ab534f024dc4e6a14e6d3f54"
+SRC_URI[sha256sum] = "54b020f74aefa438918d8e53cff62e2b1e59efe2de53e06b19a4b07b1f4d5342"
 
 CVE_PRODUCT = "libsoup"
 
-- 
2.25.4

