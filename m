Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.24792.1611128477823315504
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 23:41:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: bLJG7zE36XWT5andEx2HITXS5J7v3Ip4Bh9Pb3e0GpyBQLy7XTEWisuHvvKAZtDNtxzjWoaK9E
 rnDk8A8NhjMg==
X-IronPort-AV: E=McAfee;i="6000,8403,9869"; a="158240460"
X-IronPort-AV: E=Sophos;i="5.79,360,1602572400"; 
   d="scan'208";a="158240460"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2021 23:41:22 -0800
IronPort-SDR: eGfpkjts4huIC4OgEkGTqLKMyGC43zstHwKn/ReE01teYz/suQGDEF8FymQfDFG0j9mg4ISwxg
 0LZMAIc5nXIw==
X-IronPort-AV: E=Sophos;i="5.79,360,1602572400"; 
   d="scan'208";a="350958516"
Received: from mrengasa-mobl2.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.144.190])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2021 23:41:20 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/10] python3-numpy: upgrade 1.19.4 -> 1.19.5
Date: Wed, 20 Jan 2021 15:40:53 +0800
Message-Id: <20210120074058.252462-5-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120074058.252462-1-anuj.mittal@intel.com>
References: <20210120074058.252462-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../{python3-numpy_1.19.4.bb => python3-numpy_1.19.5.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python-numpy/{python3-numpy_1.19.4.bb => python3-numpy_1.19.5.bb} (95%)

diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.19.5.bb
similarity index 95%
rename from meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb
rename to meta/recipes-devtools/python-numpy/python3-numpy_1.19.5.bb
index 2bfc913aa0..5037d2a422 100644
--- a/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb
+++ b/meta/recipes-devtools/python-numpy/python3-numpy_1.19.5.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${S
            file://0001-numpy-core-Define-RISCV-32-support.patch \
            file://run-ptest \
 "
-SRC_URI[sha256sum] = "fe836a685d6838dbb3f603caef01183ea98e88febf4ce956a2ea484a75378413"
+SRC_URI[sha256sum] = "d1654047d75fb9d55cc3d46f312d5247eec5f4999039874d2f571bb8021d8f0b"
 
 UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.29.2

