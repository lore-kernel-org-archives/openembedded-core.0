Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web10.1356.1586568435211841411
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Apr 2020 18:27:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: linux.intel.com, ip: 134.134.136.24, mailfrom: timothy.t.orling@linux.intel.com)
IronPort-SDR: IigYxnWqAwiWjAn0onvrZHd1Zv+FU/XZ8vEjzmZKdCYNzWd9ljBWQGA1bAIHnIwNRpQtrHgxwf
 z8HXQ3tz+6og==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2020 18:27:14 -0700
IronPort-SDR: WRsMSGhkZ6YA84wa8tlyja4+C0sZA4T7JBKJg6VksALUwAVNYwWcjwWU+WzaaSuqeKX/MXVyQ9
 xPZ1kZuU2h2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,368,1580803200"; 
   d="scan'208";a="262379766"
Received: from wrath.jf.intel.com ([10.54.31.24])
  by orsmga008.jf.intel.com with ESMTP; 10 Apr 2020 18:27:14 -0700
From: "Tim Orling" <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@linux.intel.com>
Subject: [PATCH] python3-manifest.json: add pathlib to core
Date: Fri, 10 Apr 2020 18:27:02 -0700
Message-Id: <20200411012702.26186-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pathlib module is for Object-oriented filesystem paths

It also provides a lot of handy utilities for checking on
paths. This seems to justify adding it to the core package
along side os, sys, and the other *path libraries.

[YOCTO #13670]

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/recipes-devtools/python/python3/python3-manifest.json | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index 251271cb84f..3bcc9b8662e 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -285,6 +285,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/operator.py",
             "${libdir}/python${PYTHON_MAJMIN}/optparse.py",
             "${libdir}/python${PYTHON_MAJMIN}/os.py",
+	    "${libdir}/python${PYTHON_MAJMIN}/pathlib.py",
             "${libdir}/python${PYTHON_MAJMIN}/pkgutil.py",
             "${libdir}/python${PYTHON_MAJMIN}/platform.py",
             "${libdir}/python${PYTHON_MAJMIN}/posixpath.py",
@@ -358,6 +359,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/operator.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/optparse.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/os.*.pyc",
+	    "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pathlib.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pkgutil.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/platform.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/posixpath.*.pyc",
-- 
2.24.0

