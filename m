Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 98E7D73FF9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 13:17:22 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 11 May 2015 06:17:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,407,1427785200"; d="scan'208";a="708360030"
Received: from nshraga-mobl1.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.5.146])
	by fmsmga001.fm.intel.com with ESMTP; 11 May 2015 06:17:23 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 May 2015 16:17:06 +0300
Message-Id: <1431350231-29495-7-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1431350231-29495-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1431350231-29495-1-git-send-email-markus.lehtonen@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 06/11] devtool: lib: wrap long lines in code
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
 scripts/lib/devtool/__init__.py | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index 8866512..676bc52 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -36,14 +36,16 @@ def exec_build_env_command(init_path, builddir, cmd, watch=False, **options):
         # the executable to bash to correctly set things up
         if not 'executable' in options:
             options['executable'] = 'bash'
-        logger.debug('Executing command: "%s" using init path %s' % (cmd, init_path))
+        logger.debug('Executing command: "%s" using init path %s' %
+                     (cmd, init_path))
         init_prefix = '. %s %s > /dev/null && ' % (init_path, builddir)
     else:
         logger.debug('Executing command "%s"' % cmd)
         init_prefix = ''
     if watch:
         if sys.stdout.isatty():
-            # Fool bitbake into thinking it's outputting to a terminal (because it is, indirectly)
+            # Fool bitbake into thinking it's outputting to a terminal
+            # (because it is, indirectly)
             cmd = 'script -q -c "%s" /dev/null' % cmd
         return exec_watch('%s%s' % (init_prefix, cmd), **options)
     else:
@@ -74,7 +76,8 @@ def setup_tinfoil():
     import scriptpath
     bitbakepath = scriptpath.add_bitbake_lib_path()
     if not bitbakepath:
-        logger.error("Unable to find bitbake by searching parent directory of this script or PATH")
+        logger.error("Unable to find bitbake by searching parent directory of "
+                     "this script or PATH")
         sys.exit(1)
 
     import bb.tinfoil
-- 
2.1.4


