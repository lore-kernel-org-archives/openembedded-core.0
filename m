Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 36B2777411
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 10:14:04 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 02 Jun 2016 03:14:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,405,1459839600"; d="scan'208";a="820115675"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 02 Jun 2016 03:14:06 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id A213E6A4006
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 04:01:32 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jun 2016 13:13:02 +0300
Message-Id: <2775bba0e02b2d57f394ac60f15b3168a1073e25.1464861910.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1464861910.git.ed.bartosh@linux.intel.com>
References: <cover.1464861910.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1464861910.git.ed.bartosh@linux.intel.com>
References: <cover.1464861910.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 16/16] scripts: python3: change python to python3 in shebang
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Jun 2016 10:14:04 -0000

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/bitbake-whatchanged                 | 2 +-
 scripts/buildhistory-collect-srcrevs        | 2 +-
 scripts/cleanup-workdir                     | 2 +-
 scripts/combo-layer                         | 2 +-
 scripts/contrib/bbvars.py                   | 2 +-
 scripts/contrib/devtool-stress.py           | 2 +-
 scripts/contrib/list-packageconfig-flags.py | 2 +-
 scripts/contrib/verify-homepage.py          | 2 +-
 scripts/cp-noerror                          | 2 +-
 scripts/gen-lockedsig-cache                 | 2 +-
 scripts/lib/devtool/__init__.py             | 2 +-
 scripts/oe-publish-sdk                      | 2 +-
 scripts/oe-trim-schemas                     | 2 +-
 scripts/oepydevshell-internal.py            | 2 +-
 scripts/opkg-query-helper.py                | 2 +-
 scripts/pythondeps                          | 2 +-
 scripts/relocate_sdk.py                     | 2 +-
 scripts/send-error-report                   | 2 +-
 scripts/swabber-strace-attach               | 2 +-
 scripts/sysroot-relativelinks.py            | 2 +-
 scripts/test-remote-image                   | 2 +-
 scripts/tiny/dirsize.py                     | 2 +-
 scripts/tiny/ksize.py                       | 2 +-
 scripts/yocto-bsp                           | 2 +-
 scripts/yocto-kernel                        | 2 +-
 scripts/yocto-layer                         | 2 +-
 26 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/scripts/bitbake-whatchanged b/scripts/bitbake-whatchanged
index 55b61d0..0207777 100755
--- a/scripts/bitbake-whatchanged
+++ b/scripts/bitbake-whatchanged
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 # ex:ts=4:sw=4:sts=4:et
 # -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
 
diff --git a/scripts/buildhistory-collect-srcrevs b/scripts/buildhistory-collect-srcrevs
index 79d2657..8a03580 100755
--- a/scripts/buildhistory-collect-srcrevs
+++ b/scripts/buildhistory-collect-srcrevs
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 #
 # Collects the recorded SRCREV values from buildhistory and reports on them
 #
diff --git a/scripts/cleanup-workdir b/scripts/cleanup-workdir
index 0b2cf99..86eae37 100755
--- a/scripts/cleanup-workdir
+++ b/scripts/cleanup-workdir
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 
 # Copyright (c) 2012 Wind River Systems, Inc.
 #
diff --git a/scripts/combo-layer b/scripts/combo-layer
index eaa7f5a..8f57ba5 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 # ex:ts=4:sw=4:sts=4:et
 # -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
 #
diff --git a/scripts/contrib/bbvars.py b/scripts/contrib/bbvars.py
index b865dd1..d8d0594 100755
--- a/scripts/contrib/bbvars.py
+++ b/scripts/contrib/bbvars.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the GNU General Public License as published by
diff --git a/scripts/contrib/devtool-stress.py b/scripts/contrib/devtool-stress.py
index 8cf92ca..2723491 100755
--- a/scripts/contrib/devtool-stress.py
+++ b/scripts/contrib/devtool-stress.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 
 # devtool stress tester
 #
diff --git a/scripts/contrib/list-packageconfig-flags.py b/scripts/contrib/list-packageconfig-flags.py
index 22d0c49..b8327e4 100755
--- a/scripts/contrib/list-packageconfig-flags.py
+++ b/scripts/contrib/list-packageconfig-flags.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the GNU General Public License as published by
diff --git a/scripts/contrib/verify-homepage.py b/scripts/contrib/verify-homepage.py
index 18bb15b..61a047c4 100755
--- a/scripts/contrib/verify-homepage.py
+++ b/scripts/contrib/verify-homepage.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 
 # This script can be used to verify HOMEPAGE values for all recipes in
 # the current configuration.
diff --git a/scripts/cp-noerror b/scripts/cp-noerror
index d8be677..35eb211 100755
--- a/scripts/cp-noerror
+++ b/scripts/cp-noerror
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 #
 # Allow copying of $1 to $2 but if files in $1 disappear during the copy operation,
 # don't error.
