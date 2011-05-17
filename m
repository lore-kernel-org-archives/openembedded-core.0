Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <qing.he@intel.com>) id 1QMHKF-00086x-Hd
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 12:16:28 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 May 2011 03:13:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,224,1304319600"; 
   d="scan'208";a="2705754"
Received: from qhe2-db.sh.intel.com ([10.239.13.48])
	by fmsmga002.fm.intel.com with ESMTP; 17 May 2011 03:13:16 -0700
Received: from qhe2 by qhe2-db.sh.intel.com with local (Exim 4.71)
	(envelope-from <qing.he@intel.com>)
	id 1QMH9I-0002oj-Aj; Tue, 17 May 2011 18:05:08 +0800
Message-Id: <496fc66775f98df87ae658784003cc3de65fc503.1305626622.git.qing.he@intel.com>
In-Reply-To: <cover.1305626622.git.qing.he@intel.com>
References: <cover.1305626622.git.qing.he@intel.com>
Old-Date: Tue, 17 May 2011 10:23:48 +0800
Date: Tue, 17 May 2011 18:05:08 +0800
To: openembedded-core@lists.openembedded.org
From: Qing He <qing.he@intel.com>
Subject: [PATCH 1/1] update patch upstream status
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
X-List-Received-Date: Tue, 17 May 2011 10:16:28 -0000

From: Qing He <qing.he@intel.com>

for the following recipes:
  pcmciautils openssl udev apt gdm

Signed-off-by: Qing He <qing.he@intel.com>
---
 .../pcmciautils/pcmciautils-018/makefile_fix.patch |    2 ++
 .../openssh/openssh-5.6p1/nostrip.patch            |    2 ++
 meta/recipes-core/udev/udev-145/enable-gudev.patch |    2 ++
 meta/recipes-core/udev/udev-145/noasmlinkage.patch |    2 ++
 meta/recipes-core/udev/udev-145/unbreak.patch      |    2 ++
 .../apt/apt-0.7.14/includes-fix.patch              |    2 ++
 .../apt/apt-0.7.14/no-ko-translation.patch         |    2 ++
 .../apt/apt-0.7.14/noconfigure.patch               |    2 ++
 meta/recipes-devtools/apt/apt-0.7.14/nodoc.patch   |    2 ++
 .../recipes-devtools/apt/apt-0.7.14/use-host.patch |    2 ++
 .../apt/files/db_linking_hack.patch                |    2 ++
 meta/recipes-devtools/apt/files/environment.patch  |    2 ++
 meta/recipes-devtools/apt/files/no-curl.patch      |    2 ++
 .../gdbm/gdbm-1.8.3/libtool-mode.patch             |    2 ++
 .../recipes-support/gdbm/gdbm-1.8.3/makefile.patch |    1 +
 15 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils-018/makefile_fix.patch b/meta/recipes-bsp/pcmciautils/pcmciautils-018/makefile_fix.patch
index 81269c9..7b0ce21 100644
--- a/meta/recipes-bsp/pcmciautils/pcmciautils-018/makefile_fix.patch
+++ b/meta/recipes-bsp/pcmciautils/pcmciautils-018/makefile_fix.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Hardcoded paths are bad...
 This lets us use the install from OE's native sysroot
 rebase the patch to 018, removing hardcoded path for true
diff --git a/meta/recipes-connectivity/openssh/openssh-5.6p1/nostrip.patch b/meta/recipes-connectivity/openssh/openssh-5.6p1/nostrip.patch
index a88e18e..85846e2 100644
--- a/meta/recipes-connectivity/openssh/openssh-5.6p1/nostrip.patch
+++ b/meta/recipes-connectivity/openssh/openssh-5.6p1/nostrip.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 # Disable stripping binaries during make install.
 #
 # Signed-off-by: Scott Garman <scott.a.garman@intel.com>
diff --git a/meta/recipes-core/udev/udev-145/enable-gudev.patch b/meta/recipes-core/udev/udev-145/enable-gudev.patch
index 45fd373..8ee402b 100644
--- a/meta/recipes-core/udev/udev-145/enable-gudev.patch
+++ b/meta/recipes-core/udev/udev-145/enable-gudev.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: udev-145/configure.ac
 ===================================================================
 --- udev-145.orig/configure.ac	2010-01-29 14:41:29.000000000 +0000
diff --git a/meta/recipes-core/udev/udev-145/noasmlinkage.patch b/meta/recipes-core/udev/udev-145/noasmlinkage.patch
index 6f9fe94..6d22b1d 100644
--- a/meta/recipes-core/udev/udev-145/noasmlinkage.patch
+++ b/meta/recipes-core/udev/udev-145/noasmlinkage.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [legacy version]
+
 Index: udev-141/udev/test-udev.c
 ===================================================================
 --- udev-141.orig/udev/test-udev.c	2008-10-24 09:07:24.000000000 +0100
