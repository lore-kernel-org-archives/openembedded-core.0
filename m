Return-Path: <tom.zanussi@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5EC2070A78
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Aug 2014 22:08:07 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 08 Aug 2014 15:07:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,827,1400050800"; d="scan'208";a="582200800"
Received: from unknown (HELO localhost) ([10.255.12.19])
	by fmsmga002.fm.intel.com with ESMTP; 08 Aug 2014 15:07:19 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Aug 2014 17:05:59 -0500
Message-Id: <ec4584d32490da9871f7ad4816503623b7801d89.1407533201.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <116ccc6f7ce3e70924e3fae56b24ff9e0914bde2.1407533201.git.tom.zanussi@linux.intel.com>
References: <116ccc6f7ce3e70924e3fae56b24ff9e0914bde2.1407533201.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1407533201.git.tom.zanussi@linux.intel.com>
References: <cover.1407533201.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 34/35] wic: Rename /mic to /wic
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
X-List-Received-Date: Fri, 08 Aug 2014 22:08:08 -0000

As well as any other stray instances of mic in the codebase that can
be removed.

We don't really need to carry around legacy naming, and the history is
in git.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/image/engine.py                          | 12 ++++++------
 scripts/lib/image/help.py                            |  8 ++++----
 .../{mic => wic}/3rdparty/pykickstart/__init__.py    |  0
 .../lib/{mic => wic}/3rdparty/pykickstart/base.py    |  0
 .../3rdparty/pykickstart/commands/__init__.py        |  0
 .../3rdparty/pykickstart/commands/bootloader.py      |  0
 .../3rdparty/pykickstart/commands/partition.py       |  0
 .../{mic => wic}/3rdparty/pykickstart/constants.py   |  0
 .../lib/{mic => wic}/3rdparty/pykickstart/errors.py  |  0
 .../3rdparty/pykickstart/handlers/__init__.py        |  0
 .../3rdparty/pykickstart/handlers/control.py         |  0
 .../3rdparty/pykickstart/handlers/f16.py             |  0
 scripts/lib/{mic => wic}/3rdparty/pykickstart/ko.py  |  0
 .../lib/{mic => wic}/3rdparty/pykickstart/options.py |  0
 .../lib/{mic => wic}/3rdparty/pykickstart/parser.py  |  0
 .../{mic => wic}/3rdparty/pykickstart/sections.py    |  0
 .../lib/{mic => wic}/3rdparty/pykickstart/version.py |  0
 scripts/lib/{mic => wic}/__init__.py                 |  0
 scripts/lib/{mic => wic}/__version__.py              |  0
 scripts/lib/{mic => wic}/conf.py                     | 12 ++++++------
 scripts/lib/{mic => wic}/creator.py                  | 12 ++++++------
 scripts/lib/{mic => wic}/imager/__init__.py          |  0
 scripts/lib/{mic => wic}/imager/baseimager.py        | 10 +++++-----
 scripts/lib/{mic => wic}/imager/direct.py            | 17 ++++++++---------
 scripts/lib/{mic => wic}/kickstart/__init__.py       |  4 ++--
 .../kickstart/custom_commands/__init__.py            |  0
 .../kickstart/custom_commands/micboot.py             |  0
 .../kickstart/custom_commands/micpartition.py        |  0
 .../kickstart/custom_commands/partition.py           |  6 +++---
 .../kickstart/custom_commands/wicboot.py             |  2 +-
 scripts/lib/{mic => wic}/msger.py                    |  0
 scripts/lib/{mic => wic}/plugin.py                   | 16 ++++++++--------
 scripts/lib/{mic => wic}/pluginbase.py               | 20 ++++++++++----------
 .../lib/{mic => wic}/plugins/imager/direct_plugin.py | 15 +++++++--------
 .../lib/{mic => wic}/plugins/source/bootimg-efi.py   | 16 ++++++++--------
 .../{mic => wic}/plugins/source/bootimg-pcbios.py    | 16 ++++++++--------
 scripts/lib/{mic => wic}/plugins/source/rootfs.py    | 16 ++++++++--------
 scripts/lib/{mic => wic}/test                        |  0
 scripts/lib/{mic => wic}/utils/__init__.py           |  0
 scripts/lib/{mic => wic}/utils/cmdln.py              |  0
 scripts/lib/{mic => wic}/utils/errors.py             |  0
 scripts/lib/{mic => wic}/utils/fs_related.py         |  8 ++++----
 scripts/lib/{mic => wic}/utils/misc.py               |  0
 scripts/lib/{mic => wic}/utils/oe/__init__.py        |  2 +-
 scripts/lib/{mic => wic}/utils/oe/misc.py            |  6 +++---
 scripts/lib/{mic => wic}/utils/partitionedfs.py      | 10 +++++-----
 scripts/lib/{mic => wic}/utils/runner.py             |  2 +-
 47 files changed, 104 insertions(+), 106 deletions(-)
 rename scripts/lib/{mic => wic}/3rdparty/pykickstart/__init__.py (100%)
 rename scripts/lib/{mic => wic}/3rdparty/pykickstart/base.py (100%)
 rename scripts/lib/{mic => wic}/3rdparty/pykickstart/commands/__init__.py (100%)
 rename scripts/lib/{mic => wic}/3rdparty/pykickstart/commands/bootloader.py (100%)
 rename scripts/lib/{mic => wic}/3rdparty/pykickstart/commands/partition.py (100%)
 rename scripts/lib/{mic => wic}/3rdparty/pykickstart/constants.py (100%)
 rename scripts/lib/{mic => wic}/3rdparty/pykickstart/errors.py (100%)
 rename scripts/lib/{mic => wic}/3rdparty/pykickstart/handlers/__init__.py (100%)
 rename scripts/lib/{mic => wic}/3rdparty/pykickstart/handlers/control.py (100%)
 rename scripts/lib/{mic => wic}/3rdparty/pykickstart/handlers/f16.py (100%)
 rename scripts/lib/{mic => wic}/3rdparty/pykickstart/ko.py (100%)
 rename scripts/lib/{mic => wic}/3rdparty/pykickstart/options.py (100%)
 rename scripts/lib/{mic => wic}/3rdparty/pykickstart/parser.py (100%)
 rename scripts/lib/{mic => wic}/3rdparty/pykickstart/sections.py (100%)
 rename scripts/lib/{mic => wic}/3rdparty/pykickstart/version.py (100%)
 rename scripts/lib/{mic => wic}/__init__.py (100%)
 rename scripts/lib/{mic => wic}/__version__.py (100%)
 rename scripts/lib/{mic => wic}/conf.py (93%)
 rename scripts/lib/{mic => wic}/creator.py (96%)
 rename scripts/lib/{mic => wic}/imager/__init__.py (100%)
 rename scripts/lib/{mic => wic}/imager/baseimager.py (96%)
 rename scripts/lib/{mic => wic}/imager/direct.py (96%)
 rename scripts/lib/{mic => wic}/kickstart/__init__.py (98%)
 rename scripts/lib/{mic => wic}/kickstart/custom_commands/__init__.py (100%)
 rename scripts/lib/{mic => wic}/kickstart/custom_commands/micboot.py (100%)
 rename scripts/lib/{mic => wic}/kickstart/custom_commands/micpartition.py (100%)
 rename scripts/lib/{mic => wic}/kickstart/custom_commands/partition.py (99%)
 rename scripts/lib/{mic => wic}/kickstart/custom_commands/wicboot.py (97%)
 rename scripts/lib/{mic => wic}/msger.py (100%)
 rename scripts/lib/{mic => wic}/plugin.py (94%)
 rename scripts/lib/{mic => wic}/pluginbase.py (88%)
 rename scripts/lib/{mic => wic}/plugins/imager/direct_plugin.py (89%)
 rename scripts/lib/{mic => wic}/plugins/source/bootimg-efi.py (94%)
 rename scripts/lib/{mic => wic}/plugins/source/bootimg-pcbios.py (95%)
 rename scripts/lib/{mic => wic}/plugins/source/rootfs.py (90%)
 rename scripts/lib/{mic => wic}/test (100%)
 rename scripts/lib/{mic => wic}/utils/__init__.py (100%)
 rename scripts/lib/{mic => wic}/utils/cmdln.py (100%)
 rename scripts/lib/{mic => wic}/utils/errors.py (100%)
 rename scripts/lib/{mic => wic}/utils/fs_related.py (96%)
 rename scripts/lib/{mic => wic}/utils/misc.py (100%)
 rename scripts/lib/{mic => wic}/utils/oe/__init__.py (95%)
 rename scripts/lib/{mic => wic}/utils/oe/misc.py (97%)
 rename scripts/lib/{mic => wic}/utils/partitionedfs.py (98%)
 rename scripts/lib/{mic => wic}/utils/runner.py (99%)

