Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 6F7E57723C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 05:08:35 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id s68so46324115qkh.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 21:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=OQBnJc71zmyZaEtJ5IvypJXD0gqr7/upRXS984Z2iHI=;
	b=doNYYTBUZWGaHQ6hNICAN1cf80xZrGlP3hDnUMcu/uqwmg/8YRKawzkR7kya6rUJzZ
	Mif9wiXivhr9W8SoclVt5PfriHG3vJMO0CHylHUwxGO3oqjXb7LPNgfcrvcWOkRc57Wt
	XLaZBdwAkRKVl8Lmnf3Nb0vGvRu4FVaMf6nPWWJNBqZmdpk6fxjmtCenePzVL8Ofi61B
	8QGMib5NyNkM9t/s4yA/Mnl7G+yaw0w6+pjHeQ85ODtdkH/l6FmZuJJd8yZH/SYxUnqI
	iGKgKyPOhxYoD2MrPk2f2d1ZE/ZMhhUWloNoFVfDsiap9f12J7rzbyl9MkyjO/2ttCnb
	zr4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=OQBnJc71zmyZaEtJ5IvypJXD0gqr7/upRXS984Z2iHI=;
	b=HYvvqIKm0RxCllWyLYCmboevvE2VCVlpymXO63gv4oIKOc+BySmjOA94JK//cowM8D
	4sMqdL9JzRiT3Ox0y2xHnRIjWB2ciPQq426IQrpdX/QDwOY7Yk+b4TYkqOwkIlMGPX5L
	2izt9ezTpdHrasNS0KtW1XU3aktUFmV2pB/Mqb8w7M+n9duQXR1MwVEenRpB52ep7PUE
	o8QK6aDMt6U4yOC0+kbzT2hqV3NLeKenHwz8Pk5ZMnOUUWulw7VfYyT5CUW//z9B9cp9
	aG4HD/QTfVvQrsCOmTpmbBRQK1KZplv3jyzTA5pc2Unf+rGYAz9gK0XYrev8B9hsviLo
	0mJA==
X-Gm-Message-State: AG10YOSmKqiS7zVsADE36IbzuVdDiGykLg4528ijImR/b6vqpguiLmyj2+6cr6I9M13T9w==
X-Received: by 10.55.75.203 with SMTP id y194mr26564223qka.2.1454303316396;
	Sun, 31 Jan 2016 21:08:36 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	b6sm12058940qkh.12.2016.01.31.21.08.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 31 Jan 2016 21:08:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Feb 2016 05:08:25 +0000
Message-Id: <be55911f598d8e203b6481011d30086ad79b6bff.1454303080.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <79e1257a6eb8ed2fa57f92fb34adc8b14ed880fe.1454303080.git.raj.khem@gmail.com>
References: <79e1257a6eb8ed2fa57f92fb34adc8b14ed880fe.1454303080.git.raj.khem@gmail.com>
In-Reply-To: <cover.1454303080.git.raj.khem@gmail.com>
References: <cover.1454303080.git.raj.khem@gmail.com>
Subject: [PATCH 4/8] pth: Remove dead code
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
X-List-Received-Date: Mon, 01 Feb 2016 05:08:36 -0000

recipe is removed, delete remaining cruft

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../pth/files/pth-add-pkgconfig-support.patch      | 105 ---------------------
 .../pth/files/pth-fix-parallel.patch               |  48 ----------
 2 files changed, 153 deletions(-)
 delete mode 100644 meta/recipes-support/pth/files/pth-add-pkgconfig-support.patch
 delete mode 100644 meta/recipes-support/pth/files/pth-fix-parallel.patch

