Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id D36D27319C;
	Wed, 20 Jul 2016 14:00:00 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id x83so7142307wma.3;
	Wed, 20 Jul 2016 07:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=t2xOvTiDp7v5UXljvghwpsCR5ZyLgLWf2a2muIjkpPc=;
	b=kjPxlRkzKlnUpweT6OLEF1kv0at+FCteHsYa2G0huEPIsAfXiwQhf19xGPhuKjZpW5
	xySyRqB3Y7LK+RFnwoqDockLQ/ceEwRDHqJOXeVmwMBSgo4Wu9mzRreCD66UV4Ys2vpV
	jtAYwFl79U1Y+57SRMoKGH7oKkMHuw0DsRXI0Gvc6prqlbyMuZUgO6O9faLIOngROYqL
	Kk6obpqzClfRnEoFIqNT4kPW9a8rxadojEAvRUnAjoGZsqiuKqNGU2MPHlS/HkjyQthH
	z6IEiI+nFEiuFetNpkqr7VyPaJrwd4yD+l3zrQGYjQ0bzoK1rY/4y6/k7fs8cyWhwPlc
	NYyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=t2xOvTiDp7v5UXljvghwpsCR5ZyLgLWf2a2muIjkpPc=;
	b=Ctmi0do8daX2yjnPlJQ69m6NSI9JBDJsdifvmzeuvWu0Ap8VbOJonamkNBLkxNxwHS
	IDHgwQJ3ryJwCnUhaRUfL507cc6F9WMOt8N1vvsrOFtRk4vkchqaflBmb1sVJ0ZykvTl
	+Y42j9oNylH7zK9qJvZgmwglilmtCR4xMCKd4e7kLU2ssL4gQEihUA7FWU7EKf/DikLj
	ROfEzNQv6wUmEZNU2OCAgG/3bPJERwqttzJebMaVSKUndIsQKMADqiFhd+XCy/gQd9rE
	vkB8lfIBMtrKpeETI9NnX1kqt8HOCk47V2ysz2kitawy5cKWUSgKk4nwJ3mBqgXed9EF
	CT/A==
X-Gm-Message-State: ALyK8tL7QDhhHUYOAyilvPe6PdZWh3bWohq1XprFTUaNi36ATvVz3fZmgwRwWNvGr7qcoQ==
X-Received: by 10.28.155.212 with SMTP id d203mr11467909wme.103.1469023200388; 
	Wed, 20 Jul 2016 07:00:00 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169])
	by smtp.gmail.com with ESMTPSA id i1sm1437483wjl.26.2016.07.20.06.59.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 20 Jul 2016 06:59:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 20 Jul 2016 16:00:05 +0200
To: openembedded-core@lists.openembedded.org,
	Jussi Kukkonen <jussi.kukkonen@intel.com>
Message-ID: <20160720140005.v32oywji2g7cujgg@jama>
References: <20160615170615.18982.45346@opal.openembedded.org>
	<20160615170625.A38495043A@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20160615170625.A38495043A@opal.openembedded.org>
User-Agent: Mutt/1.6.2 (2016-06-11)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 38/47: sysprof: Upgrade to git version slightly past 3.20
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
X-List-Received-Date: Wed, 20 Jul 2016 14:00:01 -0000
X-Groupsio-MsgNum: 84727
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="e24iltkryapnj5tj"
Content-Disposition: inline

--e24iltkryapnj5tj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 15, 2016 at 05:06:53PM +0000, git@git.openembedded.org wrote:
> rpurdie pushed a commit to branch master
> in repository openembedded-core.
>=20
> commit ab2d5e397d30999929108c9d929767205fee9db4
> Author: Jussi Kukkonen <jussi.kukkonen@intel.com>
> AuthorDate: Wed May 4 12:49:28 2016 +0300
>=20
>     sysprof: Upgrade to git version slightly past 3.20
>    =20
>     New version uses Gtk+3. 3.20 release requires a bunch of fixes to
>     build without polkit, this git revision inclues those fixes.
>    =20
>     * Add patch to use proper U64_TO_POINTER macro to fix build on
>       32 bit platforms.
>     * Forward port memory barrier patches for arm & mips
>     * sysprof builds with loads of warnings and git builds also use
>       -Werror: avoid that by setting "--enable-compile-warnings"
>    =20
>     Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>     Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  .../sysprof/files/0001-Avoid-building-docs.patch   | 42 ++++++++++++++++=
++++++
>  .../0001-Disable-check-for-polkit-for-UI.patch     | 32 +++++++++++++++++
>  ...ward-port-mips-arm-memory-barrier-patches.patch | 38 ++++++++++++++++=
++++
>  .../files/0001-callgraph-Use-U64_TO_POINTER.patch  | 29 +++++++++++++++
>  .../sysprof/files/define-NT_GNU_BUILD_ID.patch     |  4 +--
>  .../sysprof/files/gui-argument.patch               | 35 ----------------=
--
>  meta/recipes-kernel/sysprof/files/rmb-arm.patch    | 21 -----------
>  meta/recipes-kernel/sysprof/files/rmb-mips.patch   | 22 ------------
>  meta/recipes-kernel/sysprof/sysprof_git.bb         | 34 ++++++++++------=
--
>  9 files changed, 163 insertions(+), 94 deletions(-)

