Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9E9CA6FF80
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 17:16:22 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id b5so10692510itc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 09:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ie2oGwj1DTom+bVriEKWRY0dqdxqOCyqPaSNmV4b+04=;
	b=hXeHC17lezUKZvE7F2bifmcnhRaPhAERbNRk3D6ldWy9GOKYefFo25ct+AfDANcWCM
	79dGkPU6FjRLpkqFfpRIgDaNSrAi+b4Hv4lr0e9rgIMt4Kj3Evmh4mapMJmqNjkCNZJW
	tsN6oFDwlPEFSkxUa0DHB8JeU9YlXtM/ypvWOrE/90i4DYaPcat0PRKkcz6ZAN0NZMMc
	NMqF5Yhov1etugRE5ij/SPttDSUL//7uVOTYZop/NYt9WE+Xerw+8Sbil41RPBZhWW9w
	vnenKyhCsNGKo6jSziVmFm5dfbbmdyDgCZ58zD9tDEkSoAWCAxYv8gxznu+LQoWqOOsu
	uvNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ie2oGwj1DTom+bVriEKWRY0dqdxqOCyqPaSNmV4b+04=;
	b=HFOZT6ao4fSjNoHbTp3xkjDY8N/aE1MJ1VGIsGhGwz67d5Pw/179mroZFivtCUNsCA
	CgCCqspIXyZxL/Ux2Eg8Vvzf9QVb/bJzQMnB2WKkqONefWTsoY09Lr14M44XSfWAdJiM
	VKNyGeR/UaaDg5+0Y6KHr3RMrHUKC1dWjdGt834fJxi7UhYUSaXYMDzy85L4fuSIPreR
	0XuGiHSyAX53Wtd9N8jGJWW/LtTQQ39JPBkBvZsnOSG0dlBhBaZ99Emo+U2Q/xy8CI4a
	6dxhzZFsFX+cajw9/bvhDMSgpAwL1qaErJuswWJkAtDGwBbR/V+xgUoEpJoCCcJl+sxJ
	MKzA==
X-Gm-Message-State: AKwxyteg8APah32/eDbFHkJYr7eAHVNnZvsgeC0SML9d6KQmtYVieKej
	aXlZ9PMP4/pj/uLFH3k7cTh1XR7E/DpqQ5aQHYCh8w==
X-Google-Smtp-Source: AH8x225fXGh6xwALdYmOcuRuKAzLoAC073ibKZuYSgjdXawnyx2cc4pahj0fndxA+LjwIagUbToWSp0sPAFsnWyTK9o=
X-Received: by 10.36.228.79 with SMTP id o76mr8843874ith.85.1516641383523;
	Mon, 22 Jan 2018 09:16:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Mon, 22 Jan 2018 09:16:03 -0800 (PST)
In-Reply-To: <20180122165656.53234-1-Randy.MacLeod@windriver.com>
References: <20180122165656.53234-1-Randy.MacLeod@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 22 Jan 2018 17:16:03 +0000
Message-ID: <CAJTo0LbS=RKZjUMjByxmv88Us-3n_21GSKuSzY5CjhwSkrop3w@mail.gmail.com>
To: Randy MacLeod <Randy.MacLeod@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 22 Jan 2018 17:16:22 -0000
Content-Type: multipart/alternative; boundary="94eb2c1246daeac12d05636096f5"

--94eb2c1246daeac12d05636096f5
Content-Type: text/plain; charset="UTF-8"

Upstream-Status tag needs to be in the patch you add, not the commit
message.

Ross

On 22 January 2018 at 16:56, Randy MacLeod <Randy.MacLeod@windriver.com>
wrote:

> Cherry-pick fix from mesa upstream:
>    23ce168048 link mesautil with pthreads
>
> link mesautil with pthreads to avoid:
>
> ../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In function
> `u_thread_setname':
> /builddir/build/BUILD/mesa-17.3.1/src/util/../../src/util/u_thread.h:66:
> undefined reference to `pthread_setname_np'
> ../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In function
> `thrd_join':
> /builddir/build/BUILD/mesa-17.3.1/src/util/../../include/c11/threads_posix.h:336:
> undefined reference to `pthread_join'
> ../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In function
> `u_thread_create':
> /builddir/build/BUILD/mesa-17.3.1/src/util/../../src/util/u_thread.h:48:
> undefined reference to `pthread_sigmask'
> ../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In function
> `thrd_create':
> /builddir/build/BUILD/mesa-17.3.1/src/util/../../include/c11/threads_posix.h:296:
> undefined reference to `pthread_create'
> ../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In function
> `u_thread_create':
> /builddir/build/BUILD/mesa-17.3.1/src/util/../../src/util/u_thread.h:50:
> undefined reference to `pthread_sigmask'
> /builddir/build/BUILD/mesa-17.3.1/src/util/../../src/util/u_thread.h:50:
> undefined reference to `pthread_sigmask'
> ../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In function
> `call_once':
> /builddir/build/BUILD/mesa-17.3.1/src/util/../../include/c11/threads_posix.h:96:
> undefined reference to `pthread_once'
> ../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In function
> `u_thread_get_time_nano':
> /builddir/build/BUILD/mesa-17.3.1/src/util/../../src/util/u_thread.h:84:
> undefined reference to `pthread_getcpuclockid'
> collect2: error: ld returned 1 exit status
>
> Upstream-Status: backport
>
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>  .../files/0001-link-mesautil-with-pthreads.patch   | 51
> ++++++++++++++++++++++
>  meta/recipes-graphics/mesa/mesa_17.3.3.bb          |  1 +
>  2 files changed, 52 insertions(+)
>  create mode 100644 meta/recipes-graphics/mesa/
> files/0001-link-mesautil-with-pthreads.patch
>
> diff --git a/meta/recipes-graphics/mesa/files/0001-link-mesautil-with-pthreads.patch
> b/meta/recipes-graphics/mesa/files/0001-link-mesautil-with-pthreads.patch
> new file mode 100644
> index 0000000000..193c54661b
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/files/0001-link-mesautil-with-
> pthreads.patch
> @@ -0,0 +1,51 @@
> +From 23ce168048698eeea3df6bb8c9de5be3ca4784cd Mon Sep 17 00:00:00 2001
> +From: Igor Gnatenko <ignatenko@redhat.com>
> +Date: Mon, 1 Jan 2018 22:49:00 +0100
> +Subject: [PATCH] link mesautil with pthreads
> +
> +../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In
> function `u_thread_setname':
> +/builddir/build/BUILD/mesa-17.3.1/src/util/../../src/util/u_thread.h:66:
> undefined reference to `pthread_setname_np'
> +../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In
> function `thrd_join':
> +/builddir/build/BUILD/mesa-17.3.1/src/util/../../include/c11/threads_posix.h:336:
> undefined reference to `pthread_join'
> +../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In
> function `u_thread_create':
> +/builddir/build/BUILD/mesa-17.3.1/src/util/../../src/util/u_thread.h:48:
> undefined reference to `pthread_sigmask'
> +../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In
> function `thrd_create':
> +/builddir/build/BUILD/mesa-17.3.1/src/util/../../include/c11/threads_posix.h:296:
> undefined reference to `pthread_create'
> +../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In
> function `u_thread_create':
> +/builddir/build/BUILD/mesa-17.3.1/src/util/../../src/util/u_thread.h:50:
> undefined reference to `pthread_sigmask'
> +/builddir/build/BUILD/mesa-17.3.1/src/util/../../src/util/u_thread.h:50:
> undefined reference to `pthread_sigmask'
> +../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In
> function `call_once':
> +/builddir/build/BUILD/mesa-17.3.1/src/util/../../include/c11/threads_posix.h:96:
> undefined reference to `pthread_once'
> +../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In
> function `u_thread_get_time_nano':
> +/builddir/build/BUILD/mesa-17.3.1/src/util/../../src/util/u_thread.h:84:
> undefined reference to `pthread_getcpuclockid'
> +collect2: error: ld returned 1 exit status
> +
> +Reviewed-by: Adam Jackson <ajax@redhat.com>
> +Signed-off-by: Igor Gnatenko <ignatenko@redhat.com>
> +---
> + src/util/Makefile.am | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/src/util/Makefile.am b/src/util/Makefile.am
> +index a5241ad27b..633907b9fd 100644
> +--- a/src/util/Makefile.am
> ++++ b/src/util/Makefile.am
> +@@ -31,6 +31,7 @@ noinst_LTLIBRARIES = \
> +       libxmlconfig.la
> +
> + AM_CPPFLAGS = \
> ++      $(PTHREAD_CFLAGS) \
> +       -I$(top_srcdir)/include
> +
> + libmesautil_la_CPPFLAGS = \
> +@@ -50,6 +51,7 @@ libmesautil_la_SOURCES = \
> +       $(MESA_UTIL_GENERATED_FILES)
> +
> + libmesautil_la_LIBADD = \
> ++      $(PTHREAD_LIBS) \
> +       $(CLOCK_LIB) \
> +       $(ZLIB_LIBS) \
> +       $(LIBATOMIC_LIBS)
> +--
> +2.14.3
> +
> diff --git a/meta/recipes-graphics/mesa/mesa_17.3.3.bb
> b/meta/recipes-graphics/mesa/mesa_17.3.3.bb
> index 6e3f29a2c4..623046e116 100644
> --- a/meta/recipes-graphics/mesa/mesa_17.3.3.bb
> +++ b/meta/recipes-graphics/mesa/mesa_17.3.3.bb
> @@ -10,6 +10,7 @@ SRC_URI = "https://mesa.freedesktop.org/
> archive/mesa-${PV}.tar.xz \
>             file://0001-winsys-svga-drm-Include-sys-types.h.patch \
>             file://0001-Makefile.vulkan.am-explictly-add-lib-expat-to-intel-.patch
> \
>             file://0001-anv_icd.py-improve-reproducible-builds.patch \
> +           file://0001-link-mesautil-with-pthreads.patch \
>             "
>
>  SRC_URI[md5sum] = "139b5f608b371c0d4395596162f88791"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c1246daeac12d05636096f5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Upstream-Status tag needs to be in the patch you add, not =
the commit message.<div><br></div><div>Ross</div></div><div class=3D"gmail_=
extra"><br><div class=3D"gmail_quote">On 22 January 2018 at 16:56, Randy Ma=
cLeod <span dir=3D"ltr">&lt;<a href=3D"mailto:Randy.MacLeod@windriver.com" =
target=3D"_blank">Randy.MacLeod@windriver.com</a>&gt;</span> wrote:<br><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex"><span class=3D"">Cherry-pick fix from mesa upstr=
eam:<br>
=C2=A0 =C2=A023ce168048 link mesautil with pthreads<br>
<br>
</span>link mesautil with pthreads to avoid:<br>
<br>
../../src/util/.libs/<wbr>libmesautil.a(libmesautil_la-<wbr>u_queue.o): In =
function `u_thread_setname&#39;:<br>
<span class=3D"">/builddir/build/BUILD/mesa-17.<wbr>3.1/src/util/../../src/=
util/u_<wbr>thread.h:66: undefined reference to `pthread_setname_np&#39;<br=
>
</span>../../src/util/.libs/<wbr>libmesautil.a(libmesautil_la-<wbr>u_queue.=
o): In function `thrd_join&#39;:<br>
<span class=3D"">/builddir/build/BUILD/mesa-17.<wbr>3.1/src/util/../../incl=
ude/<wbr>c11/threads_posix.h:336: undefined reference to `pthread_join&#39;=
<br>
</span>../../src/util/.libs/<wbr>libmesautil.a(libmesautil_la-<wbr>u_queue.=
o): In function `u_thread_create&#39;:<br>
<span class=3D"">/builddir/build/BUILD/mesa-17.<wbr>3.1/src/util/../../src/=
util/u_<wbr>thread.h:48: undefined reference to `pthread_sigmask&#39;<br>
</span>../../src/util/.libs/<wbr>libmesautil.a(libmesautil_la-<wbr>u_queue.=
o): In function `thrd_create&#39;:<br>
<span class=3D"">/builddir/build/BUILD/mesa-17.<wbr>3.1/src/util/../../incl=
ude/<wbr>c11/threads_posix.h:296: undefined reference to `pthread_create&#3=
9;<br>
</span>../../src/util/.libs/<wbr>libmesautil.a(libmesautil_la-<wbr>u_queue.=
o): In function `u_thread_create&#39;:<br>
<span class=3D"">/builddir/build/BUILD/mesa-17.<wbr>3.1/src/util/../../src/=
util/u_<wbr>thread.h:50: undefined reference to `pthread_sigmask&#39;<br>
/builddir/build/BUILD/mesa-17.<wbr>3.1/src/util/../../src/util/u_<wbr>threa=
d.h:50: undefined reference to `pthread_sigmask&#39;<br>
</span>../../src/util/.libs/<wbr>libmesautil.a(libmesautil_la-<wbr>u_queue.=
o): In function `call_once&#39;:<br>
<span class=3D"">/builddir/build/BUILD/mesa-17.<wbr>3.1/src/util/../../incl=
ude/<wbr>c11/threads_posix.h:96: undefined reference to `pthread_once&#39;<=
br>
</span>../../src/util/.libs/<wbr>libmesautil.a(libmesautil_la-<wbr>u_queue.=
o): In function `u_thread_get_time_nano&#39;:<br>
<span class=3D"">/builddir/build/BUILD/mesa-17.<wbr>3.1/src/util/../../src/=
util/u_<wbr>thread.h:84: undefined reference to `pthread_getcpuclockid&#39;=
<br>
</span><span class=3D"">collect2: error: ld returned 1 exit status<br>
<br>
</span>Upstream-Status: backport<br>
<span class=3D""><br>
Signed-off-by: Randy MacLeod &lt;<a href=3D"mailto:Randy.MacLeod@windriver.=
com">Randy.MacLeod@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../files/0001-link-mesautil-<wbr>with-pthreads.patch=C2=A0 =C2=A0| 5=
1 ++++++++++++++++++++++<br>
</span>=C2=A0meta/recipes-graphics/mesa/<a href=3D"http://mesa_17.3.3.bb" r=
el=3D"noreferrer" target=3D"_blank">mes<wbr>a_17.3.3.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
<span class=3D"">=C2=A02 files changed, 52 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-graphics/mesa/<wbr>files/0001-link-me=
sautil-with-<wbr>pthreads.patch<br>
<br>
diff --git a/meta/recipes-graphics/mesa/<wbr>files/0001-link-mesautil-with-=
<wbr>pthreads.patch b/meta/recipes-graphics/mesa/<wbr>files/0001-link-mesau=
til-with-<wbr>pthreads.patch<br>
new file mode 100644<br>
index 0000000000..193c54661b<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/mesa/<wbr>files/0001-link-mesautil-with-<wbr>pt=
hreads.patch<br>
@@ -0,0 +1,51 @@<br>
+From 23ce168048698eeea3df6bb8c9de5b<wbr>e3ca4784cd Mon Sep 17 00:00:00 200=
1<br>
+From: Igor Gnatenko &lt;<a href=3D"mailto:ignatenko@redhat.com">ignatenko@=
redhat.com</a>&gt;<br>
</span><span class=3D"">+Date: Mon, 1 Jan 2018 22:49:00 +0100<br>
+Subject: [PATCH] link mesautil with pthreads<br>
+<br>
+../../src/util/.libs/<wbr>libmesautil.a(libmesautil_la-<wbr>u_queue.o): In=
 function `u_thread_setname&#39;:<br>
