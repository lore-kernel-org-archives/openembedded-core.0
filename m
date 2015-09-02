Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E321977011
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 11:00:17 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 02 Sep 2015 04:00:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,453,1437462000"; d="scan'208";a="796592713"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 02 Sep 2015 04:00:17 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 45CE86A4083
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 03:59:26 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Sep 2015 13:58:02 +0300
Message-Id: <045597cc86cd559e91c77a66ab23206d1be671f1.1441191270.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441191270.git.ed.bartosh@linux.intel.com>
References: <cover.1441191270.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1441191270.git.ed.bartosh@linux.intel.com>
References: <cover.1441191270.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 02/17] wic: get rid of scripts/lib/image
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
X-List-Received-Date: Wed, 02 Sep 2015 11:00:19 -0000

Moved content of scripts/lib/image/ to scripts/lib/wic as
one directory with the same name as a tool is self-explanatory
and less confusing than two.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/image/__init__.py                      | 22 ----------------------
 .../{image => wic}/canned-wks/directdisk-gpt.wks   |  0
 .../canned-wks/directdisk-multi-rootfs.wks         |  0
 .../lib/{image => wic}/canned-wks/directdisk.wks   |  0
 .../lib/{image => wic}/canned-wks/mkefidisk.wks    |  0
 .../lib/{image => wic}/canned-wks/mkgummidisk.wks  |  0
 .../lib/{image => wic}/canned-wks/mkhybridiso.wks  |  0
 .../canned-wks/qemux86-directdisk.wks              |  0
 .../{image => wic}/canned-wks/sdimage-bootpart.wks |  0
 scripts/lib/{image => wic}/config/wic.conf         |  0
 scripts/lib/{image => wic}/engine.py               |  2 +-
 scripts/lib/{image => wic}/help.py                 |  4 ++--
 scripts/wic                                        |  4 ++--
 13 files changed, 5 insertions(+), 27 deletions(-)
 delete mode 100644 scripts/lib/image/__init__.py
 rename scripts/lib/{image => wic}/canned-wks/directdisk-gpt.wks (100%)
 rename scripts/lib/{image => wic}/canned-wks/directdisk-multi-rootfs.wks (100%)
 rename scripts/lib/{image => wic}/canned-wks/directdisk.wks (100%)
 rename scripts/lib/{image => wic}/canned-wks/mkefidisk.wks (100%)
 rename scripts/lib/{image => wic}/canned-wks/mkgummidisk.wks (100%)
 rename scripts/lib/{image => wic}/canned-wks/mkhybridiso.wks (100%)
 rename scripts/lib/{image => wic}/canned-wks/qemux86-directdisk.wks (100%)
 rename scripts/lib/{image => wic}/canned-wks/sdimage-bootpart.wks (100%)
 rename scripts/lib/{image => wic}/config/wic.conf (100%)
 rename scripts/lib/{image => wic}/engine.py (99%)
 rename scripts/lib/{image => wic}/help.py (99%)

