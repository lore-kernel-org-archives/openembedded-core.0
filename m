Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.10233.1608736733177759099
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 07:19:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: iZopXNllJGUeLr60PtPQa7HwhA5eP7BaYO6RffG7QlQcKbd8/Uga9ZZ22TMyyedqjk83I0tBAz
 ZfA40zgsq/9w==
X-IronPort-AV: E=McAfee;i="6000,8403,9843"; a="155235984"
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="155235984"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:01 -0800
IronPort-SDR: vWbNJGOzrTeSRiL2dLjaaPyyOk2sJVdZGCAFo404AWlYrUyhS9vF77iypR1m7dbFlleMbbq6fh
 bkYSM1Jg5raA==
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="374027509"
Received: from btang1-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.75.173])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:00 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 07/35] cups: Mark CVE-2009-0032 as a non-issue
Date: Wed, 23 Dec 2020 23:18:17 +0800
Message-Id: <16f70caa2360f880a8793d37dd149ca8caad386f.1608735614.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1608735614.git.anuj.mittal@intel.com>
References: <cover.1608735614.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The CVE was against a cups plugin which is obsolete and we don't include.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5f7cb9f6ec4b14f992d265b8c67a9f5589f9b842)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-extended/cups/cups.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index df8d4d284a..91e73d75e4 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -20,6 +20,8 @@ SRC_URI = "https://github.com/apple/cups/releases/download/v${PV}/${BP}-source.t
 UPSTREAM_CHECK_URI = "https://github.com/apple/cups/releases"
 UPSTREAM_CHECK_REGEX = "cups-(?P<pver>\d+\.\d+(\.\d+)?)-source.tar"
 
+# Issue affects pdfdistiller plugin used with but not part of cups
+CVE_CHECK_WHITELIST += "CVE-2009-0032"
 # This is an Ubuntu only issue.
 CVE_CHECK_WHITELIST += "CVE-2018-6553"
 
-- 
2.29.2

