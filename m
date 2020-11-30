Received: from mga04.intel.com (mga04.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.53727.1606698706457667213
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Nov 2020 17:12:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: vjnOKzmbKgBnA9pb3uaPprThvpZrYtKXbpExj55inCPhSBNAueDfJ2nPxTzRsGzfo3ETzQtjXL
 JrLep3Xzu70w==
X-IronPort-AV: E=McAfee;i="6000,8403,9820"; a="170004391"
X-IronPort-AV: E=Sophos;i="5.78,379,1599548400"; 
   d="scan'208";a="170004391"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2020 17:12:03 -0800
IronPort-SDR: U+5sBmYo9X8zUnDQ8x37hvl1+U0Fmw0hjOemYbXDqBpW4BqbLrtFuajYcGNetF6RVqfw65K2vg
 UzQDXVLXZCTQ==
X-IronPort-AV: E=Sophos;i="5.78,379,1599548400"; 
   d="scan'208";a="372302680"
Received: from ajraj-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.114.166])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2020 17:12:01 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 09/21] python3: add CVE-2007-4559 to whitelist
Date: Mon, 30 Nov 2020 09:11:24 +0800
Message-Id: <391ed53928db0df325798a0bce18ec6947e09ddd.1606698421.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1606698421.git.anuj.mittal@intel.com>
References: <cover.1606698421.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross@burtonini.com>

This issue describes expected behaviour, do not use tarfile with
untrusted data.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f4c22e83f2e68ff157da5ea1303acc2931d63f5f)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/python/python3_3.8.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.8.5.bb b/meta/recipes-devtools/python/python3_3.8.5.bb
index 3720b364bb..f09a3c1d6e 100644
--- a/meta/recipes-devtools/python/python3_3.8.5.bb
+++ b/meta/recipes-devtools/python/python3_3.8.5.bb
@@ -50,6 +50,8 @@ UPSTREAM_CHECK_URI = "https://www.python.org/downloads/source/"
 
 CVE_PRODUCT = "python"
 
+# Upstream consider this expected behaviour
+CVE_CHECK_WHITELIST += "CVE-2007-4559"
 # This is not exploitable when glibc has CVE-2016-10739 fixed.
 CVE_CHECK_WHITELIST += "CVE-2019-18348"
 
-- 
2.28.0

