Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RFXEo-0003VQ-O5
	for openembedded-core@lists.openembedded.org;
	Sun, 16 Oct 2011 22:23:14 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 16 Oct 2011 13:17:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,354,1315206000"; d="scan'208";a="74375161"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.6])
	by fmsmga001.fm.intel.com with ESMTP; 16 Oct 2011 13:17:23 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 16 Oct 2011 13:17:14 -0700
Message-Id: <be31c4f8bc0666fbca20dba7e0db8321fabb7da6.1318796061.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1318796061.git.sgw@linux.intel.com>
References: <cover.1318796061.git.sgw@linux.intel.com>
In-Reply-To: <cover.1318796061.git.sgw@linux.intel.com>
References: <cover.1318796061.git.sgw@linux.intel.com>
Subject: [v2 -CONSOLIDATED PULL 12/14] sysprof: remove duplicated patch
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
X-List-Received-Date: Sun, 16 Oct 2011 20:23:14 -0000

Apparently this pactch was duplicated by backported
patch, and needed to be applied more broaded than to
just ppc.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../sysprof/files/ppc-macro-fix.patch              |   13 -------------
 meta/recipes-kernel/sysprof/sysprof_git.bb         |    1 -
 2 files changed, 0 insertions(+), 14 deletions(-)
 delete mode 100644 meta/recipes-kernel/sysprof/files/ppc-macro-fix.patch

diff --git a/meta/recipes-kernel/sysprof/files/ppc-macro-fix.patch b/meta/recipes-kernel/sysprof/files/ppc-macro-fix.patch
deleted file mode 100644
index a2e015a..0000000
--- a/meta/recipes-kernel/sysprof/files/ppc-macro-fix.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: git/collector.c
-===================================================================
---- git.orig/collector.c	2010-12-09 19:42:12.292040001 -0600
-+++ git/collector.c	2010-12-09 19:42:23.352039997 -0600
-@@ -175,7 +175,7 @@
- #define __NR_perf_counter_open 337
- #elif defined(__hppa__)
- #define __NR_perf_counter_open 318
--#elif defined(__ppc__) || defined(__ppc64__)
-+#elif defined(__powerpc__) || defined(__powerpc64__)
- #define __NR_perf_counter_open 319
- #elif defined(__s390__)
- #define __NR_perf_counter_open 331
diff --git a/meta/recipes-kernel/sysprof/sysprof_git.bb b/meta/recipes-kernel/sysprof/sysprof_git.bb
index c553263..bd34f00 100644
--- a/meta/recipes-kernel/sysprof/sysprof_git.bb
+++ b/meta/recipes-kernel/sysprof/sysprof_git.bb
@@ -15,7 +15,6 @@ SRC_URI = "git://git.gnome.org/sysprof;protocol=git \
 
 SRC_URI_append_arm  = " file://rmb-arm.patch"
 SRC_URI_append_mips = " file://rmb-mips.patch"
-SRC_URI_append_powerpc = " file://ppc-macro-fix.patch"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.6.2



