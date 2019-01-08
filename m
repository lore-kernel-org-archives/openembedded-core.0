Return-Path: <anuj.mittal@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 63D046D4AA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jan 2019 07:45:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Jan 2019 23:45:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,453,1539673200"; d="scan'208";a="124254047"
Received: from pgsmsx107.gar.corp.intel.com ([10.221.44.105])
	by orsmga002.jf.intel.com with ESMTP; 07 Jan 2019 23:45:49 -0800
Received: from pgsmsx105.gar.corp.intel.com ([169.254.4.160]) by
	PGSMSX107.gar.corp.intel.com ([169.254.7.17]) with mapi id
	14.03.0415.000; Tue, 8 Jan 2019 15:45:48 +0800
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v2] libpcap: upgrade 1.8.1 -> 1.9.0
Thread-Index: AQHUmEaD60TL8hia3E6s9jck4Rwo06WlGv3Q
Date: Tue, 8 Jan 2019 07:45:48 +0000
Message-ID: <C0207330DF60C5409302EC78C3FE68F3022112EB@PGSMSX105.gar.corp.intel.com>
References: <20181220084336.7294-5-anuj.mittal@intel.com>
	<20181220092838.11025-1-anuj.mittal@intel.com>
In-Reply-To: <20181220092838.11025-1-anuj.mittal@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYmExMjNiNWItN2FmOS00NzY5LTg0OWItMjc2ZTNkMmI1NGZlIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiQ3VSR1pXWWRsN2Q5cFBCcVhSVEIrWXpvNWdrQWtOWHFQWFpTdlpDYlN6R2FGOUk1SkZPbmNLVHdMVVFPOXpwXC8ifQ==
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Subject: Re: [PATCH v2] libpcap: upgrade 1.8.1 -> 1.9.0
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
X-List-Received-Date: Tue, 08 Jan 2019 07:45:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping for the series.

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedd=
ed-
> core-bounces@lists.openembedded.org] On Behalf Of Anuj Mittal
> Sent: Thursday, December 20, 2018 05:29 PM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH v2] libpcap: upgrade 1.8.1 -> 1.9.0
>=20
> * For changes, see:
> https://www.tcpdump.org/libpcap-changes.txt
>=20
> * Merge inc and bb and remove unnecessary flags.
>=20
> * Remove all patches, they have either been upstreamed or fixed different=
ly.
>=20
> * Compilation with bluez5 works just fine, enable it and remove bluez4 co=
nfig.
>=20
> * Backport a commit to fix musl builds.
>=20
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>  ...te_t.ai-usage-when-INET6-is-not-defi.patch | 41 -----------  ...-add-=
missing-limits.h-
> for-musl-syste.patch | 29 ++++++++  ...d-missing-compiler_state_t-paramet=
er.patch | 67
> -----------------
>  .../libpcap/libpcap/disable-remote.patch      | 36 ---------
>  .../libpcap/libpcap/fix-grammar-deps.patch    | 29 --------
>  .../libpcap/libpcap-pkgconfig-support.patch   | 73 -------------------
>  .../libpcap/libpcap_1.8.1.bb                  | 31 --------
>  .../libpcap/{libpcap.inc =3D> libpcap_1.9.0.bb} | 29 ++++----
>  8 files changed, 45 insertions(+), 290 deletions(-)  delete mode 100644 =
meta/recipes-
> connectivity/libpcap/libpcap/0001-Fix-compiler_state_t.ai-usage-when-INET=
6-is-not-
> defi.patch
>  create mode 100644 meta/recipes-connectivity/libpcap/libpcap/0001-pcap-u=
sb-
> linux.c-add-missing-limits.h-for-musl-syste.patch
>  delete mode 100644 meta/recipes-connectivity/libpcap/libpcap/0002-Add-mi=
ssing-
> compiler_state_t-parameter.patch
>  delete mode 100644 meta/recipes-connectivity/libpcap/libpcap/disable-rem=
ote.patch
>  delete mode 100644 meta/recipes-connectivity/libpcap/libpcap/fix-grammar=
-
> deps.patch
>  delete mode 100644 meta/recipes-connectivity/libpcap/libpcap/libpcap-pkg=
config-
> support.patch
>  delete mode 100644 meta/recipes-connectivity/libpcap/libpcap_1.8.1.bb
>  rename meta/recipes-connectivity/libpcap/{libpcap.inc =3D> libpcap_1.9.0=
.bb} (58%)
>=20
> diff --git a/meta/recipes-connectivity/libpcap/libpcap/0001-Fix-compiler_=
state_t.ai-
> usage-when-INET6-is-not-defi.patch b/meta/recipes-
> connectivity/libpcap/libpcap/0001-Fix-compiler_state_t.ai-usage-when-INET=
6-is-not-
> defi.patch
> deleted file mode 100644
> index edb6ae5667..0000000000
> --- a/meta/recipes-connectivity/libpcap/libpcap/0001-Fix-compiler_state_t=
.ai-usage-
> when-INET6-is-not-defi.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -From 64aa033a061c43fc15c711f2490ae41d23b868c3 Mon Sep 17 00:00:00 2001
> -From: Fabio Berton <fabio.berton@ossystems.com.br>
> -Date: Thu, 17 Nov 2016 09:44:42 -0200
> -Subject: [PATCH 1/2] Fix compiler_state_t.ai usage when INET6 is not def=
ined
> -Organization: O.S. Systems Software LTDA.
> -
> -Fix error:
> -
> -/
> -| ../libpcap-1.8.1/gencode.c: In function 'pcap_compile':
> -| ../libpcap-1.8.1/gencode.c:693:8: error: 'compiler_state_t {aka
> -| struct _compiler_state}' has no member named 'ai'
> -|   cstate.ai =3D NULL;
> -\
> -
> -Upstream-Status: Submitted [1]
> -
> -[1] https://github.com/the-tcpdump-group/libpcap/pull/541
> -
> -Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> ----
> - gencode.c | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/gencode.c b/gencode.c
> -index a887f27..e103c70 100644
> ---- a/gencode.c
> -+++ b/gencode.c
> -@@ -690,7 +690,9 @@ pcap_compile(pcap_t *p, struct bpf_program *program,
> - 	}
> - 	initchunks(&cstate);
> - 	cstate.no_optimize =3D 0;
> -+#ifdef INET6
> - 	cstate.ai =3D NULL;
> -+#endif
> - 	cstate.ic.root =3D NULL;
> - 	cstate.ic.cur_mark =3D 0;
> - 	cstate.bpf_pcap =3D p;
> ---
> -2.1.4
> -
> diff --git a/meta/recipes-connectivity/libpcap/libpcap/0001-pcap-usb-linu=
x.c-add-
> missing-limits.h-for-musl-syste.patch b/meta/recipes-
> connectivity/libpcap/libpcap/0001-pcap-usb-linux.c-add-missing-limits.h-f=
or-musl-
> syste.patch
> new file mode 100644
> index 0000000000..01773834c7
> --- /dev/null
> +++ b/meta/recipes-connectivity/libpcap/libpcap/0001-pcap-usb-linux.c-ad
> +++ d-missing-limits.h-for-musl-syste.patch
> @@ -0,0 +1,29 @@
> +From aafa3512b7b742f5e66a5543e41974cc5e7eebfa Mon Sep 17 00:00:00 2001
> +From: maxice8 <thinkabit.ukim@gmail.com>
> +Date: Sun, 22 Jul 2018 18:54:17 -0300
> +Subject: [PATCH] pcap-usb-linux.c: add missing limits.h for musl systems=
.
> +
> +fix compilation on musl libc systems like Void Linux and Alpine.
> +
> +Upstream-Status: Backport
> +[https://github.com/the-tcpdump-group/libpcap/commit/d557c98a16dc254aaf
> +f03762b694fe624e180bea]
> +
> +Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> +---
> + pcap-usb-linux.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/pcap-usb-linux.c b/pcap-usb-linux.c index
> +6f8adf65..b92c05ea 100644
> +--- a/pcap-usb-linux.c
> ++++ b/pcap-usb-linux.c
> +@@ -50,6 +50,7 @@
> + #include <stdlib.h>
> + #include <unistd.h>
> + #include <fcntl.h>
> ++#include <limits.h>
> + #include <string.h>
> + #include <dirent.h>
> + #include <byteswap.h>
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-connectivity/libpcap/libpcap/0002-Add-missing-
> compiler_state_t-parameter.patch b/meta/recipes-connectivity/libpcap/libp=
cap/0002-
> Add-missing-compiler_state_t-parameter.patch
> deleted file mode 100644
> index 032b265f05..0000000000
> --- a/meta/recipes-connectivity/libpcap/libpcap/0002-Add-missing-compiler=
_state_t-
> parameter.patch
> +++ /dev/null
> @@ -1,67 +0,0 @@
> -From 50ec0a088d5924a8305b2d70dcba71b0942dee1a Mon Sep 17 00:00:00 2001
> -From: Fabio Berton <fabio.berton@ossystems.com.br>
> -Date: Thu, 17 Nov 2016 09:47:29 -0200
> -Subject: [PATCH 2/2] Add missing compiler_state_t parameter
> -Organization: O.S. Systems Software LTDA.
> -
> -Fix error:
> -
> -/
> -|../libpcap-1.8.1/gencode.c: In function 'gen_gateway':
> -|../libpcap-1.8.1/gencode.c:4914:13: error: 'cstate' undeclared  (first
> -|use in this function)
> -|    bpf_error(cstate, "direction applied to 'gateway'");
> -\
> -
> -Upstream-Status: Submitted [1]
> -
> -[1] https://github.com/the-tcpdump-group/libpcap/pull/541
> -
> -Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> ----
> - gencode.c | 15 ++++++++-------
> - 1 file changed, 8 insertions(+), 7 deletions(-)
> -
> -diff --git a/gencode.c b/gencode.c
> -index e103c70..f07c0be 100644
> ---- a/gencode.c
> -+++ b/gencode.c
> -@@ -523,7 +523,7 @@ static struct block *gen_host6(compiler_state_t *, s=
truct
> in6_addr *,
> -     struct in6_addr *, int, int, int);
> - #endif
> - #ifndef INET6
> --static struct block *gen_gateway(const u_char *, bpf_u_int32 **, int, i=
nt);
> -+static struct block *gen_gateway(compiler_state_t *, const u_char *,
> -+bpf_u_int32 **, int, int);
> - #endif
> - static struct block *gen_ipfrag(compiler_state_t *);
> - static struct block *gen_portatom(compiler_state_t *, int, bpf_int32); =
-@@ -4904,11
> +4904,12 @@ gen_host6(compiler_state_t *cstate, struct in6_addr *addr,
> -
> - #ifndef INET6
> - static struct block *
> --gen_gateway(eaddr, alist, proto, dir)
> --	const u_char *eaddr;
> --	bpf_u_int32 **alist;
> --	int proto;
> --	int dir;
> -+gen_gateway(cstate, eaddr, alist, proto, dir)
> -+    compiler_state_t *cstate;
> -+    const u_char *eaddr;
> -+    bpf_u_int32 **alist;
> -+    int proto;
> -+    int dir;
> - {
> - 	struct block *b0, *b1, *tmp;
> -
> -@@ -6472,7 +6473,7 @@ gen_scode(compiler_state_t *cstate, const char *na=
me,
> struct qual q)
> - 		alist =3D pcap_nametoaddr(name);
> - 		if (alist =3D=3D NULL || *alist =3D=3D NULL)
> - 			bpf_error(cstate, "unknown host '%s'", name);
> --		b =3D gen_gateway(eaddr, alist, proto, dir);
> -+		b =3D gen_gateway(cstate, eaddr, alist, proto, dir);
> - 		free(eaddr);
> - 		return b;
> - #else
> ---
> -2.1.4
> -
> diff --git a/meta/recipes-connectivity/libpcap/libpcap/disable-remote.pat=
ch
> b/meta/recipes-connectivity/libpcap/libpcap/disable-remote.patch
> deleted file mode 100644
> index 7e1eea6b1e..0000000000
> --- a/meta/recipes-connectivity/libpcap/libpcap/disable-remote.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -Disable bits of remote capture support inherited from the WinPCAP merge =
-which
> cause applications to FTBFS if they define HAVE_REMOTE.
> -
> -Patch from:
> -https://anonscm.debian.org/cgit/users/rfrancoise/libpcap.git/commit/?
> -id=3Df35949969269dfdcc3549b12fade604755e1e326
> -
> -Upstream-Status: Pending
> -
> ---- a/pcap/pcap.h
> -+++ b/pcap/pcap.h
> -@@ -506,6 +506,11 @@
> -   #define MODE_STAT 1
> -   #define MODE_MON 2
> -
> -+#ifdef HAVE_REMOTE
> -+  /* Includes most of the public stuff that is needed for the remote
> -+capture */
> -+  #include <remote-ext.h>
> -+#endif	 /* HAVE_REMOTE */
> -+
> - #elif defined(MSDOS)
> -
> -   /*
> -@@ -526,11 +531,6 @@
> -
> - #endif /* _WIN32/MSDOS/UN*X */
> -
> --#ifdef HAVE_REMOTE
> --  /* Includes most of the public stuff that is needed for the remote ca=
pture */
> --  #include <remote-ext.h>
> --#endif	 /* HAVE_REMOTE */
> --
> - #ifdef __cplusplus
> - }
> - #endif
> -
> diff --git a/meta/recipes-connectivity/libpcap/libpcap/fix-grammar-deps.p=
atch
> b/meta/recipes-connectivity/libpcap/libpcap/fix-grammar-deps.patch
> deleted file mode 100644
> index f40e655c44..0000000000
> --- a/meta/recipes-connectivity/libpcap/libpcap/fix-grammar-deps.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -Fix a missing dependency that can result in:
> -
> -../libpcap-1.8.1/grammar.y:78:10: fatal error: scanner.h: No such file o=
r directory
> -
> -Upstream-Status: Backport
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -From 0dd90a6bdbce4dca14106859eee63ef643a106e2 Mon Sep 17 00:00:00 2001
> -From: Alfredo Alvarez Fernandez <alfredoalvarezernandez@gmail.com>
> -Date: Tue, 21 Feb 2017 11:41:43 +0100
> -Subject: [PATCH] Makefile.in: Fix missing dependency
> -
> ----
> - Makefile.in | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/Makefile.in b/Makefile.in
> -index 7044f043..f5d443ae 100644
> ---- a/Makefile.in
> -+++ b/Makefile.in
> -@@ -465,7 +465,7 @@ grammar.h: grammar.c
> - 		$(MAKE) $(MAKEFLAGS) grammar.c; \
> - 	fi
> -
> --grammar.o: grammar.c
> -+grammar.o: grammar.c scanner.h
> - 	$(CC) $(FULL_CFLAGS) -c grammar.c
> -
> - gencode.o: $(srcdir)/gencode.c grammar.h scanner.h diff --git a/meta/re=
cipes-
> connectivity/libpcap/libpcap/libpcap-pkgconfig-support.patch b/meta/recip=
es-
> connectivity/libpcap/libpcap/libpcap-pkgconfig-support.patch
> deleted file mode 100644
> index afaa3bea9b..0000000000
> --- a/meta/recipes-connectivity/libpcap/libpcap/libpcap-pkgconfig-support=
.patch
> +++ /dev/null
> @@ -1,73 +0,0 @@
> -From 2796129af52901dd68595e5e88a639308541def9 Mon Sep 17 00:00:00 2001
> -From: Fabio Berton <fabio.berton@ossystems.com.br>
> -Date: Thu, 3 Nov 2016 17:56:29 -0200
> -Subject: [PATCH] libpcap: pkgconfig support
> -Organization: O.S. Systems Software LTDA.
> -
> -Adding basic structure to support pkg-config.
> -
> -Upstream-Status: Inappropriate [embedded specific]
> -
> -Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> -Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> ----
> - Makefile.in   |  5 +++++
> - configure.ac  |  1 +
> - libpcap.pc.in | 10 ++++++++++
> - 3 files changed, 16 insertions(+)
> - create mode 100644 libpcap.pc.in
> -
> -diff --git a/Makefile.in b/Makefile.in
> -index e71d973..d7004ed 100644
> ---- a/Makefile.in
> -+++ b/Makefile.in
> -@@ -61,6 +61,10 @@ V_RPATH_OPT =3D @V_RPATH_OPT@
> - DEPENDENCY_CFLAG =3D @DEPENDENCY_CFLAG@
> - PROG=3Dlibpcap
> -
> -+# pkgconfig support
> -+pkgconfigdir =3D $(libdir)/pkgconfig
> -+pkgconfig_DATA =3D libpcap.pc
> -+
> - # Standard CFLAGS
> - FULL_CFLAGS =3D $(CCOPT) $(INCLS) $(DEFS) $(CFLAGS)
> -
> -@@ -286,6 +290,7 @@ EXTRA_DIST =3D \
> - 	lbl/os-solaris2.h \
> - 	lbl/os-sunos4.h \
> - 	lbl/os-ultrix4.h \
> -+	libpcap.pc \
> - 	missing/getopt.c \
> - 	missing/getopt.h \
> - 	missing/snprintf.c \
> -diff --git a/configure.ac b/configure.ac -index da2f940..4fc67bf 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -1805,6 +1805,7 @@ fi
> - AC_PROG_INSTALL
> -
> - AC_CONFIG_HEADER(config.h)
> -+AC_CONFIG_FILES([libpcap.pc])
> -
> - AC_OUTPUT_COMMANDS([if test -f .devel; then
> - 	echo timestamp > stamp-h
> -diff --git a/libpcap.pc.in b/libpcap.pc.in -new file mode 100644 -index
> 0000000..4f78ad8
> ---- /dev/null
> -+++ b/libpcap.pc.in
> -@@ -0,0 +1,10 @@
> -+prefix=3D@prefix@
> -+exec_prefix=3D@exec_prefix@
> -+libdir=3D@libdir@
> -+includedir=3D@includedir@
> -+
> -+Name: libpcap
> -+Description: System-independent interface for user-level packet capture=
.
> -+Version: @VERSION@
> -+Libs: -L${libdir} -lpcap
> -+Cflags: -I${includedir}
> ---
> -2.1.4
> -
> diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.8.1.bb b/meta/re=
cipes-
> connectivity/libpcap/libpcap_1.8.1.bb
> deleted file mode 100644
> index 13dfbd67a8..0000000000
> --- a/meta/recipes-connectivity/libpcap/libpcap_1.8.1.bb
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -require libpcap.inc
> -
> -SRC_URI +=3D " \
> -    file://libpcap-pkgconfig-support.patch \
> -    file://0001-Fix-compiler_state_t.ai-usage-when-INET6-is-not-defi.pat=
ch \
> -    file://0002-Add-missing-compiler_state_t-parameter.patch \
> -    file://disable-remote.patch \
> -    file://fix-grammar-deps.patch \
> -"
> -
> -SRC_URI[md5sum] =3D "3d48f9cd171ff12b0efd9134b52f1447"
> -SRC_URI[sha256sum] =3D
> "673dbc69fdc3f5a86fb5759ab19899039a8e5e6c631749e48dcd9c6f0c83541e"
> -
> -#
> -# make install doesn't cover the shared lib -# make install-shared is ju=
st broken (no
> symlinks) -#
> -
> -do_configure_prepend () {
> -    #remove hardcoded references to /usr/include
> -    sed 's|\([ "^'\''I]\+\)/usr/include/|\1${STAGING_INCDIR}/|g' -i ${S}=
/configure.ac
> -}
> -
> -do_install_prepend () {
> -    install -d ${D}${libdir}
> -    install -d ${D}${bindir}
> -    oe_runmake install-shared DESTDIR=3D${D}
> -    oe_libinstall -a -so libpcap ${D}${libdir}
> -    sed "s|@VERSION@|${PV}|" -i ${B}/libpcap.pc
> -    install -D -m 0644 libpcap.pc ${D}${libdir}/pkgconfig/libpcap.pc
> -}
> diff --git a/meta/recipes-connectivity/libpcap/libpcap.inc b/meta/recipes=
-
> connectivity/libpcap/libpcap_1.9.0.bb
> similarity index 58%
> rename from meta/recipes-connectivity/libpcap/libpcap.inc
> rename to meta/recipes-connectivity/libpcap/libpcap_1.9.0.bb
> index e57ea87b37..78361561e6 100644
> --- a/meta/recipes-connectivity/libpcap/libpcap.inc
> +++ b/meta/recipes-connectivity/libpcap/libpcap_1.9.0.bb
> @@ -10,33 +10,36 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D5eb289217c160e2920d2e35bddc36453 \
>=20
> file://pcap.h;beginline=3D1;endline=3D32;md5=3D39af3510e011f34b8872f120b1=
dc31d2"
>  DEPENDS =3D "flex-native bison-native"
>=20
> -INC_PR =3D "r5"
> +SRC_URI =3D "https://www.tcpdump.org/release/${BP}.tar.gz \
> +           file://0001-pcap-usb-linux.c-add-missing-limits.h-for-musl-sy=
ste.patch \
> +           "
> +SRC_URI[md5sum] =3D "dffd65cb14406ab9841f421732eb0f33"
> +SRC_URI[sha256sum] =3D
> "2edb88808e5913fdaa8e9c1fcaf272e19b2485338742b5074b9fe44d68f37019"
>=20
> -SRC_URI =3D "http://www.tcpdump.org/release/${BP}.tar.gz"
> +inherit autotools binconfig-disabled pkgconfig bluetooth
>=20
>  BINCONFIG =3D "${bindir}/pcap-config"
>=20
> -inherit autotools binconfig-disabled pkgconfig bluetooth
> -
> -EXTRA_OECONF =3D "--with-pcap=3Dlinux"
> +# Explicitly disable dag support. We don't have recipe for it and if
> +enabled here, # configure script poisons the include dirs with
> +/usr/local/include even when the # support hasn't been detected.
> +EXTRA_OECONF =3D " \
> +                 --with-pcap=3Dlinux \
> +                 --without-dag \
> +                 "
>  EXTRA_AUTORECONF +=3D "--exclude=3Daclocal"
>=20
>  PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth'=
,
> '${BLUEZ}', '', d)} \
>                     ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \  =
"
> -PACKAGECONFIG[bluez4] =3D "--enable-bluetooth,--disable-bluetooth,bluez4=
"
> -# Add a dummy PACKAGECONFIG for bluez5 since it is not supported by libp=
cap.
> -PACKAGECONFIG[bluez5] =3D ",,"
> +PACKAGECONFIG[bluez5] =3D "--enable-bluetooth,--disable-bluetooth,bluez5=
"
>  PACKAGECONFIG[dbus] =3D "--enable-dbus,--disable-dbus,dbus"
>  PACKAGECONFIG[ipv6] =3D "--enable-ipv6,--disable-ipv6,"
>  PACKAGECONFIG[libnl] =3D "--with-libnl,--without-libnl,libnl"
>=20
> -CPPFLAGS_prepend =3D "-I${S} "
> -CFLAGS_prepend =3D "-I${S} "
> -CXXFLAGS_prepend =3D "-I${S} "
> -
>  do_configure_prepend () {
> -    sed -i -e's,^V_RPATH_OPT=3D.*$,V_RPATH_OPT=3D,' ${S}/pcap-config.in
> +    #remove hardcoded references to /usr/include
> +    sed 's|\([ "^'\''I]\+\)/usr/include/|\1${STAGING_INCDIR}/|g' -i
> + ${S}/configure.ac
>  }
>=20
>  BBCLASSEXTEND =3D "native"
> --
> 2.17.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

