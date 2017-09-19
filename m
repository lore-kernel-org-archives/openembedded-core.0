Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2FF2F77DC8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 03:57:20 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Sep 2017 20:57:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,416,1500966000"; d="scan'208";a="150737045"
Received: from thau-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.71.87])
	by orsmga005.jf.intel.com with ESMTP; 18 Sep 2017 20:57:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Sep 2017 15:57:07 +1200
Message-Id: <052822083c17d3dee526e9197c38b428bf40673d.1505792710.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1505792710.git.paul.eggleton@linux.intel.com>
References: <cover.1505792710.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] scripts: rename yocto-compat-layer to remove "compatible" nomenclature
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
X-List-Received-Date: Tue, 19 Sep 2017 03:57:21 -0000

"Yocto Project Compatible" [1] is a programme which requires you meet
specific criteria including going through an application process - it is
not sufficient simply to run the script we have created here and have it
produce no warnings/errors. To avoid people being confused by the fact
that this script uses the term "compatible" or variations thereof,
substitute usage of that word with "check" instead. The functionality of
the script is unchanged.

[1] https://www.yoctoproject.org/ecosystem/yocto-project-branding-program

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/{compatlayer => checklayer}/__init__.py  |  2 +-
 scripts/lib/{compatlayer => checklayer}/case.py      |  2 +-
 .../{compatlayer => checklayer}/cases/__init__.py    |  0
 scripts/lib/{compatlayer => checklayer}/cases/bsp.py | 10 +++++-----
 .../lib/{compatlayer => checklayer}/cases/common.py  |  6 +++---
 .../lib/{compatlayer => checklayer}/cases/distro.py  |  8 ++++----
 scripts/lib/{compatlayer => checklayer}/context.py   |  4 ++--
 scripts/{yocto-compat-layer.py => yocto-check-layer} | 20 ++++++++++----------
 ...ompat-layer-wrapper => yocto-check-layer-wrapper} | 10 +++++-----
 9 files changed, 31 insertions(+), 31 deletions(-)
 rename scripts/lib/{compatlayer => checklayer}/__init__.py (99%)
 rename scripts/lib/{compatlayer => checklayer}/case.py (77%)
 rename scripts/lib/{compatlayer => checklayer}/cases/__init__.py (100%)
 rename scripts/lib/{compatlayer => checklayer}/cases/bsp.py (96%)
 rename scripts/lib/{compatlayer => checklayer}/cases/common.py (91%)
 rename scripts/lib/{compatlayer => checklayer}/cases/distro.py (77%)
 rename scripts/lib/{compatlayer => checklayer}/context.py (77%)
 rename scripts/{yocto-compat-layer.py => yocto-check-layer} (91%)
 rename scripts/{yocto-compat-layer-wrapper => yocto-check-layer-wrapper} (73%)

diff --git a/scripts/lib/compatlayer/__init__.py b/scripts/lib/checklayer/__init__.py
similarity index 99%
rename from scripts/lib/compatlayer/__init__.py
rename to scripts/lib/checklayer/__init__.py
index 7197e85..6c2b86a 100644
--- a/scripts/lib/compatlayer/__init__.py
+++ b/scripts/lib/checklayer/__init__.py
@@ -1,4 +1,4 @@
-# Yocto Project compatibility layer tool
+# Yocto Project layer check tool
 #
 # Copyright (C) 2017 Intel Corporation
 # Released under the MIT license (see COPYING.MIT)
diff --git a/scripts/lib/compatlayer/case.py b/scripts/lib/checklayer/case.py
similarity index 77%
rename from scripts/lib/compatlayer/case.py
rename to scripts/lib/checklayer/case.py
index 54ce78a..9dd0041 100644
--- a/scripts/lib/compatlayer/case.py
+++ b/scripts/lib/checklayer/case.py
@@ -3,5 +3,5 @@
 
 from oeqa.core.case import OETestCase
 
-class OECompatLayerTestCase(OETestCase):
+class OECheckLayerTestCase(OETestCase):
     pass
diff --git a/scripts/lib/compatlayer/cases/__init__.py b/scripts/lib/checklayer/cases/__init__.py
similarity index 100%
rename from scripts/lib/compatlayer/cases/__init__.py
rename to scripts/lib/checklayer/cases/__init__.py
diff --git a/scripts/lib/compatlayer/cases/bsp.py b/scripts/lib/checklayer/cases/bsp.py
similarity index 96%
rename from scripts/lib/compatlayer/cases/bsp.py
rename to scripts/lib/checklayer/cases/bsp.py
index 43efae4..b6b611b 100644
--- a/scripts/lib/compatlayer/cases/bsp.py
+++ b/scripts/lib/checklayer/cases/bsp.py
@@ -3,14 +3,14 @@
 
 import unittest
 