+/builddir/build/BUILD/mesa-<wbr>17.3.1/src/util/../../src/<wbr>util/u_thre=
ad.h:66: undefined reference to `pthread_setname_np&#39;<br>
+../../src/util/.libs/<wbr>libmesautil.a(libmesautil_la-<wbr>u_queue.o): In=
 function `thrd_join&#39;:<br>
+/builddir/build/BUILD/mesa-<wbr>17.3.1/src/util/../../include/<wbr>c11/thr=
eads_posix.h:336: undefined reference to `pthread_join&#39;<br>
+../../src/util/.libs/<wbr>libmesautil.a(libmesautil_la-<wbr>u_queue.o): In=
 function `u_thread_create&#39;:<br>
+/builddir/build/BUILD/mesa-<wbr>17.3.1/src/util/../../src/<wbr>util/u_thre=
ad.h:48: undefined reference to `pthread_sigmask&#39;<br>
+../../src/util/.libs/<wbr>libmesautil.a(libmesautil_la-<wbr>u_queue.o): In=
 function `thrd_create&#39;:<br>
+/builddir/build/BUILD/mesa-<wbr>17.3.1/src/util/../../include/<wbr>c11/thr=
eads_posix.h:296: undefined reference to `pthread_create&#39;<br>
+../../src/util/.libs/<wbr>libmesautil.a(libmesautil_la-<wbr>u_queue.o): In=
 function `u_thread_create&#39;:<br>
