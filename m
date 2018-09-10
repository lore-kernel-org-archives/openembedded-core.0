Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5EC497969A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 13:31:31 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id y139-v6so21440316wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 06:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=0rkRgn9WGkrrjhluXjelqkhB7v6KAiP7lwDMSrEROzM=;
	b=tZ432vAVBgJv09o96/NMuLMP/hl+e9H5Md09K23h8Mj8uq95SB5cqgqNbUKkv5IdZa
	N79KT8NbAuQEHJvnFPxznQHhjenHw3Q34bYAlzO/kr+y0fAeFNmOwJAPMtV4I0WJmBYo
	ACXD3g+qjim0gAf+o9TpG1P2g4sLahvR+zxaRFpgb3Zn+2gT3o1DEGG1k7pNSyJcdMZA
	0WQVkI3d69bJxnhwihJGSIfxtSLYYmVcjRfN5SV+qfaMVU1prM3tW1yEjnZCPCs5ldd2
	depmWYIo1sFggWquf/yxvm0OPb3o9L5Hv+5j1DSYbi86Or36nz2kfqm8vdshI5yYM7Sw
	Uaiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=0rkRgn9WGkrrjhluXjelqkhB7v6KAiP7lwDMSrEROzM=;
	b=Le4de8/yWVjAje0hyGDjvL1+SvZa4SvN4CgHw3Tiusj6WctIoiWLjOZeYRpnak9VrZ
	98KSHwQGnntJ0XFm2jkN6wku8n5cEJIRTTmanj7wjPYQWZH9ozsG80XpQ9hMlz7iGAvw
	7flwlBe+rXE3Qz/rRgSGN+K9/3xHEb+dglKMtF6Fa0ld6ETtrSgbng/p7H5NBPhaGNvu
	LZCWWmvLUZPeejOY9HA5rwRpHihcpu00LKbNHdcNw7C7srykhabBPU/UkrYeikouD4W/
	RwTI4VsXtnX6CEHp5nVkGqqgIBGotskJpinXhQGHt16HPvmO0akNXodllt7DwOq1fUTu
	i0Ew==
X-Gm-Message-State: APzg51Dy949WDnsOV6V+1EFp0X2mdq5rzXt0Y3jgU/9//l68xSTLpgBN
	exhSR1gRlb0y14aHzEgX3QrUq+55v0A=
X-Google-Smtp-Source: ANB0Vdb8/OD64IYfioa9cXJwQzUZqPPd96TfrSbZJ3oeF/ZhhJ4ekIiajHRMaLStpEO1jx5Y2hvUAA==
X-Received: by 2002:a1c:3411:: with SMTP id b17-v6mr739565wma.85.1536586291151;
	Mon, 10 Sep 2018 06:31:31 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	p11-v6sm17695045wrd.74.2018.09.10.06.31.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Sep 2018 06:31:30 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Sep 2018 14:31:21 +0100
Message-Id: <20180910133123.22372-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180910133123.22372-1-ross.burton@intel.com>
References: <20180910133123.22372-1-ross.burton@intel.com>
Subject: [PATCH 2/4] python3: remove redundant patch
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
X-List-Received-Date: Mon, 10 Sep 2018 13:31:31 -0000

None of the Python invocations that this changes are actually called, and
there's no need to provide a HOSTPGEN variable when the recipe can just override
PGEN directly.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../python/python3-native_3.5.5.bb                 |  1 -
 .../python3/0001-cross-compile-support.patch       | 96 ----------------------
 meta/recipes-devtools/python/python3_3.5.5.bb      |  3 +-
 3 files changed, 1 insertion(+), 99 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/0001-cross-compile-support.patch

diff --git a/meta/recipes-devtools/python/python3-native_3.5.5.bb b/meta/recipes-devtools/python/python3-native_3.5.5.bb
index 3098027d803..7b940a16d28 100644
--- a/meta/recipes-devtools/python/python3-native_3.5.5.bb
+++ b/meta/recipes-devtools/python/python3-native_3.5.5.bb
@@ -7,7 +7,6 @@ DISTRO_SRC_URI_linuxstdbase = ""
 SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
 file://12-distutils-prefix-is-inside-staging-area.patch \
 file://python-config.patch \
-file://0001-cross-compile-support.patch \
 file://030-fixup-include-dirs.patch \
 file://070-dont-clean-ipkg-install.patch \
 file://080-distutils-dont_adjust_files.patch \
