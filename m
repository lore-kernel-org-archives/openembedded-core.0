Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.4031.1613541139240922185
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 21:52:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: ynUlbNdl4zLK4Y/pNP68WLl/2z6lsNOx7B4DeSG6s/2BzExLVkLJCVTK/dG6X2Db/sTc96D8Q0
 BV1ppLmFlLGA==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="162247174"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="162247174"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:52:44 -0800
IronPort-SDR: Bi/m/D0rk5U746C8NLhyJAbYVNGRmor+LCtyd3kzBYC1j6aZti7xPfFOcmX/giSnEHinV+sLks
 x5yLDEFeyRTQ==
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="399825463"
Received: from rjangidx-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.185.188])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:52:42 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 21/27] python3-setuptools: upgrade 52.0.0 -> 53.0.0
Date: Wed, 17 Feb 2021 13:52:04 +0800
Message-Id: <20210217055210.22019-21-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210217055210.22019-1-anuj.mittal@intel.com>
References: <20210217055210.22019-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...0001-conditionally-do-not-fetch-code-by-easy_install.patch | 4 ++--
 ...hon3-setuptools_52.0.0.bb => python3-setuptools_53.0.0.bb} | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_52.0.0.bb => python3-setuptools_53.0.0.bb} (94%)

diff --git a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index 99c50e94cb..680edbe704 100644
--- a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From d2633b49275b20e7acf724567fe0189aab25771e Mon Sep 17 00:00:00 2001
+From 6380cc63f79abe8b8404c9be5ed5f213a70c8c6a Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
@@ -15,7 +15,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/setuptools/command/easy_install.py b/setuptools/command/easy_install.py
-index 9ec83b7..7e97a07 100644
+index eeb21b5..eca1edd 100644
 --- a/setuptools/command/easy_install.py
 +++ b/setuptools/command/easy_install.py
 @@ -636,6 +636,11 @@ class easy_install(Command):
diff --git a/meta/recipes-devtools/python/python3-setuptools_52.0.0.bb b/meta/recipes-devtools/python/python3-setuptools_53.0.0.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-setuptools_52.0.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_53.0.0.bb
index 118f416657..811c8a5900 100644
--- a/meta/recipes-devtools/python/python3-setuptools_52.0.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_53.0.0.bb
@@ -10,7 +10,7 @@ SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 
 SRC_URI += "file://0001-change-shebang-to-python3.patch"
 
-SRC_URI[sha256sum] = "fb3a1ee622509550dbf1d419f241296169d7f09cb1eb5b1736f2f10965932b96"
+SRC_URI[sha256sum] = "1b18ef17d74ba97ac9c0e4b4265f123f07a8ae85d9cd093949fa056d3eeeead5"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.29.2

