Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f44.google.com (mail-vk0-f44.google.com
	[209.85.213.44])
	by mail.openembedded.org (Postfix) with ESMTP id DEC5360079
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 15:28:25 +0000 (UTC)
Received: by mail-vk0-f44.google.com with SMTP id 192so47333653vkl.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 08:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HnuBo60XkfNt1uDfg78Y4XOpgVwR/kdA9YCebzlW7us=;
	b=yt6sV9DgCiGUpZSy23OITx7/owT/dPy8OMRgXxb1ASdsUh+7ITX2jx+L2A/JJZYjoa
	Vi3XDm0g4wfc+prbb19SmALmKJhyckL/LoZ3X7SZewwwTOhZMvfT5l1Itl6y+q0pU8pF
	pK2WXc0dqf2G5USBXckjTg/w7qPG80Stb2U8hWV5TEPT7EAK/95CypL9N3w0ODGIJLu6
	5PyB1b1o78cSLyCoIFc92liJD9Yvuq7wKSzKoQRQiBKgQ6gBQmRidcScB+YyQma0BfE4
	t9deJbUvt4AcUcmcombbApJJMJoTnbYMZcEbOLE0Fw+ujTaq+FzRyUeu/HqXvOiyj9cy
	qybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HnuBo60XkfNt1uDfg78Y4XOpgVwR/kdA9YCebzlW7us=;
	b=GHBJV2vPSx0WsYC2/A89qtBTl5AkTrTK2hJImHjOCZGsPGWaZsLGr4hsCVD/Kvmv+5
	kTTdJVBK/nbklXtpPSm6m0nTX6Z5D+zrHnFiiA3Hfyn3Ur13uBv3qC0ysG7rLyk1+CZn
	tK5fFfXhoB2SWLBARNxPGRn8czdvt1Nef+nZIixXDYHDBh0G7daIr/sbCsRXvI1IEwY0
	dgwNXEhdIzHkUJdO/5XO74/tGqZhcniZyFBTqX3LBah81j+Kz1CkxV/Kfw1+VxX/CC+5
	K2Neq5m9kDIg5z43QQLNcygqz2QxT9aIrQP1l+IpysN1p4OQFOBLhgYPD9aQ+Tbk7aB6
	4F2Q==
X-Gm-Message-State: AA6/9RmncO1JM6iyjITicv5xqK0VO/cFuUaxYINWxugfWrJoOx+p8YkY69SiIAC3fMYTWa8ipJTctUYloq9WWg==
X-Received: by 10.31.180.195 with SMTP id d186mr17410055vkf.139.1475076507500; 
	Wed, 28 Sep 2016 08:28:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.86.206 with HTTP; Wed, 28 Sep 2016 08:28:26 -0700 (PDT)
Received: by 10.176.86.206 with HTTP; Wed, 28 Sep 2016 08:28:26 -0700 (PDT)
In-Reply-To: <1475074774.30475.69.camel@linuxfoundation.org>
References: <1475074774.30475.69.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 28 Sep 2016 08:28:26 -0700
Message-ID: <CAMKF1spvrz9vJ_6tzL+NjDtRQuDdk3-9NBOcnG6CfD2kpcjW5A@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cross-canadian/libgcc-common: Fixes for arm multilib
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
X-List-Received-Date: Wed, 28 Sep 2016 15:28:27 -0000
Content-Type: multipart/alternative; boundary=001a114382cc3f23e2053d930366

--001a114382cc3f23e2053d930366
Content-Type: text/plain; charset=UTF-8

Seems fine

On Sep 28, 2016 8:00 AM, "Richard Purdie" <
richard.purdie@linuxfoundation.org> wrote:

