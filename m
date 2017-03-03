Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id F202B71996
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 22:27:15 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id n11so25582883wma.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Mar 2017 14:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=X+V3dT1k/AQuKg6+65jM1GumbDx84+3L+BFw6Uu/CeI=;
	b=O0P9rhj2qw3Ns29GKL86tGY56Y1K0AChjBx+hUGe6Ch0egU4+zqtnX34EPCQ1n+5R0
	YHryfoFG32Waec+SyH33tDeaidRpQ4bItyBVCEk0eixepJLKO4o7XzJn5IeMBW07u2P2
	acaHnHrV97AeByOjNR2MHXW/X2bi9a67egNaMzkrXVlseG3y50oNPHLRyPxv0/g72cYs
	YEaFVQzwZWzpEmxvTjQYwTTZ50iPl84hrZ3LOzZgt3li6hepRvIbGxbekSVFkuyWZx3K
	Zfj+uFdHQprdF4BliMkGkl1tcNkElkr7oOdRUbwRmA68IMXuzSRAd/AsBctHk5AqKOUP
	tQLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=X+V3dT1k/AQuKg6+65jM1GumbDx84+3L+BFw6Uu/CeI=;
	b=MtXINg/BZ46PH2d2jCIci4cmHzX4A2N7IMhqpD/ml8gUpMfgcw4d4xTJsrbl85GR5X
	9gqG6HRNZPbWyNKZwqiecS23whU3myM/CBpY+PCMmXPXC1r4CIdAhvLonD3tSl21je1N
	TNe2Ptene6yTZ9HC6toJkDp/hrAwDIx83Wl4jS2YZvO01Km+MJ0jvs4xz4a1kmxlZDH7
	JhKhRF5b+fkfuon2kqBePRzTWcyBwH0lbP0d5aHFJPjEMWmaZKP1g5fDSWaEguqYObcb
	aNpFNWYBgwk5Q43l0OCwg+UT5Qvjrb5wZ3WUv0faYBRaDtcZyUPonp9dFV1QcQ+dWEbk
	sAVw==
X-Gm-Message-State: AMke39kfFm8KSAJntNNRtOQrt2jSptVSSq/gaQzOj009GpNLaMFv+vsI8WOPWLs27tz3ofk3/wAx4kckD+2QQA==
X-Received: by 10.28.211.80 with SMTP id k77mr4737078wmg.124.1488580036381;
	Fri, 03 Mar 2017 14:27:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.145.24 with HTTP; Fri, 3 Mar 2017 14:27:15 -0800 (PST)
In-Reply-To: <20170303213619.29944-2-schnitzeltony@googlemail.com>
References: <20170303213619.29944-1-schnitzeltony@googlemail.com>
	<20170303213619.29944-2-schnitzeltony@googlemail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 3 Mar 2017 23:27:15 +0100
Message-ID: <CA+chaQd3Py=fyCmnFkHoWaSHEWPxdppi0Y-UkaFEi8=14akh5A@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] aor: fix rss+perf+gold failure on do_compile_ptest_base
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
X-List-Received-Date: Fri, 03 Mar 2017 22:27:18 -0000
Content-Type: multipart/alternative; boundary=001a1146d9b649d79c0549db0c36

--001a1146d9b649d79c0549db0c36
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Typo in summary, but thanks for taking care of this!

On Fri, Mar 3, 2017 at 10:36 PM, Andreas M=C3=BCller <
schnitzeltony@googlemail.com> wrote:

