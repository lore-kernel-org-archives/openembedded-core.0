Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
 by mx.groups.io with SMTP id smtpd.web12.10325.1608035919591579850
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Dec 2020 04:38:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tqbq3YnK;
 spf=pass (domain: gmail.com, ip: 209.85.222.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f51.google.com with SMTP id y21so6640184uag.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Dec 2020 04:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Hz6vKl+Hh6K7f+1or7VlQFKiYVAJI9+FmBdHAFF+mJg=;
        b=tqbq3YnK7K3IaSdeAaDAwDMsr0fN3NQHUkGkZWgW6y30Vf1GlNDiShkTix63rYw14m
         RALuFu7GBvwtnexFWESHHQGmeZkLoSiiwnwDsEKMlLy7C428+9IwjcZ61HAAFQR6mEM6
         9P37DHYc/kGEox6wUTvPK5AqQ5d3L71qYr27lsKy9FdHOvh2Lb4mrRimsxdG1VVlUztC
         6c3otbFWSGpL5YqI9lzBxKyRLJAY/rlxYOTQ7UgOWVjcxIv4QfSk3+UmLfI2uUyO9QTB
         rL+QvVdyyTI36p1YnmuOvv27UlERiBjvAnjzowVsqUWTY5kE2fN+kTKKdno9lZPAJ4Em
         i/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hz6vKl+Hh6K7f+1or7VlQFKiYVAJI9+FmBdHAFF+mJg=;
        b=hlzDR2PBpPbPbwyFTP9uYIYLdLrlD4RBloO23jhLCPrA02mYAOXsmHHhuKWqkKI2J+
         pc0tYQfyp/UrtcFzIltGg/Dls6Hr15TzPUhWz63bfa/aywtoXwkVOXdP5lybXvKqxX0g
         uc9l8pktAITI/ks6WEXoBzXRsEdmvFGDlk+18Zb0/VLKy0un8BL4lKdMmX3iASlD/ChD
         ELVg06DHX7Db6IK5KHxTQ9owBlHMpvXWbJRhWTvUQTonJCTtNgPl0qBhDM9hEm8Itsfc
         1hcENwnf81NO39LHqR7nJVwS2r0wKubb1lkBLv+pVJjOmOjS9Yg0q55qiCCqGafKNDvU
         EmQA==
X-Gm-Message-State: AOAM530mbdfIvxry+pdAPtlBeRV9qXyPZbbbjSGXeelVb32WRBZDjigd
	sc4FzKIeUlVljbWSv8YPlhoJALvw68em9UPLjYg=
X-Google-Smtp-Source: ABdhPJwKLJotmDDgxOP1210BkFf0k4zUW2JAfVo0KBDtK4iWoVwucuUvyOfvwWpjFLgrUC/NfyOMQgfolx/Sl8TlsmA=
X-Received: by 2002:ab0:1c0a:: with SMTP id a10mr26461845uaj.89.1608035918709;
 Tue, 15 Dec 2020 04:38:38 -0800 (PST)
MIME-Version: 1.0
References: <1608035161-62317-1-git-send-email-khairul.rohaizzat.jamaluddin@intel.com>
In-Reply-To: <1608035161-62317-1-git-send-email-khairul.rohaizzat.jamaluddin@intel.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 15 Dec 2020 13:38:27 +0100
Message-ID: <CANNYZj-wjrmD1gWwkj1JxZpPDZqAWyg3goZPKznaHs_iuzTAyA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssl: Update 1.1.1h -> 1.1.1i
To: "Jamaluddin, Khairul Rohaizzat" <khairul.rohaizzat.jamaluddin@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b8891805b680091a"

--000000000000b8891805b680091a
Content-Type: text/plain; charset="UTF-8"

Thanks, looks much better :)

Alex

On Tue, 15 Dec 2020 at 13:26, Jamaluddin, Khairul Rohaizzat <
khairul.rohaizzat.jamaluddin@intel.com> wrote:

