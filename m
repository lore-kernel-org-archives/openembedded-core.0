Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7FEFD7404E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 16:52:17 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so122995942igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 09:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=e4bd1QMa/vHqaAIIGK0Nwm5QtX0HezEKg/fEgBG8leU=;
	b=NE7aNoq2VsvMH1hqHqxWZvynTv1jmkbAS7ACMmBpZLd/0MnlahGd9aTj4WJ4KYsxgn
	3XjoH9wLg0yVoFETk1Va6V43V3Jb99sXsGSfhewCdwPsQed6ks6cRAfGMwOjRPqk02nF
	WfQiretsLmd9Z+oxf/p8Jsa9pdCOvjY6d6i61GRueXndAcaNXoIzmD1b+9pLC5sofpY0
	mQleYILFKs9RCKNxHeYIavNcJK5YumKOoJNVF5SeRHReZJXgJR4hAQAAykT6htF0gOMY
	/kTB04OwSxK/wM208yHRGLdfsl84F+XcuViDGFwN89zBvGAEAnNPZiXfiXnPIY69iNXv
	CRsg==
MIME-Version: 1.0
X-Received: by 10.50.110.105 with SMTP id hz9mr14707383igb.77.1443027137678;
	Wed, 23 Sep 2015 09:52:17 -0700 (PDT)
Received: by 10.107.142.130 with HTTP; Wed, 23 Sep 2015 09:52:17 -0700 (PDT)
Received: by 10.107.142.130 with HTTP; Wed, 23 Sep 2015 09:52:17 -0700 (PDT)
In-Reply-To: <1443018963-11715-1-git-send-email-rich.tollerton@ni.com>
References: <1443018963-11715-1-git-send-email-rich.tollerton@ni.com>
Date: Wed, 23 Sep 2015 09:52:17 -0700
Message-ID: <CAMKF1sraBERQvribgohKty3-Y+1hkCa1Dic37Ua-AGCKsEebtg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Richard Tollerton <rich.tollerton@ni.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-5.2: disable isl
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
X-List-Received-Date: Wed, 23 Sep 2015 16:52:17 -0000
Content-Type: multipart/alternative; boundary=089e0115fbeaf1550b05206cefcf

--089e0115fbeaf1550b05206cefcf
Content-Type: text/plain; charset=UTF-8

This is ok
On Sep 23, 2015 7:36 AM, "Richard Tollerton" <rich.tollerton@ni.com> wrote:

> We presently don't package isl. Unfortunately, if the host is already
> using gcc-5.2 (as is presently the case on Arch Linux), configure will
> autodetect the host's libisl, and do_compile will break because the
> system isl headers aren't pulled in. In lieu of packaging isl, disable
> it for now.
>
> [YOCTO #8376]
>
> Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
> ---
>  meta/recipes-devtools/gcc/gcc-5.2.inc | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-5.2.inc
> b/meta/recipes-devtools/gcc/gcc-5.2.inc
> index f691f58..f6673e6 100644
> --- a/meta/recipes-devtools/gcc/gcc-5.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-5.2.inc
> @@ -98,6 +98,7 @@ EXTRA_OECONF_BASE = "\
>      --with-cloog=no \
>      --enable-checking=release \
>      --enable-cheaders=c_global \
> +    --without-isl \
>  "
>
>  EXTRA_OECONF_INITIAL = "\
> @@ -109,6 +110,7 @@ EXTRA_OECONF_INITIAL = "\
>      --disable-lto \
>      --disable-plugin \
>      --enable-decimal-float=no \
> +    --without-isl \
>  "
>
>  EXTRA_OECONF_append_libc-uclibc = " --disable-decimal-float "
> --
> 2.5.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--089e0115fbeaf1550b05206cefcf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">This is ok</p>
<div class=3D"gmail_quote">On Sep 23, 2015 7:36 AM, &quot;Richard Tollerton=
&quot; &lt;<a href=3D"mailto:rich.tollerton@ni.com">rich.tollerton@ni.com</=
a>&gt; wrote:<br type=3D"attribution"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">We pre=
sently don&#39;t package isl. Unfortunately, if the host is already<br>
using gcc-5.2 (as is presently the case on Arch Linux), configure will<br>
autodetect the host&#39;s libisl, and do_compile will break because the<br>
system isl headers aren&#39;t pulled in. In lieu of packaging isl, disable<=
br>
it for now.<br>
<br>
[YOCTO #8376]<br>
<br>
Signed-off-by: Richard Tollerton &lt;<a href=3D"mailto:rich.tollerton@ni.co=
m">rich.tollerton@ni.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/gcc/gcc-5.2.inc | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/recipes-devtools/gcc/gcc-5.2.inc b/meta/recipes-devtools/=
gcc/gcc-5.2.inc<br>
index f691f58..f6673e6 100644<br>
--- a/meta/recipes-devtools/gcc/gcc-5.2.inc<br>
+++ b/meta/recipes-devtools/gcc/gcc-5.2.inc<br>
@@ -98,6 +98,7 @@ EXTRA_OECONF_BASE =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0--with-cloog=3Dno \<br>
=C2=A0 =C2=A0 =C2=A0--enable-checking=3Drelease \<br>
=C2=A0 =C2=A0 =C2=A0--enable-cheaders=3Dc_global \<br>
+=C2=A0 =C2=A0 --without-isl \<br>
=C2=A0&quot;<br>
<br>
=C2=A0EXTRA_OECONF_INITIAL =3D &quot;\<br>
@@ -109,6 +110,7 @@ EXTRA_OECONF_INITIAL =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0--disable-lto \<br>
=C2=A0 =C2=A0 =C2=A0--disable-plugin \<br>
=C2=A0 =C2=A0 =C2=A0--enable-decimal-float=3Dno \<br>
+=C2=A0 =C2=A0 --without-isl \<br>
=C2=A0&quot;<br>
<br>
=C2=A0EXTRA_OECONF_append_libc-uclibc =3D &quot; --disable-decimal-float &q=
uot;<br>
--<br>
2.5.2<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--089e0115fbeaf1550b05206cefcf--
