Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 67C046FFDA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 18:48:59 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 19 Jan 2016 10:49:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,318,1449561600"; d="scan'208";a="32428195"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 19 Jan 2016 10:48:56 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id B19BA2C8002
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 11:36:51 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2016 18:51:11 +0200
Message-Id: <3399a6a144dd1c41b71e6362f811936ff2a73ff3.1453222163.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1453222163.git.ed.bartosh@linux.intel.com>
References: <cover.1453222163.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1453222163.git.ed.bartosh@linux.intel.com>
References: <cover.1453222163.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH v2 9/9] wic: pylinted ksparser module
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
X-List-Received-Date: Tue, 19 Jan 2016 18:49:00 -0000

Added missing docstrings, fixed wrong indentation and long lines.
Final pylint score is 9.89/10

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/ksparser.py | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 3722799..f2a0e04 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -21,9 +21,9 @@
 # This module provides parser for kickstart format
 #
 # AUTHORS
-# Tom Zanussi <tom.zanussi (at] linux.intel.com>
 # Ed Bartosh <ed.bartosh> (at] linux.intel.com>
 
+"""Kickstart parser module."""
 
 import os
 import shlex
@@ -33,6 +33,7 @@ from wic.partition import Partition
 from wic.utils.misc import find_canned
 
 class KickStartError(Exception):
+    """Custom exception."""
     pass
 
 class KickStartParser(ArgumentParser):
@@ -91,6 +92,8 @@ def cannedpathtype(arg):
     return result
 
 class KickStart(object):
+    """"Kickstart parser implementation."""
+
     def __init__(self, confpath):
 
         self.partitions = []
@@ -134,6 +137,9 @@ class KickStart(object):
         self._parse(parser, confpath)
 
     def _parse(self, parser, confpath):
+        """
+        Parse file in .wks format using provided parser.
+        """
         with open(confpath) as conf:
             lineno = 0
             for line in conf:
@@ -152,7 +158,8 @@ class KickStart(object):
                         self._parse(parser, parsed.path)
                     elif line.startswith('bootloader'):
                         if not self.bootloader:
-                             self.bootloader = parsed
+                            self.bootloader = parsed
                         else:
-                             raise KickStartError("%s:%d: more than one bootloader "\
-                                                  "specified" % (confpath, lineno))
+                            err = "%s:%d: more than one bootloader specified" \
+                                      % (confpath, lineno)
+                            raise KickStartError(err)
-- 
2.1.4


