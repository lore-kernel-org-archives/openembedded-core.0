Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 785E973257
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 09:35:30 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 28 Apr 2016 02:35:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,546,1455004800"; d="scan'208";a="968274171"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 28 Apr 2016 02:35:31 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 964D66A4007;
	Thu, 28 Apr 2016 03:23:06 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Apr 2016 10:14:54 +0300
Message-Id: <1461827697-16934-3-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1461827697-16934-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1461827697-16934-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 3/6] wic: get rid of fs_related.makedirs
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
X-List-Received-Date: Thu, 28 Apr 2016 09:35:32 -0000

Removed fs_related.makedirs as is not used anywhere. The name is
easy to confuse with os.makedirs.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/utils/fs_related.py | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/scripts/lib/wic/utils/fs_related.py b/scripts/lib/wic/utils/fs_related.py
index 22aa294..fc3c174 100644
--- a/scripts/lib/wic/utils/fs_related.py
+++ b/scripts/lib/wic/utils/fs_related.py
@@ -16,22 +16,8 @@
 # with this program; if not, write to the Free Software Foundation, Inc., 59
 # Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 
-from __future__ import with_statement
-import os
-import errno
-
 from wic.utils.oe.misc import exec_cmd
 
-def makedirs(dirname):
-    """A version of os.makedirs() that doesn't throw an
-    exception if the leaf directory already exists.
-    """
-    try:
-        os.makedirs(dirname)
-    except OSError, err:
-        if err.errno != errno.EEXIST:
-            raise
-
 class DiskImage():
     """
     A Disk backed by a file.
-- 
2.1.4


