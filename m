Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id C9738797B5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 16:13:09 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id j7-v6so24826006qtp.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 09:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nuvy9ZBICikDgQGPlfkP/1DNdWDMtw6ybdMcEvkgztE=;
	b=tBkHu0mTav6Pu1B6GXK5E1l7QWKwyRBaagu0/FyQon08yA6uqZt/cmlnpl1ySz8rHD
	KtpDQuk4St+mI9Tux+zPScFHVHkC4OtBA/8H1SWKBYgKRhHmbog+1ljQBVq1MJiJes/R
	3XmoDAFom3rh4ap6IszVY6HGaZVT/Qcc/XR2nFwOoNW6IH/dIo/2cuxuD657JCP6HoRI
	oDvFoJmjWvOcCU3VeCCbft/DC6UoBxVCJovbor6Kzq45QYQcDGsrC4u3Xwq7b0lo0m+N
	ugCSv0Pqcahka4Haf865qVwM8ezjOaQR59dchdVUayJD9QpNTRXIvCDip77acxfaVaJ+
	6BZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nuvy9ZBICikDgQGPlfkP/1DNdWDMtw6ybdMcEvkgztE=;
	b=AtlHvUtWWPZ4cC3mTUb4Ke330/AyJUtlYP/B2bXZJgTt6Ke+AOK2Geej9r/5/jaaDI
	VvmchjT/wfZPSAz5slrdVznEONH1/ecjB90q6bf1ApGA4Jp66t7BoCmx/owUgh+neNOf
	HYW7t9WcSmABNOqZWrQJgQzm+LTFbUMhyEbwbvSgpF1Qy0W1OMSRBjI/MK7TkAzd7TA0
	J1WT3Xlv8Azxn9WwxG3AKdSUY7HYGHkRkYvFKN2H4gqnh0jW+ctMl4DarZduuQ+S3sMU
	D76c3zDCuHo0Vw6/cb++UYCGZSHypUxr7AIK+tylLGgmKAm3rdRk4OPtVCPdbt+cHshb
	Cjjg==
X-Gm-Message-State: APzg51D1atlJbUnHR9eSgOxuYTGcLyLRpEMaIWgR8YrKrO2f0uurGO28
	L2+yuHDPnjqVWsA+j650x/K8FgjhjYuGoiZYFBE=
X-Google-Smtp-Source: ANB0VdY4SLr7xMtYSp56hi7IRKMwbESS6Gm8phdHy12QQZnbwiePS5sCVMUSiytRqT4Jtt+a9TjoyQfQlhfJao0TZdQ=
X-Received: by 2002:aed:3848:: with SMTP id
	j66-v6mr16323918qte.218.1536595990462; 
	Mon, 10 Sep 2018 09:13:10 -0700 (PDT)
MIME-Version: 1.0
References: <20180910133123.22372-1-ross.burton@intel.com>
	<20180910133123.22372-2-ross.burton@intel.com>
In-Reply-To: <20180910133123.22372-2-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 10 Sep 2018 09:12:44 -0700
Message-ID: <CAMKF1so=k2qhez7uEwWS0saYnV+BJ+z=MjGdinhTKpzQYDw5dg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] python3: remove redundant patch
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
X-List-Received-Date: Mon, 10 Sep 2018 16:13:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 10, 2018 at 6:31 AM Ross Burton <ross.burton@intel.com> wrote:
>
> None of the Python invocations that this changes are actually called, and
> there's no need to provide a HOSTPGEN variable when the recipe can just override
> PGEN directly.
>