> Arm is unusual in that we force it to "linux-gnueabi" and "linux" doesn't
> build. This was causing problems for multilib configurations which were
> assuming
> "linux" was the default compiler rather than linux-gnueabi.
>
> This change does two things, ensures symlinks are generated for
> linux-gnueabi
> and also adapts the libgcc code to account for the difference on arm.
>
> It still needs to immediately expand/save TARGET_VENDOR but we defer
> deciding what TARGET_OS should be until we know TARGET_ARCH (which the
> multilib code may change).
>
> [YOCTO #8642]
>
> Note that sanity tests of a 32 bit arm multilib still break due to issues
> with the kernel headers on a mixed bit system. This looks to be a general
> headers issue for the platform though and a different type of bug.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/classes/cross-canadian.bbclass
> b/meta/classes/cross-canadian.bbclass
> index 099c0da..21921b3 100644
> --- a/meta/classes/cross-canadian.bbclass
> +++ b/meta/classes/cross-canadian.bbclass
> @@ -80,7 +80,7 @@ python () {
>          for extraos in d.getVar("BASECANADIANEXTRAOS", True).split():
>              d.appendVar("CANADIANEXTRAOS", " " + extraos + "n32")
>      if tarch == "arm" or tarch == "armeb":
> -        d.appendVar("CANADIANEXTRAOS", " linux-musleabi
> linux-uclibceabi")
> +        d.appendVar("CANADIANEXTRAOS", " linux-gnueabi linux-musleabi
> linux-uclibceabi")
>          d.setVar("TARGET_OS", "linux-gnueabi")
>      else:
>          d.setVar("TARGET_OS", "linux")
> diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc
> b/meta/recipes-devtools/gcc/libgcc-common.inc
> index 4e4f0fd..1549eb4 100644
> --- a/meta/recipes-devtools/gcc/libgcc-common.inc
> +++ b/meta/recipes-devtools/gcc/libgcc-common.inc
> @@ -123,15 +123,18 @@ fakeroot python do_multilib_install() {
>          os.symlink(src, dest)
>  }
>
> -def get_original_vendoros(d):
> -    vendoros = d.expand('${TARGET_VENDOR}-${TARGET_OS}')
> +def get_original_os(d):
> +    vendoros = d.expand('${TARGET_ARCH}${ORIG_TARGET_VENDOR}-${TARGET_
> OS}')
>      for suffix in [d.getVar('ABIEXTENSION', True),
> d.getVar('LIBCEXTENSION', True)]:
>          if suffix and vendoros.endswith(suffix):
>              vendoros = vendoros[:-len(suffix)]
> +    # Arm must use linux-gnueabi not linux as only the former is accepted
> by gcc
> +    if vendoros.startswith("arm-") and not vendoros.endswith("-gnueabi"):
> +        vendoros = vendoros + "-gnueabi"
>      return vendoros
>
> -ORIG_TARGET_VENDOROS := "${@get_original_vendoros(d)}"
> -BASETARGET_SYS = "${TARGET_ARCH}${ORIG_TARGET_VENDOROS}"
> +ORIG_TARGET_VENDOR := "${TARGET_VENDOR}"
> +BASETARGET_SYS = "${@get_original_os(d)}"
>
>  addtask extra_symlinks after do_multilib_install before do_package
> do_populate_sysroot
>  fakeroot python do_extra_symlinks() {
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114382cc3f23e2053d930366
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Seems fine</p>
<div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Sep 28, 2016 8=
:00 AM, &quot;Richard Purdie&quot; &lt;<a href=3D"mailto:richard.purdie@lin=
uxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br type=
=3D"attribution"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">Arm is unusual in that we f=
orce it to &quot;linux-gnueabi&quot; and &quot;linux&quot; doesn&#39;t<br>
build. This was causing problems for multilib configurations which were ass=
uming<br>
&quot;linux&quot; was the default compiler rather than linux-gnueabi.<br>
<br>
This change does two things, ensures symlinks are generated for linux-gnuea=
bi<br>
and also adapts the libgcc code to account for the difference on arm.<br>
<br>
It still needs to immediately expand/save TARGET_VENDOR but we defer<br>
deciding what TARGET_OS should be until we know TARGET_ARCH (which the<br>
multilib code may change).<br>
<br>
[YOCTO #8642]<br>
<br>
Note that sanity tests of a 32 bit arm multilib still break due to issues<b=
r>
with the kernel headers on a mixed bit system. This looks to be a general<b=
r>
headers issue for the platform though and a different type of bug.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org">richard.purdie@<wbr>linuxfoundation.org</a>&gt;<br>
<br>
diff --git a/meta/classes/cross-canadian.<wbr>bbclass b/meta/classes/cross-=
canadian.<wbr>bbclass<br>
index 099c0da..21921b3 100644<br>
--- a/meta/classes/cross-canadian.<wbr>bbclass<br>
+++ b/meta/classes/cross-canadian.<wbr>bbclass<br>
@@ -80,7 +80,7 @@ python () {<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0for extraos in d.getV=
ar(&quot;BASECANADIANEXTRAOS&quot;<wbr>, True).split():<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0d.appendVar(&quot;<wbr>CANADIANEXTRAOS&quot;, &quot; &quot; + extraos + =
&quot;n32&quot;)<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if tarch =3D=3D &quot;arm&quot; or tarch =3D=
=3D &quot;armeb&quot;:<br>
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0d.appendVar(&quot;<wbr>CAN=
ADIANEXTRAOS&quot;, &quot; linux-musleabi linux-uclibceabi&quot;)<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0d.appendVar(&quot;<wbr>CAN=
ADIANEXTRAOS&quot;, &quot; linux-gnueabi linux-musleabi linux-uclibceabi&qu=
ot;)<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0d.setVar(&quot;TARGET=
_OS&quot;, &quot;linux-gnueabi&quot;)<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0else:<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0d.setVar(&quot;TARGET=
_OS&quot;, &quot;linux&quot;)<br>
diff --git a/meta/recipes-devtools/gcc/<wbr>libgcc-common.inc b/meta/recipe=
s-devtools/gcc/<wbr>libgcc-common.inc<br>
index 4e4f0fd..1549eb4 100644<br>
--- a/meta/recipes-devtools/gcc/<wbr>libgcc-common.inc<br>
+++ b/meta/recipes-devtools/gcc/<wbr>libgcc-common.inc<br>
@@ -123,15 +123,18 @@ fakeroot python do_multilib_install() {<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0os.symlink(src, dest)=
<br>
=C2=A0}<br>
=C2=A0<br>
-def get_original_vendoros(d):<br>
-=C2=A0=C2=A0=C2=A0=C2=A0vendoros =3D d.expand(&#39;${TARGET_VENDOR}-${<wbr=
>TARGET_OS}&#39;)<br>
+def get_original_os(d):<br>
+=C2=A0=C2=A0=C2=A0=C2=A0vendoros =3D d.expand(&#39;${TARGET_ARCH}${<wbr>OR=
IG_TARGET_VENDOR}-${TARGET_<wbr>OS}&#39;)<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0for suffix in [d.getVar(&#39;ABIEXTENSION&#39=
;, True), d.getVar(&#39;LIBCEXTENSION&#39;, True)]:<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if suffix and vendoro=
s.endswith(suffix):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0vendoros =3D vendoros[:-len(suffix)]<br>
+=C2=A0=C2=A0=C2=A0=C2=A0# Arm must use linux-gnueabi not linux as only the=
 former is accepted by gcc<br>
+=C2=A0=C2=A0=C2=A0=C2=A0if vendoros.startswith(&quot;arm-&quot;) and not v=
endoros.endswith(&quot;-gnueabi&quot;):<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0vendoros =3D vendoros + &q=
uot;-gnueabi&quot;<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return vendoros<br>
=C2=A0<br>
-ORIG_TARGET_VENDOROS :=3D &quot;${@get_original_vendoros(d)}&quot;<br>
-BASETARGET_SYS =3D &quot;${TARGET_ARCH}${ORIG_TARGET_<wbr>VENDOROS}&quot;<=
br>
+ORIG_TARGET_VENDOR :=3D &quot;${TARGET_VENDOR}&quot;<br>
+BASETARGET_SYS =3D &quot;${@get_original_os(d)}&quot;<br>
=C2=A0<br>
=C2=A0addtask extra_symlinks after do_multilib_install before do_package do=
_populate_sysroot<br>
=C2=A0fakeroot python do_extra_symlinks() {<br>
<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</blockquote></div></div>

--001a114382cc3f23e2053d930366--
