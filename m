Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RiFoX-0005H0-Ek
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 02:38:49 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 03 Jan 2012 17:31:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="53000794"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.13.115])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Jan 2012 17:31:23 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jan 2012 17:31:19 -0800
Message-Id: <a8eea7c83f33f5d5eab1e2758a88f3ee140e68a1.1325640149.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.5
In-Reply-To: <cover.1325640149.git.josh@linux.intel.com>
References: <cover.1325640149.git.josh@linux.intel.com>
In-Reply-To: <cover.1325640149.git.josh@linux.intel.com>
References: <cover.1325640149.git.josh@linux.intel.com>
Subject: [PATCH 1/2] linux-tools: add binutils to perf DEPENDS
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
X-List-Received-Date: Wed, 04 Jan 2012 01:38:49 -0000

We have witnessed non-deterministic failures of perf for some platforms
whilst looking for bfd.h, a header provided by binutils.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/recipes-kernel/linux/linux-tools.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-tools.inc b/meta/recipes-kernel/linux/linux-tools.inc
index 950f197..aa45dba 100644
--- a/meta/recipes-kernel/linux/linux-tools.inc
+++ b/meta/recipes-kernel/linux/linux-tools.inc
@@ -22,7 +22,7 @@ addtask install_perf after do_install before do_package
 do_compile_perf[umask] = 022
 do_install_perf[umask] = 022
 
-PERFDEPENDS = "virtual/${MLPREFIX}libc:do_populate_sysroot ${MLPREFIX}elfutils:do_populate_sysroot"
+PERFDEPENDS = "virtual/${MLPREFIX}libc:do_populate_sysroot ${MLPREFIX}elfutils:do_populate_sysroot ${MLPREFIX}binutils:do_populate_sysroot"
 PERFDEPENDS_libc-uclibc = ""
 PERFRDEPENDS = "python perl elfutils"
 PERFRDEPENDS_libc-uclibc = ""
-- 
1.7.7.5