-from compatlayer import LayerType, get_signatures, check_command, get_depgraph
-from compatlayer.case import OECompatLayerTestCase
+from checklayer import LayerType, get_signatures, check_command, get_depgraph
+from checklayer.case import OECheckLayerTestCase
 
-class BSPCompatLayer(OECompatLayerTestCase):
+class BSPCheckLayer(OECheckLayerTestCase):
     @classmethod
     def setUpClass(self):
         if self.tc.layer['type'] != LayerType.BSP:
-            raise unittest.SkipTest("BSPCompatLayer: Layer %s isn't BSP one." %\
+            raise unittest.SkipTest("BSPCheckLayer: Layer %s isn't BSP one." %\
                 self.tc.layer['name'])
 
     def test_bsp_defines_machines(self):
@@ -62,7 +62,7 @@ class BSPCompatLayer(OECompatLayerTestCase):
         This criteria can only be tested by testing different machines in combination,
         i.e. one main layer, potentially several additional BSP layers and an explicit
         choice of machines:
-        yocto-compat-layer --additional-layers .../meta-intel --machines intel-corei7-64 imx6slevk -- .../meta-freescale
+        yocto-check-layer --additional-layers .../meta-intel --machines intel-corei7-64 imx6slevk -- .../meta-freescale
         '''
 
         if not self.td['machines']:
diff --git a/scripts/lib/compatlayer/cases/common.py b/scripts/lib/checklayer/cases/common.py
similarity index 91%
rename from scripts/lib/compatlayer/cases/common.py
rename to scripts/lib/checklayer/cases/common.py
index 55e8ba4..a13c108 100644
--- a/scripts/lib/compatlayer/cases/common.py
+++ b/scripts/lib/checklayer/cases/common.py
@@ -4,10 +4,10 @@
 import glob
 import os
 import unittest
-from compatlayer import get_signatures, LayerType, check_command, get_depgraph, compare_signatures
-from compatlayer.case import OECompatLayerTestCase
+from checklayer import get_signatures, LayerType, check_command, get_depgraph, compare_signatures
+from checklayer.case import OECheckLayerTestCase
 
-class CommonCompatLayer(OECompatLayerTestCase):
+class CommonCheckLayer(OECheckLayerTestCase):
     def test_readme(self):
         # The top-level README file may have a suffix (like README.rst or README.txt).
         readme_files = glob.glob(os.path.join(self.tc.layer['path'], 'README*'))
diff --git a/scripts/lib/compatlayer/cases/distro.py b/scripts/lib/checklayer/cases/distro.py
similarity index 77%
rename from scripts/lib/compatlayer/cases/distro.py
rename to scripts/lib/checklayer/cases/distro.py
index 523acc1..df1b303 100644
--- a/scripts/lib/compatlayer/cases/distro.py
+++ b/scripts/lib/checklayer/cases/distro.py
@@ -3,14 +3,14 @@
 
 import unittest
 
-from compatlayer import LayerType
-from compatlayer.case import OECompatLayerTestCase
+from checklayer import LayerType
+from checklayer.case import OECheckLayerTestCase
 
-class DistroCompatLayer(OECompatLayerTestCase):
+class DistroCheckLayer(OECheckLayerTestCase):
     @classmethod
     def setUpClass(self):
         if self.tc.layer['type'] != LayerType.DISTRO:
-            raise unittest.SkipTest("DistroCompatLayer: Layer %s isn't Distro one." %\
+            raise unittest.SkipTest("DistroCheckLayer: Layer %s isn't Distro one." %\
                 self.tc.layer['name'])
 
     def test_distro_defines_distros(self):
diff --git a/scripts/lib/compatlayer/context.py b/scripts/lib/checklayer/context.py
similarity index 77%
rename from scripts/lib/compatlayer/context.py
rename to scripts/lib/checklayer/context.py
index 7811d4a..1bec2c4 100644
--- a/scripts/lib/compatlayer/context.py
+++ b/scripts/lib/checklayer/context.py
@@ -8,8 +8,8 @@ import re
 
 from oeqa.core.context import OETestContext
 
-class CompatLayerTestContext(OETestContext):
+class CheckLayerTestContext(OETestContext):
     def __init__(self, td=None, logger=None, layer=None, test_software_layer_signatures=True):
-        super(CompatLayerTestContext, self).__init__(td, logger)
+        super(CheckLayerTestContext, self).__init__(td, logger)
         self.layer = layer
         self.test_software_layer_signatures = test_software_layer_signatures
diff --git a/scripts/yocto-compat-layer.py b/scripts/yocto-check-layer
similarity index 91%
rename from scripts/yocto-compat-layer.py
rename to scripts/yocto-check-layer
index 9a541c6..5a4fd75 100755
--- a/scripts/yocto-compat-layer.py
+++ b/scripts/yocto-check-layer
@@ -1,6 +1,6 @@
 #!/usr/bin/env python3
 
-# Yocto Project compatibility layer tool
+# Yocto Project layer checking tool
 #
 # Copyright (C) 2017 Intel Corporation
 # Released under the MIT license (see COPYING.MIT)
@@ -22,29 +22,29 @@ import scriptpath
 scriptpath.add_oe_lib_path()
 scriptpath.add_bitbake_lib_path()
 
-from compatlayer import LayerType, detect_layers, add_layer, add_layer_dependencies, get_signatures
+from checklayer import LayerType, detect_layers, add_layer, add_layer_dependencies, get_signatures
 from oeqa.utils.commands import get_bb_vars
 
-PROGNAME = 'yocto-compat-layer'
+PROGNAME = 'yocto-check-layer'
 CASES_PATHS = [os.path.join(os.path.abspath(os.path.dirname(__file__)),
-                'lib', 'compatlayer', 'cases')]
+                'lib', 'checklayer', 'cases')]
 logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
-def test_layer_compatibility(td, layer, test_software_layer_signatures):
-    from compatlayer.context import CompatLayerTestContext
+def test_layer(td, layer, test_software_layer_signatures):
+    from checklayer.context import CheckLayerTestContext
     logger.info("Starting to analyze: %s" % layer['name'])
     logger.info("----------------------------------------------------------------------")
 
-    tc = CompatLayerTestContext(td=td, logger=logger, layer=layer, test_software_layer_signatures=test_software_layer_signatures)
+    tc = CheckLayerTestContext(td=td, logger=logger, layer=layer, test_software_layer_signatures=test_software_layer_signatures)
     tc.loadTests(CASES_PATHS)
     return tc.runTests()
 
 def main():
     parser = argparse.ArgumentParser(
-            description="Yocto Project compatibility layer tool",
+            description="Yocto Project layer checking tool",
             add_help=False)
     parser.add_argument('layers', metavar='LAYER_DIR', nargs='+',
-            help='Layer to test compatibility with Yocto Project')
+            help='Layer to check')
     parser.add_argument('-o', '--output-log',
             help='File to output log (optional)', action='store')
     parser.add_argument('--dependency', nargs="+",
@@ -179,7 +179,7 @@ def main():
             layers_tested = layers_tested + 1
             continue
 
-        result = test_layer_compatibility(td, layer, args.test_software_layer_signatures)
+        result = test_layer(td, layer, args.test_software_layer_signatures)
         results[layer['name']] = result
         results_status[layer['name']] = 'PASS' if results[layer['name']].wasSuccessful() else 'FAIL'
         layers_tested = layers_tested + 1
diff --git a/scripts/yocto-compat-layer-wrapper b/scripts/yocto-check-layer-wrapper
similarity index 73%
rename from scripts/yocto-compat-layer-wrapper
rename to scripts/yocto-check-layer-wrapper
index b6baeb4..bbf6ee1 100755
--- a/scripts/yocto-compat-layer-wrapper
+++ b/scripts/yocto-check-layer-wrapper
@@ -1,8 +1,8 @@
 #!/usr/bin/env bash
 
-# Yocto Project compatibility layer tool wrapper
+# Yocto Project layer check tool wrapper
 #
-# Creates a temprary build directory to run Yocto Project Compatible
+# Creates a temporary build directory to run the yocto-check-layer
 # script to avoid a contaminated environment.
 #
 # Copyright (C) 2017 Intel Corporation
@@ -24,7 +24,7 @@ do
 done
 shift $(($OPTIND - 1))
 
-# generate a temp directory to run compat layer script
+# generate a temp directory to run check layer script
 base_dir=$(realpath $BUILDDIR/../)
 cd $base_dir
 
@@ -32,9 +32,9 @@ build_dir=$(mktemp -p $base_dir -d -t build-XXXX)
 
 source oe-init-build-env $build_dir
 if [[ $output_log != '' ]]; then
-	yocto-compat-layer.py -o "$output_log" "$*"
+	yocto-check-layer -o "$output_log" "$*"
 else
-	yocto-compat-layer.py "$@"
+	yocto-check-layer "$@"
 fi
 retcode=$?
 
-- 
2.9.5


