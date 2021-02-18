Received: from mga17.intel.com (mga17.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.2597.1613622265608276454
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Feb 2021 20:24:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: MLxHAn51Dkcij47Hy08hD5hEk8vPhHUYRjJGsZCWq67T0ioOAyHnxlWwSHiGmZ/SB46+CtQNHH
 aCaTxpHuFQjQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9898"; a="163177961"
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; 
   d="scan'208";a="163177961"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2021 20:24:30 -0800
IronPort-SDR: bV5mrQa+xW9Y3rllbWM02kRMk5DI/CoYMpFnQVv96R91UULE4cKH5kaWnmp+8dz+CxXmHL7FmE
 TGlGbR+FH1kA==
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; 
   d="scan'208";a="378269184"
Received: from zaizam-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.185.203])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2021 20:24:29 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/12] pcmanfm: upgrade 1.3.1 -> 1.3.2
Date: Thu, 18 Feb 2021 12:24:11 +0800
Message-Id: <20210218042418.281245-5-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210218042418.281245-1-anuj.mittal@intel.com>
References: <20210218042418.281245-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../pcmanfm/{pcmanfm_1.3.1.bb => pcmanfm_1.3.2.bb}             | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-sato/pcmanfm/{pcmanfm_1.3.1.bb => pcmanfm_1.3.2.bb} (90%)

diff --git a/meta/recipes-sato/pcmanfm/pcmanfm_1.3.1.bb b/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb
similarity index 90%
rename from meta/recipes-sato/pcmanfm/pcmanfm_1.3.1.bb
rename to meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb
index 7885e0abae..37723e9320 100644
--- a/meta/recipes-sato/pcmanfm/pcmanfm_1.3.1.bb
+++ b/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb
@@ -16,8 +16,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/pcmanfm-${PV}.tar.xz \
 	   file://emblem-symbolic-link.png \
 	   file://no-desktop.patch"
 
-SRC_URI[md5sum] = "d32ad2c9c7c52bff2004bbc120b53420"
-SRC_URI[sha256sum] = "6804043b3ee3a703edde41c724946174b505fe958703eadbd7e0876ece836855"
+SRC_URI[sha256sum] = "14cb7b247493c4cce65fbb5902611e3ad00a7a870fbc1e50adc50428c5140cf7"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/pcmanfm/files/PCManFM%20%2B%20Libfm%20%28tarball%20release%29/PCManFM/"
 
-- 
2.29.2

