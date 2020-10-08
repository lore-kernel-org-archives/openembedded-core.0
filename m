Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.1968.1602120102635524932
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2020 18:21:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: y82MWHYSZiscenSh90F7Z0V4lrC0aV1I/tDneCtn35wVZmObYHJUAIdS1bswVqKjxu6v9X2ohg
 YYZsq1UMXrJw==
X-IronPort-AV: E=McAfee;i="6000,8403,9767"; a="161765180"
X-IronPort-AV: E=Sophos;i="5.77,349,1596524400"; 
   d="scan'208";a="161765180"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2020 18:21:40 -0700
IronPort-SDR: zgfi63H3EBOt7R5E9TQFGKCO5/PD9esw4RBglnnoOUJZcX0SwF4UvryuF8Qjstnst96TIqLBlZ
 YEFYMUYBrZXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,349,1596524400"; 
   d="scan'208";a="349295208"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by fmsmga002.fm.intel.com with ESMTP; 07 Oct 2020 18:21:40 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-cython: improve reprodcibility
Date: Thu,  8 Oct 2020 09:21:39 +0800
Message-Id: <20201008012139.56459-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lee Chee Yang <chee.yang.lee@intel.com>

fix below diff in diffoscope.
diffoscope diff :-
│ │ ├──
./usr/lib/python3.8/site-packages/Cython-0.29.21-py3.8.egg-info/SOURCES.txt
│ │ │ @@ -11,22 +11,22 @@
│ │ │  cygdb.py
│ │ │  cython.py
│ │ │  cythonize.py
│ │ │  pylintrc
│ │ │  runtests.py
│ │ │  setup.py
│ │ │  setupegg.py
│ │ │
-/yocto/poky-master/build-2/tmp/work/skylake-64-poky-linux/python3-cython/0.29.21-r0/Cython-0.29.21/Cython/Compiler/FlowControl.c
│ │ │
-/yocto/poky-master/build-2/tmp/work/skylake-64-poky-linux/python3-cython/0.29.21-r0/Cython-0.29.21/Cython/Compiler/FusedNode.c
│ │ │
-/yocto/poky-master/build-2/tmp/work/skylake-64-poky-linux/python3-cython/0.29.21-r0/Cython-0.29.21/Cython/Compiler/Scanning.c
│ │ │
-/yocto/poky-master/build-2/tmp/work/skylake-64-poky-linux/python3-cython/0.29.21-r0/Cython-0.29.21/Cython/Compiler/Visitor.c
│ │ │
-/yocto/poky-master/build-2/tmp/work/skylake-64-poky-linux/python3-cython/0.29.21-r0/Cython-0.29.21/Cython/Plex/Actions.c
│ │ │
-/yocto/poky-master/build-2/tmp/work/skylake-64-poky-linux/python3-cython/0.29.21-r0/Cython-0.29.21/Cython/Plex/Scanners.c
│ │ │
-/yocto/poky-master/build-2/tmp/work/skylake-64-poky-linux/python3-cython/0.29.21-r0/Cython-0.29.21/Cython/Runtime/refnanny.c
│ │ │
-/yocto/poky-master/build-2/tmp/work/skylake-64-poky-linux/python3-cython/0.29.21-r0/Cython-0.29.21/Cython/Tempita/_tempita.c
│ │ │
+/yocto/poky-master/build/tmp/work/skylake-64-poky-linux/python3-cython/0.29.21-r0/Cython-0.29.21/Cython/Compiler/FlowControl.c
│ │ │
+/yocto/poky-master/build/tmp/work/skylake-64-poky-linux/python3-cython/0.29.21-r0/Cython-0.29.21/Cython/Compiler/FusedNode.c
│ │ │
+/yocto/poky-master/build/tmp/work/skylake-64-poky-linux/python3-cython/0.29.21-r0/Cython-0.29.21/Cython/Compiler/Scanning.c
│ │ │
+/yocto/poky-master/build/tmp/work/skylake-64-poky-linux/python3-cython/0.29.21-r0/Cython-0.29.21/Cython/Compiler/Visitor.c
│ │ │
+/yocto/poky-master/build/tmp/work/skylake-64-poky-linux/python3-cython/0.29.21-r0/Cython-0.29.21/Cython/Plex/Actions.c
│ │ │
+/yocto/poky-master/build/tmp/work/skylake-64-poky-linux/python3-cython/0.29.21-r0/Cython-0.29.21/Cython/Plex/Scanners.c
│ │ │
+/yocto/poky-master/build/tmp/work/skylake-64-poky-linux/python3-cython/0.29.21-r0/Cython-0.29.21/Cython/Runtime/refnanny.c
│ │ │
+/yocto/poky-master/build/tmp/work/skylake-64-poky-linux/python3-cython/0.29.21-r0/Cython-0.29.21/Cython/Tempita/_tempita.c
│ │ │  Cython/CodeWriter.py

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/recipes-devtools/python/python3-cython_0.29.21.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-cython_0.29.21.bb b/meta/recipes-devtools/python/python3-cython_0.29.21.bb
index 2ce6bdbd68..81b3c02180 100644
--- a/meta/recipes-devtools/python/python3-cython_0.29.21.bb
+++ b/meta/recipes-devtools/python/python3-cython_0.29.21.bb
@@ -15,4 +15,7 @@ do_install_append() {
     mv ${D}${bindir}/cython ${D}${bindir}/cython3
     mv ${D}${bindir}/cythonize ${D}${bindir}/cythonize3
     mv ${D}${bindir}/cygdb ${D}${bindir}/cygdb3
+
+    # remove WORKDIR info from SOURCES.txt to improve reproducibility
+    sed -i 's#${WORKDIR}#/#g' ${D}${PYTHON_SITEPACKAGES_DIR}/Cython-*-info/SOURCES.txt
 }
-- 
2.17.1