diff --git a/scripts/gen-lockedsig-cache b/scripts/gen-lockedsig-cache
index 0986a21..26e9b63 100755
--- a/scripts/gen-lockedsig-cache
+++ b/scripts/gen-lockedsig-cache
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 
 import os
 import sys
diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index 7005363..77b1fd9 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 
 # Development tool - utility functions for plugins
 #
diff --git a/scripts/oe-publish-sdk b/scripts/oe-publish-sdk
index 55872f2..4fe8974 100755
--- a/scripts/oe-publish-sdk
+++ b/scripts/oe-publish-sdk
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 
 # OpenEmbedded SDK publishing tool
 
diff --git a/scripts/oe-trim-schemas b/scripts/oe-trim-schemas
index 29fb3a1..66a1b8d 100755
--- a/scripts/oe-trim-schemas
+++ b/scripts/oe-trim-schemas
@@ -1,4 +1,4 @@
-#! /usr/bin/env python
+#! /usr/bin/env python3
 
 import sys
 try:
diff --git a/scripts/oepydevshell-internal.py b/scripts/oepydevshell-internal.py
index 2566606..7761f66 100755
--- a/scripts/oepydevshell-internal.py
+++ b/scripts/oepydevshell-internal.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 
 import os
 import sys
diff --git a/scripts/opkg-query-helper.py b/scripts/opkg-query-helper.py
index 2fb1a78..ce89491 100755
--- a/scripts/opkg-query-helper.py
+++ b/scripts/opkg-query-helper.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 
 # OpenEmbedded opkg query helper utility
 #
diff --git a/scripts/pythondeps b/scripts/pythondeps
index f1e6452..590b976 100755
--- a/scripts/pythondeps
+++ b/scripts/pythondeps
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 #
 # Determine dependencies of python scripts or available python modules in a search path.
 #
diff --git a/scripts/relocate_sdk.py b/scripts/relocate_sdk.py
index 99fca86..e47b4d9 100755
--- a/scripts/relocate_sdk.py
+++ b/scripts/relocate_sdk.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 #
 # Copyright (c) 2012 Intel Corporation
 #
diff --git a/scripts/send-error-report b/scripts/send-error-report
index 122ce32..ff23552 100755
--- a/scripts/send-error-report
+++ b/scripts/send-error-report
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 
 # Sends an error report (if the report-error class was enabled) to a
 # remote server.
diff --git a/scripts/swabber-strace-attach b/scripts/swabber-strace-attach
index f258987..e8f3258 100755
--- a/scripts/swabber-strace-attach
+++ b/scripts/swabber-strace-attach
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 import os
 import sys
 import subprocess
diff --git a/scripts/sysroot-relativelinks.py b/scripts/sysroot-relativelinks.py
index ac26367..e44eba2 100755
--- a/scripts/sysroot-relativelinks.py
+++ b/scripts/sysroot-relativelinks.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 import sys
 import os
 
diff --git a/scripts/test-remote-image b/scripts/test-remote-image
index 698948b..27b1cae 100755
--- a/scripts/test-remote-image
+++ b/scripts/test-remote-image
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 
 # Copyright (c) 2014 Intel Corporation
 #
diff --git a/scripts/tiny/dirsize.py b/scripts/tiny/dirsize.py
index 0b4fbd1..ddccc5a 100755
--- a/scripts/tiny/dirsize.py
+++ b/scripts/tiny/dirsize.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 #
 # Copyright (c) 2011, Intel Corporation.
 # All rights reserved.
diff --git a/scripts/tiny/ksize.py b/scripts/tiny/ksize.py
index 587c930..b9d2b19 100755
--- a/scripts/tiny/ksize.py
+++ b/scripts/tiny/ksize.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 #
 # Copyright (c) 2011, Intel Corporation.
 # All rights reserved.
diff --git a/scripts/yocto-bsp b/scripts/yocto-bsp
index ce30e55..6a422c3 100755
--- a/scripts/yocto-bsp
+++ b/scripts/yocto-bsp
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 # ex:ts=4:sw=4:sts=4:et
 # -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
 #
diff --git a/scripts/yocto-kernel b/scripts/yocto-kernel
index daaad07..fd97cb7 100755
--- a/scripts/yocto-kernel
+++ b/scripts/yocto-kernel
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 # ex:ts=4:sw=4:sts=4:et
 # -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
 #
diff --git a/scripts/yocto-layer b/scripts/yocto-layer
index 356972e..a5267f2 100755
--- a/scripts/yocto-layer
+++ b/scripts/yocto-layer
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 # ex:ts=4:sw=4:sts=4:et
 # -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
 #
-- 
2.1.4


