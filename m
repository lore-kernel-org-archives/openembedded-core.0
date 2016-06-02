Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id F2D4D773F8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 10:13:52 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 02 Jun 2016 03:13:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,405,1459839600"; d="scan'208";a="989527647"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 02 Jun 2016 03:13:54 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 855DB6A4006
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 04:01:21 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jun 2016 13:12:52 +0300
Message-Id: <fa23b2509ec1f58a8f0244f1b6e1d29dc9e108ec.1464861910.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1464861910.git.ed.bartosh@linux.intel.com>
References: <cover.1464861910.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1464861910.git.ed.bartosh@linux.intel.com>
References: <cover.1464861910.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 06/16] scripts: python3: get rid of __future__ imports
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
X-List-Received-Date: Thu, 02 Jun 2016 10:13:53 -0000

Removed print_function and with_statement imports from __future__
as they're supported by python 3 by default.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/bitbake-whatchanged                      | 1 -
 scripts/pybootchartgui/pybootchartgui/main.py.in | 2 --
 scripts/pybootchartgui/pybootchartgui/parsing.py | 3 ---
 scripts/wic                                      | 2 --
 4 files changed, 8 deletions(-)

diff --git a/scripts/bitbake-whatchanged b/scripts/bitbake-whatchanged
index b05aead..55b61d0 100755
--- a/scripts/bitbake-whatchanged
+++ b/scripts/bitbake-whatchanged
@@ -17,7 +17,6 @@
 # along with this program; if not, write to the Free Software
 # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 
-from __future__ import print_function
 import os
 import sys
 import getopt
diff --git a/scripts/pybootchartgui/pybootchartgui/main.py.in b/scripts/pybootchartgui/pybootchartgui/main.py.in
index 21bb0be..af26bd2 100644
--- a/scripts/pybootchartgui/pybootchartgui/main.py.in
+++ b/scripts/pybootchartgui/pybootchartgui/main.py.in
@@ -16,8 +16,6 @@
 #  You should have received a copy of the GNU General Public License
 #  along with pybootchartgui. If not, see <http://www.gnu.org/licenses/>.
 
-from __future__ import print_function
-
 import sys
 import os
 import optparse
diff --git a/scripts/pybootchartgui/pybootchartgui/parsing.py b/scripts/pybootchartgui/pybootchartgui/parsing.py
index d423b9f..a3a0b0b 100644
--- a/scripts/pybootchartgui/pybootchartgui/parsing.py
+++ b/scripts/pybootchartgui/pybootchartgui/parsing.py
@@ -13,9 +13,6 @@
 #  You should have received a copy of the GNU General Public License
 #  along with pybootchartgui. If not, see <http://www.gnu.org/licenses/>.
 
-
-from __future__ import with_statement
-
 import os
 import string
 import re
diff --git a/scripts/wic b/scripts/wic
index 5cc06f4..9023755 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -28,8 +28,6 @@
 # AUTHORS
 # Tom Zanussi <tom.zanussi (at] linux.intel.com>
 #
-from __future__ import print_function
-
 __version__ = "0.2.0"
 
 # Python Standard Library modules
-- 
2.1.4


