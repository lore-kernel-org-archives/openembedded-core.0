Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id CD8336E671
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Aug 2017 12:26:44 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id j32so5444256iod.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Aug 2017 05:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=76yFl2gaDCADPsATwdectAXPcI+DsHKFEGqrZDSl4pk=;
	b=TwokebocEdivSbBR7yjI+a/jxi9YcGAItSQe8FmQH83uOwS0OEdOOLichWpMi3FIpD
	z+Y/CKwa4/DorQHexbaRULTsjyycpkzVTbS4b7wKX1vLOF+ZsXu9wgHR18y7NKj2o1F4
	TJt/Pm5SRksq/KEPvjBbhaPL1iPtWC4eQGBsiXN3wVxfl0az5pbGosFTSGzhfIla8u2l
	0wGFxmLz2869bwuQFLhH/CylRpcqyruD6/7+LY9lPydC38vxFEvhteFtw3GMC0G5gIh2
	4szxR1x3qjvJXZaZ8oDQpkXY6d5cOFJrbzTrLjjxzs3YmkONemTRQeYhEFPQKhrHETek
	Kpog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=76yFl2gaDCADPsATwdectAXPcI+DsHKFEGqrZDSl4pk=;
	b=f3ywF/Nv2XqzyTmPBCyn69NxmYr8+6JJc8V2KwsimGcAyoYnbWNspF1pmLwpHJjWZj
	lotXT3P7DCy1/Y9U37J1GuuTlHAXWeTCTqv7woggnqpZt99/6S72xu7x8TBWAkiQHwI0
	KTNi/d/XHZLlQCwQX5DaR2dJLE0mQXG7p25O9BwApjbHBX7+kXQLUlzHr9kLiZsuo1cG
	5nhnC+SlnL+XUpzGRq9J8llwC7ME2c2Pju/mSVyMEZ/1I8aK3fWO6o8KdIbcqng2Gl0+
	L5GPFDAD3hQixm5bLzdw7OQoUivaxjwcICZP53Uw8lKcr10lp+cbGrNBeUt+Q78Qlee+
	H3uw==
X-Gm-Message-State: AHYfb5jd0k1j52YV38kOYNjkaw57xII/m3zyi5I4R5QPdUE8o1O+wVYa
	R5pfeztdDpE7wlLtC1t/BbBFoY4UQUGV
X-Received: by 10.107.12.160 with SMTP id 32mr2279283iom.207.1501849605823;
	Fri, 04 Aug 2017 05:26:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Fri, 4 Aug 2017 05:26:25 -0700 (PDT)
In-Reply-To: <1500022363-22674-1-git-send-email-maxin.john@intel.com>
References: <1500022363-22674-1-git-send-email-maxin.john@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 4 Aug 2017 13:26:25 +0100
Message-ID: <CAJTo0LYuW6f62E5G+sNh6WFFcc6u3z3GXcxmkGNz0vVZTz8pMw@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] pkgconf: add recipe
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
X-List-Received-Date: Fri, 04 Aug 2017 12:26:45 -0000
Content-Type: multipart/alternative; boundary="001a113f937642ed430555ec9cff"

--001a113f937642ed430555ec9cff
Content-Type: text/plain; charset="UTF-8"

A recent patch to pkgconfig to make menuconfig work in the SDK has since
landed in master.  Can you adapt the patch so that it also applies for
pkgconf?

Cheers,
Ross

On 14 July 2017 at 09:52, Maxin B. John <maxin.john@intel.com> wrote:

> Move pkgconf recipe to oe-core from meta-pkgconf:
> https://github.com/kergoth/meta-kergoth-wip/tree/master/meta-pkgconf
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
> Changes in v2:
>     1. Fix build errors with mingw
> ---
>  meta/files/common-licenses/pkgconf                 |  10 +
>  ...imal-tweaks-to-compile-with-Visual-C-2015.patch | 224
> +++++++++++++++++++++
>  .../0001-stdinc.h-fix-build-with-mingw.patch       |  48 +++++
>  .../pkgconf/pkgconf/pkg-config-native.in           |   6 +
>  .../pkgconf/pkgconf/pkg-config-wrapper             |  16 ++
>  meta/recipes-devtools/pkgconf/pkgconf_1.3.7.bb     |  57 ++++++
>  6 files changed, 361 insertions(+)
>  create mode 100644 meta/files/common-licenses/pkgconf
>  create mode 100644 meta/recipes-devtools/pkgconf/
> pkgconf/0001-Minimal-tweaks-to-compile-with-Visual-C-2015.patch
>  create mode 100644 meta/recipes-devtools/pkgconf/
> pkgconf/0001-stdinc.h-fix-build-with-mingw.patch
>  create mode 100644 meta/recipes-devtools/pkgconf/pkgconf/
> pkg-config-native.in
>  create mode 100755 meta/recipes-devtools/pkgconf/
> pkgconf/pkg-config-wrapper
>  create mode 100644 meta/recipes-devtools/pkgconf/pkgconf_1.3.7.bb
>
> diff --git a/meta/files/common-licenses/pkgconf
> b/meta/files/common-licenses/pkgconf
> new file mode 100644
> index 0000000..81a5221
> --- /dev/null
> +++ b/meta/files/common-licenses/pkgconf
> @@ -0,0 +1,10 @@
> +Copyright (c) 2011, 2012, 2013, 2014, 2015, 2016, 2017
> +    pkgconf authors (see AUTHORS file in source directory).
> +
> +Permission to use, copy, modify, and/or distribute this software for any
> +purpose with or without fee is hereby granted, provided that the above
> +copyright notice and this permission notice appear in all copies.
> +
> +This software is provided 'as is' and without any warranty, express or
> +implied.  In no event shall the authors be liable for any damages arising
> +from the use of this software.
> diff --git a/meta/recipes-devtools/pkgconf/pkgconf/0001-Minimal-
> tweaks-to-compile-with-Visual-C-2015.patch b/meta/recipes-devtools/
> pkgconf/pkgconf/0001-Minimal-tweaks-to-compile-with-Visual-C-2015.patch
> new file mode 100644
> index 0000000..3805ad3
> --- /dev/null
> +++ b/meta/recipes-devtools/pkgconf/pkgconf/0001-Minimal-
> tweaks-to-compile-with-Visual-C-2015.patch
> @@ -0,0 +1,224 @@
> +From 4d7b4d7c8e9966c593f472355607204c6c80fecb Mon Sep 17 00:00:00 2001
> +From: Dan Kegel <dank@kegel.com>
> +Date: Sun, 4 Jun 2017 19:19:55 -0700
> +Subject: [PATCH] Minimal tweaks to compile with Visual C 2015
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Maxin B. John <maxin.john@intel.com>
> +---
> + getopt_long.c           |  2 ++
> + libpkgconf/bsdstubs.c   |  1 +
> + libpkgconf/libpkgconf.h |  2 +-
> + libpkgconf/path.c       | 10 +++++-----
> + libpkgconf/pkg.c        | 28 +++++++++++++++++++---------
> + libpkgconf/stdinc.h     |  9 +++++++--
> + 6 files changed, 35 insertions(+), 17 deletions(-)
> +
> +diff --git a/getopt_long.c b/getopt_long.c
> +index afeb68d..5ce9bfd 100644
> +--- a/getopt_long.c
> ++++ b/getopt_long.c
> +@@ -62,7 +62,9 @@
> + #include <stdio.h>
> + #include <stdlib.h>
> + #include <string.h>
> ++#ifndef _WIN32
> + #include <unistd.h>
> ++#endif
> +
> + #define PKGCONF_HACK_LOGICAL_OR_ALL_VALUES
> +
> +diff --git a/libpkgconf/bsdstubs.c b/libpkgconf/bsdstubs.c
> +index 8f70ff3..2c000ac 100644
> +--- a/libpkgconf/bsdstubs.c
> ++++ b/libpkgconf/bsdstubs.c
> +@@ -17,6 +17,7 @@
> +  * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
> +  */
> +
> ++#include <stdlib.h>
> + #include <sys/types.h>
> + #include <string.h>
> +
> +diff --git a/libpkgconf/libpkgconf.h b/libpkgconf/libpkgconf.h
> +index 404bf0c..551d85d 100644
> +--- a/libpkgconf/libpkgconf.h
> ++++ b/libpkgconf/libpkgconf.h
> +@@ -310,7 +310,7 @@ void pkgconf_audit_log_dependency(pkgconf_client_t
> *client, const pkgconf_pkg_t
> + /* path.c */
> + void pkgconf_path_add(const char *text, pkgconf_list_t *dirlist, bool
> filter);
> + size_t pkgconf_path_split(const char *text, pkgconf_list_t *dirlist,
> bool filter);
> +-size_t pkgconf_path_build_from_environ(const char *environ, const char
> *fallback, pkgconf_list_t *dirlist, bool filter);
> ++size_t pkgconf_path_build_from_environ(const char *envvarname, const
> char *fallback, pkgconf_list_t *dirlist, bool filter);
> + bool pkgconf_path_match_list(const char *path, const pkgconf_list_t
> *dirlist);
> + void pkgconf_path_free(pkgconf_list_t *dirlist);
> + bool pkgconf_path_relocate(char *buf, size_t buflen);
> +diff --git a/libpkgconf/path.c b/libpkgconf/path.c
> +index dddb3bf..59e003e 100644
> +--- a/libpkgconf/path.c
> ++++ b/libpkgconf/path.c
> +@@ -20,7 +20,7 @@
> + # include <sys/cygwin.h>
> + #endif
> +
> +-#ifdef HAVE_SYS_STAT_H
> ++#if defined(HAVE_SYS_STAT_H) && ! defined(_WIN32)
> + # include <sys/stat.h>
> + # define PKGCONF_CACHE_INODES
> + #endif
> +@@ -156,12 +156,12 @@ pkgconf_path_split(const char *text, pkgconf_list_t
> *dirlist, bool filter)
> + /*
> +  * !doc
> +  *
> +- * .. c:function:: size_t pkgconf_path_build_from_environ(const char
> *environ, const char *fallback, pkgconf_list_t *dirlist)
> ++ * .. c:function:: size_t pkgconf_path_build_from_environ(const char
> *envvarname, const char *fallback, pkgconf_list_t *dirlist)
> +  *
> +  *    Adds the paths specified in an environment variable to a path
> list.  If the environment variable is not set,
> +  *    an optional default set of paths is added.
> +  *
> +- *    :param char* environ: The environment variable to look up.
> ++ *    :param char* envvarname: The environment variable to look up.
> +  *    :param char* fallback: The fallback paths to use if the
> environment variable is not set.
> +  *    :param pkgconf_list_t* dirlist: The path list to add the path
> nodes to.
> +  *    :param bool filter: Whether to perform duplicate filtering.
> +@@ -169,11 +169,11 @@ pkgconf_path_split(const char *text, pkgconf_list_t
> *dirlist, bool filter)
> +  *    :rtype: size_t
> +  */
> + size_t
> +-pkgconf_path_build_from_environ(const char *environ, const char
> *fallback, pkgconf_list_t *dirlist, bool filter)
> ++pkgconf_path_build_from_environ(const char *envvarname, const char
> *fallback, pkgconf_list_t *dirlist, bool filter)
> + {
> +       const char *data;
> +
> +-      data = getenv(environ);
> ++      data = getenv(envvarname);
> +       if (data != NULL)
> +               return pkgconf_path_split(data, dirlist, filter);
> +
> +diff --git a/libpkgconf/pkg.c b/libpkgconf/pkg.c
> +index 7aebd61..5dacae3 100644
> +--- a/libpkgconf/pkg.c
> ++++ b/libpkgconf/pkg.c
> +@@ -30,6 +30,8 @@
> + #     define PKG_CONFIG_REG_KEY "Software\\pkgconfig\\PKG_CONFIG_PATH"
> + #     undef PKG_DEFAULT_PATH
> + #     define PKG_DEFAULT_PATH "../lib/pkgconfig;../share/pkgconfig"
> ++#define strncasecmp _strnicmp
> ++#define strcasecmp _stricmp
> + #endif
> +
> + #define PKG_CONFIG_EXT                ".pc"
> +@@ -134,21 +136,21 @@ static int pkgconf_pkg_parser_keyword_pair_cmp(const
> void *key, const void *ptr)
> + static void
> + pkgconf_pkg_parser_tuple_func(const pkgconf_client_t *client,
> pkgconf_pkg_t *pkg, const ptrdiff_t offset, char *value)
> + {
> +-      char **dest = ((void *) pkg + offset);
> ++      char **dest = (char **)((char *) pkg + offset);
> +       *dest = pkgconf_tuple_parse(client, &pkg->vars, value);
> + }
> +
> + static void
> + pkgconf_pkg_parser_fragment_func(const pkgconf_client_t *client,
> pkgconf_pkg_t *pkg, const ptrdiff_t offset, char *value)
> + {
> +-      pkgconf_list_t *dest = ((void *) pkg + offset);
> ++      pkgconf_list_t *dest = (pkgconf_list_t *)((char *) pkg + offset);
> +       pkgconf_fragment_parse(client, dest, &pkg->vars, value);
> + }
> +
> + static void
> + pkgconf_pkg_parser_dependency_func(const pkgconf_client_t *client,
> pkgconf_pkg_t *pkg, const ptrdiff_t offset, char *value)
> + {
> +-      pkgconf_list_t *dest = ((void *) pkg + offset);
> ++      pkgconf_list_t *dest = (pkgconf_list_t *)((char *) pkg + offset);
> +       pkgconf_dependency_parse(client, pkg, dest, value);
> + }
> +
> +@@ -238,7 +240,7 @@ pkgconf_pkg_validate(const pkgconf_client_t *client,
> const pkgconf_pkg_t *pkg)
> +
> +       for (i = 0; i < PKGCONF_ARRAY_SIZE(pkgconf_pkg_validations); i++)
> +       {
> +-              char **p = ((void *) pkg + pkgconf_pkg_validations[i].
> offset);
> ++              char **p = (char **)((char *) pkg +
> pkgconf_pkg_validations[i].offset);
> +
> +               if (*p != NULL)
> +                       continue;
> +@@ -587,7 +589,7 @@ pkgconf_scan_all(pkgconf_client_t *client, void
> *data, pkgconf_pkg_iteration_fun
> +
> + #ifdef _WIN32
> + static pkgconf_pkg_t *
> +-pkgconf_pkg_find_in_registry_key(const pkgconf_client_t *client, HKEY
> hkey, const char *name)
> ++pkgconf_pkg_find_in_registry_key(pkgconf_client_t *client, HKEY hkey,
> const char *name)
> + {
> +       pkgconf_pkg_t *pkg = NULL;
> +
> +@@ -1048,8 +1050,12 @@ typedef struct {
> +
> + static const pkgconf_pkg_provides_vermatch_rule_t
> pkgconf_pkg_provides_vermatch_rules[] = {
> +       [PKGCONF_CMP_ANY] = {
> +-              .rulecmp = {},
> +-              .depcmp = {},
> ++              .rulecmp = {
> ++                      [PKGCONF_CMP_ANY]                       =
> pkgconf_pkg_comparator_none,
> ++                },
> ++              .depcmp = {
> ++                      [PKGCONF_CMP_ANY]                       =
> pkgconf_pkg_comparator_none,
> ++                },
> +       },
> +       [PKGCONF_CMP_LESS_THAN] = {
> +               .rulecmp = {
> +@@ -1121,7 +1127,9 @@ static const pkgconf_pkg_provides_vermatch_rule_t
> pkgconf_pkg_provides_vermatch_
> +                       [PKGCONF_CMP_EQUAL]                     =
> pkgconf_pkg_comparator_eq,
> +                       [PKGCONF_CMP_NOT_EQUAL]                 =
> pkgconf_pkg_comparator_ne
> +               },
> +-              .depcmp = {},
> ++              .depcmp = {
> ++                      [PKGCONF_CMP_ANY]                       =
> pkgconf_pkg_comparator_none,
> ++                },
> +       },
> +       [PKGCONF_CMP_NOT_EQUAL] = {
> +               .rulecmp = {
> +@@ -1133,7 +1141,9 @@ static const pkgconf_pkg_provides_vermatch_rule_t
> pkgconf_pkg_provides_vermatch_
> +                       [PKGCONF_CMP_EQUAL]                     =
> pkgconf_pkg_comparator_ne,
> +                       [PKGCONF_CMP_NOT_EQUAL]                 =
> pkgconf_pkg_comparator_eq
> +               },
> +-              .depcmp = {},
> ++              .depcmp = {
> ++                      [PKGCONF_CMP_ANY]                       =
> pkgconf_pkg_comparator_none,
> ++                },
> +       },
> + };
> +
> +diff --git a/libpkgconf/stdinc.h b/libpkgconf/stdinc.h
> +index 58cc6c7..ac7e53c 100644
> +--- a/libpkgconf/stdinc.h
> ++++ b/libpkgconf/stdinc.h
> +@@ -24,9 +24,7 @@
> + #include <stdbool.h>
> + #include <stdarg.h>
> + #include <string.h>
> +-#include <dirent.h>
> + #include <sys/types.h>
> +-#include <unistd.h>
> + #include <stdint.h>
> +
> + #ifdef _WIN32
> +@@ -34,8 +32,15 @@
> + # include <windows.h>
> + # include <malloc.h>
> + # define PATH_DEV_NULL        "nul"
> ++# ifndef ssize_t
> ++#  include <BaseTsd.h>
> ++#  define ssize_t SSIZE_T
> ++# endif
> ++# include "win-dirent.h"
> + #else
> + # define PATH_DEV_NULL        "/dev/null"
> ++# include <dirent.h>
> ++# include <unistd.h>
> + #endif
> +
> + #endif
> +--
> +2.4.0
> +
> diff --git a/meta/recipes-devtools/pkgconf/pkgconf/0001-stdinc.h-fix-build-with-mingw.patch
> b/meta/recipes-devtools/pkgconf/pkgconf/0001-stdinc.h-
> fix-build-with-mingw.patch
> new file mode 100644
> index 0000000..49ebe31
> --- /dev/null
> +++ b/meta/recipes-devtools/pkgconf/pkgconf/0001-stdinc.h-
> fix-build-with-mingw.patch
> @@ -0,0 +1,48 @@
> +From ea28c5b34457cf7676181b284e22ea5f79a30d85 Mon Sep 17 00:00:00 2001
> +From: "Maxin B. John" <maxin.john@intel.com>
> +Date: Thu, 13 Jul 2017 14:47:31 +0300
> +Subject: [PATCH] stdinc.h: fix build with mingw
> +
> +Fixes this build error with mingw:
> +...
> +| compilation terminated.
> +| In file included from ../pkgconf-1.3.7/libpkgconf/libpkgconf.h:19:0,
> +| from ../pkgconf-1.3.7/libpkgconf/audit.c:16:
> +| ../pkgconf-1.3.7/libpkgconf/stdinc.h:36:12: fatal error: BaseTsd.h: No
> +such file or directory
> +| # include <BaseTsd.h>
> +
> +Upstream-Status: Submitted
> +
> +Signed-off-by: Maxin B. John <maxin.john@intel.com>
> +---
> + libpkgconf/stdinc.h | 10 +++++++++-
> + 1 file changed, 9 insertions(+), 1 deletion(-)
> +
> +diff --git a/libpkgconf/stdinc.h b/libpkgconf/stdinc.h
> +index ac7e53c..d8efcf5 100644
> +--- a/libpkgconf/stdinc.h
> ++++ b/libpkgconf/stdinc.h
> +@@ -33,10 +33,18 @@
> + # include <malloc.h>
> + # define PATH_DEV_NULL        "nul"
> + # ifndef ssize_t
> ++# ifndef __MINGW32__
> + #  include <BaseTsd.h>
> ++# else
> ++#  include <basetsd.h>
> ++# endif
> + #  define ssize_t SSIZE_T
> + # endif
> +-# include "win-dirent.h"
> ++# ifndef __MINGW32__
> ++#  include "win-dirent.h"
> ++# else
> ++# include <dirent.h>
> ++# endif
> + #else
> + # define PATH_DEV_NULL        "/dev/null"
> + # include <dirent.h>
> +--
> +2.4.0
> +
> diff --git a/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-native.in
> b/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-native.in
> new file mode 100644
> index 0000000..9ed30a0
> --- /dev/null
> +++ b/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-native.in
> @@ -0,0 +1,6 @@
> +#! /bin/sh
> +
> +PKG_CONFIG_PATH="@PATH_NATIVE@"
> +unset PKG_CONFIG_SYSROOT_DIR
> +
> +pkg-config "$@"
> diff --git a/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-wrapper
> b/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-wrapper
> new file mode 100755
> index 0000000..695f349
> --- /dev/null
> +++ b/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-wrapper
> @@ -0,0 +1,16 @@
> +#!/bin/sh
> +# pkgconf wrapper to deal with pkg-config/pkgconf compatibility issues
> +#
> +# Copyright (C) 2015 Christopher Larson <chris_larson@mentor.com>
> +# License: MIT (see COPYING.MIT at the root of the repository for terms)
> +
> +for arg; do
> +    case "$arg" in
> +        --variable|--variable=*)
> +            # pkg-config doesn't sysroot-prefix user variables
> +            unset PKG_CONFIG_SYSROOT_DIR
> +            ;;
> +    esac
> +done
> +
> +exec pkgconf "$@"
> diff --git a/meta/recipes-devtools/pkgconf/pkgconf_1.3.7.bb
> b/meta/recipes-devtools/pkgconf/pkgconf_1.3.7.bb
> new file mode 100644
> index 0000000..47c55f6
> --- /dev/null
> +++ b/meta/recipes-devtools/pkgconf/pkgconf_1.3.7.bb
> @@ -0,0 +1,57 @@
> +SUMMARY = "pkgconf provides compiler and linker configuration for
> development frameworks."
> +DESCRIPTION = "pkgconf is a program which helps to configure compiler and
> linker \
> +flags for development frameworks. It is similar to pkg-config from \
> +freedesktop.org, providing additional functionality while also
> maintaining \
> +compatibility."
> +HOMEPAGE = "http://pkgconf.org"
> +BUGTRACKER = "https://github.com/pkgconf/pkgconf/issues"
> +SECTION = "devel"
> +PROVIDES += "pkgconfig"
> +RPROVIDES_${PN} += "pkgconfig"
> +DEFAULT_PREFERENCE = "-1"
> +
> +# The pkgconf license seems to be functionally equivalent to BSD-2-Clause
> or
> +# ISC, but has different wording, so needs its own name.
> +LICENSE = "pkgconf"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=548a9d1db10cc0a84810c313a0e9266f"
> +
> +SRC_URI = "\
> +    https://distfiles.dereferenced.org/pkgconf/pkgconf-${PV}.tar.xz \
> +    file://0001-Minimal-tweaks-to-compile-with-Visual-C-2015.patch \
> +    file://0001-stdinc.h-fix-build-with-mingw.patch \
> +    file://pkg-config-wrapper \
> +    file://pkg-config-native.in \
> +"
> +SRC_URI[md5sum] = "ac35c34d84eeb6a03d4d61b8555d6197"
> +SRC_URI[sha256sum] = "1be7e40900c7467893c65f810211b1
> e68da3f8d5e70fddb883fc24839cad0339"
> +
> +inherit autotools update-alternatives
> +
> +EXTRA_OECONF += "--with-pkg-config-dir='${libdir}/pkgconfig:${datadir}/
> pkgconfig'"
> +
> +do_install_append () {
> +    # Install a wrapper which deals, as much as possible with pkgconf vs
> +    # pkg-config compatibility issues.
> +    install -m 0755 "${WORKDIR}/pkg-config-wrapper"
> "${D}${bindir}/pkg-config"
> +}
> +
> +do_install_append_class-native () {
> +    # Install a pkg-config-native wrapper that will use the native
> sysroot instead
> +    # of the MACHINE sysroot, for using pkg-config when building native
> tools.
> +    sed -e "s|@PATH_NATIVE@|${PKG_CONFIG_PATH}|" \
> +        < ${WORKDIR}/pkg-config-native.in > ${B}/pkg-config-native
> +    install -m755 ${B}/pkg-config-native ${D}${bindir}/pkg-config-native
> +}
> +
> +ALTERNATIVE_${PN} = "pkg-config"
> +
> +# When using the RPM generated automatic package dependencies, some
> packages
> +# will end up requiring 'pkgconfig(pkg-config)'.  Allow this behavior by
> +# specifying an appropriate provide.
> +RPROVIDES_${PN} += "pkgconfig(pkg-config)"
> +
> +# Include pkg.m4 in the main package, leaving libpkgconf dev files in -dev
> +FILES_${PN}-dev_remove = "${datadir}/aclocal"
> +FILES_${PN} += "${datadir}/aclocal"
> +
> +BBCLASSEXTEND += "native nativesdk"
> --
> 2.4.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113f937642ed430555ec9cff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">A recent patch to pkgconfig to make menuconfig work in the=
 SDK has since landed in master.=C2=A0 Can you adapt the patch so that it a=
lso applies for pkgconf?<div><br></div><div>Cheers,</div><div>Ross</div></d=
iv><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 14 July 201=
7 at 09:52, Maxin B. John <span dir=3D"ltr">&lt;<a href=3D"mailto:maxin.joh=
n@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt;</span> wrote:<b=
r><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">Move pkgconf recipe to oe-core from meta-p=
kgconf:<br>
<a href=3D"https://github.com/kergoth/meta-kergoth-wip/tree/master/meta-pkg=
conf" rel=3D"noreferrer" target=3D"_blank">https://github.com/kergoth/<wbr>=
meta-kergoth-wip/tree/master/<wbr>meta-pkgconf</a><br>
<br>
Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor=
.com">chris_larson@mentor.com</a>&gt;<br>
Signed-off-by: Maxin B. John &lt;<a href=3D"mailto:maxin.john@intel.com">ma=
xin.john@intel.com</a>&gt;<br>
---<br>
Changes in v2:<br>
=C2=A0 =C2=A0 1. Fix build errors with mingw<br>
---<br>
=C2=A0meta/files/common-licenses/<wbr>pkgconf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 10 +<br>
=C2=A0...imal-tweaks-to-compile-<wbr>with-Visual-C-2015.patch | 224 +++++++=
++++++++++++++<br>
=C2=A0.../0001-stdinc.h-fix-build-<wbr>with-mingw.patch=C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 48 +++++<br>
=C2=A0.../pkgconf/pkgconf/<a href=3D"http://pkg-config-native.in" rel=3D"no=
referrer" target=3D"_blank">pkg-<wbr>config-native.in</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +<br>
=C2=A0.../pkgconf/pkgconf/pkg-<wbr>config-wrapper=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 16 ++<br>
=C2=A0meta/recipes-devtools/pkgconf/<a href=3D"http://pkgconf_1.3.7.bb" rel=
=3D"noreferrer" target=3D"_blank"><wbr>pkgconf_1.3.7.bb</a>=C2=A0 =C2=A0 =
=C2=A0|=C2=A0 57 ++++++<br>
=C2=A06 files changed, 361 insertions(+)<br>
=C2=A0create mode 100644 meta/files/common-licenses/<wbr>pkgconf<br>
=C2=A0create mode 100644 meta/recipes-devtools/pkgconf/<wbr>pkgconf/0001-Mi=
nimal-tweaks-<wbr>to-compile-with-Visual-C-2015.<wbr>patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/pkgconf/<wbr>pkgconf/0001-st=
dinc.h-fix-<wbr>build-with-mingw.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/pkgconf/<wbr>pkgconf/<a href=
=3D"http://pkg-config-native.in" rel=3D"noreferrer" target=3D"_blank">pkg-c=
onfig-native.in</a><br>
=C2=A0create mode 100755 meta/recipes-devtools/pkgconf/<wbr>pkgconf/pkg-con=
fig-wrapper<br>
=C2=A0create mode 100644 meta/recipes-devtools/pkgconf/<a href=3D"http://pk=
gconf_1.3.7.bb" rel=3D"noreferrer" target=3D"_blank"><wbr>pkgconf_1.3.7.bb<=
/a><br>
<br>
diff --git a/meta/files/common-licenses/<wbr>pkgconf b/meta/files/common-li=
censes/<wbr>pkgconf<br>
new file mode 100644<br>
index 0000000..81a5221<br>
--- /dev/null<br>
+++ b/meta/files/common-licenses/<wbr>pkgconf<br>
@@ -0,0 +1,10 @@<br>
+Copyright (c) 2011, 2012, 2013, 2014, 2015, 2016, 2017<br>
+=C2=A0 =C2=A0 pkgconf authors (see AUTHORS file in source directory).<br>
+<br>
+Permission to use, copy, modify, and/or distribute this software for any<b=
r>
+purpose with or without fee is hereby granted, provided that the above<br>
+copyright notice and this permission notice appear in all copies.<br>
+<br>
+This software is provided &#39;as is&#39; and without any warranty, expres=
s or<br>
+implied.=C2=A0 In no event shall the authors be liable for any damages ari=
sing<br>
+from the use of this software.<br>
diff --git a/meta/recipes-devtools/<wbr>pkgconf/pkgconf/0001-Minimal-<wbr>t=
weaks-to-compile-with-Visual-<wbr>C-2015.patch b/meta/recipes-devtools/<wbr=
>pkgconf/pkgconf/0001-Minimal-<wbr>tweaks-to-compile-with-Visual-<wbr>C-201=
5.patch<br>
new file mode 100644<br>
index 0000000..3805ad3<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/<wbr>pkgconf/pkgconf/0001-Minimal-<wbr>tweaks-t=
o-compile-with-Visual-<wbr>C-2015.patch<br>
@@ -0,0 +1,224 @@<br>
+From 4d7b4d7c8e9966c593f47235560720<wbr>4c6c80fecb Mon Sep 17 00:00:00 200=
1<br>
+From: Dan Kegel &lt;<a href=3D"mailto:dank@kegel.com">dank@kegel.com</a>&g=
t;<br>
+Date: Sun, 4 Jun 2017 19:19:55 -0700<br>
+Subject: [PATCH] Minimal tweaks to compile with Visual C 2015<br>
+<br>
+Upstream-Status: Backport<br>
+<br>
+Signed-off-by: Maxin B. John &lt;<a href=3D"mailto:maxin.john@intel.com">m=
axin.john@intel.com</a>&gt;<br>
+---<br>
+ getopt_long.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 ++<br>
+ libpkgconf/bsdstubs.c=C2=A0 =C2=A0|=C2=A0 1 +<br>
+ libpkgconf/libpkgconf.h |=C2=A0 2 +-<br>
+ libpkgconf/path.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 +++++-----<br>
+ libpkgconf/pkg.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 28 +++++++++++++++++++-----=
----<br>
+ libpkgconf/stdinc.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 9 +++++++--<br>
+ 6 files changed, 35 insertions(+), 17 deletions(-)<br>
+<br>
+diff --git a/getopt_long.c b/getopt_long.c<br>
+index afeb68d..5ce9bfd 100644<br>
+--- a/getopt_long.c<br>
++++ b/getopt_long.c<br>
+@@ -62,7 +62,9 @@<br>
+ #include &lt;stdio.h&gt;<br>
+ #include &lt;stdlib.h&gt;<br>
+ #include &lt;string.h&gt;<br>
++#ifndef _WIN32<br>
+ #include &lt;unistd.h&gt;<br>
++#endif<br>
+<br>
+ #define PKGCONF_HACK_LOGICAL_OR_ALL_<wbr>VALUES<br>
+<br>
+diff --git a/libpkgconf/bsdstubs.c b/libpkgconf/bsdstubs.c<br>
+index 8f70ff3..2c000ac 100644<br>
+--- a/libpkgconf/bsdstubs.c<br>
++++ b/libpkgconf/bsdstubs.c<br>
+@@ -17,6 +17,7 @@<br>
+=C2=A0 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.<br=
>
+=C2=A0 */<br>
+<br>
++#include &lt;stdlib.h&gt;<br>
+ #include &lt;sys/types.h&gt;<br>
+ #include &lt;string.h&gt;<br>
+<br>
+diff --git a/libpkgconf/libpkgconf.h b/libpkgconf/libpkgconf.h<br>
+index 404bf0c..551d85d 100644<br>
+--- a/libpkgconf/libpkgconf.h<br>
++++ b/libpkgconf/libpkgconf.h<br>
+@@ -310,7 +310,7 @@ void pkgconf_audit_log_dependency(<wbr>pkgconf_client_=
t *client, const pkgconf_pkg_t<br>
+ /* path.c */<br>
+ void pkgconf_path_add(const char *text, pkgconf_list_t *dirlist, bool fil=
ter);<br>
+ size_t pkgconf_path_split(const char *text, pkgconf_list_t *dirlist, bool=
 filter);<br>
+-size_t pkgconf_path_build_from_<wbr>environ(const char *environ, const ch=
ar *fallback, pkgconf_list_t *dirlist, bool filter);<br>
++size_t pkgconf_path_build_from_<wbr>environ(const char *envvarname, const=
 char *fallback, pkgconf_list_t *dirlist, bool filter);<br>
+ bool pkgconf_path_match_list(const char *path, const pkgconf_list_t *dirl=
ist);<br>
+ void pkgconf_path_free(pkgconf_<wbr>list_t *dirlist);<br>
+ bool pkgconf_path_relocate(char *buf, size_t buflen);<br>
+diff --git a/libpkgconf/path.c b/libpkgconf/path.c<br>
+index dddb3bf..59e003e 100644<br>
+--- a/libpkgconf/path.c<br>
++++ b/libpkgconf/path.c<br>
+@@ -20,7 +20,7 @@<br>
+ # include &lt;sys/cygwin.h&gt;<br>
+ #endif<br>
+<br>
+-#ifdef HAVE_SYS_STAT_H<br>
++#if defined(HAVE_SYS_STAT_H) &amp;&amp; ! defined(_WIN32)<br>
+ # include &lt;sys/stat.h&gt;<br>
+ # define PKGCONF_CACHE_INODES<br>
+ #endif<br>
+@@ -156,12 +156,12 @@ pkgconf_path_split(const char *text, pkgconf_list_t =
*dirlist, bool filter)<br>
+ /*<br>
+=C2=A0 * !doc<br>
+=C2=A0 *<br>
+- * .. c:function:: size_t pkgconf_path_build_from_<wbr>environ(const char=
 *environ, const char *fallback, pkgconf_list_t *dirlist)<br>
++ * .. c:function:: size_t pkgconf_path_build_from_<wbr>environ(const char=
 *envvarname, const char *fallback, pkgconf_list_t *dirlist)<br>
+=C2=A0 *<br>
+=C2=A0 *=C2=A0 =C2=A0 Adds the paths specified in an environment variable =
to a path list.=C2=A0 If the environment variable is not set,<br>
+=C2=A0 *=C2=A0 =C2=A0 an optional default set of paths is added.<br>
+=C2=A0 *<br>
+- *=C2=A0 =C2=A0 :param char* environ: The environment variable to look up=
.<br>
++ *=C2=A0 =C2=A0 :param char* envvarname: The environment variable to look=
 up.<br>
+=C2=A0 *=C2=A0 =C2=A0 :param char* fallback: The fallback paths to use if =
the environment variable is not set.<br>
+=C2=A0 *=C2=A0 =C2=A0 :param pkgconf_list_t* dirlist: The path list to add=
 the path nodes to.<br>
+=C2=A0 *=C2=A0 =C2=A0 :param bool filter: Whether to perform duplicate fil=
tering.<br>
+@@ -169,11 +169,11 @@ pkgconf_path_split(const char *text, pkgconf_list_t =
*dirlist, bool filter)<br>
+=C2=A0 *=C2=A0 =C2=A0 :rtype: size_t<br>
+=C2=A0 */<br>
+ size_t<br>
+-pkgconf_path_build_from_<wbr>environ(const char *environ, const char *fal=
lback, pkgconf_list_t *dirlist, bool filter)<br>
++pkgconf_path_build_from_<wbr>environ(const char *envvarname, const char *=
fallback, pkgconf_list_t *dirlist, bool filter)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *data;<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 data =3D getenv(environ);<br>
++=C2=A0 =C2=A0 =C2=A0 data =3D getenv(envvarname);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (data !=3D NULL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return pkgconf_path=
_split(data, dirlist, filter);<br>
+<br>
+diff --git a/libpkgconf/pkg.c b/libpkgconf/pkg.c<br>
+index 7aebd61..5dacae3 100644<br>
+--- a/libpkgconf/pkg.c<br>
++++ b/libpkgconf/pkg.c<br>
+@@ -30,6 +30,8 @@<br>
+ #=C2=A0 =C2=A0 =C2=A0define PKG_CONFIG_REG_KEY &quot;Software\\pkgconfig\=
\PKG_<wbr>CONFIG_PATH&quot;<br>
+ #=C2=A0 =C2=A0 =C2=A0undef PKG_DEFAULT_PATH<br>
+ #=C2=A0 =C2=A0 =C2=A0define PKG_DEFAULT_PATH &quot;../lib/pkgconfig;../sh=
are/<wbr>pkgconfig&quot;<br>
++#define strncasecmp _strnicmp<br>
++#define strcasecmp _stricmp<br>
+ #endif<br>
+<br>
+ #define PKG_CONFIG_EXT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;.pc&quot;<br>
+@@ -134,21 +136,21 @@ static int pkgconf_pkg_parser_keyword_<wbr>pair_cmp(=
const void *key, const void *ptr)<br>
+ static void<br>
+ pkgconf_pkg_parser_tuple_func(<wbr>const pkgconf_client_t *client, pkgcon=
f_pkg_t *pkg, const ptrdiff_t offset, char *value)<br>
+ {<br>
+-=C2=A0 =C2=A0 =C2=A0 char **dest =3D ((void *) pkg + offset);<br>
++=C2=A0 =C2=A0 =C2=A0 char **dest =3D (char **)((char *) pkg + offset);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0*dest =3D pkgconf_tuple_parse(client, &amp;pkg-=
&gt;vars, value);<br>
+ }<br>
+<br>
+ static void<br>
+ pkgconf_pkg_parser_fragment_<wbr>func(const pkgconf_client_t *client, pkg=
conf_pkg_t *pkg, const ptrdiff_t offset, char *value)<br>
+ {<br>
+-=C2=A0 =C2=A0 =C2=A0 pkgconf_list_t *dest =3D ((void *) pkg + offset);<br=
>
++=C2=A0 =C2=A0 =C2=A0 pkgconf_list_t *dest =3D (pkgconf_list_t *)((char *)=
 pkg + offset);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pkgconf_fragment_parse(client, dest, &amp;pkg-&=
gt;vars, value);<br>
+ }<br>
+<br>
+ static void<br>
+ pkgconf_pkg_parser_dependency_<wbr>func(const pkgconf_client_t *client, p=
kgconf_pkg_t *pkg, const ptrdiff_t offset, char *value)<br>
+ {<br>
+-=C2=A0 =C2=A0 =C2=A0 pkgconf_list_t *dest =3D ((void *) pkg + offset);<br=
>
++=C2=A0 =C2=A0 =C2=A0 pkgconf_list_t *dest =3D (pkgconf_list_t *)((char *)=
 pkg + offset);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pkgconf_dependency_parse(<wbr>client, pkg, dest=
, value);<br>
+ }<br>
+<br>
+@@ -238,7 +240,7 @@ pkgconf_pkg_validate(const pkgconf_client_t *client, c=
onst pkgconf_pkg_t *pkg)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; PKGCONF_ARRAY_SIZE(pkgconf=
_<wbr>pkg_validations); i++)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char **p =3D ((void *) p=
kg + pkgconf_pkg_validations[i].<wbr>offset);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char **p =3D (char **)((=
char *) pkg + pkgconf_pkg_validations[i].<wbr>offset);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (*p !=3D NULL)<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0continue;<br>
+@@ -587,7 +589,7 @@ pkgconf_scan_all(pkgconf_<wbr>client_t *client, void *=
data, pkgconf_pkg_iteration_fun<br>
+<br>
+ #ifdef _WIN32<br>
+ static pkgconf_pkg_t *<br>
+-pkgconf_pkg_find_in_<wbr>registry_key(const pkgconf_client_t *client, HKE=
Y hkey, const char *name)<br>
++pkgconf_pkg_find_in_<wbr>registry_key(pkgconf_client_t *client, HKEY hkey=
, const char *name)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pkgconf_pkg_t *pkg =3D NULL;<br>
+<br>
+@@ -1048,8 +1050,12 @@ typedef struct {<br>
+<br>
+ static const pkgconf_pkg_provides_vermatch_<wbr>rule_t pkgconf_pkg_provid=
es_vermatch_<wbr>rules[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[PKGCONF_CMP_ANY] =3D {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .rulecmp =3D {},<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .depcmp =3D {},<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .rulecmp =3D {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 [PKGCONF_CMP_ANY]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D pkgconf_pkg_comparator_none,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .depcmp =3D {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 [PKGCONF_CMP_ANY]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D pkgconf_pkg_comparator_none,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[PKGCONF_CMP_LESS_THAN] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.rulecmp =3D {<br>
+@@ -1121,7 +1127,9 @@ static const pkgconf_pkg_provides_vermatch_<wbr>rule=
_t pkgconf_pkg_provides_vermatch_<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0[PKGCONF_CMP_EQUAL]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D pkgconf_pkg_comparator_eq,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0[PKGCONF_CMP_NOT_EQUAL]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D pkgconf_pkg_comparator_ne<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .depcmp =3D {},<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .depcmp =3D {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 [PKGCONF_CMP_ANY]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D pkgconf_pkg_comparator_none,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[PKGCONF_CMP_NOT_EQUAL] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.rulecmp =3D {<br>
+@@ -1133,7 +1141,9 @@ static const pkgconf_pkg_provides_vermatch_<wbr>rule=
_t pkgconf_pkg_provides_vermatch_<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0[PKGCONF_CMP_EQUAL]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D pkgconf_pkg_comparator_ne,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0[PKGCONF_CMP_NOT_EQUAL]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D pkgconf_pkg_comparator_eq<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .depcmp =3D {},<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .depcmp =3D {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 [PKGCONF_CMP_ANY]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D pkgconf_pkg_comparator_none,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+ };<br>
+<br>
+diff --git a/libpkgconf/stdinc.h b/libpkgconf/stdinc.h<br>
+index 58cc6c7..ac7e53c 100644<br>
+--- a/libpkgconf/stdinc.h<br>
++++ b/libpkgconf/stdinc.h<br>
+@@ -24,9 +24,7 @@<br>
+ #include &lt;stdbool.h&gt;<br>
+ #include &lt;stdarg.h&gt;<br>
+ #include &lt;string.h&gt;<br>
+-#include &lt;dirent.h&gt;<br>
+ #include &lt;sys/types.h&gt;<br>
+-#include &lt;unistd.h&gt;<br>
+ #include &lt;stdint.h&gt;<br>
+<br>
+ #ifdef _WIN32<br>
+@@ -34,8 +32,15 @@<br>
+ # include &lt;windows.h&gt;<br>
+ # include &lt;malloc.h&gt;<br>
+ # define PATH_DEV_NULL=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;nul&quot;<br>
++# ifndef ssize_t<br>
++#=C2=A0 include &lt;BaseTsd.h&gt;<br>
++#=C2=A0 define ssize_t SSIZE_T<br>
++# endif<br>
++# include &quot;win-dirent.h&quot;<br>
+ #else<br>
+ # define PATH_DEV_NULL=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;/dev/null&quot;<b=
r>
++# include &lt;dirent.h&gt;<br>
++# include &lt;unistd.h&gt;<br>
+ #endif<br>
+<br>
+ #endif<br>
+--<br>
+2.4.0<br>
+<br>
diff --git a/meta/recipes-devtools/<wbr>pkgconf/pkgconf/0001-stdinc.h-<wbr>=
fix-build-with-mingw.patch b/meta/recipes-devtools/<wbr>pkgconf/pkgconf/000=
1-stdinc.h-<wbr>fix-build-with-mingw.patch<br>
new file mode 100644<br>
index 0000000..49ebe31<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/<wbr>pkgconf/pkgconf/0001-stdinc.h-<wbr>fix-bui=
ld-with-mingw.patch<br>
@@ -0,0 +1,48 @@<br>
+From ea28c5b34457cf7676181b284e22ea<wbr>5f79a30d85 Mon Sep 17 00:00:00 200=
1<br>
+From: &quot;Maxin B. John&quot; &lt;<a href=3D"mailto:maxin.john@intel.com=
">maxin.john@intel.com</a>&gt;<br>
+Date: Thu, 13 Jul 2017 14:47:31 +0300<br>
+Subject: [PATCH] stdinc.h: fix build with mingw<br>
+<br>
+Fixes this build error with mingw:<br>
+...<br>
+| compilation terminated.<br>
+| In file included from ../pkgconf-1.3.7/libpkgconf/<wbr>libpkgconf.h:19:0=
,<br>
+| from ../pkgconf-1.3.7/libpkgconf/<wbr>audit.c:16:<br>
+| ../pkgconf-1.3.7/libpkgconf/<wbr>stdinc.h:36:12: fatal error: BaseTsd.h:=
 No<br>
+such file or directory<br>
+| # include &lt;BaseTsd.h&gt;<br>
+<br>
+Upstream-Status: Submitted<br>
+<br>
+Signed-off-by: Maxin B. John &lt;<a href=3D"mailto:maxin.john@intel.com">m=
axin.john@intel.com</a>&gt;<br>
+---<br>
+ libpkgconf/stdinc.h | 10 +++++++++-<br>
+ 1 file changed, 9 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/libpkgconf/stdinc.h b/libpkgconf/stdinc.h<br>
+index ac7e53c..d8efcf5 100644<br>
+--- a/libpkgconf/stdinc.h<br>
++++ b/libpkgconf/stdinc.h<br>
+@@ -33,10 +33,18 @@<br>
+ # include &lt;malloc.h&gt;<br>
+ # define PATH_DEV_NULL=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;nul&quot;<br>
+ # ifndef ssize_t<br>
++# ifndef __MINGW32__<br>
+ #=C2=A0 include &lt;BaseTsd.h&gt;<br>
++# else<br>
++#=C2=A0 include &lt;basetsd.h&gt;<br>
++# endif<br>
+ #=C2=A0 define ssize_t SSIZE_T<br>
+ # endif<br>
+-# include &quot;win-dirent.h&quot;<br>
++# ifndef __MINGW32__<br>
++#=C2=A0 include &quot;win-dirent.h&quot;<br>
++# else<br>
++# include &lt;dirent.h&gt;<br>
++# endif<br>
+ #else<br>
+ # define PATH_DEV_NULL=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;/dev/null&quot;<b=
r>
+ # include &lt;dirent.h&gt;<br>
+--<br>
+2.4.0<br>
+<br>
diff --git a/meta/recipes-devtools/<wbr>pkgconf/pkgconf/<a href=3D"http://p=
kg-config-native.in" rel=3D"noreferrer" target=3D"_blank">pkg-config-<wbr>n=
ative.in</a> b/meta/recipes-devtools/<wbr>pkgconf/pkgconf/<a href=3D"http:/=
/pkg-config-native.in" rel=3D"noreferrer" target=3D"_blank">pkg-config-<wbr=
>native.in</a><br>
new file mode 100644<br>
index 0000000..9ed30a0<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/<wbr>pkgconf/pkgconf/<a href=3D"http://pkg-conf=
ig-native.in" rel=3D"noreferrer" target=3D"_blank">pkg-config-<wbr>native.i=
n</a><br>
@@ -0,0 +1,6 @@<br>
+#! /bin/sh<br>
+<br>
+PKG_CONFIG_PATH=3D&quot;@PATH_<wbr>NATIVE@&quot;<br>
+unset PKG_CONFIG_SYSROOT_DIR<br>
+<br>
+pkg-config &quot;$@&quot;<br>
diff --git a/meta/recipes-devtools/<wbr>pkgconf/pkgconf/pkg-config-<wbr>wra=
pper b/meta/recipes-devtools/<wbr>pkgconf/pkgconf/pkg-config-<wbr>wrapper<b=
r>
new file mode 100755<br>
index 0000000..695f349<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/<wbr>pkgconf/pkgconf/pkg-config-<wbr>wrapper<br=
>
@@ -0,0 +1,16 @@<br>
+#!/bin/sh<br>
+# pkgconf wrapper to deal with pkg-config/pkgconf compatibility issues<br>
+#<br>
+# Copyright (C) 2015 Christopher Larson &lt;<a href=3D"mailto:chris_larson=
@mentor.com">chris_larson@mentor.com</a>&gt;<br>
+# License: MIT (see COPYING.MIT at the root of the repository for terms)<b=
r>
+<br>
+for arg; do<br>
+=C2=A0 =C2=A0 case &quot;$arg&quot; in<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 --variable|--variable=3D*)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # pkg-config doesn&#39;t sysroot=
-prefix user variables<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unset PKG_CONFIG_SYSROOT_DIR<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
+=C2=A0 =C2=A0 esac<br>
+done<br>
+<br>
+exec pkgconf &quot;$@&quot;<br>
diff --git a/meta/recipes-devtools/<wbr>pkgconf/<a href=3D"http://pkgconf_1=
.3.7.bb" rel=3D"noreferrer" target=3D"_blank">pkgconf_1.3.7.bb</a> b/meta/r=
ecipes-devtools/<wbr>pkgconf/<a href=3D"http://pkgconf_1.3.7.bb" rel=3D"nor=
eferrer" target=3D"_blank">pkgconf_1.3.7.bb</a><br>
new file mode 100644<br>
index 0000000..47c55f6<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/<wbr>pkgconf/<a href=3D"http://pkgconf_1.3.7.bb=
" rel=3D"noreferrer" target=3D"_blank">pkgconf_1.3.7.bb</a><br>
@@ -0,0 +1,57 @@<br>
+SUMMARY =3D &quot;pkgconf provides compiler and linker configuration for d=
evelopment frameworks.&quot;<br>
+DESCRIPTION =3D &quot;pkgconf is a program which helps to configure compil=
er and linker \<br>
+flags for development frameworks. It is similar to pkg-config from \<br>
+<a href=3D"http://freedesktop.org" rel=3D"noreferrer" target=3D"_blank">fr=
eedesktop.org</a>, providing additional functionality while also maintainin=
g \<br>
+compatibility.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"http://pkgconf.org" rel=3D"noreferrer" targe=
t=3D"_blank">http://pkgconf.org</a>&quot;<br>
+BUGTRACKER =3D &quot;<a href=3D"https://github.com/pkgconf/pkgconf/issues"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/pkgconf/<wbr>pkgco=
nf/issues</a>&quot;<br>
+SECTION =3D &quot;devel&quot;<br>
+PROVIDES +=3D &quot;pkgconfig&quot;<br>
+RPROVIDES_${PN} +=3D &quot;pkgconfig&quot;<br>
+DEFAULT_PREFERENCE =3D &quot;-1&quot;<br>
+<br>
+# The pkgconf license seems to be functionally equivalent to BSD-2-Clause =
or<br>
+# ISC, but has different wording, so needs its own name.<br>
+LICENSE =3D &quot;pkgconf&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>548a9d1db10cc0a84810c=
313a0e926<wbr>6f&quot;<br>
+<br>
+SRC_URI =3D &quot;\<br>
+=C2=A0 =C2=A0 <a href=3D"https://distfiles.dereferenced.org/pkgconf/pkgcon=
f-${PV}.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://distfiles.<wbr=
>dereferenced.org/pkgconf/<wbr>pkgconf-${PV}.tar.xz</a> \<br>
+=C2=A0 =C2=A0 file://0001-Minimal-tweaks-to-<wbr>compile-with-Visual-C-201=
5.<wbr>patch \<br>
+=C2=A0 =C2=A0 file://0001-stdinc.h-fix-<wbr>build-with-mingw.patch \<br>
+=C2=A0 =C2=A0 file://pkg-config-wrapper \<br>
+=C2=A0 =C2=A0 file://<a href=3D"http://pkg-config-native.in" rel=3D"norefe=
rrer" target=3D"_blank">pkg-config-native.in</a> \<br>
+&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>ac35c34d84eeb6a03d4d61b8555d61<wbr>97&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>1be7e40900c7467893c65f810211b1<wbr>e68da=
3f8d5e70fddb883fc24839cad<wbr>0339&quot;<br>
+<br>
+inherit autotools update-alternatives<br>
+<br>
+EXTRA_OECONF +=3D &quot;--with-pkg-config-dir=3D&#39;${<wbr>libdir}/pkgcon=
fig:${datadir}/<wbr>pkgconfig&#39;&quot;<br>
+<br>
+do_install_append () {<br>
+=C2=A0 =C2=A0 # Install a wrapper which deals, as much as possible with pk=
gconf vs<br>
+=C2=A0 =C2=A0 # pkg-config compatibility issues.<br>
+=C2=A0 =C2=A0 install -m 0755 &quot;${WORKDIR}/pkg-config-<wbr>wrapper&quo=
t; &quot;${D}${bindir}/pkg-config&quot;<br>
+}<br>
+<br>
+do_install_append_class-<wbr>native () {<br>
+=C2=A0 =C2=A0 # Install a pkg-config-native wrapper that will use the nati=
ve sysroot instead<br>
+=C2=A0 =C2=A0 # of the MACHINE sysroot, for using pkg-config when building=
 native tools.<br>
+=C2=A0 =C2=A0 sed -e &quot;s|@PATH_NATIVE@|${PKG_CONFIG_<wbr>PATH}|&quot; =
\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt; ${WORKDIR}/<a href=3D"http://pkg-config-n=
ative.in" rel=3D"noreferrer" target=3D"_blank">pkg-config-native.<wbr>in</a=
> &gt; ${B}/pkg-config-native<br>
+=C2=A0 =C2=A0 install -m755 ${B}/pkg-config-native ${D}${bindir}/pkg-confi=
g-<wbr>native<br>
+}<br>
+<br>
+ALTERNATIVE_${PN} =3D &quot;pkg-config&quot;<br>
+<br>
+# When using the RPM generated automatic package dependencies, some packag=
es<br>
+# will end up requiring &#39;pkgconfig(pkg-config)&#39;.=C2=A0 Allow this =
behavior by<br>
+# specifying an appropriate provide.<br>
+RPROVIDES_${PN} +=3D &quot;pkgconfig(pkg-config)&quot;<br>
+<br>
+# Include pkg.m4 in the main package, leaving libpkgconf dev files in -dev=
<br>
+FILES_${PN}-dev_remove =3D &quot;${datadir}/aclocal&quot;<br>
+FILES_${PN} +=3D &quot;${datadir}/aclocal&quot;<br>
+<br>
+BBCLASSEXTEND +=3D &quot;native nativesdk&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.4.0<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a113f937642ed430555ec9cff--
