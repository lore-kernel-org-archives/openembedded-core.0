Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sqg2Q-0003PT-PN
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 09:48:14 +0200
Received: by wibhq4 with SMTP id hq4so2138371wib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2012 00:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=z1EeFNfgKmKxOCiPXoc0MGsjn1Mcph21fWrMYvgcYrg=;
	b=KEm4+GANzJtkbbh3I8uaelolmzxt7DVqkY+cmdDezUw17UGKLHpl0ZTATWDf8um/yD
	Y80pN0/xIwMn5KSd0H0EcBMZleKmVWuiQ4hggbIgeABfAyiWyOevlR4UwGxVEvw9x5Ns
	LlzBfQaD4yos9ulb0K1LuWJnimfLWeCZvcELVONTgL4gVMhvVEdgZHCXjTL+ligf6J65
	wtXXhG8CJ/QHAWty/kyv8W1/guYYSa5g5tBT+hxfNKgdDnobAtc2RFBQAyjN9wEGO26n
	DkEB7iZk240EmoJP0JKjpeKQydjTyK7caQpYBjZbp0v4H/00SDMVNLFP6oqHB+g+KHmP
	6DVQ==
Received: by 10.180.99.232 with SMTP id et8mr15936513wib.11.1342424216991;
	Mon, 16 Jul 2012 00:36:56 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t8sm20256808wiy.3.2012.07.16.00.36.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Jul 2012 00:36:55 -0700 (PDT)
Date: Mon, 16 Jul 2012 09:37:03 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120716073703.GC3729@jama.jama.net>
References: <20120709160033.D30BE10218@opal>
	<20120710104430.GA14050@jama.jama.net>
	<20120710111418.GB14050@jama.jama.net>
	<20120710132443.GC14050@jama.jama.net> <4FFC3256.5000704@intel.com>
	<20120710135107.GD14050@jama.jama.net> <4FFC386A.7000602@intel.com>
MIME-Version: 1.0
In-Reply-To: <4FFC386A.7000602@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
X-List-Received-Date: Mon, 16 Jul 2012 07:48:14 -0000
X-Groupsio-MsgNum: 25370
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VywGB/WGlW4DM4P8"
Content-Disposition: inline

--VywGB/WGlW4DM4P8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 10, 2012 at 05:12:58PM +0300, Laurentiu Palcu wrote:
>=20
>=20
> On 07/10/2012 04:51 PM, Martin Jansa wrote:
> > On Tue, Jul 10, 2012 at 04:47:02PM +0300, Laurentiu Palcu wrote:
> >> Hi Martin,
> >>
> >> When I upgrade a package, I build the package for all architectures.
> >> That's how I find build issues on other architectures which I,
> >> eventually, try to fix. Take, for example, directfb (1.6.1) which didn=
't
> >> compile on mips. Libx11, however, compiled just fine. It turns out the=
re
> >> was something I missed in my process.
> >>
> >> One thing I didn't do is clear sstate-cache before each build... Could
> >> this be the reason I missed it?
> >=20
> > I didn't clean sstate-cache before building this upgrade.
> >=20
> > It was probably using Xresource.h from your host (instead of right
> > version from tree)
> Xresource.h exists on my host, indeed, and is identical to the one
> provided by the package. That's why it compiled just fine on my machine
> (Ubuntu 12.04).

OK it worked on your box, but it's still an issue as long as libx11 install=
ed=20
on host is not dependency for building libx11 with OpenEmbedded. I'll
send patch for this later today.

Cheers,

