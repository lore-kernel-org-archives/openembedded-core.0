Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.8843.1624975709614922192
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jun 2021 07:08:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iC3h45mB;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id mn20-20020a17090b1894b02901707fc074e8so2006475pjb.0
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Jun 2021 07:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Eg9KFpBteasb+TDo4XJME+9QMqnw5OPAKZbJJTWUclA=;
        b=iC3h45mBhC4LqgJGCJEVig2wqYn0vuAJcBJ1HwJEE3CBj6YRtdUi94HtVHJDhw/u0n
         SCIN8Yo8AUr6lWMkgGkffrzkFy1xFYEbiBQgsEfqmdQhHNjlXBfmuafKWAJWRDsKvwYv
         RlbjZdybPB5AFz0Sl9EZy992eMuDOB8b7nbUWhuLRErwnUV15Wps/bJZgF0immPyfhAF
         MSCG5oO4C5FHP7xNZiyWZBRNOVNnskvcBFd0oTXuqvVOIdRfDJwxWX80TIZ3JsSaQjad
         eU2MQverTkf5E2vvNazJ3IpkKXWWKZbnoYBBS45kIoC7EqqSqJ27p3QPMOlfbzT/jBet
         MeDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Eg9KFpBteasb+TDo4XJME+9QMqnw5OPAKZbJJTWUclA=;
        b=Uo+4a81jhk4PnggQucku06jxb56riCcN+DEbA1Zz2e/HTepuuZ0Mjx/CsHFOGbzzwn
         MsKtviR3fSDajuNYjKfD6feb5RDEjHSPt55T+mWVxrC7PmA89LSVkNJrkQ2KzOSZN9wP
         lNpe0iyD95p6Wd1XkyqTQRXy6Jc9Ah7hidc+4yb9lhTA5TBepQQsRgMjkDFkeifjTZYS
         rv8orLAQY8ITcFEiacxvcJ/Ds2J86PVgWDqUJZ8eWAEjBBlv/s19sVDQ4aNLpWC5S+xk
         A6sXsOakjL5g5MoZH2WntbU+P/T/OiMhxdy1U4EJqp9IFtQ8Iqfm0VqdKe7tyV5muq6S
         9i7g==
X-Gm-Message-State: AOAM532euCPUm83cMOUJlRkm5XufkAP/FJyD9zOjMCTuDe0L1NEzmHLO
	HpHBrLcRfK3PgsfuO0vIj8auYzPiSS7z1Q==
X-Google-Smtp-Source: ABdhPJziC5st7H1k+eeKNDeRIzjTgZsYqA5ZqMcDBEGi4ziZdIriuLryLIzbvK+oeDlwYly/SS8/zg==
X-Received: by 2002:a17:902:db0d:b029:127:98e9:c279 with SMTP id m13-20020a170902db0db029012798e9c279mr27900399plx.0.1624975708983;
        Tue, 29 Jun 2021 07:08:28 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:3418:5ced:5b3e:373c])
        by smtp.gmail.com with ESMTPSA id h1sm3383373pji.14.2021.06.29.07.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jun 2021 07:08:28 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: persianpros <persianpros@yahoo.com>
Subject: [PATCH 1/8] PEP8 double aggressive E401
Date: Tue, 29 Jun 2021 07:08:19 -0700
Message-Id: <20210629140826.13243-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210629140826.13243-1-akuster808@gmail.com>
References: <20210629140826.13243-1-akuster808@gmail.com>

From: persianpros <persianpros@yahoo.com>

Hello,

I am forwarding the patches from a a pull request 

https://github.com/openembedded/openembedded-core/pull/71

This help the python scripts conform to PEP8 standards.

If you have any question , please contact the author.

-armin

