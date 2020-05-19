Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.6020.1589860675342367427
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2020 20:57:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: gAQp6tSOMfkhnV5BCElVF6jStZRLRGFLPOirdQ8ABOuaOSvP+Bqnf29jXPrZogZo11dPca9b8E
 +fK3OWKPaiQQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2020 20:57:54 -0700
IronPort-SDR: 06nm7+FyCMWzmu1YFXbcwamuiriCWUCzGiI1RzpzJNy/+Q1p/RRMLOnyLZlBTNT9SFDng4KvF9
 4u81WTt02y6A==
X-IronPort-AV: E=Sophos;i="5.73,408,1583222400"; 
   d="scan'208";a="267749380"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.165.26])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2020 20:57:48 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] gsettings-desktop-schemas: upgrade 3.36.0 -> 3.36.1
Date: Tue, 19 May 2020 11:57:25 +0800
Message-Id: <20200519035726.405506-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200519035726.405506-1-anuj.mittal@intel.com>
References: <20200519035726.405506-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...-schemas_3.36.0.bb => gsettings-desktop-schemas_3.36.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gsettings-desktop-schemas/{gsettings-desktop-schemas_3.36.0.bb => gsettings-desktop-schemas_3.36.1.bb} (80%)

diff --git a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.36.0.bb b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.36.1.bb
similarity index 80%
rename from meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.36.0.bb
rename to meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.36.1.bb
index a68175dc84..f54b242e73 100644
--- a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.36.0.bb
+++ b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.36.1.bb
@@ -13,6 +13,6 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gobject-introspection gettext upstream-version-is-even
 
-SRC_URI[archive.md5sum] = "697db9e6b2ae058f8a0d0b023e32ceac"
-SRC_URI[archive.sha256sum] = "764ab683286536324533a58d4e95fc57f81adaba7d880dd0ebbbced63e960ea6"
+SRC_URI[archive.md5sum] = "708ddd8dec388ebda5539667604197c3"
+SRC_URI[archive.sha256sum] = "004bdbe43cf8290f2de7d8537e14d8957610ca479a4fa368e34dbd03f03ec9d9"
 SRC_URI += "file://0001-Do-not-skip-gir-installation-for-cross-compiling.patch"
-- 
2.25.4

