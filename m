Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1404DC433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 23:02:24 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web09.3929.1639004543100929112
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 15:02:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DNVhcGlA;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id jo22so3573548qvb.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 15:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aWnTxOQe58FM0X1+ptxieHrF+Rk1OLGTj9W5BydR9N4=;
        b=DNVhcGlAHHaU0TyDsITbsaGrTZIuf+NK7UCyGkjXPG77HjR/VZ+P2C8uZ1NHDHpbD8
         0uFyFimUoE1FuPSwT1f4IwnkawsAamtgPOkrt+PNcmsmNxr1tMuPrMSYh+4kwJRtk+TJ
         pNm75eQjh7Ne6402QAUCsP6Uxb1qb+PrD35l13RQ4RagjSzAuNo8YZraeV5C0XiF/ahE
         JCVhFJk2euDcKI1Lgu9g6wF8ZQmCeDip/lWS4iTsCsg7vo3GfR+GRlj9dNUbXmUfGGLP
         uin7Zx0u94xS3ez5kDDPT86d8ERvhImKeqsrK55YnqYVtqKTZCy0kSGYb/Ggg5mrEMfU
         3ViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aWnTxOQe58FM0X1+ptxieHrF+Rk1OLGTj9W5BydR9N4=;
        b=Ip+b9kNEf5wYs7exozBuaK5wuxbpDroOpmv4RJ5y2yUqTVc6XButJUGxuj++RioJXi
         cBNSOUqyNe7R567dbXC31N1c8r9ud974bNH89ATY+j/6/aIEhqjSzP3bLxZ7uGhg2TiB
         qvykcs86uTdY3WMxBdPjhz5M4te9hDziqBup2ar7jyLteVr61eTFR4809oQcaFi0ReCw
         k/TEZOonlX3Dd66QqzUVdhJWB1QQvdmIU+ntv3vgoKnk/UTlq8Wrx+Dg4V7ATv1jsCjh
         lBxiZVohsw0zMmotg9gBTlG4WxnWhko1X0o7rIM907Xdt3lgUycq+XlvdQuEtmz9+F6Q
         hqLw==
X-Gm-Message-State: AOAM532APPxsJec9Fv7ABB8pquybxpL5F6EVGaMIVyETehvZ8JOlh+HV
	9DpIHYPxq2GlCN+d0XU0ecqfZ/XvIAXYuvzbKsQ=
X-Google-Smtp-Source: 
 ABdhPJy08TC44s8wuRb81jx7R/scmdiB5ftX2GOFX7pjHbv5BBNKeGJUeCuCJJ1Tjz72Eeb/x6B56DdBoThDCcyERUg=
X-Received: by 2002:a05:6214:e63:: with SMTP id
 jz3mr11191838qvb.16.1639004542062;
 Wed, 08 Dec 2021 15:02:22 -0800 (PST)
MIME-Version: 1.0
References: <20211208215947.1979470-1-alex@linutronix.de>
 <20211208215947.1979470-4-alex@linutronix.de>
In-Reply-To: <20211208215947.1979470-4-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Dec 2021 15:01:56 -0800
Message-ID: 
 <CAMKF1srKXqWAPTQD+UGeArVAh3oP5P3V08tw5xnA_ktgst6GLA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 04/29] libid3tag: move to meta-oe
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>,
 Changqing Li <changqing.li@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
 Marko Lindqvist <cazfi74@gmail.com>,
	Ross Burton <ross.burton@intel.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 23:02:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159397

yeah perhaps meta-multimedia is better for it.

