Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjB3b-0001dy-Ug
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 16:13:56 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Jul 2011 07:09:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,228,1309762800"; d="scan'208";a="29396965"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by orsmga001.jf.intel.com with ESMTP; 19 Jul 2011 07:09:40 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jul 2011 23:51:07 -0700
Message-Id: <0a64a8ba37a237b6745b6ea4f16064e7dbe9311d.1311058024.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311058024.git.sgw@linux.intel.com>
References: <cover.1311058024.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311058024.git.sgw@linux.intel.com>
References: <cover.1311058024.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 20/22] unfs-server: add Upstream-Status field to patches
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
X-List-Received-Date: Tue, 19 Jul 2011 14:14:01 -0000

From: Scott Garman <scott.a.garman@intel.com>

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../001-2.2b47-2.2b51.patch                        |    5 +++++
 .../unfs-server-2.1+2.2beta47/002-destdir.patch    |    5 +++++
 .../unfs-server-2.1+2.2beta47/003-manpages.patch   |    5 +++++
 .../unfs-server-2.1+2.2beta47/004-strsignal.patch  |    5 +++++
 .../unfs-server-2.1+2.2beta47/005-sys-time.patch   |    5 +++++
 .../unfs-server-2.1+2.2beta47/006-reiserfs.patch   |    5 +++++
 .../unfs-server-2.1+2.2beta47/007-map.patch        |    5 +++++
 .../unfs-server-2.1+2.2beta47/008-configure.patch  |    5 +++++
 .../unfs-server-2.1+2.2beta47/009-multirw.patch    |    5 +++++
 .../unfs-server-2.1+2.2beta47/010-realpath.patch   |    5 +++++
 .../011-fno-strict-aliasing.patch                  |    5 +++++
 .../unfs-server-2.1+2.2beta47/012-nostrip.patch    |    5 +++++
 .../unfs-server-2.1+2.2beta47/013-mntpathlen.patch |    5 +++++
 .../014-uninitialized.patch                        |    5 +++++
 .../unfs-server-2.1+2.2beta47/015-setattr.patch    |    5 +++++
 .../016-makefile.in.patch                          |    5 +++++
 .../017-wrs-dynamic-rpc.patch                      |    5 +++++
 .../018-remove-tcp-wrappers.patch                  |    5 +++++
 .../019-pid-before-fork.patch                      |    5 +++++
 .../020-undefined-chmod-fix.patch                  |    5 +++++
 .../unfs-server-2.1+2.2beta47/021-nolibwrap.patch  |    5 +++++
 .../022-add-close-on-exec-descriptors.patch        |    5 +++++
 22 files changed, 110 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/001-2.2b47-2.2b51.patch b/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/001-2.2b47-2.2b51.patch
index 886ce92..b2cdc5e 100644
--- a/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/001-2.2b47-2.2b51.patch
+++ b/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/001-2.2b47-2.2b51.patch
@@ -1,3 +1,8 @@
+Upstream-Status: Inappropriate [other]
+Upstream is not making further releases of this software.
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 # Patch origin: nfs-server source RPM from openSUSE 10.3
 
 diff -urN nfs-server-2.2beta47/.version nfs-server-2.2beta51/.version
diff --git a/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/002-destdir.patch b/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/002-destdir.patch
index 9388332..df290f2 100644
--- a/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/002-destdir.patch
+++ b/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/002-destdir.patch
@@ -1,3 +1,8 @@
+Upstream-Status: Inappropriate [other]
+Upstream is not making further releases of this software.
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 # Patch origin: nfs-server source RPM from openSUSE 10.3
 
 --- nfs-server/Makefile.in	2002/11/07 16:56:07	1.1
diff --git a/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/003-manpages.patch b/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/003-manpages.patch
index a17a8dc..412dbf6 100644
--- a/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/003-manpages.patch
+++ b/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/003-manpages.patch
@@ -1,3 +1,8 @@
+Upstream-Status: Inappropriate [other]
+Upstream is not making further releases of this software.
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 # Patch origin: nfs-server source RPM from openSUSE 10.3
 
 --- nfs-server/exports.man	2002/11/07 17:15:59	1.1
diff --git a/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/004-strsignal.patch b/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/004-strsignal.patch
index 3ac4ed7..6982b47 100644
--- a/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/004-strsignal.patch
+++ b/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/004-strsignal.patch
@@ -1,3 +1,8 @@
+Upstream-Status: Inappropriate [other]
+Upstream is not making further releases of this software.
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 # Patch origin: nfs-server source RPM from openSUSE 10.3
 
 --- nfs-server/failsafe.c	2002/11/07 17:12:46	1.1
