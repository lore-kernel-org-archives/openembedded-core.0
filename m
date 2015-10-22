Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 4B18E77184
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 15:22:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id A7CDD608F9D
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Oct 2015 16:21:59 +0100
Message-Id: <9a2292a995de9f93e742bda6c465daa854279fed.1445527096.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1445527096.git.joshua.lock@collabora.co.uk>
References: <cover.1445527096.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1445527096.git.joshua.lock@collabora.co.uk>
References: <cover.1445527096.git.joshua.lock@collabora.co.uk>
Subject: [PATCH v3 38/52] oeqa/selftest/buildoptions: Use the correct script for cleaning the workdir
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
X-List-Received-Date: Thu, 22 Oct 2015 15:22:27 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

The script 'cleanupworkdir' does not exit, so changing it to 'cleanup-workdir'.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
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
2.1.4