Causes couple new QA issues:

sysprof-3.20.0+gitAUTOINC+9c6cec9b49: sysprof: Files/directories were
installed but not shipped in any package:
  /lib
  /usr/share/dbus-1
  /usr/share/dbus-1/system.d
  /usr/share/dbus-1/system-services
  /usr/share/dbus-1/system.d/org.gnome.Sysprof2.conf
  /usr/share/dbus-1/system-services/org.gnome.Sysprof2.service
  /lib/systemd
  /lib/systemd/system
  /lib/systemd/system/sysprof2.service
Please set FILES such that these items are packaged. Alternatively if
they are unneeded, avoid installing them or delete them within
do_install.
sysprof: 9 installed and not shipped files. [installed-vs-shipped]
sysprof-3.20.0+gitAUTOINC+9c6cec9b49: sysprof rdepends on polkit, but it
isn't a build dependency, missing polkit in DEPENDS or PACKAGECONFIG?
[build-deps]

> diff --git a/meta/recipes-kernel/sysprof/files/0001-Avoid-building-docs.p=
atch b/meta/recipes-kernel/sysprof/files/0001-Avoid-building-docs.patch
> new file mode 100644
> index 0000000..202f354
> --- /dev/null
> +++ b/meta/recipes-kernel/sysprof/files/0001-Avoid-building-docs.patch
> @@ -0,0 +1,42 @@
> +From 27df521c68e7c8b5b050dab15f40aa15fd03623a Mon Sep 17 00:00:00 2001
> +From: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +Date: Wed, 4 May 2016 14:58:24 +0300
> +Subject: [PATCH] Avoid building docs
> +
> +Upstream-Status: Inappropriate
> +Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +---
> + Makefile.am | 2 +-
> + m4/yelp.m4  | 6 ------
> + 2 files changed, 1 insertion(+), 7 deletions(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index b919a3f..3a3851d 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -1,4 +1,4 @@
> +-SUBDIRS =3D daemon data help lib po src tools tests
> ++SUBDIRS =3D daemon data lib po src tools tests
> +=20
> + EXTRA_DIST =3D AUTHORS tap-test COPYING.gpl-2
> +=20
> +diff --git a/m4/yelp.m4 b/m4/yelp.m4
> +index 5db847f..1b6ede4 100644
> +--- a/m4/yelp.m4
> ++++ b/m4/yelp.m4
> +@@ -27,12 +27,6 @@ AC_ARG_WITH([help-dir],
> + HELP_DIR=3D"$with_help_dir"
> + AC_SUBST(HELP_DIR)
> +=20
> +-AC_ARG_VAR([ITSTOOL], [Path to the `itstool` command])
> +-AC_CHECK_PROG([ITSTOOL], [itstool], [itstool])
> +-if test x"$ITSTOOL" =3D x; then
> +-  AC_MSG_ERROR([itstool not found])
> +-fi
> +-
> + AC_ARG_VAR([XMLLINT], [Path to the `xmllint` command])
> + AC_CHECK_PROG([XMLLINT], [xmllint], [xmllint])
> + if test x"$XMLLINT" =3D x; then
> +--=20
> +2.1.4
> +
> diff --git a/meta/recipes-kernel/sysprof/files/0001-Disable-check-for-pol=
kit-for-UI.patch b/meta/recipes-kernel/sysprof/files/0001-Disable-check-for=
-polkit-for-UI.patch
> new file mode 100644
> index 0000000..6085232
> --- /dev/null
> +++ b/meta/recipes-kernel/sysprof/files/0001-Disable-check-for-polkit-for=
-UI.patch
> @@ -0,0 +1,32 @@
> +From 765d578145e31ddc9495adfab8037ade33c6a9cc Mon Sep 17 00:00:00 2001
> +From: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +Date: Wed, 4 May 2016 10:59:36 +0300
> +Subject: [PATCH] Disable check for polkit for UI
> +
> +The check is not technically required: sysprof just needs
> +to be able to access system perf counters at runtime.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +---
> + configure.ac | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 8559597..ecf93ad 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -131,8 +131,8 @@ AS_IF([test "$enable_gtk" =3D auto],[
> + 	AS_IF([test "$have_gtk" =3D "yes" && test "$have_polkit" =3D "yes"],[e=
nable_gtk=3Dyes],[enable_gtk=3Dno])
> + ])
> + AS_IF([test "$enable_gtk" =3D "yes"],[
> +-	AS_IF([test "$have_gtk" =3D "yes" && test "$have_polkit" =3D "yes"],[]=
,[
> +-		AC_MSG_ERROR([--enable-gtk requires gtk+-3.0 >=3D gtk_required_versio=
n and polkit-gobject-1])
> ++	AS_IF([test "$have_gtk" =3D "yes"],[],[
> ++		AC_MSG_ERROR([--enable-gtk requires gtk+-3.0 >=3D gtk_required_versio=
n])
> + 	])
> + ])
> + AM_CONDITIONAL(ENABLE_GTK, test "$enable_gtk" =3D "yes")
> +--=20
> +2.8.1
> +
> diff --git a/meta/recipes-kernel/sysprof/files/0001-Forward-port-mips-arm=
-memory-barrier-patches.patch b/meta/recipes-kernel/sysprof/files/0001-Forw=
ard-port-mips-arm-memory-barrier-patches.patch
> new file mode 100644
> index 0000000..92e804f
> --- /dev/null
> +++ b/meta/recipes-kernel/sysprof/files/0001-Forward-port-mips-arm-memory=
-barrier-patches.patch
> @@ -0,0 +1,38 @@
> +From a2d385e504323641b1127821833c61e77301c90b Mon Sep 17 00:00:00 2001
> +From: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +Date: Sat, 11 Jun 2016 22:45:37 +0300
> +Subject: [PATCH] Forward port mips & arm memory barrier patches
> +
> +Upstream-Status: Pending
> +Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +---
> + lib/util/util.h | 15 +++++++++++++++
> + 1 file changed, 15 insertions(+)
> +
> +diff --git a/lib/util/util.h b/lib/util/util.h
> +index 591722d..0768056 100644
> +--- a/lib/util/util.h
> ++++ b/lib/util/util.h
> +@@ -29,4 +29,19 @@
> + #define read_barrier()           asm volatile("" ::: "memory")
> + #endif
> +=20
> ++#ifdef __arm__
> ++/*
> ++ * Use the __kuser_memory_barrier helper in the CPU helper page. See
> ++ * arch/arm/kernel/entry-armv.S in the kernel source for details.
> ++ */
> ++#define read_barrier()         ((void(*)(void))0xffff0fa0)()
> ++#endif
> ++
> ++#ifdef __mips__
> ++#define read_barrier()         asm volatile(".set   mips2\n\t" \
> ++                                            "sync\n\t" \
> ++                                            ".set   mips0" ::: "memory")
> ++#endif
> ++
> ++
> + #endif /* SP_UTIL_H */
> +--=20
> +2.1.4
> +
> diff --git a/meta/recipes-kernel/sysprof/files/0001-callgraph-Use-U64_TO_=
POINTER.patch b/meta/recipes-kernel/sysprof/files/0001-callgraph-Use-U64_TO=
_POINTER.patch
> new file mode 100644
> index 0000000..ac1384c
> --- /dev/null
> +++ b/meta/recipes-kernel/sysprof/files/0001-callgraph-Use-U64_TO_POINTER=
=2Epatch
> @@ -0,0 +1,29 @@
> +From 05816e6f9cd65b2624bb04de65fdf61031c7017f Mon Sep 17 00:00:00 2001
> +From: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +Date: Fri, 10 Jun 2016 14:01:54 +0300
> +Subject: [PATCH] callgraph: Use U64_TO_POINTER
> +
> +This fixes a "cast to pointer from integer of different size" on i586.
> +
> +Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +Upstream-Status: Pending
> +---
> + lib/sp-callgraph-view.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/lib/sp-callgraph-view.c b/lib/sp-callgraph-view.c
> +index 02cc17b..58315b0 100644
> +--- a/lib/sp-callgraph-view.c
> ++++ b/lib/sp-callgraph-view.c
> +@@ -135,7 +135,7 @@ build_functions_store (StackNode *node,
> +=20
> +   gtk_list_store_append (state->store, &iter);
> +   gtk_list_store_set (state->store, &iter,
> +-                      COLUMN_NAME, (const gchar *)node->data,
> ++                      COLUMN_NAME, U64_TO_POINTER(node->data),
> +                       COLUMN_SELF, 100.0 * size / state->profile_size,
> +                       COLUMN_TOTAL, 100.0 * total / state->profile_size,
> +                       COLUMN_POINTER, node,
> +--=20
> +2.1.4
> +
> diff --git a/meta/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.pat=
ch b/meta/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch
> index dcc2cbe..f75ddad 100644
> --- a/meta/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch
> +++ b/meta/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch
> @@ -7,8 +7,8 @@ Upstream-Status: Pending
> =20
>  Index: git/elfparser.h
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/elfparser.h	2011-07-16 18:57:41.000000000 -0700
> -+++ git/elfparser.h	2011-07-16 20:28:54.733829895 -0700
> +--- git.orig/lib/util/elfparser.h	2011-07-16 18:57:41.000000000 -0700
> ++++ git/lib/util/elfparser.h	2011-07-16 20:28:54.733829895 -0700
>  @@ -17,6 +17,10 @@
>    */
>   #include <glib.h>
> diff --git a/meta/recipes-kernel/sysprof/files/gui-argument.patch b/meta/=
recipes-kernel/sysprof/files/gui-argument.patch
> deleted file mode 100644
> index d2c053e..0000000
> --- a/meta/recipes-kernel/sysprof/files/gui-argument.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -Add the ability to explicitly enable/disable GUI support
> -
> -Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> -Upstream-Status: Pending
> -
> ---- git.orig/configure.ac
> -+++ git/configure.ac
> -@@ -62,12 +62,24 @@ KMICRO=3D`uname -r | cut -d"." -f 3 | cut
> - # Pkgconfig dependencies
> -=20
> - core_dep=3D"glib-2.0 >=3D 2.6.0"
> --gui_dep=3D"gtk+-2.0 > 2.6.0 gdk-pixbuf-2.0 pangoft2 libglade-2.0"
> -=20
> - PKG_CHECK_MODULES(CORE_DEP, $core_dep, [], AC_MSG_ERROR([sysprof depend=
encies not satisfied]))
> -=20
> --build_gui=3Dyes
> --PKG_CHECK_MODULES(GUI_DEP, $gui_dep, [], build_gui=3Dno)
> -+gui_dep=3D"gtk+-2.0 > 2.6.0 gdk-pixbuf-2.0 pangoft2 libglade-2.0"
> -+
> -+AC_ARG_ENABLE([gui],
> -+  [AS_HELP_STRING([--disable-gui],
> -+    [Disable GUI functionality (requires gtk+, gdk-pixbuf, pangoft2, li=
bglade) @<:@default=3Dauto@:>@])],
> -+  [],
> -+  [enable_gui=3Dauto])
> -+
> -+build_gui=3Dno
> -+AS_IF([test "x$enable_gui" !=3D xno],
> -+  [PKG_CHECK_MODULES(GUI_DEP, $gui_dep, build_gui=3Dyes,
> -+    [if test "x$enable_gui" !=3D xauto; then
> -+       AC_MSG_FAILURE(
> -+         [--enable-gui was given, but gui dependencies were not satisfi=
ed])
> -+     fi])])
> -=20
> - AM_CONDITIONAL([BUILD_GUI], [test "$build_gui" =3D yes])
> -=20
> diff --git a/meta/recipes-kernel/sysprof/files/rmb-arm.patch b/meta/recip=
es-kernel/sysprof/files/rmb-arm.patch
> deleted file mode 100644
> index c53ac64..0000000
> --- a/meta/recipes-kernel/sysprof/files/rmb-arm.patch
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -
> -Upstream-Status: Pending
> -
> -Index: git/util.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/util.h	2010-12-07 22:41:57.156243001 -0600
> -+++ git/util.h	2010-12-07 22:43:47.616243002 -0600
> -@@ -37,4 +37,13 @@
> - #define cpu_relax()     asm volatile("" ::: "memory");
> - #endif
> -=20
> -+#ifdef __arm__
> -+/*
> -+ * Use the __kuser_memory_barrier helper in the CPU helper page. See
> -+ * arch/arm/kernel/entry-armv.S in the kernel source for details.
> -+ */
> -+#define rmb()		((void(*)(void))0xffff0fa0)()
> -+#define cpu_relax()	asm volatile("":::"memory")
> -+#endif
> -+
> - #endif
> diff --git a/meta/recipes-kernel/sysprof/files/rmb-mips.patch b/meta/reci=
pes-kernel/sysprof/files/rmb-mips.patch
> deleted file mode 100644
> index e055b8a..0000000
> --- a/meta/recipes-kernel/sysprof/files/rmb-mips.patch
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -Upstream-Status: Pending
> -
> -Index: git/util.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/util.h	2010-12-08 01:22:44.486243001 -0600
> -+++ git/util.h	2010-12-08 01:23:27.836243001 -0600
> -@@ -37,4 +37,15 @@
> - #define cpu_relax()     asm volatile("" ::: "memory");
> - #endif
> -=20
> -+#ifdef __mips__
> -+#define rmb()		asm volatile(					\
> -+				".set	mips2\n\t"			\
> -+				"sync\n\t"				\
> -+				".set	mips0"				\
> -+				: /* no output */			\
> -+				: /* no input */			\
> -+				: "memory")
> -+#define cpu_relax()	asm volatile("" ::: "memory")
> -+#endif
> -+
> - #endif
> diff --git a/meta/recipes-kernel/sysprof/sysprof_git.bb b/meta/recipes-ke=
rnel/sysprof/sysprof_git.bb
> index 84c6aad..461f414 100644
> --- a/meta/recipes-kernel/sysprof/sysprof_git.bb
> +++ b/meta/recipes-kernel/sysprof/sysprof_git.bb
> @@ -1,29 +1,35 @@
>  SUMMARY =3D "System-wide Performance Profiler for Linux"
> -LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> +LICENSE =3D "GPLv3+"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504 \
> +                    file://src/sp-application.c;endline=3D17;md5=3D40e55=
577ef122c88fe20052acda64875"
> +
> +inherit gnomebase gettext
> =20
>  DEPENDS =3D "glib-2.0"
> =20
> -SRCREV =3D "cd44ee6644c3641507fb53b8a2a69137f2971219"
> -PV =3D "1.2.0+git${SRCPV}"
> +S =3D "${WORKDIR}/git"
> +SRCREV =3D "9c6cec9b49766bf77c1713bc5a7c6d651e628068"
> +PV =3D "3.20.0+git${SRCPV}"
> =20
>  SRC_URI =3D "git://git.gnome.org/sysprof \
>             file://define-NT_GNU_BUILD_ID.patch \
> -           file://gui-argument.patch \
> +           file://0001-Disable-check-for-polkit-for-UI.patch \
> +           file://0001-Avoid-building-docs.patch \
> +           file://0001-callgraph-Use-U64_TO_POINTER.patch \
> +           file://0001-Forward-port-mips-arm-memory-barrier-patches.patc=
h \
>            "
> +SRC_URI[archive.md5sum] =3D "d56e8492033b60e247634731e7f760b9"
> +SRC_URI[archive.sha256sum] =3D "4a338ad41bfffae87ef281f6e75c9660b3e0c667=
1bf5233be0c3f55a5e5b1ce5"
> =20
> -SRC_URI_append_arm  =3D " file://rmb-arm.patch"
> -SRC_URI_append_armeb  =3D " file://rmb-arm.patch"
> -SRC_URI_append_mips =3D " file://rmb-mips.patch"
> -SRC_URI_append_mips64 =3D " file://rmb-mips.patch"
> -SRC_URI_append_mips64n32 =3D " file://rmb-mips.patch"
> +AUTOTOOLS_AUXDIR =3D "${S}/build-aux"
> =20
> -S =3D "${WORKDIR}/git"
> +EXTRA_OECONF =3D "--enable-compile-warnings"
> =20
> -inherit autotools pkgconfig
> +PACKAGECONFIG ?=3D "${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3D=
ISTROFEATURES}', 'gtk', '', d)}"
> +PACKAGECONFIG[gtk] =3D "--enable-gtk,--disable-gtk,gtk+3"
> =20
> -PACKAGECONFIG ?=3D "${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK2D=
ISTROFEATURES}', 'gui', '', d)}"
> -PACKAGECONFIG[gui] =3D "--enable-gui,--disable-gui,gtk+ gdk-pixbuf pango=
 libglade"
> +FILES_${PN} +=3D "${datadir}/icons/ ${libdir}"
> +FILES_${PN}-dev =3D "${prefix}/include"
> =20
>  # We do not yet work for aarch64.
>  #
>=20
> --=20
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--e24iltkryapnj5tj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEUEARECAAYFAlePg+UACgkQN1Ujt2V2gBxPqQCWN328I4wVuglzAinrEJ2dsmJp
FwCdEmLTEpKkJMlc1flvgfmwZ6fUnfU=
=uuIA
-----END PGP SIGNATURE-----

--e24iltkryapnj5tj--