diff --git a/scripts/lib/image/engine.py b/scripts/lib/image/engine.py
index b850bb9..f1df8b4 100644
--- a/scripts/lib/image/engine.py
+++ b/scripts/lib/image/engine.py
@@ -37,12 +37,12 @@ import subprocess
 import shutil
 
 import os, sys, errno
-from mic import msger, creator
-from mic.utils import cmdln, misc, errors
-from mic.conf import configmgr
-from mic.plugin import pluginmgr
-from mic.__version__ import VERSION
-from mic.utils.oe.misc import *
+from wic import msger, creator
+from wic.utils import cmdln, misc, errors
+from wic.conf import configmgr
+from wic.plugin import pluginmgr
+from wic.__version__ import VERSION
+from wic.utils.oe.misc import *
 
 
 def verify_build_env():
diff --git a/scripts/lib/image/help.py b/scripts/lib/image/help.py
index 6503aaa..080795e 100644
--- a/scripts/lib/image/help.py
+++ b/scripts/lib/image/help.py
@@ -144,7 +144,7 @@ DESCRIPTION
     the corresponding artifacts are typically found in a normal
     OpenEmbedded build.
 
-    Alternatively, users can use the -e option to have 'mic' determine
+    Alternatively, users can use the -e option to have 'wic' determine
     those locations for a given image.  If the -e option is used, the
     user needs to have set the appropriate MACHINE variable in
     local.conf, and have sourced the build environment.
