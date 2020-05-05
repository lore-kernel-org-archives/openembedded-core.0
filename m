Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.3193.1588661906694787605
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 23:58:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: eUGaheIPRNfcj1mXvhTHoDrLCIHzWkiTuadB2oHZOhkiMpcEfiCB5c76edTuQqKLNc+s6aZeOd
 rE2Z+S1vUpxg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2020 23:58:31 -0700
IronPort-SDR: W+Vg5CAD7AcayqmlQg8XGOCbqMeRU6Cvm6ckWrDHugp5evWtXzWQ/xBvhPl+dWrB3S1z+K9e3t
 ZBmMpXDHWxjQ==
X-IronPort-AV: E=Sophos;i="5.73,354,1583222400"; 
   d="scan'208";a="284144811"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.72.16])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2020 23:58:29 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][zeus 11/18] python: Upgrade 2.7.17 -> 2.17.18
Date: Tue,  5 May 2020 14:56:46 +0800
Message-Id: <b15db3ce3af3460b7f9ae1e186e453a79a056511.1588661196.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1588661196.git.anuj.mittal@intel.com>
References: <cover.1588661196.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Adrian Bunk <bunk@stusta.de>

LICENSE checksum changed due to 2019 -> 2020 update.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../{python-native_2.7.17.bb => python-native_2.7.18.bb}    | 0
 meta/recipes-devtools/python/python.inc                     | 6 +++---
 .../python/{python_2.7.17.bb => python_2.7.18.bb}           | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python-native_2.7.17.bb => python-native_2.7.18.bb} (100%)
 rename meta/recipes-devtools/python/{python_2.7.17.bb => python_2.7.18.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-native_2.7.17.bb b/meta/recipes-devtools/python/python-native_2.7.18.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-native_2.7.17.bb
rename to meta/recipes-devtools/python/python-native_2.7.18.bb
diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
index 19a2f3e743..fe281586fc 100644
--- a/meta/recipes-devtools/python/python.inc
+++ b/meta/recipes-devtools/python/python.inc
@@ -5,13 +5,13 @@ SECTION = "devel/python"
 # bump this on every change in contrib/python/generate-manifest-2.7.py
 INC_PR = "r1"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e466242989bd33c1bd2b6a526a742498"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=203a6dbc802ee896020a47161e759642"
 
 SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            "
 
-SRC_URI[md5sum] = "b3b6d2c92f42a60667814358ab9f0cfd"
-SRC_URI[sha256sum] = "4d43f033cdbd0aa7b7023c81b0e986fd11e653b5248dac9144d508f11812ba41"
+SRC_URI[md5sum] = "fd6cc8ec0a78c44036f825e739f36e5a"
+SRC_URI[sha256sum] = "b62c0e7937551d0cc02b8fd5cb0f544f9405bafc9a54d3808ed4594812edef43"
 
 # python recipe is actually python 2.x
 # also, exclude pre-releases for both python 2.x and 3.x
diff --git a/meta/recipes-devtools/python/python_2.7.17.bb b/meta/recipes-devtools/python/python_2.7.18.bb
similarity index 100%
rename from meta/recipes-devtools/python/python_2.7.17.bb
rename to meta/recipes-devtools/python/python_2.7.18.bb
-- 
2.25.4