> From: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com
> >
>
> update version to 1.1.1i
>
> openssl 1.1.1i Fixed NULL pointer deref in GENERAL_NAME_cmp (CVE-2020-1971)
>
> updates include fix for CVE:
> CVE-2020-1971
>
> Signed-off-by: Khairul Rohaizzat Jamaluddin <
> khairul.rohaizzat.jamaluddin@intel.com>
> ---
>  .../openssl/{openssl_1.1.1h.bb => openssl_1.1.1i.bb}
> | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-connectivity/openssl/{openssl_1.1.1h.bb =>
> openssl_1.1.1i.bb} (98%)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb
> b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
> similarity index 98%
> rename from meta/recipes-connectivity/openssl/openssl_1.1.1h.bb
> rename to meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
> index 1827167..52dbdf5 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
> @@ -23,7 +23,7 @@ SRC_URI_append_class-nativesdk = " \
>             file://environment.d-openssl.sh \
>             "
>
> -SRC_URI[sha256sum] =
> "5c9ca8774bd7b03e5784f26ae9e9e6d749c9da2438545077e6b3d755a06595d9"
> +SRC_URI[sha256sum] =
> "e8be6a35fe41d10603c3cc635e93289ed00bf34b79671a3a4de64fcee00d5242"
>
>  inherit lib_package multilib_header multilib_script ptest
>  MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
> --
> 2.7.4
>
>
> 
>
>

--000000000000b8891805b680091a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks, looks much better :)</div><div><br></div><div=
>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, 15 Dec 2020 at 13:26, Jamaluddin, Khairul Rohaizza=
t &lt;<a href=3D"mailto:khairul.rohaizzat.jamaluddin@intel.com">khairul.roh=
aizzat.jamaluddin@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">From: Khairul Rohaizzat Jamaluddin &lt;<a href=
=3D"mailto:khairul.rohaizzat.jamaluddin@intel.com" target=3D"_blank">khair=
ul.rohaizzat.jamaluddin@intel.com</a>&gt;<br>
<br>
update version to 1.1.1i<br>
<br>
openssl 1.1.1i Fixed NULL pointer deref in GENERAL_NAME_cmp (CVE-2020-1971=
)<br>
<br>
updates include fix for CVE:<br>
CVE-2020-1971<br>
<br>
Signed-off-by: Khairul Rohaizzat Jamaluddin &lt;<a href=3D"mailto:khairul.=
rohaizzat.jamaluddin@intel.com" target=3D"_blank">khairul.rohaizzat.jamalud=
din@intel.com</a>&gt;<br>
---<br>
=C2=A0.../openssl/{<a href=3D"http://openssl_1.1.1h.bb" rel=3D"noreferrer"=
 target=3D"_blank">openssl_1.1.1h.bb</a> =3D&gt; <a href=3D"http://openssl_=
1.1.1i.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.1.1i.bb</a>}=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<=
br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-connectivity/openssl/{<a href=3D"http://openssl_=
1.1.1h.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.1.1h.bb</a> =3D&g=
t; <a href=3D"http://openssl_1.1.1i.bb" rel=3D"noreferrer" target=3D"_blank=
">openssl_1.1.1i.bb</a>} (98%)<br>
<br>
diff --git a/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_1=
.1.1h.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.1.1h.bb</a> b/meta=
/recipes-connectivity/openssl/<a href=3D"http://openssl_1.1.1i.bb" rel=3D"n=
oreferrer" target=3D"_blank">openssl_1.1.1i.bb</a><br>
similarity index 98%<br>
rename from meta/recipes-connectivity/openssl/<a href=3D"http://openssl_1.=
1.1h.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.1.1h.bb</a><br>
rename to meta/recipes-connectivity/openssl/<a href=3D"http://openssl_1.1.=
1i.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.1.1i.bb</a><br>
index 1827167..52dbdf5 100644<br>
--- a/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_1.1.1h.b=
b" rel=3D"noreferrer" target=3D"_blank">openssl_1.1.1h.bb</a><br>
+++ b/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_1.1.1i.b=
b" rel=3D"noreferrer" target=3D"_blank">openssl_1.1.1i.bb</a><br>
@@ -23,7 +23,7 @@ SRC_URI_append_class-nativesdk =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://<a href=3D"http://environ=
ment.d-openssl.sh" rel=3D"noreferrer" target=3D"_blank">environment.d-opens=
sl.sh</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;5c9ca8774bd7b03e5784f26ae9e9e6d749c9da243854=
5077e6b3d755a06595d9&quot;<br>
+SRC_URI[sha256sum] =3D &quot;e8be6a35fe41d10603c3cc635e93289ed00bf34b7967=
1a3a4de64fcee00d5242&quot;<br>
<br>
=C2=A0inherit lib_package multilib_header multilib_script ptest<br>
=C2=A0MULTILIB_SCRIPTS =3D &quot;${PN}-bin:${bindir}/c_rehash&quot;<br>
-- <br>
2.7.4<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000b8891805b680091a--