@@ -349,12 +349,12 @@ DESCRIPTION
     implementation that populates a corresponding partition.
 
     A source plugin is created as a subclass of SourcePlugin (see
-    scripts/lib/mic/pluginbase.py) and the plugin file containing it
-    is added to scripts/lib/mic/plugins/source/ to make the plugin
+    scripts/lib/wic/pluginbase.py) and the plugin file containing it
+    is added to scripts/lib/wic/plugins/source/ to make the plugin
     implementation available to the wic implementation.
 
     Source plugins can also be implemented and added by external
-    layers - any plugins found in a scripts/lib/mic/plugins/source/
+    layers - any plugins found in a scripts/lib/wic/plugins/source/
     directory in an external layer will also be made available.
 
     When the wic implementation needs to invoke a partition-specific
diff --git a/scripts/lib/mic/3rdparty/pykickstart/__init__.py b/scripts/lib/wic/3rdparty/pykickstart/__init__.py
similarity index 100%
rename from scripts/lib/mic/3rdparty/pykickstart/__init__.py
rename to scripts/lib/wic/3rdparty/pykickstart/__init__.py
diff --git a/scripts/lib/mic/3rdparty/pykickstart/base.py b/scripts/lib/wic/3rdparty/pykickstart/base.py
similarity index 100%
rename from scripts/lib/mic/3rdparty/pykickstart/base.py
rename to scripts/lib/wic/3rdparty/pykickstart/base.py
diff --git a/scripts/lib/mic/3rdparty/pykickstart/commands/__init__.py b/scripts/lib/wic/3rdparty/pykickstart/commands/__init__.py
similarity index 100%
rename from scripts/lib/mic/3rdparty/pykickstart/commands/__init__.py
rename to scripts/lib/wic/3rdparty/pykickstart/commands/__init__.py
diff --git a/scripts/lib/mic/3rdparty/pykickstart/commands/bootloader.py b/scripts/lib/wic/3rdparty/pykickstart/commands/bootloader.py
similarity index 100%
rename from scripts/lib/mic/3rdparty/pykickstart/commands/bootloader.py
rename to scripts/lib/wic/3rdparty/pykickstart/commands/bootloader.py
diff --git a/scripts/lib/mic/3rdparty/pykickstart/commands/partition.py b/scripts/lib/wic/3rdparty/pykickstart/commands/partition.py
similarity index 100%
rename from scripts/lib/mic/3rdparty/pykickstart/commands/partition.py
rename to scripts/lib/wic/3rdparty/pykickstart/commands/partition.py
diff --git a/scripts/lib/mic/3rdparty/pykickstart/constants.py b/scripts/lib/wic/3rdparty/pykickstart/constants.py
similarity index 100%
rename from scripts/lib/mic/3rdparty/pykickstart/constants.py
rename to scripts/lib/wic/3rdparty/pykickstart/constants.py
diff --git a/scripts/lib/mic/3rdparty/pykickstart/errors.py b/scripts/lib/wic/3rdparty/pykickstart/errors.py
similarity index 100%
rename from scripts/lib/mic/3rdparty/pykickstart/errors.py
rename to scripts/lib/wic/3rdparty/pykickstart/errors.py
diff --git a/scripts/lib/mic/3rdparty/pykickstart/handlers/__init__.py b/scripts/lib/wic/3rdparty/pykickstart/handlers/__init__.py
similarity index 100%
rename from scripts/lib/mic/3rdparty/pykickstart/handlers/__init__.py
rename to scripts/lib/wic/3rdparty/pykickstart/handlers/__init__.py
diff --git a/scripts/lib/mic/3rdparty/pykickstart/handlers/control.py b/scripts/lib/wic/3rdparty/pykickstart/handlers/control.py
similarity index 100%
rename from scripts/lib/mic/3rdparty/pykickstart/handlers/control.py
rename to scripts/lib/wic/3rdparty/pykickstart/handlers/control.py
diff --git a/scripts/lib/mic/3rdparty/pykickstart/handlers/f16.py b/scripts/lib/wic/3rdparty/pykickstart/handlers/f16.py
similarity index 100%
rename from scripts/lib/mic/3rdparty/pykickstart/handlers/f16.py
rename to scripts/lib/wic/3rdparty/pykickstart/handlers/f16.py
diff --git a/scripts/lib/mic/3rdparty/pykickstart/ko.py b/scripts/lib/wic/3rdparty/pykickstart/ko.py
similarity index 100%
rename from scripts/lib/mic/3rdparty/pykickstart/ko.py
rename to scripts/lib/wic/3rdparty/pykickstart/ko.py
diff --git a/scripts/lib/mic/3rdparty/pykickstart/options.py b/scripts/lib/wic/3rdparty/pykickstart/options.py
similarity index 100%
rename from scripts/lib/mic/3rdparty/pykickstart/options.py
rename to scripts/lib/wic/3rdparty/pykickstart/options.py
diff --git a/scripts/lib/mic/3rdparty/pykickstart/parser.py b/scripts/lib/wic/3rdparty/pykickstart/parser.py
similarity index 100%
rename from scripts/lib/mic/3rdparty/pykickstart/parser.py
rename to scripts/lib/wic/3rdparty/pykickstart/parser.py
diff --git a/scripts/lib/mic/3rdparty/pykickstart/sections.py b/scripts/lib/wic/3rdparty/pykickstart/sections.py
similarity index 100%
rename from scripts/lib/mic/3rdparty/pykickstart/sections.py
rename to scripts/lib/wic/3rdparty/pykickstart/sections.py
diff --git a/scripts/lib/mic/3rdparty/pykickstart/version.py b/scripts/lib/wic/3rdparty/pykickstart/version.py
similarity index 100%
rename from scripts/lib/mic/3rdparty/pykickstart/version.py
rename to scripts/lib/wic/3rdparty/pykickstart/version.py
diff --git a/scripts/lib/mic/__init__.py b/scripts/lib/wic/__init__.py
similarity index 100%
rename from scripts/lib/mic/__init__.py
rename to scripts/lib/wic/__init__.py
diff --git a/scripts/lib/mic/__version__.py b/scripts/lib/wic/__version__.py
similarity index 100%
rename from scripts/lib/mic/__version__.py
rename to scripts/lib/wic/__version__.py
diff --git a/scripts/lib/mic/conf.py b/scripts/lib/wic/conf.py
similarity index 93%
rename from scripts/lib/mic/conf.py
rename to scripts/lib/wic/conf.py
index a686e9c..d5419f8 100644
--- a/scripts/lib/mic/conf.py
+++ b/scripts/lib/wic/conf.py
@@ -18,15 +18,15 @@
 import os, sys, re
 import ConfigParser
 
