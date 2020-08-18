Received: from mga04.intel.com (mga04.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.60233.1597726421182640826
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2020 21:53:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: UCd8Tw5/SArmj+Zn35mGXB3Pumr5um0GqSy+BdE8lo4r2BW2YJuZh4f85HBSHXRNU0Hyrl4yvt
 zclFczMOJUyA==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="152249957"
X-IronPort-AV: E=Sophos;i="5.76,326,1592895600"; 
   d="scan'208";a="152249957"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2020 21:53:41 -0700
IronPort-SDR: 6e7TnnDWmsJxWQUYymJ7eq97rCB1xG3MPGRVBkmc2+ZaZnwsU8Bu1BHpgG/9YMtNrSygRlkNZu
 iq085NoVhL0Q==
X-IronPort-AV: E=Sophos;i="5.76,326,1592895600"; 
   d="scan'208";a="319960839"
Received: from ychiew-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.70.25])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2020 21:53:40 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] sqlite3: upgrade 3.32.3 -> 3.33.0
Date: Tue, 18 Aug 2020 12:53:32 +0800
Message-Id: <20200818045334.121647-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200818045334.121647-1-anuj.mittal@intel.com>
References: <20200818045334.121647-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../sqlite/{sqlite3_3.32.3.bb => sqlite3_3.33.0.bb}            | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.32.3.bb => sqlite3_3.33.0.bb} (68%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.32.3.bb b/meta/recipes-support/sqlite/sqlite3_3.33.0.bb
similarity index 68%
rename from meta/recipes-support/sqlite/sqlite3_3.32.3.bb
rename to meta/recipes-support/sqlite/sqlite3_3.33.0.bb
index 1d4e8d4772..611a1bd923 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.32.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.33.0.bb
@@ -4,8 +4,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2020/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[md5sum] = "2e3911a3c15e85c2f2d040154bbe5ce3"
-SRC_URI[sha256sum] = "a31507123c1c2e3a210afec19525fd7b5bb1e19a6a34ae5b998fbd7302568b66"
+SRC_URI[sha256sum] = "106a2c48c7f75a298a7557bcc0d5f4f454e5b43811cc738b7ca294d6956bbb15"
 
 # -19242 is only an issue in specific development branch commits
 CVE_CHECK_WHITELIST += "CVE-2019-19242"
-- 
2.26.2

