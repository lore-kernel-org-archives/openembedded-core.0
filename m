Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QODkd-0000sy-Ck
	for openembedded-core@lists.openembedded.org;
	Sun, 22 May 2011 20:51:46 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 22 May 2011 11:48:44 -0700
X-ExtLoop1: 1
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.133])
	by orsmga002.jf.intel.com with ESMTP; 22 May 2011 11:48:44 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 22 May 2011 11:48:33 -0700
Message-Id: <e5aed8f3deef81945d4a8843c9f3520f96282367.1306089781.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1306089781.git.sgw@linux.intel.com>
References: <cover.1306089781.git.sgw@linux.intel.com>
In-Reply-To: <cover.1306089781.git.sgw@linux.intel.com>
References: <cover.1306089781.git.sgw@linux.intel.com>
Subject: [PATCH 9/9] gplv2 recipes update upstream status of patches
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
X-List-Received-Date: Sun, 22 May 2011 18:51:47 -0000

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



