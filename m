Received: from mga01.intel.com (mga01.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.8266.1588935408768524625
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2020 03:56:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: naveen.kumar.saini@intel.com)
IronPort-SDR: /X+5usU1iJ/K1W5Q8T67neO4RaC3tl6yhAzThB/tdm3ywj2X/qwBqMgRQ7TBL2h60HFM046+21
 RBFwV5lB2HMw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2020 03:56:49 -0700
IronPort-SDR: H0XCLqWd9v72lXNtDVfAUHkchxXAHGxQryTTe2oeEh+Ns722BSCVNP23vT4Kt1CctAIC0OKW+3
 HYgEtOrrF+Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,367,1583222400"; 
   d="scan'208";a="251821595"
Received: from saininav-desk1.png.intel.com ([172.30.199.23])
  by fmsmga008.fm.intel.com with ESMTP; 08 May 2020 03:56:48 -0700
From: "Naveen Saini" <naveen.kumar.saini@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] libva-utils: upgrade 2.6.0 -> 2.7.1
Date: Fri,  8 May 2020 19:03:10 +0800
Message-Id: <20200508110310.29937-2-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200508110310.29937-1-naveen.kumar.saini@intel.com>
References: <20200508110310.29937-1-naveen.kumar.saini@intel.com>

For release details:
https://github.com/intel/libva-utils/releases/tag/2.7.1

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
---
 .../libva/{libva-utils_2.6.0.bb => libva-utils_2.7.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/libva/{libva-utils_2.6.0.bb => libva-utils_2.7.1.bb} (90%)

diff --git a/meta/recipes-graphics/libva/libva-utils_2.6.0.bb b/meta/recipes-graphics/libva/libva-utils_2.7.1.bb
similarity index 90%
rename from meta/recipes-graphics/libva/libva-utils_2.6.0.bb
rename to meta/recipes-graphics/libva/libva-utils_2.7.1.bb
index 03b38027a1..92a5b099b4 100644
--- a/meta/recipes-graphics/libva/libva-utils_2.6.0.bb
+++ b/meta/recipes-graphics/libva/libva-utils_2.7.1.bb
@@ -14,8 +14,8 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b148fc8adf19dc9aec17cf9cd29a9a5e"
 
-SRC_URI = "git://github.com/intel/libva-utils.git;branch=v2.6-branch"
-SRCREV = "8ea1eba433dcbceb0e5dcb54b8e3f984987f7a17"
+SRC_URI = "git://github.com/intel/libva-utils.git;branch=v2.7-branch"
+SRCREV = "5a24c635f6fb2b9ac31cab3360afca50e1860812"
 S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
-- 
2.17.1

