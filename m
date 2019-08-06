Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id 746917F327
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 06:53:58 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id h18so83533874qtm.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Aug 2019 23:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=V8eB4Bywh9K45kmo+WyLKdsekKx9AOOBpXubRYF6E50=;
	b=BdNzLTiXUgk/T9oMagdAo/+WdX5raMJUGPTZ8j/OFETmPIP5s5fSS1I+77vsC6DP78
	5rT/qmb5nD39ZPGQDg+0I9+CjPoymgmuM5b3+dQrPbe9osYgaHIlxCOTqazHsDvwuU4f
	/vAbWyia9TYeCZJ/L3sRdG+07klQBcdXKHlaJ1c46DFriuBm2Fnsq9tlFWzIDmVsx2uv
	t+OaX3mihFu/d6nOpMdYsCt533aS/f80bYKpW8sg4gKzZISogfxVuzpeLlOUA/cBIVQ6
	s2STHHeK4j+73cwFNM0EpAQ398BaE0fCt6AR4cZBstCmCCug9zbEuH6Z0nc7+4FtC4bX
	MXoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=V8eB4Bywh9K45kmo+WyLKdsekKx9AOOBpXubRYF6E50=;
	b=Zq34LXG6H/cTTW/+1KGZl76kabUVGlO/OFa1SVAY2uc4t3uui6ealYv+23sSrT/SZa
	RC2/mO61qTqiCi/YphWw+NiPKLqAziHZrDzYiVP+IrojOIObewE+j+fOLpeH1ScIppla
	V/s7tkem9wctRfz7whsnctw3wyL7P54O39/dioaxxSA5ksNGIPfQnclbUwcqn2qEonEE
	H6/gSLWT+EYlQaivYg/hprcvwEwaHK5I4uQJoTs3gLienvJ6t3THKlBnTN0ve9uH9I+I
	cUPDi+UXgXK+21rU7ZxezVgS1pmRCgCzQ2YHXVvepY3tN5IofJzU2T3Fc/VEERegNqn6
	bWtg==
X-Gm-Message-State: APjAAAWZLk9bSMTIeqWcSNbC/QiDl4GopOqIEVI4+fR3V8qmBvmCnqyj
	IsAbXBfXPHgwio0S2K+5ukNOLnpZwqxIS1rLU/M=
X-Google-Smtp-Source: APXvYqwBkcRAP7diWNrZou/1Euqzr64P0bi78ABrQZHtRkvx6ryAJFtS8FdE24YEdDQFudAX6RLXxgIyGXxSI5UOnHM=
X-Received: by 2002:ac8:764f:: with SMTP id i15mr1667709qtr.194.1565074439072; 
	Mon, 05 Aug 2019 23:53:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190805033218.6750-1-anuj.mittal@intel.com>
In-Reply-To: <20190805033218.6750-1-anuj.mittal@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 5 Aug 2019 23:53:32 -0700
Message-ID: <CAMKF1soxNyT73HsCghDdx4vJSGpwxLLYgf957gnFUSckunrpZw@mail.gmail.com>
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] pango: upgrade 1.42.4 -> 1.44.3
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
X-List-Received-Date: Tue, 06 Aug 2019 06:53:58 -0000
Content-Type: text/plain; charset="UTF-8"

This causes

https://errors.yoctoproject.org/Errors/Details/258300/

