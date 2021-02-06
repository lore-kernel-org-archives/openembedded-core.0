Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web09.8927.1612631043918360194
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Feb 2021 09:04:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=M6ojCOOC;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id es14so5076714qvb.3
        for <openembedded-core@lists.openembedded.org>; Sat, 06 Feb 2021 09:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rM67u/2+YS+8mar1dHpqjhPo801gDSa3VYgpPfxTNyA=;
        b=M6ojCOOCLVh4kupifpKm/c8isXcSPNCgGIB4Zcz4BTLo2URJHkTh95RKr0r5n2PZ/Q
         q1AdxrEjmyUQk7dhRGuVNHM7StfOSApbOzyE9Hus8pRY0grPLKSIYNTOwfy6gj2s0hri
         p8eYsJQWWnOshNrMFXY9EX1oMJQnfBCBhHK95XsyLS6yA5uvg9fChyCrNZR5jlya+6I1
         /baiwPqvqlBHDfM2x10EdqqNE1nf86cbivK6Y5m+LIvcEtQDKfDuEuESkhsn759PLOne
         loybD8hvBDhUujd8REOtvQf1q7HP4NCUjklj2EdFDDBFducQvT17KEMo/r71XsnVeUyN
         8P3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rM67u/2+YS+8mar1dHpqjhPo801gDSa3VYgpPfxTNyA=;
        b=ULzA/LZ72OhvybzDOZKC0a/u0pR+tLvZePhXA3xRBiS0HjB9rfp1aVKvTa61VOePfW
         wnnuJXtabSTsMuXcjvhS3fGMmusMMeEcqiz7qyrEfYmuEoyxhKrW3J44eEyClmgd//77
         DYxSH4xqoZWtJznLNleAUlWShO9kGAbMFK6lq60N+Qw3QIdhQI7jzgZrQ6muqzu8eJHH
         tvKtOPvwZvpRn/BxGarWpHKKauDXEvGmH+8KXn5GtCaspW/z44vtK6sGYwDj2vUf8ppM
         zHAWzIKEbjNzucrdhM7XeYLf9P9lYqv7OJJvuls5M8uKmXbZYPKa+KjnzAVe8qHAao1U
         PWoQ==
X-Gm-Message-State: AOAM531hLsA+/PROxWkPRUG/UVtH90XmFtIiI0kV8tBXXXQEOKTMzIo9
	E2+hTjeJiG0jQZ1/FbU9mVI4Ik21BMwNWbj0fLjIFZXL90o=
X-Google-Smtp-Source: ABdhPJwJ9cCe29TDpWyi8JeGzqX9HVq4MlAHdLc+dly3nKVvqWdoKjyEDBsPGPoyxUbSKzugd5EPsZL+d92iVDyFJZc=
X-Received: by 2002:a05:6214:571:: with SMTP id cj17mr9299378qvb.38.1612631042633;
 Sat, 06 Feb 2021 09:04:02 -0800 (PST)
MIME-Version: 1.0
References: <20210206090415.1707868-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20210206090415.1707868-1-richard.purdie@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 6 Feb 2021 09:03:36 -0800
Message-ID: <CAMKF1sp55+1X8cAdJXn-JnexERpnhu-+BNFzL-CJBS4ri=-vmw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 01/10] Revert "lrzsz: Fix to work with autoconf 2.70"
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Ross Burton <ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"

this series looks ok to me.

