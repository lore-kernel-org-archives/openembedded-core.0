Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA2E9C433F5
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 08:56:29 +0000 (UTC)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
 [209.85.222.42])
 by mx.groups.io with SMTP id smtpd.web11.9254.1639040188532453496
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 00:56:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nmPqawOW;
 spf=pass (domain: gmail.com, ip: 209.85.222.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f42.google.com with SMTP id y5so9418298ual.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 00:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DjB6EypNHPCsZMZ0cEOlpOLXhsIUXjAPNPSW2wehUkw=;
        b=nmPqawOWNkU7IGBVmlnMkR+/wDmygGFrngBZThuPnMQoK0Qvw2+5oFs1ubipQzlh9r
         /rBkPApNBVkHcYnwVF2uJjWVtO+kmei/2nXAb1e6V0ecBJi6QhyjeZOIO98/9txJyP5K
         4k7dhIucyXm+AIjbzCRnn3mQJE2ci5ON4yFLAP2wKcoVOOrcU7sHz2Y3A2TWjDaTNFJX
         hzOp680DL4H5EJu5Ty1F06i59VBd82N5/Y5jU52Z0izZKpS4+Ag6X08vo1vGsRGhrtFL
         V+ftkwNPkstRxT7Wz99Adwyq/G9oKpH1DSVP8fqYSdmD2cn8KmHiNKNeuU+9RMG0xuyy
         eVHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DjB6EypNHPCsZMZ0cEOlpOLXhsIUXjAPNPSW2wehUkw=;
        b=i18zOpBFltXihAde53fCXQkDsXmhhgmvj3I1u6EBmybAXFak0CLarfD6h9O8twSlWV
         9CIAUYg+8o0VQjyktA+O7vY8nzijnt7vlOt0h9v9qHEXmuK0mBIdgcCqyaiU8Uo8LYWf
         X1tOYxgR4By6LNz05yiNjObkE1nKfnZwYX8LfxLmZVJWKwqS+2orkshsHDLQ3EshzszZ
         4xCd9PFuF4RJ6N/KL9nsBcGROyx/m9g2duIhVvxjYIbkGHsfqCPyW0vNpdSYIQ1IrZZW
         Czw6RLL0zDjnjmsc3xrWgrC8iALVOq6hYn2295bgN9LcwfKnJ5BgS0loWwUfJaQ+1dJx
         lW8g==
X-Gm-Message-State: AOAM5303sIHWhenHX5gBvouqEvGe0ipI1R7RqxuhY2Mwdqs3ZvbAV0XT
	+a/KxLrBLt3x5+KF2HhMA09fnPxtQ0qQ83bF/7U=
X-Google-Smtp-Source: 
 ABdhPJxeMZHs3M2UeCMuR+0chCcjiOf2bBKG5XWqe7POu9JJh/9uH2/oMr3MUgQqa2p/L89bL0Oh7YgSe6EeYWi1jZ4=
X-Received: by 2002:a67:7105:: with SMTP id m5mr5754224vsc.81.1639040187608;
 Thu, 09 Dec 2021 00:56:27 -0800 (PST)
MIME-Version: 1.0
References: <20211208215947.1979470-1-alex@linutronix.de>
 <20211208215947.1979470-4-alex@linutronix.de>
 <CAMKF1srKXqWAPTQD+UGeArVAh3oP5P3V08tw5xnA_ktgst6GLA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srKXqWAPTQD+UGeArVAh3oP5P3V08tw5xnA_ktgst6GLA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 9 Dec 2021 09:56:16 +0100
Message-ID: 
 <CANNYZj-xAML4u+4U8DeJR+x1J9p5mko2i7ccbbCbH50JwaQ_bg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 04/29] libid3tag: move to meta-oe
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>,
 Changqing Li <changqing.li@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
 Marko Lindqvist <cazfi74@gmail.com>,
	Ross Burton <ross.burton@intel.com>
Content-Type: multipart/alternative; boundary="00000000000027b19e05d2b2c829"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 08:56:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159443

--00000000000027b19e05d2b2c829
Content-Type: text/plain; charset="UTF-8"

It has already landed there a few days ago :)

Alex

On Thu, 9 Dec 2021 at 00:02, Khem Raj <raj.khem@gmail.com> wrote:

> yeah perhaps meta-multimedia is better for it.
>
> On Wed, Dec 8, 2021 at 2:00 PM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
> >
> > There are no consumers in oe-core; years ago it used to be gstreamer.
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  meta/conf/distro/include/maintainers.inc      |  1 -
> >  .../0001-Fix-gperf-3.1-incompatibility.patch  | 40 -----------------
> >  .../libid3tag/libid3tag/10_utf16.patch        | 34 ---------------
> >  .../libid3tag/libid3tag/addpkgconfig.patch    | 43 -------------------
> >  .../libid3tag/libid3tag/cflags_filter.patch   | 19 --------
> >  .../libid3tag/obsolete_automake_macros.patch  | 15 -------
> >  .../libid3tag/unknown-encoding.patch          | 39 -----------------
> >  .../libid3tag/libid3tag_0.15.1b.bb            | 28 ------------
> >  8 files changed, 219 deletions(-)
> >  delete mode 100644
> meta/recipes-multimedia/libid3tag/libid3tag/0001-Fix-gperf-3.1-incompatibility.patch
> >  delete mode 100644
> meta/recipes-multimedia/libid3tag/libid3tag/10_utf16.patch
> >  delete mode 100644
> meta/recipes-multimedia/libid3tag/libid3tag/addpkgconfig.patch
> >  delete mode 100644
> meta/recipes-multimedia/libid3tag/libid3tag/cflags_filter.patch
> >  delete mode 100644
> meta/recipes-multimedia/libid3tag/libid3tag/obsolete_automake_macros.patch
> >  delete mode 100644
> meta/recipes-multimedia/libid3tag/libid3tag/unknown-encoding.patch
> >  delete mode 100644 meta/recipes-multimedia/libid3tag/
> libid3tag_0.15.1b.bb
> >
> > diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> > index cedf1ef937..8e86ea45d2 100644
> > --- a/meta/conf/distro/include/maintainers.inc
> > +++ b/meta/conf/distro/include/maintainers.inc
> > @@ -344,7 +344,6 @@ RECIPE_MAINTAINER:pn-libgudev = "Ross Burton <
> ross.burton@arm.com>"
> >  RECIPE_MAINTAINER:pn-libhandy = "Alexander Kanavin <
> alex.kanavin@gmail.com>"
> >  RECIPE_MAINTAINER:pn-libical = "Ross Burton <ross.burton@arm.com>"
> >  RECIPE_MAINTAINER:pn-libice = "Unassigned <unassigned@yoctoproject.org
> >"
> > -RECIPE_MAINTAINER:pn-libid3tag = "Unassigned <
> unassigned@yoctoproject.org>"
> >  RECIPE_MAINTAINER:pn-libidn2 = "Ross Burton <ross.burton@arm.com>"
> >  RECIPE_MAINTAINER:pn-libinput = "Ross Burton <ross.burton@arm.com>"
> >  RECIPE_MAINTAINER:pn-libjitterentropy = "Ross Burton <
> ross.burton@arm.com>"
> > diff --git
> a/meta/recipes-multimedia/libid3tag/libid3tag/0001-Fix-gperf-3.1-incompatibility.patch
> b/meta/recipes-multimedia/libid3tag/libid3tag/0001-Fix-gperf-3.1-incompatibility.patch
> > deleted file mode 100644
> > index 54f49f6f23..0000000000
> > ---
> a/meta/recipes-multimedia/libid3tag/libid3tag/0001-Fix-gperf-3.1-incompatibility.patch
> > +++ /dev/null
> > @@ -1,40 +0,0 @@
> > -From 91fcf66b9182c75cd2b96d88991d5a1c6307d4b4 Mon Sep 17 00:00:00 2001
> > -From: Alexander Kanavin <alex.kanavin@gmail.com>
> > -Date: Wed, 2 Aug 2017 16:27:52 +0300
> > -Subject: [PATCH] Fix gperf 3.1 incompatibility.
> > -
> > -Upstream-Status: Pending
> > -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ----
> > - compat.h    | 2 +-
> > - frametype.h | 2 +-
> > - 2 files changed, 2 insertions(+), 2 deletions(-)
> > -
> > -diff --git a/compat.h b/compat.h
> > -index 8af71ec..b3d80d9 100644
> > ---- a/compat.h
> > -+++ b/compat.h
> > -@@ -34,7 +34,7 @@ struct id3_compat {
> > - };
> > -
> > - struct id3_compat const *id3_compat_lookup(register char const *,
> > --                                         register unsigned int);
> > -+                                         register size_t);
> > -
> > - int id3_compat_fixup(struct id3_tag *);
> > -
> > -diff --git a/frametype.h b/frametype.h
> > -index dd064b2..b5b7593 100644
> > ---- a/frametype.h
> > -+++ b/frametype.h
> > -@@ -37,6 +37,6 @@ extern struct id3_frametype const
> id3_frametype_unknown;
> > - extern struct id3_frametype const id3_frametype_obsolete;
> > -
> > - struct id3_frametype const *id3_frametype_lookup(register char const *,
> > --                                               register unsigned int);
> > -+                                               register size_t);
> > -
> > - # endif
> > ---
> > -2.13.2
> > -
> > diff --git a/meta/recipes-multimedia/libid3tag/libid3tag/10_utf16.patch
> b/meta/recipes-multimedia/libid3tag/libid3tag/10_utf16.patch
> > deleted file mode 100644
> > index 10e089018c..0000000000
> > --- a/meta/recipes-multimedia/libid3tag/libid3tag/10_utf16.patch
> > +++ /dev/null
> > @@ -1,34 +0,0 @@
> > -libid3tag: patch for CVE-2004-2779
> > -
> > -The patch comes from
> > -https://sources.debian.org/patches/libid3tag/0.15.1b-13/10_utf16.dpatch
> > -
> > -Upstream-Status: Pending
> > -
> > -CVE: CVE-2004-2779
> > -CVE: CVE-2017-11551
> > -
> > -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > -
> > -diff -urNad libid3tag-0.15.1b/utf16.c
> /tmp/dpep.tKvO7a/libid3tag-0.15.1b/utf16.c
> > ---- libid3tag-0.15.1b/utf16.c  2006-01-13 15:26:29.000000000 +0100
> > -+++ /tmp/dpep.tKvO7a/libid3tag-0.15.1b/utf16.c 2006-01-13
> 15:27:19.000000000 +0100
> > -@@ -282,5 +282,18 @@
> > -
> > -   free(utf16);
> > -
> > -+  if (end == *ptr && length % 2 != 0)
> > -+  {
> > -+     /* We were called with a bogus length.  It should always
> > -+      * be an even number.  We can deal with this in a few ways:
> > -+      * - Always give an error.
> > -+      * - Try and parse as much as we can and
> > -+      *   - return an error if we're called again when we
> > -+      *     already tried to parse everything we can.
> > -+      *   - tell that we parsed it, which is what we do here.
> > -+      */
> > -+     (*ptr)++;
> > -+  }
> > -+
> > -   return ucs4;
> > - }
> > diff --git
> a/meta/recipes-multimedia/libid3tag/libid3tag/addpkgconfig.patch
> b/meta/recipes-multimedia/libid3tag/libid3tag/addpkgconfig.patch
> > deleted file mode 100644
> > index 38d40c3632..0000000000
> > --- a/meta/recipes-multimedia/libid3tag/libid3tag/addpkgconfig.patch
> > +++ /dev/null
> > @@ -1,43 +0,0 @@
> > -Upstream-Status: Inappropriate [configuration]
> > -
> > -Index: libid3tag-0.15.1b/Makefile.am
> > -===================================================================
> > ---- libid3tag-0.15.1b.orig/Makefile.am 2009-07-29 09:29:20.000000000
> +0100
> > -+++ libid3tag-0.15.1b/Makefile.am      2009-07-29 09:29:47.000000000
> +0100
> > -@@ -27,6 +27,9 @@
> > - lib_LTLIBRARIES =     libid3tag.la
> > - include_HEADERS =     id3tag.h
> > -
> > -+pkgconfigdir = $(libdir)/pkgconfig
> > -+pkgconfig_DATA = id3tag.pc
> > -+
> > - ## From the libtool documentation on library versioning:
> > - ##
> > - ## CURRENT
> > -Index: libid3tag-0.15.1b/configure.ac
> > -===================================================================
> > ---- libid3tag-0.15.1b.orig/configure.ac        2009-07-29
> 09:27:15.000000000 +0100
> > -+++ libid3tag-0.15.1b/configure.ac     2009-07-29 09:27:45.000000000
> +0100
> > -@@ -201,5 +201,5 @@
> > - dnl AC_SUBST(LTLIBOBJS)
> > -
> > - AC_CONFIG_FILES([Makefile msvc++/Makefile  \
> > --      libid3tag.list])
> > -+      libid3tag.list id3tag.pc])
> > - AC_OUTPUT
> > -Index: libid3tag-0.15.1b/id3tag.pc.in
> > -===================================================================
> > ---- /dev/null  1970-01-01 00:00:00.000000000 +0000
> > -+++ libid3tag-0.15.1b/id3tag.pc.in     2009-07-29 09:29:10.000000000
> +0100
> > -@@ -0,0 +1,11 @@
> > -+prefix=@prefix@
> > -+exec_prefix=@exec_prefix@
> > -+libdir=@libdir@
> > -+includedir=@includedir@
> > -+
> > -+Name: id3tag
> > -+Description: ID3 tag reading library
> > -+Requires:
> > -+Version: @VERSION@
> > -+Libs: -L${libdir} -lid3tag -lz
> > -+Cflags: -I${includedir}
> > diff --git
> a/meta/recipes-multimedia/libid3tag/libid3tag/cflags_filter.patch
> b/meta/recipes-multimedia/libid3tag/libid3tag/cflags_filter.patch
> > deleted file mode 100644
> > index 1895748d1d..0000000000
> > --- a/meta/recipes-multimedia/libid3tag/libid3tag/cflags_filter.patch
> > +++ /dev/null
> > @@ -1,19 +0,0 @@
> > -configure contains CFLAGS filtering code which was removing our
> prefix-map
> > -flags. We need those to generate reproducible binaries. Allow them
> through.
> > -
> > -Upstream-Status: Pending
> > -Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > -
> > ---- a/configure.ac
> > -+++ b/configure.ac
> > -@@ -99,6 +99,10 @@ do
> > -       -mno-cygwin)
> > -           shift
> > -           ;;
> > -+      -fmacro-prefix-map*|-fdebug-prefix-map*|-ffile-prefix-map*)
> > -+          CFLAGS="$CFLAGS $1"
> > -+          shift
> > -+          ;;
> > -       -m*)
> > -           arch="$arch $1"
> > -           shift
> > diff --git
> a/meta/recipes-multimedia/libid3tag/libid3tag/obsolete_automake_macros.patch
> b/meta/recipes-multimedia/libid3tag/libid3tag/obsolete_automake_macros.patch
> > deleted file mode 100644
> > index 2845fb1d3a..0000000000
> > ---
> a/meta/recipes-multimedia/libid3tag/libid3tag/obsolete_automake_macros.patch
> > +++ /dev/null
> > @@ -1,15 +0,0 @@
> > -Upstream-Status: Submitted [
> https://sourceforge.net/tracker/?func=detail&aid=3599280&group_id=12349&atid=112349
> ]
> > -
> > -Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
> > -diff -Nurd libid3tag-0.15.1b/configure.ac libid3tag-0.15.1b/
> configure.ac
> > ---- libid3tag-0.15.1b/configure.ac     2004-01-24 01:22:46.000000000
> +0200
> > -+++ libid3tag-0.15.1b/configure.ac     2013-01-03 06:41:02.734835014
> +0200
> > -@@ -28,7 +28,7 @@
> > -
> > --AM_INIT_AUTOMAKE
> > -+AM_INIT_AUTOMAKE([foreign])
> > -
> > --AM_CONFIG_HEADER([config.h])
> > -+AC_CONFIG_HEADERS([config.h])
> > -
> > - dnl System type.
> > diff --git
> a/meta/recipes-multimedia/libid3tag/libid3tag/unknown-encoding.patch
> b/meta/recipes-multimedia/libid3tag/libid3tag/unknown-encoding.patch
> > deleted file mode 100644
> > index f0867b5f01..0000000000
> > --- a/meta/recipes-multimedia/libid3tag/libid3tag/unknown-encoding.patch
> > +++ /dev/null
> > @@ -1,39 +0,0 @@
> > -In case of an unknown/invalid encoding, id3_parse_string() will
> > -return NULL, but the return value wasn't checked resulting
> > -in segfault in id3_ucs4_length().  This is the only place
> > -the return value wasn't checked.
> > -
> > -Patch taken from Debian:
> > -
> https://sources.debian.org/patches/libid3tag/0.15.1b-14/11_unknown_encoding.dpatch/
> > -
> > -CVE: CVE-2017-11550
> > -Upstream-Status: Pending
> > -Signed-off-by: Ross Burton <ross.burton@intel.com>
> > -
> > -diff -urNad libid3tag-0.15.1b~/compat.gperf
> libid3tag-0.15.1b/compat.gperf
> > ---- libid3tag-0.15.1b~/compat.gperf    2004-01-23 09:41:32.000000000
> +0000
> > -+++ libid3tag-0.15.1b/compat.gperf     2007-01-14 14:36:53.000000000
> +0000
> > -@@ -236,6 +236,10 @@
> > -
> > -     encoding = id3_parse_uint(&data, 1);
> > -     string   = id3_parse_string(&data, end - data, encoding, 0);
> > -+    if (!string)
> > -+    {
> > -+      continue;
> > -+    }
> > -
> > -     if (id3_ucs4_length(string) < 4) {
> > -       free(string);
> > -diff -urNad libid3tag-0.15.1b~/parse.c libid3tag-0.15.1b/parse.c
> > ---- libid3tag-0.15.1b~/parse.c 2004-01-23 09:41:32.000000000 +0000
> > -+++ libid3tag-0.15.1b/parse.c  2007-01-14 14:37:34.000000000 +0000
> > -@@ -165,6 +165,9 @@
> > -   case ID3_FIELD_TEXTENCODING_UTF_8:
> > -     ucs4 = id3_utf8_deserialize(ptr, length);
> > -     break;
> > -+  default:
> > -+      /* FIXME: Unknown encoding! Print warning? */
> > -+      return NULL;
> > -   }
> > -
> > -   if (ucs4 && !full) {
> > diff --git a/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
> b/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
> > deleted file mode 100644
> > index 80581765ac..0000000000
> > --- a/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
> > +++ /dev/null
> > @@ -1,28 +0,0 @@
> > -SUMMARY = "Library for interacting with ID3 tags in MP3 files"
> > -HOMEPAGE = "http://sourceforge.net/projects/mad/"
> > -BUGTRACKER = "
> http://sourceforge.net/tracker/?group_id=12349&atid=112349"
> > -LICENSE = "GPLv2+"
> > -LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f
> \
> > -
>  file://COPYRIGHT;md5=5e6279efb87c26c6e5e7a68317a6a87a \
> > -
>  file://version.h;beginline=1;endline=8;md5=86ac68b67f054b7afde9e149bbc3fe63"
> > -SECTION = "libs"
> > -DEPENDS = "zlib gperf-native"
> > -PR = "r7"
> > -
> > -SRC_URI = "${SOURCEFORGE_MIRROR}/mad/libid3tag-${PV}.tar.gz \
> > -           file://addpkgconfig.patch \
> > -           file://obsolete_automake_macros.patch \
> > -           file://0001-Fix-gperf-3.1-incompatibility.patch \
> > -           file://10_utf16.patch \
> > -           file://unknown-encoding.patch \
> > -           file://cflags_filter.patch \
> > -           "
> > -UPSTREAM_CHECK_URI = "
> https://sourceforge.net/projects/mad/files/libid3tag/"
> > -UPSTREAM_CHECK_REGEX = "/projects/mad/files/libid3tag/(?P<pver>.*)/$"
> > -
> > -SRC_URI[md5sum] = "e5808ad997ba32c498803822078748c3"
> > -SRC_URI[sha256sum] =
> "63da4f6e7997278f8a3fef4c6a372d342f705051d1eeb6a46a86b03610e26151"
> > -
> > -S = "${WORKDIR}/libid3tag-${PV}"
> > -
> > -inherit autotools pkgconfig
> > --
> > 2.20.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#159370):
> https://lists.openembedded.org/g/openembedded-core/message/159370
> > Mute This Topic: https://lists.openembedded.org/mt/87599628/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--00000000000027b19e05d2b2c829
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>It has already landed there a few days ago :)</div><d=
iv><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Thu, 9 Dec 2021 at 00:02, Khem Raj &lt;<=
a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">yeah perhaps meta-mu=
ltimedia is better for it.<br>
<br>
On Wed, Dec 8, 2021 at 2:00 PM Alexander Kanavin &lt;<a href=3D"mailto:alex=
.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:=
<br>
&gt;<br>
&gt; There are no consumers in oe-core; years ago it used to be gstreamer.<=
br>
&gt;<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix=
.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 1 -<br>
&gt;=C2=A0 .../0001-Fix-gperf-3.1-incompatibility.patch=C2=A0 | 40 --------=
---------<br>
&gt;=C2=A0 .../libid3tag/libid3tag/10_utf16.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 34 ---------------<br>
&gt;=C2=A0 .../libid3tag/libid3tag/addpkgconfig.patch=C2=A0 =C2=A0 | 43 ---=
----------------<br>
&gt;=C2=A0 .../libid3tag/libid3tag/cflags_filter.patch=C2=A0 =C2=A0| 19 ---=
-----<br>
&gt;=C2=A0 .../libid3tag/obsolete_automake_macros.patch=C2=A0 | 15 -------<=
br>
&gt;=C2=A0 .../libid3tag/unknown-encoding.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 39 -----------------<br>
&gt;=C2=A0 .../libid3tag/<a href=3D"http://libid3tag_0.15.1b.bb" rel=3D"nor=
eferrer" target=3D"_blank">libid3tag_0.15.1b.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 28 ------------<br>
&gt;=C2=A0 8 files changed, 219 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-multimedia/libid3tag/libid3tag/0=
001-Fix-gperf-3.1-incompatibility.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-multimedia/libid3tag/libid3tag/1=
0_utf16.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-multimedia/libid3tag/libid3tag/a=
ddpkgconfig.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-multimedia/libid3tag/libid3tag/c=
flags_filter.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-multimedia/libid3tag/libid3tag/o=
bsolete_automake_macros.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-multimedia/libid3tag/libid3tag/u=
nknown-encoding.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-multimedia/libid3tag/<a href=3D"=
http://libid3tag_0.15.1b.bb" rel=3D"noreferrer" target=3D"_blank">libid3tag=
_0.15.1b.bb</a><br>
&gt;<br>
&gt; diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/dist=
ro/include/maintainers.inc<br>
&gt; index cedf1ef937..8e86ea45d2 100644<br>
&gt; --- a/meta/conf/distro/include/maintainers.inc<br>
&gt; +++ b/meta/conf/distro/include/maintainers.inc<br>
&gt; @@ -344,7 +344,6 @@ RECIPE_MAINTAINER:pn-libgudev =3D &quot;Ross Burto=
n &lt;<a href=3D"mailto:ross.burton@arm.com" target=3D"_blank">ross.burton@=
arm.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-libhandy =3D &quot;Alexander Kanavin &lt;<a=
 href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmai=
