Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.1379.1611246138081873702
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jan 2021 08:22:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: Z3/5xnI7vokEVCPzKAXS1cYtzCnYidwTgF8OS2lc+CssF3YzauxPTomYfWNkQPfmUbXBqZSYpC
 Od4fbHcps4rg==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="179446324"
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; 
   d="scan'208";a="179446324"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 08:22:17 -0800
IronPort-SDR: Jrs0QwTKnVu7f9KTgMt3rz9mXNYymAwPgYrRr4M1dsLdcLf/KDATRj0EscwIU92QJpGLsLDdvR
 ia47ZL5kclYA==
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; 
   d="scan'208";a="427413584"
Received: from yonshuta-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.145.18])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 08:22:16 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 01/20] zip: whitelist CVE-2018-13410 and CVE-2018-13684
Date: Fri, 22 Jan 2021 00:21:46 +0800
Message-Id: <f0314a6937a63b3274bcd84817476834c1de876e.1611245974.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1611245974.git.anuj.mittal@intel.com>
References: <cover.1611245974.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mikko Rapeli <mikko.rapeli@bmw.de>

https://nvd.nist.gov/vuln/detail/CVE-2018-13410 is disputed and
also Debian considers it not a vulnerability:

https://security-tracker.debian.org/tracker/CVE-2018-13410

http://seclists.org/fulldisclosure/2018/Jul/24
"Negligible security impact, would involve that a untrusted party controls the -TT value."

https://nvd.nist.gov/vuln/detail/CVE-2018-13684 is not for zip, also Debian concludes this:

https://security-tracker.debian.org/tracker/CVE-2018-13684

"NOT-FOR-US: smart contract implementation for ZIP"

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-extended/zip/zip_3.0.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended/zip/zip_3.0.bb
index c00a932763..97e5e57533 100644
--- a/meta/recipes-extended/zip/zip_3.0.bb
+++ b/meta/recipes-extended/zip/zip_3.0.bb
@@ -19,6 +19,12 @@ UPSTREAM_VERSION_UNKNOWN = "1"
 SRC_URI[md5sum] = "7b74551e63f8ee6aab6fbc86676c0d37"
 SRC_URI[sha256sum] = "f0e8bb1f9b7eb0b01285495a2699df3a4b766784c1765a8f1aeedf63c0806369"
 
+# Disputed and also Debian doesn't consider a vulnerability
+CVE_CHECK_WHITELIST += "CVE-2018-13410"
+
+# Not for zip but for smart contract implementation for it
+CVE_CHECK_WHITELIST += "CVE-2018-13684"
+
 # zip.inc sets CFLAGS, but what Makefile actually uses is
 # CFLAGS_NOOPT.  It will also force -O3 optimization, overriding
 # whatever we set.
-- 
2.29.2