On Sat, Feb 6, 2021 at 1:04 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> From: Ross Burton <ross.burton@arm.com>
>
> This change was only needed with 2.70, it is not needed with 2.71.
>
> This reverts commit 36aef08dcd5e45c4138ccd72e8de01157f7213c4.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../lrzsz-0.12.20/autotools-update.patch      | 249 ++++++++----------
>  1 file changed, 107 insertions(+), 142 deletions(-)
>
> diff --git a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/autotools-update.patch b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/autotools-update.patch
> index 4a50f7410a2..33af38b4a8d 100644
> --- a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/autotools-update.patch
> +++ b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/autotools-update.patch
> @@ -3,10 +3,9 @@ Update autotools infrastructure (including gettext) to modern versions.
>  Upstream-Status: Pending
>  Signed-off-by: Phil Blundell <pb@pbcl.net>
>
> -Index: lrzsz-0.12.20/configure.in
> -===================================================================
> ---- lrzsz-0.12.20.orig/configure.in
> -+++ lrzsz-0.12.20/configure.in
> +diff -uprN clean/lrzsz-0.12.20/configure.in lrzsz-0.12.20/configure.in
> +--- clean/lrzsz-0.12.20/configure.in   1998-12-30 07:50:07.000000000 +0000
> ++++ lrzsz-0.12.20/configure.in 2019-11-25 16:22:37.000000000 +0000
>  @@ -92,7 +92,6 @@ AC_PROG_RANLIB
>   AC_ISC_POSIX
>   AC_AIX
> @@ -15,7 +14,7 @@ Index: lrzsz-0.12.20/configure.in
>   AC_C_CONST
>   AC_C_INLINE
>
> -@@ -253,18 +252,14 @@ ihave$lookup_facility
> +@@ -253,18 +252,13 @@ ihave$lookup_facility
>   fi
>
>
> @@ -25,7 +24,6 @@ Index: lrzsz-0.12.20/configure.in
>
>  -AM_GNU_GETTEXT
>  +AM_GNU_GETTEXT([external])
> -+AM_GNU_GETTEXT_VERSION([0.21])
>
>  -AC_DEFINE_UNQUOTED(LOCALEDIR,"$prefix/$DATADIRNAME")
>  -AC_LINK_FILES($nls_cv_header_libgt, $nls_cv_header_intl)
> @@ -38,10 +36,9 @@ Index: lrzsz-0.12.20/configure.in
>  +[
>   chmod +x debian/rules;
>   test -z "$CONFIG_HEADERS" || echo timestamp > stamp-h])
> -Index: lrzsz-0.12.20/intl/bindtextdom.c
> -===================================================================
> ---- lrzsz-0.12.20.orig/intl/bindtextdom.c
> -+++ /dev/null
> +diff -uprN clean/lrzsz-0.12.20/intl/bindtextdom.c lrzsz-0.12.20/intl/bindtextdom.c
> +--- clean/lrzsz-0.12.20/intl/bindtextdom.c     1998-04-26 14:22:36.000000000 +0100
> ++++ lrzsz-0.12.20/intl/bindtextdom.c   1970-01-01 01:00:00.000000000 +0100
>  @@ -1,199 +0,0 @@
>  -/* Implementation of the bindtextdomain(3) function
>  -   Copyright (C) 1995, 1996, 1997 Free Software Foundation, Inc.
> @@ -242,10 +239,9 @@ Index: lrzsz-0.12.20/intl/bindtextdom.c
>  -/* Alias for function name in GNU C Library.  */
>  -weak_alias (__bindtextdomain, bindtextdomain);
>  -#endif
> -Index: lrzsz-0.12.20/intl/cat-compat.c
> -===================================================================
> ---- lrzsz-0.12.20.orig/intl/cat-compat.c
> -+++ /dev/null
> +diff -uprN clean/lrzsz-0.12.20/intl/cat-compat.c lrzsz-0.12.20/intl/cat-compat.c
> +--- clean/lrzsz-0.12.20/intl/cat-compat.c      1998-04-26 14:22:37.000000000 +0100
> ++++ lrzsz-0.12.20/intl/cat-compat.c    1970-01-01 01:00:00.000000000 +0100
>  @@ -1,262 +0,0 @@
>  -/* Compatibility code for gettext-using-catgets interface.
>  -   Copyright (C) 1995, 1997 Free Software Foundation, Inc.
> @@ -509,10 +505,9 @@ Index: lrzsz-0.12.20/intl/cat-compat.c
>  -  return dest - 1;
>  -}
>  -#endif
> -Index: lrzsz-0.12.20/intl/ChangeLog
> -===================================================================
> ---- lrzsz-0.12.20.orig/intl/ChangeLog
> -+++ /dev/null
> +diff -uprN clean/lrzsz-0.12.20/intl/ChangeLog lrzsz-0.12.20/intl/ChangeLog
> +--- clean/lrzsz-0.12.20/intl/ChangeLog 1998-04-26 14:22:35.000000000 +0100
> ++++ lrzsz-0.12.20/intl/ChangeLog       1970-01-01 01:00:00.000000000 +0100
>  @@ -1,1022 +0,0 @@
>  -1997-09-06 02:10  Ulrich Drepper  <drepper@cygnus.com>
>  -
> @@ -1536,10 +1531,9 @@ Index: lrzsz-0.12.20/intl/ChangeLog
>  -      which allow to use the X/Open catgets function with an interface
>  -      like the Uniforum gettext function.  For system which does not
>  -      have neither of those a complete implementation is provided.
> -Index: lrzsz-0.12.20/intl/dcgettext.c
> -===================================================================
> ---- lrzsz-0.12.20.orig/intl/dcgettext.c
> -+++ /dev/null
> +diff -uprN clean/lrzsz-0.12.20/intl/dcgettext.c lrzsz-0.12.20/intl/dcgettext.c
> +--- clean/lrzsz-0.12.20/intl/dcgettext.c       1998-04-26 14:22:36.000000000 +0100
> ++++ lrzsz-0.12.20/intl/dcgettext.c     1970-01-01 01:00:00.000000000 +0100
>  @@ -1,593 +0,0 @@
>  -/* Implementation of the dcgettext(3) function
>  -   Copyright (C) 1995, 1996, 1997 Free Software Foundation, Inc.
> @@ -2134,10 +2128,9 @@ Index: lrzsz-0.12.20/intl/dcgettext.c
>  -  return dest - 1;
>  -}
>  -#endif
> -Index: lrzsz-0.12.20/intl/dgettext.c
> -===================================================================
> ---- lrzsz-0.12.20.orig/intl/dgettext.c
> -+++ /dev/null
> +diff -uprN clean/lrzsz-0.12.20/intl/dgettext.c lrzsz-0.12.20/intl/dgettext.c
> +--- clean/lrzsz-0.12.20/intl/dgettext.c        1998-04-26 14:20:52.000000000 +0100
> ++++ lrzsz-0.12.20/intl/dgettext.c      1970-01-01 01:00:00.000000000 +0100
>  @@ -1,59 +0,0 @@
>  -/* dgettext.c -- implementation of the dgettext(3) function
>  -   Copyright (C) 1995 Software Foundation, Inc.
> @@ -2198,10 +2191,9 @@ Index: lrzsz-0.12.20/intl/dgettext.c
>  -/* Alias for function name in GNU C Library.  */
>  -weak_alias (__dgettext, dgettext);
>  -#endif
> -Index: lrzsz-0.12.20/intl/explodename.c
> -===================================================================
> ---- lrzsz-0.12.20.orig/intl/explodename.c
> -+++ /dev/null
> +diff -uprN clean/lrzsz-0.12.20/intl/explodename.c lrzsz-0.12.20/intl/explodename.c
> +--- clean/lrzsz-0.12.20/intl/explodename.c     1998-04-26 14:22:37.000000000 +0100
> ++++ lrzsz-0.12.20/intl/explodename.c   1970-01-01 01:00:00.000000000 +0100
>  @@ -1,181 +0,0 @@
>  -/* Copyright (C) 1995, 1996, 1997 Free Software Foundation, Inc.
>  -   Contributed by Ulrich Drepper <drepper@gnu.ai.mit.edu>, 1995.
> @@ -2384,10 +2376,9 @@ Index: lrzsz-0.12.20/intl/explodename.c
>  -
>  -  return mask;
>  -}
> -Index: lrzsz-0.12.20/intl/finddomain.c
> -===================================================================
> ---- lrzsz-0.12.20.orig/intl/finddomain.c
> -+++ /dev/null
> +diff -uprN clean/lrzsz-0.12.20/intl/finddomain.c lrzsz-0.12.20/intl/finddomain.c
> +--- clean/lrzsz-0.12.20/intl/finddomain.c      1998-04-26 14:22:36.000000000 +0100
> ++++ lrzsz-0.12.20/intl/finddomain.c    1970-01-01 01:00:00.000000000 +0100
>  @@ -1,189 +0,0 @@
>  -/* Handle list of needed message catalogs
>  -   Copyright (C) 1995, 1996, 1997 Free Software Foundation, Inc.
> @@ -2578,10 +2569,9 @@ Index: lrzsz-0.12.20/intl/finddomain.c
>  -
>  -  return retval;
>  -}
> -Index: lrzsz-0.12.20/intl/gettext.c
> -===================================================================
> ---- lrzsz-0.12.20.orig/intl/gettext.c
> -+++ /dev/null
> +diff -uprN clean/lrzsz-0.12.20/intl/gettext.c lrzsz-0.12.20/intl/gettext.c
> +--- clean/lrzsz-0.12.20/intl/gettext.c 1998-04-26 14:22:36.000000000 +0100
> ++++ lrzsz-0.12.20/intl/gettext.c       1970-01-01 01:00:00.000000000 +0100
>  @@ -1,70 +0,0 @@
>  -/* Implementation of gettext(3) function
>  -   Copyright (C) 1995, 1997 Free Software Foundation, Inc.
> @@ -2653,10 +2643,9 @@ Index: lrzsz-0.12.20/intl/gettext.c
>  -/* Alias for function name in GNU C Library.  */
>  -weak_alias (__gettext, gettext);
>  -#endif
> -Index: lrzsz-0.12.20/intl/gettext.h
> -===================================================================
> ---- lrzsz-0.12.20.orig/intl/gettext.h
> -+++ /dev/null
> +diff -uprN clean/lrzsz-0.12.20/intl/gettext.h lrzsz-0.12.20/intl/gettext.h
> +--- clean/lrzsz-0.12.20/intl/gettext.h 1998-04-26 14:22:35.000000000 +0100
> ++++ lrzsz-0.12.20/intl/gettext.h       1970-01-01 01:00:00.000000000 +0100
>  @@ -1,105 +0,0 @@
>  -/* Internal header for GNU gettext internationalization functions
>  -   Copyright (C) 1995, 1997 Free Software Foundation, Inc.
> @@ -2763,10 +2752,9 @@ Index: lrzsz-0.12.20/intl/gettext.h
>  -/* @@ begin of epilog @@ */
>  -
>  -#endif        /* gettext.h  */
> -Index: lrzsz-0.12.20/intl/gettextP.h
> -===================================================================
> ---- lrzsz-0.12.20.orig/intl/gettextP.h
> -+++ /dev/null
> +diff -uprN clean/lrzsz-0.12.20/intl/gettextP.h lrzsz-0.12.20/intl/gettextP.h
> +--- clean/lrzsz-0.12.20/intl/gettextP.h        1998-04-26 14:22:35.000000000 +0100
> ++++ lrzsz-0.12.20/intl/gettextP.h      1970-01-01 01:00:00.000000000 +0100
>  @@ -1,73 +0,0 @@
>  -/* Header describing internals of gettext library
>  -   Copyright (C) 1995, 1996, 1997 Free Software Foundation, Inc.
> @@ -2841,10 +2829,9 @@ Index: lrzsz-0.12.20/intl/gettextP.h
>  -/* @@ begin of epilog @@ */
>  -
>  -#endif /* gettextP.h  */
> -Index: lrzsz-0.12.20/intl/hash-string.h
> -===================================================================
> ---- lrzsz-0.12.20.orig/intl/hash-string.h
> -+++ /dev/null
> +diff -uprN clean/lrzsz-0.12.20/intl/hash-string.h lrzsz-0.12.20/intl/hash-string.h
> +--- clean/lrzsz-0.12.20/intl/hash-string.h     1998-04-26 14:22:36.000000000 +0100
> ++++ lrzsz-0.12.20/intl/hash-string.h   1970-01-01 01:00:00.000000000 +0100
>  @@ -1,63 +0,0 @@
>  -/* Implements a string hashing function.
>  -   Copyright (C) 1995, 1997 Free Software Foundation, Inc.
> @@ -2909,10 +2896,9 @@ Index: lrzsz-0.12.20/intl/hash-string.h
>  -    }
>  -  return hval;
>  -}
> -Index: lrzsz-0.12.20/intl/intl-compat.c
> -===================================================================
> ---- lrzsz-0.12.20.orig/intl/intl-compat.c
> -+++ /dev/null
> +diff -uprN clean/lrzsz-0.12.20/intl/intl-compat.c lrzsz-0.12.20/intl/intl-compat.c
> +--- clean/lrzsz-0.12.20/intl/intl-compat.c     1998-04-26 14:20:52.000000000 +0100
> ++++ lrzsz-0.12.20/intl/intl-compat.c   1970-01-01 01:00:00.000000000 +0100
>  @@ -1,76 +0,0 @@
>  -/* intl-compat.c - Stub functions to call gettext functions from GNU gettext
>  -   Library.
> @@ -2990,10 +2976,9 @@ Index: lrzsz-0.12.20/intl/intl-compat.c
>  -{
>  -  return textdomain__ (domainname);
>  -}
> -Index: lrzsz-0.12.20/intl/l10nflist.c
> -===================================================================
> ---- lrzsz-0.12.20.orig/intl/l10nflist.c
> -+++ /dev/null
> +diff -uprN clean/lrzsz-0.12.20/intl/l10nflist.c lrzsz-0.12.20/intl/l10nflist.c
> +--- clean/lrzsz-0.12.20/intl/l10nflist.c       1998-04-26 14:22:37.000000000 +0100
> ++++ lrzsz-0.12.20/intl/l10nflist.c     1970-01-01 01:00:00.000000000 +0100
>  @@ -1,409 +0,0 @@
>  -/* Handle list of needed message catalogs
>  -   Copyright (C) 1995, 1996, 1997 Free Software Foundation, Inc.
> @@ -3404,10 +3389,9 @@ Index: lrzsz-0.12.20/intl/l10nflist.c
>  -  return dest - 1;
>  -}
>  -#endif
> -Index: lrzsz-0.12.20/intl/libgettext.h
> -===================================================================
> ---- lrzsz-0.12.20.orig/intl/libgettext.h
> -+++ /dev/null
> +diff -uprN clean/lrzsz-0.12.20/intl/libgettext.h lrzsz-0.12.20/intl/libgettext.h
> +--- clean/lrzsz-0.12.20/intl/libgettext.h      1998-04-26 14:22:36.000000000 +0100
> ++++ lrzsz-0.12.20/intl/libgettext.h    1970-01-01 01:00:00.000000000 +0100
>  @@ -1,182 +0,0 @@
>  -/* Message catalogs for internationalization.
>  -   Copyright (C) 1995, 1996, 1997 Free Software Foundation, Inc.
> @@ -3591,10 +3575,9 @@ Index: lrzsz-0.12.20/intl/libgettext.h
>  -#endif
>  -
>  -#endif
> -Index: lrzsz-0.12.20/intl/linux-msg.sed
> -===================================================================
> ---- lrzsz-0.12.20.orig/intl/linux-msg.sed
> -+++ /dev/null
> +diff -uprN clean/lrzsz-0.12.20/intl/linux-msg.sed lrzsz-0.12.20/intl/linux-msg.sed
> +--- clean/lrzsz-0.12.20/intl/linux-msg.sed     1998-04-26 14:20:52.000000000 +0100
> ++++ lrzsz-0.12.20/intl/linux-msg.sed   1970-01-01 01:00:00.000000000 +0100
>  @@ -1,100 +0,0 @@
>  -# po2msg.sed - Convert Uniforum style .po file to Linux style .msg file
>  -# Copyright (C) 1995 Free Software Foundation, Inc.
> @@ -3696,10 +3679,9 @@ Index: lrzsz-0.12.20/intl/linux-msg.sed
>  -  tb
>  -}
>  -d
> -Index: lrzsz-0.12.20/intl/loadinfo.h
> -===================================================================
> ---- lrzsz-0.12.20.orig/intl/loadinfo.h
> -+++ /dev/null
> +diff -uprN clean/lrzsz-0.12.20/intl/loadinfo.h lrzsz-0.12.20/intl/loadinfo.h
> +--- clean/lrzsz-0.12.20/intl/loadinfo.h        1998-04-26 14:20:52.000000000 +0100
> ++++ lrzsz-0.12.20/intl/loadinfo.h      1970-01-01 01:00:00.000000000 +0100
>  @@ -1,58 +0,0 @@
>  -#ifndef PARAMS
>  -# if __STDC__
> @@ -3759,10 +3741,9 @@ Index: lrzsz-0.12.20/intl/loadinfo.h
>  -                                   const char **special,
>  -                                   const char **sponsor,
>  -                                   const char **revision));
> -Index: lrzsz-0.12.20/intl/loadmsgcat.c
> -===================================================================
> ---- lrzsz-0.12.20.orig/intl/loadmsgcat.c
> -+++ /dev/null
> +diff -uprN clean/lrzsz-0.12.20/intl/loadmsgcat.c lrzsz-0.12.20/intl/loadmsgcat.c
> +--- clean/lrzsz-0.12.20/intl/loadmsgcat.c      1998-04-26 14:22:37.000000000 +0100
> ++++ lrzsz-0.12.20/intl/loadmsgcat.c    1970-01-01 01:00:00.000000000 +0100
>  @@ -1,199 +0,0 @@
>  -/* Load needed message catalogs
>  -   Copyright (C) 1995, 1996, 1997 Free Software Foundation, Inc.
> @@ -3963,10 +3944,9 @@ Index: lrzsz-0.12.20/intl/loadmsgcat.c
>  -     translations invalid.  */
>  -  ++_nl_msg_cat_cntr;
>  -}
> -Index: lrzsz-0.12.20/intl/localealias.c
> -===================================================================
> ---- lrzsz-0.12.20.orig/intl/localealias.c
> -+++ /dev/null
> +diff -uprN clean/lrzsz-0.12.20/intl/localealias.c lrzsz-0.12.20/intl/localealias.c
> +--- clean/lrzsz-0.12.20/intl/localealias.c     1998-04-26 14:22:37.000000000 +0100
> ++++ lrzsz-0.12.20/intl/localealias.c   1970-01-01 01:00:00.000000000 +0100
>  @@ -1,378 +0,0 @@
>  -/* Handle aliases for locale names
>  -   Copyright (C) 1995, 1996, 1997 Free Software Foundation, Inc.
> @@ -4346,10 +4326,9 @@ Index: lrzsz-0.12.20/intl/localealias.c
>  -  return c1 - c2;
>  -#endif
>  -}
> -Index: lrzsz-0.12.20/intl/Makefile.in
> -===================================================================
> ---- lrzsz-0.12.20.orig/intl/Makefile.in
> -+++ /dev/null
> +diff -uprN clean/lrzsz-0.12.20/intl/Makefile.in lrzsz-0.12.20/intl/Makefile.in
> +--- clean/lrzsz-0.12.20/intl/Makefile.in       1998-04-26 14:22:35.000000000 +0100
> ++++ lrzsz-0.12.20/intl/Makefile.in     1970-01-01 01:00:00.000000000 +0100
>  @@ -1,214 +0,0 @@
>  -# Makefile for directory with message catalog handling in GNU NLS Utilities.
>  -# Copyright (C) 1995, 1996, 1997 Free Software Foundation, Inc.
> @@ -4565,10 +4544,9 @@ Index: lrzsz-0.12.20/intl/Makefile.in
>  -# Tell versions [3.59,3.63) of GNU make not to export all variables.
>  -# Otherwise a system limit (for SysV at least) may be exceeded.
>  -.NOEXPORT:
> -Index: lrzsz-0.12.20/intl/po2tbl.sed.in
> -===================================================================
> ---- lrzsz-0.12.20.orig/intl/po2tbl.sed.in
> -+++ /dev/null
> +diff -uprN clean/lrzsz-0.12.20/intl/po2tbl.sed.in lrzsz-0.12.20/intl/po2tbl.sed.in
> +--- clean/lrzsz-0.12.20/intl/po2tbl.sed.in     1998-04-26 14:20:52.000000000 +0100
> ++++ lrzsz-0.12.20/intl/po2tbl.sed.in   1970-01-01 01:00:00.000000000 +0100
>  @@ -1,102 +0,0 @@
>  -# po2tbl.sed - Convert Uniforum style .po file to lookup table for catgets
>  -# Copyright (C) 1995 Free Software Foundation, Inc.
> @@ -4672,10 +4650,9 @@ Index: lrzsz-0.12.20/intl/po2tbl.sed.in
>  -  s/0*\(.*\)/int _msg_tbl_length = \1;/p
>  -}
>  -d
> -Index: lrzsz-0.12.20/intl/textdomain.c
> -===================================================================
> ---- lrzsz-0.12.20.orig/intl/textdomain.c
> -+++ /dev/null
> +diff -uprN clean/lrzsz-0.12.20/intl/textdomain.c lrzsz-0.12.20/intl/textdomain.c
> +--- clean/lrzsz-0.12.20/intl/textdomain.c      1998-04-26 14:22:37.000000000 +0100
> ++++ lrzsz-0.12.20/intl/textdomain.c    1970-01-01 01:00:00.000000000 +0100
>  @@ -1,106 +0,0 @@
>  -/* Implementation of the textdomain(3) function
>  -   Copyright (C) 1995, 1996, 1997 Free Software Foundation, Inc.
> @@ -4783,16 +4760,14 @@ Index: lrzsz-0.12.20/intl/textdomain.c
>  -/* Alias for function name in GNU C Library.  */
>  -weak_alias (__textdomain, textdomain);
>  -#endif
> -Index: lrzsz-0.12.20/intl/VERSION
> -===================================================================
> ---- lrzsz-0.12.20.orig/intl/VERSION
> -+++ /dev/null
> +diff -uprN clean/lrzsz-0.12.20/intl/VERSION lrzsz-0.12.20/intl/VERSION
> +--- clean/lrzsz-0.12.20/intl/VERSION   1998-04-26 14:22:37.000000000 +0100
> ++++ lrzsz-0.12.20/intl/VERSION 1970-01-01 01:00:00.000000000 +0100
>  @@ -1 +0,0 @@
>  -GNU gettext library from gettext-0.10.32
> -Index: lrzsz-0.12.20/intl/xopen-msg.sed
> -===================================================================
> ---- lrzsz-0.12.20.orig/intl/xopen-msg.sed
> -+++ /dev/null
> +diff -uprN clean/lrzsz-0.12.20/intl/xopen-msg.sed lrzsz-0.12.20/intl/xopen-msg.sed
> +--- clean/lrzsz-0.12.20/intl/xopen-msg.sed     1998-04-26 14:20:52.000000000 +0100
> ++++ lrzsz-0.12.20/intl/xopen-msg.sed   1970-01-01 01:00:00.000000000 +0100
>  @@ -1,104 +0,0 @@
>  -# po2msg.sed - Convert Uniforum style .po file to X/Open style .msg file
>  -# Copyright (C) 1995 Free Software Foundation, Inc.
> @@ -4898,10 +4873,9 @@ Index: lrzsz-0.12.20/intl/xopen-msg.sed
>  -  tb
>  -}
>  -d
> -Index: lrzsz-0.12.20/lib/Makefile.am
> -===================================================================
> ---- lrzsz-0.12.20.orig/lib/Makefile.am
> -+++ lrzsz-0.12.20/lib/Makefile.am
> +diff -uprN clean/lrzsz-0.12.20/lib/Makefile.am lrzsz-0.12.20/lib/Makefile.am
> +--- clean/lrzsz-0.12.20/lib/Makefile.am        1998-12-27 16:25:26.000000000 +0000
> ++++ lrzsz-0.12.20/lib/Makefile.am      2019-11-25 16:22:34.000000000 +0000
>  @@ -1,6 +1,4 @@
>   noinst_LIBRARIES=libzmodem.a
>  -CFLAGS=@CFLAGS@
> @@ -4909,10 +4883,9 @@ Index: lrzsz-0.12.20/lib/Makefile.am
>
>   EXTRA_DIST = alloca.c ansi2knr.1 ansi2knr.c \
>         getopt.c getopt1.c mkdir.c mktime.c \
> -Index: lrzsz-0.12.20/Makefile.am
> -===================================================================
> ---- lrzsz-0.12.20.orig/Makefile.am
> -+++ lrzsz-0.12.20/Makefile.am
> +diff -uprN clean/lrzsz-0.12.20/Makefile.am lrzsz-0.12.20/Makefile.am
> +--- clean/lrzsz-0.12.20/Makefile.am    1998-12-30 11:19:40.000000000 +0000
> ++++ lrzsz-0.12.20/Makefile.am  2019-11-26 11:47:29.000000000 +0000
>  @@ -1,5 +1,5 @@
>  -SUBDIRS = lib intl src po man testsuite
>  -EXTRA_DIST = check.lrzsz COMPATABILITY README.cvs README.isdn4linux \
> @@ -4935,10 +4908,9 @@ Index: lrzsz-0.12.20/Makefile.am
>
>  +
>  +ACLOCAL_AMFLAGS = -I m4
> -Index: lrzsz-0.12.20/po/cat-id-tbl.c
> -===================================================================
> ---- lrzsz-0.12.20.orig/po/cat-id-tbl.c
> -+++ /dev/null
> +diff -uprN clean/lrzsz-0.12.20/po/cat-id-tbl.c lrzsz-0.12.20/po/cat-id-tbl.c
> +--- clean/lrzsz-0.12.20/po/cat-id-tbl.c        1998-12-29 09:24:24.000000000 +0000
> ++++ lrzsz-0.12.20/po/cat-id-tbl.c      1970-01-01 01:00:00.000000000 +0100
>  @@ -1,234 +0,0 @@
>  -/* Automatically generated by po2tbl.sed from lrzsz.pot.  */
>  -
> @@ -5174,10 +5146,10 @@ Index: lrzsz-0.12.20/po/cat-id-tbl.c
>  -};
>  -
>  -int _msg_tbl_length = 136;
> -Index: lrzsz-0.12.20/po/de.po
> -===================================================================
> ---- lrzsz-0.12.20.orig/po/de.po
> -+++ lrzsz-0.12.20/po/de.po
> +Binary files clean/lrzsz-0.12.20/po/de.gmo and lrzsz-0.12.20/po/de.gmo differ
> +diff -uprN clean/lrzsz-0.12.20/po/de.po lrzsz-0.12.20/po/de.po
> +--- clean/lrzsz-0.12.20/po/de.po       1998-12-30 16:31:46.000000000 +0000
> ++++ lrzsz-0.12.20/po/de.po     2019-11-26 11:42:07.000000000 +0000
>  @@ -6,10 +6,12 @@
>   msgid ""
>   msgstr ""
> @@ -5412,10 +5384,9 @@ Index: lrzsz-0.12.20/po/de.po
>   #: src/lrz.c:2079
>   msgid "rzfile: reached stop time"
>   msgstr "rzfile: Abbruchzeit erreicht"
> -Index: lrzsz-0.12.20/po/lrzsz.pot
> -===================================================================
> ---- lrzsz-0.12.20.orig/po/lrzsz.pot
> -+++ lrzsz-0.12.20/po/lrzsz.pot
> +diff -uprN clean/lrzsz-0.12.20/po/lrzsz.pot lrzsz-0.12.20/po/lrzsz.pot
> +--- clean/lrzsz-0.12.20/po/lrzsz.pot   1998-12-30 07:50:00.000000000 +0000
> ++++ lrzsz-0.12.20/po/lrzsz.pot 2019-11-26 11:39:12.000000000 +0000
>  @@ -1,24 +1,27 @@
>   # SOME DESCRIPTIVE TITLE.
>   # Copyright (C) YEAR Free Software Foundation, Inc.
> @@ -5647,10 +5618,9 @@ Index: lrzsz-0.12.20/po/lrzsz.pot
>   #: src/lrz.c:2079
>   msgid "rzfile: reached stop time"
>   msgstr ""
> -Index: lrzsz-0.12.20/po/Makevars
> -===================================================================
> ---- /dev/null
> -+++ lrzsz-0.12.20/po/Makevars
> +diff -uprN clean/lrzsz-0.12.20/po/Makevars lrzsz-0.12.20/po/Makevars
> +--- clean/lrzsz-0.12.20/po/Makevars    1970-01-01 01:00:00.000000000 +0100
> ++++ lrzsz-0.12.20/po/Makevars  2019-11-25 18:09:52.000000000 +0000
>  @@ -0,0 +1,78 @@
>  +# Makefile variables for PO directory in any package using GNU gettext.
>  +
> @@ -5730,22 +5700,19 @@ Index: lrzsz-0.12.20/po/Makevars
>  +# "no".  Set this to no if the POT file and PO files are maintained
>  +# externally.
>  +DIST_DEPENDS_ON_UPDATE_PO = yes
> -Index: lrzsz-0.12.20/po/stamp-cat-id
> -===================================================================
> ---- lrzsz-0.12.20.orig/po/stamp-cat-id
> -+++ /dev/null
> +diff -uprN clean/lrzsz-0.12.20/po/stamp-cat-id lrzsz-0.12.20/po/stamp-cat-id
> +--- clean/lrzsz-0.12.20/po/stamp-cat-id        1998-12-30 07:50:01.000000000 +0000
> ++++ lrzsz-0.12.20/po/stamp-cat-id      1970-01-01 01:00:00.000000000 +0100
>  @@ -1 +0,0 @@
>  -timestamp
> -Index: lrzsz-0.12.20/po/stamp-po
> -===================================================================
> ---- /dev/null
> -+++ lrzsz-0.12.20/po/stamp-po
> +diff -uprN clean/lrzsz-0.12.20/po/stamp-po lrzsz-0.12.20/po/stamp-po
> +--- clean/lrzsz-0.12.20/po/stamp-po    1970-01-01 01:00:00.000000000 +0100
> ++++ lrzsz-0.12.20/po/stamp-po  2019-11-26 11:42:09.000000000 +0000
>  @@ -0,0 +1 @@
>  +timestamp
> -Index: lrzsz-0.12.20/src/Makefile.am
> -===================================================================
> ---- lrzsz-0.12.20.orig/src/Makefile.am
> -+++ lrzsz-0.12.20/src/Makefile.am
> +diff -uprN clean/lrzsz-0.12.20/src/Makefile.am lrzsz-0.12.20/src/Makefile.am
> +--- clean/lrzsz-0.12.20/src/Makefile.am        1998-12-28 08:38:47.000000000 +0000
> ++++ lrzsz-0.12.20/src/Makefile.am      2019-11-25 16:22:49.000000000 +0000
>  @@ -2,13 +2,11 @@ bin_PROGRAMS=lrz lsz
>   lrz_SOURCES=lrz.c timing.c zperr.c zreadline.c crctab.c rbsb.c zm.c protname.c tcp.c lsyslog.c canit.c
>   lsz_SOURCES=lsz.c timing.c zperr.c zreadline.c crctab.c rbsb.c zm.c protname.c tcp.c lsyslog.c canit.c
> @@ -5762,10 +5729,9 @@ Index: lrzsz-0.12.20/src/Makefile.am
>   EXTRA_DIST = ansi2knr.1 ansi2knr.c lrzszbug.in
>   INCLUDES = -I.. -I$(srcdir) -I$(top_srcdir)/src -I../intl -I$(top_srcdir)/lib
>   #DEFS = -DLOCALEDIR=\"$(localedir)\" -DOS=\"@host_os@\" -DCPU=\"@host_cpu@\"
> -Index: lrzsz-0.12.20/src/zglobal.h
> -===================================================================
> ---- lrzsz-0.12.20.orig/src/zglobal.h
> -+++ lrzsz-0.12.20/src/zglobal.h
> +diff -uprN clean/lrzsz-0.12.20/src/zglobal.h lrzsz-0.12.20/src/zglobal.h
> +--- clean/lrzsz-0.12.20/src/zglobal.h  1998-12-29 12:34:59.000000000 +0000
> ++++ lrzsz-0.12.20/src/zglobal.h        2019-11-25 16:32:42.000000000 +0000
>  @@ -180,9 +180,6 @@ struct termios;
>   #if HAVE_LOCALE_H
>   # include <locale.h>
> @@ -5776,9 +5742,8 @@ Index: lrzsz-0.12.20/src/zglobal.h
>
>   #if ENABLE_NLS
>   # include <libintl.h>
> -Index: lrzsz-0.12.20/stamp-h.in
> -===================================================================
> ---- lrzsz-0.12.20.orig/stamp-h.in
> -+++ /dev/null
> +diff -uprN clean/lrzsz-0.12.20/stamp-h.in lrzsz-0.12.20/stamp-h.in
> +--- clean/lrzsz-0.12.20/stamp-h.in     1998-12-30 07:51:07.000000000 +0000
> ++++ lrzsz-0.12.20/stamp-h.in   1970-01-01 01:00:00.000000000 +0100
>  @@ -1 +0,0 @@
>  -timestamp
> --
> 2.27.0
>
>
> 
>
