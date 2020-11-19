Received: from mga11.intel.com (mga11.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.7782.1605783637693351252
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2020 03:00:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: PG7f2XqrogcXZk8MkCUSgEgLLFQyNUPZTuFaPEcTqy2nYcM7q0udDrUcCigfBccOsgCQExFZXI
 wF+vHEgmX84g==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="167760001"
X-IronPort-AV: E=Sophos;i="5.77,490,1596524400"; 
   d="scan'208";a="167760001"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2020 03:00:38 -0800
IronPort-SDR: Sn2IOsN55Od2saNMCh+XWZCpNsKkFTvhwiXuzYRy7MJ2C7yy/8faYXDtIa9R26rkdPL0FjofKa
 k0ZqbrjTD7dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,490,1596524400"; 
   d="scan'208";a="368726365"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by FMSMGA003.fm.intel.com with ESMTP; 19 Nov 2020 03:00:37 -0800
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][PATCH 3/5] python3: whitelist CVE-2020-15523
Date: Thu, 19 Nov 2020 19:00:33 +0800
Message-Id: <20201119110035.70647-3-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201119110035.70647-1-chee.yang.lee@intel.com>
References: <20201119110035.70647-1-chee.yang.lee@intel.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

This CVE is issue on _Py_CheckPython3 uses uninitialized dllpath when embedder sets module path with Py_SetPath.
Since it is .dll issue (on windows only), hence whitelist it.

https://bugs.python.org/issue29778

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/recipes-devtools/python/python3_3.8.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.8.2.bb b/meta/recipes-devtools/python/python3_3.8.2.bb
index 169bc87988..506b60a547 100644
--- a/meta/recipes-devtools/python/python3_3.8.2.bb
+++ b/meta/recipes-devtools/python/python3_3.8.2.bb
@@ -54,6 +54,9 @@ CVE_PRODUCT = "python"
 # This is not exploitable when glibc has CVE-2016-10739 fixed.
 CVE_CHECK_WHITELIST += "CVE-2019-18348"
 
+# This is windows only issue.
+CVE_CHECK_WHITELIST += "CVE-2020-15523"
+
 PYTHON_MAJMIN = "3.8"
 
 S = "${WORKDIR}/Python-${PV}"
-- 
2.17.1

