Received: from mga04.intel.com (mga04.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.53727.1606698706457667213
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Nov 2020 17:12:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: /iSG+Mu0Vo6zwjHbQwjYANVVW46q1J8KOTrK/RQUhawAscAUL0keQ/SnTBl290+OsonYaVoQ8J
 SdUtE8gVS5Cg==
X-IronPort-AV: E=McAfee;i="6000,8403,9820"; a="170004400"
X-IronPort-AV: E=Sophos;i="5.78,379,1599548400"; 
   d="scan'208";a="170004400"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2020 17:12:04 -0800
IronPort-SDR: UqemnAcz+Tzv1E0NHAAEQy/F5X8Gcps/Fvd+nnLs5fmqU35S98/oNtyoQTGOcFIwMpJSMGalgF
 W485Km5mm+GA==
X-IronPort-AV: E=Sophos;i="5.78,379,1599548400"; 
   d="scan'208";a="372302688"
Received: from ajraj-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.114.166])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2020 17:12:03 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 10/21] sqlite3: add CVE-2015-3717 to whitelist
Date: Mon, 30 Nov 2020 09:11:25 +0800
Message-Id: <2b68dc373895c2e609a5841841960c57ea457e22.1606698421.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1606698421.git.anuj.mittal@intel.com>
References: <cover.1606698421.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross@burtonini.com>

As per https://groups.google.com/g/sqlite-dev/c/U7OjAbZO6LA this issue
is believed to be either iOS specific, or fixed in 3.8.9.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b781058267bd86bd979c50f4dfe8168c58dfa5a9)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/sqlite/sqlite3_3.33.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.33.0.bb b/meta/recipes-support/sqlite/sqlite3_3.33.0.bb
index 611a1bd923..33f041a161 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.33.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.33.0.bb
@@ -8,3 +8,5 @@ SRC_URI[sha256sum] = "106a2c48c7f75a298a7557bcc0d5f4f454e5b43811cc738b7ca294d695
 
 # -19242 is only an issue in specific development branch commits
 CVE_CHECK_WHITELIST += "CVE-2019-19242"
+# This is believed to be iOS specific (https://groups.google.com/g/sqlite-dev/c/U7OjAbZO6LA)
+CVE_CHECK_WHITELIST += "CVE-2015-3717"
-- 
2.28.0

