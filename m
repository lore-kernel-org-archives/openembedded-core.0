Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 6DDFC6FFA6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 19:39:07 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id b205so39875619wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 11:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=IS3X8p/tN6dhRGX/i/oJPA6uW8eJfTYj1XsBScROTzQ=;
	b=uoXDRnPwx9Jd5BTsgHQs79eFRJEzVhBPv3EIBMQROoNbIcViYLdlEjH7EPpzqzIp60
	q/vrs+U30GqS5/gHyNrNyXdqJqseispMyxtfogp+t0qMQ4T0VS0B1yjgAmvugf0OS4hw
	qZQ46yWkxkyr40UmBxP8t7lJfIwdZJyY1Y6FjogCyeiKrgN8DJYYvoN4NMkIDHSBpcBD
	xDhVEOW7tLnpNmO8htQJplaqHzBssqf/Qo774VXVy5XOpKv36sdtcd5Vj1EC1OArAQ9P
	h026XX4m5YSKd/XmvJV2GxyXkuFMwRYcrhpe6ziTkZunFh8UTxPG3nXNj32d2M7OxGid
	3EFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=IS3X8p/tN6dhRGX/i/oJPA6uW8eJfTYj1XsBScROTzQ=;
	b=GQgEZNRI3fFIGjs7bfcfEr0mGD/JRF1EMnoHTCGtjHlAOKlCiH5DhbRGAIk19CDJen
	u71TPRNYLB8EXNX33N4YBnE2bPnF1a8e2zqVvoOTiMDDT3nlp7QPn7n23jAnJgAUp4Li
	n9eYEdZopfKK/ViVkV5zG8Xfkoq1zC/dKp8UAHfkXB2k59kSBffwlEKuqCCgxquKfj8J
	11dFMx2EN6CBylwXVAkIjE0HYRfRCKJotcRu/XVWopI9P3HsjLlNO2wViHkFa/JYbeT+
	QKCOZP79+u1Zaqi+mFypAXu1pVHvPg86QbiSmIAM0cfxff5U3K1VBDKvv+X+fGuGy33/
	nixw==
X-Gm-Message-State: AG10YORZRHDg5NJt/JQ2E8CQOxvXLBrDwaBkH0O+xVx90OW4gtxiG7pASLBEUQdivJI88U8DBR22xI7di5KGgg==
MIME-Version: 1.0
X-Received: by 10.28.60.84 with SMTP id j81mr5224783wma.91.1455824348324; Thu,
	18 Feb 2016 11:39:08 -0800 (PST)
Received: by 10.194.58.176 with HTTP; Thu, 18 Feb 2016 11:39:08 -0800 (PST)
In-Reply-To: <1455823285-32028-3-git-send-email-armccurdy@gmail.com>
References: <1455823285-32028-1-git-send-email-armccurdy@gmail.com>
	<1455823285-32028-3-git-send-email-armccurdy@gmail.com>
Date: Thu, 18 Feb 2016 20:39:08 +0100
Message-ID: <CA+chaQcvFnZAjNKCsc3xvPq36zPWXK5xrmi+goTonnu-i4j7sQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] libsoup-2.4: disable libsoup-gnome by default
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
X-List-Received-Date: Thu, 18 Feb 2016 19:39:08 -0000
Content-Type: multipart/alternative; boundary=001a1148e18c232dbe052c1085f1

--001a1148e18c232dbe052c1085f1
Content-Type: text/plain; charset=UTF-8

IIRC this will rename the resulting package (because there will be only one
shared library now).

that will probably break on device upgrade-path

I'm not sure if someone still cares about upgrade-paths.. there are too
many issues going in unnoticed.

On Thu, Feb 18, 2016 at 8:21 PM, Andre McCurdy <armccurdy@gmail.com> wrote:

> libsoup-gnome is entirely deprecated and has just been stubs since 2.42.
>
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/recipes-support/libsoup/libsoup-2.4_2.52.2.bb | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.52.2.bb
> b/meta/recipes-support/libsoup/libsoup-2.4_2.52.2.bb
> index 865c1d7..a12f869 100644
> --- a/meta/recipes-support/libsoup/libsoup-2.4_2.52.2.bb
> +++ b/meta/recipes-support/libsoup/libsoup-2.4_2.52.2.bb
> @@ -18,9 +18,8 @@ S = "${WORKDIR}/libsoup-${PV}"
>
>  inherit autotools gettext pkgconfig upstream-version-is-even
>
> -# libsoup-gnome is entirely deprecated and just stubs in 2.42 onwards.
> Enable
> -# by default but let it be easily disabled.
> -PACKAGECONFIG ??= "gnome"
> +# libsoup-gnome is entirely deprecated and just stubs in 2.42 onwards.
> Disable by default.
> +PACKAGECONFIG ??= ""
>  PACKAGECONFIG[gnome] = "--with-gnome,--without-gnome"
>
>  EXTRA_OECONF = "--disable-vala"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1148e18c232dbe052c1085f1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">IIRC this will rename the resulting package (because there=
 will be only one shared library now).<div><br></div><div>that will probabl=
y break on device upgrade-path</div><div><br></div><div>I&#39;m not sure if=
 someone still cares about upgrade-paths.. there are too many issues going =
in unnoticed.</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail=
_quote">On Thu, Feb 18, 2016 at 8:21 PM, Andre McCurdy <span dir=3D"ltr">&l=
t;<a href=3D"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">libsoup-gnome i=
s entirely deprecated and has just been stubs since 2.42.<br>
<br>
Signed-off-by: Andre McCurdy &lt;<a href=3D"mailto:armccurdy@gmail.com">arm=
ccurdy@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-support/libsoup/<a href=3D"http://libsoup-2.4_2.52.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">libsoup-2.4_2.52.2.bb</a> | 5 ++---<b=
r>
=C2=A01 file changed, 2 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/recipes-support/libsoup/<a href=3D"http://libsoup-2.4_2.5=
2.2.bb" rel=3D"noreferrer" target=3D"_blank">libsoup-2.4_2.52.2.bb</a> b/me=
ta/recipes-support/libsoup/<a href=3D"http://libsoup-2.4_2.52.2.bb" rel=3D"=
noreferrer" target=3D"_blank">libsoup-2.4_2.52.2.bb</a><br>
index 865c1d7..a12f869 100644<br>
--- a/meta/recipes-support/libsoup/<a href=3D"http://libsoup-2.4_2.52.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">libsoup-2.4_2.52.2.bb</a><br>
+++ b/meta/recipes-support/libsoup/<a href=3D"http://libsoup-2.4_2.52.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">libsoup-2.4_2.52.2.bb</a><br>
@@ -18,9 +18,8 @@ S =3D &quot;${WORKDIR}/libsoup-${PV}&quot;<br>
<br>
=C2=A0inherit autotools gettext pkgconfig upstream-version-is-even<br>
<br>
-# libsoup-gnome is entirely deprecated and just stubs in 2.42 onwards.=C2=
=A0 Enable<br>
-# by default but let it be easily disabled.<br>
-PACKAGECONFIG ??=3D &quot;gnome&quot;<br>
+# libsoup-gnome is entirely deprecated and just stubs in 2.42 onwards. Dis=
able by default.<br>
+PACKAGECONFIG ??=3D &quot;&quot;<br>
=C2=A0PACKAGECONFIG[gnome] =3D &quot;--with-gnome,--without-gnome&quot;<br>
<br>
=C2=A0EXTRA_OECONF =3D &quot;--disable-vala&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div>

--001a1148e18c232dbe052c1085f1--
