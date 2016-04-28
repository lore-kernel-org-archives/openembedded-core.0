Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3C6856FF9D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 13:18:16 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 28 Apr 2016 06:18:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,546,1455004800"; d="scan'208";a="964624024"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 28 Apr 2016 06:18:11 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 129B76A4007
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 07:05:46 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Apr 2016 13:58:06 +0300
Message-Id: <e5a256d881f05eae89f9c70e04a4f808328991ef.1461834510.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1461834510.git.ed.bartosh@linux.intel.com>
References: <cover.1461834510.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1461834510.git.ed.bartosh@linux.intel.com>
References: <cover.1461834510.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH v2 3/8] wic: get rid of fs_related.makedirs
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
X-List-Received-Date: Thu, 28 Apr 2016 13:18:17 -0000

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