patch is also substituting ./$(BUILDPYTHON) with $(HOSTPYTHON), how is
that taken care of ?
maybe try to a build where hostarch != targetarch might catch the
problem. If its handled in other
ways then its probably good riddance.

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  .../python/python3-native_3.5.5.bb                 |  1 -
>  .../python3/0001-cross-compile-support.patch       | 96 ----------------------
>  meta/recipes-devtools/python/python3_3.5.5.bb      |  3 +-
>  3 files changed, 1 insertion(+), 99 deletions(-)
>  delete mode 100644 meta/recipes-devtools/python/python3/0001-cross-compile-support.patch
>
> diff --git a/meta/recipes-devtools/python/python3-native_3.5.5.bb b/meta/recipes-devtools/python/python3-native_3.5.5.bb
> index 3098027d803..7b940a16d28 100644
> --- a/meta/recipes-devtools/python/python3-native_3.5.5.bb
> +++ b/meta/recipes-devtools/python/python3-native_3.5.5.bb
> @@ -7,7 +7,6 @@ DISTRO_SRC_URI_linuxstdbase = ""
>  SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
>  file://12-distutils-prefix-is-inside-staging-area.patch \
>  file://python-config.patch \
> -file://0001-cross-compile-support.patch \
>  file://030-fixup-include-dirs.patch \
>  file://070-dont-clean-ipkg-install.patch \
>  file://080-distutils-dont_adjust_files.patch \
> diff --git a/meta/recipes-devtools/python/python3/0001-cross-compile-support.patch b/meta/recipes-devtools/python/python3/0001-cross-compile-support.patch
> deleted file mode 100644
> index 7cd7e3b4906..00000000000
> --- a/meta/recipes-devtools/python/python3/0001-cross-compile-support.patch
> +++ /dev/null
> @@ -1,96 +0,0 @@
> -From ecde3ea170999a9ef734e8af4d7c25be5ba81697 Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Fri, 31 Mar 2017 15:42:46 +0300
> -Subject: [PATCH] cross-compile support
> -
> -We cross compile python. This patch uses tools from host/native
> -python instead of in-tree tools
> -
> --Khem
> -
> -Rebased on 3.5.4
> -
> -Upstream-Status: Inappropriate[Configuration Specific]
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> -Signed-off-by: Derek Straka <derek@asterius.io>
> ----
> - Makefile.pre.in | 14 ++++++++------
> - 1 file changed, 8 insertions(+), 6 deletions(-)
> -
> -diff --git a/Makefile.pre.in b/Makefile.pre.in
> -index 144c1f8629..f252ac2417 100644
> ---- a/Makefile.pre.in
> -+++ b/Makefile.pre.in
> -@@ -223,6 +223,7 @@ LIBOBJS=   @LIBOBJS@
> -
> - PYTHON=               python$(EXE)
> - BUILDPYTHON=  python$(BUILDEXE)
> -+HOSTPYTHON=    $(BUILDPYTHON)
> -
> - PYTHON_FOR_REGEN=@PYTHON_FOR_REGEN@
> - PYTHON_FOR_BUILD=@PYTHON_FOR_BUILD@
> -@@ -277,6 +278,7 @@ LIBFFI_INCLUDEDIR= @LIBFFI_INCLUDEDIR@
> - ##########################################################################
> - # Parser
> - PGEN=         Parser/pgen$(EXE)
> -+HOSTPGEN=     $(PGEN)$(EXE)
> -
> - PSRCS=                \
> -               Parser/acceler.c \
> -@@ -478,7 +480,7 @@ build_all_generate_profile:
> -
> - run_profile_task:
> -       : # FIXME: can't run for a cross build
> --      $(LLVM_PROF_FILE) $(RUNSHARED) ./$(BUILDPYTHON) $(PROFILE_TASK) || true
> -+      $(LLVM_PROF_FILE) $(RUNSHARED) $(HOSTPYTHON) $(PROFILE_TASK) || true
> -
> - build_all_merge_profile:
> -       $(LLVM_PROF_MERGER)
> -@@ -772,7 +774,7 @@ regen-grammar: $(PGEN)
> -       # Regenerate Include/graminit.h and Python/graminit.c
> -       # from Grammar/Grammar using pgen
> -       @$(MKDIR_P) Include
> --      $(PGEN) $(srcdir)/Grammar/Grammar \
> -+      $(HOSTPGEN) $(srcdir)/Grammar/Grammar \
> -               $(srcdir)/Include/graminit.h \
> -               $(srcdir)/Python/graminit.c
> -
> -@@ -978,7 +980,7 @@ $(LIBRARY_OBJS) $(MODOBJS) Programs/python.o: $(PYTHON_HEADERS)
> - ######################################################################
> -
> - TESTOPTS=     $(EXTRATESTOPTS)
> --TESTPYTHON=   $(RUNSHARED) ./$(BUILDPYTHON) $(TESTPYTHONOPTS)
> -+TESTPYTHON=   $(RUNSHARED) $(HOSTPYTHON) $(TESTPYTHONOPTS)
> - TESTRUNNER=   $(TESTPYTHON) $(srcdir)/Tools/scripts/run_tests.py
> - TESTTIMEOUT=  3600
> -
> -@@ -1470,7 +1472,7 @@ frameworkinstallstructure:       $(LDLIBRARY)
> -               fi; \
> -       done
> -       $(LN) -fsn include/python$(LDVERSION) $(DESTDIR)$(prefix)/Headers
> --      sed 's/%VERSION%/'"`$(RUNSHARED) ./$(BUILDPYTHON) -c 'import platform; print(platform.python_version())'`"'/g' < $(RESSRCDIR)/Info.plist > $(DESTDIR)$(prefix)/Resources/Info.plist
> -+      sed 's/%VERSION%/'"`$(RUNSHARED) $(HOSTPYTHON) -c 'import platform; print(platform.python_version())'`"'/g' < $(RESSRCDIR)/Info.plist > $(DESTDIR)$(prefix)/Resources/Info.plist
> -       $(LN) -fsn $(VERSION) $(DESTDIR)$(PYTHONFRAMEWORKINSTALLDIR)/Versions/Current
> -       $(LN) -fsn Versions/Current/$(PYTHONFRAMEWORK) $(DESTDIR)$(PYTHONFRAMEWORKINSTALLDIR)/$(PYTHONFRAMEWORK)
> -       $(LN) -fsn Versions/Current/Headers $(DESTDIR)$(PYTHONFRAMEWORKINSTALLDIR)/Headers
> -@@ -1543,7 +1545,7 @@ Python/dtoa.o: Python/dtoa.c
> -
> - # Run reindent on the library
> - reindent:
> --      ./$(BUILDPYTHON) $(srcdir)/Tools/scripts/reindent.py -r $(srcdir)/Lib
> -+      $(HOSTPYTHON) $(srcdir)/Tools/scripts/reindent.py -r $(srcdir)/Lib
> -
> - # Rerun configure with the same options as it was run last time,
> - # provided the config.status script exists
> -@@ -1678,7 +1680,7 @@ funny:
> -
> - # Perform some verification checks on any modified files.
> - patchcheck: @DEF_MAKE_RULE@
> --      $(RUNSHARED) ./$(BUILDPYTHON) $(srcdir)/Tools/scripts/patchcheck.py
> -+      $(RUNSHARED) $(HOSTPYTHON) $(srcdir)/Tools/scripts/patchcheck.py
> -
> - # Dependencies
> -
> ---
> -2.11.0
> -
> diff --git a/meta/recipes-devtools/python/python3_3.5.5.bb b/meta/recipes-devtools/python/python3_3.5.5.bb
> index 93878e4e45c..6598b486afe 100644
> --- a/meta/recipes-devtools/python/python3_3.5.5.bb
> +++ b/meta/recipes-devtools/python/python3_3.5.5.bb
> @@ -11,7 +11,6 @@ DISTRO_SRC_URI ?= "file://sitecustomize.py"
>  DISTRO_SRC_URI_linuxstdbase = ""
>  SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
>  file://python-config.patch \
> -file://0001-cross-compile-support.patch \
>  file://030-fixup-include-dirs.patch \
>  file://070-dont-clean-ipkg-install.patch \
>  file://080-distutils-dont_adjust_files.patch \
> @@ -101,7 +100,7 @@ do_configure_append() {
>  }
>
>  run_make() {
> -       oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python3-native/pgen \
> +       oe_runmake PGEN=${STAGING_BINDIR_NATIVE}/python3-native/pgen \
>                 HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python3-native/python3 \
>                 STAGING_LIBDIR=${STAGING_LIBDIR} \
>                 STAGING_INCDIR=${STAGING_INCDIR} \
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