-from mic import msger
-from mic import kickstart
-from mic.utils import misc, runner, errors
+from wic import msger
+from wic import kickstart
+from wic.utils import misc, runner, errors
 
 
 def get_siteconf():
-    mic_path = os.path.dirname(__file__)
-    eos = mic_path.find('scripts') + len('scripts')
-    scripts_path = mic_path[:eos]
+    wic_path = os.path.dirname(__file__)
+    eos = wic_path.find('scripts') + len('scripts')
+    scripts_path = wic_path[:eos]
 
     return scripts_path + "/lib/image/config/wic.conf"
 
diff --git a/scripts/lib/mic/creator.py b/scripts/lib/wic/creator.py
similarity index 96%
rename from scripts/lib/mic/creator.py
rename to scripts/lib/wic/creator.py
index 7c9ca6f..a4b19ac 100644
--- a/scripts/lib/mic/creator.py
+++ b/scripts/lib/wic/creator.py
@@ -18,10 +18,10 @@
 import os, sys, re
 from optparse import SUPPRESS_HELP
 
-from mic import msger
-from mic.utils import cmdln, errors
-from mic.conf import configmgr
-from mic.plugin import pluginmgr
+from wic import msger
+from wic.utils import cmdln, errors
+from wic.conf import configmgr
+from wic.plugin import pluginmgr
 
 
 class Creator(cmdln.Cmdln):
@@ -34,7 +34,7 @@ class Creator(cmdln.Cmdln):
     ${option_list}
     """
 
-    name = 'mic create(cr)'
+    name = 'wic create(cr)'
 
     def __init__(self, *args, **kwargs):
         cmdln.Cmdln.__init__(self, *args, **kwargs)
@@ -64,7 +64,7 @@ class Creator(cmdln.Cmdln):
                              help='Path of logfile')
         optparser.add_option('-c', '--config', type='string', dest='config',
                              default=None,
-                             help='Specify config file for mic')
+                             help='Specify config file for wic')
         optparser.add_option('-o', '--outdir', type='string', action='store',
                              dest='outdir', default=None,
                              help='Output directory')
diff --git a/scripts/lib/mic/imager/__init__.py b/scripts/lib/wic/imager/__init__.py
similarity index 100%
rename from scripts/lib/mic/imager/__init__.py
rename to scripts/lib/wic/imager/__init__.py
diff --git a/scripts/lib/mic/imager/baseimager.py b/scripts/lib/wic/imager/baseimager.py
similarity index 96%
rename from scripts/lib/mic/imager/baseimager.py
rename to scripts/lib/wic/imager/baseimager.py
index 23919d4..5bcd2f7 100644
--- a/scripts/lib/mic/imager/baseimager.py
+++ b/scripts/lib/wic/imager/baseimager.py
@@ -21,10 +21,10 @@ import os, sys
 import tempfile
 import shutil
 
-from mic import kickstart
-from mic import msger
-from mic.utils.errors import CreatorError
-from mic.utils import misc, runner, fs_related as fs
+from wic import kickstart
+from wic import msger
+from wic.utils.errors import CreatorError
+from wic.utils import misc, runner, fs_related as fs
 
 class BaseImageCreator(object):
     """Base class for image creation.
