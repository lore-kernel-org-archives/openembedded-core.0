Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.3193.1588661906694787605
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 23:58:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: zPSoJ7/pRCLHBZKX/I5bMYovG3qgBsXwruisERUH65GSiNiDV0IBSsc0OpU9IWt9I66eBQBvu3
 WrF+kIvaBX0A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2020 23:58:40 -0700
IronPort-SDR: saQpb3OBaV/Gcvo2rIDJ4RoobZe1oR+WS2C2ITrTPKWPM68T/4XalzOzMLcG0JwvdwFHzNWUBp
 N+8ZJWvxLeww==
X-IronPort-AV: E=Sophos;i="5.73,354,1583222400"; 
   d="scan'208";a="284144853"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.72.16])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2020 23:58:38 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][zeus 16/18] gnutls: upgrade 3.6.12 -> 3.6.13
Date: Tue,  5 May 2020 14:56:51 +0800
Message-Id: <7e51108dc8d3fbb63b7da9728a3790c587ee36f8.1588661196.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1588661196.git.anuj.mittal@intel.com>
References: <cover.1588661196.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wang Mingyu <wangmy@cn.fujitsu.com>

(From OE-Core rev: 5cc0f0dcf1f41bc148b034b3f7abef756a328cd3)

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[ includes the fix for CVE-2020-11501 ]
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../gnutls/{gnutls_3.6.12.bb => gnutls_3.6.13.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls_3.6.12.bb => gnutls_3.6.13.bb} (93%)

diff --git a/meta/recipes-support/gnutls/gnutls_3.6.12.bb b/meta/recipes-support/gnutls/gnutls_3.6.13.bb
similarity index 93%
rename from meta/recipes-support/gnutls/gnutls_3.6.12.bb
rename to meta/recipes-support/gnutls/gnutls_3.6.13.bb
index f1eeebc807..f56d42a613 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.12.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.13.bb
@@ -21,8 +21,8 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://arm_eabi.patch \
 "
 
-SRC_URI[md5sum] = "a23900f14980a467bdce3a0fd31dfa18"
-SRC_URI[sha256sum] = "bfacf16e342949ffd977a9232556092c47164bd26e166736cf3459a870506c4b"
+SRC_URI[md5sum] = "bb1fe696a11543433785b4fc70ca225f"
+SRC_URI[sha256sum] = "32041df447d9f4644570cf573c9f60358e865637d69b7e59d1159b7240b52f38"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc
 
-- 
2.25.4

