Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1Soabg-0001fk-U0; Tue, 10 Jul 2012 15:36:02 +0200
Received: by wgbdr1 with SMTP id dr1so11426791wgb.24
	for <multiple recipients>; Tue, 10 Jul 2012 06:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=PWg8e5Nj1LRzn4oMKtUHAd0vqB4M2hay9dLFUi7EY+A=;
	b=eqNuSYbqw5FGmzdcGhrvtxxFg8JxPVMDqq8BCUZNJsTjUVLEu5F7jf7cGpjnBBCw8j
	gpogwQmyD4Agtq48SNhU9XS4zUYgFm61wynsSswpWwcIuK3PRoVnBrmx93szWOsTKqRn
	ps/o0A8mBp3Zj7DUJv933Sufc6DwU2ZTm4qCpE7QM+3tFd9IXegL1G5cJM87+Zyj1DSh
	ddj/5JEzqM+1rm2EdpTdTvyFuDTdyZr/fxFSp45E+rpXEoMybYqN47QEyb9lh3c5frYH
	j2Z4smH958veS904nzNwou5Arw7FDe10wSexj3LFONiVUwEuQU86U3g31UkvRok3T/x+
	4YfA==
Received: by 10.180.78.35 with SMTP id y3mr38211110wiw.16.1341926687128;
	Tue, 10 Jul 2012 06:24:47 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ch9sm43109299wib.8.2012.07.10.06.24.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 Jul 2012 06:24:46 -0700 (PDT)
Date: Tue, 10 Jul 2012 15:24:43 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120710132443.GC14050@jama.jama.net>
References: <20120709160033.D30BE10218@opal>
	<20120710104430.GA14050@jama.jama.net>
	<20120710111418.GB14050@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120710111418.GB14050@jama.jama.net>
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
X-List-Received-Date: Tue, 10 Jul 2012 13:36:02 -0000
X-Groupsio-MsgNum: 25061
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1SQmhf2mF2YjsYvc"
Content-Disposition: inline