@@ -34,7 +34,7 @@ class BaseImageCreator(object):
 
     e.g.
 
-      import mic.imgcreate as imgcreate
+      import wic.imgcreate as imgcreate
       ks = imgcreate.read_kickstart("foo.ks")
       imgcreate.ImageCreator(ks, "foo").create()
     """
diff --git a/scripts/lib/mic/imager/direct.py b/scripts/lib/wic/imager/direct.py
similarity index 96%
rename from scripts/lib/mic/imager/direct.py
rename to scripts/lib/wic/imager/direct.py
index 2f2bd4e..5b12856 100644
--- a/scripts/lib/mic/imager/direct.py
+++ b/scripts/lib/wic/imager/direct.py
@@ -18,8 +18,7 @@
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 #
 # DESCRIPTION
-# This implements the 'direct' image creator class for 'wic', based
-# loosely on the raw image creator from 'mic'
+# This implements the 'direct' image creator class for 'wic'
 #
 # AUTHORS
 # Tom Zanussi <tom.zanussi (at] linux.intel.com>
@@ -29,13 +28,13 @@ import os
 import stat
 import shutil
 
-from mic import kickstart, msger
-from mic.utils import fs_related, runner, misc
-from mic.utils.partitionedfs import Image
-from mic.utils.errors import CreatorError, ImageError
-from mic.imager.baseimager import BaseImageCreator
-from mic.utils.oe.misc import *
-from mic.plugin import pluginmgr
+from wic import kickstart, msger
+from wic.utils import fs_related, runner, misc
+from wic.utils.partitionedfs import Image
+from wic.utils.errors import CreatorError, ImageError
+from wic.imager.baseimager import BaseImageCreator
+from wic.utils.oe.misc import *
+from wic.plugin import pluginmgr
 
 disk_methods = {
     "do_install_disk":None,
diff --git a/scripts/lib/mic/kickstart/__init__.py b/scripts/lib/wic/kickstart/__init__.py
similarity index 98%
rename from scripts/lib/mic/kickstart/__init__.py
rename to scripts/lib/wic/kickstart/__init__.py
index 590bf47..4f5b778 100644
--- a/scripts/lib/mic/kickstart/__init__.py
+++ b/scripts/lib/wic/kickstart/__init__.py
@@ -30,8 +30,8 @@ import pykickstart.version as ksversion
 from pykickstart.handlers.control import commandMap
 from pykickstart.handlers.control import dataMap
 
-from mic import msger
-from mic.utils import errors, misc, runner, fs_related as fs
+from wic import msger
+from wic.utils import errors, misc, runner, fs_related as fs
 from custom_commands import wicboot, partition
 
 def read_kickstart(path):
diff --git a/scripts/lib/mic/kickstart/custom_commands/__init__.py b/scripts/lib/wic/kickstart/custom_commands/__init__.py
similarity index 100%
rename from scripts/lib/mic/kickstart/custom_commands/__init__.py
rename to scripts/lib/wic/kickstart/custom_commands/__init__.py
diff --git a/scripts/lib/mic/kickstart/custom_commands/micboot.py b/scripts/lib/wic/kickstart/custom_commands/micboot.py
similarity index 100%
rename from scripts/lib/mic/kickstart/custom_commands/micboot.py
rename to scripts/lib/wic/kickstart/custom_commands/micboot.py
diff --git a/scripts/lib/mic/kickstart/custom_commands/micpartition.py b/scripts/lib/wic/kickstart/custom_commands/micpartition.py
similarity index 100%
rename from scripts/lib/mic/kickstart/custom_commands/micpartition.py
rename to scripts/lib/wic/kickstart/custom_commands/micpartition.py
diff --git a/scripts/lib/mic/kickstart/custom_commands/partition.py b/scripts/lib/wic/kickstart/custom_commands/partition.py
similarity index 99%
rename from scripts/lib/mic/kickstart/custom_commands/partition.py
rename to scripts/lib/wic/kickstart/custom_commands/partition.py
index 101b90e..24f523a 100644
--- a/scripts/lib/mic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/wic/kickstart/custom_commands/partition.py
@@ -29,9 +29,9 @@ import os
 import tempfile
 
 from pykickstart.commands.partition import *
-from mic.utils.oe.misc import *
-from mic.kickstart.custom_commands import *
-from mic.plugin import pluginmgr
+from wic.utils.oe.misc import *
+from wic.kickstart.custom_commands import *
+from wic.plugin import pluginmgr
 
 partition_methods = {
     "do_stage_partition":None,
diff --git a/scripts/lib/mic/kickstart/custom_commands/wicboot.py b/scripts/lib/wic/kickstart/custom_commands/wicboot.py
similarity index 97%
rename from scripts/lib/mic/kickstart/custom_commands/wicboot.py
rename to scripts/lib/wic/kickstart/custom_commands/wicboot.py
index ab8871d..f191416 100644
--- a/scripts/lib/mic/kickstart/custom_commands/wicboot.py
+++ b/scripts/lib/wic/kickstart/custom_commands/wicboot.py
@@ -29,7 +29,7 @@ from pykickstart.errors import *
 from pykickstart.options import *
 from pykickstart.commands.bootloader import *
 
-from mic.kickstart.custom_commands.micboot import *
+from wic.kickstart.custom_commands.micboot import *
 
 class Wic_Bootloader(Mic_Bootloader):
     def __init__(self, writePriority=10, appendLine="", driveorder=None,
diff --git a/scripts/lib/mic/msger.py b/scripts/lib/wic/msger.py
similarity index 100%
rename from scripts/lib/mic/msger.py
rename to scripts/lib/wic/msger.py
diff --git a/scripts/lib/mic/plugin.py b/scripts/lib/wic/plugin.py
similarity index 94%
rename from scripts/lib/mic/plugin.py
rename to scripts/lib/wic/plugin.py
index 43afdbc..61c5859 100644
--- a/scripts/lib/mic/plugin.py
+++ b/scripts/lib/wic/plugin.py
@@ -17,16 +17,16 @@
 
 import os, sys
 
-from mic import msger
-from mic import pluginbase
-from mic.utils import errors
-from mic.utils.oe.misc import *
+from wic import msger
+from wic import pluginbase
+from wic.utils import errors
+from wic.utils.oe.misc import *
 
 __ALL__ = ['PluginMgr', 'pluginmgr']
 
 PLUGIN_TYPES = ["imager", "source"]
 
-PLUGIN_DIR = "/lib/mic/plugins" # relative to scripts
+PLUGIN_DIR = "/lib/wic/plugins" # relative to scripts
 SCRIPTS_PLUGIN_DIR = "scripts" + PLUGIN_DIR
 
 class PluginMgr(object):
@@ -41,9 +41,9 @@ class PluginMgr(object):
         return cls._instance
 
     def __init__(self):
-        mic_path = os.path.dirname(__file__)
-        eos = mic_path.find('scripts') + len('scripts')
-        scripts_path = mic_path[:eos]
+        wic_path = os.path.dirname(__file__)
+        eos = wic_path.find('scripts') + len('scripts')
+        scripts_path = wic_path[:eos]
         self.scripts_path = scripts_path
         self.plugin_dir = scripts_path + PLUGIN_DIR
         self.layers_path = None
diff --git a/scripts/lib/mic/pluginbase.py b/scripts/lib/wic/pluginbase.py
similarity index 88%
rename from scripts/lib/mic/pluginbase.py
rename to scripts/lib/wic/pluginbase.py
index 46a4f4a..06f318f 100644
--- a/scripts/lib/mic/pluginbase.py
+++ b/scripts/lib/wic/pluginbase.py
@@ -17,8 +17,8 @@
 
 import os
 import shutil
-from mic import msger
-from mic.utils import errors
+from wic import msger
+from wic.utils import errors
 
 class _Plugin(object):
     class __metaclass__(type):
@@ -26,15 +26,15 @@ class _Plugin(object):
             if not hasattr(cls, 'plugins'):
                 cls.plugins = {}
 
-            elif 'mic_plugin_type' in attrs:
-                if attrs['mic_plugin_type'] not in cls.plugins:
-                    cls.plugins[attrs['mic_plugin_type']] = {}
+            elif 'wic_plugin_type' in attrs:
+                if attrs['wic_plugin_type'] not in cls.plugins:
+                    cls.plugins[attrs['wic_plugin_type']] = {}
 
-            elif hasattr(cls, 'mic_plugin_type') and 'name' in attrs:
-                cls.plugins[cls.mic_plugin_type][attrs['name']] = cls
+            elif hasattr(cls, 'wic_plugin_type') and 'name' in attrs:
+                cls.plugins[cls.wic_plugin_type][attrs['name']] = cls
 
         def show_plugins(cls):
-            for cls in cls.plugins[cls.mic_plugin_type]:
+            for cls in cls.plugins[cls.wic_plugin_type]:
                 print cls
 
         def get_plugins(cls):
@@ -42,11 +42,11 @@ class _Plugin(object):
 
 
 class ImagerPlugin(_Plugin):
-    mic_plugin_type = "imager"
+    wic_plugin_type = "imager"
 
 
 class SourcePlugin(_Plugin):
-    mic_plugin_type = "source"
+    wic_plugin_type = "source"
     """
     The methods that can be implemented by --source plugins.
 
