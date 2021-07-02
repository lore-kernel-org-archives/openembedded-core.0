Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web09.11928.1625242832205213805
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jul 2021 09:20:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10033"; a="196043512"
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; 
   d="scan'208";a="196043512"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2021 09:20:34 -0700
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; 
   d="scan'208";a="626776478"
Received: from ypoh4-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.151.64])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2021 09:20:33 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 17/22] libgcrypt: upgrade 1.9.2 -> 1.9.3
Date: Sat,  3 Jul 2021 00:19:59 +0800
Message-Id: <8cb77273abd6985242cf45100b2fb732db74e909.1625242066.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1625242066.git.anuj.mittal@intel.com>
References: <cover.1625242066.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

License-Update: added terms for cipher/cipher-gcm-ppc.c, still under GPL

(From OE-Core rev: d28c1f67c447f99313890e68083da61adcc66f74 )

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../libgcrypt/{libgcrypt_1.9.2.bb => libgcrypt_1.9.3.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libgcrypt/{libgcrypt_1.9.2.bb => libgcrypt_1.9.3.bb} (93%)

diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.9.3.bb
similarity index 93%
rename from meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb
rename to meta/recipes-support/libgcrypt/libgcrypt_1.9.3.bb
index 34735ea5d7..fd3d8e09f2 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.9.3.bb
@@ -14,7 +14,7 @@ LICENSE_dumpsexp-dev = "GPLv3+"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff \
-                    file://LICENSES;md5=2dae15d91a37cfde72fe9eae75f8ea14 \
+                    file://LICENSES;md5=42fa35a25e138166cc40588387f9159d \
                     "
 
 DEPENDS = "libgpg-error"
@@ -27,7 +27,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch \
            file://0001-Makefile.am-add-a-missing-space.patch \
            "
-SRC_URI[sha256sum] = "b2c10d091513b271e47177274607b1ffba3d95b188bbfa8797f948aec9053c5a"
+SRC_URI[sha256sum] = "97ebe4f94e2f7e35b752194ce15a0f3c66324e0ff6af26659bbfb5ff2ec328fd"
 
 # Below whitelisted CVEs are disputed and not affecting crypto libraries for any distro.
 CVE_CHECK_WHITELIST += "CVE-2018-12433 CVE-2018-12438"
-- 
2.31.1

