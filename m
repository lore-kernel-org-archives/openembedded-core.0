Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.8245.1611038800307577894
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 22:46:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: BTqvKNCPNcTu5IRgPQq5nWK/VQ8EF4XxE3Zv6s9bxjR6RxFLwnaH2/bw1Q3+e+EDqZyA7OQ7bX
 +Q3YeC2LhLIw==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="179035667"
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="179035667"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:46:33 -0800
IronPort-SDR: fZC4pGsCCEBlEncWYiMIZKPJbWuvOx2Vm4B+8zAnFq4QbHqEgam1mO2Y9ZSXnbiLWo0yxkLBFv
 M4QTIbMTyxZQ==
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="355441852"
Received: from jchen110-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.183.94])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:46:33 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 29/30] python3-importlib-metadata: upgrade 3.3.0 -> 3.4.0
Date: Tue, 19 Jan 2021 14:45:51 +0800
Message-Id: <20210119064552.115692-29-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119064552.115692-1-anuj.mittal@intel.com>
References: <20210119064552.115692-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...ib-metadata_3.3.0.bb => python3-importlib-metadata_3.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-importlib-metadata_3.3.0.bb => python3-importlib-metadata_3.4.0.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_3.3.0.bb b/meta/recipes-devtools/python/python3-importlib-metadata_3.4.0.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-importlib-metadata_3.3.0.bb
rename to meta/recipes-devtools/python/python3-importlib-metadata_3.4.0.bb
index 23f2e2dbaf..4e2d23721c 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_3.3.0.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_3.4.0.bb
@@ -8,7 +8,7 @@ inherit pypi setuptools3
 PYPI_PACKAGE = "importlib_metadata"
 UPSTREAM_CHECK_REGEX = "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
 
-SRC_URI[sha256sum] = "5c5a2720817414a6c41f0a49993908068243ae02c1635a228126519b509c8aed"
+SRC_URI[sha256sum] = "fa5daa4477a7414ae34e95942e4dd07f62adf589143c875c133c1e53c4eff38d"
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-- 
2.29.2