diff --git a/scripts/lib/mic/plugins/imager/direct_plugin.py b/scripts/lib/wic/plugins/imager/direct_plugin.py
similarity index 89%
rename from scripts/lib/mic/plugins/imager/direct_plugin.py
rename to scripts/lib/wic/plugins/imager/direct_plugin.py
index c05a400..dabd6fc 100644
--- a/scripts/lib/mic/plugins/imager/direct_plugin.py
+++ b/scripts/lib/wic/plugins/imager/direct_plugin.py
@@ -18,8 +18,7 @@
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 #
 # DESCRIPTION
-# This implements the 'direct' imager plugin class for 'wic', based
-# loosely on the raw imager plugin from 'mic'
+# This implements the 'direct' imager plugin class for 'wic'
 #
 # AUTHORS
 # Tom Zanussi <tom.zanussi (at] linux.intel.com>
@@ -30,13 +29,13 @@ import shutil
 import re
 import tempfile
 
-from mic import msger
-from mic.utils import misc, fs_related, errors, runner, cmdln
-from mic.conf import configmgr
-from mic.plugin import pluginmgr
+from wic import msger
+from wic.utils import misc, fs_related, errors, runner, cmdln
+from wic.conf import configmgr
+from wic.plugin import pluginmgr
 
-import mic.imager.direct as direct
-from mic.pluginbase import ImagerPlugin
+import wic.imager.direct as direct
+from wic.pluginbase import ImagerPlugin
 
 class DirectPlugin(ImagerPlugin):
     name = 'direct'
