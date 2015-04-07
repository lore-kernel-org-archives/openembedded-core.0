Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8D0C460089
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Apr 2015 11:51:54 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 07 Apr 2015 04:51:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,537,1422950400"; d="scan'208";a="477656303"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Apr 2015 04:51:56 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 399E06A408D;
	Tue,  7 Apr 2015 04:51:33 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Apr 2015 14:51:51 +0300
Message-Id: <1428407511-21981-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH] wic: code cleanup: unused imports
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
X-List-Received-Date: Tue, 07 Apr 2015 11:51:55 -0000

Fixed pylint warning 'Unused import'

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/conf.py                                | 3 +--
 scripts/lib/wic/creator.py                             | 2 +-
 scripts/lib/wic/imager/baseimager.py                   | 2 +-
 scripts/lib/wic/imager/direct.py                       | 1 -
 scripts/lib/wic/kickstart/custom_commands/partition.py | 1 -
 scripts/lib/wic/pluginbase.py                          | 2 --
 scripts/lib/wic/plugins/imager/direct_plugin.py        | 5 -----
 scripts/lib/wic/plugins/source/bootimg-efi.py          | 2 --
 scripts/lib/wic/plugins/source/bootimg-pcbios.py       | 3 ---
 scripts/lib/wic/plugins/source/fsimage.py              | 1 -
 scripts/lib/wic/plugins/source/rawcopy.py              | 1 -
 scripts/lib/wic/plugins/source/rootfs.py               | 3 ---
 scripts/lib/wic/utils/fs_related.py                    | 6 ------
 scripts/lib/wic/utils/misc.py                          | 1 -
 scripts/lib/wic/utils/partitionedfs.py                 | 2 --
 15 files changed, 3 insertions(+), 32 deletions(-)

diff --git a/scripts/lib/wic/conf.py b/scripts/lib/wic/conf.py
index be34355..ff6e2ca 100644
--- a/scripts/lib/wic/conf.py
+++ b/scripts/lib/wic/conf.py
@@ -15,8 +15,7 @@
 # with this program; if not, write to the Free Software Foundation, Inc., 59
 # Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 
-import os, sys, re
-import ConfigParser
+import os
 
 from wic import msger
 from wic import kickstart
diff --git a/scripts/lib/wic/creator.py b/scripts/lib/wic/creator.py
index 2219377..760848f 100644
--- a/scripts/lib/wic/creator.py
+++ b/scripts/lib/wic/creator.py
@@ -15,7 +15,7 @@
 # with this program; if not, write to the Free Software Foundation, Inc., 59
 # Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 
-import os, sys, re
+import os, sys
 from optparse import SUPPRESS_HELP
 
 from wic import msger
diff --git a/scripts/lib/wic/imager/baseimager.py b/scripts/lib/wic/imager/baseimager.py
index e830527..2075358 100644
--- a/scripts/lib/wic/imager/baseimager.py
+++ b/scripts/lib/wic/imager/baseimager.py
@@ -17,7 +17,7 @@
 # Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 
 from __future__ import with_statement
-import os, sys
+import os
 import tempfile
 import shutil
 
diff --git a/scripts/lib/wic/imager/direct.py b/scripts/lib/wic/imager/direct.py
index c3d0563..c7e1c6c 100644
--- a/scripts/lib/wic/imager/direct.py
+++ b/scripts/lib/wic/imager/direct.py
@@ -25,7 +25,6 @@
 #
 
 import os
-import stat
 import shutil
 
 from wic import kickstart, msger
diff --git a/scripts/lib/wic/kickstart/custom_commands/partition.py b/scripts/lib/wic/kickstart/custom_commands/partition.py
index f3d553b..ff90601 100644
--- a/scripts/lib/wic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/wic/kickstart/custom_commands/partition.py
@@ -24,7 +24,6 @@
 # Tom Zanussi <tom.zanussi (at] linux.intel.com>
 #
 
-import shutil
 import os
 import tempfile
 
