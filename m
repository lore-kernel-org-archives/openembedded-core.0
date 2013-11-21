Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6A4A96CEDB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 16:19:45 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id f4so327696wiw.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 08:19:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=PBoQ/FqB+btzgIVtpcGhXrRAwLYDbqibPdlPKQkRqgw=;
	b=g8xwKffcXPrIkHGWc4ZgHM+pghTqpsEl6PyZbzPEf+itrZzZMa8JRT2iKDu6DWroF7
	uJDJUD/sPcFd0rWJMsW2TOZA5AQ12TWIPWzv6sB2ej8C3GN4XewPcp8b9WGkeBRRtjDq
	tzxqRxz1OK6eK+fUftMSG9I4h+DfKScEwrxf4qTXOArM2A7CLqrfMeRbac4JREmOv5EP
	sHbxgz3WlvryKlMo01D8XObAMn7qdW8vau+UEyy3dnFabaMt2OGqX+TBoFJqzaiyHFWL
	rHsIqD/f/5bqM7u/JQlqH05968z487gCBbveNhqv7q8+1xgg1z/WVPulj+DjNLXdOHQj
	rEjQ==
X-Gm-Message-State: ALoCoQlzhvJOb9Z0KO6akxuCupIC+ePzg0truamJrwnSYgwOtSSkGzJHv5t97tZFs4AzmN/k0Qpr
X-Received: by 10.180.37.112 with SMTP id x16mr983299wij.48.1385050784386;
	Thu, 21 Nov 2013 08:19:44 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	gl10sm5017129wib.11.2013.11.21.08.19.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Nov 2013 08:19:43 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Nov 2013 16:19:38 +0000
Message-Id: <1385050778-16091-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] matcbox-keyboard: bump SRCREV
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
X-List-Received-Date: Thu, 21 Nov 2013 16:19:45 -0000

Bump to the latest commit on the 0.1 branch.

Drop two redundant patches, and update the license data since upstream has been
re-licensed to LGPL v2.1.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../matchbox-keyboard/files/configure_fix.patch    |   15 ------
 .../matchbox-keyboard/files/png-fix.patch          |   49 --------------------
 .../matchbox-keyboard/matchbox-keyboard_git.bb     |   14 +++---
 3 files changed, 6 insertions(+), 72 deletions(-)
 delete mode 100644 meta/recipes-sato/matchbox-keyboard/files/configure_fix.patch
 delete mode 100644 meta/recipes-sato/matchbox-keyboard/files/png-fix.patch

diff --git a/meta/recipes-sato/matchbox-keyboard/files/configure_fix.patch b/meta/recipes-sato/matchbox-keyboard/files/configure_fix.patch
deleted file mode 100644
index 800bf3b..0000000
--- a/meta/recipes-sato/matchbox-keyboard/files/configure_fix.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Index: matchbox-window-manager/configure.ac
-===================================================================
---- matchbox-window-manager.orig/configure.ac	2007-11-14 12:02:28.000000000 +0000
-+++ matchbox-window-manager/configure.ac	2007-11-14 12:18:55.000000000 +0000
-@@ -283,7 +283,7 @@
-     yes)
- 
- 	case "$expat" in
--	  yes)
-+	  yes|"")
- 		EXPAT_LIBS="-lexpat"
- 		;;
- 	    *)
diff --git a/meta/recipes-sato/matchbox-keyboard/files/png-fix.patch b/meta/recipes-sato/matchbox-keyboard/files/png-fix.patch
deleted file mode 100644
index e3834f5..0000000
--- a/meta/recipes-sato/matchbox-keyboard/files/png-fix.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-Change matchbox-keyboard to look for "libpng" instead of "libpng12", and fix the
-code so that it works with the 1.2 and 1.5 API.
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/configure.ac b/configure.ac
-index 9678cf7..9bbbd76 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -171,24 +171,7 @@ dnl ------ Expat ------------------------------------------------------------
- 
- dnl ------ Check for PNG ---------------------------------------------------
- 
--AC_MSG_CHECKING(for libpng12)
--
--if $PKG_CONFIG --exists libpng12; then
--        AC_MSG_RESULT(yes)
--        PNG_LIBS=`$PKG_CONFIG --libs libpng12`
--        PNG_CFLAGS=`$PKG_CONFIG --cflags libpng12`
--else
--        AC_MSG_RESULT(no)
--        AC_CHECK_LIB([png], [png_create_read_struct],
--                      [have_png="yes"], [have_png="no"])
--
--        if test x$have_png=xyes && test x$have_png_h=xyes; then
--            PNG_LIBS="-lpng -lz"
--        else
--            AC_MSG_ERROR([*** Cannot find libpng12 ****])
--        fi
--fi
--
-+PKG_CHECK_MODULES(PNG, libpng)
- 
- dnl ------ Debug Build ------------------------------------------------------
- 
-diff --git a/src/matchbox-keyboard-image.c b/src/matchbox-keyboard-image.c
-index 8accc3e..6b4b0e8 100644
---- a/src/matchbox-keyboard-image.c
-+++ b/src/matchbox-keyboard-image.c
-@@ -65,7 +65,7 @@ png_file_load (const char *file,
-     return NULL;
-   }
- 
--  if ( setjmp( png_ptr->jmpbuf ) ) {
-+  if (setjmp (png_jmpbuf (png_ptr))) {
-     png_destroy_read_struct( &png_ptr, &info_ptr, NULL);
-     fclose(fd);
-     return NULL;
diff --git a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
index ffcabca..489d5a3 100644
--- a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
+++ b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
@@ -3,22 +3,20 @@ HOMEPAGE = "http://matchbox-project.org"
 BUGTRACKER = "http://bugzilla.openedhand.com/"
 SECTION = "x11"
 
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://src/matchbox-keyboard.h;endline=20;md5=4ba16ff913ad245dd6d95a6c67f72526 \
-                    file://applet/applet.c;endline=20;md5=e9201b3efa0a81a160b88d6feb5cf75b"
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
+                    file://src/matchbox-keyboard.h;endline=17;md5=9d6586c69e4a926f3cb0b4425f24ba3c \
+                    file://applet/applet.c;endline=18;md5=4a0f721724746b14d95b51ddd42b95e7"
 
 DEPENDS = "libfakekey expat libxft gtk+ matchbox-panel-2"
 
-SRCREV = "b38f24036cff3be6c2fbcf9ca9881803e69003ac"
+SRCREV = "217f1bfe14c41cf7e291d04a63aa2d79cc13d063"
 PV = "0.0+git${SRCPV}"
 PR = "r4"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN} \
-           file://configure_fix.patch;maxrev=1819 \
            file://single-instance.patch \
-           file://80matchboxkeyboard.shbg \
-           file://png-fix.patch"
+           file://80matchboxkeyboard.shbg"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.10.4