> Was detected in Martin's world build
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  ...link-libapr-against-phtread-to-make-gold-.patch | 50
> ++++++++++++++++++++++
>  meta/recipes-support/apr/apr_1.5.2.bb              |  1 +
>  2 files changed, 51 insertions(+)
>  create mode 100644 meta/recipes-support/apr/apr/
> 0002-explicitly-link-libapr-against-phtread-to-make-gold-.patch
>
> diff --git a/meta/recipes-support/apr/apr/0002-explicitly-link-
> libapr-against-phtread-to-make-gold-.patch b/meta/recipes-support/apr/
> apr/0002-explicitly-link-libapr-against-phtread-to-make-gold-.patch
> new file mode 100644
> index 0000000..7d0dddc
> --- /dev/null
> +++ b/meta/recipes-support/apr/apr/0002-explicitly-link-
> libapr-against-phtread-to-make-gold-.patch
> @@ -0,0 +1,50 @@
> +From 94d1ca0266a0f9c0446f1299b54f752e87b8a695 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
> +Date: Fri, 3 Mar 2017 22:24:17 +0100
> +Subject: [PATCH] explicitly link libapr against phtread to make gold
> happy on
> + test
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +| ../.libs/libapr-1.so: error: undefined reference to
> 'pthread_mutexattr_init'
> +| ../.libs/libapr-1.so: error: undefined reference to
> 'pthread_mutexattr_settype'
> +| ../.libs/libapr-1.so: error: undefined reference to
> 'pthread_mutexattr_destroy'
> +| ../.libs/libapr-1.so: error: undefined reference to
> 'pthread_mutex_trylock'
> +| ../.libs/libapr-1.so: error: undefined reference to
> 'pthread_attr_setstacksize'
> +| ../.libs/libapr-1.so: error: undefined reference to 'pthread_create'
> +| ../.libs/libapr-1.so: error: undefined reference to 'pthread_join'
> +| ../.libs/libapr-1.so: error: undefined reference to 'pthread_detach'
> +| ../.libs/libapr-1.so: error: undefined reference to 'pthread_sigmask'
> +| ../.libs/libapr-1.so: error: undefined reference to 'pthread_once'
> +| ../.libs/libapr-1.so: error: undefined reference to 'pthread_key_creat=
e'
> +| ../.libs/libapr-1.so: error: undefined reference to
> 'pthread_getspecific'
> +| ../.libs/libapr-1.so: error: undefined reference to 'pthread_key_delet=
e'
> +| ../.libs/libapr-1.so: error: undefined reference to
> 'pthread_setspecific'
> +| collect2: error: ld returned 1 exit status
> +| Makefile:114: recipe for target 'globalmutexchild' failed
> +| make[1]: *** [globalmutexchild] Error 1
> +| make[1]: Leaving directory '/home/superandy/tmp/oe-core-
> glibc/work/cortexa7t2hf-neon-vfpv4-angstrom-linux-gnueabi/
> apr/1.5.2-r0/apr-1.5.2/test'
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> +---
> + configure.in | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/configure.in b/configure.in
> +index 5b19940..cdf4d58 100644
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -766,6 +766,7 @@ else
> +           APR_PTHREADS_CHECK_RESTORE ] )
> +     fi
> +     if test "$pthreadh" =3D "1"; then
> ++        APR_ADDTO(LIBS,[-lpthread])
> +         APR_CHECK_PTHREAD_GETSPECIFIC_TWO_ARGS
> +         APR_CHECK_PTHREAD_ATTR_GETDETACHSTATE_ONE_ARG
> +         APR_CHECK_PTHREAD_RECURSIVE_MUTEX
> +--
> +2.9.3
> +
> diff --git a/meta/recipes-support/apr/apr_1.5.2.bb
> b/meta/recipes-support/apr/apr_1.5.2.bb
> index 079f8cd..992b561 100644
> --- a/meta/recipes-support/apr/apr_1.5.2.bb
> +++ b/meta/recipes-support/apr/apr_1.5.2.bb
> @@ -18,6 +18,7 @@ SRC_URI =3D "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 =
\
>             file://Fix-packet-discards-HTTP-redirect.patch \
>             file://configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.p=
atch
> \
>             file://0001-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cr=
oss.patch
> \
> +           file://0002-explicitly-link-libapr-against-phtread-to-make-go=
ld-.patch
> \
>  "
>
>  SRC_URI[md5sum] =3D "4e9769f3349fe11fc0a5e1b224c236aa"
> --
> 2.9.3
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1146d9b649d79c0549db0c36
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Typo in summary, but thanks for taking care of this!</div>=
<div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Fri, Mar 3, 20=
17 at 10:36 PM, Andreas M=C3=BCller <span dir=3D"ltr">&lt;<a href=3D"mailto=
:schnitzeltony@googlemail.com" target=3D"_blank">schnitzeltony@googlemail.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Was detected in =
Martin&#39;s world build<br>
<br>
Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@goog=
lemail.com">schnitzeltony@googlemail.com</a>&gt;<br>
---<br>
=C2=A0...link-libapr-against-<wbr>phtread-to-make-gold-.patch | 50 ++++++++=
++++++++++++++<br>
=C2=A0meta/recipes-support/apr/<a href=3D"http://apr_1.5.2.bb" rel=3D"noref=
errer" target=3D"_blank">apr_<wbr>1.5.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A02 files changed, 51 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-support/apr/apr/<wbr>0002-explicitly-=
link-libapr-<wbr>against-phtread-to-make-gold-.<wbr>patch<br>
<br>
diff --git a/meta/recipes-support/apr/<wbr>apr/0002-explicitly-link-<wbr>li=
bapr-against-phtread-to-<wbr>make-gold-.patch b/meta/recipes-support/apr/<w=
br>apr/0002-explicitly-link-<wbr>libapr-against-phtread-to-<wbr>make-gold-.=
patch<br>
new file mode 100644<br>
index 0000000..7d0dddc<br>
--- /dev/null<br>
+++ b/meta/recipes-support/apr/<wbr>apr/0002-explicitly-link-<wbr>libapr-ag=
ainst-phtread-to-<wbr>make-gold-.patch<br>
@@ -0,0 +1,50 @@<br>
+From 94d1ca0266a0f9c0446f1299b54f75<wbr>2e87b8a695 Mon Sep 17 00:00:00 200=
1<br>
+From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3D<wbr>BCller?=3D &lt;<a href=3D"mail=
to:schnitzeltony@googlemail.com">schnitzeltony@googlemail.com</a>&gt;<br>
+Date: Fri, 3 Mar 2017 22:24:17 +0100<br>
+Subject: [PATCH] explicitly link libapr against phtread to make gold happy=
 on<br>
