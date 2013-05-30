Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 3B9E660991
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 08:09:36 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id a12so6991955wgh.23
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 01:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=HmCves8zx27k0t9Vq4h118NnHCUgB8R25Ud1A+Fx/Vg=;
	b=pq1SLKnwJhmJnV4NKffsR6cwyro489jFEnX0W5+00WZCUxEp822vRBALzwuCT5DVOZ
	UUCt8aHIvniPZKko/+lt94Ahl9laxzY44V0GoSshxWUoIdRzQgRbcqvWHEdfd5rDQhV3
	zlrfakWUrUPab7EQ3mnviVu+bDww2WtT0KXPasxP0Pi8LpIXrGrZTu5H6HjhanKgd5i2
	3jMmowDuiQpWJkRYP12uLL8aByX2T6pwqs0Ejqmj/Kzkcz7QU66/dB4Q8angI1RC88G6
	MPufip78tsF9R53qfOaMBj++LL799/Gcs4jYOo6eC1Fj244uFKQJElvm3B5hctTRJrOt
	4oFw==
MIME-Version: 1.0
X-Received: by 10.180.76.194 with SMTP id m2mr3433538wiw.4.1369901376496; Thu,
	30 May 2013 01:09:36 -0700 (PDT)
Received: by 10.194.16.136 with HTTP; Thu, 30 May 2013 01:09:36 -0700 (PDT)
In-Reply-To: <1369899843-3318-1-git-send-email-eric@eukrea.com>
References: <1369899843-3318-1-git-send-email-eric@eukrea.com>
Date: Thu, 30 May 2013 10:09:36 +0200
Message-ID: <CA+chaQeCTAq3dtUao2+oAmETHe5s7gkTjtd86fS2NBcyR=bmdQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] hicolor-icon-theme: keep inherited dependencies
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
X-List-Received-Date: Thu, 30 May 2013 08:09:37 -0000
Content-Type: multipart/alternative; boundary=f46d04389383ec6c8204ddeb0464

--f46d04389383ec6c8204ddeb0464
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Doesn't it depend now on something which isn't allarch? IIRC gnome.bbclass
brings gconf.


On Thu, May 30, 2013 at 9:44 AM, Eric B=C3=A9nard <eric@eukrea.com> wrote:

> else, if an image installs hicolor-icon-theme without any other
> gnome package, the dependency on gdk-pixbuf-native will be missing
> and if it exists, the host gdk-pixbuf-query-loaders binary will be
> used and it will try to update the host's cache
>
> [YOCTO #4572]
>
> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
> ---
> this patch will need some testing as it's not clear to me why this
> dependency was forced to "". At least that fix the problem described in t=
he
> bug report.
>  meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/meta/recipes-gnome/hicolor-icon-theme/
> hicolor-icon-theme_0.12.bb b/meta/recipes-gnome/hicolor-icon-theme/
> hicolor-icon-theme_0.12.bb
> index 7c911e0..8d48dec 100644
> --- a/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb
> +++ b/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb
> @@ -8,8 +8,6 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Df08a446809913fc9b3c718f0eaea0426"
>  SECTION =3D "unknown"
>  inherit gnome allarch
>
> -DEPENDS =3D ""
> -
>  PR =3D "r1"
>
>  SRC_URI =3D "http://icon-theme.freedesktop.org/releases/${BPN}-${PV}.tar=
.gz\
> --
> 1.8.1.4
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f46d04389383ec6c8204ddeb0464
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Doesn&#39;t it depend now on something which isn&#39;t all=
arch? IIRC gnome.bbclass brings gconf.</div><div class=3D"gmail_extra"><br>=
<br><div class=3D"gmail_quote">On Thu, May 30, 2013 at 9:44 AM, Eric B=C3=
=A9nard <span dir=3D"ltr">&lt;<a href=3D"mailto:eric@eukrea.com" target=3D"=
_blank">eric@eukrea.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">else, if an image installs hicolor-icon-them=
e without any other<br>
gnome package, the dependency on gdk-pixbuf-native will be missing<br>
and if it exists, the host gdk-pixbuf-query-loaders binary will be<br>
used and it will try to update the host&#39;s cache<br>
<br>
[YOCTO #4572]<br>
<br>
Signed-off-by: Eric B=C3=A9nard &lt;<a href=3D"mailto:eric@eukrea.com">eric=
@eukrea.com</a>&gt;<br>
---<br>
this patch will need some testing as it&#39;s not clear to me why this depe=
ndency was forced to &quot;&quot;. At least that fix the problem described =
in the bug report.<br>
=C2=A0meta/recipes-gnome/hicolor-icon-theme/<a href=3D"http://hicolor-icon-=
theme_0.12.bb" target=3D"_blank">hicolor-icon-theme_0.12.bb</a> | 2 --<br>
=C2=A01 file changed, 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-gnome/hicolor-icon-theme/<a href=3D"http://hicolo=
r-icon-theme_0.12.bb" target=3D"_blank">hicolor-icon-theme_0.12.bb</a> b/me=
ta/recipes-gnome/hicolor-icon-theme/<a href=3D"http://hicolor-icon-theme_0.=
12.bb" target=3D"_blank">hicolor-icon-theme_0.12.bb</a><br>

index 7c911e0..8d48dec 100644<br>
--- a/meta/recipes-gnome/hicolor-icon-theme/<a href=3D"http://hicolor-icon-=
theme_0.12.bb" target=3D"_blank">hicolor-icon-theme_0.12.bb</a><br>
+++ b/meta/recipes-gnome/hicolor-icon-theme/<a href=3D"http://hicolor-icon-=
theme_0.12.bb" target=3D"_blank">hicolor-icon-theme_0.12.bb</a><br>
@@ -8,8 +8,6 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Df08a4468099=
13fc9b3c718f0eaea0426&quot;<br>
=C2=A0SECTION =3D &quot;unknown&quot;<br>
=C2=A0inherit gnome allarch<br>
<br>
-DEPENDS =3D &quot;&quot;<br>
-<br>
=C2=A0PR =3D &quot;r1&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://icon-theme.freedesktop.org/releas=
es/${BPN}-${PV}.tar.gz" target=3D"_blank">http://icon-theme.freedesktop.org=
/releases/${BPN}-${PV}.tar.gz</a> \<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.8.1.4<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</font></span></blockquote></div><br></div>

--f46d04389383ec6c8204ddeb0464--