l.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-libical =3D &quot;Ross Burton &lt;<a href=
=3D"mailto:ross.burton@arm.com" target=3D"_blank">ross.burton@arm.com</a>&g=
t;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-libice =3D &quot;Unassigned &lt;<a href=3D"=
mailto:unassigned@yoctoproject.org" target=3D"_blank">unassigned@yoctoproje=
ct.org</a>&gt;&quot;<br>
&gt; -RECIPE_MAINTAINER:pn-libid3tag =3D &quot;Unassigned &lt;<a href=3D"ma=
ilto:unassigned@yoctoproject.org" target=3D"_blank">unassigned@yoctoproject=
.org</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-libidn2 =3D &quot;Ross Burton &lt;<a href=
=3D"mailto:ross.burton@arm.com" target=3D"_blank">ross.burton@arm.com</a>&g=
t;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-libinput =3D &quot;Ross Burton &lt;<a href=
=3D"mailto:ross.burton@arm.com" target=3D"_blank">ross.burton@arm.com</a>&g=
t;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-libjitterentropy =3D &quot;Ross Burton &lt;=
<a href=3D"mailto:ross.burton@arm.com" target=3D"_blank">ross.burton@arm.co=
m</a>&gt;&quot;<br>
&gt; diff --git a/meta/recipes-multimedia/libid3tag/libid3tag/0001-Fix-gper=
f-3.1-incompatibility.patch b/meta/recipes-multimedia/libid3tag/libid3tag/0=
001-Fix-gperf-3.1-incompatibility.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 54f49f6f23..0000000000<br>
&gt; --- a/meta/recipes-multimedia/libid3tag/libid3tag/0001-Fix-gperf-3.1-i=
ncompatibility.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,40 +0,0 @@<br>
&gt; -From 91fcf66b9182c75cd2b96d88991d5a1c6307d4b4 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
 target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; -Date: Wed, 2 Aug 2017 16:27:52 +0300<br>
