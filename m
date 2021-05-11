Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
 by mx.groups.io with SMTP id smtpd.web10.11151.1620732600834252102
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 May 2021 04:30:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=is7qammx;
 spf=pass (domain: gmail.com, ip: 209.85.222.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f45.google.com with SMTP id g24so6223085uak.11
        for <openembedded-core@lists.openembedded.org>; Tue, 11 May 2021 04:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZEf6/ywN6hWwba6/biRV8pA7Lb9dcwZzp80g5ag7lJA=;
        b=is7qammxJkqNFPmWuXVrRvJRVU/q7GqesDsCUFOTWRo7Kx8ozV072Hy2mAPjC8uEpP
         pBLfmWEN+hII6N0AEV8wYJJJIHWf0QgIvUWWJL9O+oYfmYJ6W5VEwkrPYev507+lV1BC
         LNSKSrMW+Mkrx2x1pXSnQIrbWRpYp1VXwYYd9VHg4IUu5WHKX8jdmhUA37yUmg11hsN4
         f3ezswss7VFwnK5kMAZ6Bqp1B1qXHRRJ84qESGv2kCRCFR4gLUxpCanpSYaAVb56ArvH
         zIJdlxGoWLhdpxXo26HPrzDsZfoyt1Lp1y+WANAHK41XLIsOnTnMHiBxodz3UGyaK002
         D/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZEf6/ywN6hWwba6/biRV8pA7Lb9dcwZzp80g5ag7lJA=;
        b=J3t/WgH9TG6o/Mg3Xc21fCDPh+IWvrqH5+XOxQeUH4He1p5hmID2Mc8fcE0wVvGePc
         liiZGpktyN2UewuDyjGztr5HD+ykqZqmfAUALU0LFwYIuyvc9IkqEU9agpnb/CIT+Sg7
         BDMgTuJ3a6Gbkzo9QzDy45Q0PZmHXTe01BZLzkFXLRC5vAtqPlB8DfdDdw6I9X0o5LSr
         3yHdVADQDw/44aXCd0nglZgshR3bqBKzi3VWCD/0joZSQvmQ22UQkqwxj128yCX3gTpC
         mNEIQ2FXacR0q842StoS6e1A2MVMy1gkmW1OtSmsjNdfnzUtREZvvoqtOhRrFtR6o2cB
         tNtw==
X-Gm-Message-State: AOAM5317kdUuQC7YoKIRerAI/5zBeDPDjjo1Y1Cgo+zdF93GrK/3Z1BB
	jJUvB5H7xvRrZdiqB3jUuWXqcRVNNxOeuPbfmh0=
X-Google-Smtp-Source: ABdhPJxlJRdyy1Dtnus2Z2enHAoT1tC77oPnLRGC9pqcQlmt+kXZitDL147Hf0KHsxrCeO93LyGS7ILG5cX91eqhJvs=
X-Received: by 2002:ab0:77c1:: with SMTP id y1mr24933258uar.89.1620732599395;
 Tue, 11 May 2021 04:29:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210511053907.246803-1-robert.joslyn@redrectangle.org>
In-Reply-To: <20210511053907.246803-1-robert.joslyn@redrectangle.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 11 May 2021 13:29:48 +0200
Message-ID: <CANNYZj8wmXHEScrv6PU=QBeRr-_XUK7=WVmGYQG-OTdk0DpaZQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] epiphany: Update to 40.1
To: Robert Joslyn <robert.joslyn@redrectangle.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000dce71305c20c36a5"

--000000000000dce71305c20c36a5
Content-Type: text/plain; charset="UTF-8"

Thanks Robert, I guess we should drop upstream-version-is-even from all
gnome recipes which I'll take care of - these new 40.x versions weren't
properly reported somehow.

Alex

On Tue, 11 May 2021 at 07:39, Robert Joslyn <robert.joslyn@redrectangle.org>
wrote:

