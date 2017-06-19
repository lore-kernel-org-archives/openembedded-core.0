Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id E94EC78077
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 14:09:33 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id 70so16578877wme.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 07:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TZzPC1pQchKTaM2yyA/nFnovsOq0AbA0UOPKdPIKHmQ=;
	b=vKtLjC4VSM74vg/DMl3MdwRX2UsXN9cx/iBGDgLk82V3zhzMD6JzMWWfWyYXr0DIsI
	jUDZdnBhZ/mF1MZMYJNu+aJ8om82v3VUhz/kivUrMPtxFQnl/UN67HscXS9PANRKkWYj
	eH3w/EQ3kSlXqbrK2yr7wD01i/5sSO5Yy3r7AjMt6y8mVTsxuqaSuE3u4SLQYkQx/gxk
	/hpj/wAQOhs+hg29WzIug2DL69BspOjscDvRMGQ4HCh6eVDt1p5HEAai7gvxZxQuYr0x
	5/kliO//NIz1fDVEM5DtXjuOqthfecsNiw0dIA4Pgyi87SlbIZfj38v8KK3H/USChjJf
	pAGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TZzPC1pQchKTaM2yyA/nFnovsOq0AbA0UOPKdPIKHmQ=;
	b=rnpO1xMgfLDBR5+bgR+Ij3k0FGBNaD5VvLY1NmaAS1LFGqfIiQkJU6KANxfJUdKaSY
	az2dn6QAwcD2N8WkJ3AOSK0gkQOWa81lAG4rVPct5Cs+68iXiLDpE8LoPekprOtrlGyG
	wkRa14gr+aNeg+Gkc0KSgWMw4XaZzQsXMYU6O9CHEUXEdnkn0j2FEZdHCgWR9Uz8Et4j
	B0wemUMiPz8yn10ZqL1AFv0zGKlj7/8zlgI0eqyXQPmBEVO+H/RiRbICRnoNziJKnLXM
	OCh/HLE60e5sHR9Q5roVLBoxnJzElE7VP0SKNCCdw7icwWHr+aHUTKRlxKa4AGUeUyk8
	eoVA==
X-Gm-Message-State: AKS2vOzgxW/ijnHmjqQjU3Y7RNvvAEuCuQ8MewB+xHiuG377PQ1qaFJC
	26Y0O/LFUnqd+qBrzZtYjawUE5ovJg==
X-Received: by 10.80.151.37 with SMTP id c34mr17781081edb.30.1497881374307;
	Mon, 19 Jun 2017 07:09:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.153.222 with HTTP; Mon, 19 Jun 2017 07:09:33 -0700 (PDT)
In-Reply-To: <20170619101917.31865-1-git@andred.net>
References: <20170619101917.31865-1-git@andred.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Jun 2017 07:09:33 -0700
Message-ID: <CAMKF1sq5erUwXZPCgngSvL+3CjPHVbjXtWde7wBKwKEcqLx7aA@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH] tclibc-musl: use musl's virtual/gettext implementation
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
X-List-Received-Date: Mon, 19 Jun 2017 14:09:34 -0000
Content-Type: multipart/alternative; boundary="f403045c55643b4193055250af91"

--f403045c55643b4193055250af91
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Monday, June 19, 2017, Andr=C3=A9 Draszik <git@andred.net> wrote:

> From: Andr=C3=A9 Draszik <adraszik@tycoint.com <javascript:;>>
>
> musl implements the GNU gettext API version 1 and 2
>   http://www.openwall.com/lists/musl/2015/04/16/3
>
> Generally, there should be no need need for the
> actual GNU/gettext in systems using musl, so with
> this change systems using musl can avoid a needless
> dependency on a GPLv3+ tool.
>
> If an application ever appears that needs
> GNU/gettext API version 3, we can think about a way
> to support it at that time.


Thanks for doing this it has been pending for long time
We have to run through some extended builds e.g. Using meta OE
Layers and see for any major regressions

I will cherry pick this into my master and see how it does

>
> Signed-off-by: Andr=C3=A9 Draszik <adraszik@tycoint.com <javascript:;>>
> Acked-by: Sylvain Lemieux <slemieux@tycoint.com <javascript:;>>
> ---
>  meta/conf/distro/include/tclibc-musl.inc | 1 +
>  meta/recipes-core/musl/musl_git.bb       | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/conf/distro/include/tclibc-musl.inc
> b/meta/conf/distro/include/tclibc-musl.inc
> index 3d3f6ac4f4..172b09ab20 100644
> --- a/meta/conf/distro/include/tclibc-musl.inc
> +++ b/meta/conf/distro/include/tclibc-musl.inc
> @@ -13,6 +13,7 @@ PREFERRED_PROVIDER_virtual/libiconv ?=3D "musl"
>  PREFERRED_PROVIDER_virtual/libintl ?=3D "musl"
>  PREFERRED_PROVIDER_virtual/nativesdk-libintl ?=3D "nativesdk-glibc"
>  PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?=3D "nativesdk-glibc"
> +PREFERRED_PROVIDER_virtual/gettext ?=3D "musl"
>
>  #USE_NLS ?=3D "no"
>
> diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/
> musl_git.bb
> index fba47096f5..9cf097d067 100644
> --- a/meta/recipes-core/musl/musl_git.bb
> +++ b/meta/recipes-core/musl/musl_git.bb
> @@ -15,7 +15,7 @@ SRC_URI =3D "git://git.musl-libc.org/musl \
>
>  S =3D "${WORKDIR}/git"
>
> -PROVIDES +=3D "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc
> virtual/libiconv virtual/libintl"
> +PROVIDES +=3D "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc
> virtual/gettext virtual/libiconv virtual/libintl"
>
>  DEPENDS =3D "virtual/${TARGET_PREFIX}binutils \
>             virtual/${TARGET_PREFIX}gcc-initial \
> --
> 2.11.0
>
>