diff --git a/scripts/lib/image/__init__.py b/scripts/lib/image/__init__.py
deleted file mode 100644
index 1ff814e..0000000
--- a/scripts/lib/image/__init__.py
+++ /dev/null
@@ -1,22 +0,0 @@
-#
-# OpenEmbedded Image tools library
-#
-# Copyright (c) 2013, Intel Corporation.
-# All rights reserved.
-#
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-#
-# AUTHORS
-# Tom Zanussi <tom.zanussi (at] linux.intel.com>
-#
diff --git a/scripts/lib/image/canned-wks/directdisk-gpt.wks b/scripts/lib/wic/canned-wks/directdisk-gpt.wks
similarity index 100%
rename from scripts/lib/image/canned-wks/directdisk-gpt.wks
rename to scripts/lib/wic/canned-wks/directdisk-gpt.wks
diff --git a/scripts/lib/image/canned-wks/directdisk-multi-rootfs.wks b/scripts/lib/wic/canned-wks/directdisk-multi-rootfs.wks
similarity index 100%
rename from scripts/lib/image/canned-wks/directdisk-multi-rootfs.wks
rename to scripts/lib/wic/canned-wks/directdisk-multi-rootfs.wks
diff --git a/scripts/lib/image/canned-wks/directdisk.wks b/scripts/lib/wic/canned-wks/directdisk.wks
similarity index 100%
rename from scripts/lib/image/canned-wks/directdisk.wks
rename to scripts/lib/wic/canned-wks/directdisk.wks
diff --git a/scripts/lib/image/canned-wks/mkefidisk.wks b/scripts/lib/wic/canned-wks/mkefidisk.wks
similarity index 100%
rename from scripts/lib/image/canned-wks/mkefidisk.wks
rename to scripts/lib/wic/canned-wks/mkefidisk.wks
diff --git a/scripts/lib/image/canned-wks/mkgummidisk.wks b/scripts/lib/wic/canned-wks/mkgummidisk.wks
similarity index 100%
rename from scripts/lib/image/canned-wks/mkgummidisk.wks
rename to scripts/lib/wic/canned-wks/mkgummidisk.wks
diff --git a/scripts/lib/image/canned-wks/mkhybridiso.wks b/scripts/lib/wic/canned-wks/mkhybridiso.wks
similarity index 100%
rename from scripts/lib/image/canned-wks/mkhybridiso.wks
rename to scripts/lib/wic/canned-wks/mkhybridiso.wks
diff --git a/scripts/lib/image/canned-wks/qemux86-directdisk.wks b/scripts/lib/wic/canned-wks/qemux86-directdisk.wks
similarity index 100%
rename from scripts/lib/image/canned-wks/qemux86-directdisk.wks
rename to scripts/lib/wic/canned-wks/qemux86-directdisk.wks
diff --git a/scripts/lib/image/canned-wks/sdimage-bootpart.wks b/scripts/lib/wic/canned-wks/sdimage-bootpart.wks
similarity index 100%
rename from scripts/lib/image/canned-wks/sdimage-bootpart.wks
rename to scripts/lib/wic/canned-wks/sdimage-bootpart.wks
diff --git a/scripts/lib/image/config/wic.conf b/scripts/lib/wic/config/wic.conf
similarity index 100%
rename from scripts/lib/image/config/wic.conf
rename to scripts/lib/wic/config/wic.conf
diff --git a/scripts/lib/image/engine.py b/scripts/lib/wic/engine.py
similarity index 99%
rename from scripts/lib/image/engine.py
rename to scripts/lib/wic/engine.py
index 73e8f8b..a034841 100644
--- a/scripts/lib/image/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -52,7 +52,7 @@ def verify_build_env():
     return True
 
 
-CANNED_IMAGE_DIR = "lib/image/canned-wks" # relative to scripts
+CANNED_IMAGE_DIR = "lib/wic/canned-wks" # relative to scripts
 SCRIPTS_CANNED_IMAGE_DIR = "scripts/" + CANNED_IMAGE_DIR
 
 def build_canned_image_list(dl):
diff --git a/scripts/lib/image/help.py b/scripts/lib/wic/help.py
similarity index 99%
rename from scripts/lib/image/help.py
rename to scripts/lib/wic/help.py
index 717d847..cd2176d 100644
--- a/scripts/lib/image/help.py
+++ b/scripts/lib/wic/help.py
@@ -288,7 +288,7 @@ DESCRIPTION
 
     The first form enumerates all the available 'canned' images.
     These are actually just the set of .wks files that have been moved
-    into the /scripts/lib/image/canned-wks directory).
+    into the /scripts/lib/wic/canned-wks directory).
 
     The second form lists the detailed help information for a specific
     'canned' image.
@@ -591,7 +591,7 @@ DESCRIPTION
       NATIVE_SYSROOT:  ...
 
       The image(s) were created using OE kickstart file:
-        .../scripts/lib/image/canned-wks/directdisk.wks
+        .../scripts/lib/wic/canned-wks/directdisk.wks
 
     The output shows the name and location of the image created, and
     so that you know exactly what was used to generate the image, each
diff --git a/scripts/wic b/scripts/wic
index 25b0d67..94028e2 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -54,8 +54,8 @@ else:
 
 from wic.utils.oe.misc import get_bitbake_var, BB_VARS
 from wic.utils.errors import WicError
-from image import engine
-from image import help as hlp
+from wic import engine
+from wic import help as hlp
 
 def rootfs_dir_to_args(krootfs_dir):
     """
-- 
2.1.4