diff --git a/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/005-sys-time.patch b/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/005-sys-time.patch
index c21fb05..17208d8 100644
--- a/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/005-sys-time.patch
+++ b/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/005-sys-time.patch
@@ -1,3 +1,8 @@
+Upstream-Status: Inappropriate [other]
+Upstream is not making further releases of this software.
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 # Patch origin: nfs-server source RPM from openSUSE 10.3
 
 --- nfs-server/system.h	2002/11/07 17:10:47	1.1
diff --git a/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/006-reiserfs.patch b/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/006-reiserfs.patch
index abdc674..22dcc42 100644
--- a/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/006-reiserfs.patch
+++ b/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/006-reiserfs.patch
@@ -1,3 +1,8 @@
+Upstream-Status: Inappropriate [other]
+Upstream is not making further releases of this software.
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 # Patch origin: nfs-server source RPM from openSUSE 10.3
 
 --- nfs-server/Makefile.in
diff --git a/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/007-map.patch b/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/007-map.patch
index 89baabe..e031fef 100644
--- a/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/007-map.patch
+++ b/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/007-map.patch
@@ -1,3 +1,8 @@
+Upstream-Status: Inappropriate [other]
+Upstream is not making further releases of this software.
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 # Patch origin: nfs-server source RPM from openSUSE 10.3
 
 --- nfs-server/auth.c
diff --git a/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/008-configure.patch b/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/008-configure.patch
index a6d4599..98405ea 100644
--- a/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/008-configure.patch
+++ b/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/008-configure.patch
@@ -1,3 +1,8 @@
+Upstream-Status: Inappropriate [other]
+Upstream is not making further releases of this software.
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 # Patch origin: nfs-server source RPM from openSUSE 10.3
 
 --- nfs-server/configure.in	2002/11/08 14:24:55	1.1
diff --git a/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/009-multirw.patch b/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/009-multirw.patch
index 65b0b9e..a4cf1f5 100644
--- a/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/009-multirw.patch
+++ b/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/009-multirw.patch
@@ -1,3 +1,8 @@
+Upstream-Status: Inappropriate [other]
+Upstream is not making further releases of this software.
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 # Patch origin: nfs-server source RPM from openSUSE 10.3
 
 --- nfs-server/nfsd.c
diff --git a/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/010-realpath.patch b/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/010-realpath.patch
index c3b5d58..2e53b37 100644
--- a/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/010-realpath.patch
+++ b/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/010-realpath.patch
@@ -1,3 +1,8 @@
+Upstream-Status: Inappropriate [other]
+Upstream is not making further releases of this software.
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 # Patch origin: nfs-server source RPM from openSUSE 10.3
 
 --- nfs-server/configure.in
diff --git a/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/011-fno-strict-aliasing.patch b/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/011-fno-strict-aliasing.patch
index 695b8c7..1d0535b 100644
--- a/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/011-fno-strict-aliasing.patch
+++ b/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/011-fno-strict-aliasing.patch
@@ -1,3 +1,8 @@
+Upstream-Status: Inappropriate [other]
+Upstream is not making further releases of this software.
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 # Patch origin: nfs-server source RPM from openSUSE 10.3
 
 --- nfs-server/Makefile.in
diff --git a/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/012-nostrip.patch b/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/012-nostrip.patch
index a815ee4..d04e0d1 100644
--- a/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/012-nostrip.patch
+++ b/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/012-nostrip.patch
@@ -1,3 +1,8 @@
+Upstream-Status: Inappropriate [other]
+Upstream is not making further releases of this software.
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 # Patch origin: nfs-server source RPM from openSUSE 10.3
 
 --- nfs-server/Makefile.in.xx	2006-01-12 12:43:09.000000000 +0100
diff --git a/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/013-mntpathlen.patch b/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/013-mntpathlen.patch
index 1f10d3c..b161fe4 100644
--- a/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/013-mntpathlen.patch
+++ b/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/013-mntpathlen.patch
@@ -1,3 +1,8 @@
+Upstream-Status: Inappropriate [other]
+Upstream is not making further releases of this software.
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 # Patch origin: nfs-server source RPM from openSUSE 10.3
 
 --- nfs-server/mountd.c	2006/01/12 14:00:13	1.13
