Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 3A53D731F9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 15:27:40 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP; 04 May 2016 08:27:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,577,1455004800"; d="scan'208";a="972536978"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 04 May 2016 08:27:30 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 8FE3D6A4007
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 09:15:04 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 May 2016 16:06:18 +0300
Message-Id: <73a54dd17339e13be3a6809564227846676b20bd.1462365339.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1462365339.git.ed.bartosh@linux.intel.com>
References: <cover.1462365339.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1462365339.git.ed.bartosh@linux.intel.com>
References: <cover.1462365339.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 05/14] wic: remove with_statement imports
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
X-List-Received-Date: Wed, 04 May 2016 15:27:41 -0000

'with' statement is not used in baseimager.py
It's supported by Python 2.7, which is included into all target
distros. Other wic modules use this statement.

Removed useless 'from __future__ import with_statement' from
wic code.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/imager/baseimager.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/lib/wic/imager/baseimager.py b/scripts/lib/wic/imager/baseimager.py
index 463ae93..1a52dd8 100644
--- a/scripts/lib/wic/imager/baseimager.py
+++ b/scripts/lib/wic/imager/baseimager.py
@@ -16,7 +16,6 @@
 # with this program; if not, write to the Free Software Foundation, Inc., 59
 # Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 
-from __future__ import with_statement
 import os
 import tempfile
 import shutil
-- 
2.1.4


