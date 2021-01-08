Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.3706.1610079500392423505
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 20:18:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 4Bw8pe+uKmz/LVHmM3aPZXlm13UcW0gjHn5KC8TnZjcTSzU4K3/a9gu+9jYVCAQpQH5vi2GgK0
 7A8yr9qyTHkQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="164613627"
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="164613627"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 20:18:21 -0800
IronPort-SDR: d2QMBvOh0fwvrSwwzsXdO6tlKHTA3GH/z5jocT6LuHirvtDk39hGnufOIgG/nbnxtS7x5c6sFz
 vAAgfUD4/yRw==
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="362209341"
Received: from nshamsan-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.135.192])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 20:18:20 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 02/30] openssl: Update to 1.1.1i
Date: Fri,  8 Jan 2021 12:17:44 +0800
Message-Id: <ee8e0c07a5677f7d67f0c7c47db8fc8ccc9f6a34.1610079279.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1610079278.git.anuj.mittal@intel.com>
References: <cover.1610079278.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Robert Joslyn <robert.joslyn@redrectangle.org>

This fixes a NULL pointer dereference in GENERAL_NAME_cmp function.

CVE: CVE-2020-1971

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../openssl/{openssl_1.1.1g.bb => openssl_1.1.1i.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1g.bb => openssl_1.1.1i.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
index 815955837b..c2db596f03 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
@@ -23,7 +23,7 @@ SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "ddb04774f1e32f0c49751e21b67216ac87852ceb056b75209af2443400636d46"
+SRC_URI[sha256sum] = "e8be6a35fe41d10603c3cc635e93289ed00bf34b79671a3a4de64fcee00d5242"
 
 inherit lib_package multilib_header multilib_script ptest
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.29.2