> > That's why they added -I$(top_srcdir)/include in:
> > http://cgit.freedesktop.org/xorg/lib/libX11/commit/src/util/Makefile.am=
?id=3D24283d40b1e4314c6647dda49d2a159833341a8b
> >=20
> > Cheers,
> >=20
> >>
> >> Thanks,
> >> Laurentiu
> >>
> >> On 07/10/2012 04:24 PM, Martin Jansa wrote:
> >>> On Tue, Jul 10, 2012 at 01:14:18PM +0200, Martin Jansa wrote:
> >>>> On Tue, Jul 10, 2012 at 12:44:30PM +0200, Martin Jansa wrote:
> >>>>> On Mon, Jul 09, 2012 at 04:00:32PM +0000, git@git.openembedded.org =
wrote:
> >>>>>> Module: openembedded-core.git
> >>>>>> Branch: master
> >>>>>> Commit: 52d4ff7b35602faa52360a3e7a800891ef60c739
> >>>>>> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=
=3Dcommit;h=3D52d4ff7b35602faa52360a3e7a800891ef60c739
> >>>>>>
> >>>>>> Author: Laurentiu Palcu <laurentiu.palcu@intel.com>
> >>>>>> Date:   Wed Jul  4 10:28:20 2012 +0300
> >>>>>>
> >>>>>> libx11: upgrade to 1.5.0
> >>>>>>
> >>>>>> Removed one backported patch.
> >>>>>>
> >>>>>> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> >>>>>
> >>>>> This seems to break libx11 and libx11-native build:
> >>>>>
> >>>>> ERROR: Function failed: do_compile (see /var/lib/jenkins/jobs/shr-c=
ore-branches/workspace/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/lib=
x11-1_1.5.0-r0/temp/log.do_compile.20371 for further information)
> >>>>> ERROR: Logfile of failure stored in: /var/lib/jenkins/jobs/shr-core=
-branches/workspace/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/libx11=
-1_1.5.0-r0/temp/log.do_compile.20371
> >>>>> Log data follows:
> >>>>> | DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'comm=
on-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
> >>>>> | DEBUG: Executing shell function do_compile
> >>>>> | mv: cannot stat `makekeys.c.orig': No such file or directory
> >>>>> | makekeys.c:33:27: fatal error: X11/Xresource.h: No such file or d=
irectory
> >>>>> | compilation terminated.
> >>>>> | ERROR: Function failed: do_compile (see /var/lib/jenkins/jobs/shr=
-core-branches/workspace/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/l=
ibx11-1_1.5.0-r0/temp/log.do_compile.20371 for further information)
> >>>>> NOTE: package libx11-1_1.5.0-r0: task do_compile: Failed
> >>>>
> >>>> diff --git a/meta/recipes-graphics/xorg-lib/libx11.inc b/meta/recipe=
s-graphics/xorg-lib/libx11.inc
> >>>> index a1e4386..592f116 100644
> >>>> --- a/meta/recipes-graphics/xorg-lib/libx11.inc
> >>>> +++ b/meta/recipes-graphics/xorg-lib/libx11.inc
> >>>> @@ -35,9 +35,9 @@ do_compile_prepend() {
> >>>>                 sed -i -e 's:MIN_REHASH 15:MIN_REHASH 16:g' makekeys=
=2Ec
> >>>>                 touch makekeys-makekeys.o;
> >>>>                 if [ "${SITEINFO_BITS}" =3D=3D "64" ]; then
> >>>> -                       ${BUILD_CC} ${BUILD_CFLAGS} -I${STAGING_INCD=
IR_NATIVE} makekeys.c -o makekeys
> >>>> +                       ${BUILD_CC} ${BUILD_CFLAGS} -I${STAGING_INCD=
IR_NATIVE} makekeys.c -I${S}/include -o makekeys
> >>>>                 else
> >>>> -                       ${BUILD_CC} ${BUILD_CFLAGS} -I${STAGING_INCD=
IR_NATIVE} -DUSE32 makekeys.c -o makekeys
> >>>> +                       ${BUILD_CC} ${BUILD_CFLAGS} -I${STAGING_INCD=
IR_NATIVE} -DUSE32 makekeys.c -I${S}/include -o makekeys
> >>>>                 fi
> >>>>         )
> >>>>         if [ "$?" !=3D "0" ]; then
> >>>>
> >>>> + PR bump should be enough to fix that, but I'm wondering why you ha=
ven't seen it during tests (if this upgrade was tested at all).
> >>>
> >>> And maybe whole makekeys build can now be done in tree, see:
> >>> https://bugs.freedesktop.org/show_bug.cgi?id=3D22584
> >>> http://cgit.freedesktop.org/xorg/lib/libX11/commit/src/util/Makefile.=
am?id=3Db2487d07f7b355f230a56e32c763acd08862735c
> >>> http://cgit.freedesktop.org/xorg/lib/libX11/commit/src/util/Makefile.=
am?id=3D24283d40b1e4314c6647dda49d2a159833341a8b
> >>>
> >>> Cheers,
> >>>
> >>>>
> >>>> Cheers,
> >>>>
> >>>>>
> >>>>>> ---
> >>>>>>
> >>>>>>  ...quest-as-substitute-for-GetReq-GetReqExtr.patch |  137 -------=
-------------
> >>>>>>  .../keysymdef_include.patch                        |    0
> >>>>>>  .../makekeys_crosscompile.patch                    |    0
> >>>>>>  .../x11_disable_makekeys.patch                     |   13 +-
> >>>>>>  .../xorg-lib/{libx11_1.4.4.bb =3D> libx11_1.5.0.bb}  |    7 +-
> >>>>>>  5 files changed, 11 insertions(+), 146 deletions(-)
> >>>>>>
> >>>>>> diff --git a/meta/recipes-graphics/xorg-lib/libx11-1.4.4/0001-Add-=
_XGetRequest-as-substitute-for-GetReq-GetReqExtr.patch b/meta/recipes-graph=
ics/xorg-lib/libx11-1.4.4/0001-Add-_XGetRequest-as-substitute-for-GetReq-Ge=
tReqExtr.patch
> >>>>>> deleted file mode 100644
> >>>>>> index aedb5c4..0000000
> >>>>>> --- a/meta/recipes-graphics/xorg-lib/libx11-1.4.4/0001-Add-_XGetRe=
quest-as-substitute-for-GetReq-GetReqExtr.patch
> >>>>>> +++ /dev/null
> >>>>>> @@ -1,137 +0,0 @@
> >>>>>> -From 4a060f993bf676cf21ad9784e010f54134da7b40 Mon Sep 17 00:00:00=
 2001
> >>>>>> -From: Peter Hutterer <peter.hutterer@who-t.net>
> >>>>>> -Date: Mon, 17 Oct 2011 09:45:15 +1000
> >>>>>> -Subject: [PATCH] Add _XGetRequest as substitute for GetReq/GetReq=
Extra
> >>>>>> -
> >>>>>> -Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
> >>>>>> -Reviewed-by: Jamey Sharp <jamey@minilop.net>
> >>>>>> ----
> >>>>>> - include/X11/Xlibint.h |   49 ++++++++++++++++-------------------=
--------------
> >>>>>> - src/XlibInt.c         |   31 +++++++++++++++++++++++++++++++
> >>>>>> - 2 files changed, 47 insertions(+), 33 deletions(-)
> >>>>>> -
> >>>>>> -Upstream-Status: Backport
> >>>>>> -
> >>>>>> -diff --git a/include/X11/Xlibint.h b/include/X11/Xlibint.h
> >>>>>> -index 2ce356d..43d1f2a 100644
> >>>>>> ---- a/include/X11/Xlibint.h
> >>>>>> -+++ b/include/X11/Xlibint.h
> >>>>>> -@@ -420,6 +420,18 @@ extern LockInfoPtr _Xglobal_lock;
> >>>>>> - #define WORD64ALIGN
> >>>>>> - #endif /* WORD64 */
> >>>>>> -=20
> >>>>>> -+/**
> >>>>>> -+ * Return a len-sized request buffer for the request type. This =
function may
> >>>>>> -+ * flush the output queue.
> >>>>>> -+ *
> >>>>>> -+ * @param dpy The display connection
> >>>>>> -+ * @param type The request type
> >>>>>> -+ * @param len Length of the request in bytes
> >>>>>> -+ *
> >>>>>> -+ * @returns A pointer to the request buffer with a few default v=
alues
> >>>>>> -+ * initialized.
> >>>>>> -+ */
> >>>>>> -+extern void *_XGetRequest(Display *dpy, CARD8 type, size_t len);
> >>>>>> -=20
> >>>>>> - /*
> >>>>>> -  * GetReq - Get the next available X request packet in the buffe=
r and
> >>>>>> -@@ -432,25 +444,10 @@ extern LockInfoPtr _Xglobal_lock;
> >>>>>> -=20
> >>>>>> - #if !defined(UNIXCPP) || defined(ANSICPP)
> >>>>>> - #define GetReq(name, req) \
> >>>>>> --        WORD64ALIGN\
> >>>>>> --	if ((dpy->bufptr + SIZEOF(x##name##Req)) > dpy->bufmax)\
> >>>>>> --		_XFlush(dpy);\
> >>>>>> --	req =3D (x##name##Req *)(dpy->last_req =3D dpy->bufptr);\
> >>>>>> --	req->reqType =3D X_##name;\
> >>>>>> --	req->length =3D (SIZEOF(x##name##Req))>>2;\
> >>>>>> --	dpy->bufptr +=3D SIZEOF(x##name##Req);\
> >>>>>> --	dpy->request++
> >>>>>> --
> >>>>>> -+	req =3D (x##name##Req *) _XGetRequest(dpy, X_##name, SIZEOF(x##=
name##Req))
> >>>>>> - #else  /* non-ANSI C uses empty comment instead of "##" for toke=
n concatenation */
> >>>>>> - #define GetReq(name, req) \
> >>>>>> --        WORD64ALIGN\
> >>>>>> --	if ((dpy->bufptr + SIZEOF(x/**/name/**/Req)) > dpy->bufmax)\
> >>>>>> --		_XFlush(dpy);\
> >>>>>> --	req =3D (x/**/name/**/Req *)(dpy->last_req =3D dpy->bufptr);\
> >>>>>> --	req->reqType =3D X_/**/name;\
> >>>>>> --	req->length =3D (SIZEOF(x/**/name/**/Req))>>2;\
> >>>>>> --	dpy->bufptr +=3D SIZEOF(x/**/name/**/Req);\
> >>>>>> --	dpy->request++
> >>>>>> -+	req =3D (x/**/name/**/Req *) _XGetRequest(dpy, X_/**/name, SIZE=
OF(x/**/name/**/Req))
> >>>>>> - #endif
> >>>>>> -=20
> >>>>>> - /* GetReqExtra is the same as GetReq, but allocates "n" addition=
al
> >>>>>> -@@ -458,24 +455,10 @@ extern LockInfoPtr _Xglobal_lock;
> >>>>>> -=20
> >>>>>> - #if !defined(UNIXCPP) || defined(ANSICPP)
> >>>>>> - #define GetReqExtra(name, n, req) \
> >>>>>> --        WORD64ALIGN\
> >>>>>> --	if ((dpy->bufptr + SIZEOF(x##name##Req) + n) > dpy->bufmax)\
> >>>>>> --		_XFlush(dpy);\
> >>>>>> --	req =3D (x##name##Req *)(dpy->last_req =3D dpy->bufptr);\
> >>>>>> --	req->reqType =3D X_##name;\
> >>>>>> --	req->length =3D (SIZEOF(x##name##Req) + n)>>2;\
> >>>>>> --	dpy->bufptr +=3D SIZEOF(x##name##Req) + n;\
> >>>>>> --	dpy->request++
> >>>>>> -+	req =3D (x##name##Req *) _XGetRequest(dpy, X_##name, SIZEOF(x##=
name##Req) + n)
> >>>>>> - #else
> >>>>>> - #define GetReqExtra(name, n, req) \
> >>>>>> --        WORD64ALIGN\
> >>>>>> --	if ((dpy->bufptr + SIZEOF(x/**/name/**/Req) + n) > dpy->bufmax)\
> >>>>>> --		_XFlush(dpy);\
> >>>>>> --	req =3D (x/**/name/**/Req *)(dpy->last_req =3D dpy->bufptr);\
> >>>>>> --	req->reqType =3D X_/**/name;\
> >>>>>> --	req->length =3D (SIZEOF(x/**/name/**/Req) + n)>>2;\
> >>>>>> --	dpy->bufptr +=3D SIZEOF(x/**/name/**/Req) + n;\
> >>>>>> --	dpy->request++
> >>>>>> -+	req =3D (x/**/name/**/Req *) _XGetRequest(dpy, X_/**/name, SIZE=
OF(x/**/name/**/Req) + n)
> >>>>>> - #endif
> >>>>>> -=20
> >>>>>> -=20
> >>>>>> -diff --git a/src/XlibInt.c b/src/XlibInt.c
> >>>>>> -index 3db151e..a8f5d08 100644
> >>>>>> ---- a/src/XlibInt.c
> >>>>>> -+++ b/src/XlibInt.c
> >>>>>> -@@ -1956,6 +1956,37 @@ Screen *_XScreenOfWindow(Display *dpy, Win=
dow w)
> >>>>>> - }
> >>>>>> -=20
> >>>>>> -=20
> >>>>>> -+/*
> >>>>>> -+ * WARNING: This implementation's pre-conditions and post-condit=
ions
> >>>>>> -+ * must remain compatible with the old macro-based implementatio=
ns of
> >>>>>> -+ * GetReq, GetReqExtra, GetResReq, and GetEmptyReq. The portions=
 of the
> >>>>>> -+ * Display structure affected by those macros are part of libX11=
's
> >>>>>> -+ * ABI.
> >>>>>> -+ */
> >>>>>> -+void *_XGetRequest(Display *dpy, CARD8 type, size_t len)
> >>>>>> -+{
> >>>>>> -+    xReq *req;
> >>>>>> -+
> >>>>>> -+    WORD64ALIGN
> >>>>>> -+
> >>>>>> -+    if (dpy->bufptr + len > dpy->bufmax)
> >>>>>> -+	_XFlush(dpy);
> >>>>>> -+
> >>>>>> -+    if (len % 4)
> >>>>>> -+	fprintf(stderr,
> >>>>>> -+		"Xlib: request %d length %zd not a multiple of 4.\n",
> >>>>>> -+		type, len);
> >>>>>> -+
> >>>>>> -+    dpy->last_req =3D dpy->bufptr;
> >>>>>> -+
> >>>>>> -+    req =3D (xReq*)dpy->bufptr;
> >>>>>> -+    req->reqType =3D type;
> >>>>>> -+    req->length =3D len / 4;
> >>>>>> -+    dpy->bufptr +=3D len;
> >>>>>> -+    dpy->request++;
> >>>>>> -+    return req;
> >>>>>> -+}
> >>>>>> -+
> >>>>>> - #if defined(WIN32)
> >>>>>> -=20
> >>>>>> - /*
> >>>>>> ---=20
> >>>>>> -1.7.8.3
> >>>>>> -
> >>>>>> diff --git a/meta/recipes-graphics/xorg-lib/libx11-1.4.4/keysymdef=
_include.patch b/meta/recipes-graphics/xorg-lib/libx11-1.5.0/keysymdef_incl=
ude.patch
> >>>>>> similarity index 100%
> >>>>>> rename from meta/recipes-graphics/xorg-lib/libx11-1.4.4/keysymdef_=
include.patch
> >>>>>> rename to meta/recipes-graphics/xorg-lib/libx11-1.5.0/keysymdef_in=
clude.patch
> >>>>>> diff --git a/meta/recipes-graphics/xorg-lib/libx11-1.4.4/makekeys_=
crosscompile.patch b/meta/recipes-graphics/xorg-lib/libx11-1.5.0/makekeys_c=
rosscompile.patch
> >>>>>> similarity index 100%
> >>>>>> rename from meta/recipes-graphics/xorg-lib/libx11-1.4.4/makekeys_c=
rosscompile.patch
> >>>>>> rename to meta/recipes-graphics/xorg-lib/libx11-1.5.0/makekeys_cro=
sscompile.patch
> >>>>>> diff --git a/meta/recipes-graphics/xorg-lib/libx11-1.4.4/x11_disab=
le_makekeys.patch b/meta/recipes-graphics/xorg-lib/libx11-1.5.0/x11_disable=
_makekeys.patch
> >>>>>> similarity index 74%
> >>>>>> rename from meta/recipes-graphics/xorg-lib/libx11-1.4.4/x11_disabl=
e_makekeys.patch
> >>>>>> rename to meta/recipes-graphics/xorg-lib/libx11-1.5.0/x11_disable_=
makekeys.patch
> >>>>>> index e3782a5..69f9e6c 100644
> >>>>>> --- a/meta/recipes-graphics/xorg-lib/libx11-1.4.4/x11_disable_make=
keys.patch
> >>>>>> +++ b/meta/recipes-graphics/xorg-lib/libx11-1.5.0/x11_disable_make=
keys.patch
> >>>>>> @@ -1,10 +1,10 @@
> >>>>>>  Upstream-Status: Pending
> >>>>>> =20
> >>>>>> -Index: libX11-1.3.4/src/util/Makefile.am
> >>>>>> +Index: libX11-1.5.0/src/util/Makefile.am
> >>>>>>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>>>> ---- libX11-1.3.4.orig/src/util/Makefile.am
> >>>>>> -+++ libX11-1.3.4/src/util/Makefile.am
> >>>>>> -@@ -1,24 +1 @@
> >>>>>> +--- libX11-1.5.0.orig/src/util/Makefile.am
> >>>>>> ++++ libX11-1.5.0/src/util/Makefile.am
> >>>>>> +@@ -1,27 +1,2 @@
> >>>>>>  -
> >>>>>>  -noinst_PROGRAMS=3Dmakekeys
> >>>>>>  -
> >>>>>> @@ -12,13 +12,16 @@ Index: libX11-1.3.4/src/util/Makefile.am
> >>>>>>  -	$(X11_CFLAGS) \
> >>>>>>  -	$(CWARNFLAGS)
> >>>>>>  -
> >>>>>> +-makekeys_CPPFLAGS =3D \
> >>>>>> +-	-I$(top_srcdir)/include
> >>>>>> +-
> >>>>>>  -CC =3D @CC_FOR_BUILD@
> >>>>>>  -CPPFLAGS =3D @CPPFLAGS_FOR_BUILD@
> >>>>>>  -CFLAGS =3D @CFLAGS_FOR_BUILD@
> >>>>>>  -LDFLAGS =3D @LDFLAGS_FOR_BUILD@
> >>>>>>  -
> >>>>>>   EXTRA_DIST =3D mkks.sh
> >>>>>> --
> >>>>>> +=20
> >>>>>>  -if LINT
> >>>>>>  -# Check source code with tools like lint & sparse
> >>>>>>  -
> >>>>>> diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb b/meta=
/recipes-graphics/xorg-lib/libx11_1.5.0.bb
> >>>>>> similarity index 67%
> >>>>>> rename from meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb
> >>>>>> rename to meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
> >>>>>> index 1ad8046..04805d7 100644
> >>>>>> --- a/meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb
> >>>>>> +++ b/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
> >>>>>> @@ -1,7 +1,7 @@
> >>>>>>  require libx11.inc
> >>>>>>  inherit gettext
> >>>>>> =20
> >>>>>> -PR =3D "r3"
> >>>>>> +PR =3D "r0"
> >>>>>> =20
> >>>>>>  BBCLASSEXTEND =3D "native nativesdk"
> >>>>>> =20
> >>>>>> @@ -14,9 +14,8 @@ DEPENDS +=3D "util-macros xtrans libxdmcp libxau=
 \
> >>>>>> =20
> >>>>>>  SRC_URI +=3D " file://keysymdef_include.patch \
> >>>>>>               file://x11_disable_makekeys.patch \
> >>>>>> -             file://0001-Add-_XGetRequest-as-substitute-for-GetRe=
q-GetReqExtr.patch \
> >>>>>>               file://makekeys_crosscompile.patch \
> >>>>>>               "
> >>>>>> =20
> >>>>>> -SRC_URI[md5sum] =3D "ed7c382cbf8c13425b6a66bcac0ca5d9"
> >>>>>> -SRC_URI[sha256sum] =3D "7fe62180f08ef5f0a0062fb444591e349cae2ab5a=
f6ad834599f5c654e6c840d"
> >>>>>> +SRC_URI[md5sum] =3D "78b4b3bab4acbdf0abcfca30a8c70cc6"
> >>>>>> +SRC_URI[sha256sum] =3D "c382efd7e92bfc3cef39a4b7f1ecf2744ba4414a7=
05e3bc1e697f75502bd4d86"
> >>>>>>
> >>>>>>
> >>>>>> _______________________________________________
> >>>>>> Openembedded-commits mailing list
> >>>>>> Openembedded-commits@lists.openembedded.org
> >>>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-c=
ommits
> >>>>>
> >>>>> --=20
> >>>>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >>>>
> >>>>
> >>>>
> >>>> --=20
> >>>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >>>
> >>>
> >>>
> >>>
> >>>
> >>> _______________________________________________
> >>> Openembedded-core mailing list
> >>> Openembedded-core@lists.openembedded.org
> >>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >>>
> >>
> >>
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >=20
> >=20
> >=20
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VywGB/WGlW4DM4P8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlADxJ8ACgkQN1Ujt2V2gBzb8QCgs130znFJwR2gmaT4O8bh+s8l
7jgAnRSiUK+qiH1OsoFPTfOW9xR2Q2Ji
=V8pz
-----END PGP SIGNATURE-----

--VywGB/WGlW4DM4P8--
