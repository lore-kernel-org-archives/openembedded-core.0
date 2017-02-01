Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 33488772FF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 14:11:32 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 01 Feb 2017 06:11:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,320,1477983600"; d="scan'208";a="928967399"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 01 Feb 2017 06:11:32 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id A25946A4082
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 06:10:33 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Feb 2017 15:48:19 +0200
Message-Id: <e42a139aadc1d090b7389e656ff54d3383b27fb6.1485953483.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485953483.git.ed.bartosh@linux.intel.com>
References: <cover.1485953483.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 12/18] wci: misc: removed build_name API
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
X-List-Received-Date: Wed, 01 Feb 2017 14:11:32 -0000

This API is not used in wic code.

[YOCTO #10619]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/utils/misc.py | 39 ---------------------------------------
 1 file changed, 39 deletions(-)

diff --git a/scripts/lib/wic/utils/misc.py b/scripts/lib/wic/utils/misc.py
index 1415ae9..7d09f6f 100644
--- a/scripts/lib/wic/utils/misc.py
+++ b/scripts/lib/wic/utils/misc.py
@@ -19,45 +19,6 @@ import os
 import time
 import wic.engine
 
-def build_name(kscfg, release=None, prefix=None, suffix=None):
-    """Construct and return an image name string.
-
-    This is a utility function to help create sensible name and fslabel
-    strings. The name is constructed using the sans-prefix-and-extension
-    kickstart filename and the supplied prefix and suffix.
-
-    kscfg -- a path to a kickstart file
-    release --  a replacement to suffix for image release
-    prefix -- a prefix to prepend to the name; defaults to None, which causes
-              no prefix to be used
-    suffix -- a suffix to append to the name; defaults to None, which causes
-              a YYYYMMDDHHMM suffix to be used
-
-    Note, if maxlen is less then the len(suffix), you get to keep both pieces.
-
-    """
-    name = os.path.basename(kscfg)
-    idx = name.rfind('.')
-    if idx >= 0:
-        name = name[:idx]
-
-    if release is not None:
-        suffix = ""
-    if prefix is None:
-        prefix = ""
-    if suffix is None:
-        suffix = time.strftime("%Y%m%d%H%M")
-
-    if name.startswith(prefix):
-        name = name[len(prefix):]
-
-    prefix = "%s-" % prefix if prefix else ""
-    suffix = "-%s" % suffix if suffix else ""
-
-    ret = prefix + name + suffix
-
-    return ret
-
 def find_canned(scripts_path, file_name):
     """
     Find a file either by its path or by name in the canned files dir.
-- 
2.1.4