--1SQmhf2mF2YjsYvc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 10, 2012 at 01:14:18PM +0200, Martin Jansa wrote:
> On Tue, Jul 10, 2012 at 12:44:30PM +0200, Martin Jansa wrote:
> > On Mon, Jul 09, 2012 at 04:00:32PM +0000, git@git.openembedded.org wrot=
e:
> > > Module: openembedded-core.git
> > > Branch: master
> > > Commit: 52d4ff7b35602faa52360a3e7a800891ef60c739
> > > URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dco=
mmit;h=3D52d4ff7b35602faa52360a3e7a800891ef60c739
> > >=20
> > > Author: Laurentiu Palcu <laurentiu.palcu@intel.com>
> > > Date:   Wed Jul  4 10:28:20 2012 +0300
> > >=20
> > > libx11: upgrade to 1.5.0
> > >=20
> > > Removed one backported patch.
> > >=20
> > > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> >=20
> > This seems to break libx11 and libx11-native build:
> >=20
> > ERROR: Function failed: do_compile (see /var/lib/jenkins/jobs/shr-core-=
branches/workspace/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/libx11-=
1_1.5.0-r0/temp/log.do_compile.20371 for further information)
> > ERROR: Logfile of failure stored in: /var/lib/jenkins/jobs/shr-core-bra=
nches/workspace/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/libx11-1_1=
=2E5.0-r0/temp/log.do_compile.20371
> > Log data follows:
> > | DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'common-l=
inux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
> > | DEBUG: Executing shell function do_compile
> > | mv: cannot stat `makekeys.c.orig': No such file or directory
> > | makekeys.c:33:27: fatal error: X11/Xresource.h: No such file or direc=
tory
> > | compilation terminated.
> > | ERROR: Function failed: do_compile (see /var/lib/jenkins/jobs/shr-cor=
e-branches/workspace/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/libx1=
1-1_1.5.0-r0/temp/log.do_compile.20371 for further information)
> > NOTE: package libx11-1_1.5.0-r0: task do_compile: Failed
>=20
> diff --git a/meta/recipes-graphics/xorg-lib/libx11.inc b/meta/recipes-gra=
phics/xorg-lib/libx11.inc
> index a1e4386..592f116 100644
> --- a/meta/recipes-graphics/xorg-lib/libx11.inc
> +++ b/meta/recipes-graphics/xorg-lib/libx11.inc
> @@ -35,9 +35,9 @@ do_compile_prepend() {
>                 sed -i -e 's:MIN_REHASH 15:MIN_REHASH 16:g' makekeys.c
>                 touch makekeys-makekeys.o;
>                 if [ "${SITEINFO_BITS}" =3D=3D "64" ]; then
> -                       ${BUILD_CC} ${BUILD_CFLAGS} -I${STAGING_INCDIR_NA=
TIVE} makekeys.c -o makekeys
> +                       ${BUILD_CC} ${BUILD_CFLAGS} -I${STAGING_INCDIR_NA=
TIVE} makekeys.c -I${S}/include -o makekeys
>                 else
> -                       ${BUILD_CC} ${BUILD_CFLAGS} -I${STAGING_INCDIR_NA=
TIVE} -DUSE32 makekeys.c -o makekeys
> +                       ${BUILD_CC} ${BUILD_CFLAGS} -I${STAGING_INCDIR_NA=
TIVE} -DUSE32 makekeys.c -I${S}/include -o makekeys
>                 fi
>         )
>         if [ "$?" !=3D "0" ]; then
>=20
> + PR bump should be enough to fix that, but I'm wondering why you haven't=
 seen it during tests (if this upgrade was tested at all).

And maybe whole makekeys build can now be done in tree, see:
https://bugs.freedesktop.org/show_bug.cgi?id=3D22584
http://cgit.freedesktop.org/xorg/lib/libX11/commit/src/util/Makefile.am?id=
=3Db2487d07f7b355f230a56e32c763acd08862735c
http://cgit.freedesktop.org/xorg/lib/libX11/commit/src/util/Makefile.am?id=
=3D24283d40b1e4314c6647dda49d2a159833341a8b

Cheers,

>=20
> Cheers,
>=20
> >=20
> > > ---
> > >=20
> > >  ...quest-as-substitute-for-GetReq-GetReqExtr.patch |  137 ----------=
----------
> > >  .../keysymdef_include.patch                        |    0
> > >  .../makekeys_crosscompile.patch                    |    0
> > >  .../x11_disable_makekeys.patch                     |   13 +-
> > >  .../xorg-lib/{libx11_1.4.4.bb =3D> libx11_1.5.0.bb}  |    7 +-
> > >  5 files changed, 11 insertions(+), 146 deletions(-)
> > >=20
> > > diff --git a/meta/recipes-graphics/xorg-lib/libx11-1.4.4/0001-Add-_XG=
etRequest-as-substitute-for-GetReq-GetReqExtr.patch b/meta/recipes-graphics=
/xorg-lib/libx11-1.4.4/0001-Add-_XGetRequest-as-substitute-for-GetReq-GetRe=
qExtr.patch
> > > deleted file mode 100644
> > > index aedb5c4..0000000
> > > --- a/meta/recipes-graphics/xorg-lib/libx11-1.4.4/0001-Add-_XGetReque=
st-as-substitute-for-GetReq-GetReqExtr.patch
> > > +++ /dev/null
> > > @@ -1,137 +0,0 @@
> > > -From 4a060f993bf676cf21ad9784e010f54134da7b40 Mon Sep 17 00:00:00 20=
01
> > > -From: Peter Hutterer <peter.hutterer@who-t.net>
> > > -Date: Mon, 17 Oct 2011 09:45:15 +1000
> > > -Subject: [PATCH] Add _XGetRequest as substitute for GetReq/GetReqExt=
ra
> > > -
> > > -Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
> > > -Reviewed-by: Jamey Sharp <jamey@minilop.net>
> > > ----
> > > - include/X11/Xlibint.h |   49 ++++++++++++++++----------------------=
-----------
> > > - src/XlibInt.c         |   31 +++++++++++++++++++++++++++++++
> > > - 2 files changed, 47 insertions(+), 33 deletions(-)
> > > -
> > > -Upstream-Status: Backport
> > > -
> > > -diff --git a/include/X11/Xlibint.h b/include/X11/Xlibint.h
> > > -index 2ce356d..43d1f2a 100644
> > > ---- a/include/X11/Xlibint.h
> > > -+++ b/include/X11/Xlibint.h
> > > -@@ -420,6 +420,18 @@ extern LockInfoPtr _Xglobal_lock;
> > > - #define WORD64ALIGN
> > > - #endif /* WORD64 */
> > > -=20
> > > -+/**
> > > -+ * Return a len-sized request buffer for the request type. This fun=
ction may
> > > -+ * flush the output queue.
> > > -+ *
> > > -+ * @param dpy The display connection
> > > -+ * @param type The request type
> > > -+ * @param len Length of the request in bytes
> > > -+ *
> > > -+ * @returns A pointer to the request buffer with a few default valu=
es
> > > -+ * initialized.
> > > -+ */
> > > -+extern void *_XGetRequest(Display *dpy, CARD8 type, size_t len);
> > > -=20
> > > - /*
> > > -  * GetReq - Get the next available X request packet in the buffer a=
nd
> > > -@@ -432,25 +444,10 @@ extern LockInfoPtr _Xglobal_lock;
> > > -=20
> > > - #if !defined(UNIXCPP) || defined(ANSICPP)
> > > - #define GetReq(name, req) \
> > > --        WORD64ALIGN\
> > > --	if ((dpy->bufptr + SIZEOF(x##name##Req)) > dpy->bufmax)\
> > > --		_XFlush(dpy);\
> > > --	req =3D (x##name##Req *)(dpy->last_req =3D dpy->bufptr);\
> > > --	req->reqType =3D X_##name;\
> > > --	req->length =3D (SIZEOF(x##name##Req))>>2;\
> > > --	dpy->bufptr +=3D SIZEOF(x##name##Req);\
> > > --	dpy->request++
> > > --
> > > -+	req =3D (x##name##Req *) _XGetRequest(dpy, X_##name, SIZEOF(x##nam=
e##Req))
> > > - #else  /* non-ANSI C uses empty comment instead of "##" for token c=
oncatenation */
> > > - #define GetReq(name, req) \
> > > --        WORD64ALIGN\
> > > --	if ((dpy->bufptr + SIZEOF(x/**/name/**/Req)) > dpy->bufmax)\
> > > --		_XFlush(dpy);\
> > > --	req =3D (x/**/name/**/Req *)(dpy->last_req =3D dpy->bufptr);\
> > > --	req->reqType =3D X_/**/name;\
> > > --	req->length =3D (SIZEOF(x/**/name/**/Req))>>2;\
> > > --	dpy->bufptr +=3D SIZEOF(x/**/name/**/Req);\
> > > --	dpy->request++
> > > -+	req =3D (x/**/name/**/Req *) _XGetRequest(dpy, X_/**/name, SIZEOF(=
x/**/name/**/Req))
> > > - #endif
> > > -=20
> > > - /* GetReqExtra is the same as GetReq, but allocates "n" additional
> > > -@@ -458,24 +455,10 @@ extern LockInfoPtr _Xglobal_lock;
> > > -=20
> > > - #if !defined(UNIXCPP) || defined(ANSICPP)
> > > - #define GetReqExtra(name, n, req) \
> > > --        WORD64ALIGN\
> > > --	if ((dpy->bufptr + SIZEOF(x##name##Req) + n) > dpy->bufmax)\
> > > --		_XFlush(dpy);\
> > > --	req =3D (x##name##Req *)(dpy->last_req =3D dpy->bufptr);\
> > > --	req->reqType =3D X_##name;\
> > > --	req->length =3D (SIZEOF(x##name##Req) + n)>>2;\
> > > --	dpy->bufptr +=3D SIZEOF(x##name##Req) + n;\
> > > --	dpy->request++
> > > -+	req =3D (x##name##Req *) _XGetRequest(dpy, X_##name, SIZEOF(x##nam=
e##Req) + n)
> > > - #else
> > > - #define GetReqExtra(name, n, req) \
> > > --        WORD64ALIGN\
> > > --	if ((dpy->bufptr + SIZEOF(x/**/name/**/Req) + n) > dpy->bufmax)\
> > > --		_XFlush(dpy);\
> > > --	req =3D (x/**/name/**/Req *)(dpy->last_req =3D dpy->bufptr);\
> > > --	req->reqType =3D X_/**/name;\
> > > --	req->length =3D (SIZEOF(x/**/name/**/Req) + n)>>2;\
> > > --	dpy->bufptr +=3D SIZEOF(x/**/name/**/Req) + n;\
> > > --	dpy->request++
> > > -+	req =3D (x/**/name/**/Req *) _XGetRequest(dpy, X_/**/name, SIZEOF(=
x/**/name/**/Req) + n)
> > > - #endif
> > > -=20
> > > -=20
> > > -diff --git a/src/XlibInt.c b/src/XlibInt.c
> > > -index 3db151e..a8f5d08 100644
> > > ---- a/src/XlibInt.c
> > > -+++ b/src/XlibInt.c
> > > -@@ -1956,6 +1956,37 @@ Screen *_XScreenOfWindow(Display *dpy, Window=
 w)
> > > - }
> > > -=20
> > > -=20
> > > -+/*
> > > -+ * WARNING: This implementation's pre-conditions and post-conditions
> > > -+ * must remain compatible with the old macro-based implementations =
of
> > > -+ * GetReq, GetReqExtra, GetResReq, and GetEmptyReq. The portions of=
 the
> > > -+ * Display structure affected by those macros are part of libX11's
> > > -+ * ABI.
> > > -+ */
> > > -+void *_XGetRequest(Display *dpy, CARD8 type, size_t len)
> > > -+{
> > > -+    xReq *req;
> > > -+
> > > -+    WORD64ALIGN
> > > -+
> > > -+    if (dpy->bufptr + len > dpy->bufmax)
> > > -+	_XFlush(dpy);
> > > -+
> > > -+    if (len % 4)
> > > -+	fprintf(stderr,
> > > -+		"Xlib: request %d length %zd not a multiple of 4.\n",
> > > -+		type, len);
> > > -+
> > > -+    dpy->last_req =3D dpy->bufptr;
> > > -+
> > > -+    req =3D (xReq*)dpy->bufptr;
> > > -+    req->reqType =3D type;
> > > -+    req->length =3D len / 4;
> > > -+    dpy->bufptr +=3D len;
> > > -+    dpy->request++;
> > > -+    return req;
> > > -+}
> > > -+
> > > - #if defined(WIN32)
> > > -=20
> > > - /*
> > > ---=20
> > > -1.7.8.3
> > > -
> > > diff --git a/meta/recipes-graphics/xorg-lib/libx11-1.4.4/keysymdef_in=
clude.patch b/meta/recipes-graphics/xorg-lib/libx11-1.5.0/keysymdef_include=
=2Epatch
> > > similarity index 100%
> > > rename from meta/recipes-graphics/xorg-lib/libx11-1.4.4/keysymdef_inc=
lude.patch
> > > rename to meta/recipes-graphics/xorg-lib/libx11-1.5.0/keysymdef_inclu=
de.patch
> > > diff --git a/meta/recipes-graphics/xorg-lib/libx11-1.4.4/makekeys_cro=
sscompile.patch b/meta/recipes-graphics/xorg-lib/libx11-1.5.0/makekeys_cros=
scompile.patch
> > > similarity index 100%
> > > rename from meta/recipes-graphics/xorg-lib/libx11-1.4.4/makekeys_cros=
scompile.patch
> > > rename to meta/recipes-graphics/xorg-lib/libx11-1.5.0/makekeys_crossc=
ompile.patch
> > > diff --git a/meta/recipes-graphics/xorg-lib/libx11-1.4.4/x11_disable_=
makekeys.patch b/meta/recipes-graphics/xorg-lib/libx11-1.5.0/x11_disable_ma=
kekeys.patch
> > > similarity index 74%
> > > rename from meta/recipes-graphics/xorg-lib/libx11-1.4.4/x11_disable_m=
akekeys.patch
> > > rename to meta/recipes-graphics/xorg-lib/libx11-1.5.0/x11_disable_mak=
ekeys.patch
> > > index e3782a5..69f9e6c 100644
> > > --- a/meta/recipes-graphics/xorg-lib/libx11-1.4.4/x11_disable_makekey=
s.patch
> > > +++ b/meta/recipes-graphics/xorg-lib/libx11-1.5.0/x11_disable_makekey=
s.patch
> > > @@ -1,10 +1,10 @@
> > >  Upstream-Status: Pending
> > > =20
> > > -Index: libX11-1.3.4/src/util/Makefile.am
> > > +Index: libX11-1.5.0/src/util/Makefile.am
> > >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > ---- libX11-1.3.4.orig/src/util/Makefile.am
> > > -+++ libX11-1.3.4/src/util/Makefile.am
> > > -@@ -1,24 +1 @@
> > > +--- libX11-1.5.0.orig/src/util/Makefile.am
> > > ++++ libX11-1.5.0/src/util/Makefile.am
> > > +@@ -1,27 +1,2 @@
> > >  -
> > >  -noinst_PROGRAMS=3Dmakekeys
> > >  -
> > > @@ -12,13 +12,16 @@ Index: libX11-1.3.4/src/util/Makefile.am
> > >  -	$(X11_CFLAGS) \
> > >  -	$(CWARNFLAGS)
> > >  -
> > > +-makekeys_CPPFLAGS =3D \
> > > +-	-I$(top_srcdir)/include
> > > +-
> > >  -CC =3D @CC_FOR_BUILD@
> > >  -CPPFLAGS =3D @CPPFLAGS_FOR_BUILD@
> > >  -CFLAGS =3D @CFLAGS_FOR_BUILD@
> > >  -LDFLAGS =3D @LDFLAGS_FOR_BUILD@
> > >  -
> > >   EXTRA_DIST =3D mkks.sh
> > > --
> > > +=20
> > >  -if LINT
> > >  -# Check source code with tools like lint & sparse
> > >  -
> > > diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb b/meta/re=
cipes-graphics/xorg-lib/libx11_1.5.0.bb
> > > similarity index 67%
> > > rename from meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb
> > > rename to meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
> > > index 1ad8046..04805d7 100644
> > > --- a/meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb
> > > +++ b/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
> > > @@ -1,7 +1,7 @@
> > >  require libx11.inc
> > >  inherit gettext
> > > =20
> > > -PR =3D "r3"
> > > +PR =3D "r0"
> > > =20
> > >  BBCLASSEXTEND =3D "native nativesdk"
> > > =20
> > > @@ -14,9 +14,8 @@ DEPENDS +=3D "util-macros xtrans libxdmcp libxau \
> > > =20
> > >  SRC_URI +=3D " file://keysymdef_include.patch \
> > >               file://x11_disable_makekeys.patch \
> > > -             file://0001-Add-_XGetRequest-as-substitute-for-GetReq-G=
etReqExtr.patch \
> > >               file://makekeys_crosscompile.patch \
> > >               "
> > > =20
> > > -SRC_URI[md5sum] =3D "ed7c382cbf8c13425b6a66bcac0ca5d9"
> > > -SRC_URI[sha256sum] =3D "7fe62180f08ef5f0a0062fb444591e349cae2ab5af6a=
d834599f5c654e6c840d"
> > > +SRC_URI[md5sum] =3D "78b4b3bab4acbdf0abcfca30a8c70cc6"
> > > +SRC_URI[sha256sum] =3D "c382efd7e92bfc3cef39a4b7f1ecf2744ba4414a705e=
3bc1e697f75502bd4d86"
> > >=20
> > >=20
> > > _______________________________________________
> > > Openembedded-commits mailing list
> > > Openembedded-commits@lists.openembedded.org
> > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-comm=
its
> >=20
> > --=20
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>=20
>=20
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1SQmhf2mF2YjsYvc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/8LRsACgkQN1Ujt2V2gBxubQCffvKjVTb201cySfwnYANfeDMk
yE8AoIkjrNYCLt4fzogk2qSMp87iYXCE
=Aufl
-----END PGP SIGNATURE-----

--1SQmhf2mF2YjsYvc--
