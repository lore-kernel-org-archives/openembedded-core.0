Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web10.4081.1620808568509855065
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 01:36:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.151, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: M1pEnevAoOiAzxuB2DucNibakmP8OY6aJBAEUPX8RyJHNyW2wT6ZMVbZ2c8/1UzdAKMAx0oFwZ
 DBcCJH4kaaDg==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="179917788"
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="179917788"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2021 01:36:08 -0700
IronPort-SDR: LSgnFj1xo2+tQQz5rC6MA5PpfaPQMu6LDk9n+HD7R2VVM62M3PW0P224bbX0r6gBW4VNh8GEMi
 PkblLfbY/g/g==
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="430645744"
Received: from tmustofa-mobl1.amr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.35.122])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2021 01:36:07 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 05/15] db: update CVE_PRODUCT
Date: Wed, 12 May 2021 16:35:37 +0800
Message-Id: <b5004de05327c734d63cfac153ebf1542f9177c9.1620808329.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1620808329.git.anuj.mittal@intel.com>
References: <cover.1620808329.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen Qi <Qi.Chen@windriver.com>

Update CVE_PRODUCT to also include 'berkeley_db'. For example,
CVE-2020-2981 uses 'berkeley_db'.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ad799b109716ccd2f44dcf7a6a4cfcbd622ea661)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/db/db_5.3.28.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support/db/db_5.3.28.bb
index 9cb57e6a53..b2ae98f05c 100644
--- a/meta/recipes-support/db/db_5.3.28.bb
+++ b/meta/recipes-support/db/db_5.3.28.bb
@@ -15,7 +15,7 @@ HOMEPAGE = "https://www.oracle.com/database/technologies/related/berkeleydb.html
 LICENSE = "Sleepycat"
 RCONFLICTS_${PN} = "db3"
 
-CVE_PRODUCT = "oracle_berkeley_db"
+CVE_PRODUCT = "oracle_berkeley_db berkeley_db"
 CVE_VERSION = "11.2.${PV}"
 
 PR = "r1"
-- 
2.31.1

