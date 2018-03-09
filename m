Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 04A577892C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 19:03:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Mar 2018 11:03:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,446,1515484800"; d="scan'208";a="32652031"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Mar 2018 11:03:29 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2018 20:56:04 +0200
Message-Id: <20180309185614.31113-26-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
References: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 26/36] gtk-doc: refresh patches
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
X-List-Received-Date: Fri, 09 Mar 2018 19:03:29 -0000

From: Ross Burton <ross.burton@intel.com>

The patch tool will apply patches by default with "fuzz", which is where if the
hunk context isn't present but what is there is close enough, it will force the
patch in.

Whilst this is useful when there's just whitespace changes, when applied to
source it is possible for a patch applied with fuzz to produce broken code which
still compiles (see #10450).  This is obviously bad.

We'd like to eventually have do_patch() rejecting any fuzz on these grounds. For
that to be realistic the existing patches with fuzz need to be rebased and
reviewed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../gtk-doc/files/pkg-config-native.patch              | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch b/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
index bf03c8f6134..bfbc777ff87 100644
--- a/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
+++ b/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
@@ -10,19 +10,20 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  gtk-doc.m4 | 7 ++++++-
  1 file changed, 6 insertions(+), 1 deletion(-)
 
-diff --git a/gtk-doc.m4 b/gtk-doc.m4
-index 3675543..2590e2a 100644
---- a/gtk-doc.m4
-+++ b/gtk-doc.m4
-@@ -1,6 +1,6 @@
- dnl -*- mode: autoconf -*-
+Index: gtk-doc-1.27/gtk-doc.m4
+===================================================================
+--- gtk-doc-1.27.orig/gtk-doc.m4
++++ gtk-doc-1.27/gtk-doc.m4
+@@ -25,7 +25,7 @@
+ # Macro appear in them. The GNU General Public License (GPL) does govern
+ # all other use of the material that constitutes the Autoconf Macro.
  
 -# serial 2
 +# serial 2.1
  
  dnl Usage:
  dnl   GTK_DOC_CHECK([minimum-gtk-doc-version])
-@@ -10,11 +10,16 @@ AC_DEFUN([GTK_DOC_CHECK],
+@@ -35,11 +35,16 @@ AC_DEFUN([GTK_DOC_CHECK],
    AC_BEFORE([AC_PROG_LIBTOOL],[$0])dnl setup libtool first
    AC_BEFORE([AM_PROG_LIBTOOL],[$0])dnl setup libtool first
  
@@ -39,6 +40,3 @@ index 3675543..2590e2a 100644
    if test "$have_gtk_doc" = "no"; then
        AC_MSG_WARN([
    You will not be able to create source packages with 'make dist'
--- 
-2.15.1
-
-- 
2.16.1


