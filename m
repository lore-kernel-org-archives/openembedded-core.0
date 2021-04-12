Received: from mga06.intel.com (mga06.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.29432.1618218515903981471
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Apr 2021 02:08:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: jxjiTCXXb8eAQuUZ6AtvkzwSbGBB34P0x8PdWXeb3QKlJRlm78MK1HP4vr3AUbrUtYEkyqIprg
 KuzyMfIW9lFw==
X-IronPort-AV: E=McAfee;i="6000,8403,9951"; a="255467878"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="255467878"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 02:08:40 -0700
IronPort-SDR: cO3VjMu8k9TLePzBvUbntnOC7hMjaWubfImlMFalprhy/a3acDkcrpIFSFFd1I1QeslUcgTFu8
 frukDynXQfYA==
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="531809058"
Received: from pchuang-mobl3.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.174.143])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 02:08:39 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 04/18] openssl: update to 1.1.1k to fix CVE-2021-3450 and CVE-2021-3449
Date: Mon, 12 Apr 2021 17:08:12 +0800
Message-Id: <087c5a6699dfffef69a0dbabeade8b78c7662c97.1618210563.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1618210563.git.anuj.mittal@intel.com>
References: <cover.1618210563.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mikko Rapeli <mikko.rapeli@bmw.de>

Only security issues fixed in this release according to
https://www.openssl.org/news/cl111.txt

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../openssl/{openssl_1.1.1j.bb => openssl_1.1.1k.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1j.bb => openssl_1.1.1k.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1j.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1j.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1k.bb
index f054d2fdba..5f281197c9 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1j.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb
@@ -23,7 +23,7 @@ SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "aaf2fcb575cdf6491b98ab4829abf78a3dec8402b8b81efc8f23c00d443981bf"
+SRC_URI[sha256sum] = "892a0875b9872acd04a9fde79b1f943075d5ea162415de3047c327df33fbaee5"
 
 inherit lib_package multilib_header multilib_script ptest
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.30.2

