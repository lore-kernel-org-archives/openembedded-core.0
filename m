Received: from mail-io1-f66.google.com (mail-io1-f66.google.com [209.85.166.66])
 by mx.groups.io with SMTP id smtpd.web12.32672.1585210413575499962
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 01:13:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HKABvZAN;
 spf=pass (domain: gmail.com, ip: 209.85.166.66, mailfrom: schnitzeltony@gmail.com)
Received: by mail-io1-f66.google.com with SMTP id c19so5134124ioo.6
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2020 01:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=13w5YOYDSOiIOrfac3E1HNJH48Ks7flKKx7NIb+svFs=;
        b=HKABvZAN3md/lFq8nVIx1p1fLxUKNUfk8Pxck5/U4cT5Doji6xQkNEGfiU+GagvA62
         CZnnsidRmp3V4nYegrgUFWSuURJud/cdMPoNGJfVo8GbMBHXGLLqjdN3xcx1u0wuH3ip
         +RjSw8720xHBMQBGRuSTMmO2MIQTSHnlYIQ6+WwlKoSl1JwloHoQGvR0zgSbw5962bL7
         7QjHuLJUQzuJEEKd6PaWTjakHakISsktn75fpJhhJ4a89mCEZGISx5I4N7kOIEkfuZvh
         KeLqo5udiE6C/QXtIeqkeCJNFdj12otJb0dQ2gJVokr3cHm8M+MLE3zImA6tdEdb+L3l
         a+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=13w5YOYDSOiIOrfac3E1HNJH48Ks7flKKx7NIb+svFs=;
        b=lWCmJp/q80i7W0g68MQpUHAbvFOO6V1DxC92d7ZnlTC1p92ROLaVC6HiPd4Fp1aDdx
         GNXYTspHMhLwPQNbDq8alhg3AVFe6qM8mwh7JjE22jlSY5IGckuFRcSpi6K/f8PI+2nY
         frOgDRNFBc5kAoZE37mFHuiTDDPE6Ck6wN6iwVB1jWLCYQ3GQhQmIEoYsHXdsyVB9NXr
         YiiL2aV/qoQHmbEk3UX3SJI3aiEJjyeYV09P11MfBVvwy28sCx5RBO1wDGtT81uij8U4
         4f6V70o38CRrr9KjkKo/UAeBKn/n/0rJrQdwLyhR/HJcU0GJ1owJgsMRgiKP3WTr408u
         3TqA==
X-Gm-Message-State: ANhLgQ2EEzdya7NCs7QagxGfDcGZfHzxF2WlGqMF1Wemfd+SHPpbYITF
	GIqnmZU06mkwy+rv5vGRx81CeKZdVWwlwNdnZF252GL+
X-Google-Smtp-Source: ADFU+vvYD/2ewX16i9mL/q2NA5yQMyd7Ne4d60+WXqIOgy0QxLhTj3lwz7XqGGOTihMCceZWGnJfeSeypp8Xha5jlNA=
X-Received: by 2002:a02:2b02:: with SMTP id h2mr6512317jaa.81.1585210412398;
 Thu, 26 Mar 2020 01:13:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200319011206.14726-1-schnitzeltony@gmail.com>
In-Reply-To: <20200319011206.14726-1-schnitzeltony@gmail.com>
From: "Andreas M?ller" <schnitzeltony@gmail.com>
Date: Thu, 26 Mar 2020 09:13:20 +0100
Message-ID: <CALbNGRQ-4wLXC-fttpLc6ixJYxWb0HHGgsDQr+x8RhvxLGOgpw@mail.gmail.com>
Subject: Re: [PATCH 1/2] libnotify: upgrade 0.7.8 -> 0.7.9 / port to meson
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2020 at 2:12 AM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> From [1]:
> New in 0.7.9
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> * Fixed linking in darwin [Iain, Marco; !5]
> * Added man page for notify-send [Jan; !6]
> * Dropped autotools [Jan; !11]
>
> [1] http://ftp.gnome.org/pub/gnome/sources/libnotify/0.7/libnotify-0.7.9.=
news
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  .../{libnotify_0.7.8.bb =3D> libnotify_0.7.9.bb}     | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>  rename meta/recipes-gnome/libnotify/{libnotify_0.7.8.bb =3D> libnotify_0=
.7.9.bb} (59%)
>
> diff --git a/meta/recipes-gnome/libnotify/libnotify_0.7.8.bb b/meta/recip=
es-gnome/libnotify/libnotify_0.7.9.bb
> similarity index 59%
> rename from meta/recipes-gnome/libnotify/libnotify_0.7.8.bb
> rename to meta/recipes-gnome/libnotify/libnotify_0.7.9.bb
> index 0306b04f4e..38da41639b 100644
> --- a/meta/recipes-gnome/libnotify/libnotify_0.7.8.bb
> +++ b/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb
> @@ -7,12 +7,20 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7fbc338309ac=
38fefcd64b04bb903e34"
>
>  DEPENDS =3D "dbus gtk+3 glib-2.0"
>
> -inherit gnomebase gtk-doc features_check gobject-introspection
> +GNOMEBASEBUILDCLASS =3D "meson"
> +
> +inherit gnomebase gtk-doc features_check gobject-introspection manpages
>  # depends on gtk+3
>  ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
>
> -SRC_URI[archive.md5sum] =3D "babb4b07b5f21bef42a386d3d7019599"
> -SRC_URI[archive.sha256sum] =3D "69209e0b663776a00c7b6c0e560302a8dbf66b25=
51d55616304f240bba66e18c"
> +SRC_URI[archive.md5sum] =3D "ccd9c53364174cc8d13e18a1988faa76"
> +SRC_URI[archive.sha256sum] =3D "66c0517ed16df7af258e83208faaf5069727dfd6=
6995c4bbc51c16954d674761"
> +
> +GIR_MESON_ENABLE_FLAG =3D 'enabled'
> +GIR_MESON_DISABLE_FLAG =3D 'disabled'
> +GTKDOC_MESON_OPTION =3D 'gtk_doc'
> +
> +PACKAGECONFIG[manpages] =3D "-Dman=3Dtrue,-Dman=3Dfalse,libxslt-native x=
mlto-native"
>
>  # there were times, we had two versions of libnotify (oe-core libnotify:=
0.6.x /
>  # meta-gnome libnotify3: 0.7.x)
> --
> 2.21.1
>
Ping?
