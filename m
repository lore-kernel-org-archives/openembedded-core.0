Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QOCEV-0007ta-4O
	for openembedded-core@lists.openembedded.org;
	Sun, 22 May 2011 19:14:27 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 22 May 2011 10:11:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,252,1304319600"; 
   d="scan'208";a="5520688"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by fmsmga002.fm.intel.com with ESMTP; 22 May 2011 10:11:29 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org,
	poky@yoctoproject.org
Date: Sun, 22 May 2011 10:11:05 -0700
Message-Id: <1045dacfe5b75bbb2f91e77afdf7ee016986a955.1306080531.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.5
In-Reply-To: <301e248311c215357e51464fb0b7e1155311fc7a.1306080531.git.nitin.a.kamble@intel.com>
References: <301e248311c215357e51464fb0b7e1155311fc7a.1306080531.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1306080531.git.nitin.a.kamble@intel.com>
References: <cover.1306080531.git.nitin.a.kamble@intel.com>
Subject: [PATCH 3/3] gplv2 recipes update upstream status of patches
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
X-List-Received-Date: Sun, 22 May 2011 17:14:27 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

grep-2.5.1a: update upstream status of patches
tar-1.17: update upstream-status of patches
at-3.1.12: update upstream-status for patches
cpio-2.8: update upstream-status for patches

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-extended/at/at-3.1.12/configure.patch |    2 ++
 .../cpio/cpio-2.8/m4extensions.patch               |    2 ++
 meta/recipes-extended/cpio/cpio-2.8/statdef.patch  |    2 ++
 .../grep/grep-2.5.1a/uclibc-fix.patch              |    2 ++
 .../recipes-extended/tar/tar-1.17/gcc43build.patch |    2 ++
 .../tar/tar-1.17/m4extensions.patch                |    2 ++
 6 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-extended/at/at-3.1.12/configure.patch b/meta/recipes-extended/at/at-3.1.12/configure.patch
index 079a6b4..99b4077 100644
--- a/meta/recipes-extended/at/at-3.1.12/configure.patch
+++ b/meta/recipes-extended/at/at-3.1.12/configure.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [licensing]
+
 Fix cross-compilation issues in configure.ac
 Derived from an OE patch for at-3.1.8
 
diff --git a/meta/recipes-extended/cpio/cpio-2.8/m4extensions.patch b/meta/recipes-extended/cpio/cpio-2.8/m4extensions.patch
index 648c725..e16585d 100644
--- a/meta/recipes-extended/cpio/cpio-2.8/m4extensions.patch
+++ b/meta/recipes-extended/cpio/cpio-2.8/m4extensions.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [licensing]
+
 # Define AC_USE_SYSTEM_EXTENSIONS only if it was previously undefined.
 # This is needed to configure correctly with newer versions of autoconf.
 
diff --git a/meta/recipes-extended/cpio/cpio-2.8/statdef.patch b/meta/recipes-extended/cpio/cpio-2.8/statdef.patch
index dfa0d91..a00799f 100644
--- a/meta/recipes-extended/cpio/cpio-2.8/statdef.patch
+++ b/meta/recipes-extended/cpio/cpio-2.8/statdef.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [licensing]
+
 # Avoid multiple stat definitions
 # Patch taken from cpio mailing list posting 2010-03-19
 
diff --git a/meta/recipes-extended/grep/grep-2.5.1a/uclibc-fix.patch b/meta/recipes-extended/grep/grep-2.5.1a/uclibc-fix.patch
index 8fc7c48..de054fc 100644
--- a/meta/recipes-extended/grep/grep-2.5.1a/uclibc-fix.patch
+++ b/meta/recipes-extended/grep/grep-2.5.1a/uclibc-fix.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [licensing]
+
 # Fix to use mempcpy instead of __mempcpy. This is needed for uclibc which
 # doesn't define __mempcpy, only mempcpy. Since both uclibc and glibc have
 # mempcpy, we'll just use that instead.
diff --git a/meta/recipes-extended/tar/tar-1.17/gcc43build.patch b/meta/recipes-extended/tar/tar-1.17/gcc43build.patch
index cc5f0e1..f8059a0 100644
--- a/meta/recipes-extended/tar/tar-1.17/gcc43build.patch
+++ b/meta/recipes-extended/tar/tar-1.17/gcc43build.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [licensing]
+
 # Fix errors when built with gcc 4.3
 # Patch taken from Debian bug #452096
 
diff --git a/meta/recipes-extended/tar/tar-1.17/m4extensions.patch b/meta/recipes-extended/tar/tar-1.17/m4extensions.patch
index 11b981a..30534c2 100644
--- a/meta/recipes-extended/tar/tar-1.17/m4extensions.patch
+++ b/meta/recipes-extended/tar/tar-1.17/m4extensions.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [licensing]
+
 # Define AC_USE_SYSTEM_EXTENSIONS only if it was previously undefined.
 # This is needed to configure correctly with newer versions of autoconf.
 
-- 
1.7.3.4



