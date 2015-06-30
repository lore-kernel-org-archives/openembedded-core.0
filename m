Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B92C775C97
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 08:53:11 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 30 Jun 2015 01:53:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,376,1432623600"; d="scan'208";a="516463074"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Jun 2015 01:53:13 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 9CD086A4005;
	Tue, 30 Jun 2015 01:52:33 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jun 2015 11:51:52 +0300
Message-Id: <1435654312-18177-21-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1435654312-18177-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1435654312-18177-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [wic][PATCH v2 20/20] wic: Code cleanup: unused imports
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
X-List-Received-Date: Tue, 30 Jun 2015 08:53:12 -0000

Fixed pylint warning unused-import

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

diff --git a/scripts/lib/image/engine.py b/scripts/lib/image/engine.py
index 0dc7920..73e8f8b 100644
--- a/scripts/lib/image/engine.py
+++ b/scripts/lib/image/engine.py
@@ -30,18 +30,10 @@
 
 import os
 import sys
-from abc import ABCMeta, abstractmethod
-import shlex
-import json
-import subprocess
-import shutil
 
-import os, sys, errno
 from wic import msger, creator
-from wic.utils import cmdln, misc, errors
-from wic.conf import configmgr
+from wic.utils import misc
 from wic.plugin import pluginmgr
-from wic.__version__ import VERSION
 from wic.utils.oe import misc
 
 
diff --git a/scripts/lib/wic/conf.py b/scripts/lib/wic/conf.py
index cecf396..402ed62 100644
--- a/scripts/lib/wic/conf.py
+++ b/scripts/lib/wic/conf.py
@@ -19,7 +19,7 @@ import os
 
 from wic import msger
 from wic import kickstart
-from wic.utils import misc, runner, errors
+from wic.utils import misc
 
 
 def get_siteconf():
diff --git a/scripts/lib/wic/imager/baseimager.py b/scripts/lib/wic/imager/baseimager.py
index 0afbc2c..67a2d01 100644
--- a/scripts/lib/wic/imager/baseimager.py
+++ b/scripts/lib/wic/imager/baseimager.py
@@ -21,10 +21,9 @@ import os
 import tempfile
 import shutil
 
-from wic import kickstart
 from wic import msger
 from wic.utils.errors import CreatorError
-from wic.utils import misc, runner, fs_related as fs
+from wic.utils import runner
 
 class BaseImageCreator(object):
     """Base class for image creation.
diff --git a/scripts/lib/wic/imager/direct.py b/scripts/lib/wic/imager/direct.py
index e2f8058..57b1335 100644
--- a/scripts/lib/wic/imager/direct.py
+++ b/scripts/lib/wic/imager/direct.py
@@ -28,7 +28,7 @@ import os
 import shutil
 
 from wic import kickstart, msger
-from wic.utils import fs_related, runner, misc
+from wic.utils import fs_related
 from wic.utils.partitionedfs import Image
 from wic.utils.errors import CreatorError, ImageError
 from wic.imager.baseimager import BaseImageCreator
diff --git a/scripts/lib/wic/pluginbase.py b/scripts/lib/wic/pluginbase.py
index 50e442d..6d96de2 100644
--- a/scripts/lib/wic/pluginbase.py
+++ b/scripts/lib/wic/pluginbase.py
@@ -16,7 +16,6 @@
 # Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 
 from wic import msger
-from wic.utils import errors
 
 class _Plugin(object):
     class __metaclass__(type):
diff --git a/scripts/lib/wic/plugins/imager/direct_plugin.py b/scripts/lib/wic/plugins/imager/direct_plugin.py
index db01c41..eb17e8d 100644
--- a/scripts/lib/wic/plugins/imager/direct_plugin.py
+++ b/scripts/lib/wic/plugins/imager/direct_plugin.py
@@ -24,10 +24,8 @@
 # Tom Zanussi <tom.zanussi (at] linux.intel.com>
 #
 
-from wic import msger
-from wic.utils import misc, fs_related, errors, runner, cmdln
+from wic.utils import errors
 from wic.conf import configmgr
-from wic.plugin import pluginmgr
 
 import wic.imager.direct as direct
 from wic.pluginbase import ImagerPlugin
diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 903b478..49d5c8a 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -27,7 +27,6 @@
 import os
 import shutil
 
-from wic.utils.errors import ImageError
 from wic import kickstart, msger
 from wic.pluginbase import SourcePlugin
 from wic.utils.oe.misc import exec_cmd, exec_native_cmd, get_bitbake_var, \
diff --git a/scripts/lib/wic/utils/cmdln.py b/scripts/lib/wic/utils/cmdln.py
index b099473..d8f1c05 100644
--- a/scripts/lib/wic/utils/cmdln.py
+++ b/scripts/lib/wic/utils/cmdln.py
@@ -43,7 +43,6 @@ import sys
 import re
 import cmd
 import optparse
-from pprint import pprint
 import sys
 
 
-- 
2.1.4


