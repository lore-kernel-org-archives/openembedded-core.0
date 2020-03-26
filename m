Received: from mail-il1-f196.google.com (mail-il1-f196.google.com [209.85.166.196])
 by mx.groups.io with SMTP id smtpd.web12.32676.1585210451089050442
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 01:14:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vM4v80VL;
 spf=pass (domain: gmail.com, ip: 209.85.166.196, mailfrom: schnitzeltony@gmail.com)
Received: by mail-il1-f196.google.com with SMTP id p13so4518100ilp.3
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2020 01:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=rZYTXfM8e4AoFmuji4JGiXK+rN1POdIgMUtHl0wAz5A=;
        b=vM4v80VLvMWzlXlbS+r2fiwNcxGcULc0FV3TC1bDalpWvwvL6YmJe6Hfi7zKCipiIv
         6hzZGGs4k3g+c3t46VFzpZrn+JO7Ijbu1l5xz/RY2EF7tHPVHlUqoSTgVQMTJNGCw2f9
         Q4Moymt3Q8OgUFZtfkpZ3q3S/ICaB3z7IuqqNB+fP0RzM3sutNIUQVBkM4a7tAJoMoxZ
         zAh3hgGbA+4Ec/MPdFE3PotcsDSx+zxoUk3OiFBhMulmI3T+rX8BMEDNKR7wa8HGtGiF
         okGGnuenr6uboU1bGkEEWK5pTUxjTYfJKo0bZF/tgy11KKlle+JCTQnDc+YJ5oghrfWo
         Wwpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=rZYTXfM8e4AoFmuji4JGiXK+rN1POdIgMUtHl0wAz5A=;
        b=aXCM5R+e+zAm411w38GNHhGvhyuiZGsRS9rIfcn1efNjtpROnO5irx7daFP8f8aNff
         iVUl1xz78rKJWhNKOxCX/HfXo3A/1J5WuPVdR8MqPPiXPxMz+6KGa6PFGaJAHAtHbH4h
         Qzzd4j4m/72AfU7HVfq+iNHAKUgYsAxb8ElDg67heBLNpubwRrwWfBfBNhMH+ioBVCpp
         OarPS1WMMn2QNgEa0uYkwYGctiB5ab9toCT7hlpJEdjBUkloo1KGyoi1L3D+JUlk3uNs
         6/TL/cDD8GPVhgErbBd+z28PBK+rdb8WbCSllkHIiZ/6rBv/u9IHoBuSE8yvZKgWv4Tr
         jutA==
X-Gm-Message-State: ANhLgQ0ekLO3SUo94nd+AyKJypdQ3+OeSRwvuXz6zb3Cp1IMn4Ob6eAZ
	z2E5TQynxiFdV/qJ+66aZcoVmfLv1ljgKsjv4RYefA99
X-Google-Smtp-Source: ADFU+vudYxSWl6SyfFczMBHhShp7dzdRUKm+p8NhFK5joLx/CmXLAuzRnrqaZrU4bsxj/PKUChStTtcN6F2WbdjyAD4=
X-Received: by 2002:a92:cc8c:: with SMTP id x12mr7743169ilo.224.1585210450216;
 Thu, 26 Mar 2020 01:14:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200319011206.14726-1-schnitzeltony@gmail.com> <20200319011206.14726-2-schnitzeltony@gmail.com>