---
 meta/lib/oe/package.py                                |  9 +++++++--
 meta/lib/oe/qa.py                                     |  4 +++-
 meta/lib/oe/utils.py                                  |  6 ++++--
 meta/lib/oeqa/oetest.py                               |  4 +++-
 meta/lib/oeqa/sdk/case.py                             |  3 ++-
 meta/lib/oeqa/sdk/cases/buildlzip.py                  |  5 ++++-
 meta/lib/oeqa/sdk/cases/python.py                     |  3 ++-
 meta/lib/oeqa/sdk/testsdk.py                          |  3 ++-
 meta/lib/oeqa/selftest/cases/oelib/path.py            |  3 ++-
 meta/lib/oeqa/selftest/cases/package.py               |  7 +++++--
 meta/lib/oeqa/selftest/cases/runtime_test.py          |  3 ++-
 meta/lib/oeqa/utils/testexport.py                     |  6 +++++-
 .../texinfo-dummy-native/texinfo-dummy/template.py    |  4 +++-
 scripts/combo-layer                                   |  3 ++-
 scripts/contrib/patchreview.py                        | 11 ++++++++---
 scripts/lnr                                           |  3 ++-
 scripts/oe-pkgdata-browser                            |  5 ++++-
 .../pybootchartgui/tests/parser_test.py               |  7 ++++++-
 scripts/send-error-report                             |  3 ++-
 scripts/verify-bashisms                               |  9 +++++++--
 20 files changed, 75 insertions(+), 26 deletions(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index dd700cbb0c..fc5408d5f8 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -107,7 +107,10 @@ def strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, d, qa_already_stripp
     :param qa_already_stripped: Set to True if already-stripped' in ${INSANE_SKIP}
     This is for proper logging and messages only.
     """
-    import stat, errno, oe.path, oe.utils
+    import stat
+    import errno
+    import oe.path
+    import oe.utils
 
     elffiles = {}
     inodes = {}
@@ -187,7 +190,9 @@ def file_translate(file):
     return ft
 
 def filedeprunner(arg):
-    import re, subprocess, shlex
+    import re
+    import subprocess
+    import shlex
 
     (pkg, pkgfiles, rpmdeps, pkgdest) = arg
     provides = {}
diff --git a/meta/lib/oe/qa.py b/meta/lib/oe/qa.py
index e8a854a302..38c2e0cc1c 100644
--- a/meta/lib/oe/qa.py
+++ b/meta/lib/oe/qa.py
@@ -2,7 +2,9 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
-import os, struct, mmap
+import os
+import struct
+import mmap
 
 class NotELFFileError(Exception):
     pass
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index a84039f585..789bad33f6 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -376,7 +376,8 @@ def format_pkg_list(pkg_dict, ret_format=None):
 # Helper function to get the host compiler version
 # Do not assume the compiler is gcc
 def get_host_compiler_version(d, taskcontextonly=False):
-    import re, subprocess
+    import re
+    import subprocess
 
     if taskcontextonly and d.getVar('BB_WORKERCONTEXT') != '1':
         return
@@ -404,7 +405,8 @@ def get_host_compiler_version(d, taskcontextonly=False):
 
 
 def host_gcc_version(d, taskcontextonly=False):
-    import re, subprocess
+    import re
+    import subprocess
 
     if taskcontextonly and d.getVar('BB_WORKERCONTEXT') != '1':
         return
diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index 9c84466dd0..3136ac2ce5 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -9,7 +9,9 @@
 
 # It also has some helper functions and it's responsible for actually starting the tests
 
-import os, re, sys
+import os
+import re
+import sys
 import unittest
 import inspect
 import subprocess
diff --git a/meta/lib/oeqa/sdk/case.py b/meta/lib/oeqa/sdk/case.py
index c45882689c..86ac199197 100644
--- a/meta/lib/oeqa/sdk/case.py
+++ b/meta/lib/oeqa/sdk/case.py
@@ -35,7 +35,8 @@ class OESDKTestCase(OETestCase):
         OS/architecture, or if not specified the currently configured MACHINE's
         OS/architecture.
         """
-        import oe.qa, oe.elf
+        import oe.qa
+        import oe.elf
 
         if not target_os or not target_arch:
             output = self._run("echo $OECORE_TARGET_OS:$OECORE_TARGET_ARCH")
diff --git a/meta/lib/oeqa/sdk/cases/buildlzip.py b/meta/lib/oeqa/sdk/cases/buildlzip.py
index 49ae756bf3..04c4a0ec16 100644
--- a/meta/lib/oeqa/sdk/cases/buildlzip.py
+++ b/meta/lib/oeqa/sdk/cases/buildlzip.py
@@ -2,7 +2,10 @@
 # SPDX-License-Identifier: MIT
 #
 
-import os, tempfile, subprocess, unittest
+import os
+import tempfile
+import subprocess
+import unittest
 from oeqa.sdk.case import OESDKTestCase
 from oeqa.utils.subprocesstweak import errors_have_output
 errors_have_output()
diff --git a/meta/lib/oeqa/sdk/cases/python.py b/meta/lib/oeqa/sdk/cases/python.py
index a334abce5f..2848481f33 100644
--- a/meta/lib/oeqa/sdk/cases/python.py
+++ b/meta/lib/oeqa/sdk/cases/python.py
@@ -2,7 +2,8 @@
 # SPDX-License-Identifier: MIT
 #
 
-import subprocess, unittest
+import subprocess
+import unittest
 from oeqa.sdk.case import OESDKTestCase
 
 from oeqa.utils.subprocesstweak import errors_have_output
diff --git a/meta/lib/oeqa/sdk/testsdk.py b/meta/lib/oeqa/sdk/testsdk.py
index 35e40187bc..18e03cb8ef 100644
--- a/meta/lib/oeqa/sdk/testsdk.py
+++ b/meta/lib/oeqa/sdk/testsdk.py
@@ -95,7 +95,8 @@ class TestSDK(TestSDKBase):
         processes = d.getVar("TESTIMAGE_NUMBER_THREADS") or d.getVar("BB_NUMBER_THREADS")
         if processes:
             try:
-                import testtools, subunit
+                import testtools
+                import subunit
             except ImportError:
                 bb.warn("Failed to import testtools or subunit, the testcases will run serially")
                 processes = None
diff --git a/meta/lib/oeqa/selftest/cases/oelib/path.py b/meta/lib/oeqa/selftest/cases/oelib/path.py
index a1cfa08c09..098734fa5d 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/path.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/path.py
@@ -3,7 +3,8 @@
 #
 
 from unittest.case import TestCase
-import oe, oe.path
+import oe
+import oe.path
 import tempfile
 import os
 import errno
diff --git a/meta/lib/oeqa/selftest/cases/package.py b/meta/lib/oeqa/selftest/cases/package.py
index 7166c3991f..82aa1bde1c 100644
--- a/meta/lib/oeqa/selftest/cases/package.py
+++ b/meta/lib/oeqa/selftest/cases/package.py
@@ -5,7 +5,8 @@
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake, get_bb_vars, get_bb_var, runqemu
 import stat
-import subprocess, os
+import subprocess
+import os
 import oe.path
 import re
 
@@ -150,7 +151,9 @@ class PackageTests(OESelftestTestCase):
                     self.fail('GDB %s failed' % binary)
 
     def test_preserve_ownership(self):
-        import os, stat, oe.cachedpath
+        import os
+        import stat
+        import oe.cachedpath
         features = 'IMAGE_INSTALL_append = " selftest-chown"\n'
         self.write_config(features)
         bitbake("core-image-minimal")
diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index d0c2440722..54a80dfdc0 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -211,7 +211,8 @@ class TestImage(OESelftestTestCase):
         Product: oe-core
         Author: Alexander Kanavin <alex.kanavin@gmail.com>
         """
-        import subprocess, os
+        import subprocess
+        import os
         try:
             content = os.listdir("/dev/dri")
             if len([i for i in content if i.startswith('render')]) == 0:
diff --git a/meta/lib/oeqa/utils/testexport.py b/meta/lib/oeqa/utils/testexport.py
index e89d130a9c..383e57a6b2 100644
--- a/meta/lib/oeqa/utils/testexport.py
+++ b/meta/lib/oeqa/utils/testexport.py
@@ -6,7 +6,11 @@
 
 # Provides functions to help with exporting binaries obtained from built targets
 
-import os, re, glob as g, shutil as sh,sys
+import os
+import re
+import glob as g
+import shutil as sh
+import sys
 from time import sleep
 from .commands import runCmd
 from difflib import SequenceMatcher as SM
diff --git a/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/template.py b/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/template.py
index 86c7c1811a..75c01b83bf 100644
--- a/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/template.py
+++ b/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/template.py
@@ -28,7 +28,9 @@
 # of the executable from argv[0] and emulate the corresponding program, so
 # multiple copies of this script will exist under different names.
 
-import sys, os, argparse
+import sys
+import os
+import argparse
 
 
 this_binary = sys.argv[0].split("/")[-1]
diff --git a/scripts/combo-layer b/scripts/combo-layer
index 045de65642..835a6bcd09 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -11,7 +11,8 @@
 #
 
 import fnmatch
-import os, sys
+import os
+import sys
 import optparse
 import logging
 import subprocess
diff --git a/scripts/contrib/patchreview.py b/scripts/contrib/patchreview.py
index 62c509f51c..744dcfb49e 100755
--- a/scripts/contrib/patchreview.py
+++ b/scripts/contrib/patchreview.py
@@ -40,7 +40,8 @@ def blame_patch(patch):
                                     "--", patch)).decode("utf-8").splitlines()
 
 def patchreview(path, patches):
-    import re, os.path
+    import re
+    import os.path
 
     # General pattern: start of line, optional whitespace, tag with optional
     # hyphen or spaces, maybe a colon, some whitespace, then the value, all case
@@ -198,7 +199,9 @@ def histogram(results):
 
 
 if __name__ == "__main__":
-    import argparse, subprocess, os
+    import argparse
+    import subprocess
+    import os
 
     args = argparse.ArgumentParser(description="Patch Review Tool")
     args.add_argument("-b", "--blame", action="store_true", help="show blame for malformed patches")
@@ -213,7 +216,9 @@ if __name__ == "__main__":
     analyse(results, want_blame=args.blame, verbose=args.verbose)
 
     if args.json:
-        import json, os.path, collections
+        import json
+        import os.path
+        import collections
         if os.path.isfile(args.json):
             data = json.load(open(args.json))
         else:
diff --git a/scripts/lnr b/scripts/lnr
index a2ac4fec0f..e223b1e0e6 100755
--- a/scripts/lnr
+++ b/scripts/lnr
@@ -6,7 +6,8 @@
 # Create a *relative* symlink, just like ln --relative does but without needing
 # coreutils 8.16.
 
-import sys, os
+import sys
+import os
 
 if len(sys.argv) != 3:
    print("$ lnr TARGET LINK_NAME")
diff --git a/scripts/oe-pkgdata-browser b/scripts/oe-pkgdata-browser
index 8d223185a4..5834f59845 100755
--- a/scripts/oe-pkgdata-browser
+++ b/scripts/oe-pkgdata-browser
@@ -1,6 +1,9 @@
 #! /usr/bin/env python3
 
-import os, sys, enum, ast
+import os
+import sys
+import enum
+import ast
 
 scripts_path = os.path.dirname(os.path.realpath(__file__))
 lib_path = scripts_path + '/lib'
diff --git a/scripts/pybootchartgui/pybootchartgui/tests/parser_test.py b/scripts/pybootchartgui/pybootchartgui/tests/parser_test.py
index 00fb3bf797..c005cf341f 100644
--- a/scripts/pybootchartgui/pybootchartgui/tests/parser_test.py
+++ b/scripts/pybootchartgui/pybootchartgui/tests/parser_test.py
@@ -1,4 +1,9 @@
-import sys, os, re, struct, operator, math
+import sys
+import os
+import re
+import struct
+import operator
+import math
 from collections import defaultdict
 import unittest
 
diff --git a/scripts/send-error-report b/scripts/send-error-report
index cfbcaa52cb..ffa0a199b1 100755
--- a/scripts/send-error-report
+++ b/scripts/send-error-report
@@ -10,7 +10,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
-import urllib.request, urllib.error
+import urllib.request
+import urllib.error
 import sys
 import json
 import os
diff --git a/scripts/verify-bashisms b/scripts/verify-bashisms
index 14d8c298e9..a63f6c8115 100755
--- a/scripts/verify-bashisms
+++ b/scripts/verify-bashisms
@@ -3,7 +3,11 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
-import sys, os, subprocess, re, shutil
+import sys
+import os
+import subprocess
+import re
+import shutil
 
 whitelist = (
     # type is supported by dash
@@ -92,7 +96,8 @@ def get_tinfoil():
     return tinfoil
 
 if __name__=='__main__':
-    import argparse, shutil
+    import argparse
+    import shutil
 
     parser = argparse.ArgumentParser(description='Bashim detector for shell fragments in recipes.')
     parser.add_argument("recipes", metavar="RECIPE", nargs="*", help="recipes to check (if not specified, all will be checked)")
-- 
2.17.1