--f403045c55643b4193055250af91
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Monday, June 19, 2017, Andr=C3=A9 Draszik &lt;<a href=3D"mailto:=
git@andred.net">git@andred.net</a>&gt; wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">From: Andr=C3=A9 Draszik &lt;<a href=3D"javascript:;" onclick=3D"_e(ev=
ent, &#39;cvml&#39;, &#39;adraszik@tycoint.com&#39;)">adraszik@tycoint.com<=
/a>&gt;<br>
<br>
musl implements the GNU gettext API version 1 and 2<br>
=C2=A0 <a href=3D"http://www.openwall.com/lists/musl/2015/04/16/3" target=
=3D"_blank">http://www.openwall.com/lists/<wbr>musl/2015/04/16/3</a><br>
<br>
Generally, there should be no need need for the<br>
actual GNU/gettext in systems using musl, so with<br>
this change systems using musl can avoid a needless<br>
dependency on a GPLv3+ tool.<br>
<br>
If an application ever appears that needs<br>
GNU/gettext API version 3, we can think about a way<br>
to support it at that time.</blockquote><div><br></div><div>Thanks for doin=
g this it has been pending for long time=C2=A0</div>We have to run through =
some extended builds e.g. Using meta OE=C2=A0<div>Layers and see for any ma=
jor regressions</div><div><br></div><div>I will cherry pick this into my ma=
ster and see how it does<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Signed-off-by: Andr=C3=A9 Draszik &lt;<a href=3D"javascript:;" onclick=3D"_=
e(event, &#39;cvml&#39;, &#39;adraszik@tycoint.com&#39;)">adraszik@tycoint.=
com</a>&gt;<br>
Acked-by: Sylvain Lemieux &lt;<a href=3D"javascript:;" onclick=3D"_e(event,=
 &#39;cvml&#39;, &#39;slemieux@tycoint.com&#39;)">slemieux@tycoint.com</a>&=
gt;<br>
---<br>
=C2=A0meta/conf/distro/include/<wbr>tclibc-musl.inc | 1 +<br>
=C2=A0meta/recipes-core/musl/<a href=3D"http://musl_git.bb" target=3D"_blan=
k">musl_<wbr>git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A02 files changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/conf/distro/include/<wbr>tclibc-musl.inc b/meta/conf/dist=
ro/include/<wbr>tclibc-musl.inc<br>
index 3d3f6ac4f4..172b09ab20 100644<br>
--- a/meta/conf/distro/include/<wbr>tclibc-musl.inc<br>
+++ b/meta/conf/distro/include/<wbr>tclibc-musl.inc<br>
@@ -13,6 +13,7 @@ PREFERRED_PROVIDER_virtual/<wbr>libiconv ?=3D &quot;musl&=
quot;<br>
=C2=A0PREFERRED_PROVIDER_virtual/<wbr>libintl ?=3D &quot;musl&quot;<br>
=C2=A0PREFERRED_PROVIDER_virtual/<wbr>nativesdk-libintl ?=3D &quot;nativesd=
k-glibc&quot;<br>
=C2=A0PREFERRED_PROVIDER_virtual/<wbr>nativesdk-libiconv ?=3D &quot;natives=
dk-glibc&quot;<br>
+PREFERRED_PROVIDER_virtual/<wbr>gettext ?=3D &quot;musl&quot;<br>
<br>
=C2=A0#USE_NLS ?=3D &quot;no&quot;=C2=A0<br>
<br>
diff --git a/meta/recipes-core/musl/<a href=3D"http://musl_git.bb" target=
=3D"_blank">musl_<wbr>git.bb</a> b/meta/recipes-core/musl/<a href=3D"http:/=
/musl_git.bb" target=3D"_blank">musl_<wbr>git.bb</a><br>
index fba47096f5..9cf097d067 100644<br>
--- a/meta/recipes-core/musl/<a href=3D"http://musl_git.bb" target=3D"_blan=
k">musl_<wbr>git.bb</a><br>
+++ b/meta/recipes-core/musl/<a href=3D"http://musl_git.bb" target=3D"_blan=
k">musl_<wbr>git.bb</a><br>
@@ -15,7 +15,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://git.musl-libc.o=
rg/musl" target=3D"_blank">git.musl-libc.org/musl</a> \<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
-PROVIDES +=3D &quot;virtual/libc virtual/${TARGET_PREFIX}libc-<wbr>for-gcc=
 virtual/libiconv virtual/libintl&quot;<br>
+PROVIDES +=3D &quot;virtual/libc virtual/${TARGET_PREFIX}libc-<wbr>for-gcc=
 virtual/gettext virtual/libiconv virtual/libintl&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;virtual/${TARGET_PREFIX}<wbr>binutils \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 virtual/${TARGET_PREFIX}gcc-<wbr>=
initial \<br>
--<br>
2.11.0<br>
<br>
</blockquote></div>

--f403045c55643b4193055250af91--
