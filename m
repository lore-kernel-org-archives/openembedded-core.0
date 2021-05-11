Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
 by mx.groups.io with SMTP id smtpd.web08.13561.1620742664514946752
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 May 2021 07:17:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tYGLR6mc;
 spf=pass (domain: gmail.com, ip: 209.85.221.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f176.google.com with SMTP id n7so4067060vkl.2
        for <openembedded-core@lists.openembedded.org>; Tue, 11 May 2021 07:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ii2wN1t1FGb0yVUNqUnt5OQgm3OWWd1MvetoiKvXBqU=;
        b=tYGLR6mcc77+7ZYbIruUSDcfjTqJ3iuKF5pDtFeUmwsYNhjV/E0NrQb7U2bs7zyoBD
         M7/yVBvFtJO9Xnb6rGntUdCEPGijTQ9sjOZjoi8IHuDB4kmZwVGMREUpfTTLBhlcxhQv
         /Mnf9dDZg/91ZqCWU973oCJX4TdJgyNYtWqUVkYEOc5NmcI0ioGaYB+HZ8pfZiYTHdAa
         OLakqNx8a4Duxb4tRyT3phUdie1rjIYYOhMfn6hJ6xkjRapxrv3lFqVkEb1CZvWoMWqm
         9xLIlIuhZmGbzWYqD25RIdPWkxVKkuRPYakB216EElFd9nCExeE0xwKSIHDwKwujDuWe
         JEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ii2wN1t1FGb0yVUNqUnt5OQgm3OWWd1MvetoiKvXBqU=;
        b=Qi/7NbjYssx3VTSPr0pvApg3RdNX0GR/hhfWdhIET3K9U61Adr70Xl9S3QbSYGGF6o
         tVhOKO8XeOtdPsWXjui/p850rmSmqg9Y145vtE6XLCB/j/yES2X/256B4JA6bqetbD8z
         2aduEbjHzqZ3jegGIHIbqHt4sRlacgrLx49us14EHsHIeTx9dZZ/WaKZNpfuZMy4E/CP
         LSQzDJZpDoNVm8apGq3sBIp85RcBzv0pVJISGozEugv1mIwFOt8UZMqGAW3Sf/OTOT8h
         GZ8oIQGwzF/b28IiKPYf+akmTA5jAkpnOi89AkDL2COP4dOZXV2weDHnzOCiO5qWtWwD
         SjeQ==
X-Gm-Message-State: AOAM531QIFXKfqAZnJlat5D9K1bCo2WnqlpwQNXbTtFP0akHS+28BjAO
	eZN+Ix8sEO9mFDaaE0nL3PK+Uzu5UP4Fqqxriy8=
X-Google-Smtp-Source: ABdhPJxn9SwkDBRyJly41EZBFPquIGeCr6ujJTdnrMHcYIl1EyPGpAimXCS2Zyaz701Dv0MAmcOKl2f1rjyrL1N+kp8=
X-Received: by 2002:a1f:5506:: with SMTP id j6mr22684638vkb.7.1620742663584;
 Tue, 11 May 2021 07:17:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210511053907.246803-1-robert.joslyn@redrectangle.org>
 <CANNYZj8wmXHEScrv6PU=QBeRr-_XUK7=WVmGYQG-OTdk0DpaZQ@mail.gmail.com> <5C41FDD2-7471-47F6-B92B-B0BD4AA79865@redrectangle.org>
In-Reply-To: <5C41FDD2-7471-47F6-B92B-B0BD4AA79865@redrectangle.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 11 May 2021 16:17:32 +0200
Message-ID: <CANNYZj9j9G51jXwydezFPdctyJ_F5GBhpCXSnTQfvpg6qDjZYw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] epiphany: Update to 40.1
To: Robert Joslyn <robert.joslyn@redrectangle.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000bc3f7705c20e8e99"

--000000000000bc3f7705c20e8e99
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I've already sent a patch, so no need I guess.

Alex

On Tue, 11 May 2021 at 15:44, Robert Joslyn <robert.joslyn@redrectangle.or=
g>
wrote:

>
> > On May 11, 2021, at 4:29 AM, Alexander Kanavin <alex.kanavin@gmail.com=
>
> wrote:
> >
> > Thanks Robert, I guess we should drop upstream-version-is-even from al=
l
> gnome recipes which I'll take care of - these new 40.x versions weren't
> properly reported somehow.
> >
> > Alex
>
> That=E2=80=99s a good point, the new versioning scheme doesn=E2=80=99t d=
o the even is
> release, odd is development thing anymore. I can send a v3, or a separat=
e
> patch if that=E2=80=99s easier since v2 is already on master-next.
>
> Thanks,
> Robert
>
> > On Tue, 11 May 2021 at 07:39, Robert Joslyn <
> robert.joslyn@redrectangle.org> wrote:
> > Refresh patch and adjust version directory for new version numbering
> > scheme. Add new dependency on libarchive.
> >
> > Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
> > ---
> >  .../epiphany/{epiphany_3.38.3.bb =3D> epiphany_40.1.bb}     | 7 ++++-=
--
> >  .../0002-help-meson.build-disable-the-use-of-yelp.patch   | 8 ++++---=
-
> >  2 files changed, 8 insertions(+), 7 deletions(-)
> >  rename meta/recipes-gnome/epiphany/{epiphany_3.38.3.bb =3D>
> epiphany_40.1.bb} (82%)
> >
> > diff --git a/meta/recipes-gnome/epiphany/epiphany_3.38.3.bb
> b/meta/recipes-gnome/epiphany/epiphany_40.1.bb
> > similarity index 82%
> > rename from meta/recipes-gnome/epiphany/epiphany_3.38.3.bb
> > rename to meta/recipes-gnome/epiphany/epiphany_40.1.bb
> > index ce24336ace..e1e3ad7868 100644
> > --- a/meta/recipes-gnome/epiphany/epiphany_3.38.3.bb
> > +++ b/meta/recipes-gnome/epiphany/epiphany_40.1.bb
> > @@ -8,18 +8,19 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae504"
> >
> >  DEPENDS =3D "libsoup-2.4 webkitgtk gtk+3 iso-codes avahi libnotify gc=
r
> gnutls \
> >            gsettings-desktop-schemas libxml2-native \
> > -          glib-2.0 glib-2.0-native json-glib libdazzle libhandy
> libportal"
> > +          glib-2.0 glib-2.0-native json-glib libdazzle libhandy
> libportal \
> > +          libarchive"
> >
> >  GNOMEBASEBUILDCLASS =3D "meson"
> >  inherit gnomebase gsettings features_check upstream-version-is-even
> gettext mime-xdg
> >  REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
> >
> > -SRC_URI =3D
> "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.t=
ar.${GNOME_COMPRESS_TYPE};name=3Darchive
> \
> > +SRC_URI =3D "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${P=
V}",
> 1)}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=3Darchive \
> >             file://0002-help-meson.build-disable-the-use-of-yelp.patch=
 \
