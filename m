Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.12053.1594892178854619826
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2020 02:36:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: naveen.kumar.saini@intel.com)
IronPort-SDR: tnyl5eiK4kyg0fTl+NMz43uSkMBMc70RLtB9PA6PBo+/nvULZlYfMrCJ/0NT6LIT1/45Rkp2Qh
 fhlriPTjak7g==
X-IronPort-AV: E=McAfee;i="6000,8403,9683"; a="214086608"
X-IronPort-AV: E=Sophos;i="5.75,358,1589266800"; 
   d="scan'208";a="214086608"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2020 02:36:11 -0700
IronPort-SDR: /0WgHTndLuXlhoMR0OvKfFA+SP3KaQ4gbXrRiiQgB+Fv7uzu3QiL3EAjlZKGb/kyVcfLPxCrHz
 f0tWl512DEGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,358,1589266800"; 
   d="scan'208";a="269206631"
Received: from saininav-desk1.png.intel.com ([172.30.199.23])
  by fmsmga007.fm.intel.com with ESMTP; 16 Jul 2020 02:36:10 -0700
From: "Naveen Saini" <naveen.kumar.saini@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] libva-utils: upgrade 2.7.1 -> 2.8.0
Date: Thu, 16 Jul 2020 17:43:38 +0800
Message-Id: <20200716094338.9110-3-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200716094338.9110-1-naveen.kumar.saini@intel.com>
References: <20200716094338.9110-1-naveen.kumar.saini@intel.com>

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
---
 .../libva/{libva-utils_2.7.1.bb => libva-utils_2.8.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/libva/{libva-utils_2.7.1.bb => libva-utils_2.8.0.bb} (90%)

diff --git a/meta/recipes-graphics/libva/libva-utils_2.7.1.bb b/meta/recipes-graphics/libva/libva-utils_2.8.0.bb
similarity index 90%
rename from meta/recipes-graphics/libva/libva-utils_2.7.1.bb
rename to meta/recipes-graphics/libva/libva-utils_2.8.0.bb
index 92a5b099b4..fbc5a0583e 100644
--- a/meta/recipes-graphics/libva/libva-utils_2.7.1.bb
+++ b/meta/recipes-graphics/libva/libva-utils_2.8.0.bb
@@ -14,8 +14,8 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b148fc8adf19dc9aec17cf9cd29a9a5e"
 
-SRC_URI = "git://github.com/intel/libva-utils.git;branch=v2.7-branch"
-SRCREV = "5a24c635f6fb2b9ac31cab3360afca50e1860812"
+SRC_URI = "git://github.com/intel/libva-utils.git;branch=v2.8-branch"
+SRCREV = "af101a46d24c3f71a12b9f1ddb0c63626b19b3d8"
 S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
-- 
2.17.1