+ test<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+| ../.libs/libapr-1.so: error: undefined reference to &#39;pthread_mutexat=
tr_init&#39;<br>
+| ../.libs/libapr-1.so: error: undefined reference to &#39;pthread_mutexat=
tr_settype&#39;<br>
+| ../.libs/libapr-1.so: error: undefined reference to &#39;pthread_mutexat=
tr_destroy&#39;<br>
+| ../.libs/libapr-1.so: error: undefined reference to &#39;pthread_mutex_t=
rylock&#39;<br>
+| ../.libs/libapr-1.so: error: undefined reference to &#39;pthread_attr_se=
tstacksize&#39;<br>
+| ../.libs/libapr-1.so: error: undefined reference to &#39;pthread_create&=
#39;<br>
+| ../.libs/libapr-1.so: error: undefined reference to &#39;pthread_join&#3=
9;<br>
+| ../.libs/libapr-1.so: error: undefined reference to &#39;pthread_detach&=
#39;<br>
+| ../.libs/libapr-1.so: error: undefined reference to &#39;pthread_sigmask=
&#39;<br>
+| ../.libs/libapr-1.so: error: undefined reference to &#39;pthread_once&#3=
9;<br>
+| ../.libs/libapr-1.so: error: undefined reference to &#39;pthread_key_cre=
ate&#39;<br>
+| ../.libs/libapr-1.so: error: undefined reference to &#39;pthread_getspec=
ific&#39;<br>
+| ../.libs/libapr-1.so: error: undefined reference to &#39;pthread_key_del=
ete&#39;<br>
+| ../.libs/libapr-1.so: error: undefined reference to &#39;pthread_setspec=
ific&#39;<br>
+| collect2: error: ld returned 1 exit status<br>
+| Makefile:114: recipe for target &#39;globalmutexchild&#39; failed<br>
+| make[1]: *** [globalmutexchild] Error 1<br>
+| make[1]: Leaving directory &#39;/home/superandy/tmp/oe-core-<wbr>glibc/w=
ork/cortexa7t2hf-neon-<wbr>vfpv4-angstrom-linux-gnueabi/<wbr>apr/1.5.2-r0/a=
pr-1.5.2/test&#39;<br>
+<br>
+Upstream-Status: Pending<br>
+<br>
+Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@goo=
glemail.com">schnitzeltony@googlemail.com</a>&gt;<br>
+---<br>
+ <a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_blank">conf=
igure.in</a> | 1 +<br>
+ 1 file changed, 1 insertion(+)<br>
+<br>
+diff --git a/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"=
_blank">configure.in</a> b/<a href=3D"http://configure.in" rel=3D"noreferre=
r" target=3D"_blank">configure.in</a><br>
+index 5b19940..cdf4d58 100644<br>
+--- a/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_blank"=
>configure.in</a><br>
++++ b/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_blank"=
>configure.in</a><br>
+@@ -766,6 +766,7 @@ else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APR_PTHREADS_CHECK_RESTORE ] )<br=
>
+=C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0if test &quot;$pthreadh&quot; =3D &quot;1&quot;; then<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 APR_ADDTO(LIBS,[-lpthread])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APR_CHECK_PTHREAD_GETSPECIFIC_<wbr>TWO_A=
RGS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APR_CHECK_PTHREAD_ATTR_<wbr>GETDETACHSTA=
TE_ONE_ARG<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APR_CHECK_PTHREAD_RECURSIVE_<wbr>MUTEX<b=
r>
+--<br>
+2.9.3<br>
+<br>
diff --git a/meta/recipes-support/apr/<a href=3D"http://apr_1.5.2.bb" rel=
=3D"noreferrer" target=3D"_blank">apr<wbr>_1.5.2.bb</a> b/meta/recipes-supp=
ort/apr/<a href=3D"http://apr_1.5.2.bb" rel=3D"noreferrer" target=3D"_blank=
">apr<wbr>_1.5.2.bb</a><br>
index 079f8cd..992b561 100644<br>
--- a/meta/recipes-support/apr/<a href=3D"http://apr_1.5.2.bb" rel=3D"noref=
errer" target=3D"_blank">apr<wbr>_1.5.2.bb</a><br>
+++ b/meta/recipes-support/apr/<a href=3D"http://apr_1.5.2.bb" rel=3D"noref=
errer" target=3D"_blank">apr<wbr>_1.5.2.bb</a><br>
@@ -18,6 +18,7 @@ SRC_URI =3D &quot;${APACHE_MIRROR}/apr/${BPN}-$<wbr>{PV}.=
tar.bz2 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://Fix-packet-discards-<wbr>H=
TTP-redirect.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://configure.in-fix-<wbr>LTFL=
AGS-to-make-it-work-with-<wbr>ccache.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-apr-fix-off_t-<wbr>si=
ze-doesn-t-match-in-glibc-<wbr>when-cross.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-explicitly-link-<wbr>=
libapr-against-phtread-to-<wbr>make-gold-.patch \<br>
=C2=A0&quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;<wbr>4e9769f3349fe11fc0a5e1b224c236<wbr>aa&=
quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.9.3<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a1146d9b649d79c0549db0c36--
