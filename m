Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RQ7iB-0008OA-UC
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2011 02:21:20 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 Nov 2011 17:14:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="75519772"
Received: from miles.jf.intel.com (HELO localhost) ([10.7.199.81])
	by orsmga001.jf.intel.com with ESMTP; 14 Nov 2011 17:14:57 -0800
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Nov 2011 17:14:54 -0800
Message-Id: <42c6fe7940f41f5f1ce2ca6c9486c65c9ce22d25.1321319621.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1321319621.git.scott.a.garman@intel.com>
References: <cover.1321319621.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1321319621.git.scott.a.garman@intel.com>
References: <cover.1321319621.git.scott.a.garman@intel.com>
Subject: [PATCH 1/2] dosfstools: add Upstream-Status to patches
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
X-List-Received-Date: Tue, 15 Nov 2011 01:21:20 -0000

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../dosfstools/dosfstools/2.6.20-syscall.patch     |    7 +++++++
 .../dosfstools/dosfstools/alignment_hack.patch     |    4 ++++
 .../dosfstools/dosfstools-msdos_fs-types.patch     |    7 +++++++
 .../dosfstools/include-linux-types.patch           |    5 +++++
 .../dosfstools/dosfstools/mkdosfs-bootcode.patch   |    7 +++++++
 .../dosfstools/dosfstools/mkdosfs-dir.patch        |    7 +++++++
 .../dosfstools/msdos_fat12_undefined.patch         |    7 +++++++
 7 files changed, 44 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/dosfstools/dosfstools/2.6.20-syscall.patch b/meta/recipes-devtools/dosfstools/dosfstools/2.6.20-syscall.patch
index 7cf2662..4460f06 100644
--- a/meta/recipes-devtools/dosfstools/dosfstools/2.6.20-syscall.patch
+++ b/meta/recipes-devtools/dosfstools/dosfstools/2.6.20-syscall.patch
@@ -1,3 +1,10 @@
+Only use the system's llseek().
+
+Upstream-Status: Inappropriate [licensing]
+We're tracking an old release of dosfstools due to licensing issues.
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 Index: dosfstools-2.10/dosfsck/io.c
 ===================================================================
 --- dosfstools-2.10.orig/dosfsck/io.c	2007-06-07 16:15:52.000000000 +0200
diff --git a/meta/recipes-devtools/dosfstools/dosfstools/alignment_hack.patch b/meta/recipes-devtools/dosfstools/dosfstools/alignment_hack.patch
index e15060a..b46b2db 100644
--- a/meta/recipes-devtools/dosfstools/dosfstools/alignment_hack.patch
+++ b/meta/recipes-devtools/dosfstools/dosfstools/alignment_hack.patch
@@ -8,6 +8,10 @@ memcpy into an 16bit aligned
 
     -zecke
 
+Upstream-Status: Inappropriate [licensing]
+We're tracking an old release of dosfstools due to licensing issues.
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
 
 --- dosfstools/dosfsck/boot.c.orig	2003-05-15 19:32:23.000000000 +0200
 +++ dosfstools/dosfsck/boot.c	2003-06-13 17:44:25.000000000 +0200
diff --git a/meta/recipes-devtools/dosfstools/dosfstools/dosfstools-msdos_fs-types.patch b/meta/recipes-devtools/dosfstools/dosfstools/dosfstools-msdos_fs-types.patch
index e70a3ea..35abd1a 100644
--- a/meta/recipes-devtools/dosfstools/dosfstools/dosfstools-msdos_fs-types.patch
+++ b/meta/recipes-devtools/dosfstools/dosfstools/dosfstools-msdos_fs-types.patch
@@ -1,3 +1,10 @@
+Ensure the __s8 type is properly defined.
+
+Upstream-Status: Inappropriate [licensing]
+We're tracking an old release of dosfstools due to licensing issues.
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 --- dosfstools-2.10/dosfsck/dosfsck.h.org	2006-02-21 08:36:14.000000000 -0700
 +++ dosfstools-2.10/dosfsck/dosfsck.h	2006-02-21 08:40:12.000000000 -0700
 @@ -22,6 +22,14 @@
