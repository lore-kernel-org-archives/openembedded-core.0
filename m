Received: from mga17.intel.com (mga17.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.2597.1613622265608276454
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Feb 2021 20:24:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: o3y31u56XO58YMpFAGr4G+TzndMRNp8bAZKaHfjmhELTFGrrFEvc0Q21EIMKKcHOwwIHTk4AAQ
 jhRqAcv56CSw==
X-IronPort-AV: E=McAfee;i="6000,8403,9898"; a="163177967"
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; 
   d="scan'208";a="163177967"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2021 20:24:31 -0800
IronPort-SDR: 6XV2eNUsYrZ20obPrz5T+unPqU8bJzXsPnpVtO9krgKkyroegSCDTlr2D6udAmOOBV/fv22XT0
 vdbtjjjDC6kA==
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; 
   d="scan'208";a="378269188"
Received: from zaizam-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.185.203])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2021 20:24:30 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/12] wpebackend-fdo: upgrade 1.8.0 -> 1.9.1
Date: Thu, 18 Feb 2021 12:24:12 +0800
Message-Id: <20210218042418.281245-6-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210218042418.281245-1-anuj.mittal@intel.com>
References: <20210218042418.281245-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../webkit/{wpebackend-fdo_1.8.0.bb => wpebackend-fdo_1.9.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{wpebackend-fdo_1.8.0.bb => wpebackend-fdo_1.9.1.bb} (85%)

diff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.8.0.bb b/meta/recipes-sato/webkit/wpebackend-fdo_1.9.1.bb
similarity index 85%
rename from meta/recipes-sato/webkit/wpebackend-fdo_1.8.0.bb
rename to meta/recipes-sato/webkit/wpebackend-fdo_1.9.1.bb
index 69d6098d36..4547efc57d 100644
--- a/meta/recipes-sato/webkit/wpebackend-fdo_1.8.0.bb
+++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.9.1.bb
@@ -13,5 +13,5 @@ inherit meson features_check
 REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "9652a99c75fe1c6eab0585b6395f4e104b2427e4d1f42969f1f77df29920d253"
+SRC_URI[sha256sum] = "a1dc4e506413719a0d84757797b645fa76590e6c8db23d2403d990dc2e196a64"
 
-- 
2.29.2