&gt; -Subject: [PATCH] Fix gperf 3.1 incompatibility.<br>
&gt; -<br>
&gt; -Upstream-Status: Pending<br>
&gt; -Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ----<br>
&gt; - compat.h=C2=A0 =C2=A0 | 2 +-<br>
&gt; - frametype.h | 2 +-<br>
&gt; - 2 files changed, 2 insertions(+), 2 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/compat.h b/compat.h<br>
&gt; -index 8af71ec..b3d80d9 100644<br>
&gt; ---- a/compat.h<br>
&gt; -+++ b/compat.h<br>
&gt; -@@ -34,7 +34,7 @@ struct id3_compat {<br>
&gt; - };<br>
&gt; -<br>
&gt; - struct id3_compat const *id3_compat_lookup(register char const *,<br=
>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0register unsigned int);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0register size_t);<br>
&gt; -<br>
&gt; - int id3_compat_fixup(struct id3_tag *);<br>
&gt; -<br>
&gt; -diff --git a/frametype.h b/frametype.h<br>
&gt; -index dd064b2..b5b7593 100644<br>
&gt; ---- a/frametype.h<br>
&gt; -+++ b/frametype.h<br>
&gt; -@@ -37,6 +37,6 @@ extern struct id3_frametype const id3_frametype_unk=
nown;<br>
&gt; - extern struct id3_frametype const id3_frametype_obsolete;<br>
&gt; -<br>
&gt; - struct id3_frametype const *id3_frametype_lookup(register char const=
 *,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0register unsigned int);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0register size_t);<br>
