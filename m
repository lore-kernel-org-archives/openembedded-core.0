Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.4031.1613541139240922185
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 21:52:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 1vUAHNb58cuor6jBYXFA4qgV/O1HsIxN1vdg9VREUKN9px53xfMOqWqnN8slSmeo9YzJVkJLIi
 1nMJEBFLyHfQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="162247093"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="162247093"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:52:26 -0800
IronPort-SDR: ozoTW8fawKuLyaAh5q4LV1sJ4JIdDhh/98zJSrEAfGPlMsGfQdpvGiY+JzPdJyYyai6RjH7Ta5
 Rp1P4w0gC1Fw==
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="399825408"
Received: from rjangidx-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.185.188])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:52:24 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/27] createrepo-c: upgrade 0.16.2 -> 0.17.0
Date: Wed, 17 Feb 2021 13:51:51 +0800
Message-Id: <20210217055210.22019-8-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210217055210.22019-1-anuj.mittal@intel.com>
References: <20210217055210.22019-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch | 8 ++++----
 .../{createrepo-c_0.16.2.bb => createrepo-c_0.17.0.bb}    | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_0.16.2.bb => createrepo-c_0.17.0.bb} (95%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
index c0f07fe2ca..d675af4f8b 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
@@ -1,4 +1,4 @@
-From 4644d18157296257284bedd857f4610f1037d50e Mon Sep 17 00:00:00 2001
+From 218a4760945be7a404df6515ffbc769c92791f9b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:31:02 +0200
 Subject: [PATCH] Do not set PYTHON_INSTALL_DIR by running python
@@ -11,11 +11,11 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/python/CMakeLists.txt b/src/python/CMakeLists.txt
-index 3d873f7..e977b2f 100644
+index 855127f..dff1d97 100644
 --- a/src/python/CMakeLists.txt
 +++ b/src/python/CMakeLists.txt
-@@ -21,7 +21,7 @@ if (NOT SKBUILD)
-     endif ()
+@@ -14,7 +14,7 @@ if (NOT SKBUILD)
+     FIND_PACKAGE(PythonInterp 3 EXACT REQUIRED)
  endif (NOT SKBUILD)
  
 -EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from distutils import sysconfig; stdout.write(sysconfig.get_python_lib(True))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb
similarity index 95%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb
index 2b552a4cdf..350b183542 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "031f0524905c2a64a2faae555ca9d91281448d1b"
+SRCREV = "909a0636665ed96f97babc3b887f9badc88875c3"
 
 S = "${WORKDIR}/git"
 
-- 
2.29.2