diff --git a/meta/recipes-support/pth/files/pth-add-pkgconfig-support.patch b/meta/recipes-support/pth/files/pth-add-pkgconfig-support.patch
deleted file mode 100644
index 67a28ab..0000000
--- a/meta/recipes-support/pth/files/pth-add-pkgconfig-support.patch
+++ /dev/null
@@ -1,105 +0,0 @@
-Upstream-Status: Pending
-
-Add pkgconfig support to pth.
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-
-Index: Makefile.in
-===========================================================
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -47,6 +47,9 @@ datadir     = @datadir@
- 
- DESTDIR     =
- 
-+pkgconfigdir = ${libdir}/pkgconfig
-+pkgconfig_DATA = pth.pc
-+
- ##
- ##  ____ TOOL DEFINITIONS ___________________________________________
- ##
-@@ -216,7 +219,7 @@ test_pthread: test_pthread.o test_common.o libpthread.la
- 
- #   install the package
- install: all-for-install
--	@$(MAKE) $(MKFLAGS) install-dirs install-pth @INSTALL_PTHREAD@
-+	@$(MAKE) $(MKFLAGS) install-dirs install-pth @INSTALL_PTHREAD@ install-pkgconfigDATA
- 	@touch .done-install >/dev/null 2>&1 || $(TRUE)
- 	@$(MAKE) $(MKFLAGS) what-next
- install-dirs:
-@@ -227,6 +230,7 @@ install-dirs:
- 	$(SHTOOL) mkdir -f -p -m 755 $(DESTDIR)$(mandir)/man1
- 	$(SHTOOL) mkdir -f -p -m 755 $(DESTDIR)$(mandir)/man3
- 	$(SHTOOL) mkdir -f -p -m 755 $(DESTDIR)$(datadir)/aclocal
-+	$(SHTOOL) mkdir -f -p -m 755 $(DESTDIR)$(pkgconfigdir)
- install-pth:
- 	$(SHTOOL) install -c -m 755 pth-config $(DESTDIR)$(bindir)/pth-config
- 	$(SHTOOL) install -c -m 644 $(S)pth-config.1 $(DESTDIR)$(mandir)/man1/pth-config.1
-@@ -242,12 +246,16 @@ install-pthread:
- 	$(SHTOOL) install -c -m 644 $(S)pthread.3 $(DESTDIR)$(mandir)/man3/pthread.3
- 	@umask 022; $(LIBTOOL) --mode=install \
- 	$(SHTOOL) install -c libpthread.la $(DESTDIR)$(libdir)/libpthread.la
-+install-pkgconfigDATA: $(pkgconfig_DATA)
-+	$(SHTOOL) install -c -m 644 $(pkgconfig_DATA) $(DESTDIR)$(pkgconfigdir)/$(pkgconfig_DATA)
- 
- #   uninstall the package
- uninstall:
--	@$(MAKE) $(MKFLAGS) @UNINSTALL_PTHREAD@ uninstall-pth uninstall-dirs
-+	@$(MAKE) $(MKFLAGS) uninstall-pkgconfigDATA @UNINSTALL_PTHREAD@ uninstall-pth uninstall-dirs
- 	@touch .done-uninstall >/dev/null 2>&1 || $(TRUE)
- 	@$(MAKE) $(MKFLAGS) what-next
-+uninstall-pkgconfigDATA:
-+	$(RM) $(DESTDIR)$(pkgconfigdir)/$(pkgconfig_DATA)
- uninstall-pthread:
- 	$(RM) $(DESTDIR)$(bindir)/pthread-config
- 	$(RM) $(DESTDIR)$(mandir)/man1/pthread-config.1
-@@ -271,6 +279,7 @@ uninstall-dirs:
- 	-$(RMDIR) $(DESTDIR)$(includedir) >/dev/null 2>&1 || $(TRUE)
- 	-$(RMDIR) $(DESTDIR)$(bindir) >/dev/null 2>&1 || $(TRUE)
- 	-$(RMDIR) $(DESTDIR)$(prefix) >/dev/null 2>&1 || $(TRUE)
-+	-$(RMDIR) $(DESTDIR)$(pkgconfigdir) > /dev/null 2>&1 ||$(TRUE)
- 
- #   strip down the source tree to its minimum
- striptease:
-Index: configure.ac
-===========================================================
---- a/configure.ac
-+++ b/configure.ac
-@@ -656,6 +656,13 @@ pth_acmac.h dnl
- chmod +rx pthread-config
- chmod +rx pth-config
- )dnl
-+
-+PTH_VERSION=`echo $PTH_VERSION_STR | cut -d' ' -f1`
-+AC_SUBST(PTH_VERSION)
-+
-+AC_CONFIG_FILES([pth.pc])
-+AC_OUTPUT
-+
- if test ".$enable_pthread" = .no; then
-     rm -f pthread-config
-     rm -f pthread.h
-Index: pth.pc.in
-===========================================================
---- /dev/null
-+++ b/pth.pc.in
-@@ -0,0 +1,16 @@
-+prefix=@prefix@
-+exec_prefix=@exec_prefix@
-+libdir=@libdir@
-+includedir=@includedir@
-+bindir=@bindir@
-+mandir=@mandir@
-+datadir=@datadir@
-+acdir=@datadir@/aclocal
-+
-+Name: pth
-+Description: GNU Portable Threads
-+Requires:
-+Version: @PTH_VERSION@
-+Libs: -L${libdir} -lpth
-+Libs.private: 
-+Cflags: -I${includedir}
--- 
-1.7.5.4
-
diff --git a/meta/recipes-support/pth/files/pth-fix-parallel.patch b/meta/recipes-support/pth/files/pth-fix-parallel.patch
deleted file mode 100644
index 08edaff..0000000
--- a/meta/recipes-support/pth/files/pth-fix-parallel.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From df06b8170745eac347acb95f9f374f257621254f Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Thu, 29 Jan 2015 18:11:00 -0800
-Subject: [PATCH] Makefile.in: fix for parallel build
-
-Fixed:
-* do_compile
- pth_uctx.c:31:19: fatal error: pth_p.h: No such file or directory
- #include "pth_p.h"
-                   ^
-compilation terminated.
-make: *** [pth_uctx.lo] Error 1
-
-* do_install:
-  cp: cannot create regular file `image/usr/lib/pkgconfig/#INST@15507#': No such file or directory
-
-Upstream-Status: Pending
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- Makefile.in |    5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index de0390d..381a0ee 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -219,7 +219,8 @@ test_pthread: test_pthread.o test_common.o libpthread.la
- 
- #   install the package
- install: all-for-install
--	@$(MAKE) $(MKFLAGS) install-dirs install-pth @INSTALL_PTHREAD@ install-pkgconfigDATA
-+	@$(MAKE) $(MKFLAGS) install-dirs
-+	@$(MAKE) $(MKFLAGS) install-pth @INSTALL_PTHREAD@ install-pkgconfigDATA
- 	@touch .done-install >/dev/null 2>&1 || $(TRUE)
- 	@$(MAKE) $(MKFLAGS) what-next
- install-dirs:
-@@ -432,7 +433,7 @@ TAGS:
- ##  (AUTOMATICALLY UPDATED - DO NOT EDIT)
- ##
- 
--$(LOBJS): Makefile
-+$(LOBJS): Makefile pth_p.h
- 
- # DO NOT REMOVE
- pth_attr.lo: pth_attr.c pth_p.h pth_vers.c pth.h pth_acdef.h pth_acmac.h
--- 
-1.7.9.5
-
-- 
2.7.0