> >             file://migrator.patch \
> >             file://distributor.patch \
> >             "
> > -SRC_URI[archive.sha256sum] =3D
> "ce62c1fa3e442a9d6131fc884a6bc9a65cf06224c30d649c49624c2ebcb0d275"
> > +SRC_URI[archive.sha256sum] =3D
> "696a426b1702774af8d0f056828f5d9ff9350507aba7f4c7e3e499f07a581ad0"
> >
> >  # Developer mode enables debugging
> >  PACKAGECONFIG[developer-mode] =3D
> "-Ddeveloper_mode=3Dtrue,-Ddeveloper_mode=3Dfalse"
> > diff --git
> a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-us=
e-of-yelp.patch
> b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-us=
e-of-yelp.patch
> > index 118b5d1825..a6c4f92c86 100644
> > ---
> a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-us=
e-of-yelp.patch
> > +++
> b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-us=
e-of-yelp.patch
> > @@ -1,4 +1,4 @@
> > -From 3725c254f1d1d8204fa299e71c1e2bfd0ff6a634 Mon Sep 17 00:00:00 200=
1
> > +From 77c9f87dc2b3ad0854a678e234e22dfb31902b82 Mon Sep 17 00:00:00 200=
1
> >  From: Alexander Kanavin <alex.kanavin@gmail.com>
> >  Date: Wed, 31 Jan 2018 15:50:38 +0200
> >  Subject: [PATCH] help/meson.build: disable the use of yelp
> > @@ -13,11 +13,11 @@ Signed-off-by: Alexander Kanavin <
> alex.kanavin@gmail.com>
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> >
> >  diff --git a/help/meson.build b/help/meson.build
> > -index 484860c..d9b2e80 100644
> > +index ff324dd..f5e421d 100644
> >  --- a/help/meson.build
> >  +++ b/help/meson.build
> > -@@ -32,7 +32,7 @@ help_media =3D [
> > -   'media/epiphany-private-3-36.png'
> > +@@ -31,7 +31,7 @@ help_media =3D [
> > +   'media/org.gnome.Epiphany.svg'
> >   ]
> >
> >  -gnome.yelp(meson.project_name(),
> > --
> > 2.26.3
> >
> >
> >=20
> >
>
>

--000000000000bc3f7705c20e8e99
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;ve already sent a patch, so no need I guess.</d=
iv><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Tue, 11 May 2021 at 15:44, Robert J=
oslyn &lt;<a href=3D"mailto:robert.joslyn@redrectangle.org">robert.joslyn@r=
edrectangle.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><br>
&gt; On May 11, 2021, at 4:29 AM, Alexander Kanavin &lt;<a href=3D"mailto:=
alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wr=
ote:<br>
&gt; <br>
&gt; Thanks Robert, I guess we should drop upstream-version-is-even from a=
ll gnome recipes which I&#39;ll take care of - these new 40.x versions were=
n&#39;t properly reported somehow.<br>
&gt; <br>
&gt; Alex<br>
<br>
That=E2=80=99s a good point, the new versioning scheme doesn=E2=80=99t do =
the even is release, odd is development thing anymore. I can send a v3, or =
a separate patch if that=E2=80=99s easier since v2 is already on master-nex=
t.<br>
<br>
Thanks,<br>
Robert<br>
<br>
&gt; On Tue, 11 May 2021 at 07:39, Robert Joslyn &lt;<a href=3D"mailto:rob=
ert.joslyn@redrectangle.org" target=3D"_blank">robert.joslyn@redrectangle.o=
rg</a>&gt; wrote:<br>
&gt; Refresh patch and adjust version directory for new version numbering<=
br>
&gt; scheme. Add new dependency on libarchive.<br>
&gt; <br>
&gt; Signed-off-by: Robert Joslyn &lt;<a href=3D"mailto:robert.joslyn@redr=
ectangle.org" target=3D"_blank">robert.joslyn@redrectangle.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../epiphany/{<a href=3D"http://epiphany_3.38.3.bb" rel=3D"nore=
ferrer" target=3D"_blank">epiphany_3.38.3.bb</a> =3D&gt; <a href=3D"http://=
epiphany_40.1.bb" rel=3D"noreferrer" target=3D"_blank">epiphany_40.1.bb</a>=
}=C2=A0 =C2=A0 =C2=A0| 7 ++++---<br>
&gt;=C2=A0 .../0002-help-meson.build-disable-the-use-of-yelp.patch=C2=A0 =
=C2=A0| 8 ++++----<br>
&gt;=C2=A0 2 files changed, 8 insertions(+), 7 deletions(-)<br>
&gt;=C2=A0 rename meta/recipes-gnome/epiphany/{<a href=3D"http://epiphany_=
3.38.3.bb" rel=3D"noreferrer" target=3D"_blank">epiphany_3.38.3.bb</a> =3D&=
gt; <a href=3D"http://epiphany_40.1.bb" rel=3D"noreferrer" target=3D"_blank=
">epiphany_40.1.bb</a>} (82%)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-gnome/epiphany/<a href=3D"http://epiphany_3=
.38.3.bb" rel=3D"noreferrer" target=3D"_blank">epiphany_3.38.3.bb</a> b/met=
a/recipes-gnome/epiphany/<a href=3D"http://epiphany_40.1.bb" rel=3D"norefer=
rer" target=3D"_blank">epiphany_40.1.bb</a><br>
&gt; similarity index 82%<br>
&gt; rename from meta/recipes-gnome/epiphany/<a href=3D"http://epiphany_3.=
38.3.bb" rel=3D"noreferrer" target=3D"_blank">epiphany_3.38.3.bb</a><br>
&gt; rename to meta/recipes-gnome/epiphany/<a href=3D"http://epiphany_40.1=
.bb" rel=3D"noreferrer" target=3D"_blank">epiphany_40.1.bb</a><br>
&gt; index ce24336ace..e1e3ad7868 100644<br>
&gt; --- a/meta/recipes-gnome/epiphany/<a href=3D"http://epiphany_3.38.3.b=
b" rel=3D"noreferrer" target=3D"_blank">epiphany_3.38.3.bb</a><br>
&gt; +++ b/meta/recipes-gnome/epiphany/<a href=3D"http://epiphany_40.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">epiphany_40.1.bb</a><br>
&gt; @@ -8,18 +8,19 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dd32=
239bcb673463ab874e80d47fae504&quot;<br>
&gt; <br>
&gt;=C2=A0 DEPENDS =3D &quot;libsoup-2.4 webkitgtk gtk+3 iso-codes avahi l=
ibnotify gcr gnutls \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gsettings-desktop-schemas li=
bxml2-native \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 glib-2.0 glib-2.0-native json-gli=
b libdazzle libhandy libportal&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 glib-2.0 glib-2.0-native json-gli=
b libdazzle libhandy libportal \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libarchive&quot;<br>
&gt; <br>
&gt;=C2=A0 GNOMEBASEBUILDCLASS =3D &quot;meson&quot;<br>
&gt;=C2=A0 inherit gnomebase gsettings features_check upstream-version-is-=
even gettext mime-xdg<br>
&gt;=C2=A0 REQUIRED_DISTRO_FEATURES =3D &quot;x11 opengl&quot;<br>
&gt; <br>
&gt; -SRC_URI =3D &quot;${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir(&quot;$=
{PV}&quot;)}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=3Darchive \<b=
r>
&gt; +SRC_URI =3D &quot;${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_versio=
n(&quot;${PV}&quot;, 1)}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=
=3Darchive \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-help-meson=
.build-disable-the-use-of-yelp.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://migrator.patch =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://distributor.pat=
ch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; -SRC_URI[archive.sha256sum] =3D &quot;ce62c1fa3e442a9d6131fc884a6bc9a=
65cf06224c30d649c49624c2ebcb0d275&quot;<br>
&gt; +SRC_URI[archive.sha256sum] =3D &quot;696a426b1702774af8d0f056828f5d9=
ff9350507aba7f4c7e3e499f07a581ad0&quot;<br>
&gt; <br>
&gt;=C2=A0 # Developer mode enables debugging<br>
&gt;=C2=A0 PACKAGECONFIG[developer-mode] =3D &quot;-Ddeveloper_mode=3Dtrue=
,-Ddeveloper_mode=3Dfalse&quot;<br>
&gt; diff --git a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-=
disable-the-use-of-yelp.patch b/meta/recipes-gnome/epiphany/files/0002-help=
-meson.build-disable-the-use-of-yelp.patch<br>
&gt; index 118b5d1825..a6c4f92c86 100644<br>
&gt; --- a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable=
-the-use-of-yelp.patch<br>
&gt; +++ b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable=
-the-use-of-yelp.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 3725c254f1d1d8204fa299e71c1e2bfd0ff6a634 Mon Sep 17 00:00:00 20=
01<br>
&gt; +From 77c9f87dc2b3ad0854a678e234e22dfb31902b82 Mon Sep 17 00:00:00 20=
01<br>
&gt;=C2=A0 From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmai=
l.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Wed, 31 Jan 2018 15:50:38 +0200<br>
&gt;=C2=A0 Subject: [PATCH] help/meson.build: disable the use of yelp<br>
&gt; @@ -13,11 +13,11 @@ Signed-off-by: Alexander Kanavin &lt;<a href=3D"m=
ailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&=
gt;<br>
&gt;=C2=A0 =C2=A01 file changed, 4 insertions(+), 4 deletions(-)<br>
&gt; <br>
&gt;=C2=A0 diff --git a/help/meson.build b/help/meson.build<br>
&gt; -index 484860c..d9b2e80 100644<br>
&gt; +index ff324dd..f5e421d 100644<br>
&gt;=C2=A0 --- a/help/meson.build<br>
&gt;=C2=A0 +++ b/help/meson.build<br>
&gt; -@@ -32,7 +32,7 @@ help_media =3D [<br>
&gt; -=C2=A0 =C2=A0&#39;media/epiphany-private-3-36.png&#39;<br>
&gt; +@@ -31,7 +31,7 @@ help_media =3D [<br>
&gt; +=C2=A0 =C2=A0&#39;media/org.gnome.Epiphany.svg&#39;<br>
&gt;=C2=A0 =C2=A0]<br>
&gt; <br>
&gt;=C2=A0 -gnome.yelp(meson.project_name(),<br>
&gt; -- <br>
&gt; 2.26.3<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
</blockquote></div>

--000000000000bc3f7705c20e8e99--