diff --git a/meta/recipes-devtools/python/python3/0001-cross-compile-support.patch b/meta/recipes-devtools/python/python3/0001-cross-compile-support.patch
deleted file mode 100644
index 7cd7e3b4906..00000000000
--- a/meta/recipes-devtools/python/python3/0001-cross-compile-support.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-From ecde3ea170999a9ef734e8af4d7c25be5ba81697 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 31 Mar 2017 15:42:46 +0300
-Subject: [PATCH] cross-compile support
-
-We cross compile python. This patch uses tools from host/native
-python instead of in-tree tools
-
--Khem
-
-Rebased on 3.5.4
-
-Upstream-Status: Inappropriate[Configuration Specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-Signed-off-by: Derek Straka <derek@asterius.io>
----
- Makefile.pre.in | 14 ++++++++------
- 1 file changed, 8 insertions(+), 6 deletions(-)
-
-diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 144c1f8629..f252ac2417 100644
---- a/Makefile.pre.in
-+++ b/Makefile.pre.in
-@@ -223,6 +223,7 @@ LIBOBJS=	@LIBOBJS@
-
- PYTHON=		python$(EXE)
- BUILDPYTHON=	python$(BUILDEXE)
-+HOSTPYTHON=    $(BUILDPYTHON)
-
- PYTHON_FOR_REGEN=@PYTHON_FOR_REGEN@
- PYTHON_FOR_BUILD=@PYTHON_FOR_BUILD@
-@@ -277,6 +278,7 @@ LIBFFI_INCLUDEDIR=	@LIBFFI_INCLUDEDIR@
- ##########################################################################
- # Parser
- PGEN=		Parser/pgen$(EXE)
-+HOSTPGEN=	$(PGEN)$(EXE)
-
- PSRCS=		\
- 		Parser/acceler.c \
-@@ -478,7 +480,7 @@ build_all_generate_profile:
-
- run_profile_task:
- 	: # FIXME: can't run for a cross build
--	$(LLVM_PROF_FILE) $(RUNSHARED) ./$(BUILDPYTHON) $(PROFILE_TASK) || true
-+	$(LLVM_PROF_FILE) $(RUNSHARED) $(HOSTPYTHON) $(PROFILE_TASK) || true
-
- build_all_merge_profile:
- 	$(LLVM_PROF_MERGER)
-@@ -772,7 +774,7 @@ regen-grammar: $(PGEN)
- 	# Regenerate Include/graminit.h and Python/graminit.c
- 	# from Grammar/Grammar using pgen
- 	@$(MKDIR_P) Include
--	$(PGEN) $(srcdir)/Grammar/Grammar \
-+	$(HOSTPGEN) $(srcdir)/Grammar/Grammar \
- 		$(srcdir)/Include/graminit.h \
- 		$(srcdir)/Python/graminit.c
-
-@@ -978,7 +980,7 @@ $(LIBRARY_OBJS) $(MODOBJS) Programs/python.o: $(PYTHON_HEADERS)
- ######################################################################
-
- TESTOPTS=	$(EXTRATESTOPTS)
--TESTPYTHON=	$(RUNSHARED) ./$(BUILDPYTHON) $(TESTPYTHONOPTS)
-+TESTPYTHON=	$(RUNSHARED) $(HOSTPYTHON) $(TESTPYTHONOPTS)
- TESTRUNNER=	$(TESTPYTHON) $(srcdir)/Tools/scripts/run_tests.py
- TESTTIMEOUT=	3600
-
-@@ -1470,7 +1472,7 @@ frameworkinstallstructure:	$(LDLIBRARY)
- 		fi; \
- 	done
- 	$(LN) -fsn include/python$(LDVERSION) $(DESTDIR)$(prefix)/Headers
--	sed 's/%VERSION%/'"`$(RUNSHARED) ./$(BUILDPYTHON) -c 'import platform; print(platform.python_version())'`"'/g' < $(RESSRCDIR)/Info.plist > $(DESTDIR)$(prefix)/Resources/Info.plist
-+	sed 's/%VERSION%/'"`$(RUNSHARED) $(HOSTPYTHON) -c 'import platform; print(platform.python_version())'`"'/g' < $(RESSRCDIR)/Info.plist > $(DESTDIR)$(prefix)/Resources/Info.plist
- 	$(LN) -fsn $(VERSION) $(DESTDIR)$(PYTHONFRAMEWORKINSTALLDIR)/Versions/Current
- 	$(LN) -fsn Versions/Current/$(PYTHONFRAMEWORK) $(DESTDIR)$(PYTHONFRAMEWORKINSTALLDIR)/$(PYTHONFRAMEWORK)
- 	$(LN) -fsn Versions/Current/Headers $(DESTDIR)$(PYTHONFRAMEWORKINSTALLDIR)/Headers
-@@ -1543,7 +1545,7 @@ Python/dtoa.o: Python/dtoa.c
-
- # Run reindent on the library
- reindent:
--	./$(BUILDPYTHON) $(srcdir)/Tools/scripts/reindent.py -r $(srcdir)/Lib
-+	$(HOSTPYTHON) $(srcdir)/Tools/scripts/reindent.py -r $(srcdir)/Lib
-
- # Rerun configure with the same options as it was run last time,
- # provided the config.status script exists
-@@ -1678,7 +1680,7 @@ funny:
-
- # Perform some verification checks on any modified files.
- patchcheck: @DEF_MAKE_RULE@
--	$(RUNSHARED) ./$(BUILDPYTHON) $(srcdir)/Tools/scripts/patchcheck.py
-+	$(RUNSHARED) $(HOSTPYTHON) $(srcdir)/Tools/scripts/patchcheck.py
-
- # Dependencies
-
---
-2.11.0
-
diff --git a/meta/recipes-devtools/python/python3_3.5.5.bb b/meta/recipes-devtools/python/python3_3.5.5.bb
index 93878e4e45c..6598b486afe 100644
--- a/meta/recipes-devtools/python/python3_3.5.5.bb
+++ b/meta/recipes-devtools/python/python3_3.5.5.bb
@@ -11,7 +11,6 @@ DISTRO_SRC_URI ?= "file://sitecustomize.py"
 DISTRO_SRC_URI_linuxstdbase = ""
 SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
 file://python-config.patch \
-file://0001-cross-compile-support.patch \
 file://030-fixup-include-dirs.patch \
 file://070-dont-clean-ipkg-install.patch \
 file://080-distutils-dont_adjust_files.patch \
@@ -101,7 +100,7 @@ do_configure_append() {
 }
 
 run_make() {
-	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python3-native/pgen \
+	oe_runmake PGEN=${STAGING_BINDIR_NATIVE}/python3-native/pgen \
 		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python3-native/python3 \
 		STAGING_LIBDIR=${STAGING_LIBDIR} \
 		STAGING_INCDIR=${STAGING_INCDIR} \
-- 
2.11.0


