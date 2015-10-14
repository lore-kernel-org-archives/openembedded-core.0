Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0C51E73CBD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Oct 2015 13:45:57 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 14 Oct 2015 06:45:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,681,1437462000"; d="scan'208";a="826491762"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by orsmga002.jf.intel.com with ESMTP; 14 Oct 2015 06:45:57 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Oct 2015 05:37:55 +0000
Message-Id: <1444801075-25837-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCH] oeqa/selftest/buildoptions: Use the correct script for cleaning the workdir
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
X-List-Received-Date: Wed, 14 Oct 2015 13:45:58 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

The script 'cleanupworkdir' does not exit, so changing it to 'cleanup-workdir'.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/selftest/buildoptions.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
index d76aef1..fbe0cd7 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -125,7 +125,7 @@ class BuildImagesTest(oeSelfTest):
         This method is used to test the build of directfb image for arm arch.
         In essence we build a coreimagedirectfb and test the exitcode of bitbake that in case of success is 0.
         """
-        self.add_command_to_tearDown('cleanupworkdir')
+        self.add_command_to_tearDown('cleanup-workdir')
         self.write_config("DISTRO_FEATURES_remove = \"x11\"\nDISTRO_FEATURES_append = \" directfb\"\nMACHINE ??= \"qemuarm\"")
         res = bitbake("core-image-directfb", ignore_status=True)
         self.assertEqual(res.status, 0, "\ncoreimagedirectfb failed to build. Please check logs for further details.\nbitbake output %s" % res.output)
@@ -136,7 +136,7 @@ class ArchiverTest(oeSelfTest):
         """
         Test for archiving the work directory and exporting the source files.
         """
-        self.add_command_to_tearDown('cleanupworkdir')
+        self.add_command_to_tearDown('cleanup-workdir')
         self.write_config("INHERIT = \"archiver\"\nARCHIVER_MODE[src] = \"original\"\nARCHIVER_MODE[srpm] = \"1\"")
         res = bitbake("xcursor-transparent-theme", ignore_status=True)
         self.assertEqual(res.status, 0, "\nCouldn't build xcursortransparenttheme.\nbitbake output %s" % res.output)
-- 
1.8.4.5