On Wed, Dec 8, 2021 at 2:00 PM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> There are no consumers in oe-core; years ago it used to be gstreamer.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/conf/distro/include/maintainers.inc      |  1 -
>  .../0001-Fix-gperf-3.1-incompatibility.patch  | 40 -----------------
>  .../libid3tag/libid3tag/10_utf16.patch        | 34 ---------------
>  .../libid3tag/libid3tag/addpkgconfig.patch    | 43 -------------------
>  .../libid3tag/libid3tag/cflags_filter.patch   | 19 --------
>  .../libid3tag/obsolete_automake_macros.patch  | 15 -------
>  .../libid3tag/unknown-encoding.patch          | 39 -----------------
>  .../libid3tag/libid3tag_0.15.1b.bb            | 28 ------------
>  8 files changed, 219 deletions(-)
>  delete mode 100644 meta/recipes-multimedia/libid3tag/libid3tag/0001-Fix-gperf-3.1-incompatibility.patch
>  delete mode 100644 meta/recipes-multimedia/libid3tag/libid3tag/10_utf16.patch
>  delete mode 100644 meta/recipes-multimedia/libid3tag/libid3tag/addpkgconfig.patch
>  delete mode 100644 meta/recipes-multimedia/libid3tag/libid3tag/cflags_filter.patch
>  delete mode 100644 meta/recipes-multimedia/libid3tag/libid3tag/obsolete_automake_macros.patch
>  delete mode 100644 meta/recipes-multimedia/libid3tag/libid3tag/unknown-encoding.patch
>  delete mode 100644 meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index cedf1ef937..8e86ea45d2 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -344,7 +344,6 @@ RECIPE_MAINTAINER:pn-libgudev = "Ross Burton <ross.burton@arm.com>"
>  RECIPE_MAINTAINER:pn-libhandy = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER:pn-libical = "Ross Burton <ross.burton@arm.com>"
>  RECIPE_MAINTAINER:pn-libice = "Unassigned <unassigned@yoctoproject.org>"
> -RECIPE_MAINTAINER:pn-libid3tag = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-libidn2 = "Ross Burton <ross.burton@arm.com>"
>  RECIPE_MAINTAINER:pn-libinput = "Ross Burton <ross.burton@arm.com>"
>  RECIPE_MAINTAINER:pn-libjitterentropy = "Ross Burton <ross.burton@arm.com>"
> diff --git a/meta/recipes-multimedia/libid3tag/libid3tag/0001-Fix-gperf-3.1-incompatibility.patch b/meta/recipes-multimedia/libid3tag/libid3tag/0001-Fix-gperf-3.1-incompatibility.patch
> deleted file mode 100644
> index 54f49f6f23..0000000000
> --- a/meta/recipes-multimedia/libid3tag/libid3tag/0001-Fix-gperf-3.1-incompatibility.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -From 91fcf66b9182c75cd2b96d88991d5a1c6307d4b4 Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Wed, 2 Aug 2017 16:27:52 +0300
> -Subject: [PATCH] Fix gperf 3.1 incompatibility.
> -
> -Upstream-Status: Pending
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ----
> - compat.h    | 2 +-
> - frametype.h | 2 +-
> - 2 files changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/compat.h b/compat.h
> -index 8af71ec..b3d80d9 100644
> ---- a/compat.h
> -+++ b/compat.h
> -@@ -34,7 +34,7 @@ struct id3_compat {
> - };
> -
> - struct id3_compat const *id3_compat_lookup(register char const *,
> --                                         register unsigned int);
> -+                                         register size_t);
> -
> - int id3_compat_fixup(struct id3_tag *);
> -
> -diff --git a/frametype.h b/frametype.h
> -index dd064b2..b5b7593 100644
> ---- a/frametype.h
> -+++ b/frametype.h
> -@@ -37,6 +37,6 @@ extern struct id3_frametype const id3_frametype_unknown;
> - extern struct id3_frametype const id3_frametype_obsolete;
> -
> - struct id3_frametype const *id3_frametype_lookup(register char const *,
> --                                               register unsigned int);
> -+                                               register size_t);
> -
> - # endif
> ---
> -2.13.2
> -
> diff --git a/meta/recipes-multimedia/libid3tag/libid3tag/10_utf16.patch b/meta/recipes-multimedia/libid3tag/libid3tag/10_utf16.patch
> deleted file mode 100644
> index 10e089018c..0000000000
> --- a/meta/recipes-multimedia/libid3tag/libid3tag/10_utf16.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -libid3tag: patch for CVE-2004-2779
> -
> -The patch comes from
> -https://sources.debian.org/patches/libid3tag/0.15.1b-13/10_utf16.dpatch
> -
> -Upstream-Status: Pending
> -
> -CVE: CVE-2004-2779
> -CVE: CVE-2017-11551
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> -
> -diff -urNad libid3tag-0.15.1b/utf16.c /tmp/dpep.tKvO7a/libid3tag-0.15.1b/utf16.c
> ---- libid3tag-0.15.1b/utf16.c  2006-01-13 15:26:29.000000000 +0100
> -+++ /tmp/dpep.tKvO7a/libid3tag-0.15.1b/utf16.c 2006-01-13 15:27:19.000000000 +0100
> -@@ -282,5 +282,18 @@
> -
> -   free(utf16);
> -
> -+  if (end == *ptr && length % 2 != 0)
> -+  {
> -+     /* We were called with a bogus length.  It should always
> -+      * be an even number.  We can deal with this in a few ways:
> -+      * - Always give an error.
> -+      * - Try and parse as much as we can and
> -+      *   - return an error if we're called again when we
> -+      *     already tried to parse everything we can.
> -+      *   - tell that we parsed it, which is what we do here.
> -+      */
> -+     (*ptr)++;
> -+  }
> -+
> -   return ucs4;
> - }
> diff --git a/meta/recipes-multimedia/libid3tag/libid3tag/addpkgconfig.patch b/meta/recipes-multimedia/libid3tag/libid3tag/addpkgconfig.patch
> deleted file mode 100644
> index 38d40c3632..0000000000
> --- a/meta/recipes-multimedia/libid3tag/libid3tag/addpkgconfig.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -Upstream-Status: Inappropriate [configuration]
> -
> -Index: libid3tag-0.15.1b/Makefile.am
> -===================================================================
> ---- libid3tag-0.15.1b.orig/Makefile.am 2009-07-29 09:29:20.000000000 +0100
> -+++ libid3tag-0.15.1b/Makefile.am      2009-07-29 09:29:47.000000000 +0100
> -@@ -27,6 +27,9 @@
> - lib_LTLIBRARIES =     libid3tag.la
> - include_HEADERS =     id3tag.h
> -
> -+pkgconfigdir = $(libdir)/pkgconfig
> -+pkgconfig_DATA = id3tag.pc
> -+
> - ## From the libtool documentation on library versioning:
> - ##
> - ## CURRENT
> -Index: libid3tag-0.15.1b/configure.ac
> -===================================================================
> ---- libid3tag-0.15.1b.orig/configure.ac        2009-07-29 09:27:15.000000000 +0100
> -+++ libid3tag-0.15.1b/configure.ac     2009-07-29 09:27:45.000000000 +0100
> -@@ -201,5 +201,5 @@
> - dnl AC_SUBST(LTLIBOBJS)
> -
> - AC_CONFIG_FILES([Makefile msvc++/Makefile  \
> --      libid3tag.list])
> -+      libid3tag.list id3tag.pc])
> - AC_OUTPUT
> -Index: libid3tag-0.15.1b/id3tag.pc.in
> -===================================================================
> ---- /dev/null  1970-01-01 00:00:00.000000000 +0000
> -+++ libid3tag-0.15.1b/id3tag.pc.in     2009-07-29 09:29:10.000000000 +0100
> -@@ -0,0 +1,11 @@
> -+prefix=@prefix@
> -+exec_prefix=@exec_prefix@
> -+libdir=@libdir@
> -+includedir=@includedir@
> -+
> -+Name: id3tag
> -+Description: ID3 tag reading library
> -+Requires:
> -+Version: @VERSION@
> -+Libs: -L${libdir} -lid3tag -lz
> -+Cflags: -I${includedir}
> diff --git a/meta/recipes-multimedia/libid3tag/libid3tag/cflags_filter.patch b/meta/recipes-multimedia/libid3tag/libid3tag/cflags_filter.patch
> deleted file mode 100644
> index 1895748d1d..0000000000
> --- a/meta/recipes-multimedia/libid3tag/libid3tag/cflags_filter.patch
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -configure contains CFLAGS filtering code which was removing our prefix-map
> -flags. We need those to generate reproducible binaries. Allow them through.
> -
> -Upstream-Status: Pending
> -Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> -
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -99,6 +99,10 @@ do
> -       -mno-cygwin)
> -           shift
> -           ;;
> -+      -fmacro-prefix-map*|-fdebug-prefix-map*|-ffile-prefix-map*)
> -+          CFLAGS="$CFLAGS $1"
> -+          shift
> -+          ;;
> -       -m*)
> -           arch="$arch $1"
> -           shift
> diff --git a/meta/recipes-multimedia/libid3tag/libid3tag/obsolete_automake_macros.patch b/meta/recipes-multimedia/libid3tag/libid3tag/obsolete_automake_macros.patch
> deleted file mode 100644
> index 2845fb1d3a..0000000000
> --- a/meta/recipes-multimedia/libid3tag/libid3tag/obsolete_automake_macros.patch
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -Upstream-Status: Submitted [https://sourceforge.net/tracker/?func=detail&aid=3599280&group_id=12349&atid=112349]
> -
> -Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
> -diff -Nurd libid3tag-0.15.1b/configure.ac libid3tag-0.15.1b/configure.ac
> ---- libid3tag-0.15.1b/configure.ac     2004-01-24 01:22:46.000000000 +0200
> -+++ libid3tag-0.15.1b/configure.ac     2013-01-03 06:41:02.734835014 +0200
> -@@ -28,7 +28,7 @@
> -
> --AM_INIT_AUTOMAKE
> -+AM_INIT_AUTOMAKE([foreign])
> -
> --AM_CONFIG_HEADER([config.h])
> -+AC_CONFIG_HEADERS([config.h])
> -
> - dnl System type.
> diff --git a/meta/recipes-multimedia/libid3tag/libid3tag/unknown-encoding.patch b/meta/recipes-multimedia/libid3tag/libid3tag/unknown-encoding.patch
> deleted file mode 100644
> index f0867b5f01..0000000000
> --- a/meta/recipes-multimedia/libid3tag/libid3tag/unknown-encoding.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -In case of an unknown/invalid encoding, id3_parse_string() will
> -return NULL, but the return value wasn't checked resulting
> -in segfault in id3_ucs4_length().  This is the only place
> -the return value wasn't checked.
> -
> -Patch taken from Debian:
> -https://sources.debian.org/patches/libid3tag/0.15.1b-14/11_unknown_encoding.dpatch/
> -
> -CVE: CVE-2017-11550
> -Upstream-Status: Pending
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -diff -urNad libid3tag-0.15.1b~/compat.gperf libid3tag-0.15.1b/compat.gperf
> ---- libid3tag-0.15.1b~/compat.gperf    2004-01-23 09:41:32.000000000 +0000
> -+++ libid3tag-0.15.1b/compat.gperf     2007-01-14 14:36:53.000000000 +0000
> -@@ -236,6 +236,10 @@
> -
> -     encoding = id3_parse_uint(&data, 1);
> -     string   = id3_parse_string(&data, end - data, encoding, 0);
> -+    if (!string)
> -+    {
> -+      continue;
> -+    }
> -
> -     if (id3_ucs4_length(string) < 4) {
> -       free(string);
> -diff -urNad libid3tag-0.15.1b~/parse.c libid3tag-0.15.1b/parse.c
> ---- libid3tag-0.15.1b~/parse.c 2004-01-23 09:41:32.000000000 +0000
> -+++ libid3tag-0.15.1b/parse.c  2007-01-14 14:37:34.000000000 +0000
> -@@ -165,6 +165,9 @@
> -   case ID3_FIELD_TEXTENCODING_UTF_8:
> -     ucs4 = id3_utf8_deserialize(ptr, length);
> -     break;
> -+  default:
> -+      /* FIXME: Unknown encoding! Print warning? */
> -+      return NULL;
> -   }
> -
> -   if (ucs4 && !full) {
> diff --git a/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb b/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
> deleted file mode 100644
> index 80581765ac..0000000000
> --- a/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -SUMMARY = "Library for interacting with ID3 tags in MP3 files"
> -HOMEPAGE = "http://sourceforge.net/projects/mad/"
> -BUGTRACKER = "http://sourceforge.net/tracker/?group_id=12349&atid=112349"
> -LICENSE = "GPLv2+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
> -                       file://COPYRIGHT;md5=5e6279efb87c26c6e5e7a68317a6a87a \
> -                       file://version.h;beginline=1;endline=8;md5=86ac68b67f054b7afde9e149bbc3fe63"
> -SECTION = "libs"
> -DEPENDS = "zlib gperf-native"
> -PR = "r7"
> -
> -SRC_URI = "${SOURCEFORGE_MIRROR}/mad/libid3tag-${PV}.tar.gz \
> -           file://addpkgconfig.patch \
> -           file://obsolete_automake_macros.patch \
> -           file://0001-Fix-gperf-3.1-incompatibility.patch \
> -           file://10_utf16.patch \
> -           file://unknown-encoding.patch \
> -           file://cflags_filter.patch \
> -           "
> -UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/mad/files/libid3tag/"
> -UPSTREAM_CHECK_REGEX = "/projects/mad/files/libid3tag/(?P<pver>.*)/$"
> -
> -SRC_URI[md5sum] = "e5808ad997ba32c498803822078748c3"
> -SRC_URI[sha256sum] = "63da4f6e7997278f8a3fef4c6a372d342f705051d1eeb6a46a86b03610e26151"
> -
> -S = "${WORKDIR}/libid3tag-${PV}"
> -
> -inherit autotools pkgconfig
> --
> 2.20.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159370): https://lists.openembedded.org/g/openembedded-core/message/159370
> Mute This Topic: https://lists.openembedded.org/mt/87599628/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