+/builddir/build/BUILD/mesa-<wbr>17.3.1/src/util/../../src/<wbr>util/u_thre=
ad.h:50: undefined reference to `pthread_sigmask&#39;<br>
+/builddir/build/BUILD/mesa-<wbr>17.3.1/src/util/../../src/<wbr>util/u_thre=
ad.h:50: undefined reference to `pthread_sigmask&#39;<br>
+../../src/util/.libs/<wbr>libmesautil.a(libmesautil_la-<wbr>u_queue.o): In=
 function `call_once&#39;:<br>
+/builddir/build/BUILD/mesa-<wbr>17.3.1/src/util/../../include/<wbr>c11/thr=
eads_posix.h:96: undefined reference to `pthread_once&#39;<br>
+../../src/util/.libs/<wbr>libmesautil.a(libmesautil_la-<wbr>u_queue.o): In=
 function `u_thread_get_time_nano&#39;:<br>
+/builddir/build/BUILD/mesa-<wbr>17.3.1/src/util/../../src/<wbr>util/u_thre=
ad.h:84: undefined reference to `pthread_getcpuclockid&#39;<br>
+collect2: error: ld returned 1 exit status<br>
+<br>
+Reviewed-by: Adam Jackson &lt;<a href=3D"mailto:ajax@redhat.com">ajax@redh=
at.com</a>&gt;<br>
</span>+Signed-off-by: Igor Gnatenko &lt;<a href=3D"mailto:ignatenko@redhat=
.com">ignatenko@redhat.com</a>&gt;<br>
<span class=3D"">+---<br>
+ src/util/Makefile.am | 2 ++<br>
+ 1 file changed, 2 insertions(+)<br>
+<br>
+diff --git a/src/util/Makefile.am b/src/util/Makefile.am<br>
+index a5241ad27b..633907b9fd 100644<br>
+--- a/src/util/Makefile.am<br>
++++ b/src/util/Makefile.am<br>
+@@ -31,6 +31,7 @@ noinst_LTLIBRARIES =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://libxmlconfig.la" rel=3D"noref=
errer" target=3D"_blank">libxmlconfig.la</a><br>
</span><span class=3D"">+<br>
+ AM_CPPFLAGS =3D \<br>
++=C2=A0 =C2=A0 =C2=A0 $(PTHREAD_CFLAGS) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-I$(top_srcdir)/include<br>
+<br>
+ libmesautil_la_CPPFLAGS =3D \<br>
+@@ -50,6 +51,7 @@ libmesautil_la_SOURCES =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(MESA_UTIL_GENERATED_FILES)<br>
+<br>
+ libmesautil_la_LIBADD =3D \<br>
++=C2=A0 =C2=A0 =C2=A0 $(PTHREAD_LIBS) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(CLOCK_LIB) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(ZLIB_LIBS) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(LIBATOMIC_LIBS)<br>
+--<br>
+2.14.3<br>
+<br>
</span>diff --git a/meta/recipes-graphics/mesa/<a href=3D"http://mesa_17.3.=
3.bb" rel=3D"noreferrer" target=3D"_blank">m<wbr>esa_17.3.3.bb</a> b/meta/r=
ecipes-graphics/mesa/<a href=3D"http://mesa_17.3.3.bb" rel=3D"noreferrer" t=
arget=3D"_blank">m<wbr>esa_17.3.3.bb</a><br>
index 6e3f29a2c4..623046e116 100644<br>
--- a/meta/recipes-graphics/mesa/<a href=3D"http://mesa_17.3.3.bb" rel=3D"n=
oreferrer" target=3D"_blank">m<wbr>esa_17.3.3.bb</a><br>
+++ b/meta/recipes-graphics/mesa/<a href=3D"http://mesa_17.3.3.bb" rel=3D"n=
oreferrer" target=3D"_blank">m<wbr>esa_17.3.3.bb</a><br>
@@ -10,6 +10,7 @@ SRC_URI =3D &quot;<a href=3D"https://mesa.freedesktop.org=
/archive/mesa-${PV}.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://me=
sa.freedesktop.org/<wbr>archive/mesa-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-winsys-svga-drm-<wbr>=
Include-sys-types.h.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Makefile.vulkan.<wbr>=
am-explictly-add-lib-expat-to-<wbr>intel-.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-anv_icd.py-<wbr>impro=
ve-reproducible-builds.<wbr>patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-link-mesautil-<wbr>wi=
th-pthreads.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;<wbr>139b5f608b371c0d4395596162f887<wbr>91&=
quot;<br>
<span class=3D"">--<br>
2.11.0<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
</span><a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedd=
ed-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org=
/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
</blockquote></div><br></div>

--94eb2c1246daeac12d05636096f5--
