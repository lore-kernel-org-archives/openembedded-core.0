Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6297D700F0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 22:22:42 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w1KMMfdg008988
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 20 Feb 2018 22:22:42 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1eoGJ7-0004gR-IG; Tue, 20 Feb 2018 22:22:41 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Feb 2018 22:22:40 +0000
Message-Id: <1519165360-17959-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519165360-17959-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1519165360-17959-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Subject: [PATCH 2/2] documentation.conf: Remove references to tasks which were removed
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
X-List-Received-Date: Tue, 20 Feb 2018 22:22:42 -0000

The fetchall and checkuriall tasks were removed, remove the doc strings for them.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/documentation.conf | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 995b60e..7834898 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -8,7 +8,6 @@ do_bootimg[doc] = "Creates a bootable live image"
 do_build[doc] = "Default task for a recipe - depends on all other normal tasks required to 'build' a recipe"
 do_bundle_initramfs[doc] = "Combines an initial ramdisk image and kernel together to form a single image"
 do_checkuri[doc] = "Validates the SRC_URI value"
-do_checkuriall[doc] = "Validates the SRC_URI value for all recipes required to build a target"
 do_clean[doc] = "Removes all output files for a target"
 do_cleanall[doc] = "Removes all output files, shared state cache, and downloaded source files for a target"
 do_cleansstate[doc] = "Removes all output files and shared state cache for a target"
@@ -22,7 +21,6 @@ do_devpyshell[doc] = "Starts an interactive Python shell for development/debuggi
 do_devshell[doc] = "Starts a shell with the environment set up for development/debugging"
 do_diffconfig[doc] = "Compares the old and new config files after running do_menuconfig for the kernel"
 do_fetch[doc] = "Fetches the source code"
-do_fetchall[doc] = "Fetches all remote sources required to build a target"
 do_install[doc] = "Copies files from the compilation directory to a holding area"
 do_install_ptest_base[doc] = "Copies the runtime test suite files from the compilation directory to a holding area"
 do_kernel_checkout[doc] = "Checks out source/meta branches for a linux-yocto style kernel"
-- 
2.7.4


