Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web09.23762.1605705753366163822
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2020 05:22:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: TVkWvhBiQ/btG+JcAjTxEXVESVcAqlp+kiBNIAPbcMnKYBczwtF9ODkRWWoHMz7tWEUsMzeeqc
 TiIrpc4Ci5Iw==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="189188985"
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; 
   d="scan'208";a="189188985"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2020 05:22:31 -0800
IronPort-SDR: XCsZSvs9262xrwaJoh4x/2jpO8qNF/YvL4RctOn0iOpUIz3IaDcbJJt9C6boUNd5bXsFZxgKSE
 N1iqLP+AgWyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; 
   d="scan'208";a="534283585"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by fmsmga005.fm.intel.com with ESMTP; 18 Nov 2020 05:22:30 -0800
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] python3: whitelist CVE-2020-15523
Date: Wed, 18 Nov 2020 21:22:26 +0800
Message-Id: <20201118132227.48678-3-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201118132227.48678-1-chee.yang.lee@intel.com>
References: <20201118132227.48678-1-chee.yang.lee@intel.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

This CVE is issue on _Py_CheckPython3 uses uninitialized dllpath when embedder sets module path with Py_SetPath.
Since it is .dll issue (on windows only), hence whitelist it.

https://bugs.python.org/issue29778

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/recipes-devtools/python/python3_3.9.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.9.0.bb b/meta/recipes-devtools/python/python3_3.9.0.bb
index ae9a974f04..d29a779a81 100644
--- a/meta/recipes-devtools/python/python3_3.9.0.bb
+++ b/meta/recipes-devtools/python/python3_3.9.0.bb
@@ -49,6 +49,9 @@ CVE_PRODUCT = "python"
 # This is not exploitable when glibc has CVE-2016-10739 fixed.
 CVE_CHECK_WHITELIST += "CVE-2019-18348"
 
+# This is windows only issue.
+CVE_CHECK_WHITELIST += "CVE-2020-15523"
+
 PYTHON_MAJMIN = "3.9"
 
 S = "${WORKDIR}/Python-${PV}"
-- 
2.17.1

