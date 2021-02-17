Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.4031.1613541139240922185
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 21:52:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: ZttDAX0/W7/qo0JS0uqebk9aKEghebFCIGYWQCgOdGHJXC3AUF1DmHvEFThGcxPGbwaRHcdq3O
 /bIx+4JwgPXg==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="162247154"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="162247154"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:52:39 -0800
IronPort-SDR: wDlNMK1imUJuIn62aYeNlXdCOAKjLeAZFJtCusONI8g/pU1xtsA7dUvrbbI9WNAZqUbjNyvFCm
 Q/Sv7B6RL0XA==
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="399825449"
Received: from rjangidx-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.185.188])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:52:38 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 18/27] python3-numpy: upgrade 1.20.0 -> 1.20.1
Date: Wed, 17 Feb 2021 13:52:01 +0800
Message-Id: <20210217055210.22019-18-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210217055210.22019-1-anuj.mittal@intel.com>
References: <20210217055210.22019-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: change in copyright years

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../{python3-numpy_1.20.0.bb => python3-numpy_1.20.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python-numpy/{python3-numpy_1.20.0.bb => python3-numpy_1.20.1.bb} (92%)

diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.20.0.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.20.1.bb
similarity index 92%
rename from meta/recipes-devtools/python-numpy/python3-numpy_1.20.0.bb
rename to meta/recipes-devtools/python-numpy/python3-numpy_1.20.1.bb
index 8d348d85ca..2d72152464 100644
--- a/meta/recipes-devtools/python-numpy/python3-numpy_1.20.0.bb
+++ b/meta/recipes-devtools/python-numpy/python3-numpy_1.20.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "A sophisticated Numeric Processing Package for Python"
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & PSF & Apache-2.0 & BSD & MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=474c7e8e97b80fb7500de2b0c4a4a8d4"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=aa1ecaef18152f75bfae546b29c49d3c"
 
 SRCNAME = "numpy"
 
@@ -10,7 +10,7 @@ SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${S
            file://0001-numpy-core-Define-RISCV-32-support.patch \
            file://run-ptest \
 "
-SRC_URI[sha256sum] = "67b630745a71b541ff6517d6f3d62b00690dc8ba0684cad0d7b0ac55aec1de53"
+SRC_URI[sha256sum] = "9bf51d69ebb4ca9239e55bedc2185fe2c0ec222da0adee7ece4125414676846d"
 
 UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.29.2

