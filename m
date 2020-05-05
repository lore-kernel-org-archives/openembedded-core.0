Received: from mga18.intel.com (mga18.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.3143.1588661927892415054
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 23:58:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: Npgo3ZAEzGElagyxUquPDJfritKorklBgplc8lK8aTHCrCLpFZJLeQqmVnAe7wvHWCGxbACF0g
 iphnQ0J1MkfA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2020 23:58:51 -0700
IronPort-SDR: VoUcrICZ7t2FoQS4eEY7Mwc5Mf6zS00Bsk/jSYN4+UJ7OYcCtFuTWA+EvVYbioOhUjSCEteGAf
 4kaNK681N22g==
X-IronPort-AV: E=Sophos;i="5.73,354,1583222400"; 
   d="scan'208";a="284144908"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.72.16])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2020 23:58:47 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][zeus 18/18] openssl: upgrade 1.1.1f -> 1.1.1g
Date: Tue,  5 May 2020 14:56:53 +0800
Message-Id: <26b13f59385c1ed871aee7653c3ee7241affca38.1588661196.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1588661196.git.anuj.mittal@intel.com>
References: <cover.1588661196.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jan Luebbe <jlu@pengutronix.de>

This also fixes CVE-2020-1967.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../openssl/{openssl_1.1.1f.bb => openssl_1.1.1g.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1f.bb => openssl_1.1.1g.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1f.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1f.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
index aa4ef6f48a..c514fcd82a 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1f.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
@@ -23,7 +23,7 @@ SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "186c6bfe6ecfba7a5b48c47f8a1673d0f3b0e5ba2e25602dd23b629975da3f35"
+SRC_URI[sha256sum] = "ddb04774f1e32f0c49751e21b67216ac87852ceb056b75209af2443400636d46"
 
 inherit lib_package multilib_header multilib_script ptest
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.25.4

