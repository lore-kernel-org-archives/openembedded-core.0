Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TjcTW-0000VE-VB
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Dec 2012 22:07:20 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa10so2424357pad.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 12:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ksXyb8ELIAhtiDgyeSq+NT8Xdi+WzJOOpJBtpvkJHqg=;
	b=ioIoEgLPphD1EuyzX5+xvcI0r0puUEB47lojd/nTCbtlYkF0jKzFWshQz1rAjEzFje
	00w+mYqT+ga5cSopTvEJvwzZisDsDGeqIE0swWiNgfMCZOEfwm6fdU3LSBQiwArtD7ze
	33E8UgHkkqoSZ9ZM/IAzWdXor3AOU1LBb1INxt8Ff/yKr/mk5GXYOuKoBhBxWiEKlCqC
	SCRapq8zRZs4BZ1ZP1dpJN/5nETVWMv+Pf9yFTmqDg87Xf5O2nS7g+PHaBmdvTsLjg4Q
	U5tGkDb95M4DGoVWtzWnuwyML6JLr5oXBPP/3pU7dBbjroCp8kgr8kjuhdULeFFrxV4i
	L4Iw==
Received: by 10.68.226.71 with SMTP id rq7mr19077483pbc.60.1355518361343;
	Fri, 14 Dec 2012 12:52:41 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id i1sm3754703pav.35.2012.12.14.12.52.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Dec 2012 12:52:39 -0800 (PST)
Date: Fri, 14 Dec 2012 21:52:53 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Qi.Chen@windriver.com
Message-ID: <20121214205253.GE8699@jama.jama.net>
References: <cover.1355479412.git.Qi.Chen@windriver.com>
	<2ff77d8cdc19c9040f3ede2203700ee91e878e5f.1355479412.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
In-Reply-To: <2ff77d8cdc19c9040f3ede2203700ee91e878e5f.1355479412.git.Qi.Chen@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 1/1] ICU: upgrade to 50.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Dec 2012 21:07:20 -0000
X-Groupsio-MsgNum: 32705
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Bqc0IY4JZZt50bUr"
Content-Disposition: inline

--Bqc0IY4JZZt50bUr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 14, 2012 at 06:08:52PM +0800, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>=20
> Upgrade ICU to 50.1.
> All unnecessary patches of previous version are dropped.

Here it fails with:

ERROR: Logfile of failure stored in:
/OE/jansa-test/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/icu/50.1-r=
1/temp/log.do_configure.5863
| configure:3917: checking for gmake
| configure:3935: found /usr/bin/gmake
| configure:3947: result: /usr/bin/gmake
| configure:3983: error: No such directory
/OE/jansa-test/shr-core/tmp-eglibc/work/x86_64-linux/icu-native/50.1-r1/icu=
/source
supplied as the argument to --with-cross-build. Use an absolute path.

Notice native path when building for target (armv5te). Ah and I'm using
rmwork so maybe it worked for you, because source from native build was
still available when you started target build.

Cheers,

> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../icu/files/fix-parallel-build.patch             |   19 -----
>  meta/recipes-support/icu/files/gccfix.patch        |   19 -----
>  .../icu/files/icu-add-pkgconfig-support.patch      |   43 ------------
>  .../icu/files/larger-cmd-size.patch                |   27 -------
>  meta/recipes-support/icu/files/noldlibpath.patch   |   52 --------------
>  .../icu/files/use-g++-for-linking.patch            |   74 --------------=
------
>  meta/recipes-support/icu/{icu-3.6.inc =3D> icu.inc}  |   54 ++++--------=
--
>  meta/recipes-support/icu/icu_3.6.bb                |    6 --
>  meta/recipes-support/icu/icu_50.1.bb               |   11 +++
>  9 files changed, 24 insertions(+), 281 deletions(-)
>  delete mode 100644 meta/recipes-support/icu/files/fix-parallel-build.pat=
ch
>  delete mode 100644 meta/recipes-support/icu/files/gccfix.patch
>  delete mode 100644 meta/recipes-support/icu/files/icu-add-pkgconfig-supp=
ort.patch
>  delete mode 100644 meta/recipes-support/icu/files/larger-cmd-size.patch
>  delete mode 100644 meta/recipes-support/icu/files/noldlibpath.patch
>  delete mode 100644 meta/recipes-support/icu/files/use-g++-for-linking.pa=
tch
>  rename meta/recipes-support/icu/{icu-3.6.inc =3D> icu.inc} (42%)
>  delete mode 100644 meta/recipes-support/icu/icu_3.6.bb
>  create mode 100644 meta/recipes-support/icu/icu_50.1.bb
>=20
> diff --git a/meta/recipes-support/icu/files/fix-parallel-build.patch b/me=
ta/recipes-support/icu/files/fix-parallel-build.patch
> deleted file mode 100644
> index 5b01a4c..0000000
> --- a/meta/recipes-support/icu/files/fix-parallel-build.patch
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -Upstream-Status: pending
> -
> -Fix parallel builds
> -
> -Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> -
> -Index: source/data/Makefile.in
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- source.orig/data/Makefile.in	2011-09-02 02:03:37.000000000 +0400
> -+++ source/data/Makefile.in	2011-09-02 02:06:26.000000000 +0400
> -@@ -351,8 +351,8 @@
> - endif
> -
> -
> --build-dir: $(BUILD_DIRS)
> --$(BUILD_DIRS):
> -+$(MAINBUILDDIR) $(BUILD_DIRS): build-dir
> -+build-dir:
> -	-$(MKINSTALLDIRS) $(BUILD_DIRS)
> diff --git a/meta/recipes-support/icu/files/gccfix.patch b/meta/recipes-s=
upport/icu/files/gccfix.patch
> deleted file mode 100644
> index 755341f..0000000
> --- a/meta/recipes-support/icu/files/gccfix.patch
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -Fixes an error which prevents compilation
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Scott Garman <scott.a.garman@intel.com>
> -
> -Index: source/layoutex/ParagraphLayout.cpp
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- source.orig/layoutex/ParagraphLayout.cpp	2009-06-30 11:48:47.0000000=
00 +0100
> -+++ source/layoutex/ParagraphLayout.cpp	2009-06-30 11:49:06.000000000 +0=
100
> -@@ -798,7 +798,7 @@
> -=20
> -     return nullLanguageCode;
> - }
> --#elif
> -+#else
> -=20
> - // TODO - dummy implementation for right now...
> - le_int32 ParagraphLayout::getLanguageCode(const Locale *locale)
> diff --git a/meta/recipes-support/icu/files/icu-add-pkgconfig-support.pat=
ch b/meta/recipes-support/icu/files/icu-add-pkgconfig-support.patch
> deleted file mode 100644
> index c7cd9d5..0000000
> --- a/meta/recipes-support/icu/files/icu-add-pkgconfig-support.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -Upstream-Status: Inappropriate [version]
> -ICU-3.6 has no pkgconfig, so I add it here.=20
> -But ICU has had pkgconfig support since 4.6.
> -So this patch is inappropriate to upstream.
> -
> -Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> -
> -Index: configure.in
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- a/configure.in
> -+++ b/configure.in
> -@@ -1057,4 +1057,7 @@ echo "This may cause ICU to fail to build. Please =
make sure that GNU make"
> - echo "is in your PATH so that this configure script can detect its loca=
tion."
> - fi
> -=20
> -+AC_CONFIG_FILES([icu.pc])
> -+AC_OUTPUT
> -+
> - $as_unset _CXX_CXXSUFFIX
> -
> -Index: icu.pc.in
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- /dev/null
> -+++ b/icu.pc.in
> -@@ -0,0 +1,15 @@
> -+# Process this file with autoconf to produce a pkg-config metadata file.
> -+
> -+prefix=3D@prefix@
> -+exec_prefix=3D@exec_prefix@
> -+libdir=3D@libdir@
> -+includedir=3D@includedir@
> -+unicode_version=3D@UNICODE_VERSION@
> -+
> -+Name: ICU
> -+Description: International Component for Unicode libraries
> -+Requires:
> -+Version: @VERSION@
> -+Libs: -L${libdir} -licui18n -licuuc -licudata
> -+Libs.private: -L{libdir} -lpthread -lm
> -+Cflags: -I${includedir} -O2 -pipe -g -feliminate-unused-debug-types
> ---=20
> -1.7.11.2
> -
> diff --git a/meta/recipes-support/icu/files/larger-cmd-size.patch b/meta/=
recipes-support/icu/files/larger-cmd-size.patch
> deleted file mode 100644
> index 74a84f1..0000000
> --- a/meta/recipes-support/icu/files/larger-cmd-size.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -Allocate a larger memory size for cmd
> -
> -The length of the command line can be longer than 1024 sometimes,
> -which will cause a "Segmentation fault" error.
> -
> -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> -
> -Upstream-Status: Pending
> ----
> - tools/pkgdata/pkgdata.c |    2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/tools/pkgdata/pkgdata.c b/tools/pkgdata/pkgdata.c
> ---- a/tools/pkgdata/pkgdata.c
> -+++ b/tools/pkgdata/pkgdata.c
> -@@ -439,7 +439,7 @@ main(int argc, char* argv[]) {
> - /* POSIX - execute makefile */
> - static int executeMakefile(const UPKGOptions *o)
> - {
> --    char cmd[1024];
> -+    char cmd[2048];
> -     /*char pwd[1024];*/
> -     const char *make;
> -     int rc;
> ---=20
> -1.7.10.2
> -
> diff --git a/meta/recipes-support/icu/files/noldlibpath.patch b/meta/reci=
pes-support/icu/files/noldlibpath.patch
> deleted file mode 100644
> index 8543044..0000000
> --- a/meta/recipes-support/icu/files/noldlibpath.patch
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -Setting LD_LIBRARY_PATH is a really bad idea when cross compiling. Simpl=
est way
> -to disable this is to rename the variable as per the patch below, then i=
ts=20
> -harmless. This is a hack.
> -
> -RP 10/6/2010
> -
> -Upstream-Status: Inappropriate [Other]
> -Hacky workaround not likely to be accepted upstream.
> -
> -Signed-off-by: Scott Garman <scott.a.garman@intel.com>
> -
> -Index: source/config/Makefile.inc.in
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- source.orig/config/Makefile.inc.in	2010-06-10 21:49:19.000000000 +01=
00
> -+++ source/config/Makefile.inc.in	2010-06-10 21:49:46.000000000 +0100
> -@@ -126,7 +126,7 @@
> - ##################################################################
> - # Environment variable to set a runtime search path
> - #   (Overridden when necessary in -mh files)
> --LDLIBRARYPATH_ENVVAR =3D LD_LIBRARY_PATH
> -+LDLIBRARYPATH_ENVVAR =3D LD_LIBRARY_PATH2
> -=20
> - # Versioned target for a shared library
> - FINAL_SO_TARGET =3D $(SO_TARGET).$(SO_TARGET_VERSION)
> -Index: source/icudefs.mk.in
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- source.orig/icudefs.mk.in	2010-06-10 21:51:03.000000000 +0100
> -+++ source/icudefs.mk.in	2010-06-10 21:51:09.000000000 +0100
> -@@ -150,7 +150,7 @@
> - SHLIB.cc=3D     $(CXX) $(CXXFLAGS) $(LDFLAGS) -shared
> -=20
> - # Environment variable to set a runtime search path
> --LDLIBRARYPATH_ENVVAR =3D LD_LIBRARY_PATH
> -+LDLIBRARYPATH_ENVVAR =3D LD_LIBRARY_PATH2
> -=20
> - # Versioned target for a shared library.
> - FINAL_SO_TARGET =3D $(SO_TARGET).$(SO_TARGET_VERSION)
> -Index: source/tools/genrb/gendtjar.pl
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- source.orig/tools/genrb/gendtjar.pl	2010-06-10 21:51:36.000000000 +0=
100
> -+++ source/tools/genrb/gendtjar.pl	2010-06-10 21:52:03.000000000 +0100
> -@@ -68,8 +68,8 @@
> -         $icuLibDir =3D abs_path($icuBinDir."/../lib");
> -         $path .=3D":$icuBinDir:$icuLibDir";
> -        =20
> --        $libpath =3D $ENV{'LD_LIBRARY_PATH'}.":$icuLibDir";
> --        $ENV{'LD_LIBRARY_PATH'} =3D $libpath;
> -+        $libpath =3D $ENV{'LD_LIBRARY_PATH2'}.":$icuLibDir";
> -+        $ENV{'LD_LIBRARY_PATH2'} =3D $libpath;
> -        =20
> -         #print ("#####  LD_LIBRARY_PATH =3D $ENV{'LD_LIBRARY_PATH'}\n");
> -    =20
> diff --git a/meta/recipes-support/icu/files/use-g++-for-linking.patch b/m=
eta/recipes-support/icu/files/use-g++-for-linking.patch
> deleted file mode 100644
> index f477dad..0000000
> --- a/meta/recipes-support/icu/files/use-g++-for-linking.patch
> +++ /dev/null
> @@ -1,74 +0,0 @@
> -Use g++ for linking.
> -
> -Upstream-Status: Inappropriate [Other]
> -Build system specific
> -
> -Signed-off-by: Scott Garman <scott.a.garman@intel.com>
> -
> ----
> - tools/genccode/Makefile.in |    2 +-
> - tools/gencmn/Makefile.in   |    2 +-
> - tools/genrb/Makefile.in    |    2 +-
> - tools/pkgdata/Makefile.in  |    2 +-
> - 4 files changed, 4 insertions(+), 4 deletions(-)
> -
> ---- source.orig/tools/genccode/Makefile.in
> -+++ source/tools/genccode/Makefile.in
> -@@ -76,11 +76,11 @@ check-local: all-local
> - Makefile: $(srcdir)/Makefile.in  $(top_builddir)/config.status
> - 	cd $(top_builddir) \
> - 	 && CONFIG_FILES=3D$(subdir)/$@ CONFIG_HEADERS=3D $(SHELL) ./config.st=
atus
> -=20
> - $(TARGET) : $(OBJECTS)
> --	$(LINK.c) $(OUTOPT)$@ $^ $(LIBS)
> -+	$(LINK.cc) $(OUTOPT)$@ $^ $(LIBS)
> -=20
> -=20
> - %.$(SECTION): $(srcdir)/%.$(SECTION).in
> - 	cd $(top_builddir) \
> - 	 && CONFIG_FILES=3D$(subdir)/$@ CONFIG_HEADERS=3D $(SHELL) ./config.st=
atus
> ---- source.orig/tools/gencmn/Makefile.in
> -+++ source/tools/gencmn/Makefile.in
> -@@ -76,11 +76,11 @@ check-local: all-local
> - Makefile: $(srcdir)/Makefile.in  $(top_builddir)/config.status
> - 	cd $(top_builddir) \
> - 	 && CONFIG_FILES=3D$(subdir)/$@ CONFIG_HEADERS=3D $(SHELL) ./config.st=
atus
> -=20
> - $(TARGET) : $(OBJECTS)
> --	$(LINK.c) $(OUTOPT)$@ $^ $(LIBS)
> -+	$(LINK.cc) $(OUTOPT)$@ $^ $(LIBS)
> -=20
> - %.$(SECTION): $(srcdir)/%.$(SECTION).in
> - 	cd $(top_builddir) \
> - 	 && CONFIG_FILES=3D$(subdir)/$@ CONFIG_HEADERS=3D $(SHELL) ./config.st=
atus
> -=20
> ---- source.orig/tools/genrb/Makefile.in
> -+++ source/tools/genrb/Makefile.in
> -@@ -84,11 +84,11 @@ Makefile: $(srcdir)/Makefile.in  $(top_b
> -=20
> - $(TARGET) : $(OBJECTS)
> - 	$(LINK.cc) $(OUTOPT)$@ $^ $(LIBS)=20
> -=20
> - $(DERB) : $(DERB_OBJ)
> --	$(LINK.c) $(OUTOPT)$@ $^ $(LIBS)=20
> -+	$(LINK.cc) $(OUTOPT)$@ $^ $(LIBS)
> -=20
> -=20
> - # This line is needed to serialize builds when the gmake -j option is u=
sed.
> - $(TARGET_STUB_NAME).$(SECTION): $(DERB_STUB_NAME).$(SECTION)
> -=20
> ---- source.orig/tools/pkgdata/Makefile.in
> -+++ source/tools/pkgdata/Makefile.in
> -@@ -81,11 +81,11 @@ check-local: all-local
> - Makefile: $(srcdir)/Makefile.in  $(top_builddir)/config.status
> - 	cd $(top_builddir) \
> - 	 && CONFIG_FILES=3D$(subdir)/$@ CONFIG_HEADERS=3D $(SHELL) ./config.st=
atus
> -=20
> - $(TARGET) : $(OBJECTS)
> --	$(LINK.c) $(OUTOPT)$@ $^ $(LIBS)=20
> -+	$(LINK.cc) $(OUTOPT)$@ $^ $(LIBS)
> -=20
> -=20
> - %.$(SECTION): $(srcdir)/%.$(SECTION).in
> - 	cd $(top_builddir) \
> - 	 && CONFIG_FILES=3D$(subdir)/$@ CONFIG_HEADERS=3D $(SHELL) ./config.st=
atus
> diff --git a/meta/recipes-support/icu/icu-3.6.inc b/meta/recipes-support/=
icu/icu.inc
> similarity index 42%
> rename from meta/recipes-support/icu/icu-3.6.inc
> rename to meta/recipes-support/icu/icu.inc
> index 8caf71c..e7d6189 100644
> --- a/meta/recipes-support/icu/icu-3.6.inc
> +++ b/meta/recipes-support/icu/icu.inc
> @@ -1,61 +1,34 @@
>  SUMMARY =3D "International Component for Unicode libraries"
>  DESCRIPTION =3D "The International Component for Unicode (ICU) is a matu=
re, portable set of C/C++ and Java libraries for Unicode support, software =
internationalization (I18N) and globalization (G11N), giving applications t=
he same results on all platforms."
> -HOMEPAGE =3D "http://www-01.ibm.com/software/globalization/icu/index.jsp"
> -
> -BASE_SRC_URI =3D "ftp://ftp.software.ibm.com/software/globalization/icu/=
3.6/icu4c-3_6-src.tgz \
> -           file://gccfix.patch \
> -           file://fix-parallel-build.patch \
> -           file://use-g++-for-linking.patch \
> -           file://larger-cmd-size.patch \
> -	   file://icu-add-pkgconfig-support.patch \
> -           "
> -SRC_URI =3D "${BASE_SRC_URI} \
> -           file://noldlibpath.patch \
> -           "
> -SRC_URI_class-native =3D "${BASE_SRC_URI}"
> +HOMEPAGE =3D "http://site.icu-project.org/"
> =20
>  LICENSE =3D "ICU"
> -LIC_FILES_CHKSUM =3D "file://../license.html;md5=3D5c94767cedb5d6987c902=
ac850ded2c6"
>  DEPENDS =3D "icu-native"
>  DEPENDS_class-native =3D ""
> =20
>  S =3D "${WORKDIR}/icu/source"
> +STAGING_ICU_SOURCE_DIR_NATIVE =3D "${STAGING_DATADIR_NATIVE}/icu"
> =20
>  PARALLEL_MAKE =3D ""
>  FULL_OPTIMIZATION_arm =3D "-Os"
> =20
>  inherit autotools pkgconfig binconfig
> =20
> -do_configure() {
> -	libtoolize --force
> -	gnu-configize --force
> -	if [ "${PN}" !=3D "icu-native" ]; then
> -		OLD=3D`pwd`
> -		cd ${S}
> -		autoconf
> -		cd ${OLD}
> -	fi
> -	oe_runconf
> -	if [ "${PN}" !=3D "icu-native" ]; then
> -		# In the non-native case we need to make substitutions to use
> -		# the native versions of the tools
> -		for i in */Makefile* */*.inc */*/Makefile* */*/*.inc */*/*.inc.in ; do
> -			sed -i -e 's:$(INVOKE) $(BINDIR)/:$(INVOKE) :g' $i=20
> -			sed -i -e 's:$(BINDIR)/::g' $i=20
> -		done
> -	fi
> -}
> +# ICU needs the native build directory as an argument to its --with-cros=
s-build option when
> +# cross-compiling. Taken the situation that different builds may share a=
 common sstate-cache
> +# into consideration, the native build directory needs to be staged.
> +EXTRA_OECONF =3D "--with-cross-build=3D${STAGING_DATADIR_NATIVE}/icu/sou=
rce"
> +EXTRA_OECONF_class-native =3D ""
> =20
> -do_compile() {
> -	oe_runmake 'CXX=3D${CXX}'
> +do_configure_prepend() {
> +    [ -f acinclude.m4 ] || cp aclocal.m4 acinclude.m4
>  }
> =20
>  do_install_append() {
> -        chmod +x ${D}${libdir}/lib*
> -	if [ "${PN}" !=3D "icu-native" ]; then
> -		install -d ${D}/${libdir}/pkgconfig
> -        	install -m 0644 ${S}/icu.pc ${D}/${libdir}/pkgconfig
> -	fi
> +    if [ ${PN} =3D=3D 'icu-native' ]; then
> +	mkdir -p ${D}/${STAGING_ICU_SOURCE_DIR_NATIVE}
> +	cp -r ${S} ${D}/${STAGING_ICU_SOURCE_DIR_NATIVE}
> +    fi
>  }
> =20
>  PACKAGES =3D+ "libicudata libicuuc libicui18n libicule libiculx libicutu=
 libicuio"
> @@ -72,4 +45,3 @@ FILES_libicuio =3D "${libdir}/libicuio.so.*"
> =20
>  BBCLASSEXTEND =3D "native"
> =20
> -SSTATE_SCAN_FILES +=3D "Makefile.inc"
> diff --git a/meta/recipes-support/icu/icu_3.6.bb b/meta/recipes-support/i=
cu/icu_3.6.bb
> deleted file mode 100644
> index f50abe2..0000000
> --- a/meta/recipes-support/icu/icu_3.6.bb
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -require icu-3.6.inc
> -
> -PR =3D "r10"
> -
> -SRC_URI[md5sum] =3D "6243f7a19e03e05403ce84e597510d4c"
> -SRC_URI[sha256sum] =3D "5135e8d69d6206d320515df7aeee7027711ab1aef9d8dbf2=
9571a97a9746b041"
> diff --git a/meta/recipes-support/icu/icu_50.1.bb b/meta/recipes-support/=
icu/icu_50.1.bb
> new file mode 100644
> index 0000000..8f65c6d
> --- /dev/null
> +++ b/meta/recipes-support/icu/icu_50.1.bb
> @@ -0,0 +1,11 @@
> +require icu.inc
> +
> +LIC_FILES_CHKSUM =3D "file://../license.html;md5=3D4ee45701e87d343032819=
78e3b78ecda"
> +
> +PR =3D "r1"
> +
> +BASE_SRC_URI =3D "http://download.icu-project.org/files/icu4c/50.1/icu4c=
-50_1-src.tgz"
> +SRC_URI =3D "${BASE_SRC_URI}"
> +
> +SRC_URI[md5sum] =3D "cf7bf9e56aa6c2057a8b6f464046483e"
> +SRC_URI[sha256sum] =3D "68592b3c07d9b86100f41d0172eb1a81f3ffb2a8fef1104d=
7395099079ba7350"
> \ No newline at end of file
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Bqc0IY4JZZt50bUr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDLkaUACgkQN1Ujt2V2gBzWQwCguDeke2emUdKor8f28o2HRsTb
dnEAniHdKUFRHalcTxDhKbzaHLJeW05A
=ldWT
-----END PGP SIGNATURE-----

--Bqc0IY4JZZt50bUr--