diff --git a/meta/recipes-devtools/dosfstools/dosfstools/include-linux-types.patch b/meta/recipes-devtools/dosfstools/dosfstools/include-linux-types.patch
index 4bbd4e7..ab5c8cf 100644
--- a/meta/recipes-devtools/dosfstools/dosfstools/include-linux-types.patch
+++ b/meta/recipes-devtools/dosfstools/dosfstools/include-linux-types.patch
@@ -5,6 +5,11 @@ include asm/types.h. To work around this patch mkdosfs.c to explicity
 include linux/types.h which will in turn pull in asm/types.h which
 defines these variables.
 
+Upstream-Status: Inappropriate [licensing]
+We're tracking an old release of dosfstools due to licensing issues.
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 --- dosfstools-2.10/mkdosfs/mkdosfs.c~	2006-07-12 18:46:21.000000000 +1000
 +++ dosfstools-2.10/mkdosfs/mkdosfs.c	2006-07-12 18:46:21.000000000 +1000
 @@ -60,6 +60,7 @@
diff --git a/meta/recipes-devtools/dosfstools/dosfstools/mkdosfs-bootcode.patch b/meta/recipes-devtools/dosfstools/dosfstools/mkdosfs-bootcode.patch
index 52be862..dd5cc7f 100644
--- a/meta/recipes-devtools/dosfstools/dosfstools/mkdosfs-bootcode.patch
+++ b/meta/recipes-devtools/dosfstools/dosfstools/mkdosfs-bootcode.patch
@@ -1,3 +1,10 @@
+Add option to read in bootcode from a file.
+
+Upstream-Status: Inappropriate [licensing]
+We're tracking an old release of dosfstools due to licensing issues.
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 diff -urN dosfstools-2.10.orig/mkdosfs/ChangeLog dosfstools-2.10/mkdosfs/ChangeLog
 --- dosfstools-2.10.orig/mkdosfs/ChangeLog	1997-06-18 03:09:38.000000000 -0700
 +++ dosfstools-2.10/mkdosfs/ChangeLog	2004-08-02 20:57:57.734939816 -0700
diff --git a/meta/recipes-devtools/dosfstools/dosfstools/mkdosfs-dir.patch b/meta/recipes-devtools/dosfstools/dosfstools/mkdosfs-dir.patch
index 8f753b0..7feee0f 100644
--- a/meta/recipes-devtools/dosfstools/dosfstools/mkdosfs-dir.patch
+++ b/meta/recipes-devtools/dosfstools/dosfstools/mkdosfs-dir.patch
@@ -1,3 +1,10 @@
+Add -s <directory> support to populate the image.
+
+Upstream-Status: Inappropriate [licensing]
+We're tracking an old release of dosfstools due to licensing issues.
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 diff -urN dosfstools-2.10.orig/mkdosfs/mkdosfs.c dosfstools-2.10/mkdosfs/mkdosfs.c
 --- dosfstools-2.10.orig/mkdosfs/mkdosfs.c	2004-08-02 20:48:45.000000000 -0700
 +++ dosfstools-2.10/mkdosfs/mkdosfs.c	2004-08-02 20:49:44.296953792 -0700
diff --git a/meta/recipes-devtools/dosfstools/dosfstools/msdos_fat12_undefined.patch b/meta/recipes-devtools/dosfstools/dosfstools/msdos_fat12_undefined.patch
index 4987aa3..11e8a75 100644
--- a/meta/recipes-devtools/dosfstools/dosfstools/msdos_fat12_undefined.patch
+++ b/meta/recipes-devtools/dosfstools/dosfstools/msdos_fat12_undefined.patch
@@ -1,3 +1,10 @@
+Fix a compilation error due to undefined MSDOS_FAT12.
+
+Upstream-Status: Inappropriate [licensing]
+We're tracking an old release of dosfstools due to licensing issues.
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 --- dosfstools-2.10/dosfsck/boot.c.orig	2004-10-15 08:51:42.394725176 -0600
 +++ dosfstools-2.10/dosfsck/boot.c	2004-10-15 08:49:16.776862456 -0600
 @@ -14,6 +14,9 @@
-- 
1.7.5.4



