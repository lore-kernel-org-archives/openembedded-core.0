Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rhxrb-0004O6-QQ
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:48 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Jan 2012 22:21:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752336"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:21:20 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:20:37 -0800
Message-Id: <a289b955ae0bcf084f112b39bc72e861d915096a.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 111/113] gnutls: more gettext version fixes
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
X-List-Received-Date: Tue, 03 Jan 2012 06:29:43 -0000

Address [YOCTO #1849]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../gnutls-2.12.14/fix-gettext-version.patch       |   23 +++++++++++++++----
 meta/recipes-support/gnutls/gnutls_2.12.14.bb      |    2 +-
 2 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-support/gnutls/gnutls-2.12.14/fix-gettext-version.patch b/meta/recipes-support/gnutls/gnutls-2.12.14/fix-gettext-version.patch
index a0da765..4c9137a 100644
--- a/meta/recipes-support/gnutls/gnutls-2.12.14/fix-gettext-version.patch
+++ b/meta/recipes-support/gnutls/gnutls-2.12.14/fix-gettext-version.patch
@@ -5,8 +5,8 @@ Signed-off-by: Saul Wold <sgw@linux.intel.com>
 
 Index: gnutls-2.12.14/lib/po/Makefile.in.in
 ===================================================================
---- gnutls-2.12.14.orig/lib/po/Makefile.in.in	2009-11-01 01:43:00.000000000 -0800
-+++ gnutls-2.12.14/lib/po/Makefile.in.in	2011-12-05 12:09:34.349552489 -0800
+--- gnutls-2.12.14.orig/lib/po/Makefile.in.in
++++ gnutls-2.12.14/lib/po/Makefile.in.in
 @@ -8,8 +8,8 @@
  # Please note that the actual code of GNU gettext is covered by the GNU
  # General Public License and is *not* in the public domain.
@@ -20,9 +20,9 @@ Index: gnutls-2.12.14/lib/po/Makefile.in.in
  VERSION = @VERSION@
 Index: gnutls-2.12.14/lib/m4/po.m4
 ===================================================================
---- gnutls-2.12.14.orig/lib/m4/po.m4	2011-12-05 12:12:34.000000000 -0800
-+++ gnutls-2.12.14/lib/m4/po.m4	2011-12-05 12:12:49.429552465 -0800
-@@ -29,7 +29,7 @@
+--- gnutls-2.12.14.orig/lib/m4/po.m4
++++ gnutls-2.12.14/lib/m4/po.m4
+@@ -29,7 +29,7 @@ AC_DEFUN([AM_PO_SUBDIRS],
  
    dnl Release version of the gettext macros. This is used to ensure that
    dnl the gettext macros and po/Makefile.in.in are in sync.
@@ -31,3 +31,16 @@ Index: gnutls-2.12.14/lib/m4/po.m4
  
    dnl Perform the following tests also if --disable-nls has been given,
    dnl because they are needed for "make dist" to work.
+Index: gnutls-2.12.14/lib/configure.ac
+===================================================================
+--- gnutls-2.12.14.orig/lib/configure.ac
++++ gnutls-2.12.14/lib/configure.ac
+@@ -39,7 +39,7 @@ AC_PROG_LIBTOOL
+ LIBGNUTLS_HOOKS
+ 
+ AM_GNU_GETTEXT([external])
+-AM_GNU_GETTEXT_VERSION([0.17])
++AM_GNU_GETTEXT_VERSION([0.18])
+ 
+ AC_C_BIGENDIAN
+ 
diff --git a/meta/recipes-support/gnutls/gnutls_2.12.14.bb b/meta/recipes-support/gnutls/gnutls_2.12.14.bb
index f521f1a..045ba69 100644
--- a/meta/recipes-support/gnutls/gnutls_2.12.14.bb
+++ b/meta/recipes-support/gnutls/gnutls_2.12.14.bb
@@ -1,6 +1,6 @@
 require gnutls.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.3"
 
 SRC_URI += "file://gnutls-openssl.patch \
             file://configure-fix.patch \
-- 
1.7.6.4