diff --git a/meta/recipes-core/udev/udev-145/unbreak.patch b/meta/recipes-core/udev/udev-145/unbreak.patch
index bb5988d..ef45c09 100644
--- a/meta/recipes-core/udev/udev-145/unbreak.patch
+++ b/meta/recipes-core/udev/udev-145/unbreak.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [legacy version]
+
 Index: udev-141/extras/volume_id/lib/Makefile.am
 ===================================================================
 --- udev-141.orig/extras/volume_id/lib/Makefile.am	2009-05-17 23:36:16.000000000 +0100
diff --git a/meta/recipes-devtools/apt/apt-0.7.14/includes-fix.patch b/meta/recipes-devtools/apt/apt-0.7.14/includes-fix.patch
index f466164..c85c388 100644
--- a/meta/recipes-devtools/apt/apt-0.7.14/includes-fix.patch
+++ b/meta/recipes-devtools/apt/apt-0.7.14/includes-fix.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 Add missing includes required when building with modern toolchain, based on
 patch from Debian bugzilla:
 http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=505954
diff --git a/meta/recipes-devtools/apt/apt-0.7.14/no-ko-translation.patch b/meta/recipes-devtools/apt/apt-0.7.14/no-ko-translation.patch
index 5f3634b..7fd1db8 100644
--- a/meta/recipes-devtools/apt/apt-0.7.14/no-ko-translation.patch
+++ b/meta/recipes-devtools/apt/apt-0.7.14/no-ko-translation.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 ---
  po/LINGUAS |    2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-devtools/apt/apt-0.7.14/noconfigure.patch b/meta/recipes-devtools/apt/apt-0.7.14/noconfigure.patch
index 682a96d..04e721d 100644
--- a/meta/recipes-devtools/apt/apt-0.7.14/noconfigure.patch
+++ b/meta/recipes-devtools/apt/apt-0.7.14/noconfigure.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 ---
  apt-pkg/packagemanager.cc |    4 ++++
  1 file changed, 4 insertions(+)
diff --git a/meta/recipes-devtools/apt/apt-0.7.14/nodoc.patch b/meta/recipes-devtools/apt/apt-0.7.14/nodoc.patch
index db8cf93..216c091 100644
--- a/meta/recipes-devtools/apt/apt-0.7.14/nodoc.patch
+++ b/meta/recipes-devtools/apt/apt-0.7.14/nodoc.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 ---
  Makefile |    2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-devtools/apt/apt-0.7.14/use-host.patch b/meta/recipes-devtools/apt/apt-0.7.14/use-host.patch
index 09698a6..485ad7b 100644
--- a/meta/recipes-devtools/apt/apt-0.7.14/use-host.patch
+++ b/meta/recipes-devtools/apt/apt-0.7.14/use-host.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 ---
  buildlib/sizetable |    4 +++-
  configure.in       |    2 +-
diff --git a/meta/recipes-devtools/apt/files/db_linking_hack.patch b/meta/recipes-devtools/apt/files/db_linking_hack.patch
index 3c8368b..d2246b3 100644
--- a/meta/recipes-devtools/apt/files/db_linking_hack.patch
+++ b/meta/recipes-devtools/apt/files/db_linking_hack.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 Index: apt-0.7.3/configure.in
 ===================================================================
 --- apt-0.7.3.orig/configure.in	2007-07-01 10:38:45.000000000 +0000
diff --git a/meta/recipes-devtools/apt/files/environment.patch b/meta/recipes-devtools/apt/files/environment.patch
index 5bea1a0..9a03038 100644
--- a/meta/recipes-devtools/apt/files/environment.patch
+++ b/meta/recipes-devtools/apt/files/environment.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 Index: apt-0.6.46.2/buildlib/environment.mak.in
 ===================================================================
 --- apt-0.6.46.2.orig/buildlib/environment.mak.in	2007-03-29 11:38:58.000000000 +0100
diff --git a/meta/recipes-devtools/apt/files/no-curl.patch b/meta/recipes-devtools/apt/files/no-curl.patch
index 4e07c8f..eb2f100 100644
--- a/meta/recipes-devtools/apt/files/no-curl.patch
+++ b/meta/recipes-devtools/apt/files/no-curl.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 ---
  configure.in     |    6 ------
  methods/makefile |    7 -------
diff --git a/meta/recipes-support/gdbm/gdbm-1.8.3/libtool-mode.patch b/meta/recipes-support/gdbm/gdbm-1.8.3/libtool-mode.patch
index c56bac2..0f9d04f 100644
--- a/meta/recipes-support/gdbm/gdbm-1.8.3/libtool-mode.patch
+++ b/meta/recipes-support/gdbm/gdbm-1.8.3/libtool-mode.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- gdbm-1.8.3/Makefile.in.orig	2006-02-16 15:17:25.000000000 +0000
 +++ gdbm-1.8.3/Makefile.in	2006-02-16 15:18:08.000000000 +0000
 @@ -131,7 +131,7 @@
diff --git a/meta/recipes-support/gdbm/gdbm-1.8.3/makefile.patch b/meta/recipes-support/gdbm/gdbm-1.8.3/makefile.patch
index 5350c53..369145c 100644
--- a/meta/recipes-support/gdbm/gdbm-1.8.3/makefile.patch
+++ b/meta/recipes-support/gdbm/gdbm-1.8.3/makefile.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Pending
 
 #
 # Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
-- 
1.7.0