diff --git a/scripts/lib/wic/pluginbase.py b/scripts/lib/wic/pluginbase.py
index e3de9ba..72bcad2 100644
--- a/scripts/lib/wic/pluginbase.py
+++ b/scripts/lib/wic/pluginbase.py
@@ -15,8 +15,6 @@
 # with this program; if not, write to the Free Software Foundation, Inc., 59
 # Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 
-import os
-import shutil
 from wic import msger
 from wic.utils import errors
 
diff --git a/scripts/lib/wic/plugins/imager/direct_plugin.py b/scripts/lib/wic/plugins/imager/direct_plugin.py
index 5601c3f..17888e9 100644
--- a/scripts/lib/wic/plugins/imager/direct_plugin.py
+++ b/scripts/lib/wic/plugins/imager/direct_plugin.py
@@ -24,11 +24,6 @@
 # Tom Zanussi <tom.zanussi (at] linux.intel.com>
 #
 
-import os
-import shutil
-import re
-import tempfile
-
 from wic import msger
 from wic.utils import misc, fs_related, errors, runner, cmdln
 from wic.conf import configmgr
diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index ee57881..d6c11ed 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -26,8 +26,6 @@
 
 import os
 import shutil
-import re
-import tempfile
 
 from wic import kickstart, msger
 from wic.utils import misc, fs_related, errors, runner, cmdln
diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index c4786a6..abb32eb 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -25,9 +25,6 @@
 #
 
 import os
-import shutil
-import re
-import tempfile
 
 from wic import kickstart, msger
 from wic.utils import misc, fs_related, errors, runner, cmdln
diff --git a/scripts/lib/wic/plugins/source/fsimage.py b/scripts/lib/wic/plugins/source/fsimage.py
index 0967883..4a090ba 100644
--- a/scripts/lib/wic/plugins/source/fsimage.py
+++ b/scripts/lib/wic/plugins/source/fsimage.py
@@ -16,7 +16,6 @@
 #
 
 import os
-import re
 
 from wic import msger
 from wic.pluginbase import SourcePlugin
diff --git a/scripts/lib/wic/plugins/source/rawcopy.py b/scripts/lib/wic/plugins/source/rawcopy.py
index cf6236a..6bdd9b2 100644
--- a/scripts/lib/wic/plugins/source/rawcopy.py
+++ b/scripts/lib/wic/plugins/source/rawcopy.py
@@ -16,7 +16,6 @@
 #
 
 import os
-import re
 
 from wic import msger
 from wic.pluginbase import SourcePlugin
diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
index a432a18..6f5d9bb 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -26,9 +26,6 @@
 #
 
 import os
-import shutil
-import re
-import tempfile
 
 from wic import kickstart, msger
 from wic.utils import misc, fs_related, errors, runner, cmdln
diff --git a/scripts/lib/wic/utils/fs_related.py b/scripts/lib/wic/utils/fs_related.py
index 033acc9..224b43e 100644
--- a/scripts/lib/wic/utils/fs_related.py
+++ b/scripts/lib/wic/utils/fs_related.py
@@ -18,13 +18,7 @@
 
 from __future__ import with_statement
 import os
-import sys
 import errno
-import stat
-import random
-import string
-import time
-import uuid
 
 from wic import msger
 from wic.utils import runner
diff --git a/scripts/lib/wic/utils/misc.py b/scripts/lib/wic/utils/misc.py
index 6e56316..5d6337c 100644
--- a/scripts/lib/wic/utils/misc.py
+++ b/scripts/lib/wic/utils/misc.py
@@ -16,7 +16,6 @@
 # Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 
 import os
-import sys
 import time
 
 def build_name(kscfg, release=None, prefix = None, suffix = None):
diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
index 1c10cb5..c848bea 100644
--- a/scripts/lib/wic/utils/partitionedfs.py
+++ b/scripts/lib/wic/utils/partitionedfs.py
@@ -18,8 +18,6 @@
 # with this program; if not, write to the Free Software Foundation, Inc., 59
 # Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 
-import os
-
 from wic import msger
 from wic.utils import runner
 from wic.utils.errors import ImageError
-- 
2.1.4