&gt; -<br>
&gt; - # endif<br>
&gt; ---<br>
&gt; -2.13.2<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-multimedia/libid3tag/libid3tag/10_utf16.patc=
h b/meta/recipes-multimedia/libid3tag/libid3tag/10_utf16.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 10e089018c..0000000000<br>
&gt; --- a/meta/recipes-multimedia/libid3tag/libid3tag/10_utf16.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,34 +0,0 @@<br>
&gt; -libid3tag: patch for CVE-2004-2779<br>
&gt; -<br>
&gt; -The patch comes from<br>
&gt; -<a href=3D"https://sources.debian.org/patches/libid3tag/0.15.1b-13/10=
_utf16.dpatch" rel=3D"noreferrer" target=3D"_blank">https://sources.debian.=
org/patches/libid3tag/0.15.1b-13/10_utf16.dpatch</a><br>
&gt; -<br>
&gt; -Upstream-Status: Pending<br>
&gt; -<br>
&gt; -CVE: CVE-2004-2779<br>
&gt; -CVE: CVE-2017-11551<br>
&gt; -<br>
&gt; -Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windri=
ver.com" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
&gt; -<br>
&gt; -diff -urNad libid3tag-0.15.1b/utf16.c /tmp/dpep.tKvO7a/libid3tag-0.15=
.1b/utf16.c<br>
&gt; ---- libid3tag-0.15.1b/utf16.c=C2=A0 2006-01-13 15:26:29.000000000 +01=
00<br>
&gt; -+++ /tmp/dpep.tKvO7a/libid3tag-0.15.1b/utf16.c 2006-01-13 15:27:19.00=
0000000 +0100<br>
&gt; -@@ -282,5 +282,18 @@<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0free(utf16);<br>
&gt; -<br>
&gt; -+=C2=A0 if (end =3D=3D *ptr &amp;&amp; length % 2 !=3D 0)<br>
&gt; -+=C2=A0 {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0/* We were called with a bogus length.=C2=A0 It =
should always<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 * be an even number.=C2=A0 We can deal with thi=
s in a few ways:<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 * - Always give an error.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 * - Try and parse as much as we can and<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0- return an error if we&#39;re ca=
lled again when we<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0already tried to parse eve=
rything we can.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0- tell that we parsed it, which i=
s what we do here.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0(*ptr)++;<br>
&gt; -+=C2=A0 }<br>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0return ucs4;<br>
&gt; - }<br>
&gt; diff --git a/meta/recipes-multimedia/libid3tag/libid3tag/addpkgconfig.=
patch b/meta/recipes-multimedia/libid3tag/libid3tag/addpkgconfig.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 38d40c3632..0000000000<br>
&gt; --- a/meta/recipes-multimedia/libid3tag/libid3tag/addpkgconfig.patch<b=
r>
&gt; +++ /dev/null<br>
&gt; @@ -1,43 +0,0 @@<br>
&gt; -Upstream-Status: Inappropriate [configuration]<br>
&gt; -<br>
&gt; -Index: libid3tag-0.15.1b/Makefile.am<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- libid3tag-0.15.1b.orig/Makefile.am 2009-07-29 09:29:20.000000000 =
+0100<br>
&gt; -+++ libid3tag-0.15.1b/Makefile.am=C2=A0 =C2=A0 =C2=A0 2009-07-29 09:2=
9:47.000000000 +0100<br>
&gt; -@@ -27,6 +27,9 @@<br>
&gt; - lib_LTLIBRARIES =3D=C2=A0 =C2=A0 =C2=A0<a href=3D"http://libid3tag.l=
a" rel=3D"noreferrer" target=3D"_blank">libid3tag.la</a><br>
&gt; - include_HEADERS =3D=C2=A0 =C2=A0 =C2=A0id3tag.h<br>
&gt; -<br>
&gt; -+pkgconfigdir =3D $(libdir)/pkgconfig<br>
&gt; -+pkgconfig_DATA =3D id3tag.pc<br>
&gt; -+<br>
&gt; - ## From the libtool documentation on library versioning:<br>
&gt; - ##<br>
&gt; - ## CURRENT<br>
&gt; -Index: libid3tag-0.15.1b/<a href=3D"http://configure.ac" rel=3D"noref=
errer" target=3D"_blank">configure.ac</a><br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- libid3tag-0.15.1b.orig/<a href=3D"http://configure.ac" rel=3D"nor=
eferrer" target=3D"_blank">configure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 2009=
-07-29 09:27:15.000000000 +0100<br>
&gt; -+++ libid3tag-0.15.1b/<a href=3D"http://configure.ac" rel=3D"noreferr=
er" target=3D"_blank">configure.ac</a>=C2=A0 =C2=A0 =C2=A02009-07-29 09:27:=
45.000000000 +0100<br>
&gt; -@@ -201,5 +201,5 @@<br>
&gt; - dnl AC_SUBST(LTLIBOBJS)<br>
&gt; -<br>
&gt; - AC_CONFIG_FILES([Makefile msvc++/Makefile=C2=A0 \<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 libid3tag.list])<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 libid3tag.list id3tag.pc])<br>
&gt; - AC_OUTPUT<br>
&gt; -Index: libid3tag-0.15.1b/<a href=3D"http://id3tag.pc.in" rel=3D"noref=
errer" target=3D"_blank">id3tag.pc.in</a><br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- /dev/null=C2=A0 1970-01-01 00:00:00.000000000 +0000<br>
&gt; -+++ libid3tag-0.15.1b/<a href=3D"http://id3tag.pc.in" rel=3D"noreferr=
er" target=3D"_blank">id3tag.pc.in</a>=C2=A0 =C2=A0 =C2=A02009-07-29 09:29:=
10.000000000 +0100<br>
&gt; -@@ -0,0 +1,11 @@<br>
&gt; -+prefix=3D@prefix@<br>
&gt; -+exec_prefix=3D@exec_prefix@<br>
&gt; -+libdir=3D@libdir@<br>
&gt; -+includedir=3D@includedir@<br>
&gt; -+<br>
&gt; -+Name: id3tag<br>
&gt; -+Description: ID3 tag reading library<br>
&gt; -+Requires:<br>
&gt; -+Version: @VERSION@<br>
&gt; -+Libs: -L${libdir} -lid3tag -lz<br>
&gt; -+Cflags: -I${includedir}<br>
&gt; diff --git a/meta/recipes-multimedia/libid3tag/libid3tag/cflags_filter=
.patch b/meta/recipes-multimedia/libid3tag/libid3tag/cflags_filter.patch<br=
>
&gt; deleted file mode 100644<br>
&gt; index 1895748d1d..0000000000<br>
&gt; --- a/meta/recipes-multimedia/libid3tag/libid3tag/cflags_filter.patch<=
br>
&gt; +++ /dev/null<br>
&gt; @@ -1,19 +0,0 @@<br>
&gt; -configure contains CFLAGS filtering code which was removing our prefi=
x-map<br>
&gt; -flags. We need those to generate reproducible binaries. Allow them th=
rough.<br>
&gt; -<br>
&gt; -Upstream-Status: Pending<br>
&gt; -Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@li=
nuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>=
&gt;<br>
&gt; -<br>
&gt; ---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; -+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; -@@ -99,6 +99,10 @@ do<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0-mno-cygwin)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shift<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 -fmacro-prefix-map*|-fdebug-prefix-map*|-ffile-=
prefix-map*)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CFLAGS=3D&quot;$CFLAGS $1&quot;<b=
r>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shift<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0-m*)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arch=3D&quot;$arch $1&quot;<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shift<br>
&gt; diff --git a/meta/recipes-multimedia/libid3tag/libid3tag/obsolete_auto=
make_macros.patch b/meta/recipes-multimedia/libid3tag/libid3tag/obsolete_au=
tomake_macros.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 2845fb1d3a..0000000000<br>
&gt; --- a/meta/recipes-multimedia/libid3tag/libid3tag/obsolete_automake_ma=
cros.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,15 +0,0 @@<br>
&gt; -Upstream-Status: Submitted [<a href=3D"https://sourceforge.net/tracke=
r/?func=3Ddetail&amp;aid=3D3599280&amp;group_id=3D12349&amp;atid=3D112349" =
rel=3D"noreferrer" target=3D"_blank">https://sourceforge.net/tracker/?func=
=3Ddetail&amp;aid=3D3599280&amp;group_id=3D12349&amp;atid=3D112349</a>]<br>
&gt; -<br>
&gt; -Signed-off-by: Marko Lindqvist &lt;<a href=3D"mailto:cazfi74@gmail.co=
m" target=3D"_blank">cazfi74@gmail.com</a>&gt;<br>
&gt; -diff -Nurd libid3tag-0.15.1b/<a href=3D"http://configure.ac" rel=3D"n=
oreferrer" target=3D"_blank">configure.ac</a> libid3tag-0.15.1b/<a href=3D"=
http://configure.ac" rel=3D"noreferrer" target=3D"_blank">configure.ac</a><=
br>
&gt; ---- libid3tag-0.15.1b/<a href=3D"http://configure.ac" rel=3D"noreferr=
er" target=3D"_blank">configure.ac</a>=C2=A0 =C2=A0 =C2=A02004-01-24 01:22:=
46.000000000 +0200<br>
&gt; -+++ libid3tag-0.15.1b/<a href=3D"http://configure.ac" rel=3D"noreferr=
er" target=3D"_blank">configure.ac</a>=C2=A0 =C2=A0 =C2=A02013-01-03 06:41:=
02.734835014 +0200<br>
&gt; -@@ -28,7 +28,7 @@<br>
&gt; -<br>
&gt; --AM_INIT_AUTOMAKE<br>
&gt; -+AM_INIT_AUTOMAKE([foreign])<br>
&gt; -<br>
&gt; --AM_CONFIG_HEADER([config.h])<br>
&gt; -+AC_CONFIG_HEADERS([config.h])<br>
&gt; -<br>
&gt; - dnl System type.<br>
&gt; diff --git a/meta/recipes-multimedia/libid3tag/libid3tag/unknown-encod=
ing.patch b/meta/recipes-multimedia/libid3tag/libid3tag/unknown-encoding.pa=
tch<br>
&gt; deleted file mode 100644<br>
&gt; index f0867b5f01..0000000000<br>
&gt; --- a/meta/recipes-multimedia/libid3tag/libid3tag/unknown-encoding.pat=
ch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,39 +0,0 @@<br>
&gt; -In case of an unknown/invalid encoding, id3_parse_string() will<br>
&gt; -return NULL, but the return value wasn&#39;t checked resulting<br>
&gt; -in segfault in id3_ucs4_length().=C2=A0 This is the only place<br>
&gt; -the return value wasn&#39;t checked.<br>
&gt; -<br>
&gt; -Patch taken from Debian:<br>
&gt; -<a href=3D"https://sources.debian.org/patches/libid3tag/0.15.1b-14/11=
_unknown_encoding.dpatch/" rel=3D"noreferrer" target=3D"_blank">https://sou=
rces.debian.org/patches/libid3tag/0.15.1b-14/11_unknown_encoding.dpatch/</a=
><br>
&gt; -<br>
&gt; -CVE: CVE-2017-11550<br>
&gt; -Upstream-Status: Pending<br>
&gt; -Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.co=
m" target=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt; -<br>
&gt; -diff -urNad libid3tag-0.15.1b~/compat.gperf libid3tag-0.15.1b/compat.=
gperf<br>
&gt; ---- libid3tag-0.15.1b~/compat.gperf=C2=A0 =C2=A0 2004-01-23 09:41:32.=
000000000 +0000<br>
&gt; -+++ libid3tag-0.15.1b/compat.gperf=C2=A0 =C2=A0 =C2=A02007-01-14 14:3=
6:53.000000000 +0000<br>
&gt; -@@ -236,6 +236,10 @@<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0encoding =3D id3_parse_uint(&amp;data, 1);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0string=C2=A0 =C2=A0=3D id3_parse_string(&amp;data=
, end - data, encoding, 0);<br>
&gt; -+=C2=A0 =C2=A0 if (!string)<br>
&gt; -+=C2=A0 =C2=A0 {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 continue;<br>
&gt; -+=C2=A0 =C2=A0 }<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (id3_ucs4_length(string) &lt; 4) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0free(string);<br>
&gt; -diff -urNad libid3tag-0.15.1b~/parse.c libid3tag-0.15.1b/parse.c<br>
&gt; ---- libid3tag-0.15.1b~/parse.c 2004-01-23 09:41:32.000000000 +0000<br=
>
&gt; -+++ libid3tag-0.15.1b/parse.c=C2=A0 2007-01-14 14:37:34.000000000 +00=
00<br>
&gt; -@@ -165,6 +165,9 @@<br>
&gt; -=C2=A0 =C2=A0case ID3_FIELD_TEXTENCODING_UTF_8:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ucs4 =3D id3_utf8_deserialize(ptr, length);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0break;<br>
&gt; -+=C2=A0 default:<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 /* FIXME: Unknown encoding! Print warning? */<b=
r>
&gt; -+=C2=A0 =C2=A0 =C2=A0 return NULL;<br>
&gt; -=C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0if (ucs4 &amp;&amp; !full) {<br>
&gt; diff --git a/meta/recipes-multimedia/libid3tag/<a href=3D"http://libid=
3tag_0.15.1b.bb" rel=3D"noreferrer" target=3D"_blank">libid3tag_0.15.1b.bb<=
/a> b/meta/recipes-multimedia/libid3tag/<a href=3D"http://libid3tag_0.15.1b=
.bb" rel=3D"noreferrer" target=3D"_blank">libid3tag_0.15.1b.bb</a><br>
&gt; deleted file mode 100644<br>
&gt; index 80581765ac..0000000000<br>
&gt; --- a/meta/recipes-multimedia/libid3tag/<a href=3D"http://libid3tag_0.=
15.1b.bb" rel=3D"noreferrer" target=3D"_blank">libid3tag_0.15.1b.bb</a><br>
&gt; +++ /dev/null<br>
&gt; @@ -1,28 +0,0 @@<br>
&gt; -SUMMARY =3D &quot;Library for interacting with ID3 tags in MP3 files&=
quot;<br>
&gt; -HOMEPAGE =3D &quot;<a href=3D"http://sourceforge.net/projects/mad/" r=
el=3D"noreferrer" target=3D"_blank">http://sourceforge.net/projects/mad/</a=
>&quot;<br>
&gt; -BUGTRACKER =3D &quot;<a href=3D"http://sourceforge.net/tracker/?group=
_id=3D12349&amp;atid=3D112349" rel=3D"noreferrer" target=3D"_blank">http://=
sourceforge.net/tracker/?group_id=3D12349&amp;atid=3D112349</a>&quot;<br>
&gt; -LICENSE =3D &quot;GPLv2+&quot;<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D94d55d512a9ba36caa9b7=
df079bae19f \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0file://COPYRIGHT;md5=3D5e6279efb87c26c6e5e7a68317a6a87a \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0file://version.h;beginline=3D1;endline=3D8;md5=3D86ac68b67f05=
4b7afde9e149bbc3fe63&quot;<br>
&gt; -SECTION =3D &quot;libs&quot;<br>
&gt; -DEPENDS =3D &quot;zlib gperf-native&quot;<br>
&gt; -PR =3D &quot;r7&quot;<br>
&gt; -<br>
&gt; -SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/mad/libid3tag-${PV}.tar.gz \<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://addpkgconfig.patch \<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://obsolete_automake_mac=
ros.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-gperf-3.1-in=
compatibility.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://10_utf16.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://unknown-encoding.patc=
h \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://cflags_filter.patch \=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; -UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://sourceforge.net/proje=
cts/mad/files/libid3tag/" rel=3D"noreferrer" target=3D"_blank">https://sour=
ceforge.net/projects/mad/files/libid3tag/</a>&quot;<br>
&gt; -UPSTREAM_CHECK_REGEX =3D &quot;/projects/mad/files/libid3tag/(?P&lt;p=
ver&gt;.*)/$&quot;<br>
&gt; -<br>
&gt; -SRC_URI[md5sum] =3D &quot;e5808ad997ba32c498803822078748c3&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;63da4f6e7997278f8a3fef4c6a372d342f705051=
d1eeb6a46a86b03610e26151&quot;<br>
&gt; -<br>
&gt; -S =3D &quot;${WORKDIR}/libid3tag-${PV}&quot;<br>
&gt; -<br>
&gt; -inherit autotools pkgconfig<br>
&gt; --<br>
&gt; 2.20.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#159370): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/159370" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/159370</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87599628=
/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/87599628/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--00000000000027b19e05d2b2c829--