diff --git a/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/014-uninitialized.patch b/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/014-uninitialized.patch
index 233c08a..370f440 100644
--- a/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/014-uninitialized.patch
+++ b/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/014-uninitialized.patch
@@ -1,3 +1,8 @@
+Upstream-Status: Inappropriate [other]
+Upstream is not making further releases of this software.
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 # Patch origin: nfs-server source RPM from openSUSE 10.3
 
 --- nfs-server/mountd.c
diff --git a/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/015-setattr.patch b/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/015-setattr.patch
index cbfb8e8..3b86d43 100644
--- a/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/015-setattr.patch
+++ b/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/015-setattr.patch
@@ -1,3 +1,8 @@
+Upstream-Status: Inappropriate [other]
+Upstream is not making further releases of this software.
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 # Patch origin: nfs-server source RPM from openSUSE 10.3
 
 --- nfs-server/setattr.c.orig	2006-07-28 16:38:26.000000000 +0200
diff --git a/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/016-makefile.in.patch b/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/016-makefile.in.patch
index 634ce46..211aa0b 100644
--- a/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/016-makefile.in.patch
+++ b/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/016-makefile.in.patch
@@ -1,3 +1,8 @@
+Upstream-Status: Inappropriate [other]
+Upstream is not making further releases of this software.
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 # Makefile fix for staging to work correctly.
 # Scott Garman <scott.a.garman@intel.com>
 
diff --git a/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/017-wrs-dynamic-rpc.patch b/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/017-wrs-dynamic-rpc.patch
index 18e12de..99cd6b1 100644
--- a/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/017-wrs-dynamic-rpc.patch
+++ b/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/017-wrs-dynamic-rpc.patch
@@ -1,3 +1,8 @@
+Upstream-Status: Inappropriate [other]
+Upstream is not making further releases of this software.
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 # Add the ability to choose alternate RPC ports at runtime and disable
 # security so that it can run as a userland process
 # Patch origin: Wind River
diff --git a/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/018-remove-tcp-wrappers.patch b/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/018-remove-tcp-wrappers.patch
index 95ecdee..1b407e4 100644
--- a/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/018-remove-tcp-wrappers.patch
+++ b/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/018-remove-tcp-wrappers.patch
@@ -1,3 +1,8 @@
+Upstream-Status: Inappropriate [other]
+Upstream is not making further releases of this software.
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 # Remove the requirement to link with libwrap
 # Patch origin: Wind River
 
diff --git a/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/019-pid-before-fork.patch b/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/019-pid-before-fork.patch
index 960ca8e..1b9c06a 100644
--- a/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/019-pid-before-fork.patch
+++ b/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/019-pid-before-fork.patch
@@ -1,3 +1,8 @@
+Upstream-Status: Inappropriate [other]
+Upstream is not making further releases of this software.
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 # Write a pid file before forking
 # Patch origin: Wind River
 
diff --git a/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/020-undefined-chmod-fix.patch b/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/020-undefined-chmod-fix.patch
index 0f1108c..fb51300 100644
--- a/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/020-undefined-chmod-fix.patch
+++ b/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/020-undefined-chmod-fix.patch
@@ -1,3 +1,8 @@
+Upstream-Status: Inappropriate [other]
+Upstream is not making further releases of this software.
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 # Fix a problem with chmod attributes when using no_squash_all
 # Patch origin: Wind River
 
diff --git a/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/021-nolibwrap.patch b/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/021-nolibwrap.patch
index c0901fa..335d098 100644
--- a/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/021-nolibwrap.patch
+++ b/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/021-nolibwrap.patch
@@ -1,3 +1,8 @@
+Upstream-Status: Inappropriate [other]
+Upstream is not making further releases of this software.
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 # Remove libwrap linkage
 # Patch origin: Wind River
 
diff --git a/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/022-add-close-on-exec-descriptors.patch b/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/022-add-close-on-exec-descriptors.patch
index 011ae74..c35bb7c 100644
--- a/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/022-add-close-on-exec-descriptors.patch
+++ b/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/022-add-close-on-exec-descriptors.patch
@@ -1,3 +1,8 @@
+Upstream-Status: Inappropriate [other]
+Upstream is not making further releases of this software.
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 # Force socket fds to close on exec when used in conjunction with pseudo
 # Patch origin: Wind River
 
-- 
1.7.3.4