On Sun, Aug 4, 2019 at 8:32 PM Anuj Mittal <anuj.mittal@intel.com> wrote:
>
> * For changes, see:
> https://github.com/GNOME/pango/blob/master/NEWS
>
> * Remove upstreamed patch, rename docs and introspection meson
> options and add PACKAGECONFIG for tests.
>
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>  .../pango/pango/insensitive-diff.patch        | 28 -------------------
>  .../{pango_1.42.4.bb => pango_1.44.3.bb}      | 22 ++++++---------
>  2 files changed, 9 insertions(+), 41 deletions(-)
>  delete mode 100644 meta/recipes-graphics/pango/pango/insensitive-diff.patch
>  rename meta/recipes-graphics/pango/{pango_1.42.4.bb => pango_1.44.3.bb} (73%)
>
> diff --git a/meta/recipes-graphics/pango/pango/insensitive-diff.patch b/meta/recipes-graphics/pango/pango/insensitive-diff.patch
> deleted file mode 100644
> index faaa96133f..0000000000
> --- a/meta/recipes-graphics/pango/pango/insensitive-diff.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -Do case-insensitive diffs as the test is sensitive as to whether 0x0 is printed
> -as (null) or (NULL).
> -
> -Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/pango/merge_requests/44]
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -diff --git a/tests/markup-parse.c b/tests/markup-parse.c
> -index 633f3e89..36d2c776 100644
> ---- a/tests/markup-parse.c
> -+++ b/tests/markup-parse.c
> -@@ -217,7 +217,7 @@ diff_with_file (const char  *file1,
> -                 GString     *string,
> -                 GError     **error)
> - {
> --  const char *command[] = { "diff", "-u", file1, NULL, NULL };
> -+  const char *command[] = { "diff", "-u", "-i", file1, NULL, NULL };
> -   char *diff, *tmpfile;
> -   int fd;
> -
> -@@ -237,7 +237,7 @@ diff_with_file (const char  *file1,
> -       goto done;
> -     }
> -   close (fd);
> --  command[3] = tmpfile;
> -+  command[4] = tmpfile;
> -
> -   /* run diff command */
> -   g_spawn_sync (NULL, (char **)command, NULL, G_SPAWN_SEARCH_PATH, NULL, NULL, &diff, NULL, NULL, error);
> diff --git a/meta/recipes-graphics/pango/pango_1.42.4.bb b/meta/recipes-graphics/pango/pango_1.44.3.bb
> similarity index 73%
> rename from meta/recipes-graphics/pango/pango_1.42.4.bb
> rename to meta/recipes-graphics/pango/pango_1.44.3.bb
> index 58e1f41be5..1973c63f82 100644
> --- a/meta/recipes-graphics/pango/pango_1.42.4.bb
> +++ b/meta/recipes-graphics/pango/pango_1.44.3.bb
> @@ -16,18 +16,21 @@ GNOMEBASEBUILDCLASS = "meson"
>  inherit gnomebase gtk-doc ptest-gnome upstream-version-is-even gobject-introspection
>
>  SRC_URI += "file://run-ptest \
> -            file://insensitive-diff.patch"
> +            "
>
> -SRC_URI[archive.md5sum] = "deb171a31a3ad76342d5195a1b5bbc7c"
> -SRC_URI[archive.sha256sum] = "1d2b74cd63e8bd41961f2f8d952355aa0f9be6002b52c8aa7699d9f5da597c9d"
> +SRC_URI[archive.md5sum] = "7f91f1b5883ff848b445ab11ebabcf03"
> +SRC_URI[archive.sha256sum] = "290bb100ca5c7025ec3f97332eaf783b76ba1f444110f06ac5ee3285e3e5aece"
>
>  DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
>
> -PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
> +PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} \
> +                   ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
> +
>  PACKAGECONFIG[x11] = ",,virtual/libx11 libxft"
> +PACKAGECONFIG[tests] = "-Dinstall-tests=true, -Dinstall-tests=false"
>
> -GTKDOC_MESON_OPTION = "enable_docs"
> -GIR_MESON_OPTION = 'gir'
> +GTKDOC_MESON_OPTION = "gtk_doc"
> +GIR_MESON_OPTION = 'introspection'
>
>  LEAD_SONAME = "libpango-1.0*"
>  LIBV = "1.8.0"
> @@ -41,10 +44,3 @@ RPROVIDES_${PN} += "pango-modules pango-module-indic-lang \
>                      pango-module-basic-fc pango-module-arabic-lang"
>
>  BBCLASSEXTEND = "native nativesdk"
> -
> -do_install_append () {
> -       if [ "${PTEST_ENABLED}" != "1" ]; then
> -               rm -rf ${D}${libexecdir}/installed-tests ${D}${datadir}/installed-tests
> -                rmdir --ignore-fail-on-non-empty ${D}${libexecdir} ${D}${datadir}
> -       fi
> -}
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

