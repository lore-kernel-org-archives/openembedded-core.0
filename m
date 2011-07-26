Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QlpdF-0007tr-E1
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 23:57:41 +0200
Received: by rex (Postfix, from userid 1000)
	id C03E920D88; Tue, 26 Jul 2011 22:53:17 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2011 22:53:13 +0100
Message-Id: <756ecf7826070e5603b41a9f6ec8e2a9499e3105.1311716946.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <e393d2644b26b14f2b3b4b8e12177644921076b9.1311716946.git.richard.purdie@linuxfoundation.org>
References: <e393d2644b26b14f2b3b4b8e12177644921076b9.1311716946.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1311716946.git.richard.purdie@linuxfoundation.org>
References: <cover.1311716946.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 6/8] linux-yocto: revise the dependency for multilib
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Jul 2011 21:57:43 -0000

From: Yu Ke <ke.yu@intel.com>

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 meta/recipes-kernel/linux/linux-tools.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-tools.inc b/meta/recipes-kernel/linux/linux-tools.inc
index 729e912..950f197 100644
--- a/meta/recipes-kernel/linux/linux-tools.inc
+++ b/meta/recipes-kernel/linux/linux-tools.inc
@@ -22,7 +22,7 @@ addtask install_perf after do_install before do_package
 do_compile_perf[umask] = 022
 do_install_perf[umask] = 022
 
-PERFDEPENDS = "virtual/libc:do_populate_sysroot elfutils:do_populate_sysroot"
+PERFDEPENDS = "virtual/${MLPREFIX}libc:do_populate_sysroot ${MLPREFIX}elfutils:do_populate_sysroot"
 PERFDEPENDS_libc-uclibc = ""
 PERFRDEPENDS = "python perl elfutils"
 PERFRDEPENDS_libc-uclibc = ""
-- 
1.7.4.1