diff --git a/scripts/lib/mic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
similarity index 94%
rename from scripts/lib/mic/plugins/source/bootimg-efi.py
rename to scripts/lib/wic/plugins/source/bootimg-efi.py
index 5b1a533..53f1782 100644
--- a/scripts/lib/mic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -29,14 +29,14 @@ import shutil
 import re
 import tempfile
 
-from mic import kickstart, msger
-from mic.utils import misc, fs_related, errors, runner, cmdln
-from mic.conf import configmgr
-from mic.plugin import pluginmgr
-import mic.imager.direct as direct
-from mic.pluginbase import SourcePlugin
-from mic.utils.oe.misc import *
-from mic.imager.direct import DirectImageCreator
+from wic import kickstart, msger
+from wic.utils import misc, fs_related, errors, runner, cmdln
+from wic.conf import configmgr
+from wic.plugin import pluginmgr
+import wic.imager.direct as direct
+from wic.pluginbase import SourcePlugin
+from wic.utils.oe.misc import *
+from wic.imager.direct import DirectImageCreator
 
 class BootimgEFIPlugin(SourcePlugin):
     name = 'bootimg-efi'
diff --git a/scripts/lib/mic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
similarity index 95%
rename from scripts/lib/mic/plugins/source/bootimg-pcbios.py
rename to scripts/lib/wic/plugins/source/bootimg-pcbios.py
index 959cf41..bd2225e 100644
--- a/scripts/lib/mic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -29,14 +29,14 @@ import shutil
 import re
 import tempfile
 
-from mic import kickstart, msger
-from mic.utils import misc, fs_related, errors, runner, cmdln
-from mic.conf import configmgr
-from mic.plugin import pluginmgr
-import mic.imager.direct as direct
-from mic.pluginbase import SourcePlugin
-from mic.utils.oe.misc import *
-from mic.imager.direct import DirectImageCreator
+from wic import kickstart, msger
+from wic.utils import misc, fs_related, errors, runner, cmdln
+from wic.conf import configmgr
+from wic.plugin import pluginmgr
+import wic.imager.direct as direct
+from wic.pluginbase import SourcePlugin
+from wic.utils.oe.misc import *
+from wic.imager.direct import DirectImageCreator
 
 class BootimgPcbiosPlugin(SourcePlugin):
     name = 'bootimg-pcbios'
diff --git a/scripts/lib/mic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
similarity index 90%
rename from scripts/lib/mic/plugins/source/rootfs.py
rename to scripts/lib/wic/plugins/source/rootfs.py
index 8ebf62c..919e97e 100644
--- a/scripts/lib/mic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -30,14 +30,14 @@ import shutil
 import re
 import tempfile
 
-from mic import kickstart, msger
-from mic.utils import misc, fs_related, errors, runner, cmdln
-from mic.conf import configmgr
-from mic.plugin import pluginmgr
-import mic.imager.direct as direct
-from mic.pluginbase import SourcePlugin
-from mic.utils.oe.misc import *
-from mic.imager.direct import DirectImageCreator
+from wic import kickstart, msger
+from wic.utils import misc, fs_related, errors, runner, cmdln
+from wic.conf import configmgr
+from wic.plugin import pluginmgr
+import wic.imager.direct as direct
+from wic.pluginbase import SourcePlugin
+from wic.utils.oe.misc import *
+from wic.imager.direct import DirectImageCreator
 
 class RootfsPlugin(SourcePlugin):
     name = 'rootfs'
