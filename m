Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1SoY6a-0002b4-MK; Tue, 10 Jul 2012 12:55:44 +0200
Received: by wibhm11 with SMTP id hm11so3436213wib.6
	for <multiple recipients>; Tue, 10 Jul 2012 03:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=thRbL/tzzipb1+13lAidMPFPlS0HlfxH3mDKXxJ9ek0=;
	b=xjCV4J2QEOSyUGkU4qt0ba6lrxQBHOF6nOacRmnRDDN8Oh0ipTMs7VJDkTmS7tcOg3
	t3usUM/uiVKuVDpFeFrX3xs76gjWh/6318BJtNguwEHbj2i6xjSEMMbqra1NURp/bm5x
	4ubYbvpnfruXCzAKapbWC3ctbZVGwYLl6vZBh/ychqur6h9AgnJZol3lNaoe6J2JaVE5
	1GcXvNXVdXbPDvWiYCJl5ZqiFJKzJwSqxpaJ6E3OLejnf9Q7TQVWQJdcpHt7vpTl/GGg
	EwK2/C9+QHS+DoR6oQtZyGvFaKGj78X1aaRuoT9YpMnNnewU/YQ8f5MDDavR/RmmV9BO
	vHeg==
Received: by 10.180.103.4 with SMTP id fs4mr37121377wib.16.1341917074210;
	Tue, 10 Jul 2012 03:44:34 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d10sm42209746wiy.3.2012.07.10.03.44.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 Jul 2012 03:44:33 -0700 (PDT)
Date: Tue, 10 Jul 2012 12:44:30 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120710104430.GA14050@jama.jama.net>
References: <20120709160033.D30BE10218@opal>
MIME-Version: 1.0
In-Reply-To: <20120709160033.D30BE10218@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Laurentiu Palcu : libx11: upgrade to 1.5.0
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
X-List-Received-Date: Tue, 10 Jul 2012 10:55:45 -0000
X-Groupsio-MsgNum: 25051
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oyUTqETQ0mS9luUI"
Content-Disposition: inline

--oyUTqETQ0mS9luUI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 09, 2012 at 04:00:32PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 52d4ff7b35602faa52360a3e7a800891ef60c739
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D52d4ff7b35602faa52360a3e7a800891ef60c739
>=20
> Author: Laurentiu Palcu <laurentiu.palcu@intel.com>
> Date:   Wed Jul  4 10:28:20 2012 +0300
>=20
> libx11: upgrade to 1.5.0
>=20
> Removed one backported patch.
>=20
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>

This seems to break libx11 and libx11-native build:

ERROR: Function failed: do_compile (see /var/lib/jenkins/jobs/shr-core-bran=
ches/workspace/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/libx11-1_1.=
5.0-r0/temp/log.do_compile.20371 for further information)
ERROR: Logfile of failure stored in: /var/lib/jenkins/jobs/shr-core-branche=
s/workspace/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/libx11-1_1.5.0=
-r0/temp/log.do_compile.20371
Log data follows:
| DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'common-linux=
', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
| DEBUG: Executing shell function do_compile
| mv: cannot stat `makekeys.c.orig': No such file or directory
| makekeys.c:33:27: fatal error: X11/Xresource.h: No such file or directory
| compilation terminated.
| ERROR: Function failed: do_compile (see /var/lib/jenkins/jobs/shr-core-br=
anches/workspace/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/libx11-1_=
1.5.0-r0/temp/log.do_compile.20371 for further information)
NOTE: package libx11-1_1.5.0-r0: task do_compile: Failed

> ---
>=20
>  ...quest-as-substitute-for-GetReq-GetReqExtr.patch |  137 --------------=
------
>  .../keysymdef_include.patch                        |    0
>  .../makekeys_crosscompile.patch                    |    0
>  .../x11_disable_makekeys.patch                     |   13 +-
>  .../xorg-lib/{libx11_1.4.4.bb =3D> libx11_1.5.0.bb}  |    7 +-
>  5 files changed, 11 insertions(+), 146 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/xorg-lib/libx11-1.4.4/0001-Add-_XGetRe=
quest-as-substitute-for-GetReq-GetReqExtr.patch b/meta/recipes-graphics/xor=
g-lib/libx11-1.4.4/0001-Add-_XGetRequest-as-substitute-for-GetReq-GetReqExt=
r.patch
> deleted file mode 100644
> index aedb5c4..0000000
> --- a/meta/recipes-graphics/xorg-lib/libx11-1.4.4/0001-Add-_XGetRequest-a=
s-substitute-for-GetReq-GetReqExtr.patch
> +++ /dev/null
> @@ -1,137 +0,0 @@
> -From 4a060f993bf676cf21ad9784e010f54134da7b40 Mon Sep 17 00:00:00 2001
> -From: Peter Hutterer <peter.hutterer@who-t.net>
> -Date: Mon, 17 Oct 2011 09:45:15 +1000
> -Subject: [PATCH] Add _XGetRequest as substitute for GetReq/GetReqExtra
> -
> -Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
> -Reviewed-by: Jamey Sharp <jamey@minilop.net>
> ----
> - include/X11/Xlibint.h |   49 ++++++++++++++++--------------------------=
-------
> - src/XlibInt.c         |   31 +++++++++++++++++++++++++++++++
> - 2 files changed, 47 insertions(+), 33 deletions(-)
> -
> -Upstream-Status: Backport
> -
> -diff --git a/include/X11/Xlibint.h b/include/X11/Xlibint.h
> -index 2ce356d..43d1f2a 100644
> ---- a/include/X11/Xlibint.h
> -+++ b/include/X11/Xlibint.h
> -@@ -420,6 +420,18 @@ extern LockInfoPtr _Xglobal_lock;
> - #define WORD64ALIGN
> - #endif /* WORD64 */
> -=20
> -+/**
> -+ * Return a len-sized request buffer for the request type. This functio=
n may
> -+ * flush the output queue.
> -+ *
> -+ * @param dpy The display connection
> -+ * @param type The request type
> -+ * @param len Length of the request in bytes
> -+ *
> -+ * @returns A pointer to the request buffer with a few default values
> -+ * initialized.
> -+ */
> -+extern void *_XGetRequest(Display *dpy, CARD8 type, size_t len);
> -=20
> - /*
> -  * GetReq - Get the next available X request packet in the buffer and
> -@@ -432,25 +444,10 @@ extern LockInfoPtr _Xglobal_lock;
> -=20
> - #if !defined(UNIXCPP) || defined(ANSICPP)
> - #define GetReq(name, req) \
> --        WORD64ALIGN\
> --	if ((dpy->bufptr + SIZEOF(x##name##Req)) > dpy->bufmax)\
> --		_XFlush(dpy);\
> --	req =3D (x##name##Req *)(dpy->last_req =3D dpy->bufptr);\
> --	req->reqType =3D X_##name;\
> --	req->length =3D (SIZEOF(x##name##Req))>>2;\
> --	dpy->bufptr +=3D SIZEOF(x##name##Req);\
> --	dpy->request++
> --
> -+	req =3D (x##name##Req *) _XGetRequest(dpy, X_##name, SIZEOF(x##name##R=
eq))
> - #else  /* non-ANSI C uses empty comment instead of "##" for token conca=
tenation */
> - #define GetReq(name, req) \
> --        WORD64ALIGN\
> --	if ((dpy->bufptr + SIZEOF(x/**/name/**/Req)) > dpy->bufmax)\
> --		_XFlush(dpy);\
> --	req =3D (x/**/name/**/Req *)(dpy->last_req =3D dpy->bufptr);\
> --	req->reqType =3D X_/**/name;\
> --	req->length =3D (SIZEOF(x/**/name/**/Req))>>2;\
> --	dpy->bufptr +=3D SIZEOF(x/**/name/**/Req);\
> --	dpy->request++
> -+	req =3D (x/**/name/**/Req *) _XGetRequest(dpy, X_/**/name, SIZEOF(x/**=
/name/**/Req))
> - #endif
> -=20
> - /* GetReqExtra is the same as GetReq, but allocates "n" additional
> -@@ -458,24 +455,10 @@ extern LockInfoPtr _Xglobal_lock;
> -=20
> - #if !defined(UNIXCPP) || defined(ANSICPP)
> - #define GetReqExtra(name, n, req) \
> --        WORD64ALIGN\
> --	if ((dpy->bufptr + SIZEOF(x##name##Req) + n) > dpy->bufmax)\
> --		_XFlush(dpy);\
> --	req =3D (x##name##Req *)(dpy->last_req =3D dpy->bufptr);\
> --	req->reqType =3D X_##name;\
> --	req->length =3D (SIZEOF(x##name##Req) + n)>>2;\
> --	dpy->bufptr +=3D SIZEOF(x##name##Req) + n;\
> --	dpy->request++
> -+	req =3D (x##name##Req *) _XGetRequest(dpy, X_##name, SIZEOF(x##name##R=
eq) + n)
> - #else
> - #define GetReqExtra(name, n, req) \
> --        WORD64ALIGN\
> --	if ((dpy->bufptr + SIZEOF(x/**/name/**/Req) + n) > dpy->bufmax)\
> --		_XFlush(dpy);\
> --	req =3D (x/**/name/**/Req *)(dpy->last_req =3D dpy->bufptr);\
> --	req->reqType =3D X_/**/name;\
> --	req->length =3D (SIZEOF(x/**/name/**/Req) + n)>>2;\
> --	dpy->bufptr +=3D SIZEOF(x/**/name/**/Req) + n;\
> --	dpy->request++
> -+	req =3D (x/**/name/**/Req *) _XGetRequest(dpy, X_/**/name, SIZEOF(x/**=
/name/**/Req) + n)
> - #endif
> -=20
> -=20
> -diff --git a/src/XlibInt.c b/src/XlibInt.c
> -index 3db151e..a8f5d08 100644
> ---- a/src/XlibInt.c
> -+++ b/src/XlibInt.c
> -@@ -1956,6 +1956,37 @@ Screen *_XScreenOfWindow(Display *dpy, Window w)
> - }
> -=20
> -=20
> -+/*
> -+ * WARNING: This implementation's pre-conditions and post-conditions
> -+ * must remain compatible with the old macro-based implementations of
> -+ * GetReq, GetReqExtra, GetResReq, and GetEmptyReq. The portions of the
> -+ * Display structure affected by those macros are part of libX11's
> -+ * ABI.
> -+ */
> -+void *_XGetRequest(Display *dpy, CARD8 type, size_t len)
> -+{
> -+    xReq *req;
> -+
> -+    WORD64ALIGN
> -+
> -+    if (dpy->bufptr + len > dpy->bufmax)
> -+	_XFlush(dpy);
> -+
> -+    if (len % 4)
> -+	fprintf(stderr,
> -+		"Xlib: request %d length %zd not a multiple of 4.\n",
> -+		type, len);
> -+
> -+    dpy->last_req =3D dpy->bufptr;
> -+
> -+    req =3D (xReq*)dpy->bufptr;
> -+    req->reqType =3D type;
> -+    req->length =3D len / 4;
> -+    dpy->bufptr +=3D len;
> -+    dpy->request++;
> -+    return req;
> -+}
> -+
> - #if defined(WIN32)
> -=20
> - /*
> ---=20
> -1.7.8.3
> -
> diff --git a/meta/recipes-graphics/xorg-lib/libx11-1.4.4/keysymdef_includ=
e.patch b/meta/recipes-graphics/xorg-lib/libx11-1.5.0/keysymdef_include.pat=
ch
> similarity index 100%
> rename from meta/recipes-graphics/xorg-lib/libx11-1.4.4/keysymdef_include=
=2Epatch
> rename to meta/recipes-graphics/xorg-lib/libx11-1.5.0/keysymdef_include.p=
atch
> diff --git a/meta/recipes-graphics/xorg-lib/libx11-1.4.4/makekeys_crossco=
mpile.patch b/meta/recipes-graphics/xorg-lib/libx11-1.5.0/makekeys_crosscom=
pile.patch
> similarity index 100%
> rename from meta/recipes-graphics/xorg-lib/libx11-1.4.4/makekeys_crosscom=
pile.patch
> rename to meta/recipes-graphics/xorg-lib/libx11-1.5.0/makekeys_crosscompi=
le.patch
> diff --git a/meta/recipes-graphics/xorg-lib/libx11-1.4.4/x11_disable_make=
keys.patch b/meta/recipes-graphics/xorg-lib/libx11-1.5.0/x11_disable_makeke=
ys.patch
> similarity index 74%
> rename from meta/recipes-graphics/xorg-lib/libx11-1.4.4/x11_disable_makek=
eys.patch
> rename to meta/recipes-graphics/xorg-lib/libx11-1.5.0/x11_disable_makekey=
s.patch
> index e3782a5..69f9e6c 100644
> --- a/meta/recipes-graphics/xorg-lib/libx11-1.4.4/x11_disable_makekeys.pa=
tch
> +++ b/meta/recipes-graphics/xorg-lib/libx11-1.5.0/x11_disable_makekeys.pa=
tch
> @@ -1,10 +1,10 @@
>  Upstream-Status: Pending
> =20
> -Index: libX11-1.3.4/src/util/Makefile.am
> +Index: libX11-1.5.0/src/util/Makefile.am
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- libX11-1.3.4.orig/src/util/Makefile.am
> -+++ libX11-1.3.4/src/util/Makefile.am
> -@@ -1,24 +1 @@
> +--- libX11-1.5.0.orig/src/util/Makefile.am
> ++++ libX11-1.5.0/src/util/Makefile.am
> +@@ -1,27 +1,2 @@
>  -
>  -noinst_PROGRAMS=3Dmakekeys
>  -
> @@ -12,13 +12,16 @@ Index: libX11-1.3.4/src/util/Makefile.am
>  -	$(X11_CFLAGS) \
>  -	$(CWARNFLAGS)
>  -
> +-makekeys_CPPFLAGS =3D \
> +-	-I$(top_srcdir)/include
> +-
>  -CC =3D @CC_FOR_BUILD@
>  -CPPFLAGS =3D @CPPFLAGS_FOR_BUILD@
>  -CFLAGS =3D @CFLAGS_FOR_BUILD@
>  -LDFLAGS =3D @LDFLAGS_FOR_BUILD@
>  -
>   EXTRA_DIST =3D mkks.sh
> --
> +=20
>  -if LINT
>  -# Check source code with tools like lint & sparse
>  -
> diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb b/meta/recipe=
s-graphics/xorg-lib/libx11_1.5.0.bb
> similarity index 67%
> rename from meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb
> rename to meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
> index 1ad8046..04805d7 100644
> --- a/meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb
> +++ b/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
> @@ -1,7 +1,7 @@
>  require libx11.inc
>  inherit gettext
> =20
> -PR =3D "r3"
> +PR =3D "r0"
> =20
>  BBCLASSEXTEND =3D "native nativesdk"
> =20
> @@ -14,9 +14,8 @@ DEPENDS +=3D "util-macros xtrans libxdmcp libxau \
> =20
>  SRC_URI +=3D " file://keysymdef_include.patch \
>               file://x11_disable_makekeys.patch \
> -             file://0001-Add-_XGetRequest-as-substitute-for-GetReq-GetRe=
qExtr.patch \
>               file://makekeys_crosscompile.patch \
>               "
> =20
> -SRC_URI[md5sum] =3D "ed7c382cbf8c13425b6a66bcac0ca5d9"
> -SRC_URI[sha256sum] =3D "7fe62180f08ef5f0a0062fb444591e349cae2ab5af6ad834=
599f5c654e6c840d"
> +SRC_URI[md5sum] =3D "78b4b3bab4acbdf0abcfca30a8c70cc6"
> +SRC_URI[sha256sum] =3D "c382efd7e92bfc3cef39a4b7f1ecf2744ba4414a705e3bc1=
e697f75502bd4d86"
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--oyUTqETQ0mS9luUI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/8B44ACgkQN1Ujt2V2gBx0DQCfeBItTgPUx6Feu0jfkAiphfps
gEQAnRNm9r6w9m/ACfdIiiZRj4qFCLpN
=oZZN
-----END PGP SIGNATURE-----

--oyUTqETQ0mS9luUI--
