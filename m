Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.7783.1605783638754829532
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2020 03:00:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: DbYMyarfbJMnTgVkenijx1nzqvi1V6OFBQUDQNxqfbzYxC6+l8yaQ6jGHVTZ0sGr6Cm5sMwtce
 jbIeGh3dgOdw==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="167760000"
X-IronPort-AV: E=Sophos;i="5.77,490,1596524400"; 
   d="scan'208";a="167760000"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2020 03:00:37 -0800
IronPort-SDR: Y8rrAEBcTlG6XHvUhIZotFpZaBB/DfNqQ7PqlMKDMdP2RTh58ibnlUwYU9y0mMY2Rzdj1k1HQL
 7K6wC5DPc6QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,490,1596524400"; 
   d="scan'208";a="368726344"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by FMSMGA003.fm.intel.com with ESMTP; 19 Nov 2020 03:00:36 -0800
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][PATCH 2/5] bison: update to 3.5.4 for CVE-2020-14150
Date: Thu, 19 Nov 2020 19:00:32 +0800
Message-Id: <20201119110035.70647-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201119110035.70647-1-chee.yang.lee@intel.com>
References: <20201119110035.70647-1-chee.yang.lee@intel.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

Release notes:
https://lists.gnu.org/archive/html/info-gnu/2020-04/msg00000.html

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/recipes-devtools/bison/{bison_3.5.3.bb => bison_3.5.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/bison/{bison_3.5.3.bb => bison_3.5.4.bb} (94%)

diff --git a/meta/recipes-devtools/bison/bison_3.5.3.bb b/meta/recipes-devtools/bison/bison_3.5.4.bb
similarity index 94%
rename from meta/recipes-devtools/bison/bison_3.5.3.bb
rename to meta/recipes-devtools/bison/bison_3.5.4.bb
index e6c169e9db..9830721038 100644
--- a/meta/recipes-devtools/bison/bison_3.5.3.bb
+++ b/meta/recipes-devtools/bison/bison_3.5.4.bb
@@ -14,7 +14,7 @@ SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
            file://add-with-bisonlocaledir.patch \
            file://0001-bison-fix-the-parallel-build.patch \
 "
-SRC_URI[sha256sum] = "2bf85b5f88a5f2fa8069aed2a2dfc3a9f8d15a97e59c713e3906e5fdd982a7c4"
+SRC_URI[sha256sum] = "4c17e99881978fa32c05933c5262457fa5b2b611668454f8dc2a695cd6b3720c"
 
 # No point in hardcoding path to m4, just use PATH
 EXTRA_OECONF += "M4=m4"
-- 
2.17.1