In-Reply-To: <20200319011206.14726-2-schnitzeltony@gmail.com>
From: "Andreas M?ller" <schnitzeltony@gmail.com>
Date: Thu, 26 Mar 2020 09:13:59 +0100
Message-ID: <CALbNGRRf4RHW6fJ_tqGvqe9dZgM_8kghrFLjbv+wB8W5Hi0E7Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] libsecret: upgrade 0.20.1 -> 0.20.2 / port to meson
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2020 at 2:12 AM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> From [1]:
>
> 0.20.2
>  * secret-file-collection: force little-endian in GVariant [!49, #42]
>  * Prefer g_info() over g_message() [!48, #40]
>  * meson: Don't specify shared_library() [!47]
>  * docs: Make sure to set install: true [!46]
>
> [1] http://ftp.gnome.org/pub/gnome/sources/libsecret/0.20/libsecret-0.20.=
2.news
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  ...an-subdir-only-if-manpage-is-enabled.patch | 30 +++++++++++++++++++
>  ...ibsecret_0.20.1.bb =3D> libsecret_0.20.2.bb} | 20 ++++++++-----
>  2 files changed, 42 insertions(+), 8 deletions(-)
>  create mode 100644 meta/recipes-gnome/libsecret/libsecret/0001-docs-Add-=
man-subdir-only-if-manpage-is-enabled.patch
>  rename meta/recipes-gnome/libsecret/{libsecret_0.20.1.bb =3D> libsecret_=
0.20.2.bb} (59%)
>
> diff --git a/meta/recipes-gnome/libsecret/libsecret/0001-docs-Add-man-sub=
dir-only-if-manpage-is-enabled.patch b/meta/recipes-gnome/libsecret/libsecr=
et/0001-docs-Add-man-subdir-only-if-manpage-is-enabled.patch
> new file mode 100644
> index 0000000000..f434e6ae01
> --- /dev/null
> +++ b/meta/recipes-gnome/libsecret/libsecret/0001-docs-Add-man-subdir-onl=
y-if-manpage-is-enabled.patch
> @@ -0,0 +1,30 @@
> +From a2037bfcf14a0b5b81f5160b69b5ff94a6096584 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
> +Date: Thu, 19 Mar 2020 01:42:22 +0100
> +Subject: [PATCH] docs: Add man subdir only if manpage is enabled
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/libsecret/-/m=
erge_requests/51]
> +
> +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> +---
> + docs/meson.build | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/docs/meson.build b/docs/meson.build
> +index cc8d964..aa7cfbc 100644
> +--- a/docs/meson.build
> ++++ b/docs/meson.build
> +@@ -1,4 +1,6 @@
> +-subdir('man')
> ++if with_manpage
> ++  subdir('man')
> ++endif
> + if with_gtkdoc
> +   subdir('reference/libsecret')
> + endif
> +--
> +2.21.1
> +
> diff --git a/meta/recipes-gnome/libsecret/libsecret_0.20.1.bb b/meta/reci=
pes-gnome/libsecret/libsecret_0.20.2.bb
> similarity index 59%
> rename from meta/recipes-gnome/libsecret/libsecret_0.20.1.bb
> rename to meta/recipes-gnome/libsecret/libsecret_0.20.2.bb
> index 72511af02d..0effd492fd 100644
> --- a/meta/recipes-gnome/libsecret/libsecret_0.20.1.bb
> +++ b/meta/recipes-gnome/libsecret/libsecret_0.20.2.bb
> @@ -7,21 +7,25 @@ LICENSE =3D "LGPLv2.1"
>  BUGTRACKER =3D "https://gitlab.gnome.org/GNOME/libsecret/issues"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D23c2a5e0106b99d75238986559bb5=
fc6"
>
> +GNOMEBASEBUILDCLASS =3D "meson"
> +
>  inherit gnomebase gtk-doc vala gobject-introspection manpages
>
>  DEPENDS +=3D "glib-2.0 libgcrypt gettext-native"
>
> -PACKAGECONFIG[manpages] =3D "--enable-manpages, --disable-manpages, libx=
slt-native xmlto-native"
> +SRC_URI[archive.md5sum] =3D "f24f82e49d360ff742901d6c387e2bc9"
> +SRC_URI[archive.sha256sum] =3D "81e9143833785cdcf96c1da5d0357a8bcf0cd2b0=
119f15aa0cae775d1f19ffc3"
> +SRC_URI +=3D "file://0001-docs-Add-man-subdir-only-if-manpage-is-enabled=
.patch"
> +
> +GTKDOC_MESON_OPTION =3D 'gtk_doc'
>
> -SRC_URI[archive.md5sum] =3D "d2dd660a8d502099317bc8af9f30302e"
> -SRC_URI[archive.sha256sum] =3D "57f73e94ec6263a17a077fb809cf8cf424637a89=
7a7f15b4eec42ce4aef52447"
> +# gobject-introspection is mandatory and cannot be configured
> +REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
> +UNKNOWN_CONFIGURE_WHITELIST_append =3D " introspection"
> +
> +PACKAGECONFIG[manpages] =3D "-Dmanpage=3Dtrue,-Dmanpage=3Dfalse,libxslt-=
native xmlto-native"
>
>  # http://errors.yoctoproject.org/Errors/Details/20228/
>  ARM_INSTRUCTION_SET_armv4 =3D "arm"
>  ARM_INSTRUCTION_SET_armv5 =3D "arm"
>  ARM_INSTRUCTION_SET_armv6 =3D "arm"
> -
> -# vapigen.m4 bundled with the tarball does not yet have our cross-compil=
ation fixes
> -do_configure_prepend() {
> -    rm -f ${S}/build/m4/vapigen.m4
> -}
> --
> 2.21.1
>
Ping?
