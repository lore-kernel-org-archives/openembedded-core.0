Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9805673FE5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 13:17:20 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 11 May 2015 06:17:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,407,1427785200"; d="scan'208";a="708360013"
Received: from nshraga-mobl1.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.5.146])
	by fmsmga001.fm.intel.com with ESMTP; 11 May 2015 06:17:20 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 May 2015 16:17:04 +0300
Message-Id: <1431350231-29495-5-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1431350231-29495-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1431350231-29495-1-git-send-email-markus.lehtonen@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 04/11] devtool: lib: add missing docstrings
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
X-List-Received-Date: Mon, 11 May 2015 13:17:22 -0000

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/lib/devtool/__init__.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index 78ae0aa..00594eb 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -16,7 +16,7 @@
 # You should have received a copy of the GNU General Public License along
 # with this program; if not, write to the Free Software Foundation, Inc.,
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-
+"""Devtool plugins module"""
 
 import os
 import sys
@@ -26,6 +26,7 @@ import logging
 logger = logging.getLogger('devtool')
 
 def exec_build_env_command(init_path, builddir, cmd, watch=False, **options):
+    """Run a program in bitbake build context"""
     import bb
     if not 'cwd' in options:
         options["cwd"] = builddir
@@ -49,6 +50,7 @@ def exec_build_env_command(init_path, builddir, cmd, watch=False, **options):
         return bb.process.run('%s%s' % (init_prefix, cmd), **options)
 
 def exec_watch(cmd, **options):
+    """Run program with stdout shown on sys.stdout"""
     if isinstance(cmd, basestring) and not "shell" in options:
         options["shell"] = True
 
@@ -68,6 +70,7 @@ def exec_watch(cmd, **options):
     return buf
 
 def setup_tinfoil():
+    """Initialize tinfoil api from bitbake"""
     import scriptpath
     bitbakepath = scriptpath.add_bitbake_lib_path()
     if not bitbakepath:
-- 
2.1.4


