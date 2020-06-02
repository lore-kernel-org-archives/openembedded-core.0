Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com [209.85.217.66])
 by mx.groups.io with SMTP id smtpd.web11.9411.1591100920731879924
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 05:28:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XmSqOtgS;
 spf=pass (domain: gmail.com, ip: 209.85.217.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f66.google.com with SMTP id y123so1902453vsb.6
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2020 05:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mdx+FOqKj2VGC9rjBya/9v3ROiQkQfauvz5Df/VNAiM=;
        b=XmSqOtgSbT409BgYLsTCyI05ys+MXSwMpXUjzIml1YzrWjbx77xkV1Vv/8MdIYZPaD
         hkjEpY9HbyXen6JdjEhEjHpJyQ2Lr6vRpXdwr+GspbDm4fGKbR63uSUsjMi5+jfeEql7
         f7u4fyaBXex7HO7lAjWlCRhvOaBGGxLaGTXLsAjUgwmL8ErBLmGxaJIvtda+oShNVrSh
         o25ONt2iFmuns8ZLmHTmDeboFZWoavKnqGQovsp1uVsXN4LVYpNW8j1wMuSq0nO6Q/Rz
         ySG6L9vGA0sxlfDDTdLlJhTCQXJy2gEAKETF8oZ1CUQT2+US4UIV3qgroLDLl5nDPh8j
         jknA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mdx+FOqKj2VGC9rjBya/9v3ROiQkQfauvz5Df/VNAiM=;
        b=HpItCmaAXDRd8Uo+sR+MlJzdBkJp8GjoNF54s3Yg7CeKfSeG3VNUq2rO42v6euQslj
         9OIy7EXMKVNKWRn+7mZSND9NyxXNSsk7z4T+ul8OeF8Cv/oluz6hFMFk/zHrFEXhGNgr
         wcLCxMNT+qaVU1cJWECmhOiZqOF78jrgOL5gAzBx/Hp15Y44Q0hSVum1Tm+i0GLPQQba
         Bw+g3nT+Vix1jTOeejSbCDsAN0ILjn7CljO4sBeskuUczYcY6COkLVKihxK1BcbOs9nX
         GkPOrFlVDBt/E8gErnEib5ex3ySGQI4mNVv4VY07OLunN8nfyeYcQ2xV/Z99NP8dg1P8
         +wZg==
X-Gm-Message-State: AOAM531fGxKgPwrHPbRqMl+RDAJrSsBPpVquI/RV0M5SpMzNO3Ajj6ls
	wNxDw1fpKyyqkGlXk16RbdgUjPqfwnCSpFlQ9lg=
X-Google-Smtp-Source: ABdhPJyR9DNRTZWW5GKp27TJ9bTaXp8r0o/GK97OFnaFiwhvUNhEBgXBZebolBFCFoTV4fAHUPgzOg2lRbazUdvbCyo=
X-Received: by 2002:a67:d098:: with SMTP id s24mr17623728vsi.25.1591100919943;
 Tue, 02 Jun 2020 05:28:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200602122614.53886-1-chee.yang.lee@intel.com>
In-Reply-To: <20200602122614.53886-1-chee.yang.lee@intel.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 2 Jun 2020 14:28:28 +0200
Message-ID: <CANNYZj-zYtosSsFHWK_XLbnG0oG4BZBkLrkkutuL6Lk4subOTg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glib-networking: 2.64.2 -> 2.64.3
To: Lee Chee Yang <chee.yang.lee@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002295b305a7190d70"

--0000000000002295b305a7190d70
Content-Type: text/plain; charset="UTF-8"

Can you update the main glib recipe at the same time please? We can't have
glib-networking that is newer than the main glib recipe.

Alex

On Tue, 2 Jun 2020 at 14:26, Lee Chee Yang <chee.yang.lee@intel.com> wrote:

> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> update to 2.64.3 which include fix for CVE-2020-13645, see:
> https://gitlab.gnome.org/GNOME/glib-networking/-/issues/135
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ---
>  .../{glib-networking_2.64.2.bb => glib-networking_2.64.3.bb}  | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-core/glib-networking/{glib-networking_2.64.2.bb =>
> glib-networking_2.64.3.bb} (88%)
>
> diff --git a/meta/recipes-core/glib-networking/glib-networking_2.64.2.bb
> b/meta/recipes-core/glib-networking/glib-networking_2.64.3.bb
> similarity index 88%
> rename from meta/recipes-core/glib-networking/glib-networking_2.64.2.bb
> rename to meta/recipes-core/glib-networking/glib-networking_2.64.3.bb
> index 8300d20e0c..a79e0e4988 100644
> --- a/meta/recipes-core/glib-networking/glib-networking_2.64.2.bb
> +++ b/meta/recipes-core/glib-networking/glib-networking_2.64.3.bb
> @@ -9,8 +9,8 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
>  SECTION = "libs"
>  DEPENDS = "glib-2.0"
>
> -SRC_URI[archive.md5sum] = "7f8c7ffe2616be4ef4232f2574353dab"
> -SRC_URI[archive.sha256sum] =
> "45def0715c551f9b0b41a4e4f730ac95f3d5d4f3de8162260fbf9421cff695a7"
> +SRC_URI[archive.md5sum] = "eb382907ec941fe2fb1a9676b75acf7a"
> +SRC_URI[archive.sha256sum] =
> "937a06b124052813bfc0b0b86bff42016ff01067582e1aca65bb6dbe0845a168"
>
>  PACKAGECONFIG ??= "gnutls"
>
> --
> 2.17.1
>
> 
>

--0000000000002295b305a7190d70
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Can you update the main glib recipe at the same time =
please? We can&#39;t have glib-networking that is newer than the main glib =
recipe.</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 2 Jun 2020 at 14:26,=
 Lee Chee Yang &lt;<a href=3D"mailto:chee.yang.lee@intel.com">chee.yang.lee=
@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">From: Lee Chee Yang &lt;<a href=3D"mailto:chee.yang.lee@intel.c=
om" target=3D"_blank">chee.yang.lee@intel.com</a>&gt;<br>
<br>
update to 2.64.3 which include fix for CVE-2020-13645, see:<br>
<a href=3D"https://gitlab.gnome.org/GNOME/glib-networking/-/issues/135" re=
l=3D"noreferrer" target=3D"_blank">https://gitlab.gnome.org/GNOME/glib-netw=
orking/-/issues/135</a><br>
<br>
Signed-off-by: Lee Chee Yang &lt;<a href=3D"mailto:chee.yang.lee@intel.com=
" target=3D"_blank">chee.yang.lee@intel.com</a>&gt;<br>
---<br>
=C2=A0.../{<a href=3D"http://glib-networking_2.64.2.bb" rel=3D"noreferrer"=
 target=3D"_blank">glib-networking_2.64.2.bb</a> =3D&gt; <a href=3D"http://=
glib-networking_2.64.3.bb" rel=3D"noreferrer" target=3D"_blank">glib-networ=
king_2.64.3.bb</a>}=C2=A0 | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-core/glib-networking/{<a href=3D"http://glib-net=
working_2.64.2.bb" rel=3D"noreferrer" target=3D"_blank">glib-networking_2.6=
4.2.bb</a> =3D&gt; <a href=3D"http://glib-networking_2.64.3.bb" rel=3D"nore=
ferrer" target=3D"_blank">glib-networking_2.64.3.bb</a>} (88%)<br>
<br>
diff --git a/meta/recipes-core/glib-networking/<a href=3D"http://glib-netw=
orking_2.64.2.bb" rel=3D"noreferrer" target=3D"_blank">glib-networking_2.64=
.2.bb</a> b/meta/recipes-core/glib-networking/<a href=3D"http://glib-networ=
king_2.64.3.bb" rel=3D"noreferrer" target=3D"_blank">glib-networking_2.64.3=
.bb</a><br>
similarity index 88%<br>
rename from meta/recipes-core/glib-networking/<a href=3D"http://glib-netwo=
rking_2.64.2.bb" rel=3D"noreferrer" target=3D"_blank">glib-networking_2.64.=
2.bb</a><br>
rename to meta/recipes-core/glib-networking/<a href=3D"http://glib-network=
ing_2.64.3.bb" rel=3D"noreferrer" target=3D"_blank">glib-networking_2.64.3.=
bb</a><br>
index 8300d20e0c..a79e0e4988 100644<br>
--- a/meta/recipes-core/glib-networking/<a href=3D"http://glib-networking_=
2.64.2.bb" rel=3D"noreferrer" target=3D"_blank">glib-networking_2.64.2.bb</=
a><br>
+++ b/meta/recipes-core/glib-networking/<a href=3D"http://glib-networking_=
2.64.3.bb" rel=3D"noreferrer" target=3D"_blank">glib-networking_2.64.3.bb</=
a><br>
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D4fbd65380c=
dd255951079008b364516c&quot;<br>
=C2=A0SECTION =3D &quot;libs&quot;<br>
=C2=A0DEPENDS =3D &quot;glib-2.0&quot;<br>
<br>
-SRC_URI[archive.md5sum] =3D &quot;7f8c7ffe2616be4ef4232f2574353dab&quot;<=
br>
-SRC_URI[archive.sha256sum] =3D &quot;45def0715c551f9b0b41a4e4f730ac95f3d5=
d4f3de8162260fbf9421cff695a7&quot;<br>
+SRC_URI[archive.md5sum] =3D &quot;eb382907ec941fe2fb1a9676b75acf7a&quot;<=
br>
+SRC_URI[archive.sha256sum] =3D &quot;937a06b124052813bfc0b0b86bff42016ff0=
1067582e1aca65bb6dbe0845a168&quot;<br>
<br>
=C2=A0PACKAGECONFIG ??=3D &quot;gnutls&quot;<br>
<br>
-- <br>
2.17.1<br>
<br>
<br>
</blockquote></div>

--0000000000002295b305a7190d70--
