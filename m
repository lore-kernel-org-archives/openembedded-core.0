Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id 336B378419
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 11:05:58 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id p124so9311914ite.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 03:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XFCYnvgDRnRTtpP8p5wbmZ+jxjcNEWsvJDINga5OsWc=;
	b=DEbZv/8IvQWNXq4b23lCbcFF0viN64eZJAn+oPluIAe3UKyTxGqeBh1rySgGWQk+YL
	PT9B78SIT49hmMcO/zGjxOTe3IG+aY3dbJ5apaotB386WmUnUA6M93NKH+L2LTTnMjfe
	74Kug0gOY3rKdWzmgnMmHcU7t9HoDdPnxZo1X40it6mWuPfDqO7QqGnBho22BGwt3w7C
	eywHtfs5bQ/IvEv682AE61Vi51T0VF2VIeaxFvwdxZhAlrQ0Oej5iVL+4UJWWvJdRZkE
	EyLwTx2OYp41wjPRBCFJ7etP2UpAgpfGwYjq7gpvsI0Czg7mJOLO9jfLSVSubwb9DTWZ
	6BUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XFCYnvgDRnRTtpP8p5wbmZ+jxjcNEWsvJDINga5OsWc=;
	b=OLyWpbhP8jCUNiYxmelAgMu+3p/b0/f6tN14wHmsKIDEu2rw/nY/TkQUeDrbXh5g7d
	fVO8znsD3tq/JExLgI3+xjQyfTTZvx1YRc8iHxjN2HDjHUy4d7DJK09SDoFlMn2VQCJS
	EK8Y3SxaBgnmEHcouy4lCYkXoD/jWViEZ8DkcaFKM/VZzGQFAtSQ3NUZHIGob3UoFe18
	3HQ7k0Nf+lkMIjA2RsFWZs/eoL6OUHIaCcdDuUPqfsfnF1hj8YZKxcPwGeBYoEdI9pMg
	d4N3YABU0pV1QivSUPwmyFfN6PiJY20mYLt5A48s1OwSg9uejlx0KWNQRYsd1ORyjalW
	jHBw==
X-Gm-Message-State: AKwxytcMCK+16mEha/p7sblOy7pYbkOqDY5dvwD1NGHkXaHBP15l0lC6
	ks8HrUDP5X9pwlEctP5jQ1FbVfD2e0Xk2p97As2TAw==
X-Google-Smtp-Source: AH8x224Suuj7Wk91vCnHvW+UmvmmJrl81wSJLjTf7G1/rMFxOCobGgotqPrunaZE+CBb12to7QKXOhM0jHlkBSYFFfs=
X-Received: by 10.36.145.143 with SMTP id i137mr7845812ite.6.1516619160402;
	Mon, 22 Jan 2018 03:06:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Mon, 22 Jan 2018 03:05:39 -0800 (PST)
In-Reply-To: <CAP9ODKp_nHD+N_28qROJfsmWZh5AJes0iQQ0NBa0V8ABf0uaPQ@mail.gmail.com>
References: <20180121061857.29976-1-Randy.MacLeod@windriver.com>
	<CAP9ODKp_nHD+N_28qROJfsmWZh5AJes0iQQ0NBa0V8ABf0uaPQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 22 Jan 2018 11:05:39 +0000
Message-ID: <CAJTo0LaM=DYAqBzNJ0unSNqSYjc3r513z5sQF2dCEhBM1CbK0g@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: link mesautil with pthreads
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
X-List-Received-Date: Mon, 22 Jan 2018 11:05:59 -0000
Content-Type: multipart/alternative; boundary="94eb2c0ef16e50d4b905635b6aff"

--94eb2c0ef16e50d4b905635b6aff
Content-Type: text/plain; charset="UTF-8"

Yes 17.3.3 is in master now, so can you rebase Randy?

Ross