diff --git a/scripts/lib/mic/test b/scripts/lib/wic/test
similarity index 100%
rename from scripts/lib/mic/test
rename to scripts/lib/wic/test
diff --git a/scripts/lib/mic/utils/__init__.py b/scripts/lib/wic/utils/__init__.py
similarity index 100%
rename from scripts/lib/mic/utils/__init__.py
rename to scripts/lib/wic/utils/__init__.py
diff --git a/scripts/lib/mic/utils/cmdln.py b/scripts/lib/wic/utils/cmdln.py
similarity index 100%
rename from scripts/lib/mic/utils/cmdln.py
rename to scripts/lib/wic/utils/cmdln.py
diff --git a/scripts/lib/mic/utils/errors.py b/scripts/lib/wic/utils/errors.py
similarity index 100%
rename from scripts/lib/mic/utils/errors.py
rename to scripts/lib/wic/utils/errors.py
diff --git a/scripts/lib/mic/utils/fs_related.py b/scripts/lib/wic/utils/fs_related.py
similarity index 96%
rename from scripts/lib/mic/utils/fs_related.py
rename to scripts/lib/wic/utils/fs_related.py
index cf2a759..79cc1d5 100644
--- a/scripts/lib/mic/utils/fs_related.py
+++ b/scripts/lib/wic/utils/fs_related.py
@@ -26,10 +26,10 @@ import string
 import time
 import uuid
 
-from mic import msger
-from mic.utils import runner
-from mic.utils.errors import *
-from mic.utils.oe.misc import *
+from wic import msger
+from wic.utils import runner
+from wic.utils.errors import *
+from wic.utils.oe.misc import *
 
 def find_binary_path(binary):
     if os.environ.has_key("PATH"):
diff --git a/scripts/lib/mic/utils/misc.py b/scripts/lib/wic/utils/misc.py
similarity index 100%
rename from scripts/lib/mic/utils/misc.py
rename to scripts/lib/wic/utils/misc.py
diff --git a/scripts/lib/mic/utils/oe/__init__.py b/scripts/lib/wic/utils/oe/__init__.py
similarity index 95%
rename from scripts/lib/mic/utils/oe/__init__.py
rename to scripts/lib/wic/utils/oe/__init__.py
index d10e802..0a81575 100644
--- a/scripts/lib/mic/utils/oe/__init__.py
+++ b/scripts/lib/wic/utils/oe/__init__.py
@@ -1,5 +1,5 @@
 #
-# OpenEmbedded mic utils library
+# OpenEmbedded wic utils library
 #
 # Copyright (c) 2013, Intel Corporation.
 # All rights reserved.
diff --git a/scripts/lib/mic/utils/oe/misc.py b/scripts/lib/wic/utils/oe/misc.py
similarity index 97%
rename from scripts/lib/mic/utils/oe/misc.py
rename to scripts/lib/wic/utils/oe/misc.py
index bed2750..87e3041 100644
--- a/scripts/lib/mic/utils/oe/misc.py
+++ b/scripts/lib/wic/utils/oe/misc.py
@@ -18,15 +18,15 @@
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 #
 # DESCRIPTION
-# This module provides a place to collect various mic-related utils
+# This module provides a place to collect various wic-related utils
 # for the OpenEmbedded Image Tools.
 #
 # AUTHORS
 # Tom Zanussi <tom.zanussi (at] linux.intel.com>
 #
 
-from mic import msger
-from mic.utils import runner
+from wic import msger
+from wic.utils import runner
 
 def __exec_cmd(cmd_and_args, as_shell = False, catch = 3):
     """
diff --git a/scripts/lib/mic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
similarity index 98%
rename from scripts/lib/mic/utils/partitionedfs.py
rename to scripts/lib/wic/utils/partitionedfs.py
index 68e4cab..76aa421 100644
--- a/scripts/lib/mic/utils/partitionedfs.py
+++ b/scripts/lib/wic/utils/partitionedfs.py
@@ -20,11 +20,11 @@
 
 import os
 
-from mic import msger
-from mic.utils import runner
-from mic.utils.errors import ImageError
-from mic.utils.fs_related import *
-from mic.utils.oe.misc import *
+from wic import msger
+from wic.utils import runner
+from wic.utils.errors import ImageError
+from wic.utils.fs_related import *
+from wic.utils.oe.misc import *
 
 # Overhead of the MBR partitioning scheme (just one sector)
 MBR_OVERHEAD = 1
diff --git a/scripts/lib/mic/utils/runner.py b/scripts/lib/wic/utils/runner.py
similarity index 99%
rename from scripts/lib/mic/utils/runner.py
rename to scripts/lib/wic/utils/runner.py
index fded3c9..e740dad 100644
--- a/scripts/lib/mic/utils/runner.py
+++ b/scripts/lib/wic/utils/runner.py
@@ -18,7 +18,7 @@
 import os
 import subprocess
 
-from mic import msger
+from wic import msger
 
 def runtool(cmdln_or_args, catch=1):
     """ wrapper for most of the subprocess calls
-- 
1.8.3.1


