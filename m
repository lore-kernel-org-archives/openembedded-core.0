Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web09.10330.1608035163781072402
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Dec 2020 04:26:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: khairul.rohaizzat.jamaluddin@intel.com)
IronPort-SDR: D9GGL5n4GLINK3HbdymgGZmOHLxw+cOlOBJitEKofoIFwdZo/0ZeZXw+Hc7t2K/iCsC5c0cyWY
 ltd7s3Vw39gA==
X-IronPort-AV: E=McAfee;i="6000,8403,9835"; a="154099646"
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; 
   d="scan'208";a="154099646"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2020 04:26:02 -0800
IronPort-SDR: Q4MGBH57AeI32CoRzeLjK5j9Nb95ro+UnMvd0blQNYocT2lRvNDvlQZApA9nP2lxbASl+lA7F6
 GgTADBGLlNUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; 
   d="scan'208";a="556685417"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by orsmga005.jf.intel.com with ESMTP; 15 Dec 2020 04:26:01 -0800
From: "Jamaluddin, Khairul Rohaizzat" <khairul.rohaizzat.jamaluddin@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] openssl: Update 1.1.1h -> 1.1.1i
Date: Tue, 15 Dec 2020 20:26:01 +0800
Message-Id: <1608035161-62317-1-git-send-email-khairul.rohaizzat.jamaluddin@intel.com>
X-Mailer: git-send-email 2.7.4

From: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>

update version to 1.1.1i

openssl 1.1.1i Fixed NULL pointer deref in GENERAL_NAME_cmp (CVE-2020-1971)

updates include fix for CVE:
CVE-2020-1971

Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
---
 .../openssl/{openssl_1.1.1h.bb => openssl_1.1.1i.bb}                    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1h.bb => openssl_1.1.1i.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1h.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
index 1827167..52dbdf5 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
@@ -23,7 +23,7 @@ SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "5c9ca8774bd7b03e5784f26ae9e9e6d749c9da2438545077e6b3d755a06595d9"
+SRC_URI[sha256sum] = "e8be6a35fe41d10603c3cc635e93289ed00bf34b79671a3a4de64fcee00d5242"
 
 inherit lib_package multilib_header multilib_script ptest
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.7.4

