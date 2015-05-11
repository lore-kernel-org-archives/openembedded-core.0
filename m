Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0BC3073FE4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 13:17:25 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 11 May 2015 06:17:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,407,1427785200"; d="scan'208";a="708360060"
Received: from nshraga-mobl1.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.5.146])
	by fmsmga001.fm.intel.com with ESMTP; 11 May 2015 06:17:25 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 May 2015 16:17:08 +0300
Message-Id: <1431350231-29495-9-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1431350231-29495-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1431350231-29495-1-git-send-email-markus.lehtonen@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 08/11] devtool: deploy plugin: add missing docstrings
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
X-List-Received-Date: Mon, 11 May 2015 13:17:25 -0000

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/lib/devtool/deploy.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index 62c97fb..b569398 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -14,6 +14,7 @@
 # You should have received a copy of the GNU General Public License along
 # with this program; if not, write to the Free Software Foundation, Inc.,
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+"""Devtool plugin containing the deploy subcommands"""
 
 import os
 import subprocess
@@ -23,10 +24,12 @@ from devtool import exec_build_env_command
 logger = logging.getLogger('devtool')
 
 def plugin_init(pluginlist):
+    """Plugin initialization"""
     pass
 
 
 def deploy(args, config, basepath, workspace):
+    """Entry point for the devtool 'deploy' subcommand"""
     import re
     from devtool import exec_build_env_command
 
@@ -88,7 +91,7 @@ def deploy(args, config, basepath, workspace):
     return 0
 
 def undeploy(args, config, basepath, workspace):
-
+    """Entry point for the devtool 'undeploy' subcommand"""
     deploy_file = os.path.join(basepath, 'target_deploy', args.target, args.recipename + '.list')
     if not os.path.exists(deploy_file):
         logger.error('%s has not been deployed' % args.recipename)
@@ -123,6 +126,7 @@ def undeploy(args, config, basepath, workspace):
 
 
 def register_commands(subparsers, context):
+    """Register devtool subcommands from the deploy plugin"""
     parser_deploy = subparsers.add_parser('deploy-target', help='Deploy recipe output files to live target machine')
     parser_deploy.add_argument('recipename', help='Recipe to deploy')
     parser_deploy.add_argument('target', help='Live target machine running an ssh server: user@hostname[:destdir]')
-- 
2.1.4


