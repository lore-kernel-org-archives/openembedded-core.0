Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id EAB0E6FFDA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 14:20:25 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 18 Jan 2016 06:20:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,312,1449561600"; d="scan'208";a="31561830"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 18 Jan 2016 06:20:27 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 3FB592C8001
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 07:08:21 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jan 2016 14:22:44 +0200
Message-Id: <ead067d8feeff2abb407e106ad800e5dc2cc25bc.1453119482.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1453119482.git.ed.bartosh@linux.intel.com>
References: <cover.1453119482.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1453119482.git.ed.bartosh@linux.intel.com>
References: <cover.1453119482.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 4/6] wic: removed unused imports
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
X-List-Received-Date: Mon, 18 Jan 2016 14:20:26 -0000

Removed imports of wic.kickstart from plugins as they're
not used in the code.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py        | 2 +-
 scripts/lib/wic/plugins/source/bootimg-pcbios.py     | 2 +-
 scripts/lib/wic/plugins/source/isoimage-isohybrid.py | 2 +-
 scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py  | 1 -
 4 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 22f9813..125c943 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -27,7 +27,7 @@
 import os
 import shutil
 
-from wic import kickstart, msger
+from wic import msger
 from wic.pluginbase import SourcePlugin
 from wic.utils.misc import get_custom_config
 from wic.utils.oe.misc import exec_cmd, exec_native_cmd, get_bitbake_var, \
diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index 0b5478e..a1bfa26 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -27,7 +27,7 @@
 import os
 
 from wic.utils.errors import ImageError
-from wic import kickstart, msger
+from wic import msger
 from wic.utils import runner
 from wic.utils.misc import get_custom_config
 from wic.pluginbase import SourcePlugin
diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
index daefff3..c1e2a5d 100644
--- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
@@ -24,7 +24,7 @@ import os
 import re
 import shutil
 
-from wic import kickstart, msger
+from wic import msger
 from wic.pluginbase import SourcePlugin
 from wic.utils.oe.misc import exec_cmd, exec_native_cmd, get_bitbake_var
 
diff --git a/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py b/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
index 48b4817..3d60e6f 100644
--- a/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
+++ b/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
@@ -19,7 +19,6 @@
 #
 
 import os
-from wic import kickstart
 from wic import msger
 from wic.utils import syslinux
 from wic.utils import runner
-- 
2.1.4