On 21 January 2018 at 21:34, Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> On Sun, Jan 21, 2018 at 4:18 AM, Randy MacLeod
> <Randy.MacLeod@windriver.com> wrote:
> > Cherry-pick fix from mesa upstream:
> >    23ce168048 link mesautil with pthreads
> >
> > Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
>
> Missing Upstream-Status. Also, base it on 17.3.3 recipe so we avoid
> another patch revision.
>
> > ---
> >  .../files/0001-link-mesautil-with-pthreads.patch   | 51
> ++++++++++++++++++++++
> >  meta/recipes-graphics/mesa/mesa_17.3.2.bb          |  1 +
> >  2 files changed, 52 insertions(+)
> >  create mode 100644 meta/recipes-graphics/mesa/
> files/0001-link-mesautil-with-pthreads.patch
> >
> > diff --git a/meta/recipes-graphics/mesa/files/0001-link-mesautil-with-pthreads.patch
> b/meta/recipes-graphics/mesa/files/0001-link-mesautil-with-pthreads.patch
> > new file mode 100644
> > index 0000000000..193c54661b
> > --- /dev/null
> > +++ b/meta/recipes-graphics/mesa/files/0001-link-mesautil-with-
> pthreads.patch
> > @@ -0,0 +1,51 @@
> > +From 23ce168048698eeea3df6bb8c9de5be3ca4784cd Mon Sep 17 00:00:00 2001
> > +From: Igor Gnatenko <ignatenko@redhat.com>
> > +Date: Mon, 1 Jan 2018 22:49:00 +0100
> > +Subject: [PATCH] link mesautil with pthreads
> > +
> > +../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In
> function `u_thread_setname':
> > +/builddir/build/BUILD/mesa-17.3.1/src/util/../../src/util/u_thread.h:66:
> undefined reference to `pthread_setname_np'
> > +../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In
> function `thrd_join':
> > +/builddir/build/BUILD/mesa-17.3.1/src/util/../../include/c11/threads_posix.h:336:
> undefined reference to `pthread_join'
> > +../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In
> function `u_thread_create':
> > +/builddir/build/BUILD/mesa-17.3.1/src/util/../../src/util/u_thread.h:48:
> undefined reference to `pthread_sigmask'
> > +../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In
> function `thrd_create':
> > +/builddir/build/BUILD/mesa-17.3.1/src/util/../../include/c11/threads_posix.h:296:
> undefined reference to `pthread_create'
> > +../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In
> function `u_thread_create':
> > +/builddir/build/BUILD/mesa-17.3.1/src/util/../../src/util/u_thread.h:50:
> undefined reference to `pthread_sigmask'
> > +/builddir/build/BUILD/mesa-17.3.1/src/util/../../src/util/u_thread.h:50:
> undefined reference to `pthread_sigmask'
> > +../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In
> function `call_once':
> > +/builddir/build/BUILD/mesa-17.3.1/src/util/../../include/c11/threads_posix.h:96:
> undefined reference to `pthread_once'
> > +../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In
> function `u_thread_get_time_nano':
> > +/builddir/build/BUILD/mesa-17.3.1/src/util/../../src/util/u_thread.h:84:
> undefined reference to `pthread_getcpuclockid'
> > +collect2: error: ld returned 1 exit status
> > +
> > +Reviewed-by: Adam Jackson <ajax@redhat.com>
> > +Signed-off-by: Igor Gnatenko <ignatenko@redhat.com>
> > +---
> > + src/util/Makefile.am | 2 ++
> > + 1 file changed, 2 insertions(+)
> > +
> > +diff --git a/src/util/Makefile.am b/src/util/Makefile.am
> > +index a5241ad27b..633907b9fd 100644
> > +--- a/src/util/Makefile.am
> > ++++ b/src/util/Makefile.am
> > +@@ -31,6 +31,7 @@ noinst_LTLIBRARIES = \
> > +       libxmlconfig.la
> > +
> > + AM_CPPFLAGS = \
> > ++      $(PTHREAD_CFLAGS) \
> > +       -I$(top_srcdir)/include
> > +
> > + libmesautil_la_CPPFLAGS = \
> > +@@ -50,6 +51,7 @@ libmesautil_la_SOURCES = \
> > +       $(MESA_UTIL_GENERATED_FILES)
> > +
> > + libmesautil_la_LIBADD = \
> > ++      $(PTHREAD_LIBS) \
> > +       $(CLOCK_LIB) \
> > +       $(ZLIB_LIBS) \
> > +       $(LIBATOMIC_LIBS)
> > +--
> > +2.14.3
> > +
> > diff --git a/meta/recipes-graphics/mesa/mesa_17.3.2.bb
> b/meta/recipes-graphics/mesa/mesa_17.3.2.bb
> > index 9e9b23322a..8cdcf6c84f 100644
> > --- a/meta/recipes-graphics/mesa/mesa_17.3.2.bb
> > +++ b/meta/recipes-graphics/mesa/mesa_17.3.2.bb
> > @@ -9,6 +9,7 @@ SRC_URI = "https://mesa.freedesktop.org/
> archive/mesa-${PV}.tar.xz \
> >             file://llvm-config-version.patch \
> >             file://0001-winsys-svga-drm-Include-sys-types.h.patch \
> >             file://0001-Makefile.vulkan.am-explictly-add-lib-expat-to-intel-.patch
> \
> > +           file://0001-link-mesautil-with-pthreads.patch \
> >             "
> >
> >  SRC_URI[md5sum] = "5c59b779925f504ffd0f13c7dcd29ac6"
> > --
> > 2.11.0
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c0ef16e50d4b905635b6aff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes 17.3.3 is in master now, so can you rebase Randy?<div>=
<br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D=
"gmail_quote">On 21 January 2018 at 21:34, Otavio Salvador <span dir=3D"ltr=
">&lt;<a href=3D"mailto:otavio.salvador@ossystems.com.br" target=3D"_blank"=
>otavio.salvador@ossystems.com.br</a>&gt;</span> wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex"><span class=3D"">On Sun, Jan 21, 2018 at 4:18 AM, Randy MacL=
eod<br>
&lt;<a href=3D"mailto:Randy.MacLeod@windriver.com">Randy.MacLeod@windriver.=
com</a>&gt; wrote:<br>
&gt; Cherry-pick fix from mesa upstream:<br>
&gt;=C2=A0 =C2=A0 23ce168048 link mesautil with pthreads<br>
&gt;<br>
&gt; Signed-off-by: Randy MacLeod &lt;<a href=3D"mailto:Randy.MacLeod@windr=
iver.com">Randy.MacLeod@windriver.com</a>&gt;<br>
<br>
</span>Missing Upstream-Status. Also, base it on 17.3.3 recipe so we avoid<=
br>
another patch revision.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; ---<br>
&gt;=C2=A0 .../files/0001-link-mesautil-<wbr>with-pthreads.patch=C2=A0 =C2=
=A0| 51 ++++++++++++++++++++++<br>
&gt;=C2=A0 meta/recipes-graphics/mesa/<a href=3D"http://mesa_17.3.2.bb" rel=
=3D"noreferrer" target=3D"_blank">mes<wbr>a_17.3.2.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 2 files changed, 52 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-graphics/mesa/<wbr>files/0001-li=
nk-mesautil-with-<wbr>pthreads.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-graphics/mesa/<wbr>files/0001-link-mesautil-=
with-<wbr>pthreads.patch b/meta/recipes-graphics/mesa/<wbr>files/0001-link-=
mesautil-with-<wbr>pthreads.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..193c54661b<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-graphics/mesa/<wbr>files/0001-link-mesautil-with-<w=
br>pthreads.patch<br>
&gt; @@ -0,0 +1,51 @@<br>
&gt; +From 23ce168048698eeea3df6bb8c9de5b<wbr>e3ca4784cd Mon Sep 17 00:00:0=
0 2001<br>
&gt; +From: Igor Gnatenko &lt;<a href=3D"mailto:ignatenko@redhat.com">ignat=
enko@redhat.com</a>&gt;<br>
&gt; +Date: Mon, 1 Jan 2018 22:49:00 +0100<br>
&gt; +Subject: [PATCH] link mesautil with pthreads<br>
&gt; +<br>
&gt; +../../src/util/.libs/<wbr>libmesautil.a(libmesautil_la-<wbr>u_queue.o=
): In function `u_thread_setname&#39;:<br>
&gt; +/builddir/build/BUILD/mesa-<wbr>17.3.1/src/util/../../src/<wbr>util/u=
_thread.h:66: undefined reference to `pthread_setname_np&#39;<br>
&gt; +../../src/util/.libs/<wbr>libmesautil.a(libmesautil_la-<wbr>u_queue.o=
): In function `thrd_join&#39;:<br>
&gt; +/builddir/build/BUILD/mesa-<wbr>17.3.1/src/util/../../include/<wbr>c1=
1/threads_posix.h:336: undefined reference to `pthread_join&#39;<br>
&gt; +../../src/util/.libs/<wbr>libmesautil.a(libmesautil_la-<wbr>u_queue.o=
): In function `u_thread_create&#39;:<br>
&gt; +/builddir/build/BUILD/mesa-<wbr>17.3.1/src/util/../../src/<wbr>util/u=
_thread.h:48: undefined reference to `pthread_sigmask&#39;<br>
&gt; +../../src/util/.libs/<wbr>libmesautil.a(libmesautil_la-<wbr>u_queue.o=
): In function `thrd_create&#39;:<br>
&gt; +/builddir/build/BUILD/mesa-<wbr>17.3.1/src/util/../../include/<wbr>c1=
1/threads_posix.h:296: undefined reference to `pthread_create&#39;<br>
&gt; +../../src/util/.libs/<wbr>libmesautil.a(libmesautil_la-<wbr>u_queue.o=
): In function `u_thread_create&#39;:<br>
&gt; +/builddir/build/BUILD/mesa-<wbr>17.3.1/src/util/../../src/<wbr>util/u=
_thread.h:50: undefined reference to `pthread_sigmask&#39;<br>
&gt; +/builddir/build/BUILD/mesa-<wbr>17.3.1/src/util/../../src/<wbr>util/u=
_thread.h:50: undefined reference to `pthread_sigmask&#39;<br>
&gt; +../../src/util/.libs/<wbr>libmesautil.a(libmesautil_la-<wbr>u_queue.o=
): In function `call_once&#39;:<br>
&gt; +/builddir/build/BUILD/mesa-<wbr>17.3.1/src/util/../../include/<wbr>c1=
1/threads_posix.h:96: undefined reference to `pthread_once&#39;<br>
&gt; +../../src/util/.libs/<wbr>libmesautil.a(libmesautil_la-<wbr>u_queue.o=
): In function `u_thread_get_time_nano&#39;:<br>
&gt; +/builddir/build/BUILD/mesa-<wbr>17.3.1/src/util/../../src/<wbr>util/u=
_thread.h:84: undefined reference to `pthread_getcpuclockid&#39;<br>
&gt; +collect2: error: ld returned 1 exit status<br>
&gt; +<br>
&gt; +Reviewed-by: Adam Jackson &lt;<a href=3D"mailto:ajax@redhat.com">ajax=
@redhat.com</a>&gt;<br>
&gt; +Signed-off-by: Igor Gnatenko &lt;<a href=3D"mailto:ignatenko@redhat.c=
om">ignatenko@redhat.com</a>&gt;<br>
&gt; +---<br>
&gt; + src/util/Makefile.am | 2 ++<br>
&gt; + 1 file changed, 2 insertions(+)<br>
&gt; +<br>
&gt; +diff --git a/src/util/Makefile.am b/src/util/Makefile.am<br>
&gt; +index a5241ad27b..633907b9fd 100644<br>
&gt; +--- a/src/util/Makefile.am<br>
&gt; ++++ b/src/util/Makefile.am<br>
&gt; +@@ -31,6 +31,7 @@ noinst_LTLIBRARIES =3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://libxmlconfig.la" rel=3D"=
noreferrer" target=3D"_blank">libxmlconfig.la</a><br>
&gt; +<br>
&gt; + AM_CPPFLAGS =3D \<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 $(PTHREAD_CFLAGS) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-I$(top_srcdir)/include<br>
&gt; +<br>
&gt; + libmesautil_la_CPPFLAGS =3D \<br>
&gt; +@@ -50,6 +51,7 @@ libmesautil_la_SOURCES =3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$(MESA_UTIL_GENERATED_FILES)<br>
&gt; +<br>
&gt; + libmesautil_la_LIBADD =3D \<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 $(PTHREAD_LIBS) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$(CLOCK_LIB) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$(ZLIB_LIBS) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$(LIBATOMIC_LIBS)<br>
&gt; +--<br>
&gt; +2.14.3<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-graphics/mesa/<a href=3D"http://mesa_17.3.2.=
bb" rel=3D"noreferrer" target=3D"_blank">m<wbr>esa_17.3.2.bb</a> b/meta/rec=
ipes-graphics/mesa/<a href=3D"http://mesa_17.3.2.bb" rel=3D"noreferrer" tar=
get=3D"_blank">m<wbr>esa_17.3.2.bb</a><br>
&gt; index 9e9b23322a..8cdcf6c84f 100644<br>
&gt; --- a/meta/recipes-graphics/mesa/<a href=3D"http://mesa_17.3.2.bb" rel=
=3D"noreferrer" target=3D"_blank">m<wbr>esa_17.3.2.bb</a><br>
&gt; +++ b/meta/recipes-graphics/mesa/<a href=3D"http://mesa_17.3.2.bb" rel=
=3D"noreferrer" target=3D"_blank">m<wbr>esa_17.3.2.bb</a><br>
&gt; @@ -9,6 +9,7 @@ SRC_URI =3D &quot;<a href=3D"https://mesa.freedesktop.=
org/archive/mesa-${PV}.tar.xz" rel=3D"noreferrer" target=3D"_blank">https:/=
/mesa.freedesktop.org/<wbr>archive/mesa-${PV}.tar.xz</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://llvm-config-vers=
ion.<wbr>patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-winsys-svga=
-drm-<wbr>Include-sys-types.h.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Makefile.vu=
lkan.<wbr>am-explictly-add-lib-expat-to-<wbr>intel-.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-link-mesautil-<w=
br>with-pthreads.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI[md5sum] =3D &quot;<wbr>5c59b779925f504ffd0f13c7dcd29a<wb=
r>c6&quot;<br>
&gt; --<br>
&gt; 2.11.0<br>
&gt;<br>
&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.<wbr>openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<=
wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
<br>
<br>
<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">--<br>
Otavio Salvador=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0O.S. Systems<br>
<a href=3D"http://www.ossystems.com.br" rel=3D"noreferrer" target=3D"_blank=
">http://www.ossystems.com.br</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"htt=
p://code.ossystems.com.br" rel=3D"noreferrer" target=3D"_blank">http://code=
.ossystems.com.br</a><br>
Mobile: <a href=3D"tel:%2B55%20%2853%29%209981-7854" value=3D"+555399817854=
">+55 (53) 9981-7854</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Mobile: <=
a href=3D"tel:%2B1%20%28347%29%20903-9750" value=3D"+13479039750">+1 (347) =
903-9750</a><br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5">--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--94eb2c0ef16e50d4b905635b6aff--
