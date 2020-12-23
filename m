Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.10233.1608736733177759099
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 07:19:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: IfWgrOqIAraztBJcif74rjwUWB3O8MhWkN6vSmzPuwGFGUjoQrJHAzUaqdnTWhojizvR595+B1
 26kN7brG0ysA==
X-IronPort-AV: E=McAfee;i="6000,8403,9843"; a="155235989"
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="155235989"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:02 -0800
IronPort-SDR: Ceodz/dySuPmzBpgyKeR5x8asVT5npRvuOEYDcagV18TN/1lOcjc5r6/KENhh5rzdjhduexQIL
 J3ey1nFCw8Kg==
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="374027517"
Received: from btang1-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.75.173])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:01 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 08/35] cups: Mark CVE-2008-1033 as a non-issue
Date: Wed, 23 Dec 2020 23:18:18 +0800
Message-Id: <7acb6701df68e8259f762101ef22c2f1b3526147.1608735614.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1608735614.git.anuj.mittal@intel.com>
References: <cover.1608735614.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

It only applies to MacOS.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cad1162f41c4c060744b98109514f761aa64d34a)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-extended/cups/cups.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 91e73d75e4..e7a704134c 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -20,6 +20,8 @@ SRC_URI = "https://github.com/apple/cups/releases/download/v${PV}/${BP}-source.t
 UPSTREAM_CHECK_URI = "https://github.com/apple/cups/releases"
 UPSTREAM_CHECK_REGEX = "cups-(?P<pver>\d+\.\d+(\.\d+)?)-source.tar"
 
+# Issue only applies to MacOS
+CVE_CHECK_WHITELIST += "CVE-2008-1033"
 # Issue affects pdfdistiller plugin used with but not part of cups
 CVE_CHECK_WHITELIST += "CVE-2009-0032"
 # This is an Ubuntu only issue.
-- 
2.29.2