> Refresh patch and adjust version directory for new version numbering
> scheme. Add new dependency on libarchive.
>
> Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
> ---
>  .../epiphany/{epiphany_3.38.3.bb => epiphany_40.1.bb}     | 7 ++++---
>  .../0002-help-meson.build-disable-the-use-of-yelp.patch   | 8 ++++----
>  2 files changed, 8 insertions(+), 7 deletions(-)
>  rename meta/recipes-gnome/epiphany/{epiphany_3.38.3.bb =>
> epiphany_40.1.bb} (82%)
>
> diff --git a/meta/recipes-gnome/epiphany/epiphany_3.38.3.bb
> b/meta/recipes-gnome/epiphany/epiphany_40.1.bb
> similarity index 82%
> rename from meta/recipes-gnome/epiphany/epiphany_3.38.3.bb
> rename to meta/recipes-gnome/epiphany/epiphany_40.1.bb
> index ce24336ace..e1e3ad7868 100644
> --- a/meta/recipes-gnome/epiphany/epiphany_3.38.3.bb
> +++ b/meta/recipes-gnome/epiphany/epiphany_40.1.bb
> @@ -8,18 +8,19 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>
>  DEPENDS = "libsoup-2.4 webkitgtk gtk+3 iso-codes avahi libnotify gcr
> gnutls \
>            gsettings-desktop-schemas libxml2-native \
> -          glib-2.0 glib-2.0-native json-glib libdazzle libhandy libportal"
> +          glib-2.0 glib-2.0-native json-glib libdazzle libhandy libportal
> \
> +          libarchive"
>
>  GNOMEBASEBUILDCLASS = "meson"
>  inherit gnomebase gsettings features_check upstream-version-is-even
> gettext mime-xdg
>  REQUIRED_DISTRO_FEATURES = "x11 opengl"
>
> -SRC_URI =
> "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive
> \
> +SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}",
> 1)}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
>             file://0002-help-meson.build-disable-the-use-of-yelp.patch \
>             file://migrator.patch \
>             file://distributor.patch \
>             "
> -SRC_URI[archive.sha256sum] =
> "ce62c1fa3e442a9d6131fc884a6bc9a65cf06224c30d649c49624c2ebcb0d275"
> +SRC_URI[archive.sha256sum] =
> "696a426b1702774af8d0f056828f5d9ff9350507aba7f4c7e3e499f07a581ad0"
>
>  # Developer mode enables debugging
>  PACKAGECONFIG[developer-mode] =
> "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
> diff --git
> a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
> b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
> index 118b5d1825..a6c4f92c86 100644
> ---
> a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
> +++
> b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
> @@ -1,4 +1,4 @@
> -From 3725c254f1d1d8204fa299e71c1e2bfd0ff6a634 Mon Sep 17 00:00:00 2001
> +From 77c9f87dc2b3ad0854a678e234e22dfb31902b82 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Wed, 31 Jan 2018 15:50:38 +0200
>  Subject: [PATCH] help/meson.build: disable the use of yelp
> @@ -13,11 +13,11 @@ Signed-off-by: Alexander Kanavin <
> alex.kanavin@gmail.com>
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
>  diff --git a/help/meson.build b/help/meson.build
> -index 484860c..d9b2e80 100644
> +index ff324dd..f5e421d 100644
>  --- a/help/meson.build
>  +++ b/help/meson.build
> -@@ -32,7 +32,7 @@ help_media = [
> -   'media/epiphany-private-3-36.png'
> +@@ -31,7 +31,7 @@ help_media = [
> +   'media/org.gnome.Epiphany.svg'
>   ]
>
>  -gnome.yelp(meson.project_name(),
> --
> 2.26.3
>
>
> 
>
>

--000000000000dce71305c20c36a5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks Robert, I guess we should drop upstream-versio=
n-is-even from all gnome recipes which I&#39;ll take care of - these new 40=
.x versions weren&#39;t properly reported somehow.</div><div><br></div><div=
>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, 11 May 2021 at 07:39, Robert Joslyn &lt;<a href=3D=
"mailto:robert.joslyn@redrectangle.org">robert.joslyn@redrectangle.org</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Refre=
sh patch and adjust version directory for new version numbering<br>
scheme. Add new dependency on libarchive.<br>
<br>
Signed-off-by: Robert Joslyn &lt;<a href=3D"mailto:robert.joslyn@redrectan=
gle.org" target=3D"_blank">robert.joslyn@redrectangle.org</a>&gt;<br>
---<br>
=C2=A0.../epiphany/{<a href=3D"http://epiphany_3.38.3.bb" rel=3D"noreferre=
r" target=3D"_blank">epiphany_3.38.3.bb</a> =3D&gt; <a href=3D"http://epiph=
any_40.1.bb" rel=3D"noreferrer" target=3D"_blank">epiphany_40.1.bb</a>}=C2=
=A0 =C2=A0 =C2=A0| 7 ++++---<br>
=C2=A0.../0002-help-meson.build-disable-the-use-of-yelp.patch=C2=A0 =C2=A0=
| 8 ++++----<br>
=C2=A02 files changed, 8 insertions(+), 7 deletions(-)<br>
=C2=A0rename meta/recipes-gnome/epiphany/{<a href=3D"http://epiphany_3.38.=
3.bb" rel=3D"noreferrer" target=3D"_blank">epiphany_3.38.3.bb</a> =3D&gt; <=
a href=3D"http://epiphany_40.1.bb" rel=3D"noreferrer" target=3D"_blank">epi=
phany_40.1.bb</a>} (82%)<br>
<br>
diff --git a/meta/recipes-gnome/epiphany/<a href=3D"http://epiphany_3.38.3=
.bb" rel=3D"noreferrer" target=3D"_blank">epiphany_3.38.3.bb</a> b/meta/rec=
ipes-gnome/epiphany/<a href=3D"http://epiphany_40.1.bb" rel=3D"noreferrer" =
target=3D"_blank">epiphany_40.1.bb</a><br>
similarity index 82%<br>
rename from meta/recipes-gnome/epiphany/<a href=3D"http://epiphany_3.38.3.=
bb" rel=3D"noreferrer" target=3D"_blank">epiphany_3.38.3.bb</a><br>
rename to meta/recipes-gnome/epiphany/<a href=3D"http://epiphany_40.1.bb" =
rel=3D"noreferrer" target=3D"_blank">epiphany_40.1.bb</a><br>
index ce24336ace..e1e3ad7868 100644<br>
--- a/meta/recipes-gnome/epiphany/<a href=3D"http://epiphany_3.38.3.bb" re=
l=3D"noreferrer" target=3D"_blank">epiphany_3.38.3.bb</a><br>
+++ b/meta/recipes-gnome/epiphany/<a href=3D"http://epiphany_40.1.bb" rel=
=3D"noreferrer" target=3D"_blank">epiphany_40.1.bb</a><br>
@@ -8,18 +8,19 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dd32239bc=
b673463ab874e80d47fae504&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;libsoup-2.4 webkitgtk gtk+3 iso-codes avahi libnot=
ify gcr gnutls \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gsettings-desktop-schemas libxml2=
-native \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 glib-2.0 glib-2.0-native json-glib lib=
dazzle libhandy libportal&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 glib-2.0 glib-2.0-native json-glib lib=
dazzle libhandy libportal \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libarchive&quot;<br>
<br>
=C2=A0GNOMEBASEBUILDCLASS =3D &quot;meson&quot;<br>
=C2=A0inherit gnomebase gsettings features_check upstream-version-is-even =
gettext mime-xdg<br>
=C2=A0REQUIRED_DISTRO_FEATURES =3D &quot;x11 opengl&quot;<br>
<br>
-SRC_URI =3D &quot;${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir(&quot;${PV}&=
quot;)}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=3Darchive \<br>
+SRC_URI =3D &quot;${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version(&qu=
ot;${PV}&quot;, 1)}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=3Darch=
ive \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-help-meson.build-dis=
able-the-use-of-yelp.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://migrator.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://distributor.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[archive.sha256sum] =3D &quot;ce62c1fa3e442a9d6131fc884a6bc9a65cf0=
6224c30d649c49624c2ebcb0d275&quot;<br>
+SRC_URI[archive.sha256sum] =3D &quot;696a426b1702774af8d0f056828f5d9ff935=
0507aba7f4c7e3e499f07a581ad0&quot;<br>
<br>
=C2=A0# Developer mode enables debugging<br>
=C2=A0PACKAGECONFIG[developer-mode] =3D &quot;-Ddeveloper_mode=3Dtrue,-Dde=
veloper_mode=3Dfalse&quot;<br>
diff --git a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disab=
le-the-use-of-yelp.patch b/meta/recipes-gnome/epiphany/files/0002-help-meso=
n.build-disable-the-use-of-yelp.patch<br>
index 118b5d1825..a6c4f92c86 100644<br>
--- a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-=
use-of-yelp.patch<br>
+++ b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-=
use-of-yelp.patch<br>
@@ -1,4 +1,4 @@<br>
-From 3725c254f1d1d8204fa299e71c1e2bfd0ff6a634 Mon Sep 17 00:00:00 2001<br=
>
+From 77c9f87dc2b3ad0854a678e234e22dfb31902b82 Mon Sep 17 00:00:00 2001<br=
>
=C2=A0From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com=
" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
=C2=A0Date: Wed, 31 Jan 2018 15:50:38 +0200<br>
=C2=A0Subject: [PATCH] help/meson.build: disable the use of yelp<br>
@@ -13,11 +13,11 @@ Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto=
:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<b=
r>
=C2=A0 1 file changed, 4 insertions(+), 4 deletions(-)<br>
<br>
=C2=A0diff --git a/help/meson.build b/help/meson.build<br>
-index 484860c..d9b2e80 100644<br>
+index ff324dd..f5e421d 100644<br>
=C2=A0--- a/help/meson.build<br>
=C2=A0+++ b/help/meson.build<br>
-@@ -32,7 +32,7 @@ help_media =3D [<br>
-=C2=A0 =C2=A0&#39;media/epiphany-private-3-36.png&#39;<br>
+@@ -31,7 +31,7 @@ help_media =3D [<br>
+=C2=A0 =C2=A0&#39;media/org.gnome.Epiphany.svg&#39;<br>
=C2=A0 ]<br>
<br>
=C2=A0-gnome.yelp(meson.project_name(),<br>
-- <br>
2.26.3<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000dce71305c20c36a5--
