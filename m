Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 094887886C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 07:48:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w0V7mhJP020164
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 23:48:43 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 30 Jan 2018 23:48:42 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 31 Jan 2018 02:48:16 -0500
Message-ID: <8d4d43de6d056be21c9a73152aa0f2caf09aa981.1517383469.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1517383469.git.hongxu.jia@windriver.com>
References: <cover.1517383469.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/7] ghostscript: 9.21 -> 9.22
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
X-List-Received-Date: Wed, 31 Jan 2018 07:48:42 -0000
Content-Type: text/plain

1. Rebase patches 0001 ~ 0010

2. Drop backported CVE fixes:
- CVE-2016-7977.patch
- CVE-2017-7207.patch
- CVE-2017-5951.patch
- CVE-2017-7975.patch
- CVE-2017-9216.patch
- CVE-2017-9611.patch
- CVE-2017-9612.patch
- CVE-2017-9739.patch
- CVE-2017-9726.patch
- CVE-2017-9727.patch
- CVE-2017-9835.patch
- CVE-2017-11714.patch

3. Clean up PACKAGECONFIG

4. Add packps to support `Auto-generate opdfread.h'
http://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=59c7840aea41253d274d9037b637e60c38359f9f

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0001-contrib.mak-fix-for-parallel-build.patch} |  28 +++--
 ...base-gendev.c-fix-for-Werror-return-type.patch} |   8 +-
 ...nfigure.ac-do-not-check-local-png-source.patch} |  10 +-
 .../0004-avoid-host-contamination.patch}           |  18 ++-
 ...allow-directories-to-be-created-more-tha.patch} |  16 ++-
 .../0006-prevent-recompiling.patch}                |  74 +++++-------
 .../0007-genarch.patch}                            |  34 ++++--
 .../0008-cups-no-gcrypt.patch}                     |  14 ++-
 ...script-native-fix-disable-system-libtiff.patch} |  21 +++-
 ...-add-a-preprocessor-define-to-allow-fope.patch} |  16 ++-
 .../ghostscript/ghostscript/CVE-2016-7977.patch    |  33 ------
 .../ghostscript/ghostscript/CVE-2017-11714.patch   |  61 ----------
 .../ghostscript/ghostscript/CVE-2017-5951.patch    |  44 --------
 .../ghostscript/ghostscript/CVE-2017-7207.patch    |  39 -------
 .../ghostscript/ghostscript/CVE-2017-7975.patch    |  37 ------
 .../ghostscript/ghostscript/CVE-2017-9216.patch    |  36 ------
 .../ghostscript/ghostscript/CVE-2017-9611.patch    |  34 ------
 .../ghostscript/ghostscript/CVE-2017-9612.patch    |  35 ------
 .../ghostscript/ghostscript/CVE-2017-9726.patch    |  33 ------
 .../ghostscript/ghostscript/CVE-2017-9727.patch    |  35 ------
 .../ghostscript/ghostscript/CVE-2017-9739.patch    |  37 ------
 .../ghostscript/ghostscript/CVE-2017-9835.patch    | 125 ---------------------
 .../{ghostscript_9.21.bb => ghostscript_9.22.bb}   |  54 +++------
 23 files changed, 159 insertions(+), 683 deletions(-)
 rename meta/recipes-extended/ghostscript/{ghostscript/ghostscript-9.15-parallel-make.patch => files/0001-contrib.mak-fix-for-parallel-build.patch} (55%)
 rename meta/recipes-extended/ghostscript/{ghostscript/ghostscript-9.16-Werror-return-type.patch => files/0002-base-gendev.c-fix-for-Werror-return-type.patch} (79%)
 rename meta/recipes-extended/ghostscript/files/{do-not-check-local-libpng-source.patch => 0003-configure.ac-do-not-check-local-png-source.patch} (81%)
 rename meta/recipes-extended/ghostscript/{ghostscript/avoid-host-contamination.patch => files/0004-avoid-host-contamination.patch} (61%)
 rename meta/recipes-extended/ghostscript/{ghostscript/mkdir-p.patch => files/0005-ghostscript-allow-directories-to-be-created-more-tha.patch} (80%)
 rename meta/recipes-extended/ghostscript/{ghostscript/ghostscript-9.21-prevent_recompiling.patch => files/0006-prevent-recompiling.patch} (51%)
 rename meta/recipes-extended/ghostscript/{ghostscript/ghostscript-9.02-genarch.patch => files/0007-genarch.patch} (41%)
 rename meta/recipes-extended/ghostscript/{ghostscript/cups-no-gcrypt.patch => files/0008-cups-no-gcrypt.patch} (67%)
 rename meta/recipes-extended/ghostscript/{ghostscript/ghostscript-9.21-native-fix-disable-system-libtiff.patch => files/0009-ghostscript-native-fix-disable-system-libtiff.patch} (66%)
 rename meta/recipes-extended/ghostscript/{ghostscript/base-genht.c-add-a-preprocessor-define-to-allow-fope.patch => files/0010-base-genht.c-add-a-preprocessor-define-to-allow-fope.patch} (65%)
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2016-7977.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2017-11714.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2017-5951.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2017-7207.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2017-7975.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9216.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9611.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9612.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9726.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9727.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9739.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9835.patch
 rename meta/recipes-extended/ghostscript/{ghostscript_9.21.bb => ghostscript_9.22.bb} (66%)

diff --git a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.15-parallel-make.patch b/meta/recipes-extended/ghostscript/files/0001-contrib.mak-fix-for-parallel-build.patch
similarity index 55%
rename from meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.15-parallel-make.patch
rename to meta/recipes-extended/ghostscript/files/0001-contrib.mak-fix-for-parallel-build.patch
index 3ec3956..aab92d3 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.15-parallel-make.patch
+++ b/meta/recipes-extended/ghostscript/files/0001-contrib.mak-fix-for-parallel-build.patch
@@ -1,25 +1,23 @@
-From 14937d9247330065359ca0fb648c28dfa5c3b224 Mon Sep 17 00:00:00 2001
-From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
-Date: Tue, 13 Dec 2016 18:16:41 +0900
-Subject: [PATCH] ghostscript-9.15-parallel-make
+From 706a24153665cd014baa2d3a5496cbf03ecf9ec0 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 30 Jan 2018 14:01:17 +0800
+Subject: [PATCH 01/10] contrib.mak: fix for parallel build
 
-From 767bdf8a412b0cce2b734998e9b7e55abeaf932c Mon Sep 17 00:00:00 2001
-From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
-Date: Tue, 13 Dec 2016 17:55:54 +0900
-Subject: [PATCH] Robert Yang <liezhi.yang@windriver.com> Date: Fri, 30 Jan
-2015 00:40:22 -0800  Subject: [PATCH] contrib.mak: fix for parallel build
-
-Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
 Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
+Rebase to 9.22
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  contrib/contrib.mak | 2 ++
  1 file changed, 2 insertions(+)
 
 diff --git a/contrib/contrib.mak b/contrib/contrib.mak
-index 55415b3..0b6b5ae 100644
+index f5a2fa4..4999752 100644
 --- a/contrib/contrib.mak
 +++ b/contrib/contrib.mak
-@@ -1099,6 +1099,7 @@ $(DEVOBJ)dviprlib.$(OBJ) : $(JAPSRC)dviprlib.c $(JAPSRC)dviprlib.h \
+@@ -1067,6 +1067,7 @@ $(DEVOBJ)dviprlib.$(OBJ) : $(JAPSRC)dviprlib.c $(JAPSRC)dviprlib.h \
  	$(DEVCC) $(O_)$@ $(C_) $(JAPSRC)dviprlib.c
  
  extra-dmprt-install: install-libdata
@@ -27,7 +25,7 @@ index 55415b3..0b6b5ae 100644
  	$(INSTALL_DATA) $(JAPSRC)dmp_init.ps $(DESTDIR)$(gsdatadir)$(D)lib || exit 1
  	$(INSTALL_DATA) $(JAPSRC)dmp_site.ps $(DESTDIR)$(gsdatadir)$(D)lib || exit 1
  	$(INSTALL_DATA) $(JAPSRC)escp_24.src $(DESTDIR)$(gsdatadir)$(D)lib || exit 1
-@@ -1267,6 +1268,7 @@ $(DEVOBJ)gdevalps.$(OBJ) : $(JAPSRC)gdevalps.c $(PDEVH) \
+@@ -1235,6 +1236,7 @@ $(DEVOBJ)gdevalps.$(OBJ) : $(JAPSRC)gdevalps.c $(PDEVH) \
  ### ----------------- Additional .upp files ---------------- ###
  
  extra-upp-install: install-libdata
@@ -36,5 +34,5 @@ index 55415b3..0b6b5ae 100644
  	    $(INSTALL_DATA) $$f $(DESTDIR)$(gsdatadir)$(D)lib || exit 1; \
  	done
 -- 
-2.7.4
+1.8.3.1
 
diff --git a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.16-Werror-return-type.patch b/meta/recipes-extended/ghostscript/files/0002-base-gendev.c-fix-for-Werror-return-type.patch
similarity index 79%
rename from meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.16-Werror-return-type.patch
rename to meta/recipes-extended/ghostscript/files/0002-base-gendev.c-fix-for-Werror-return-type.patch
index d786482..c188fd1 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.16-Werror-return-type.patch
+++ b/meta/recipes-extended/ghostscript/files/0002-base-gendev.c-fix-for-Werror-return-type.patch
@@ -1,7 +1,7 @@
-From 5d5c83c89be0cff29dde2267fa168e6f7146be8c Mon Sep 17 00:00:00 2001
+From 77c2e8458133f95ac15b589f4a6e1ae581208bd7 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Mon, 4 May 2015 22:31:48 -0700
-Subject: [PATCH] base/gendev.c: fix for -Werror=return-type
+Subject: [PATCH 02/10] base/gendev.c: fix for -Werror=return-type
 
 Fixed:
 base/gendev.c:80:1: error: return type defaults to 'int' [-Werror=return-type]
@@ -10,7 +10,7 @@ Upstream-Status: Pending
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 ---
- base/gendev.c |    1 +
+ base/gendev.c | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/base/gendev.c b/base/gendev.c
@@ -26,5 +26,5 @@ index 68a745f..8058b5a 100644
  {
      config conf;
 -- 
-1.7.9.5
+1.8.3.1
 
diff --git a/meta/recipes-extended/ghostscript/files/do-not-check-local-libpng-source.patch b/meta/recipes-extended/ghostscript/files/0003-configure.ac-do-not-check-local-png-source.patch
similarity index 81%
rename from meta/recipes-extended/ghostscript/files/do-not-check-local-libpng-source.patch
rename to meta/recipes-extended/ghostscript/files/0003-configure.ac-do-not-check-local-png-source.patch
index c3e44fe..66fd6e5 100644
--- a/meta/recipes-extended/ghostscript/files/do-not-check-local-libpng-source.patch
+++ b/meta/recipes-extended/ghostscript/files/0003-configure.ac-do-not-check-local-png-source.patch
@@ -1,7 +1,7 @@
-From 5ef8b85bc98f3bd9a15d5f47e24d3e23ae27c265 Mon Sep 17 00:00:00 2001
+From 52885dd446d3a1c014a59b5d55c9a6a11674fe6d Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 18 Jan 2016 01:00:30 -0500
-Subject: [PATCH] configure.ac: do not check local png source
+Subject: [PATCH 03/10] configure.ac: do not check local png source
 
 In oe-core, it did not need to compile local libpng
 source in ghostscript, so do not check local png
@@ -16,10 +16,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index bf6d3f5..01df03f 100644
+index d0f62d7..44a1ed8 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -930,11 +930,11 @@ AC_SUBST(ZLIBDIR)
+@@ -1103,11 +1103,11 @@ AC_SUBST(ZLIBDIR)
  AC_SUBST(FT_SYS_ZLIB)
  
  dnl png for the png output device; it also requires zlib
@@ -34,5 +34,5 @@ index bf6d3f5..01df03f 100644
          SHARE_LIBPNG=0
          LIBPNGDIR=$srcdir/libpng
 -- 
-2.8.1
+1.8.3.1
 
diff --git a/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch b/meta/recipes-extended/ghostscript/files/0004-avoid-host-contamination.patch
similarity index 61%
rename from meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch
rename to meta/recipes-extended/ghostscript/files/0004-avoid-host-contamination.patch
index c4794e7..a0fca8f 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch
+++ b/meta/recipes-extended/ghostscript/files/0004-avoid-host-contamination.patch
@@ -1,14 +1,25 @@
+From 3ffb613395bf1a630aad1e724d8c240a0f1776ea Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 30 Jan 2018 14:04:05 +0800
+Subject: [PATCH 04/10] avoid host contamination
+
 Remove hardcode path refer to host to avoid host contamination.
 
 Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+Rebase to 9.22
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
+ devices/devs.mak | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
 diff --git a/devices/devs.mak b/devices/devs.mak
-index 3070d2e..df663f0 100644
+index 2f00b32..37f9dde 100644
 --- a/devices/devs.mak
 +++ b/devices/devs.mak
-@@ -546,7 +546,7 @@ $(DEVOBJ)gdevxalt.$(OBJ) : $(DEVSRC)gdevxalt.c $(GDEVX) $(math__h) $(memory__h)\
+@@ -392,7 +392,7 @@ $(DEVOBJ)gdevxalt.$(OBJ) : $(DEVSRC)gdevxalt.c $(GDEVX) $(math__h) $(memory__h)\
  ### NON PORTABLE, ONLY UNIX WITH GCC SUPPORT
  
  $(DEVOBJ)X11.so : $(x11alt_) $(x11_) $(DEVS_MAK) $(MAKEDIRS)
@@ -17,3 +28,6 @@ index 3070d2e..df663f0 100644
  
  ###### --------------- Memory-buffered printer devices --------------- ######
  
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript/mkdir-p.patch b/meta/recipes-extended/ghostscript/files/0005-ghostscript-allow-directories-to-be-created-more-tha.patch
similarity index 80%
rename from meta/recipes-extended/ghostscript/ghostscript/mkdir-p.patch
rename to meta/recipes-extended/ghostscript/files/0005-ghostscript-allow-directories-to-be-created-more-tha.patch
index 5a7eab1..e70e65f 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/mkdir-p.patch
+++ b/meta/recipes-extended/ghostscript/files/0005-ghostscript-allow-directories-to-be-created-more-tha.patch
@@ -1,4 +1,8 @@
-ghostscript: allow directories to be created more than once
+From dcc512b4a12a4251ee6fffe6864e8c85ca7ca39c Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 30 Jan 2018 14:05:33 +0800
+Subject: [PATCH 05/10] ghostscript: allow directories to be created more than
+ once
 
 When doing parallel builds, we might try to create directories
 more than once.  This should not cause an error.
@@ -7,7 +11,14 @@ Upstream-Status: Pending
 
 Signed-off-by: Joe Slater <joe.slater@windriver.com>
 
+Rebase to 9.22
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ base/unix-end.mak | 17 ++++++++---------
+ 1 file changed, 8 insertions(+), 9 deletions(-)
 
+diff --git a/base/unix-end.mak b/base/unix-end.mak
+index 689229f..6100eec 100644
 --- a/base/unix-end.mak
 +++ b/base/unix-end.mak
 @@ -17,15 +17,14 @@
@@ -34,3 +45,6 @@ Signed-off-by: Joe Slater <joe.slater@windriver.com>
  
  
  gs: .gssubtarget $(UNIX_END_MAK)
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.21-prevent_recompiling.patch b/meta/recipes-extended/ghostscript/files/0006-prevent-recompiling.patch
similarity index 51%
rename from meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.21-prevent_recompiling.patch
rename to meta/recipes-extended/ghostscript/files/0006-prevent-recompiling.patch
index f2c6d04..f11cecc 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.21-prevent_recompiling.patch
+++ b/meta/recipes-extended/ghostscript/files/0006-prevent-recompiling.patch
@@ -1,6 +1,10 @@
-Just use commands provided by ghostscript-native, preventing recompile them when
-compile ghostscript.
-Way to enable cross compile.
+From 6ea5dde701fb5430d38fa19b7ec2981e9848b646 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 30 Jan 2018 14:10:03 +0800
+Subject: [PATCH 06/10] prevent recompiling
+
+Just use commands provided by ghostscript-native, preventing recompile
+them when compile ghostscript. Way to enable cross compile.
 
 Upstream-Status: Pending
 
@@ -13,20 +17,29 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 Rebase to 9.21
 Signed-off-by: Joe Slater <joe.slater@windriver.com>
 
+Rebase to 9.22
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ base/unix-aux.mak | 43 -------------------------------------------
+ 1 file changed, 43 deletions(-)
+
+diff --git a/base/unix-aux.mak b/base/unix-aux.mak
+index 10a395f..c2e089b 100644
 --- a/base/unix-aux.mak
 +++ b/base/unix-aux.mak
-@@ -66,45 +66,45 @@ $(GLOBJ)gp_sysv.$(OBJ): $(GLSRC)gp_sysv.
+@@ -65,49 +65,6 @@ $(GLOBJ)gp_sysv.$(OBJ): $(GLSRC)gp_sysv.c $(stdio__h) $(time__h) $(AK)\
+ 	$(GLCC) $(GLO_)gp_sysv.$(OBJ) $(C_) $(GLSRC)gp_sysv.c
  
  # -------------------------- Auxiliary programs --------------------------- #
- 
+-
 -$(ECHOGS_XE): $(GLSRC)echogs.c $(AK) $(stdpre_h) $(UNIX_AUX_MAK) $(MAKEDIRS)
 -	$(CCAUX_) $(I_)$(GLSRCDIR)$(_I) $(O_)$(ECHOGS_XE) $(GLSRC)echogs.c $(AUXEXTRALIBS)
 -
-+#$(ECHOGS_XE): $(GLSRC)echogs.c $(AK) $(stdpre_h) $(UNIX_AUX_MAK) $(MAKEDIRS)
-+#	$(CCAUX_) $(I_)$(GLSRCDIR)$(_I) $(O_)$(ECHOGS_XE) $(GLSRC)echogs.c $(AUXEXTRALIBS)
-+#
- # On the RS/6000 (at least), compiling genarch.c with gcc with -O
- # produces a buggy executable.
+-$(PACKPS_XE): $(GLSRC)pack_ps.c $(stdpre_h) $(UNIX_AUX_MAK) $(MAKEDIRS)
+-	$(CCAUX_) $(I_)$(GLSRCDIR)$(_I) $(O_)$(PACKPS_XE) $(GLSRC)pack_ps.c $(AUXEXTRALIBS)
+-
+-# On the RS/6000 (at least), compiling genarch.c with gcc with -O
+-# produces a buggy executable.
 -$(GENARCH_XE): $(GLSRC)genarch.c $(AK) $(GENARCH_DEPS) $(UNIX_AUX_MAK) $(MAKEDIRS)
 -	$(CCAUX_) $(I_)$(GLSRCDIR)$(_I) $(O_)$(GENARCH_XE) $(GLSRC)genarch.c $(AUXEXTRALIBS)
 -
@@ -39,21 +52,9 @@ Signed-off-by: Joe Slater <joe.slater@windriver.com>
 -$(GENHT_XE): $(GLSRC)genht.c $(AK) $(GENHT_DEPS) $(UNIX_AUX_MAK) $(MAKEDIRS)
 -	$(CCAUX_) $(GENHT_CFLAGS) $(O_)$(GENHT_XE) $(GLSRC)genht.c $(AUXEXTRALIBS)
 -
-+#$(GENARCH_XE): $(GLSRC)genarch.c $(AK) $(GENARCH_DEPS) $(UNIX_AUX_MAK) $(MAKEDIRS)
-+#	$(CCAUX_) $(I_)$(GLSRCDIR)$(_I) $(O_)$(GENARCH_XE) $(GLSRC)genarch.c $(AUXEXTRALIBS)
-+#
-+#$(GENCONF_XE): $(GLSRC)genconf.c $(AK) $(GENCONF_DEPS) $(UNIX_AUX_MAK) $(MAKEDIRS)
-+#	$(CCAUX_) $(I_)$(GLSRCDIR)$(_I) $(O_)$(GENCONF_XE) $(GLSRC)genconf.c $(AUXEXTRALIBS)
-+#
-+#$(GENDEV_XE): $(GLSRC)gendev.c $(AK) $(GENDEV_DEPS) $(UNIX_AUX_MAK) $(MAKEDIRS)
-+#	$(CCAUX_) $(I_)$(GLSRCDIR)$(_I) $(O_)$(GENDEV_XE) $(GLSRC)gendev.c $(AUXEXTRALIBS)
-+#
-+#$(GENHT_XE): $(GLSRC)genht.c $(AK) $(GENHT_DEPS) $(UNIX_AUX_MAK) $(MAKEDIRS)
-+#	$(CCAUX_) $(GENHT_CFLAGS) $(O_)$(GENHT_XE) $(GLSRC)genht.c $(AUXEXTRALIBS)
-+#
- # To get GS to use the system zlib, you remove/hide the gs/zlib directory
- # which means that the mkromfs build can't find the zlib source it needs.
- # So it's split into two targets, one using the zlib source directly.....
+-# To get GS to use the system zlib, you remove/hide the gs/zlib directory
+-# which means that the mkromfs build can't find the zlib source it needs.
+-# So it's split into two targets, one using the zlib source directly.....
 -MKROMFS_OBJS_0=$(MKROMFS_ZLIB_OBJS) $(AUX)gpmisc.$(OBJ) $(AUX)gp_getnv.$(OBJ) \
 - $(AUX)gscdefs.$(OBJ) $(AUX)gp_unix.$(OBJ) $(AUX)gp_unifs.$(OBJ) $(AUX)gp_unifn.$(OBJ) \
 - $(AUX)gp_stdia.$(OBJ) $(AUX)gsutil.$(OBJ) $(AUX)memento.$(OBJ)
@@ -61,14 +62,7 @@ Signed-off-by: Joe Slater <joe.slater@windriver.com>
 -$(MKROMFS_XE)_0: $(GLSRC)mkromfs.c $(MKROMFS_COMMON_DEPS) $(MKROMFS_OBJS_0) $(UNIX_AUX_MAK) $(MAKEDIRS)
 -	$(CCAUX_) $(GENOPTAUX) $(I_)$(GLSRCDIR)$(_I) $(I_)$(GLOBJ)$(_I) $(I_)$(ZSRCDIR)$(_I) $(GLSRC)mkromfs.c $(O_)$(MKROMFS_XE)_0 $(MKROMFS_OBJS_0) $(AUXEXTRALIBS)
 -
-+#MKROMFS_OBJS_0=$(MKROMFS_ZLIB_OBJS) $(AUX)gpmisc.$(OBJ) $(AUX)gp_getnv.$(OBJ) \
-+# $(AUX)gscdefs.$(OBJ) $(AUX)gp_unix.$(OBJ) $(AUX)gp_unifs.$(OBJ) $(AUX)gp_unifn.$(OBJ) \
-+# $(AUX)gp_stdia.$(OBJ) $(AUX)gsutil.$(OBJ) $(AUX)memento.$(OBJ)
-+#
-+#$(MKROMFS_XE)_0: $(GLSRC)mkromfs.c $(MKROMFS_COMMON_DEPS) $(MKROMFS_OBJS_0) $(UNIX_AUX_MAK) $(MAKEDIRS)
-+#	$(CCAUX_) $(GENOPTAUX) $(I_)$(GLSRCDIR)$(_I) $(I_)$(GLOBJ)$(_I) $(I_)$(ZSRCDIR)$(_I) $(GLSRC)mkromfs.c $(O_)$(MKROMFS_XE)_0 $(MKROMFS_OBJS_0) $(AUXEXTRALIBS)
-+#
- # .... and one using the zlib library linked via the command line
+-# .... and one using the zlib library linked via the command line
 -MKROMFS_OBJS_1=$(AUX)gscdefs.$(OBJ) \
 - $(AUX)gpmisc.$(OBJ) $(AUX)gp_getnv.$(OBJ) \
 - $(AUX)gp_unix.$(OBJ) $(AUX)gp_unifs.$(OBJ) $(AUX)gp_unifn.$(OBJ) \
@@ -80,17 +74,9 @@ Signed-off-by: Joe Slater <joe.slater@windriver.com>
 -$(MKROMFS_XE): $(MKROMFS_XE)_$(SHARE_ZLIB) $(UNIX_AUX_MAK) $(MAKEDIRS)
 -	$(CP_) $(MKROMFS_XE)_$(SHARE_ZLIB) $(MKROMFS_XE)
 -
-+#MKROMFS_OBJS_1=$(AUX)gscdefs.$(OBJ) \
-+# $(AUX)gpmisc.$(OBJ) $(AUX)gp_getnv.$(OBJ) \
-+# $(AUX)gp_unix.$(OBJ) $(AUX)gp_unifs.$(OBJ) $(AUX)gp_unifn.$(OBJ) \
-+# $(AUX)gp_stdia.$(OBJ) $(AUX)gsutil.$(OBJ)
-+#
-+#$(MKROMFS_XE)_1: $(GLSRC)mkromfs.c $(MKROMFS_COMMON_DEPS) $(MKROMFS_OBJS_1) $(UNIX_AUX_MAK) $(MAKEDIRS)
-+#	$(CCAUX_) $(GENOPTAUX) $(I_)$(GLSRCDIR)$(_I) $(I_)$(GLOBJ)$(_I) $(I_)$(ZSRCDIR)$(_I) $(GLSRC)mkromfs.c $(O_)$(MKROMFS_XE)_1 $(MKROMFS_OBJS_1) $(AUXEXTRALIBS)
-+#
-+#$(MKROMFS_XE): $(MKROMFS_XE)_$(SHARE_ZLIB) $(UNIX_AUX_MAK) $(MAKEDIRS)
-+#	$(CP_) $(MKROMFS_XE)_$(SHARE_ZLIB) $(MKROMFS_XE)
-+#
  # Query the environment to construct gconfig_.h.
  # These are all defined conditionally (except the JasPER one), so that
  # they can be overridden by settings from the configure script.
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-genarch.patch b/meta/recipes-extended/ghostscript/files/0007-genarch.patch
similarity index 41%
rename from meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-genarch.patch
rename to meta/recipes-extended/ghostscript/files/0007-genarch.patch
index e28a949..bbd9583 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-genarch.patch
+++ b/meta/recipes-extended/ghostscript/files/0007-genarch.patch
@@ -1,22 +1,29 @@
-Import patch from windriver linux for cross compilation, and split patches
-into oe way under different directories such as i586, powerpc etc according 
-to Richard's opinion.
+From 7026d9863ffd3ecc3fd1670a9b574e2bd1b5bff1 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 30 Jan 2018 14:13:09 +0800
+Subject: [PATCH 07/10] genarch
+
+Import patch from windriver linux for cross compilation, and split
+patches into oe way under different directories such as i586,
+powerpc etc according to Richard's opinion.
 
 Upstream-Status: Pending
 
 Signed-off-by: Kang Kai <kai.kang@windriver.com>
 Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
 
-# Author: Chi Xu <chi.xu@windriver.com>
-# Date: Feb 26 2010
-# Summary: Generate arch.h for ppc32
-#
+Rebase to 9.22
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ base/lib.mak | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff -Nru ghostscript-8.64.orig/base/lib.mak ghostscript-8.64/base/lib.mak
---- ghostscript-8.64.orig/base/lib.mak	2010-02-10 10:30:02.000000000 +0800
-+++ ghostscript-8.64/base/lib.mak	2010-02-10 10:56:21.000000000 +0800
-@@ -67,8 +67,8 @@
- stdpre_h=$(GLSRC)stdpre.h $(stdpn_h)
+diff --git a/base/lib.mak b/base/lib.mak
+index ee0247f..22e1257 100644
+--- a/base/lib.mak
++++ b/base/lib.mak
+@@ -86,8 +86,8 @@ arch_h=$(GLGEN)arch.h
+ stdpre_h=$(GLSRC)stdpre.h
  stdint__h=$(GLSRC)stdint_.h $(std_h)
  
 -$(GLGEN)arch.h : $(GENARCH_XE)
@@ -26,3 +33,6 @@ diff -Nru ghostscript-8.64.orig/base/lib.mak ghostscript-8.64/base/lib.mak
  
  # Platform interfaces
  
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript/cups-no-gcrypt.patch b/meta/recipes-extended/ghostscript/files/0008-cups-no-gcrypt.patch
similarity index 67%
rename from meta/recipes-extended/ghostscript/ghostscript/cups-no-gcrypt.patch
rename to meta/recipes-extended/ghostscript/files/0008-cups-no-gcrypt.patch
index a1c9368..62afd85 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/cups-no-gcrypt.patch
+++ b/meta/recipes-extended/ghostscript/files/0008-cups-no-gcrypt.patch
@@ -1,6 +1,12 @@
-Subject: [PATCH] Don't build-depend on libgcrypt, as nothing is used from it
+From 861553fc2422b7b84bd322c4f9d911d8e61e830b Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 30 Jan 2018 14:15:53 +0800
+Subject: [PATCH 08/10] cups no gcrypt
 
-Backported from http://www.cups.org/strfiles.php/3308/cups-no-gcrypt.patch
+Don't build-depend on libgcrypt, as nothing is used from it
+
+Backported from
+http://www.cups.org/strfiles.php/3308/cups-no-gcrypt.patch
 
 This addresses the cryto dependency seen during build.
 
@@ -8,7 +14,7 @@ Upstream-Status: Backport
 
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
 
-Rebase the patch to ghostscript-9.15
+Rebase to 9.22
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  cups/libs/cups/http-private.h | 1 -
@@ -27,5 +33,5 @@ index 99a85c3..a674852 100644
  #    include <CoreFoundation/CoreFoundation.h>
  #    include <Security/Security.h>
 -- 
-1.9.1
+1.8.3.1
 
diff --git a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.21-native-fix-disable-system-libtiff.patch b/meta/recipes-extended/ghostscript/files/0009-ghostscript-native-fix-disable-system-libtiff.patch
similarity index 66%
rename from meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.21-native-fix-disable-system-libtiff.patch
rename to meta/recipes-extended/ghostscript/files/0009-ghostscript-native-fix-disable-system-libtiff.patch
index bff3e61..b6a0026 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.21-native-fix-disable-system-libtiff.patch
+++ b/meta/recipes-extended/ghostscript/files/0009-ghostscript-native-fix-disable-system-libtiff.patch
@@ -1,19 +1,27 @@
-ghostscript-native:fix disable-system-libtiff
+From 218f1590de04f88b53147ad42cb45b04e5566c06 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 30 Jan 2018 14:33:28 +0800
+Subject: [PATCH 09/10] ghostscript-native:fix disable-system-libtiff
 
 Modify configure to add the check to make sure
 ghostscrip could work while system-libtiff is
 disabled.
 
+Upstream-Status: Pending
+
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 
 Updated to apply to ghostscript 9.21.
-
 Signed-off-by: Joe Slater <joe.slater@windriver.com>
 
-Upstream-Status: Pending
-
-
+Rebase to 9.22
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ configure.ac | 5 +++++
+ 1 file changed, 5 insertions(+)
 
+diff --git a/configure.ac b/configure.ac
+index 44a1ed8..ad0db94 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -1259,6 +1259,7 @@ case "x$with_system_libtiff" in
@@ -35,3 +43,6 @@ Upstream-Status: Pending
  fi
  
  AC_SUBST(SHARE_LIBTIFF)
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript/base-genht.c-add-a-preprocessor-define-to-allow-fope.patch b/meta/recipes-extended/ghostscript/files/0010-base-genht.c-add-a-preprocessor-define-to-allow-fope.patch
similarity index 65%
rename from meta/recipes-extended/ghostscript/ghostscript/base-genht.c-add-a-preprocessor-define-to-allow-fope.patch
rename to meta/recipes-extended/ghostscript/files/0010-base-genht.c-add-a-preprocessor-define-to-allow-fope.patch
index d97d4ec..9dc2d1d 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/base-genht.c-add-a-preprocessor-define-to-allow-fope.patch
+++ b/meta/recipes-extended/ghostscript/files/0010-base-genht.c-add-a-preprocessor-define-to-allow-fope.patch
@@ -1,4 +1,8 @@
-base/genht.c: add a preprocessor define to allow fopen calling
+From 8574add6c9818df75e3e205f2ad9e2b3fa4566d4 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 30 Jan 2018 14:36:11 +0800
+Subject: [PATCH 10/10] base/genht.c: add a preprocessor define to allow fopen
+ calling
 
 The commit in upstream:
 http://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=773c69e46e70bdd5482676437dafd2ca83397643
@@ -7,17 +11,21 @@ Replace all fopen calls with gp_fopen and add a preprocessor define so
 that any unintential calls directly to fopen will cause an error.
 
 Only exceptions are those in the platform specific code, and mkromfs.c.
-This patch add a preprocessor define to allow fopen calling in base/genht.c.
+This patch add a preprocessor define to allow fopen calling in
+base/genht.c.
 
 Upstream-Status: Pending
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+Rebase to 9.22
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  base/genht.c | 4 ++++
  1 file changed, 4 insertions(+)
 
 diff --git a/base/genht.c b/base/genht.c
-index 4b04085..cc82fff 100644
+index 606a704..9970e66 100644
 --- a/base/genht.c
 +++ b/base/genht.c
 @@ -16,6 +16,10 @@
@@ -32,5 +40,5 @@ index 4b04085..cc82fff 100644
  #include "string_.h"
  #include "gscdefs.h"
 -- 
-1.8.1.2
+1.8.3.1
 
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2016-7977.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2016-7977.patch
deleted file mode 100644
index b7eed12..0000000
--- a/meta/recipes-extended/ghostscript/ghostscript/CVE-2016-7977.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 8abd22010eb4db0fb1b10e430d5f5d83e015ef70 Mon Sep 17 00:00:00 2001
-From: Chris Liddell <chris.liddell@artifex.com>
-Date: Mon, 3 Oct 2016 01:46:28 +0100
-Subject: [PATCH] Bug 697169: Be rigorous with SAFER permissions
-
-Once we've opened our input file from the command line, enforce the SAFER
-rules.
-
-Upstream-Status: Backport
-CVE: CVE-2016-7977
-
-Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
----
- psi/zfile.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/psi/zfile.c b/psi/zfile.c
-index b6caea2..2c6c958 100644
---- a/psi/zfile.c
-+++ b/psi/zfile.c
-@@ -1081,6 +1081,9 @@ lib_file_open(gs_file_path_ptr  lib_path, const gs_memory_t *mem, i_ctx_t *i_ctx
-     gs_main_instance *minst = get_minst_from_memory(mem);
-     int code;
- 
-+    if (i_ctx_p && starting_arg_file)
-+        i_ctx_p->starting_arg_file = false;
-+
-     /* when starting arg files (@ files) iodev_default is not yet set */
-     if (iodev == 0)
-         iodev = (gx_io_device *)gx_io_device_table[0];
--- 
-2.10.2
-
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-11714.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-11714.patch
deleted file mode 100644
index 84983c5..0000000
--- a/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-11714.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 671fd59eb657743aa86fbc1895cb15872a317caa Mon Sep 17 00:00:00 2001
-From: Chris Liddell <chris.liddell@artifex.com>
-Date: Thu, 6 Jul 2017 14:54:02 +0100
-Subject: [PATCH] Bug 698158: prevent trying to reloc a freed object
-
-In the token reader, we pass the scanner state structure around as a
-t_struct ref on the Postscript operand stack.
-
-But we explicitly free the scanner state when we're done, which leaves a
-dangling reference on the operand stack and, unless that reference gets
-overwritten before the next garbager run, we can end up with the garbager
-trying to deal with an already freed object - that can cause a crash, or
-memory corruption.
----
- psi/ztoken.c |   14 +++++++++++++-
- 1 file changed, 13 insertions(+), 1 deletion(-)
-
---- end of original header
-
-CVE: CVE-2017-11714
-
-Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-
-diff --git a/psi/ztoken.c b/psi/ztoken.c
-index 4dba7c5..af1ceeb 100644
---- a/psi/ztoken.c
-+++ b/psi/ztoken.c
-@@ -107,6 +107,12 @@ token_continue(i_ctx_t *i_ctx_p, scanner_state * pstate, bool save)
-     int code;
-     ref token;
- 
-+    /* Since we might free pstate below, and we're dealing with
-+     * gc memory referenced by the stack, we need to explicitly
-+     * remove the reference to pstate from the stack, otherwise
-+     * the garbager will fall over
-+     */
-+    make_null(osp);
-     /* Note that gs_scan_token may change osp! */
-     pop(1);                     /* remove the file or scanner state */
- again:
-@@ -183,8 +189,14 @@ ztokenexec_continue(i_ctx_t *i_ctx_p)
- static int
- tokenexec_continue(i_ctx_t *i_ctx_p, scanner_state * pstate, bool save)
- {
--    os_ptr op;
-+    os_ptr op = osp;
-     int code;
-+    /* Since we might free pstate below, and we're dealing with
-+     * gc memory referenced by the stack, we need to explicitly
-+     * remove the reference to pstate from the stack, otherwise
-+     * the garbager will fall over
-+     */
-+    make_null(osp);
-     /* Note that gs_scan_token may change osp! */
-     pop(1);
- again:
--- 
-1.7.9.5
-
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-5951.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-5951.patch
deleted file mode 100644
index 62cc134..0000000
--- a/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-5951.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From bfa6b2ecbe48edc69a7d9d22a12419aed25960b8 Mon Sep 17 00:00:00 2001
-From: Chris Liddell <chris.liddell@artifex.com>
-Date: Thu, 6 Apr 2017 16:44:54 +0100
-Subject: [PATCH] Bug 697548: use the correct param list enumerator
-
-When we encountered dictionary in a ref_param_list, we were using the enumerator
-for the "parent" param_list, rather than the enumerator for the param_list
-we just created for the dictionary. That parent was usually the stack
-list enumerator, and caused a segfault.
-
-Using the correct enumerator works better.
-
-Upstream-Status: Backport
-CVE: CVE-2017-5951
-
-Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
----
- psi/iparam.c | 7 ++++---
- 1 file changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/psi/iparam.c b/psi/iparam.c
-index 4e63b6d..b2fa85f 100644
---- a/psi/iparam.c
-+++ b/psi/iparam.c
-@@ -770,12 +770,13 @@ ref_param_read_typed(gs_param_list * plist, gs_param_name pkey,
-                 gs_param_enumerator_t enumr;
-                 gs_param_key_t key;
-                 ref_type keytype;
-+                dict_param_list *dlist = (dict_param_list *) pvalue->value.d.list;
- 
-                 param_init_enumerator(&enumr);
--                if (!(*((iparam_list *) plist)->enumerate)
--                    ((iparam_list *) pvalue->value.d.list, &enumr, &key, &keytype)
-+                if (!(*(dlist->enumerate))
-+                    ((iparam_list *) dlist, &enumr, &key, &keytype)
-                     && keytype == t_integer) {
--                    ((dict_param_list *) pvalue->value.d.list)->int_keys = 1;
-+                    dlist->int_keys = 1;
-                     pvalue->type = gs_param_type_dict_int_keys;
-                 }
-             }
--- 
-2.10.2
-
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-7207.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-7207.patch
deleted file mode 100644
index a05dc02..0000000
--- a/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-7207.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 0e88bee1304993668fede72498d656a2dd33a35e Mon Sep 17 00:00:00 2001
-From: Ken Sharp <ken.sharp@artifex.com>
-Date: Mon, 20 Mar 2017 09:34:11 +0000
-Subject: [PATCH] Ensure a device has raster memory, before trying to read it.
-
-Bug #697676 "Null pointer dereference in mem_get_bits_rectangle()"
-
-This is only possible by abusing/mis-using Ghostscript-specific
-language extensions, so cannot happen in a general PostScript program.
-
-Nevertheless, Ghostscript should not crash. So this commit checks the
-memory device to see if raster memory has been allocated, before trying
-to read from it.
-
-Upstream-Status: Backport
-CVE: CVE-2017-7207
-
-Author: Ken Sharp <ken.sharp@artifex.com>
-Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
----
- base/gdevmem.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/base/gdevmem.c b/base/gdevmem.c
-index 41108ba..183f96d 100644
---- a/base/gdevmem.c
-+++ b/base/gdevmem.c
-@@ -605,6 +605,8 @@ mem_get_bits_rectangle(gx_device * dev, const gs_int_rect * prect,
-             GB_PACKING_CHUNKY | GB_COLORS_NATIVE | GB_ALPHA_NONE;
-         return_error(gs_error_rangecheck);
-     }
-+    if (mdev->line_ptrs == 0x00)
-+        return_error(gs_error_rangecheck);
-     if ((w <= 0) | (h <= 0)) {
-         if ((w | h) < 0)
-             return_error(gs_error_rangecheck);
--- 
-2.10.2
-
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-7975.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-7975.patch
deleted file mode 100644
index e406086..0000000
--- a/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-7975.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From b39be1019b4acc1aa50c6026463c543332e95a31 Mon Sep 17 00:00:00 2001
-From: Catalin Enache <catalin.enache@windriver.com>
-Date: Mon, 8 May 2017 16:18:14 +0300
-
-Subject: [PATCH] Bug 697693: Prevent SEGV due to integer overflow.
-
-While building a Huffman table, the start and end points were susceptible
-to integer overflow.
-
-Thank you to Jiaqi for finding this issue and suggesting a patch.
-
-Upstream-Status: Backport
-CVE: CVE-2017-7975
-
-Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
-
-Contents of this patch were extracted from a larger patch which addressed
-two CVE's.  The context (location of {) was also modified to apply to
-ghostscript 9.21.
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-
-
---- a/jbig2dec/jbig2_huffman.c
-+++ b/jbig2dec/jbig2_huffman.c
-@@ -421,8 +421,8 @@ jbig2_build_huffman_table(Jbig2Ctx *ctx,
- 
-             if (PREFLEN == CURLEN) {
-                 int RANGELEN = lines[CURTEMP].RANGELEN;
--                int start_j = CURCODE << shift;
--                int end_j = (CURCODE + 1) << shift;
-+                uint32_t start_j = CURCODE << shift;
-+                uint32_t end_j = (CURCODE + 1) << shift;
-                 byte eflags = 0;
- 
-                 if (end_j > max_j) {
-
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9216.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9216.patch
deleted file mode 100644
index 1caeb3e..0000000
--- a/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9216.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 3ebffb1d96ba0cacec23016eccb4047dab365853 Mon Sep 17 00:00:00 2001
-From: Shailesh Mistry <shailesh.mistry@hotmail.co.uk>
-Date: Wed, 24 May 2017 19:29:57 +0100
-Subject: [PATCH] Bug 697934: Fix SEGV due to error code being ignored.
-
-The return code from jbig2_decode_text_region was being ignored so the
-code continued to try and parse the invalid file using incomplete/empty
-structures.
-
-Upstream-Status: Backport
-CVE: CVE-2017-9216
-
-Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
----
- jbig2dec/jbig2_symbol_dict.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/jbig2dec/jbig2_symbol_dict.c b/jbig2dec/jbig2_symbol_dict.c
-index 3cc1731..672425d 100644
---- a/jbig2dec/jbig2_symbol_dict.c
-+++ b/jbig2dec/jbig2_symbol_dict.c
-@@ -493,8 +493,10 @@ jbig2_decode_symbol_dict(Jbig2Ctx *ctx,
-                         }
- 
-                         /* multiple symbols are handled as a text region */
--                        jbig2_decode_text_region(ctx, segment, tparams, (const Jbig2SymbolDict * const *)refagg_dicts,
-+                        code = jbig2_decode_text_region(ctx, segment, tparams, (const Jbig2SymbolDict * const *)refagg_dicts,
-                                                  n_refagg_dicts, image, data, size, GR_stats, as, ws);
-+                        if (code < 0)
-+                            goto cleanup4;
- 
-                         SDNEWSYMS->glyphs[NSYMSDECODED] = image;
-                         refagg_dicts[0]->glyphs[params->SDNUMINSYMS + NSYMSDECODED] = jbig2_image_clone(ctx, SDNEWSYMS->glyphs[NSYMSDECODED]);
--- 
-2.10.2
-
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9611.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9611.patch
deleted file mode 100644
index 58ef04d..0000000
--- a/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9611.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From c7c55972758a93350882c32147801a3485b010fe Mon Sep 17 00:00:00 2001
-From: Chris Liddell <chris.liddell@artifex.com>
-Date: Mon, 12 Jun 2017 13:08:40 +0100
-Subject: [PATCH] Bug 698024: bounds check zone pointer in Ins_MIRP()
-
----
- base/ttinterp.c |    3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
---- end of original header
-
-CVE: CVE-2017-9611
-
-Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-
-diff --git a/base/ttinterp.c b/base/ttinterp.c
-index e56aec6..f6a6d95 100644
---- a/base/ttinterp.c
-+++ b/base/ttinterp.c
-@@ -3858,7 +3858,8 @@ static int nInstrCount=0;
-     /* XXX: UNDOCUMENTED! cvt[-1] = 0 always */
- 
-     if ( BOUNDS( args[0],   CUR.zp1.n_points ) ||
--         BOUNDS( args[1]+1, CUR.cvtSize+1 )    )
-+         BOUNDS( args[1]+1, CUR.cvtSize+1 )    ||
-+         BOUNDS(CUR.GS.rp0,  CUR.zp0.n_points) )
-     {
-       CUR.error = TT_Err_Invalid_Reference;
-       return;
--- 
-1.7.9.5
-
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9612.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9612.patch
deleted file mode 100644
index b737cc56..0000000
--- a/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9612.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 98f6da60b9d463c617e631fc254cf6d66f2e8e3c Mon Sep 17 00:00:00 2001
-From: Chris Liddell <chris.liddell@artifex.com>
-Date: Mon, 12 Jun 2017 13:15:17 +0100
-Subject: [PATCH] Bug 698026: bounds check zone pointers in Ins_IP()
-
----
- base/ttinterp.c |    4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
---- end of original header
-
-CVE: CVE-2017-9612
-
-Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-
-diff --git a/base/ttinterp.c b/base/ttinterp.c
-index f6a6d95..e7c9d68 100644
---- a/base/ttinterp.c
-+++ b/base/ttinterp.c
-@@ -4129,7 +4129,9 @@ static int nInstrCount=0;
-     Int         point;
-     (void)args;
- 
--    if ( CUR.top < CUR.GS.loop )
-+    if ( CUR.top < CUR.GS.loop ||
-+         BOUNDS(CUR.GS.rp1, CUR.zp0.n_points) ||
-+         BOUNDS(CUR.GS.rp2, CUR.zp1.n_points))
-     {
-       CUR.error = TT_Err_Invalid_Reference;
-       return;
--- 
-1.7.9.5
-
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9726.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9726.patch
deleted file mode 100644
index 3e6c656..0000000
--- a/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9726.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 7755e67116e8973ee0e3b22d653df026a84fa01b Mon Sep 17 00:00:00 2001
-From: Chris Liddell <chris.liddell@artifex.com>
-Date: Thu, 15 Jun 2017 08:58:31 +0100
-Subject: [PATCH] Bug 698055: bounds check zone pointer in Ins_MDRP
-
----
- base/ttinterp.c |    3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
---- end of original header
-
-CVE: CVE-2017-9726
-
-Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-diff --git a/base/ttinterp.c b/base/ttinterp.c
-index e7c9d68..af457e8 100644
---- a/base/ttinterp.c
-+++ b/base/ttinterp.c
-@@ -3770,7 +3770,8 @@ static int nInstrCount=0;
- 
-     point = (Int)args[0];
- 
--    if ( BOUNDS( args[0], CUR.zp1.n_points ) )
-+    if ( BOUNDS( args[0], CUR.zp1.n_points ) ||
-+         BOUNDS( CUR.GS.rp0, CUR.zp0.n_points) )
-     {
-         /* Current version of FreeType silently ignores this out of bounds error
-          * and drops the instruction, see bug #691121
--- 
-1.7.9.5
-
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9727.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9727.patch
deleted file mode 100644
index a2f7bfa..0000000
--- a/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9727.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 937ccd17ac65935633b2ebc06cb7089b91e17e6b Mon Sep 17 00:00:00 2001
-From: Chris Liddell <chris.liddell@artifex.com>
-Date: Thu, 15 Jun 2017 09:05:20 +0100
-Subject: [PATCH] Bug 698056: make bounds check in gx_ttfReader__Read more
- robust
-
----
- base/gxttfb.c |    3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
---- end of original header
-
-CVE: CVE-2017-9727
-
-Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-
-diff --git a/base/gxttfb.c b/base/gxttfb.c
-index 0e9a444..e1561af 100644
---- a/base/gxttfb.c
-+++ b/base/gxttfb.c
-@@ -79,7 +79,8 @@ static void gx_ttfReader__Read(ttfReader *self, void *p, int n)
-     if (!r->error) {
-         if (r->extra_glyph_index != -1) {
-             q = r->glyph_data.bits.data + r->pos;
--            r->error = (r->glyph_data.bits.size - r->pos < n ?
-+            r->error = ((r->pos >= r->glyph_data.bits.size ||
-+                        r->glyph_data.bits.size - r->pos < n) ?
-                             gs_note_error(gs_error_invalidfont) : 0);
-             if (r->error == 0)
-                 memcpy(p, q, n);
--- 
-1.7.9.5
-
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9739.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9739.patch
deleted file mode 100644
index 69a94df..0000000
--- a/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9739.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From c501a58f8d5650c8ba21d447c0d6f07eafcb0f15 Mon Sep 17 00:00:00 2001
-From: Chris Liddell <chris.liddell@artifex.com>
-Date: Fri, 16 Jun 2017 08:29:25 +0100
-Subject: [PATCH] Bug 698063: Bounds check Ins_JMPR
-
----
- base/ttinterp.c |    6 ++++++
- 1 file changed, 6 insertions(+)
-
---- end of original header
-
-CVE: CVE-2017-9739
-
-Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-
-diff --git a/base/ttinterp.c b/base/ttinterp.c
-index af457e8..adf3f0c 100644
---- a/base/ttinterp.c
-+++ b/base/ttinterp.c
-@@ -1794,6 +1794,12 @@ static int nInstrCount=0;
- 
-   static void  Ins_JMPR( INS_ARG )
-   {
-+    if ( BOUNDS(CUR.IP + args[0], CUR.codeSize ) )
-+    {
-+      CUR.error = TT_Err_Invalid_Reference;
-+      return;
-+    }
-+
-     CUR.IP      += (Int)(args[0]);
-     CUR.step_ins = FALSE;
- 
--- 
-1.7.9.5
-
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9835.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9835.patch
deleted file mode 100644
index 7c65690..0000000
--- a/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9835.patch
+++ /dev/null
@@ -1,125 +0,0 @@
-From cfde94be1d4286bc47633c6e6eaf4e659bd78066 Mon Sep 17 00:00:00 2001
-From: Chris Liddell <chris.liddell@artifex.com>
-Date: Wed, 7 Jun 2017 14:55:12 +0100
-Subject: [PATCH] Bug 697985: bounds check the array allocations methods
-
-The clump allocator has four allocation functions that use 'number of elements'
-and 'size of elements' parameters (rather than a simple 'number of bytes').
-
-Those need specific bounds checking.
----
- base/gsalloc.c |   42 ++++++++++++++++++++++++++++--------------
- 1 file changed, 28 insertions(+), 14 deletions(-)
-
---- end of original header
-
-CVE: CVE-2017-9835
-
-Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-
-diff --git a/base/gsalloc.c b/base/gsalloc.c
-index 741ba00..10c04dd 100644
---- a/base/gsalloc.c
-+++ b/base/gsalloc.c
-@@ -1248,19 +1248,32 @@ i_alloc_struct_immovable(gs_memory_t * mem, gs_memory_type_ptr_t pstype,
-     alloc_trace("|+<.", imem, cname, pstype, size, obj);
-     return obj;
- }
-+
-+static inline bool
-+alloc_array_check_size(ulong num_elements, ulong elt_size, ulong *lsize)
-+{
-+    int64_t s = (int64_t)num_elements * elt_size;
-+    if (s > max_uint) {
-+        return false;
-+    }
-+    *lsize = (ulong)s;
-+    return true;
-+}
-+
- static byte *
- i_alloc_byte_array(gs_memory_t * mem, uint num_elements, uint elt_size,
-                    client_name_t cname)
- {
-     gs_ref_memory_t * const imem = (gs_ref_memory_t *)mem;
-     obj_header_t *obj;
--
-+    ulong lsize;
- #ifdef MEMENTO
-     if (Memento_failThisEvent())
-         return NULL;
- #endif
--
--    obj = alloc_obj(imem, (ulong) num_elements * elt_size,
-+    if (alloc_array_check_size(num_elements, elt_size, &lsize) == false)
-+        return NULL;
-+    obj = alloc_obj(imem, lsize,
-                     &st_bytes, ALLOC_DIRECT, cname);
- 
-     if_debug6m('A', mem, "[a%d:+b.]%s -bytes-*(%lu=%u*%u) = 0x%lx\n",
-@@ -1275,13 +1288,14 @@ i_alloc_byte_array_immovable(gs_memory_t * mem, uint num_elements,
- {
-     gs_ref_memory_t * const imem = (gs_ref_memory_t *)mem;
-     obj_header_t *obj;
--
-+    ulong lsize;
- #ifdef MEMENTO
-     if (Memento_failThisEvent())
-         return NULL;
- #endif
--
--    obj = alloc_obj(imem, (ulong) num_elements * elt_size,
-+    if (alloc_array_check_size(num_elements, elt_size, &lsize) == false)
-+        return NULL;
-+    obj = alloc_obj(imem, lsize,
-                     &st_bytes, ALLOC_IMMOVABLE | ALLOC_DIRECT,
-                     cname);
- 
-@@ -1297,7 +1311,7 @@ i_alloc_struct_array(gs_memory_t * mem, uint num_elements,
- {
-     gs_ref_memory_t * const imem = (gs_ref_memory_t *)mem;
-     obj_header_t *obj;
--
-+    ulong lsize;
- #ifdef MEMENTO
-     if (Memento_failThisEvent())
-         return NULL;
-@@ -1311,9 +1325,9 @@ i_alloc_struct_array(gs_memory_t * mem, uint num_elements,
-         return NULL;		/* fail */
-     }
- #endif
--    obj = alloc_obj(imem,
--                    (ulong) num_elements * pstype->ssize,
--                    pstype, ALLOC_DIRECT, cname);
-+    if (alloc_array_check_size(num_elements, pstype->ssize, &lsize) == false)
-+        return NULL;
-+    obj = alloc_obj(imem, lsize, pstype, ALLOC_DIRECT, cname);
-     if_debug7m('A', mem, "[a%d:+<.]%s %s*(%lu=%u*%u) = 0x%lx\n",
-                alloc_trace_space(imem), client_name_string(cname),
-                struct_type_name_string(pstype),
-@@ -1327,16 +1341,16 @@ i_alloc_struct_array_immovable(gs_memory_t * mem, uint num_elements,
- {
-     gs_ref_memory_t * const imem = (gs_ref_memory_t *)mem;
-     obj_header_t *obj;
--
-+    ulong lsize;
- #ifdef MEMENTO
-     if (Memento_failThisEvent())
-         return NULL;
- #endif
- 
-     ALLOC_CHECK_SIZE(mem,pstype);
--    obj = alloc_obj(imem,
--                    (ulong) num_elements * pstype->ssize,
--                    pstype, ALLOC_IMMOVABLE | ALLOC_DIRECT, cname);
-+    if (alloc_array_check_size(num_elements, pstype->ssize, &lsize) == false)
-+        return NULL;
-+    obj = alloc_obj(imem, lsize, pstype, ALLOC_IMMOVABLE | ALLOC_DIRECT, cname);
-     if_debug7m('A', mem, "[a%d|+<.]%s %s*(%lu=%u*%u) = 0x%lx\n",
-                alloc_trace_space(imem), client_name_string(cname),
-                struct_type_name_string(pstype),
--- 
-1.7.9.5
-
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.21.bb b/meta/recipes-extended/ghostscript/ghostscript_9.22.bb
similarity index 66%
rename from meta/recipes-extended/ghostscript/ghostscript_9.21.bb
rename to meta/recipes-extended/ghostscript/ghostscript_9.22.bb
index bf985c4..8db99ae 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.21.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.22.bb
@@ -20,50 +20,28 @@ UPSTREAM_CHECK_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/rele
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
 
 SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs921/${BPN}-${PV}.tar.gz \
-                file://ghostscript-9.15-parallel-make.patch \
-                file://ghostscript-9.16-Werror-return-type.patch \
-                file://do-not-check-local-libpng-source.patch \
-                file://avoid-host-contamination.patch \
-                file://mkdir-p.patch \
+                file://0001-contrib.mak-fix-for-parallel-build.patch \
+                file://0002-base-gendev.c-fix-for-Werror-return-type.patch \
+                file://0003-configure.ac-do-not-check-local-png-source.patch \
+                file://0004-avoid-host-contamination.patch \
+                file://0005-ghostscript-allow-directories-to-be-created-more-tha.patch \
 "
-
 SRC_URI = "${SRC_URI_BASE} \
-           file://ghostscript-9.21-prevent_recompiling.patch \
-           file://ghostscript-9.02-genarch.patch \
            file://objarch.h \
-           file://cups-no-gcrypt.patch \
-           file://CVE-2016-7977.patch \
-           file://CVE-2017-7207.patch \
-           file://CVE-2017-5951.patch \
-           file://CVE-2017-7975.patch \
-           file://CVE-2017-9216.patch \
-           file://CVE-2017-9611.patch \
-           file://CVE-2017-9612.patch \
-           file://CVE-2017-9739.patch \
-           file://CVE-2017-9726.patch \
-           file://CVE-2017-9727.patch \
-           file://CVE-2017-9835.patch \
-           file://CVE-2017-11714.patch \
+           file://0006-prevent-recompiling.patch \
+           file://0007-genarch.patch \
+           file://0008-cups-no-gcrypt.patch \
            "
 
 SRC_URI_class-native = "${SRC_URI_BASE} \
-                        file://ghostscript-9.21-native-fix-disable-system-libtiff.patch \
-                        file://base-genht.c-add-a-preprocessor-define-to-allow-fope.patch \
+                        file://0009-ghostscript-native-fix-disable-system-libtiff.patch \
+                        file://0010-base-genht.c-add-a-preprocessor-define-to-allow-fope.patch \
                         "
 
-SRC_URI[md5sum] = "5f213281761d2750fcf27476c404d17f"
-SRC_URI[sha256sum] = "02bceadbc4dddeb6f2eec9c8b1623d945d355ca11b8b4df035332b217d58ce85"
-
-# Put something like
-#
-#   PACKAGECONFIG_append_pn-ghostscript = " x11"
-#
-# in local.conf to enable building with X11.  Be careful.  The order
-# of the overrides matters!
-#
-#PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
-PACKAGECONFIG_class-native = ""
+SRC_URI[md5sum] = "eff6bc41b1d7e26e988d2a5c813889d1"
+SRC_URI[sha256sum] = "7f5f4487c0df9dce37481e4c8f192c0322e4c69f5a2ba900a7833c992331bcf4"
 
+PACKAGECONFIG ??= ""
 PACKAGECONFIG[x11] = "--with-x --x-includes=${STAGING_INCDIR} --x-libraries=${STAGING_LIBDIR}, \
                       --without-x, virtual/libx11 libxext libxt gtk+3\
                       "
@@ -105,7 +83,7 @@ do_configure_append () {
 	# copy tools from the native ghostscript build
 	if [ "${PN}" != "ghostscript-native" ]; then
 		mkdir -p obj/aux soobj
-		for i in genarch genconf mkromfs echogs gendev genht; do
+		for i in genarch genconf mkromfs echogs gendev genht packps; do
 			cp ${STAGING_BINDIR_NATIVE}/ghostscript-${PV}/$i obj/aux/$i
 		done
 	fi
@@ -119,14 +97,14 @@ do_install_append () {
 
 do_compile_class-native () {
     mkdir -p obj
-    for i in genarch genconf mkromfs echogs gendev genht; do
+    for i in genarch genconf mkromfs echogs gendev genht packps; do
         oe_runmake obj/aux/$i
     done
 }
 
 do_install_class-native () {
     install -d ${D}${bindir}/ghostscript-${PV}
-    for i in genarch genconf mkromfs echogs gendev genht; do
+    for i in genarch genconf mkromfs echogs gendev genht packps; do
         install -m 755 obj/aux/$i ${D}${bindir}/ghostscript-${PV}/$i
     done
 }
-- 
2.8.1


