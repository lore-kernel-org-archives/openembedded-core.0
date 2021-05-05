Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web10.478.1620237950083190234
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 11:05:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KGDRhnKO;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id o12so1897720qtx.8
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 11:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CUrz709QvF3BulCxR8E4aVAZ1h14rfayu2h71IWAhPA=;
        b=KGDRhnKOVomEABzz922sNK1+XYzMubPM0p8wscYrG1Nl/Nj/oOFNp2x0D4BpZnF0pa
         QwyhCJi+HanywFoY7xw4Pvpb7Zj08pJkbvh39Xfp7z+ck8f0PhaRK6pW6m2jhSxfu6gb
         4OfAhVyJ7RcVCVIZX9xbrDsTjvKAo/HJHRWoDxZc4329V9iwNcToUHrMtX1dNgt3luqW
         IAqwBsX9WRbVlrhfKmPi+e5E/KuvtrPyONKHIFnEwPEI1JO/IsSMTQjXV6RtZl4BFgY2
         H03H04bZb1X5TiNS3e7n4l2dTTxkp0ZplgtppnRT51yWuTgrm72m5LDTepcX0dlebbr4
         8sAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CUrz709QvF3BulCxR8E4aVAZ1h14rfayu2h71IWAhPA=;
        b=fh4bwxFSCK34Xr1V1H4LCEkVkxZUhHP6g/dI9Y4tT8S2H/MHW8kmQ81/WWb6lnSyH0
         EaRG3bKsWtortSeZCpF0cLUFHnfZkGlGhMbOkV24x8L4bVDqlOQ4UFzddf7/e1LPj2I+
         GELnd6Pi/oJuVulAN4vnydX++ZFbUxX7msRcnyZpY7kqAig7SMOpCVLG2NOq/D8YYnd3
         AkRyE1IC9u02ZdgyQxhhgymXOwR/UMOrhSh8qW+DCyYhEPQbsmRpU1WW0/oC3wjFjiYU
         OQ/eRHkTvCRfuczpC0rZivh2DvPcnZMffdV7Xk/lYcHHcBq8Bwy95PCAss86ynKZsIGb
         JHEQ==
X-Gm-Message-State: AOAM533KW/EeKYn4oGeSYMQNJULB/J1kFy01VLxfa5JNfZP7elnnnAf4
	rlp/fCUOpuTxc2D/L5gjyWGjZ9lqD9ORJ6L8Df8=
X-Google-Smtp-Source: ABdhPJyClzk6dDy66DmZ/fEF1+CyRBpoYCk8CTR3FTWl8BKmWpg+TF9g4BtvFpqe0K5WEX/4I9/BURUNUjDeV1nU3kw=
X-Received: by 2002:ac8:5cc4:: with SMTP id s4mr28485812qta.214.1620237949210;
 Wed, 05 May 2021 11:05:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210505151850.660512-1-alex.kanavin@gmail.com> <20210505151850.660512-58-alex.kanavin@gmail.com>
In-Reply-To: <20210505151850.660512-58-alex.kanavin@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 5 May 2021 11:05:23 -0700
Message-ID: <CAMKF1spEqemKRZAwWnDMupsSmk7rteUef6P1HbmC0-KtsOjO_w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 58/61] gi-docgen: add a recipe and class
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 5, 2021 at 8:20 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> This seems to be the gtk-doc successor, and gnome
> projects such as pango and gdk-pixbuf have started
> transitioning to it.
>

going through
https://gitlab.gnome.org/GNOME/gi-docgen#disclaimer

it seems that its still under development and not declared stable, so
I am wary of the churn it will cause.
I would prefer to wait until at least its declared prime time for
system wide inclusion.

> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/classes/gi-docgen.bbclass                | 24 +++++++++++++++++++
>  meta/conf/distro/include/maintainers.inc      |  1 +
>  meta/recipes-gnome/gi-docgen/gi-docgen_git.bb | 22 +++++++++++++++++
>  3 files changed, 47 insertions(+)
>  create mode 100644 meta/classes/gi-docgen.bbclass
>  create mode 100644 meta/recipes-gnome/gi-docgen/gi-docgen_git.bb
>
> diff --git a/meta/classes/gi-docgen.bbclass b/meta/classes/gi-docgen.bbclass
> new file mode 100644
> index 0000000000..5750f7028d
> --- /dev/null
> +++ b/meta/classes/gi-docgen.bbclass
> @@ -0,0 +1,24 @@
> +# gi-docgen is a new gnome documentation generator, which
> +# seems to be a successor to gtk-doc:
> +# https://gitlab.gnome.org/GNOME/gi-docgen
> +
> +# This variable is set to True if api-documentation is in
> +# DISTRO_FEATURES, and False otherwise.
> +GIDOCGEN_ENABLED ?= "${@bb.utils.contains('DISTRO_FEATURES', 'api-documentation', 'True', 'False', d)}"
> +# When building native recipes, disable gi-docgen, as it is not necessary,
> +# pulls in additional dependencies, and makes build times longer
> +GIDOCGEN_ENABLED_class-native = "False"
> +GIDOCGEN_ENABLED_class-nativesdk = "False"
> +
> +# meson: default option name to enable/disable gi-docgen. This matches most
> +# projects' configuration. In doubts - check meson_options.txt in project's
> +# source path.
> +GIDOCGEN_MESON_OPTION ?= 'gtk_doc'
> +GIDOCGEN_MESON_ENABLE_FLAG ?= 'true'
> +GIDOCGEN_MESON_DISABLE_FLAG ?= 'false'
> +
> +# Auto enable/disable based on GIDOCGEN_ENABLED
> +EXTRA_OEMESON_prepend = "-D${GIDOCGEN_MESON_OPTION}=${@bb.utils.contains('GIDOCGEN_ENABLED', 'True', '${GIDOCGEN_MESON_ENABLE_FLAG}', '${GIDOCGEN_MESON_DISABLE_FLAG}', d)} "
> +
> +DEPENDS_append = "${@' gi-docgen-native gi-docgen' if d.getVar('GIDOCGEN_ENABLED') == 'True' else ''}"
> +
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index 0c3e3628ba..bfebd68acf 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -205,6 +205,7 @@ RECIPE_MAINTAINER_pn-gdk-pixbuf = "Ross Burton <ross.burton@arm.com>"
>  RECIPE_MAINTAINER_pn-gettext = "Robert Yang <liezhi.yang@windriver.com>"
>  RECIPE_MAINTAINER_pn-gettext-minimal-native = "Robert Yang <liezhi.yang@windriver.com>"
>  RECIPE_MAINTAINER_pn-ghostscript = "Hongxu Jia <hongxu.jia@windriver.com>"
> +RECIPE_MAINTAINER_pn-gi-docgen = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER_pn-git = "Robert Yang <liezhi.yang@windriver.com>"
>  RECIPE_MAINTAINER_pn-glew = "Anuj Mittal <anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER_pn-glib-2.0 = "Anuj Mittal <anuj.mittal@intel.com>"
> diff --git a/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb b/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb
> new file mode 100644
> index 0000000000..4d779a9bdd
> --- /dev/null
> +++ b/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb
> @@ -0,0 +1,22 @@
> +SUMMARY = "Documentation tool for GObject-based libraries"
> +DESCRIPTION = "GI-DocGen is a document generator for GObject-based libraries. GObject is \
> +the base type system of the GNOME project. GI-Docgen reuses the \
> +introspection data generated by GObject-based libraries to generate the API \
> +reference of these libraries, as well as other ancillary documentation."
> +HOMEPAGE = "https://gnome.pages.gitlab.gnome.org/gi-docgen/"
> +
> +LICENSE = "GPLv3+ & Apache-2.0"
> +LIC_FILES_CHKSUM = "file://gi-docgen.py;beginline=1;endline=5;md5=2dc0f1f01202478cfe813c0e7f80b326"
> +
> +SRC_URI = "git://gitlab.gnome.org/GNOME/gi-docgen.git;protocol=https;branch=main"
> +
> +PV = "2021.5"
> +SRCREV = "7dee859321573f9c843ef7fb136f11142cb6ddf8"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit setuptools3
> +
> +RDEPENDS_${PN} += "python3-asyncio python3-core python3-jinja2 python3-json python3-markdown python3-markupsafe python3-pygments python3-toml python3-typogrify python3-xml"
> +
> +BBCLASSEXTEND = "native"
> --
> 2.31.1
>
>
> 
>
