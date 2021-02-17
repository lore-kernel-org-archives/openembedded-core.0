Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web08.4079.1613541138089704826
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 21:52:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: thbO980TtBdh7Y+9QYTDUFfVxYQyrf7UAAzQiId/zVM19BpGW7bKAunw9EjNFhLr+cd96xcE1L
 D3qy6iao71tg==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="162247053"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="162247053"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:52:17 -0800
IronPort-SDR: FYItxJgi2302bzDP6f4XOI83HpVGfn2FbrSpPPH28mG1u39IGPyqJIwe/Mkod4aowecoUhnTZy
 v3Y4A94lLRUg==
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="399825385"
Received: from rjangidx-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.185.188])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:52:16 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/27] glib-2.0: upgrade 2.66.4 -> 2.66.7
Date: Wed, 17 Feb 2021 13:51:45 +0800
Message-Id: <20210217055210.22019-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210217055210.22019-1-anuj.mittal@intel.com>
References: <20210217055210.22019-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../glib-2.0/{glib-2.0_2.66.4.bb => glib-2.0_2.66.7.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.66.4.bb => glib-2.0_2.66.7.bb} (96%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.66.4.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
similarity index 96%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.66.4.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
index 5e1c0f2d33..15e9dbaf6f 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.66.4.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
@@ -22,7 +22,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
 
 SRC_URI_append_class-native = " file://relocate-modules.patch"
 
-SRC_URI[sha256sum] = "97df8670e32f9fd4f7392b0980e661dd625012015d58350da1e58e343f4af984"
+SRC_URI[sha256sum] = "09f158769f6f26b31074e15b1ac80ec39b13b53102dfae66cfe826fb2cc65502"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.29.2

