Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SWzG2-0007jX-JH
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 02:16:55 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 22 May 2012 17:06:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="170028416"
Received: from orsmsx606.amr.corp.intel.com ([10.22.226.128])
	by fmsmga002.fm.intel.com with ESMTP; 22 May 2012 17:06:43 -0700
Received: from orsmsx102.amr.corp.intel.com (10.22.225.129) by
	orsmsx606.amr.corp.intel.com (10.22.226.128) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 22 May 2012 17:06:42 -0700
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.157]) by
	ORSMSX102.amr.corp.intel.com ([169.254.1.192]) with mapi id
	14.01.0355.002; Tue, 22 May 2012 17:06:42 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 9/9] evolution-data-server: fix with automake
	work	in progress
Thread-Index: AQHNOHfLiNbShyOE/UGKW4W6oXY765bWfsHA
Date: Wed, 23 May 2012 00:06:42 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C030EE81F@ORSMSX106.amr.corp.intel.com>
References: <cover.1337731469.git.nitin.a.kamble@intel.com>
	<8b50dbb5abdbfb299aa8d02c968934b0c94c6bb4.1337731469.git.nitin.a.kamble@intel.com>
In-Reply-To: <8b50dbb5abdbfb299aa8d02c968934b0c94c6bb4.1337731469.git.nitin.a.kamble@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.139]
MIME-Version: 1.0
Subject: Re: [PATCH 9/9] evolution-data-server: fix with automake work	in progress
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
X-List-Received-Date: Wed, 23 May 2012 00:16:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please ignore this evolution-data-server commit, as it is not complete yet.

Nitin


> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> nitin.a.kamble@intel.com
> Sent: Tuesday, May 22, 2012 5:05 PM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 9/9] evolution-data-server: fix with automake
> work in progress
>=20
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>=20
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
>  ...olution-data-server_fix_for_automake-1.12.patch |   73
> ++++++++++++++++++++
>  meta/recipes-sato/eds/evolution-data-server_git.bb |    1 +
>  2 files changed, 74 insertions(+), 0 deletions(-)  create mode 100644
> meta/recipes-sato/eds/evolution-data-server/evolution-data-
> server_fix_for_automake-1.12.patch
>=20
> diff --git a/meta/recipes-sato/eds/evolution-data-server/evolution-
> data-server_fix_for_automake-1.12.patch b/meta/recipes-
> sato/eds/evolution-data-server/evolution-data-server_fix_for_automake-
> 1.12.patch
> new file mode 100644
> index 0000000..affe0df
> --- /dev/null
> +++ b/meta/recipes-sato/eds/evolution-data-server/evolution-data-
> server_
> +++ fix_for_automake-1.12.patch
> @@ -0,0 +1,73 @@
> +Upstream-Status: Pending
> +
> +This patch fixes following kind of issues with automake 1.12
> +
> +| automake: warnings are treated as errors
> +| Makefile.am:15: warning: '%'-style pattern rules are a GNU make
> +| extension
> +...
> +| Makefile.am:21: warning: pkgconfig_DATA:-$(API_VERSION: non-POSIX
> +| variable name
> +...
> +| /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-
> linux/usr/shar
> +| e/automake-1.12/am/ltlibrary.am: warning: 'libebookbackendfile.la':
> +| linking libtool libraries using a non-POSIX
> +| /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-
> linux/usr/share/automake-1.12/am/ltlibrary.am: archiver requires
> 'AM_PROG_AR' in 'configure.ac'
> +...
> +| addressbook/libebook/Makefile.am:55: warning: '%'-style pattern
> rules
> +| are a GNU make extension
> +...
> +| addressbook/libebook/Makefile.am:65: warning: '%'-style pattern
> rules
> +| are a GNU make extension
> +| addressbook/libebook/Makefile.am:66: warning: subst -,_,$*: non-
> POSIX
> +| variable name
> +| addressbook/libebook/Makefile.am:66: (probably a GNU make extension)
> +| addressbook/libebook/Makefile.am:72: warning:
> +| pkgconfig_DATA:-$(API_VERSION: non-POSIX variable name
> +
> +
> +Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
> +2012/05/03
> +
> +Index: git/Makefile.am
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/Makefile.am
> ++++ git/Makefile.am
> +@@ -12,7 +12,7 @@ DIST_SUBDIRS =3D libedataserver libebacken
> + changelogs =3D			\
> + 	ChangeLog
> +
> +-%-$(API_VERSION).pc: %.pc
> ++.pc.-$(API_VERSION).pc:
> + 	 cp $< $@
> +
> + pkgconfigdir =3D $(libdir)/pkgconfig
> +Index: git/configure.ac
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/configure.ac
> ++++ git/configure.ac
> +@@ -25,6 +25,10 @@ AC_CONFIG_MACRO_DIR([m4])
> + AC_CONFIG_SRCDIR(README)
> + AC_CONFIG_HEADERS(config.h)
> +
> ++# automake 1.12 seems to require this, but automake 1.11 doesn't
> ++recognize it
> ++m4_pattern_allow([AM_PROG_AR])
> ++AM_PROG_AR
> ++
> + dnl This is for the autoconf tests only - it set's the language we
> use
> + AC_LANG(C)
> +
> +Index: git/addressbook/libebook/Makefile.am
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/addressbook/libebook/Makefile.am
> ++++ git/addressbook/libebook/Makefile.am
> +@@ -52,7 +52,7 @@ libebookinclude_HEADERS =3D				\
> + 	e-name-western.h				\
> + 	e-vcard.h
> +
> +-%-$(API_VERSION).pc: %.pc
> ++.pc.-$(API_VERSION).pc:
> + 	 cp $< $@
> +
> + e-name-western-tables.h: e-name-western-tables.h.in @@ -62,7 +62,7 @@
> +pkgconfigdir =3D $(libdir)/pkgconfig  pkgconfig_DATA =3D
> +libebook-$(API_VERSION).pc
> +
> + DBUS_GENERATED_H =3D e-data-book-factory-bindings.h
> +e-data-book-bindings.h e-data-book-view-bindings.h
> +-%-bindings.h: $(top_srcdir)/addressbook/libedata-book/%.xml
> ++./%-bindings.h: $(top_srcdir)/addressbook/libedata-book/%.xml
> + 	@DBUS_BINDING_TOOL@ --mode=3Dglib-client --output=3D$@ --
> prefix=3D$(subst
> + -,_,$*) $^
> +
> + BUILT_SOURCES =3D $(DBUS_GENERATED_H) $(MARSHAL_GENERATED)
> diff --git a/meta/recipes-sato/eds/evolution-data-server_git.bb
> b/meta/recipes-sato/eds/evolution-data-server_git.bb
> index 1d675dc..325bf4c 100644
> --- a/meta/recipes-sato/eds/evolution-data-server_git.bb
> +++ b/meta/recipes-sato/eds/evolution-data-server_git.bb
> @@ -21,6 +21,7 @@ SRC_URI =3D "git://git.gnome.org/evolution-data-
> server;protocol=3Dgit \
>             file://new-contact-fix.patch \
>             file://old-gdk-api.patch \
>             file://depbuildfix.patch \
> +           file://evolution-data-server_fix_for_automake-1.12.patch \
>             file://iconv-detect.h"
>=20
>  S =3D "${WORKDIR}/git"
> --
> 1.7.7
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


