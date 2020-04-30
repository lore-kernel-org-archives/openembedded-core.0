Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
 by mx.groups.io with SMTP id smtpd.web12.440.1588266149291879095
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 10:02:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ip7ytDbm;
 spf=pass (domain: gmail.com, ip: 209.85.221.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f182.google.com with SMTP id q200so1968017vka.13
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 10:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hwmPEK9cssaOx40rZHuT9Di89HBPDCY//M5jR8/egC8=;
        b=ip7ytDbmuBX/VCmw02rrSbgDPtS2ttVeIVVR7RaA9XNr/J4Yr0itYuTD+ziOdlLCIX
         jjUqf9fLuhKEdaz/7pz83VWCRDtDq/HeqrsW9DCjhxBEmTwG997yMKZK9If9RW/Vvo5g
         3B7zdyQL09RkFhkBv9ElDv+XIODoJQQWu5PtNV4z7oeQ7gWNMUSnNSd8zYjPL7Daxa4A
         ChmNCIMo2Y2AwueYSev5ph8KzuXp++tsst0dfDmE9L4VTB7lRIgIQksymMRyENczMTTP
         gg7T1O2WNT7pQ33IhC+w4PbfVLHl00WUL+jeDT+9hKL5rjm/5MQbuCr8aRa/fDF/N+c8
         OYQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hwmPEK9cssaOx40rZHuT9Di89HBPDCY//M5jR8/egC8=;
        b=t1FLQLVLlZ+9p/BEwnAxVs0Y/rGSwemGq8N9vHLx15WAc3Y5tDqv7UZL9DNiLsaWhD
         0LCVsCqB+15LeTdUkPe7jls7P4j6Gl+NoIj4fIyQoHjAGxS9y+4BRBV2/GBQ7yTRbx7D
         adTRUSwt6t9IEwhKBor8HXxmxuP+dYTXXMrNmy4Wlxi9P+J7zbcxzQlBfP13D0NpTy+N
         sPQUuYel6+o/aZTJlX/Fv/WKEAnR8tbNC/ZwhShV80C7mnwDDxGs9WMgZS83AH3p8oPT
         x5fIypoUCEaKK5EGLNKia+9/LljpNTPZrfkeXVacvavGa16hGleN9Orib2dyujxMdgkz
         f35A==
X-Gm-Message-State: AGi0PuZP77mvnojdMmz3qRPYohFSvBiTjFwJH/E+Tedo4SICWnA3qwFW
	/n2Hlug6BOBwi//4sfWcyK2NKx1GLrHtEhpGRe4=
X-Google-Smtp-Source: APiQypLbP520s/cRCLROgkWry25HEFEUUBhOMvzLAY5rh96geewQ9pfBC7uFlXETXT05JJhteQEmCjQ3Ct7uL94bRBY=
X-Received: by 2002:a1f:908c:: with SMTP id s134mr3616179vkd.1.1588266148083;
 Thu, 30 Apr 2020 10:02:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200430095815.2824-1-alex.kanavin@gmail.com> <20200430095815.2824-10-alex.kanavin@gmail.com>
 <fcd6ba95-741e-e858-eb4f-20d757bd29db@gmail.com>
In-Reply-To: <fcd6ba95-741e-e858-eb4f-20d757bd29db@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 30 Apr 2020 19:02:16 +0200
Message-ID: <CANNYZj9RrB=jGX+Ba-XhtkNujpyjmZcnd-rHSFJJ5uzH=9vOUg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 10/17] ghostscript: update 9.50 -> 9.52
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000090be2005a485073d"

--00000000000090be2005a485073d
Content-Type: text/plain; charset="UTF-8"

As far as I understand, yes:

http://git.ghostscript.com/?p=ghostpdl.git;a=blob;f=configure.ac;h=5a005ff16bc222f572695f569ce068a1153ed8b7;hb=HEAD#l3345

This seems to be cross-compiler safe to me: $host does not match $build
(which implies the block is meant for cross compile scenarios),
and the macros are all determined via AC_CHECK_SIZEOF/AC_CHECK_ALIGNOF
which are cross compile safe.
https://www.gnu.org/software/autoconf/manual/autoconf-2.67/html_node/Generic-Compiler-Characteristics.html

Alex


On Thu, 30 Apr 2020 at 17:48, Khem Raj <raj.khem@gmail.com> wrote:

> they were generated in past too, but they were not cross compiler safe.
> has that changed ?
>
> > Freetype can no longer be disabled.
> >
> > Building out of source tree is broken.
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >   .../do-not-check-local-libpng-source.patch    | 37 ++++------
> >   .../ghostscript/CVE-2019-14869-0001.patch     | 70 -------------------
> >   .../ghostscript/ghostscript/aarch64/objarch.h | 40 -----------
> >   .../ghostscript/ghostscript/arm/objarch.h     | 40 -----------
> >   .../ghostscript/ghostscript/armeb/objarch.h   | 40 -----------
> >   .../ghostscript-9.02-genarch.patch            | 38 ----------
> >   .../ghostscript/ghostscript/i586/objarch.h    | 41 -----------
> >   .../ghostscript/microblaze/objarch.h          | 40 -----------
> >   .../ghostscript/microblazeel/objarch.h        | 40 -----------
> >   .../ghostscript/mipsarchn32eb/objarch.h       | 40 -----------
> >   .../ghostscript/mipsarchn32el/objarch.h       | 40 -----------
> >   .../ghostscript/mipsarchn64eb/objarch.h       | 40 -----------
> >   .../ghostscript/mipsarchn64el/objarch.h       | 40 -----------
> >   .../ghostscript/mipsarcho32eb/objarch.h       | 40 -----------
> >   .../ghostscript/mipsarcho32el/objarch.h       | 40 -----------
> >   .../ghostscript/ghostscript/nios2/objarch.h   | 40 -----------
> >   .../ghostscript/ghostscript/powerpc/objarch.h | 40 -----------
> >   .../ghostscript/powerpc64/objarch.h           | 40 -----------
> >   .../ghostscript/powerpc64le/objarch.h         | 40 -----------
> >   .../ghostscript/ghostscript/x86-64/objarch.h  | 40 -----------
> >   ...hostscript_9.50.bb => ghostscript_9.52.bb} | 19 ++---
> >   21 files changed, 19 insertions(+), 826 deletions(-)
> >   delete mode 100644
> meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14869-0001.patch
> >   delete mode 100644
> meta/recipes-extended/ghostscript/ghostscript/aarch64/objarch.h
> >   delete mode 100644
> meta/recipes-extended/ghostscript/ghostscript/arm/objarch.h
> >   delete mode 100644
> meta/recipes-extended/ghostscript/ghostscript/armeb/objarch.h
> >   delete mode 100644
> meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-genarch.patch
> >   delete mode 100644
> meta/recipes-extended/ghostscript/ghostscript/i586/objarch.h
> >   delete mode 100644
> meta/recipes-extended/ghostscript/ghostscript/microblaze/objarch.h
> >   delete mode 100644
> meta/recipes-extended/ghostscript/ghostscript/microblazeel/objarch.h
> >   delete mode 100644
> meta/recipes-extended/ghostscript/ghostscript/mipsarchn32eb/objarch.h
> >   delete mode 100644
> meta/recipes-extended/ghostscript/ghostscript/mipsarchn32el/objarch.h
> >   delete mode 100644
> meta/recipes-extended/ghostscript/ghostscript/mipsarchn64eb/objarch.h
> >   delete mode 100644
> meta/recipes-extended/ghostscript/ghostscript/mipsarchn64el/objarch.h
> >   delete mode 100644
> meta/recipes-extended/ghostscript/ghostscript/mipsarcho32eb/objarch.h
> >   delete mode 100644
> meta/recipes-extended/ghostscript/ghostscript/mipsarcho32el/objarch.h
> >   delete mode 100644
> meta/recipes-extended/ghostscript/ghostscript/nios2/objarch.h
> >   delete mode 100644
> meta/recipes-extended/ghostscript/ghostscript/powerpc/objarch.h
> >   delete mode 100644
> meta/recipes-extended/ghostscript/ghostscript/powerpc64/objarch.h
> >   delete mode 100644
> meta/recipes-extended/ghostscript/ghostscript/powerpc64le/objarch.h
> >   delete mode 100644
> meta/recipes-extended/ghostscript/ghostscript/x86-64/objarch.h
> >   rename meta/recipes-extended/ghostscript/{ghostscript_9.50.bb =>
> ghostscript_9.52.bb} (89%)
> >
> > diff --git
> a/meta/recipes-extended/ghostscript/files/do-not-check-local-libpng-source.patch
> b/meta/recipes-extended/ghostscript/files/do-not-check-local-libpng-source.patch
> > index 5834ffaf9f..a9afb9948c 100644
> > ---
> a/meta/recipes-extended/ghostscript/files/do-not-check-local-libpng-source.patch
> > +++
> b/meta/recipes-extended/ghostscript/files/do-not-check-local-libpng-source.patch
> > @@ -1,7 +1,7 @@
> > -From a954bf29a5f906b3151dffbecb5856e02e1565da Mon Sep 17 00:00:00 2001
> > +From 2adaa7366064a8f18af864eda74e52877a89620c Mon Sep 17 00:00:00 2001
> >   From: Hongxu Jia <hongxu.jia@windriver.com>
> >   Date: Mon, 18 Jan 2016 01:00:30 -0500
> > -Subject: [PATCH 03/10] configure.ac: do not check local png source
> > +Subject: [PATCH] configure.ac: do not check local png source
> >
> >   In oe-core, it did not need to compile local libpng
> >   source in ghostscript, so do not check local png
> > @@ -11,28 +11,21 @@ libpng library.
> >   Upstream-Status: Inappropriate [OE-Core specific]
> >
> >   Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > +
> >   ---
> > - configure.ac | 4 ++--
> > - 1 file changed, 2 insertions(+), 2 deletions(-)
> > + configure.ac | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >   diff --git a/configure.ac b/configure.ac
> > -index 9341930..80a60b1 100644
> > +index 698abd3..e65ac8b 100644
> >   --- a/configure.ac
> >   +++ b/configure.ac
> > -@@ -1114,11 +1114,11 @@ AC_SUBST(ZLIBDIR)
> > - AC_SUBST(FT_SYS_ZLIB)
> > -
> > - dnl png for the png output device; it also requires zlib
> > --LIBPNGDIR=src
> > -+LIBPNGDIR=$srcdir/libpng
> > - PNGDEVS=''
> > - PNGDEVS_ALL='png48 png16m pnggray pngmono pngmonod png256 png16
> pngalpha'
> > - AC_MSG_CHECKING([for local png library source])
> > --if test -f $srcdir/libpng/pngread.c; then
> > -+if false; then
> > -         AC_MSG_RESULT([yes])
> > -         SHARE_LIBPNG=0
> > -         LIBPNGDIR=$srcdir/libpng
> > ---
> > -1.8.3.1
> > -
> > +@@ -1241,7 +1241,7 @@ else
> > +   PNGDEVS=''
> > +   PNGDEVS_ALL='png48 png16m pnggray pngmono pngmonod png256 png16
> pngalpha'
> > +   AC_MSG_CHECKING([for local png library source])
> > +-  if test -f $srcdir/libpng/pngread.c; then
> > ++  if false; then
> > +           AC_MSG_RESULT([yes])
> > +           SHARE_LIBPNG=0
> > +           LIBPNGDIR=$srcdir/libpng
> > diff --git
> a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14869-0001.patch
> b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14869-0001.patch
> > deleted file mode 100644
> > index 715ec1c450..0000000000
> > ---
> a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14869-0001.patch
> > +++ /dev/null
> > @@ -1,70 +0,0 @@
> > -From 485904772c5f0aa1140032746e5a0abfc40f4cef Mon Sep 17 00:00:00 2001
> > -From: Chris Liddell <chris.liddell@artifex.com>
> > -Date: Tue, 5 Nov 2019 09:45:27 +0000
> > -Subject: [PATCH] Bug 701841: remove .forceput from /.charkeys
> > -
> > -When loading Type 1 or Truetype fonts from disk, we attempt to extend
> the glyph
> > -name table to include all identifiable glyph names from the Adobe Glyph
> List.
> > -
> > -In the case of Type 1 fonts, the font itself (almost always) marks the
> > -CharStrings dictionary as read-only, hence we have to use .forceput for
> that
> > -case.
> > -
> > -But for Truetype fonts, the CharStrings dictionary is created
> internally and is
> > -not read-only until *after* we have fully populated it (including the
> extended
> > -glyph names from the AGL), hence there is no need for .forceput, and no
> need to
> > -carry the security risk of using it.
> > -
> > -Replace with regular put.
> > -
> > -CVE: CVE-2019-14869
> > -Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
> > -
> > -Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
> > ----
> > - Resource/Init/gs_ttf.ps | 8 ++++----
> > - 1 file changed, 4 insertions(+), 4 deletions(-)
> > -
> > -diff --git a/Resource/Init/gs_ttf.ps b/Resource/Init/gs_ttf.ps
> > -index e34967d..5354ff0 100644
> > ---- a/Resource/Init/gs_ttf.ps
> > -+++ b/Resource/Init/gs_ttf.ps
> > -@@ -1301,7 +1301,7 @@ currentdict /.pickcmap_with_no_xlatmap .undef
> > -           TTFDEBUG { (\n1 setting alias: ) print dup ==only
> > -                 ( to be the same as  ) print 2 index //== exec } if
> > -
> > --          7 index 2 index 3 -1 roll exch .forceput
> > -+          7 index 2 index 3 -1 roll exch put
> > -         } forall
> > -         pop pop pop
> > -       }
> > -@@ -1319,7 +1319,7 @@ currentdict /.pickcmap_with_no_xlatmap .undef
> > -           exch pop
> > -           TTFDEBUG { (\n2 setting alias: ) print 1 index ==only
> > -                      ( to use glyph index: ) print dup //== exec } if
> > --          5 index 3 1 roll .forceput
> > -+          5 index 3 1 roll put
> > -           //false
> > -         }
> > -         {
> > -@@ -1336,7 +1336,7 @@ currentdict /.pickcmap_with_no_xlatmap .undef
> > -         {                            %  CharStrings(dict)
> isunicode(boolean) cmap(dict) RAGL(dict) gname(name) codep(integer)
> gindex(integer)
> > -           TTFDEBUG { (\3 nsetting alias: ) print 1 index ==only
> > -                 ( to be index: ) print dup //== exec } if
> > --          exch pop 5 index 3 1 roll .forceput
> > -+          exch pop 5 index 3 1 roll put
> > -         }
> > -         {
> > -           pop pop
> > -@@ -1366,7 +1366,7 @@ currentdict /.pickcmap_with_no_xlatmap .undef
> > -       } ifelse
> > -     ]
> > -   TTFDEBUG { (Encoding: ) print dup === flush } if
> > --} .bind executeonly odef            % hides .forceput
> > -+} .bind odef
> > -
> > - % ---------------- CIDFontType 2 font loading ---------------- %
> > -
> > ---
> > -2.20.1
> > -
> > diff --git
> a/meta/recipes-extended/ghostscript/ghostscript/aarch64/objarch.h
> b/meta/recipes-extended/ghostscript/ghostscript/aarch64/objarch.h
> > deleted file mode 100644
> > index a05de29def..0000000000
> > --- a/meta/recipes-extended/ghostscript/ghostscript/aarch64/objarch.h
> > +++ /dev/null
> > @@ -1,40 +0,0 @@
> > -/* Parameters derived from machine and compiler architecture. */
> > -/* This file is generated mechanically by genarch.c. */
> > -
> > -      /* ---------------- Scalar alignments ---------------- */
> > -
> > -#define ARCH_ALIGN_SHORT_MOD 2
> > -#define ARCH_ALIGN_INT_MOD 4
> > -#define ARCH_ALIGN_LONG_MOD 8
> > -#define ARCH_ALIGN_PTR_MOD 8
> > -#define ARCH_ALIGN_FLOAT_MOD 4
> > -#define ARCH_ALIGN_DOUBLE_MOD 8
> > -
> > -      /* ---------------- Scalar sizes ---------------- */
> > -
> > -#define ARCH_LOG2_SIZEOF_CHAR 0
> > -#define ARCH_LOG2_SIZEOF_SHORT 1
> > -#define ARCH_LOG2_SIZEOF_INT 2
> > -#define ARCH_LOG2_SIZEOF_LONG 3
> > -#define ARCH_LOG2_SIZEOF_LONG_LONG 3
> > -#define ARCH_SIZEOF_GX_COLOR_INDEX 8
> > -#define ARCH_SIZEOF_PTR 8
> > -#define ARCH_SIZEOF_FLOAT 4
> > -#define ARCH_SIZEOF_DOUBLE 8
> > -#define ARCH_FLOAT_MANTISSA_BITS 24
> > -#define ARCH_DOUBLE_MANTISSA_BITS 53
> > -
> > -      /* ---------------- Unsigned max values ---------------- */
> > -
> > -#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
> > -#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
> > -#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
> > -#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
> > -
> > -      /* ---------------- Miscellaneous ---------------- */
> > -
> > -#define ARCH_IS_BIG_ENDIAN 0
> > -#define ARCH_PTRS_ARE_SIGNED 0
> > -#define ARCH_FLOATS_ARE_IEEE 1
> > -#define ARCH_ARITH_RSHIFT 2
> > -#define ARCH_DIV_NEG_POS_TRUNCATES 1
> > diff --git a/meta/recipes-extended/ghostscript/ghostscript/arm/objarch.h
> b/meta/recipes-extended/ghostscript/ghostscript/arm/objarch.h
> > deleted file mode 100644
> > index e8772cd958..0000000000
> > --- a/meta/recipes-extended/ghostscript/ghostscript/arm/objarch.h
> > +++ /dev/null
> > @@ -1,40 +0,0 @@
> > -/* Parameters derived from machine and compiler architecture. */
> > -/* This file is generated mechanically by genarch.c. */
> > -
> > -      /* ---------------- Scalar alignments ---------------- */
> > -
> > -#define ARCH_ALIGN_SHORT_MOD 2
> > -#define ARCH_ALIGN_INT_MOD 4
> > -#define ARCH_ALIGN_LONG_MOD 4
> > -#define ARCH_ALIGN_PTR_MOD 4
> > -#define ARCH_ALIGN_FLOAT_MOD 4
> > -#define ARCH_ALIGN_DOUBLE_MOD 8
> > -
> > -      /* ---------------- Scalar sizes ---------------- */
> > -
> > -#define ARCH_LOG2_SIZEOF_CHAR 0
> > -#define ARCH_LOG2_SIZEOF_SHORT 1
> > -#define ARCH_LOG2_SIZEOF_INT 2
> > -#define ARCH_LOG2_SIZEOF_LONG 2
> > -#define ARCH_LOG2_SIZEOF_LONG_LONG 3
> > -#define ARCH_SIZEOF_GX_COLOR_INDEX 8
> > -#define ARCH_SIZEOF_PTR 4
> > -#define ARCH_SIZEOF_FLOAT 4
> > -#define ARCH_SIZEOF_DOUBLE 8
> > -#define ARCH_FLOAT_MANTISSA_BITS 24
> > -#define ARCH_DOUBLE_MANTISSA_BITS 53
> > -
> > -      /* ---------------- Unsigned max values ---------------- */
> > -
> > -#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
> > -#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
> > -#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
> > -#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
> > -
> > -      /* ---------------- Miscellaneous ---------------- */
> > -
> > -#define ARCH_IS_BIG_ENDIAN 0
> > -#define ARCH_PTRS_ARE_SIGNED 0
> > -#define ARCH_FLOATS_ARE_IEEE 1
> > -#define ARCH_ARITH_RSHIFT 2
> > -#define ARCH_DIV_NEG_POS_TRUNCATES 1
> > diff --git
> a/meta/recipes-extended/ghostscript/ghostscript/armeb/objarch.h
> b/meta/recipes-extended/ghostscript/ghostscript/armeb/objarch.h
> > deleted file mode 100644
> > index 359097f356..0000000000
> > --- a/meta/recipes-extended/ghostscript/ghostscript/armeb/objarch.h
> > +++ /dev/null
> > @@ -1,40 +0,0 @@
> > -/* Parameters derived from machine and compiler architecture. */
> > -/* This file is generated mechanically by genarch.c. */
> > -
> > -      /* ---------------- Scalar alignments ---------------- */
> > -
> > -#define ARCH_ALIGN_SHORT_MOD 2
> > -#define ARCH_ALIGN_INT_MOD 4
> > -#define ARCH_ALIGN_LONG_MOD 4
> > -#define ARCH_ALIGN_PTR_MOD 4
> > -#define ARCH_ALIGN_FLOAT_MOD 4
> > -#define ARCH_ALIGN_DOUBLE_MOD 8
> > -
> > -      /* ---------------- Scalar sizes ---------------- */
> > -
> > -#define ARCH_LOG2_SIZEOF_CHAR 0
> > -#define ARCH_LOG2_SIZEOF_SHORT 1
> > -#define ARCH_LOG2_SIZEOF_INT 2
> > -#define ARCH_LOG2_SIZEOF_LONG 2
> > -#define ARCH_LOG2_SIZEOF_LONG_LONG 3
> > -#define ARCH_SIZEOF_GX_COLOR_INDEX 8
> > -#define ARCH_SIZEOF_PTR 4
> > -#define ARCH_SIZEOF_FLOAT 4
> > -#define ARCH_SIZEOF_DOUBLE 8
> > -#define ARCH_FLOAT_MANTISSA_BITS 24
> > -#define ARCH_DOUBLE_MANTISSA_BITS 53
> > -
> > -      /* ---------------- Unsigned max values ---------------- */
> > -
> > -#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
> > -#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
> > -#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
> > -#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
> > -
> > -      /* ---------------- Miscellaneous ---------------- */
> > -
> > -#define ARCH_IS_BIG_ENDIAN 1
> > -#define ARCH_PTRS_ARE_SIGNED 0
> > -#define ARCH_FLOATS_ARE_IEEE 1
> > -#define ARCH_ARITH_RSHIFT 2
> > -#define ARCH_DIV_NEG_POS_TRUNCATES 1
> > diff --git
> a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-genarch.patch
> b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-genarch.patch
> > deleted file mode 100644
> > index 7b70bb8e2c..0000000000
> > ---
> a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-genarch.patch
> > +++ /dev/null
> > @@ -1,38 +0,0 @@
> > -From c076d0fc970f190f723018258790c79b59daba2e Mon Sep 17 00:00:00 2001
> > -From: Hongxu Jia <hongxu.jia@windriver.com>
> > -Date: Sat, 11 May 2019 21:20:27 +0800
> > -Subject: [PATCH] not generate objarch.h at compile time
> > -
> > -Import patch from windriver linux for cross compilation, and split
> > -patches into oe way under different directories such as i586, powerpc
> etc
> > -according to Richard's opinion.
> > -
> > -Upstream-Status: Pending
> > -
> > -Signed-off-by: Kang Kai <kai.kang@windriver.com>
> > -Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> > -
> > -Rebase to 9.27
> > -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > ----
> > - base/lib.mak | 4 ++--
> > - 1 file changed, 2 insertions(+), 2 deletions(-)
> > -
> > -diff --git a/base/lib.mak b/base/lib.mak
> > -index 3ed088a..5af2b43 100644
> > ---- a/base/lib.mak
> > -+++ b/base/lib.mak
> > -@@ -87,8 +87,8 @@ arch_h=$(GLGEN)arch.h
> > - stdpre_h=$(GLSRC)stdpre.h
> > - stdint__h=$(GLSRC)stdint_.h
> > -
> > --$(GLGEN)arch.h : $(GENARCH_XE)
> > --    $(EXP)$(GENARCH_XE) $(GLGEN)arch.h $(TARGET_ARCH_FILE)
> > -+##$(GLGEN)arch.h : $(GENARCH_XE)
> > -+##  $(EXP)$(GENARCH_XE) $(GLGEN)arch.h $(TARGET_ARCH_FILE)
> > -
> > - # Platform interfaces
> > -
> > ---
> > -2.7.4
> > -
> > diff --git
> a/meta/recipes-extended/ghostscript/ghostscript/i586/objarch.h
> b/meta/recipes-extended/ghostscript/ghostscript/i586/objarch.h
> > deleted file mode 100644
> > index 5817b7a6d7..0000000000
> > --- a/meta/recipes-extended/ghostscript/ghostscript/i586/objarch.h
> > +++ /dev/null
> > @@ -1,41 +0,0 @@
> > -/* Parameters derived from machine and compiler architecture. */
> > -/* This file is generated mechanically by genarch.c. */
> > -
> > -      /* ---------------- Scalar alignments ---------------- */
> > -
> > -#define ARCH_ALIGN_SHORT_MOD 2
> > -#define ARCH_ALIGN_INT_MOD 4
> > -#define ARCH_ALIGN_LONG_MOD 4
> > -#define ARCH_ALIGN_PTR_MOD 4
> > -#define ARCH_ALIGN_FLOAT_MOD 4
> > -#define ARCH_ALIGN_DOUBLE_MOD 4
> > -
> > -      /* ---------------- Scalar sizes ---------------- */
> > -
> > -#define ARCH_LOG2_SIZEOF_CHAR 0
> > -#define ARCH_LOG2_SIZEOF_SHORT 1
> > -#define ARCH_LOG2_SIZEOF_INT 2
> > -#define ARCH_LOG2_SIZEOF_LONG 2
> > -#define ARCH_LOG2_SIZEOF_LONG_LONG 3
> > -#define ARCH_SIZEOF_GX_COLOR_INDEX 8
> > -#define ARCH_SIZEOF_PTR 4
> > -#define ARCH_SIZEOF_FLOAT 4
> > -#define ARCH_SIZEOF_DOUBLE 8
> > -#define ARCH_FLOAT_MANTISSA_BITS 24
> > -#define ARCH_DOUBLE_MANTISSA_BITS 53
> > -
> > -      /* ---------------- Unsigned max values ---------------- */
> > -
> > -#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
> > -#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
> > -#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
> > -#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
> > -
> > -      /* ---------------- Miscellaneous ---------------- */
> > -
> > -#define ARCH_IS_BIG_ENDIAN 0
> > -#define ARCH_PTRS_ARE_SIGNED 0
> > -#define ARCH_FLOATS_ARE_IEEE 1
> > -#define ARCH_ARITH_RSHIFT 2
> > -#define ARCH_DIV_NEG_POS_TRUNCATES 1
> > -
> > diff --git
> a/meta/recipes-extended/ghostscript/ghostscript/microblaze/objarch.h
> b/meta/recipes-extended/ghostscript/ghostscript/microblaze/objarch.h
> > deleted file mode 100644
> > index 63232fdfa6..0000000000
> > --- a/meta/recipes-extended/ghostscript/ghostscript/microblaze/objarch.h
> > +++ /dev/null
> > @@ -1,40 +0,0 @@
> > -/* Parameters derived from machine and compiler architecture. */
> > -/* This file is generated mechanically by genarch.c. */
> > -
> > -      /* ---------------- Scalar alignments ---------------- */
> > -
> > -#define ARCH_ALIGN_SHORT_MOD 2
> > -#define ARCH_ALIGN_INT_MOD 4
> > -#define ARCH_ALIGN_LONG_MOD 4
> > -#define ARCH_ALIGN_PTR_MOD 4
> > -#define ARCH_ALIGN_FLOAT_MOD 4
> > -#define ARCH_ALIGN_DOUBLE_MOD 4
> > -
> > -      /* ---------------- Scalar sizes ---------------- */
> > -
> > -#define ARCH_LOG2_SIZEOF_CHAR 0
> > -#define ARCH_LOG2_SIZEOF_SHORT 1
> > -#define ARCH_LOG2_SIZEOF_INT 2
> > -#define ARCH_LOG2_SIZEOF_LONG 2
> > -#define ARCH_LOG2_SIZEOF_LONG_LONG 3
> > -#define ARCH_SIZEOF_GX_COLOR_INDEX 8
> > -#define ARCH_SIZEOF_PTR 4
> > -#define ARCH_SIZEOF_FLOAT 4
> > -#define ARCH_SIZEOF_DOUBLE 8
> > -#define ARCH_FLOAT_MANTISSA_BITS 24
> > -#define ARCH_DOUBLE_MANTISSA_BITS 53
> > -
> > -      /* ---------------- Unsigned max values ---------------- */
> > -
> > -#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
> > -#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
> > -#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
> > -#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
> > -
> > -      /* ---------------- Miscellaneous ---------------- */
> > -
> > -#define ARCH_IS_BIG_ENDIAN 1
> > -#define ARCH_PTRS_ARE_SIGNED 0
> > -#define ARCH_FLOATS_ARE_IEEE 1
> > -#define ARCH_ARITH_RSHIFT 2
> > -#define ARCH_DIV_NEG_POS_TRUNCATES 1
> > diff --git
> a/meta/recipes-extended/ghostscript/ghostscript/microblazeel/objarch.h
> b/meta/recipes-extended/ghostscript/ghostscript/microblazeel/objarch.h
> > deleted file mode 100644
> > index 3ec8101681..0000000000
> > ---
> a/meta/recipes-extended/ghostscript/ghostscript/microblazeel/objarch.h
> > +++ /dev/null
> > @@ -1,40 +0,0 @@
> > -/* Parameters derived from machine and compiler architecture. */
> > -/* This file is generated mechanically by genarch.c. */
> > -
> > -      /* ---------------- Scalar alignments ---------------- */
> > -
> > -#define ARCH_ALIGN_SHORT_MOD 2
> > -#define ARCH_ALIGN_INT_MOD 4
> > -#define ARCH_ALIGN_LONG_MOD 4
> > -#define ARCH_ALIGN_PTR_MOD 4
> > -#define ARCH_ALIGN_FLOAT_MOD 4
> > -#define ARCH_ALIGN_DOUBLE_MOD 4
> > -
> > -      /* ---------------- Scalar sizes ---------------- */
> > -
> > -#define ARCH_LOG2_SIZEOF_CHAR 0
> > -#define ARCH_LOG2_SIZEOF_SHORT 1
> > -#define ARCH_LOG2_SIZEOF_INT 2
> > -#define ARCH_LOG2_SIZEOF_LONG 2
> > -#define ARCH_LOG2_SIZEOF_LONG_LONG 3
> > -#define ARCH_SIZEOF_GX_COLOR_INDEX 8
> > -#define ARCH_SIZEOF_PTR 4
> > -#define ARCH_SIZEOF_FLOAT 4
> > -#define ARCH_SIZEOF_DOUBLE 8
> > -#define ARCH_FLOAT_MANTISSA_BITS 24
> > -#define ARCH_DOUBLE_MANTISSA_BITS 53
> > -
> > -      /* ---------------- Unsigned max values ---------------- */
> > -
> > -#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
> > -#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
> > -#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
> > -#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
> > -
> > -      /* ---------------- Miscellaneous ---------------- */
> > -
> > -#define ARCH_IS_BIG_ENDIAN 0
> > -#define ARCH_PTRS_ARE_SIGNED 0
> > -#define ARCH_FLOATS_ARE_IEEE 1
> > -#define ARCH_ARITH_RSHIFT 2
> > -#define ARCH_DIV_NEG_POS_TRUNCATES 1
> > diff --git
> a/meta/recipes-extended/ghostscript/ghostscript/mipsarchn32eb/objarch.h
> b/meta/recipes-extended/ghostscript/ghostscript/mipsarchn32eb/objarch.h
> > deleted file mode 100644
> > index 0d0a16bfa3..0000000000
> > ---
> a/meta/recipes-extended/ghostscript/ghostscript/mipsarchn32eb/objarch.h
> > +++ /dev/null
> > @@ -1,40 +0,0 @@
> > -/* Parameters derived from machine and compiler architecture. */
> > -/* This file is generated mechanically by genarch.c. */
> > -
> > -      /* ---------------- Scalar alignments ---------------- */
> > -
> > -#define ARCH_ALIGN_SHORT_MOD 2
> > -#define ARCH_ALIGN_INT_MOD 4
> > -#define ARCH_ALIGN_LONG_MOD 8
> > -#define ARCH_ALIGN_PTR_MOD 8
> > -#define ARCH_ALIGN_FLOAT_MOD 4
> > -#define ARCH_ALIGN_DOUBLE_MOD 8
> > -
> > -      /* ---------------- Scalar sizes ---------------- */
> > -
> > -#define ARCH_LOG2_SIZEOF_CHAR 0
> > -#define ARCH_LOG2_SIZEOF_SHORT 1
> > -#define ARCH_LOG2_SIZEOF_INT 2
> > -#define ARCH_LOG2_SIZEOF_LONG 3
> > -#define ARCH_LOG2_SIZEOF_LONG_LONG 3
> > -#define ARCH_SIZEOF_GX_COLOR_INDEX 8
> > -#define ARCH_SIZEOF_PTR 8
> > -#define ARCH_SIZEOF_FLOAT 4
> > -#define ARCH_SIZEOF_DOUBLE 8
> > -#define ARCH_FLOAT_MANTISSA_BITS 24
> > -#define ARCH_DOUBLE_MANTISSA_BITS 53
> > -
> > -      /* ---------------- Unsigned max values ---------------- */
> > -
> > -#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
> > -#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
> > -#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
> > -#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
> > -
> > -      /* ---------------- Miscellaneous ---------------- */
> > -
> > -#define ARCH_IS_BIG_ENDIAN 1
> > -#define ARCH_PTRS_ARE_SIGNED 0
> > -#define ARCH_FLOATS_ARE_IEEE 1
> > -#define ARCH_ARITH_RSHIFT 2
> > -#define ARCH_DIV_NEG_POS_TRUNCATES 1
> > diff --git
> a/meta/recipes-extended/ghostscript/ghostscript/mipsarchn32el/objarch.h
> b/meta/recipes-extended/ghostscript/ghostscript/mipsarchn32el/objarch.h
> > deleted file mode 100644
> > index a05de29def..0000000000
> > ---
> a/meta/recipes-extended/ghostscript/ghostscript/mipsarchn32el/objarch.h
> > +++ /dev/null
> > @@ -1,40 +0,0 @@
> > -/* Parameters derived from machine and compiler architecture. */
> > -/* This file is generated mechanically by genarch.c. */
> > -
> > -      /* ---------------- Scalar alignments ---------------- */
> > -
> > -#define ARCH_ALIGN_SHORT_MOD 2
> > -#define ARCH_ALIGN_INT_MOD 4
> > -#define ARCH_ALIGN_LONG_MOD 8
> > -#define ARCH_ALIGN_PTR_MOD 8
> > -#define ARCH_ALIGN_FLOAT_MOD 4
> > -#define ARCH_ALIGN_DOUBLE_MOD 8
> > -
> > -      /* ---------------- Scalar sizes ---------------- */
> > -
> > -#define ARCH_LOG2_SIZEOF_CHAR 0
> > -#define ARCH_LOG2_SIZEOF_SHORT 1
> > -#define ARCH_LOG2_SIZEOF_INT 2
> > -#define ARCH_LOG2_SIZEOF_LONG 3
> > -#define ARCH_LOG2_SIZEOF_LONG_LONG 3
> > -#define ARCH_SIZEOF_GX_COLOR_INDEX 8
> > -#define ARCH_SIZEOF_PTR 8
> > -#define ARCH_SIZEOF_FLOAT 4
> > -#define ARCH_SIZEOF_DOUBLE 8
> > -#define ARCH_FLOAT_MANTISSA_BITS 24
> > -#define ARCH_DOUBLE_MANTISSA_BITS 53
> > -
> > -      /* ---------------- Unsigned max values ---------------- */
> > -
> > -#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
> > -#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
> > -#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
> > -#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
> > -
> > -      /* ---------------- Miscellaneous ---------------- */
> > -
> > -#define ARCH_IS_BIG_ENDIAN 0
> > -#define ARCH_PTRS_ARE_SIGNED 0
> > -#define ARCH_FLOATS_ARE_IEEE 1
> > -#define ARCH_ARITH_RSHIFT 2
> > -#define ARCH_DIV_NEG_POS_TRUNCATES 1
> > diff --git
> a/meta/recipes-extended/ghostscript/ghostscript/mipsarchn64eb/objarch.h
> b/meta/recipes-extended/ghostscript/ghostscript/mipsarchn64eb/objarch.h
> > deleted file mode 100644
> > index 0d0a16bfa3..0000000000
> > ---
> a/meta/recipes-extended/ghostscript/ghostscript/mipsarchn64eb/objarch.h
> > +++ /dev/null
> > @@ -1,40 +0,0 @@
> > -/* Parameters derived from machine and compiler architecture. */
> > -/* This file is generated mechanically by genarch.c. */
> > -
> > -      /* ---------------- Scalar alignments ---------------- */
> > -
> > -#define ARCH_ALIGN_SHORT_MOD 2
> > -#define ARCH_ALIGN_INT_MOD 4
> > -#define ARCH_ALIGN_LONG_MOD 8
> > -#define ARCH_ALIGN_PTR_MOD 8
> > -#define ARCH_ALIGN_FLOAT_MOD 4
> > -#define ARCH_ALIGN_DOUBLE_MOD 8
> > -
> > -      /* ---------------- Scalar sizes ---------------- */
> > -
> > -#define ARCH_LOG2_SIZEOF_CHAR 0
> > -#define ARCH_LOG2_SIZEOF_SHORT 1
> > -#define ARCH_LOG2_SIZEOF_INT 2
> > -#define ARCH_LOG2_SIZEOF_LONG 3
> > -#define ARCH_LOG2_SIZEOF_LONG_LONG 3
> > -#define ARCH_SIZEOF_GX_COLOR_INDEX 8
> > -#define ARCH_SIZEOF_PTR 8
> > -#define ARCH_SIZEOF_FLOAT 4
> > -#define ARCH_SIZEOF_DOUBLE 8
> > -#define ARCH_FLOAT_MANTISSA_BITS 24
> > -#define ARCH_DOUBLE_MANTISSA_BITS 53
> > -
> > -      /* ---------------- Unsigned max values ---------------- */
> > -
> > -#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
> > -#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
> > -#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
> > -#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
> > -
> > -      /* ---------------- Miscellaneous ---------------- */
> > -
> > -#define ARCH_IS_BIG_ENDIAN 1
> > -#define ARCH_PTRS_ARE_SIGNED 0
> > -#define ARCH_FLOATS_ARE_IEEE 1
> > -#define ARCH_ARITH_RSHIFT 2
> > -#define ARCH_DIV_NEG_POS_TRUNCATES 1
> > diff --git
> a/meta/recipes-extended/ghostscript/ghostscript/mipsarchn64el/objarch.h
> b/meta/recipes-extended/ghostscript/ghostscript/mipsarchn64el/objarch.h
> > deleted file mode 100644
> > index a05de29def..0000000000
> > ---
> a/meta/recipes-extended/ghostscript/ghostscript/mipsarchn64el/objarch.h
> > +++ /dev/null
> > @@ -1,40 +0,0 @@
> > -/* Parameters derived from machine and compiler architecture. */
> > -/* This file is generated mechanically by genarch.c. */
> > -
> > -      /* ---------------- Scalar alignments ---------------- */
> > -
> > -#define ARCH_ALIGN_SHORT_MOD 2
> > -#define ARCH_ALIGN_INT_MOD 4
> > -#define ARCH_ALIGN_LONG_MOD 8
> > -#define ARCH_ALIGN_PTR_MOD 8
> > -#define ARCH_ALIGN_FLOAT_MOD 4
> > -#define ARCH_ALIGN_DOUBLE_MOD 8
> > -
> > -      /* ---------------- Scalar sizes ---------------- */
> > -
> > -#define ARCH_LOG2_SIZEOF_CHAR 0
> > -#define ARCH_LOG2_SIZEOF_SHORT 1
> > -#define ARCH_LOG2_SIZEOF_INT 2
> > -#define ARCH_LOG2_SIZEOF_LONG 3
> > -#define ARCH_LOG2_SIZEOF_LONG_LONG 3
> > -#define ARCH_SIZEOF_GX_COLOR_INDEX 8
> > -#define ARCH_SIZEOF_PTR 8
> > -#define ARCH_SIZEOF_FLOAT 4
> > -#define ARCH_SIZEOF_DOUBLE 8
> > -#define ARCH_FLOAT_MANTISSA_BITS 24
> > -#define ARCH_DOUBLE_MANTISSA_BITS 53
> > -
> > -      /* ---------------- Unsigned max values ---------------- */
> > -
> > -#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
> > -#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
> > -#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
> > -#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
> > -
> > -      /* ---------------- Miscellaneous ---------------- */
> > -
> > -#define ARCH_IS_BIG_ENDIAN 0
> > -#define ARCH_PTRS_ARE_SIGNED 0
> > -#define ARCH_FLOATS_ARE_IEEE 1
> > -#define ARCH_ARITH_RSHIFT 2
> > -#define ARCH_DIV_NEG_POS_TRUNCATES 1
> > diff --git
> a/meta/recipes-extended/ghostscript/ghostscript/mipsarcho32eb/objarch.h
> b/meta/recipes-extended/ghostscript/ghostscript/mipsarcho32eb/objarch.h
> > deleted file mode 100644
> > index b8b637cca2..0000000000
> > ---
> a/meta/recipes-extended/ghostscript/ghostscript/mipsarcho32eb/objarch.h
> > +++ /dev/null
> > @@ -1,40 +0,0 @@
> > -/* Parameters derived from machine and compiler architecture. */
> > -/* This file is generated mechanically by genarch.c. */
> > -
> > -      /* ---------------- Scalar alignments ---------------- */
> > -
> > -#define ARCH_ALIGN_SHORT_MOD 2
> > -#define ARCH_ALIGN_INT_MOD 4
> > -#define ARCH_ALIGN_LONG_MOD 4
> > -#define ARCH_ALIGN_PTR_MOD 4
> > -#define ARCH_ALIGN_FLOAT_MOD 4
> > -#define ARCH_ALIGN_DOUBLE_MOD 8
> > -
> > -      /* ---------------- Scalar sizes ---------------- */
> > -
> > -#define ARCH_LOG2_SIZEOF_CHAR 0
> > -#define ARCH_LOG2_SIZEOF_SHORT 1
> > -#define ARCH_LOG2_SIZEOF_INT 2
> > -#define ARCH_LOG2_SIZEOF_LONG 2
> > -#define ARCH_LOG2_SIZEOF_LONG_LONG 3
> > -#define ARCH_SIZEOF_GX_COLOR_INDEX 4
> > -#define ARCH_SIZEOF_PTR 4
> > -#define ARCH_SIZEOF_FLOAT 4
> > -#define ARCH_SIZEOF_DOUBLE 8
> > -#define ARCH_FLOAT_MANTISSA_BITS 24
> > -#define ARCH_DOUBLE_MANTISSA_BITS 53
> > -
> > -      /* ---------------- Unsigned max values ---------------- */
> > -
> > -#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
> > -#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
> > -#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
> > -#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
> > -
> > -      /* ---------------- Miscellaneous ---------------- */
> > -
> > -#define ARCH_IS_BIG_ENDIAN 1
> > -#define ARCH_PTRS_ARE_SIGNED 0
> > -#define ARCH_FLOATS_ARE_IEEE 1
> > -#define ARCH_ARITH_RSHIFT 2
> > -#define ARCH_DIV_NEG_POS_TRUNCATES 1
> > diff --git
> a/meta/recipes-extended/ghostscript/ghostscript/mipsarcho32el/objarch.h
> b/meta/recipes-extended/ghostscript/ghostscript/mipsarcho32el/objarch.h
> > deleted file mode 100644
> > index 29f90ddf85..0000000000
> > ---
> a/meta/recipes-extended/ghostscript/ghostscript/mipsarcho32el/objarch.h
> > +++ /dev/null
> > @@ -1,40 +0,0 @@
> > -/* Parameters derived from machine and compiler architecture. */
> > -/* This file is generated mechanically by genarch.c. */
> > -
> > -      /* ---------------- Scalar alignments ---------------- */
> > -
> > -#define ARCH_ALIGN_SHORT_MOD 2
> > -#define ARCH_ALIGN_INT_MOD 4
> > -#define ARCH_ALIGN_LONG_MOD 4
> > -#define ARCH_ALIGN_PTR_MOD 4
> > -#define ARCH_ALIGN_FLOAT_MOD 4
> > -#define ARCH_ALIGN_DOUBLE_MOD 8
> > -
> > -      /* ---------------- Scalar sizes ---------------- */
> > -
> > -#define ARCH_LOG2_SIZEOF_CHAR 0
> > -#define ARCH_LOG2_SIZEOF_SHORT 1
> > -#define ARCH_LOG2_SIZEOF_INT 2
> > -#define ARCH_LOG2_SIZEOF_LONG 2
> > -#define ARCH_LOG2_SIZEOF_LONG_LONG 3
> > -#define ARCH_SIZEOF_GX_COLOR_INDEX 4
> > -#define ARCH_SIZEOF_PTR 4
> > -#define ARCH_SIZEOF_FLOAT 4
> > -#define ARCH_SIZEOF_DOUBLE 8
> > -#define ARCH_FLOAT_MANTISSA_BITS 24
> > -#define ARCH_DOUBLE_MANTISSA_BITS 53
> > -
> > -      /* ---------------- Unsigned max values ---------------- */
> > -
> > -#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
> > -#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
> > -#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
> > -#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
> > -
> > -      /* ---------------- Miscellaneous ---------------- */
> > -
> > -#define ARCH_IS_BIG_ENDIAN 0
> > -#define ARCH_PTRS_ARE_SIGNED 0
> > -#define ARCH_FLOATS_ARE_IEEE 1
> > -#define ARCH_ARITH_RSHIFT 2
> > -#define ARCH_DIV_NEG_POS_TRUNCATES 1
> > diff --git
> a/meta/recipes-extended/ghostscript/ghostscript/nios2/objarch.h
> b/meta/recipes-extended/ghostscript/ghostscript/nios2/objarch.h
> > deleted file mode 100644
> > index 3ec8101681..0000000000
> > --- a/meta/recipes-extended/ghostscript/ghostscript/nios2/objarch.h
> > +++ /dev/null
> > @@ -1,40 +0,0 @@
> > -/* Parameters derived from machine and compiler architecture. */
> > -/* This file is generated mechanically by genarch.c. */
> > -
> > -      /* ---------------- Scalar alignments ---------------- */
> > -
> > -#define ARCH_ALIGN_SHORT_MOD 2
> > -#define ARCH_ALIGN_INT_MOD 4
> > -#define ARCH_ALIGN_LONG_MOD 4
> > -#define ARCH_ALIGN_PTR_MOD 4
> > -#define ARCH_ALIGN_FLOAT_MOD 4
> > -#define ARCH_ALIGN_DOUBLE_MOD 4
> > -
> > -      /* ---------------- Scalar sizes ---------------- */
> > -
> > -#define ARCH_LOG2_SIZEOF_CHAR 0
> > -#define ARCH_LOG2_SIZEOF_SHORT 1
> > -#define ARCH_LOG2_SIZEOF_INT 2
> > -#define ARCH_LOG2_SIZEOF_LONG 2
> > -#define ARCH_LOG2_SIZEOF_LONG_LONG 3
> > -#define ARCH_SIZEOF_GX_COLOR_INDEX 8
> > -#define ARCH_SIZEOF_PTR 4
> > -#define ARCH_SIZEOF_FLOAT 4
> > -#define ARCH_SIZEOF_DOUBLE 8
> > -#define ARCH_FLOAT_MANTISSA_BITS 24
> > -#define ARCH_DOUBLE_MANTISSA_BITS 53
> > -
> > -      /* ---------------- Unsigned max values ---------------- */
> > -
> > -#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
> > -#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
> > -#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
> > -#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
> > -
> > -      /* ---------------- Miscellaneous ---------------- */
> > -
> > -#define ARCH_IS_BIG_ENDIAN 0
> > -#define ARCH_PTRS_ARE_SIGNED 0
> > -#define ARCH_FLOATS_ARE_IEEE 1
> > -#define ARCH_ARITH_RSHIFT 2
> > -#define ARCH_DIV_NEG_POS_TRUNCATES 1
> > diff --git
> a/meta/recipes-extended/ghostscript/ghostscript/powerpc/objarch.h
> b/meta/recipes-extended/ghostscript/ghostscript/powerpc/objarch.h
> > deleted file mode 100644
> > index 359097f356..0000000000
> > --- a/meta/recipes-extended/ghostscript/ghostscript/powerpc/objarch.h
> > +++ /dev/null
> > @@ -1,40 +0,0 @@
> > -/* Parameters derived from machine and compiler architecture. */
> > -/* This file is generated mechanically by genarch.c. */
> > -
> > -      /* ---------------- Scalar alignments ---------------- */
> > -
> > -#define ARCH_ALIGN_SHORT_MOD 2
> > -#define ARCH_ALIGN_INT_MOD 4
> > -#define ARCH_ALIGN_LONG_MOD 4
> > -#define ARCH_ALIGN_PTR_MOD 4
> > -#define ARCH_ALIGN_FLOAT_MOD 4
> > -#define ARCH_ALIGN_DOUBLE_MOD 8
> > -
> > -      /* ---------------- Scalar sizes ---------------- */
> > -
> > -#define ARCH_LOG2_SIZEOF_CHAR 0
> > -#define ARCH_LOG2_SIZEOF_SHORT 1
> > -#define ARCH_LOG2_SIZEOF_INT 2
> > -#define ARCH_LOG2_SIZEOF_LONG 2
> > -#define ARCH_LOG2_SIZEOF_LONG_LONG 3
> > -#define ARCH_SIZEOF_GX_COLOR_INDEX 8
> > -#define ARCH_SIZEOF_PTR 4
> > -#define ARCH_SIZEOF_FLOAT 4
> > -#define ARCH_SIZEOF_DOUBLE 8
> > -#define ARCH_FLOAT_MANTISSA_BITS 24
> > -#define ARCH_DOUBLE_MANTISSA_BITS 53
> > -
> > -      /* ---------------- Unsigned max values ---------------- */
> > -
> > -#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
> > -#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
> > -#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
> > -#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
> > -
> > -      /* ---------------- Miscellaneous ---------------- */
> > -
> > -#define ARCH_IS_BIG_ENDIAN 1
> > -#define ARCH_PTRS_ARE_SIGNED 0
> > -#define ARCH_FLOATS_ARE_IEEE 1
> > -#define ARCH_ARITH_RSHIFT 2
> > -#define ARCH_DIV_NEG_POS_TRUNCATES 1
> > diff --git
> a/meta/recipes-extended/ghostscript/ghostscript/powerpc64/objarch.h
> b/meta/recipes-extended/ghostscript/ghostscript/powerpc64/objarch.h
> > deleted file mode 100644
> > index 0d0a16bfa3..0000000000
> > --- a/meta/recipes-extended/ghostscript/ghostscript/powerpc64/objarch.h
> > +++ /dev/null
> > @@ -1,40 +0,0 @@
> > -/* Parameters derived from machine and compiler architecture. */
> > -/* This file is generated mechanically by genarch.c. */
> > -
> > -      /* ---------------- Scalar alignments ---------------- */
> > -
> > -#define ARCH_ALIGN_SHORT_MOD 2
> > -#define ARCH_ALIGN_INT_MOD 4
> > -#define ARCH_ALIGN_LONG_MOD 8
> > -#define ARCH_ALIGN_PTR_MOD 8
> > -#define ARCH_ALIGN_FLOAT_MOD 4
> > -#define ARCH_ALIGN_DOUBLE_MOD 8
> > -
> > -      /* ---------------- Scalar sizes ---------------- */
> > -
> > -#define ARCH_LOG2_SIZEOF_CHAR 0
> > -#define ARCH_LOG2_SIZEOF_SHORT 1
> > -#define ARCH_LOG2_SIZEOF_INT 2
> > -#define ARCH_LOG2_SIZEOF_LONG 3
> > -#define ARCH_LOG2_SIZEOF_LONG_LONG 3
> > -#define ARCH_SIZEOF_GX_COLOR_INDEX 8
> > -#define ARCH_SIZEOF_PTR 8
> > -#define ARCH_SIZEOF_FLOAT 4
> > -#define ARCH_SIZEOF_DOUBLE 8
> > -#define ARCH_FLOAT_MANTISSA_BITS 24
> > -#define ARCH_DOUBLE_MANTISSA_BITS 53
> > -
> > -      /* ---------------- Unsigned max values ---------------- */
> > -
> > -#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
> > -#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
> > -#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
> > -#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
> > -
> > -      /* ---------------- Miscellaneous ---------------- */
> > -
> > -#define ARCH_IS_BIG_ENDIAN 1
> > -#define ARCH_PTRS_ARE_SIGNED 0
> > -#define ARCH_FLOATS_ARE_IEEE 1
> > -#define ARCH_ARITH_RSHIFT 2
> > -#define ARCH_DIV_NEG_POS_TRUNCATES 1
> > diff --git
> a/meta/recipes-extended/ghostscript/ghostscript/powerpc64le/objarch.h
> b/meta/recipes-extended/ghostscript/ghostscript/powerpc64le/objarch.h
> > deleted file mode 100644
> > index a05de29def..0000000000
> > --- a/meta/recipes-extended/ghostscript/ghostscript/powerpc64le/objarch.h
> > +++ /dev/null
> > @@ -1,40 +0,0 @@
> > -/* Parameters derived from machine and compiler architecture. */
> > -/* This file is generated mechanically by genarch.c. */
> > -
> > -      /* ---------------- Scalar alignments ---------------- */
> > -
> > -#define ARCH_ALIGN_SHORT_MOD 2
> > -#define ARCH_ALIGN_INT_MOD 4
> > -#define ARCH_ALIGN_LONG_MOD 8
> > -#define ARCH_ALIGN_PTR_MOD 8
> > -#define ARCH_ALIGN_FLOAT_MOD 4
> > -#define ARCH_ALIGN_DOUBLE_MOD 8
> > -
> > -      /* ---------------- Scalar sizes ---------------- */
> > -
> > -#define ARCH_LOG2_SIZEOF_CHAR 0
> > -#define ARCH_LOG2_SIZEOF_SHORT 1
> > -#define ARCH_LOG2_SIZEOF_INT 2
> > -#define ARCH_LOG2_SIZEOF_LONG 3
> > -#define ARCH_LOG2_SIZEOF_LONG_LONG 3
> > -#define ARCH_SIZEOF_GX_COLOR_INDEX 8
> > -#define ARCH_SIZEOF_PTR 8
> > -#define ARCH_SIZEOF_FLOAT 4
> > -#define ARCH_SIZEOF_DOUBLE 8
> > -#define ARCH_FLOAT_MANTISSA_BITS 24
> > -#define ARCH_DOUBLE_MANTISSA_BITS 53
> > -
> > -      /* ---------------- Unsigned max values ---------------- */
> > -
> > -#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
> > -#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
> > -#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
> > -#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
> > -
> > -      /* ---------------- Miscellaneous ---------------- */
> > -
> > -#define ARCH_IS_BIG_ENDIAN 0
> > -#define ARCH_PTRS_ARE_SIGNED 0
> > -#define ARCH_FLOATS_ARE_IEEE 1
> > -#define ARCH_ARITH_RSHIFT 2
> > -#define ARCH_DIV_NEG_POS_TRUNCATES 1
> > diff --git
> a/meta/recipes-extended/ghostscript/ghostscript/x86-64/objarch.h
> b/meta/recipes-extended/ghostscript/ghostscript/x86-64/objarch.h
> > deleted file mode 100644
> > index a05de29def..0000000000
> > --- a/meta/recipes-extended/ghostscript/ghostscript/x86-64/objarch.h
> > +++ /dev/null
> > @@ -1,40 +0,0 @@
> > -/* Parameters derived from machine and compiler architecture. */
> > -/* This file is generated mechanically by genarch.c. */
> > -
> > -      /* ---------------- Scalar alignments ---------------- */
> > -
> > -#define ARCH_ALIGN_SHORT_MOD 2
> > -#define ARCH_ALIGN_INT_MOD 4
> > -#define ARCH_ALIGN_LONG_MOD 8
> > -#define ARCH_ALIGN_PTR_MOD 8
> > -#define ARCH_ALIGN_FLOAT_MOD 4
> > -#define ARCH_ALIGN_DOUBLE_MOD 8
> > -
> > -      /* ---------------- Scalar sizes ---------------- */
> > -
> > -#define ARCH_LOG2_SIZEOF_CHAR 0
> > -#define ARCH_LOG2_SIZEOF_SHORT 1
> > -#define ARCH_LOG2_SIZEOF_INT 2
> > -#define ARCH_LOG2_SIZEOF_LONG 3
> > -#define ARCH_LOG2_SIZEOF_LONG_LONG 3
> > -#define ARCH_SIZEOF_GX_COLOR_INDEX 8
> > -#define ARCH_SIZEOF_PTR 8
> > -#define ARCH_SIZEOF_FLOAT 4
> > -#define ARCH_SIZEOF_DOUBLE 8
> > -#define ARCH_FLOAT_MANTISSA_BITS 24
> > -#define ARCH_DOUBLE_MANTISSA_BITS 53
> > -
> > -      /* ---------------- Unsigned max values ---------------- */
> > -
> > -#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
> > -#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
> > -#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
> > -#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
> > -
> > -      /* ---------------- Miscellaneous ---------------- */
> > -
> > -#define ARCH_IS_BIG_ENDIAN 0
> > -#define ARCH_PTRS_ARE_SIGNED 0
> > -#define ARCH_FLOATS_ARE_IEEE 1
> > -#define ARCH_ARITH_RSHIFT 2
> > -#define ARCH_DIV_NEG_POS_TRUNCATES 1
> > diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.50.bb
> b/meta/recipes-extended/ghostscript/ghostscript_9.52.bb
> > similarity index 89%
> > rename from meta/recipes-extended/ghostscript/ghostscript_9.50.bb
> > rename to meta/recipes-extended/ghostscript/ghostscript_9.52.bb
> > index 5e8af8dc11..4cdb6e00d8 100644
> > --- a/meta/recipes-extended/ghostscript/ghostscript_9.50.bb
> > +++ b/meta/recipes-extended/ghostscript/ghostscript_9.52.bb
> > @@ -29,13 +29,10 @@ SRC_URI_BASE = "
> https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
> >                   file://do-not-check-local-libpng-source.patch \
> >                   file://avoid-host-contamination.patch \
> >                   file://mkdir-p.patch \
> > -                file://CVE-2019-14869-0001.patch \
> >   "
> >
> >   SRC_URI = "${SRC_URI_BASE} \
> >              file://ghostscript-9.21-prevent_recompiling.patch \
> > -           file://ghostscript-9.02-genarch.patch \
> > -           file://objarch.h \
> >              file://cups-no-gcrypt.patch \
> >              "
> >
> > @@ -44,8 +41,8 @@ SRC_URI_class-native = "${SRC_URI_BASE} \
> >
>  file://base-genht.c-add-a-preprocessor-define-to-allow-fope.patch \
> >                           "
> >
> > -SRC_URI[md5sum] = "00970cf622bd5b46f68eec9383753870"
> > -SRC_URI[sha256sum] =
> "0f53e89fd647815828fc5171613e860e8535b68f7afbc91bf89aee886769ce89"
> > +SRC_URI[md5sum] = "0f6964ab9b83a63b7e373f136243f901"
> > +SRC_URI[sha256sum] =
> "c2501d8e8e0814c4a5aa7e443e230e73d7af7f70287546f7b697e5ef49e32176"
> >
> >   # Put something like
> >   #
> > @@ -76,7 +73,7 @@ EXTRA_OECONF_class-native = "--without-x
> --with-system-libtiff=no \
> >                                --without-jbig2dec --without-libpaper \
> >                                --with-fontpath=${datadir}/fonts \
> >                                --without-libidn --disable-fontconfig \
> > -                             --disable-freetype --disable-cups"
> > +                             --enable-freetype --disable-cups "
> >
> >   # This has been fixed upstream but for now we need to subvert the
> check for time.h
> >   # http://bugs.ghostscript.com/show_bug.cgi?id=692443
> > @@ -84,15 +81,7 @@ EXTRA_OECONF_class-native = "--without-x
> --with-system-libtiff=no \
> >   CFLAGS += "-DHAVE_SYS_TIME_H=1"
> >   BUILD_CFLAGS += "-DHAVE_SYS_TIME_H=1"
> >
> > -inherit autotools
> > -
> > -do_configure_prepend () {
> > -     mkdir -p obj
> > -     mkdir -p soobj
> > -     if [ -e ${WORKDIR}/objarch.h ]; then
> > -             cp ${WORKDIR}/objarch.h obj/arch.h
> > -     fi
> > -}
> > +inherit autotools-brokensep
> >
> >   do_configure_append () {
> >       # copy tools from the native ghostscript build
> >
> >
> > 
> >
>

--00000000000090be2005a485073d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>As far as I understand, yes:</div><div><br></div><div=
><a href=3D"http://git.ghostscript.com/?p=3Dghostpdl.git;a=3Dblob;f=3Dconfi=
gure.ac;h=3D5a005ff16bc222f572695f569ce068a1153ed8b7;hb=3DHEAD#l3345">http:=
//git.ghostscript.com/?p=3Dghostpdl.git;a=3Dblob;f=3Dconfigure.ac;h=3D5a005=
ff16bc222f572695f569ce068a1153ed8b7;hb=3DHEAD#l3345</a></div><div><br></div=
><div>This seems to be cross-compiler safe to me: $host does not match $bui=
ld (which implies the block is meant for cross compile scenarios),</div><di=
v> and the macros are all determined via AC_CHECK_SIZEOF/AC_CHECK_ALIGNOF w=
hich are cross compile safe.</div><div><a href=3D"https://www.gnu.org/softw=
are/autoconf/manual/autoconf-2.67/html_node/Generic-Compiler-Characteristic=
s.html">https://www.gnu.org/software/autoconf/manual/autoconf-2.67/html_nod=
e/Generic-Compiler-Characteristics.html</a></div><div><br></div><div>Alex<b=
r></div><div dir=3D"ltr"><br></div><div dir=3D"ltr"><br></div><div dir=3D"l=
tr">On Thu, 30 Apr 2020 at 17:48, Khem Raj &lt;<a href=3D"mailto:raj.khem@g=
mail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><div class=3D"gmail_qu=
ote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">they were generated =
in past too, but they were not cross compiler safe. <br>
has that changed ?<br>
<br>
&gt; Freetype can no longer be disabled.<br>
&gt; <br>
&gt; Building out of source tree is broken.<br>
&gt; <br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0.../do-not-check-local-libpng-source.patch=C2=A0 =C2=A0 |=
 37 ++++------<br>
&gt;=C2=A0 =C2=A0.../ghostscript/CVE-2019-14869-0001.patch=C2=A0 =C2=A0 =
=C2=A0| 70 -------------------<br>
&gt;=C2=A0 =C2=A0.../ghostscript/ghostscript/aarch64/objarch.h | 40 ------=
-----<br>
&gt;=C2=A0 =C2=A0.../ghostscript/ghostscript/arm/objarch.h=C2=A0 =C2=A0 =
=C2=A0| 40 -----------<br>
&gt;=C2=A0 =C2=A0.../ghostscript/ghostscript/armeb/objarch.h=C2=A0 =C2=A0|=
 40 -----------<br>
&gt;=C2=A0 =C2=A0.../ghostscript-9.02-genarch.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 38 ----------<br>
&gt;=C2=A0 =C2=A0.../ghostscript/ghostscript/i586/objarch.h=C2=A0 =C2=A0 |=
 41 -----------<br>
&gt;=C2=A0 =C2=A0.../ghostscript/microblaze/objarch.h=C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 | 40 -----------<br>
&gt;=C2=A0 =C2=A0.../ghostscript/microblazeel/objarch.h=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 40 -----------<br>
&gt;=C2=A0 =C2=A0.../ghostscript/mipsarchn32eb/objarch.h=C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 40 -----------<br>
&gt;=C2=A0 =C2=A0.../ghostscript/mipsarchn32el/objarch.h=C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 40 -----------<br>
&gt;=C2=A0 =C2=A0.../ghostscript/mipsarchn64eb/objarch.h=C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 40 -----------<br>
&gt;=C2=A0 =C2=A0.../ghostscript/mipsarchn64el/objarch.h=C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 40 -----------<br>
&gt;=C2=A0 =C2=A0.../ghostscript/mipsarcho32eb/objarch.h=C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 40 -----------<br>
&gt;=C2=A0 =C2=A0.../ghostscript/mipsarcho32el/objarch.h=C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 40 -----------<br>
&gt;=C2=A0 =C2=A0.../ghostscript/ghostscript/nios2/objarch.h=C2=A0 =C2=A0|=
 40 -----------<br>
&gt;=C2=A0 =C2=A0.../ghostscript/ghostscript/powerpc/objarch.h | 40 ------=
-----<br>
&gt;=C2=A0 =C2=A0.../ghostscript/powerpc64/objarch.h=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 40 -----------<br>
&gt;=C2=A0 =C2=A0.../ghostscript/powerpc64le/objarch.h=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| 40 -----------<br>
&gt;=C2=A0 =C2=A0.../ghostscript/ghostscript/x86-64/objarch.h=C2=A0 | 40 -=
----------<br>
&gt;=C2=A0 =C2=A0...<a href=3D"http://hostscript_9.50.bb" rel=3D"noreferre=
r" target=3D"_blank">hostscript_9.50.bb</a> =3D&gt; <a href=3D"http://ghost=
script_9.52.bb" rel=3D"noreferrer" target=3D"_blank">ghostscript_9.52.bb</a=
>} | 19 ++---<br>
&gt;=C2=A0 =C2=A021 files changed, 19 insertions(+), 826 deletions(-)<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta/recipes-extended/ghostscript/ghos=
tscript/CVE-2019-14869-0001.patch<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta/recipes-extended/ghostscript/ghos=
tscript/aarch64/objarch.h<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta/recipes-extended/ghostscript/ghos=
tscript/arm/objarch.h<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta/recipes-extended/ghostscript/ghos=
tscript/armeb/objarch.h<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta/recipes-extended/ghostscript/ghos=
tscript/ghostscript-9.02-genarch.patch<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta/recipes-extended/ghostscript/ghos=
tscript/i586/objarch.h<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta/recipes-extended/ghostscript/ghos=
tscript/microblaze/objarch.h<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta/recipes-extended/ghostscript/ghos=
tscript/microblazeel/objarch.h<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta/recipes-extended/ghostscript/ghos=
tscript/mipsarchn32eb/objarch.h<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta/recipes-extended/ghostscript/ghos=
tscript/mipsarchn32el/objarch.h<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta/recipes-extended/ghostscript/ghos=
tscript/mipsarchn64eb/objarch.h<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta/recipes-extended/ghostscript/ghos=
tscript/mipsarchn64el/objarch.h<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta/recipes-extended/ghostscript/ghos=
tscript/mipsarcho32eb/objarch.h<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta/recipes-extended/ghostscript/ghos=
tscript/mipsarcho32el/objarch.h<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta/recipes-extended/ghostscript/ghos=
tscript/nios2/objarch.h<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta/recipes-extended/ghostscript/ghos=
tscript/powerpc/objarch.h<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta/recipes-extended/ghostscript/ghos=
tscript/powerpc64/objarch.h<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta/recipes-extended/ghostscript/ghos=
tscript/powerpc64le/objarch.h<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta/recipes-extended/ghostscript/ghos=
tscript/x86-64/objarch.h<br>
&gt;=C2=A0 =C2=A0rename meta/recipes-extended/ghostscript/{<a href=3D"http=
://ghostscript_9.50.bb" rel=3D"noreferrer" target=3D"_blank">ghostscript_9.=
50.bb</a> =3D&gt; <a href=3D"http://ghostscript_9.52.bb" rel=3D"noreferrer"=
 target=3D"_blank">ghostscript_9.52.bb</a>} (89%)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-extended/ghostscript/files/do-not-check-loc=
al-libpng-source.patch b/meta/recipes-extended/ghostscript/files/do-not-che=
ck-local-libpng-source.patch<br>
&gt; index 5834ffaf9f..a9afb9948c 100644<br>
&gt; --- a/meta/recipes-extended/ghostscript/files/do-not-check-local-libp=
ng-source.patch<br>
&gt; +++ b/meta/recipes-extended/ghostscript/files/do-not-check-local-libp=
ng-source.patch<br>
&gt; @@ -1,7 +1,7 @@<br>
&gt; -From a954bf29a5f906b3151dffbecb5856e02e1565da Mon Sep 17 00:00:00 20=
01<br>
&gt; +From 2adaa7366064a8f18af864eda74e52877a89620c Mon Sep 17 00:00:00 20=
01<br>
&gt;=C2=A0 =C2=A0From: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriv=
er.com" target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0Date: Mon, 18 Jan 2016 01:00:30 -0500<br>
&gt; -Subject: [PATCH 03/10] <a href=3D"http://configure.ac" rel=3D"norefe=
rrer" target=3D"_blank">configure.ac</a>: do not check local png source<br>
&gt; +Subject: [PATCH] <a href=3D"http://configure.ac" rel=3D"noreferrer" =
target=3D"_blank">configure.ac</a>: do not check local png source<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0In oe-core, it did not need to compile local libpng<br>
&gt;=C2=A0 =C2=A0source in ghostscript, so do not check local png<br>
&gt; @@ -11,28 +11,21 @@ libpng library.<br>
&gt;=C2=A0 =C2=A0Upstream-Status: Inappropriate [OE-Core specific]<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.ji=
a@windriver.com" target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0---<br>
&gt; - <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank=
">configure.ac</a> | 4 ++--<br>
&gt; - 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; + <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank=
">configure.ac</a> | 2 +-<br>
&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0diff --git a/<a href=3D"http://configure.ac" rel=3D"noref=
errer" target=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac"=
 rel=3D"noreferrer" target=3D"_blank">configure.ac</a><br>
&gt; -index 9341930..80a60b1 100644<br>
&gt; +index 698abd3..e65ac8b 100644<br>
&gt;=C2=A0 =C2=A0--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" =
target=3D"_blank">configure.ac</a><br>
&gt;=C2=A0 =C2=A0+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" =
target=3D"_blank">configure.ac</a><br>
&gt; -@@ -1114,11 +1114,11 @@ AC_SUBST(ZLIBDIR)<br>
&gt; - AC_SUBST(FT_SYS_ZLIB)<br>
&gt; -<br>
&gt; - dnl png for the png output device; it also requires zlib<br>
&gt; --LIBPNGDIR=3Dsrc<br>
&gt; -+LIBPNGDIR=3D$srcdir/libpng<br>
&gt; - PNGDEVS=3D&#39;&#39;<br>
&gt; - PNGDEVS_ALL=3D&#39;png48 png16m pnggray pngmono pngmonod png256 png=
16 pngalpha&#39;<br>
&gt; - AC_MSG_CHECKING([for local png library source])<br>
&gt; --if test -f $srcdir/libpng/pngread.c; then<br>
&gt; -+if false; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_MSG_RESULT([yes])<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SHARE_LIBPNG=3D0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LIBPNGDIR=3D$srcdir/libpng<br>
&gt; ---<br>
&gt; -1.8.3.1<br>
&gt; -<br>
&gt; +@@ -1241,7 +1241,7 @@ else<br>
&gt; +=C2=A0 =C2=A0PNGDEVS=3D&#39;&#39;<br>
&gt; +=C2=A0 =C2=A0PNGDEVS_ALL=3D&#39;png48 png16m pnggray pngmono pngmono=
d png256 png16 pngalpha&#39;<br>
&gt; +=C2=A0 =C2=A0AC_MSG_CHECKING([for local png library source])<br>
&gt; +-=C2=A0 if test -f $srcdir/libpng/pngread.c; then<br>
&gt; ++=C2=A0 if false; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_MSG_RESULT([yes])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SHARE_LIBPNG=3D0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LIBPNGDIR=3D$srcdir/libpng<=
br>
&gt; diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-1=
4869-0001.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14=
869-0001.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 715ec1c450..0000000000<br>
&gt; --- a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14869-00=
01.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,70 +0,0 @@<br>
&gt; -From 485904772c5f0aa1140032746e5a0abfc40f4cef Mon Sep 17 00:00:00 20=
01<br>
&gt; -From: Chris Liddell &lt;<a href=3D"mailto:chris.liddell@artifex.com"=
 target=3D"_blank">chris.liddell@artifex.com</a>&gt;<br>
&gt; -Date: Tue, 5 Nov 2019 09:45:27 +0000<br>
&gt; -Subject: [PATCH] Bug 701841: remove .forceput from /.charkeys<br>
&gt; -<br>
&gt; -When loading Type 1 or Truetype fonts from disk, we attempt to exten=
d the glyph<br>
&gt; -name table to include all identifiable glyph names from the Adobe Gl=
yph List.<br>
&gt; -<br>
&gt; -In the case of Type 1 fonts, the font itself (almost always) marks t=
he<br>
&gt; -CharStrings dictionary as read-only, hence we have to use .forceput =
for that<br>
&gt; -case.<br>
&gt; -<br>
&gt; -But for Truetype fonts, the CharStrings dictionary is created intern=
ally and is<br>
&gt; -not read-only until *after* we have fully populated it (including th=
e extended<br>
&gt; -glyph names from the AGL), hence there is no need for .forceput, and=
 no need to<br>
&gt; -carry the security risk of using it.<br>
&gt; -<br>
&gt; -Replace with regular put.<br>
&gt; -<br>
&gt; -CVE: CVE-2019-14869<br>
&gt; -Upstream-Status: Backport [git://<a href=3D"http://git.ghostscript.c=
om/ghostpdl.git" rel=3D"noreferrer" target=3D"_blank">git.ghostscript.com/g=
hostpdl.git</a>]<br>
&gt; -<br>
&gt; -Signed-off-by: Stefan Ghinea &lt;<a href=3D"mailto:stefan.ghinea@win=
driver.com" target=3D"_blank">stefan.ghinea@windriver.com</a>&gt;<br>
&gt; ----<br>
&gt; - Resource/Init/<a href=3D"http://gs_ttf.ps" rel=3D"noreferrer" targe=
t=3D"_blank">gs_ttf.ps</a> | 8 ++++----<br>
&gt; - 1 file changed, 4 insertions(+), 4 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/Resource/Init/<a href=3D"http://gs_ttf.ps" rel=3D"noref=
errer" target=3D"_blank">gs_ttf.ps</a> b/Resource/Init/<a href=3D"http://gs=
_ttf.ps" rel=3D"noreferrer" target=3D"_blank">gs_ttf.ps</a><br>
&gt; -index e34967d..5354ff0 100644<br>
&gt; ---- a/Resource/Init/<a href=3D"http://gs_ttf.ps" rel=3D"noreferrer" =
target=3D"_blank">gs_ttf.ps</a><br>
&gt; -+++ b/Resource/Init/<a href=3D"http://gs_ttf.ps" rel=3D"noreferrer" =
target=3D"_blank">gs_ttf.ps</a><br>
&gt; -@@ -1301,7 +1301,7 @@ currentdict /.pickcmap_with_no_xlatmap .undef<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TTFDEBUG { (\n1 setting ali=
as: ) print dup =3D=3Donly<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0( to b=
e the same as=C2=A0 ) print 2 index //=3D=3D exec } if<br>
&gt; -<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 7 index 2 index 3 -1 roll exch .=
forceput<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 7 index 2 index 3 -1 roll exch p=
ut<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} forall<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pop pop pop<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -@@ -1319,7 +1319,7 @@ currentdict /.pickcmap_with_no_xlatmap .undef<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exch pop<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TTFDEBUG { (\n2 setting ali=
as: ) print 1 index =3D=3Donly<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ( to use glyph index: ) print dup //=3D=3D exec } if<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 5 index 3 1 roll .forceput<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 5 index 3 1 roll put<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0//false<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; -@@ -1336,7 +1336,7 @@ currentdict /.pickcmap_with_no_xlatmap .undef<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 %=C2=A0=
 CharStrings(dict) isunicode(boolean) cmap(dict) RAGL(dict) gname(name) cod=
ep(integer) gindex(integer)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TTFDEBUG { (\3 nsetting ali=
as: ) print 1 index =3D=3Donly<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0( to b=
e index: ) print dup //=3D=3D exec } if<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exch pop 5 index 3 1 roll .force=
put<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exch pop 5 index 3 1 roll put<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pop pop<br>
&gt; -@@ -1366,7 +1366,7 @@ currentdict /.pickcmap_with_no_xlatmap .undef<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0} ifelse<br>
&gt; -=C2=A0 =C2=A0 =C2=A0]<br>
&gt; -=C2=A0 =C2=A0TTFDEBUG { (Encoding: ) print dup =3D=3D=3D flush } if<=
br>
&gt; --} .bind executeonly odef=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 %=
 hides .forceput<br>
&gt; -+} .bind odef<br>
&gt; -<br>
&gt; - % ---------------- CIDFontType 2 font loading ---------------- %<br=
>
&gt; -<br>
&gt; ---<br>
&gt; -2.20.1<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-extended/ghostscript/ghostscript/aarch64/ob=
jarch.h b/meta/recipes-extended/ghostscript/ghostscript/aarch64/objarch.h<b=
r>
&gt; deleted file mode 100644<br>
&gt; index a05de29def..0000000000<br>
&gt; --- a/meta/recipes-extended/ghostscript/ghostscript/aarch64/objarch.h=
<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,40 +0,0 @@<br>
&gt; -/* Parameters derived from machine and compiler architecture. */<br>
&gt; -/* This file is generated mechanically by genarch.c. */<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Scalar alignments ---------=
------- */<br>
&gt; -<br>
&gt; -#define ARCH_ALIGN_SHORT_MOD 2<br>
&gt; -#define ARCH_ALIGN_INT_MOD 4<br>
&gt; -#define ARCH_ALIGN_LONG_MOD 8<br>
&gt; -#define ARCH_ALIGN_PTR_MOD 8<br>
&gt; -#define ARCH_ALIGN_FLOAT_MOD 4<br>
&gt; -#define ARCH_ALIGN_DOUBLE_MOD 8<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Scalar sizes --------------=
-- */<br>
&gt; -<br>
&gt; -#define ARCH_LOG2_SIZEOF_CHAR 0<br>
&gt; -#define ARCH_LOG2_SIZEOF_SHORT 1<br>
&gt; -#define ARCH_LOG2_SIZEOF_INT 2<br>
&gt; -#define ARCH_LOG2_SIZEOF_LONG 3<br>
&gt; -#define ARCH_LOG2_SIZEOF_LONG_LONG 3<br>
&gt; -#define ARCH_SIZEOF_GX_COLOR_INDEX 8<br>
&gt; -#define ARCH_SIZEOF_PTR 8<br>
&gt; -#define ARCH_SIZEOF_FLOAT 4<br>
&gt; -#define ARCH_SIZEOF_DOUBLE 8<br>
&gt; -#define ARCH_FLOAT_MANTISSA_BITS 24<br>
&gt; -#define ARCH_DOUBLE_MANTISSA_BITS 53<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Unsigned max values -------=
--------- */<br>
&gt; -<br>
&gt; -#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)<br>
&gt; -#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)=
<br>
&gt; -#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)<br>
&gt; -#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Miscellaneous -------------=
--- */<br>
&gt; -<br>
&gt; -#define ARCH_IS_BIG_ENDIAN 0<br>
&gt; -#define ARCH_PTRS_ARE_SIGNED 0<br>
&gt; -#define ARCH_FLOATS_ARE_IEEE 1<br>
&gt; -#define ARCH_ARITH_RSHIFT 2<br>
&gt; -#define ARCH_DIV_NEG_POS_TRUNCATES 1<br>
&gt; diff --git a/meta/recipes-extended/ghostscript/ghostscript/arm/objarc=
h.h b/meta/recipes-extended/ghostscript/ghostscript/arm/objarch.h<br>
&gt; deleted file mode 100644<br>
&gt; index e8772cd958..0000000000<br>
&gt; --- a/meta/recipes-extended/ghostscript/ghostscript/arm/objarch.h<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,40 +0,0 @@<br>
&gt; -/* Parameters derived from machine and compiler architecture. */<br>
&gt; -/* This file is generated mechanically by genarch.c. */<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Scalar alignments ---------=
------- */<br>
&gt; -<br>
&gt; -#define ARCH_ALIGN_SHORT_MOD 2<br>
&gt; -#define ARCH_ALIGN_INT_MOD 4<br>
&gt; -#define ARCH_ALIGN_LONG_MOD 4<br>
&gt; -#define ARCH_ALIGN_PTR_MOD 4<br>
&gt; -#define ARCH_ALIGN_FLOAT_MOD 4<br>
&gt; -#define ARCH_ALIGN_DOUBLE_MOD 8<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Scalar sizes --------------=
-- */<br>
&gt; -<br>
&gt; -#define ARCH_LOG2_SIZEOF_CHAR 0<br>
&gt; -#define ARCH_LOG2_SIZEOF_SHORT 1<br>
&gt; -#define ARCH_LOG2_SIZEOF_INT 2<br>
&gt; -#define ARCH_LOG2_SIZEOF_LONG 2<br>
&gt; -#define ARCH_LOG2_SIZEOF_LONG_LONG 3<br>
&gt; -#define ARCH_SIZEOF_GX_COLOR_INDEX 8<br>
&gt; -#define ARCH_SIZEOF_PTR 4<br>
&gt; -#define ARCH_SIZEOF_FLOAT 4<br>
&gt; -#define ARCH_SIZEOF_DOUBLE 8<br>
&gt; -#define ARCH_FLOAT_MANTISSA_BITS 24<br>
&gt; -#define ARCH_DOUBLE_MANTISSA_BITS 53<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Unsigned max values -------=
--------- */<br>
&gt; -<br>
&gt; -#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)<br>
&gt; -#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)=
<br>
&gt; -#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)<br>
&gt; -#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Miscellaneous -------------=
--- */<br>
&gt; -<br>
&gt; -#define ARCH_IS_BIG_ENDIAN 0<br>
&gt; -#define ARCH_PTRS_ARE_SIGNED 0<br>
&gt; -#define ARCH_FLOATS_ARE_IEEE 1<br>
&gt; -#define ARCH_ARITH_RSHIFT 2<br>
&gt; -#define ARCH_DIV_NEG_POS_TRUNCATES 1<br>
&gt; diff --git a/meta/recipes-extended/ghostscript/ghostscript/armeb/obja=
rch.h b/meta/recipes-extended/ghostscript/ghostscript/armeb/objarch.h<br>
&gt; deleted file mode 100644<br>
&gt; index 359097f356..0000000000<br>
&gt; --- a/meta/recipes-extended/ghostscript/ghostscript/armeb/objarch.h<b=
r>
&gt; +++ /dev/null<br>
&gt; @@ -1,40 +0,0 @@<br>
&gt; -/* Parameters derived from machine and compiler architecture. */<br>
&gt; -/* This file is generated mechanically by genarch.c. */<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Scalar alignments ---------=
------- */<br>
&gt; -<br>
&gt; -#define ARCH_ALIGN_SHORT_MOD 2<br>
&gt; -#define ARCH_ALIGN_INT_MOD 4<br>
&gt; -#define ARCH_ALIGN_LONG_MOD 4<br>
&gt; -#define ARCH_ALIGN_PTR_MOD 4<br>
&gt; -#define ARCH_ALIGN_FLOAT_MOD 4<br>
&gt; -#define ARCH_ALIGN_DOUBLE_MOD 8<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Scalar sizes --------------=
-- */<br>
&gt; -<br>
&gt; -#define ARCH_LOG2_SIZEOF_CHAR 0<br>
&gt; -#define ARCH_LOG2_SIZEOF_SHORT 1<br>
&gt; -#define ARCH_LOG2_SIZEOF_INT 2<br>
&gt; -#define ARCH_LOG2_SIZEOF_LONG 2<br>
&gt; -#define ARCH_LOG2_SIZEOF_LONG_LONG 3<br>
&gt; -#define ARCH_SIZEOF_GX_COLOR_INDEX 8<br>
&gt; -#define ARCH_SIZEOF_PTR 4<br>
&gt; -#define ARCH_SIZEOF_FLOAT 4<br>
&gt; -#define ARCH_SIZEOF_DOUBLE 8<br>
&gt; -#define ARCH_FLOAT_MANTISSA_BITS 24<br>
&gt; -#define ARCH_DOUBLE_MANTISSA_BITS 53<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Unsigned max values -------=
--------- */<br>
&gt; -<br>
&gt; -#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)<br>
&gt; -#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)=
<br>
&gt; -#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)<br>
&gt; -#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Miscellaneous -------------=
--- */<br>
&gt; -<br>
&gt; -#define ARCH_IS_BIG_ENDIAN 1<br>
&gt; -#define ARCH_PTRS_ARE_SIGNED 0<br>
&gt; -#define ARCH_FLOATS_ARE_IEEE 1<br>
&gt; -#define ARCH_ARITH_RSHIFT 2<br>
&gt; -#define ARCH_DIV_NEG_POS_TRUNCATES 1<br>
&gt; diff --git a/meta/recipes-extended/ghostscript/ghostscript/ghostscrip=
t-9.02-genarch.patch b/meta/recipes-extended/ghostscript/ghostscript/ghosts=
cript-9.02-genarch.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 7b70bb8e2c..0000000000<br>
&gt; --- a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-=
genarch.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,38 +0,0 @@<br>
&gt; -From c076d0fc970f190f723018258790c79b59daba2e Mon Sep 17 00:00:00 20=
01<br>
&gt; -From: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" tar=
get=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
&gt; -Date: Sat, 11 May 2019 21:20:27 +0800<br>
&gt; -Subject: [PATCH] not generate objarch.h at compile time<br>
&gt; -<br>
&gt; -Import patch from windriver linux for cross compilation, and split<b=
r>
&gt; -patches into oe way under different directories such as i586, powerp=
c etc<br>
&gt; -according to Richard&#39;s opinion.<br>
&gt; -<br>
&gt; -Upstream-Status: Pending<br>
&gt; -<br>
&gt; -Signed-off-by: Kang Kai &lt;<a href=3D"mailto:kai.kang@windriver.com=
" target=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
&gt; -Signed-off-by: Wenzong Fan &lt;<a href=3D"mailto:wenzong.fan@windriv=
er.com" target=3D"_blank">wenzong.fan@windriver.com</a>&gt;<br>
&gt; -<br>
&gt; -Rebase to 9.27<br>
&gt; -Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver=
.com" target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
&gt; ----<br>
&gt; - base/lib.mak | 4 ++--<br>
&gt; - 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/base/lib.mak b/base/lib.mak<br>
&gt; -index 3ed088a..5af2b43 100644<br>
&gt; ---- a/base/lib.mak<br>
&gt; -+++ b/base/lib.mak<br>
&gt; -@@ -87,8 +87,8 @@ arch_h=3D$(GLGEN)arch.h<br>
&gt; - stdpre_h=3D$(GLSRC)stdpre.h<br>
&gt; - stdint__h=3D$(GLSRC)stdint_.h<br>
&gt; -<br>
&gt; --$(GLGEN)arch.h : $(GENARCH_XE)<br>
&gt; --=C2=A0 =C2=A0 $(EXP)$(GENARCH_XE) $(GLGEN)arch.h $(TARGET_ARCH_FILE=
)<br>
&gt; -+##$(GLGEN)arch.h : $(GENARCH_XE)<br>
&gt; -+##=C2=A0 $(EXP)$(GENARCH_XE) $(GLGEN)arch.h $(TARGET_ARCH_FILE)<br>
&gt; -<br>
&gt; - # Platform interfaces<br>
&gt; -<br>
&gt; ---<br>
&gt; -2.7.4<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-extended/ghostscript/ghostscript/i586/objar=
ch.h b/meta/recipes-extended/ghostscript/ghostscript/i586/objarch.h<br>
&gt; deleted file mode 100644<br>
&gt; index 5817b7a6d7..0000000000<br>
&gt; --- a/meta/recipes-extended/ghostscript/ghostscript/i586/objarch.h<br=
>
&gt; +++ /dev/null<br>
&gt; @@ -1,41 +0,0 @@<br>
&gt; -/* Parameters derived from machine and compiler architecture. */<br>
&gt; -/* This file is generated mechanically by genarch.c. */<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Scalar alignments ---------=
------- */<br>
&gt; -<br>
&gt; -#define ARCH_ALIGN_SHORT_MOD 2<br>
&gt; -#define ARCH_ALIGN_INT_MOD 4<br>
&gt; -#define ARCH_ALIGN_LONG_MOD 4<br>
&gt; -#define ARCH_ALIGN_PTR_MOD 4<br>
&gt; -#define ARCH_ALIGN_FLOAT_MOD 4<br>
&gt; -#define ARCH_ALIGN_DOUBLE_MOD 4<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Scalar sizes --------------=
-- */<br>
&gt; -<br>
&gt; -#define ARCH_LOG2_SIZEOF_CHAR 0<br>
&gt; -#define ARCH_LOG2_SIZEOF_SHORT 1<br>
&gt; -#define ARCH_LOG2_SIZEOF_INT 2<br>
&gt; -#define ARCH_LOG2_SIZEOF_LONG 2<br>
&gt; -#define ARCH_LOG2_SIZEOF_LONG_LONG 3<br>
&gt; -#define ARCH_SIZEOF_GX_COLOR_INDEX 8<br>
&gt; -#define ARCH_SIZEOF_PTR 4<br>
&gt; -#define ARCH_SIZEOF_FLOAT 4<br>
&gt; -#define ARCH_SIZEOF_DOUBLE 8<br>
&gt; -#define ARCH_FLOAT_MANTISSA_BITS 24<br>
&gt; -#define ARCH_DOUBLE_MANTISSA_BITS 53<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Unsigned max values -------=
--------- */<br>
&gt; -<br>
&gt; -#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)<br>
&gt; -#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)=
<br>
&gt; -#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)<br>
&gt; -#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Miscellaneous -------------=
--- */<br>
&gt; -<br>
&gt; -#define ARCH_IS_BIG_ENDIAN 0<br>
&gt; -#define ARCH_PTRS_ARE_SIGNED 0<br>
&gt; -#define ARCH_FLOATS_ARE_IEEE 1<br>
&gt; -#define ARCH_ARITH_RSHIFT 2<br>
&gt; -#define ARCH_DIV_NEG_POS_TRUNCATES 1<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-extended/ghostscript/ghostscript/microblaze=
/objarch.h b/meta/recipes-extended/ghostscript/ghostscript/microblaze/objar=
ch.h<br>
&gt; deleted file mode 100644<br>
&gt; index 63232fdfa6..0000000000<br>
&gt; --- a/meta/recipes-extended/ghostscript/ghostscript/microblaze/objarc=
h.h<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,40 +0,0 @@<br>
&gt; -/* Parameters derived from machine and compiler architecture. */<br>
&gt; -/* This file is generated mechanically by genarch.c. */<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Scalar alignments ---------=
------- */<br>
&gt; -<br>
&gt; -#define ARCH_ALIGN_SHORT_MOD 2<br>
&gt; -#define ARCH_ALIGN_INT_MOD 4<br>
&gt; -#define ARCH_ALIGN_LONG_MOD 4<br>
&gt; -#define ARCH_ALIGN_PTR_MOD 4<br>
&gt; -#define ARCH_ALIGN_FLOAT_MOD 4<br>
&gt; -#define ARCH_ALIGN_DOUBLE_MOD 4<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Scalar sizes --------------=
-- */<br>
&gt; -<br>
&gt; -#define ARCH_LOG2_SIZEOF_CHAR 0<br>
&gt; -#define ARCH_LOG2_SIZEOF_SHORT 1<br>
&gt; -#define ARCH_LOG2_SIZEOF_INT 2<br>
&gt; -#define ARCH_LOG2_SIZEOF_LONG 2<br>
&gt; -#define ARCH_LOG2_SIZEOF_LONG_LONG 3<br>
&gt; -#define ARCH_SIZEOF_GX_COLOR_INDEX 8<br>
&gt; -#define ARCH_SIZEOF_PTR 4<br>
&gt; -#define ARCH_SIZEOF_FLOAT 4<br>
&gt; -#define ARCH_SIZEOF_DOUBLE 8<br>
&gt; -#define ARCH_FLOAT_MANTISSA_BITS 24<br>
&gt; -#define ARCH_DOUBLE_MANTISSA_BITS 53<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Unsigned max values -------=
--------- */<br>
&gt; -<br>
&gt; -#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)<br>
&gt; -#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)=
<br>
&gt; -#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)<br>
&gt; -#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Miscellaneous -------------=
--- */<br>
&gt; -<br>
&gt; -#define ARCH_IS_BIG_ENDIAN 1<br>
&gt; -#define ARCH_PTRS_ARE_SIGNED 0<br>
&gt; -#define ARCH_FLOATS_ARE_IEEE 1<br>
&gt; -#define ARCH_ARITH_RSHIFT 2<br>
&gt; -#define ARCH_DIV_NEG_POS_TRUNCATES 1<br>
&gt; diff --git a/meta/recipes-extended/ghostscript/ghostscript/microblaze=
el/objarch.h b/meta/recipes-extended/ghostscript/ghostscript/microblazeel/o=
bjarch.h<br>
&gt; deleted file mode 100644<br>
&gt; index 3ec8101681..0000000000<br>
&gt; --- a/meta/recipes-extended/ghostscript/ghostscript/microblazeel/obja=
rch.h<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,40 +0,0 @@<br>
&gt; -/* Parameters derived from machine and compiler architecture. */<br>
&gt; -/* This file is generated mechanically by genarch.c. */<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Scalar alignments ---------=
------- */<br>
&gt; -<br>
&gt; -#define ARCH_ALIGN_SHORT_MOD 2<br>
&gt; -#define ARCH_ALIGN_INT_MOD 4<br>
&gt; -#define ARCH_ALIGN_LONG_MOD 4<br>
&gt; -#define ARCH_ALIGN_PTR_MOD 4<br>
&gt; -#define ARCH_ALIGN_FLOAT_MOD 4<br>
&gt; -#define ARCH_ALIGN_DOUBLE_MOD 4<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Scalar sizes --------------=
-- */<br>
&gt; -<br>
&gt; -#define ARCH_LOG2_SIZEOF_CHAR 0<br>
&gt; -#define ARCH_LOG2_SIZEOF_SHORT 1<br>
&gt; -#define ARCH_LOG2_SIZEOF_INT 2<br>
&gt; -#define ARCH_LOG2_SIZEOF_LONG 2<br>
&gt; -#define ARCH_LOG2_SIZEOF_LONG_LONG 3<br>
&gt; -#define ARCH_SIZEOF_GX_COLOR_INDEX 8<br>
&gt; -#define ARCH_SIZEOF_PTR 4<br>
&gt; -#define ARCH_SIZEOF_FLOAT 4<br>
&gt; -#define ARCH_SIZEOF_DOUBLE 8<br>
&gt; -#define ARCH_FLOAT_MANTISSA_BITS 24<br>
&gt; -#define ARCH_DOUBLE_MANTISSA_BITS 53<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Unsigned max values -------=
--------- */<br>
&gt; -<br>
&gt; -#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)<br>
&gt; -#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)=
<br>
&gt; -#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)<br>
&gt; -#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Miscellaneous -------------=
--- */<br>
&gt; -<br>
&gt; -#define ARCH_IS_BIG_ENDIAN 0<br>
&gt; -#define ARCH_PTRS_ARE_SIGNED 0<br>
&gt; -#define ARCH_FLOATS_ARE_IEEE 1<br>
&gt; -#define ARCH_ARITH_RSHIFT 2<br>
&gt; -#define ARCH_DIV_NEG_POS_TRUNCATES 1<br>
&gt; diff --git a/meta/recipes-extended/ghostscript/ghostscript/mipsarchn3=
2eb/objarch.h b/meta/recipes-extended/ghostscript/ghostscript/mipsarchn32eb=
/objarch.h<br>
&gt; deleted file mode 100644<br>
&gt; index 0d0a16bfa3..0000000000<br>
&gt; --- a/meta/recipes-extended/ghostscript/ghostscript/mipsarchn32eb/obj=
arch.h<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,40 +0,0 @@<br>
&gt; -/* Parameters derived from machine and compiler architecture. */<br>
&gt; -/* This file is generated mechanically by genarch.c. */<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Scalar alignments ---------=
------- */<br>
&gt; -<br>
&gt; -#define ARCH_ALIGN_SHORT_MOD 2<br>
&gt; -#define ARCH_ALIGN_INT_MOD 4<br>
&gt; -#define ARCH_ALIGN_LONG_MOD 8<br>
&gt; -#define ARCH_ALIGN_PTR_MOD 8<br>
&gt; -#define ARCH_ALIGN_FLOAT_MOD 4<br>
&gt; -#define ARCH_ALIGN_DOUBLE_MOD 8<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Scalar sizes --------------=
-- */<br>
&gt; -<br>
&gt; -#define ARCH_LOG2_SIZEOF_CHAR 0<br>
&gt; -#define ARCH_LOG2_SIZEOF_SHORT 1<br>
&gt; -#define ARCH_LOG2_SIZEOF_INT 2<br>
&gt; -#define ARCH_LOG2_SIZEOF_LONG 3<br>
&gt; -#define ARCH_LOG2_SIZEOF_LONG_LONG 3<br>
&gt; -#define ARCH_SIZEOF_GX_COLOR_INDEX 8<br>
&gt; -#define ARCH_SIZEOF_PTR 8<br>
&gt; -#define ARCH_SIZEOF_FLOAT 4<br>
&gt; -#define ARCH_SIZEOF_DOUBLE 8<br>
&gt; -#define ARCH_FLOAT_MANTISSA_BITS 24<br>
&gt; -#define ARCH_DOUBLE_MANTISSA_BITS 53<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Unsigned max values -------=
--------- */<br>
&gt; -<br>
&gt; -#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)<br>
&gt; -#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)=
<br>
&gt; -#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)<br>
&gt; -#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Miscellaneous -------------=
--- */<br>
&gt; -<br>
&gt; -#define ARCH_IS_BIG_ENDIAN 1<br>
&gt; -#define ARCH_PTRS_ARE_SIGNED 0<br>
&gt; -#define ARCH_FLOATS_ARE_IEEE 1<br>
&gt; -#define ARCH_ARITH_RSHIFT 2<br>
&gt; -#define ARCH_DIV_NEG_POS_TRUNCATES 1<br>
&gt; diff --git a/meta/recipes-extended/ghostscript/ghostscript/mipsarchn3=
2el/objarch.h b/meta/recipes-extended/ghostscript/ghostscript/mipsarchn32el=
/objarch.h<br>
&gt; deleted file mode 100644<br>
&gt; index a05de29def..0000000000<br>
&gt; --- a/meta/recipes-extended/ghostscript/ghostscript/mipsarchn32el/obj=
arch.h<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,40 +0,0 @@<br>
&gt; -/* Parameters derived from machine and compiler architecture. */<br>
&gt; -/* This file is generated mechanically by genarch.c. */<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Scalar alignments ---------=
------- */<br>
&gt; -<br>
&gt; -#define ARCH_ALIGN_SHORT_MOD 2<br>
&gt; -#define ARCH_ALIGN_INT_MOD 4<br>
&gt; -#define ARCH_ALIGN_LONG_MOD 8<br>
&gt; -#define ARCH_ALIGN_PTR_MOD 8<br>
&gt; -#define ARCH_ALIGN_FLOAT_MOD 4<br>
&gt; -#define ARCH_ALIGN_DOUBLE_MOD 8<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Scalar sizes --------------=
-- */<br>
&gt; -<br>
&gt; -#define ARCH_LOG2_SIZEOF_CHAR 0<br>
&gt; -#define ARCH_LOG2_SIZEOF_SHORT 1<br>
&gt; -#define ARCH_LOG2_SIZEOF_INT 2<br>
&gt; -#define ARCH_LOG2_SIZEOF_LONG 3<br>
&gt; -#define ARCH_LOG2_SIZEOF_LONG_LONG 3<br>
&gt; -#define ARCH_SIZEOF_GX_COLOR_INDEX 8<br>
&gt; -#define ARCH_SIZEOF_PTR 8<br>
&gt; -#define ARCH_SIZEOF_FLOAT 4<br>
&gt; -#define ARCH_SIZEOF_DOUBLE 8<br>
&gt; -#define ARCH_FLOAT_MANTISSA_BITS 24<br>
&gt; -#define ARCH_DOUBLE_MANTISSA_BITS 53<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Unsigned max values -------=
--------- */<br>
&gt; -<br>
&gt; -#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)<br>
&gt; -#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)=
<br>
&gt; -#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)<br>
&gt; -#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Miscellaneous -------------=
--- */<br>
&gt; -<br>
&gt; -#define ARCH_IS_BIG_ENDIAN 0<br>
&gt; -#define ARCH_PTRS_ARE_SIGNED 0<br>
&gt; -#define ARCH_FLOATS_ARE_IEEE 1<br>
&gt; -#define ARCH_ARITH_RSHIFT 2<br>
&gt; -#define ARCH_DIV_NEG_POS_TRUNCATES 1<br>
&gt; diff --git a/meta/recipes-extended/ghostscript/ghostscript/mipsarchn6=
4eb/objarch.h b/meta/recipes-extended/ghostscript/ghostscript/mipsarchn64eb=
/objarch.h<br>
&gt; deleted file mode 100644<br>
&gt; index 0d0a16bfa3..0000000000<br>
&gt; --- a/meta/recipes-extended/ghostscript/ghostscript/mipsarchn64eb/obj=
arch.h<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,40 +0,0 @@<br>
&gt; -/* Parameters derived from machine and compiler architecture. */<br>
&gt; -/* This file is generated mechanically by genarch.c. */<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Scalar alignments ---------=
------- */<br>
&gt; -<br>
&gt; -#define ARCH_ALIGN_SHORT_MOD 2<br>
&gt; -#define ARCH_ALIGN_INT_MOD 4<br>
&gt; -#define ARCH_ALIGN_LONG_MOD 8<br>
&gt; -#define ARCH_ALIGN_PTR_MOD 8<br>
&gt; -#define ARCH_ALIGN_FLOAT_MOD 4<br>
&gt; -#define ARCH_ALIGN_DOUBLE_MOD 8<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Scalar sizes --------------=
-- */<br>
&gt; -<br>
&gt; -#define ARCH_LOG2_SIZEOF_CHAR 0<br>
&gt; -#define ARCH_LOG2_SIZEOF_SHORT 1<br>
&gt; -#define ARCH_LOG2_SIZEOF_INT 2<br>
&gt; -#define ARCH_LOG2_SIZEOF_LONG 3<br>
&gt; -#define ARCH_LOG2_SIZEOF_LONG_LONG 3<br>
&gt; -#define ARCH_SIZEOF_GX_COLOR_INDEX 8<br>
&gt; -#define ARCH_SIZEOF_PTR 8<br>
&gt; -#define ARCH_SIZEOF_FLOAT 4<br>
&gt; -#define ARCH_SIZEOF_DOUBLE 8<br>
&gt; -#define ARCH_FLOAT_MANTISSA_BITS 24<br>
&gt; -#define ARCH_DOUBLE_MANTISSA_BITS 53<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Unsigned max values -------=
--------- */<br>
&gt; -<br>
&gt; -#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)<br>
&gt; -#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)=
<br>
&gt; -#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)<br>
&gt; -#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Miscellaneous -------------=
--- */<br>
&gt; -<br>
&gt; -#define ARCH_IS_BIG_ENDIAN 1<br>
&gt; -#define ARCH_PTRS_ARE_SIGNED 0<br>
&gt; -#define ARCH_FLOATS_ARE_IEEE 1<br>
&gt; -#define ARCH_ARITH_RSHIFT 2<br>
&gt; -#define ARCH_DIV_NEG_POS_TRUNCATES 1<br>
&gt; diff --git a/meta/recipes-extended/ghostscript/ghostscript/mipsarchn6=
4el/objarch.h b/meta/recipes-extended/ghostscript/ghostscript/mipsarchn64el=
/objarch.h<br>
&gt; deleted file mode 100644<br>
&gt; index a05de29def..0000000000<br>
&gt; --- a/meta/recipes-extended/ghostscript/ghostscript/mipsarchn64el/obj=
arch.h<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,40 +0,0 @@<br>
&gt; -/* Parameters derived from machine and compiler architecture. */<br>
&gt; -/* This file is generated mechanically by genarch.c. */<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Scalar alignments ---------=
------- */<br>
&gt; -<br>
&gt; -#define ARCH_ALIGN_SHORT_MOD 2<br>
&gt; -#define ARCH_ALIGN_INT_MOD 4<br>
&gt; -#define ARCH_ALIGN_LONG_MOD 8<br>
&gt; -#define ARCH_ALIGN_PTR_MOD 8<br>
&gt; -#define ARCH_ALIGN_FLOAT_MOD 4<br>
&gt; -#define ARCH_ALIGN_DOUBLE_MOD 8<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Scalar sizes --------------=
-- */<br>
&gt; -<br>
&gt; -#define ARCH_LOG2_SIZEOF_CHAR 0<br>
&gt; -#define ARCH_LOG2_SIZEOF_SHORT 1<br>
&gt; -#define ARCH_LOG2_SIZEOF_INT 2<br>
&gt; -#define ARCH_LOG2_SIZEOF_LONG 3<br>
&gt; -#define ARCH_LOG2_SIZEOF_LONG_LONG 3<br>
&gt; -#define ARCH_SIZEOF_GX_COLOR_INDEX 8<br>
&gt; -#define ARCH_SIZEOF_PTR 8<br>
&gt; -#define ARCH_SIZEOF_FLOAT 4<br>
&gt; -#define ARCH_SIZEOF_DOUBLE 8<br>
&gt; -#define ARCH_FLOAT_MANTISSA_BITS 24<br>
&gt; -#define ARCH_DOUBLE_MANTISSA_BITS 53<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Unsigned max values -------=
--------- */<br>
&gt; -<br>
&gt; -#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)<br>
&gt; -#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)=
<br>
&gt; -#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)<br>
&gt; -#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Miscellaneous -------------=
--- */<br>
&gt; -<br>
&gt; -#define ARCH_IS_BIG_ENDIAN 0<br>
&gt; -#define ARCH_PTRS_ARE_SIGNED 0<br>
&gt; -#define ARCH_FLOATS_ARE_IEEE 1<br>
&gt; -#define ARCH_ARITH_RSHIFT 2<br>
&gt; -#define ARCH_DIV_NEG_POS_TRUNCATES 1<br>
&gt; diff --git a/meta/recipes-extended/ghostscript/ghostscript/mipsarcho3=
2eb/objarch.h b/meta/recipes-extended/ghostscript/ghostscript/mipsarcho32eb=
/objarch.h<br>
&gt; deleted file mode 100644<br>
&gt; index b8b637cca2..0000000000<br>
&gt; --- a/meta/recipes-extended/ghostscript/ghostscript/mipsarcho32eb/obj=
arch.h<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,40 +0,0 @@<br>
&gt; -/* Parameters derived from machine and compiler architecture. */<br>
&gt; -/* This file is generated mechanically by genarch.c. */<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Scalar alignments ---------=
------- */<br>
&gt; -<br>
&gt; -#define ARCH_ALIGN_SHORT_MOD 2<br>
&gt; -#define ARCH_ALIGN_INT_MOD 4<br>
&gt; -#define ARCH_ALIGN_LONG_MOD 4<br>
&gt; -#define ARCH_ALIGN_PTR_MOD 4<br>
&gt; -#define ARCH_ALIGN_FLOAT_MOD 4<br>
&gt; -#define ARCH_ALIGN_DOUBLE_MOD 8<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Scalar sizes --------------=
-- */<br>
&gt; -<br>
&gt; -#define ARCH_LOG2_SIZEOF_CHAR 0<br>
&gt; -#define ARCH_LOG2_SIZEOF_SHORT 1<br>
&gt; -#define ARCH_LOG2_SIZEOF_INT 2<br>
&gt; -#define ARCH_LOG2_SIZEOF_LONG 2<br>
&gt; -#define ARCH_LOG2_SIZEOF_LONG_LONG 3<br>
&gt; -#define ARCH_SIZEOF_GX_COLOR_INDEX 4<br>
&gt; -#define ARCH_SIZEOF_PTR 4<br>
&gt; -#define ARCH_SIZEOF_FLOAT 4<br>
&gt; -#define ARCH_SIZEOF_DOUBLE 8<br>
&gt; -#define ARCH_FLOAT_MANTISSA_BITS 24<br>
&gt; -#define ARCH_DOUBLE_MANTISSA_BITS 53<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Unsigned max values -------=
--------- */<br>
&gt; -<br>
&gt; -#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)<br>
&gt; -#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)=
<br>
&gt; -#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)<br>
&gt; -#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Miscellaneous -------------=
--- */<br>
&gt; -<br>
&gt; -#define ARCH_IS_BIG_ENDIAN 1<br>
&gt; -#define ARCH_PTRS_ARE_SIGNED 0<br>
&gt; -#define ARCH_FLOATS_ARE_IEEE 1<br>
&gt; -#define ARCH_ARITH_RSHIFT 2<br>
&gt; -#define ARCH_DIV_NEG_POS_TRUNCATES 1<br>
&gt; diff --git a/meta/recipes-extended/ghostscript/ghostscript/mipsarcho3=
2el/objarch.h b/meta/recipes-extended/ghostscript/ghostscript/mipsarcho32el=
/objarch.h<br>
&gt; deleted file mode 100644<br>
&gt; index 29f90ddf85..0000000000<br>
&gt; --- a/meta/recipes-extended/ghostscript/ghostscript/mipsarcho32el/obj=
arch.h<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,40 +0,0 @@<br>
&gt; -/* Parameters derived from machine and compiler architecture. */<br>
&gt; -/* This file is generated mechanically by genarch.c. */<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Scalar alignments ---------=
------- */<br>
&gt; -<br>
&gt; -#define ARCH_ALIGN_SHORT_MOD 2<br>
&gt; -#define ARCH_ALIGN_INT_MOD 4<br>
&gt; -#define ARCH_ALIGN_LONG_MOD 4<br>
&gt; -#define ARCH_ALIGN_PTR_MOD 4<br>
&gt; -#define ARCH_ALIGN_FLOAT_MOD 4<br>
&gt; -#define ARCH_ALIGN_DOUBLE_MOD 8<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Scalar sizes --------------=
-- */<br>
&gt; -<br>
&gt; -#define ARCH_LOG2_SIZEOF_CHAR 0<br>
&gt; -#define ARCH_LOG2_SIZEOF_SHORT 1<br>
&gt; -#define ARCH_LOG2_SIZEOF_INT 2<br>
&gt; -#define ARCH_LOG2_SIZEOF_LONG 2<br>
&gt; -#define ARCH_LOG2_SIZEOF_LONG_LONG 3<br>
&gt; -#define ARCH_SIZEOF_GX_COLOR_INDEX 4<br>
&gt; -#define ARCH_SIZEOF_PTR 4<br>
&gt; -#define ARCH_SIZEOF_FLOAT 4<br>
&gt; -#define ARCH_SIZEOF_DOUBLE 8<br>
&gt; -#define ARCH_FLOAT_MANTISSA_BITS 24<br>
&gt; -#define ARCH_DOUBLE_MANTISSA_BITS 53<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Unsigned max values -------=
--------- */<br>
&gt; -<br>
&gt; -#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)<br>
&gt; -#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)=
<br>
&gt; -#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)<br>
&gt; -#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Miscellaneous -------------=
--- */<br>
&gt; -<br>
&gt; -#define ARCH_IS_BIG_ENDIAN 0<br>
&gt; -#define ARCH_PTRS_ARE_SIGNED 0<br>
&gt; -#define ARCH_FLOATS_ARE_IEEE 1<br>
&gt; -#define ARCH_ARITH_RSHIFT 2<br>
&gt; -#define ARCH_DIV_NEG_POS_TRUNCATES 1<br>
&gt; diff --git a/meta/recipes-extended/ghostscript/ghostscript/nios2/obja=
rch.h b/meta/recipes-extended/ghostscript/ghostscript/nios2/objarch.h<br>
&gt; deleted file mode 100644<br>
&gt; index 3ec8101681..0000000000<br>
&gt; --- a/meta/recipes-extended/ghostscript/ghostscript/nios2/objarch.h<b=
r>
&gt; +++ /dev/null<br>
&gt; @@ -1,40 +0,0 @@<br>
&gt; -/* Parameters derived from machine and compiler architecture. */<br>
&gt; -/* This file is generated mechanically by genarch.c. */<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Scalar alignments ---------=
------- */<br>
&gt; -<br>
&gt; -#define ARCH_ALIGN_SHORT_MOD 2<br>
&gt; -#define ARCH_ALIGN_INT_MOD 4<br>
&gt; -#define ARCH_ALIGN_LONG_MOD 4<br>
&gt; -#define ARCH_ALIGN_PTR_MOD 4<br>
&gt; -#define ARCH_ALIGN_FLOAT_MOD 4<br>
&gt; -#define ARCH_ALIGN_DOUBLE_MOD 4<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Scalar sizes --------------=
-- */<br>
&gt; -<br>
&gt; -#define ARCH_LOG2_SIZEOF_CHAR 0<br>
&gt; -#define ARCH_LOG2_SIZEOF_SHORT 1<br>
&gt; -#define ARCH_LOG2_SIZEOF_INT 2<br>
&gt; -#define ARCH_LOG2_SIZEOF_LONG 2<br>
&gt; -#define ARCH_LOG2_SIZEOF_LONG_LONG 3<br>
&gt; -#define ARCH_SIZEOF_GX_COLOR_INDEX 8<br>
&gt; -#define ARCH_SIZEOF_PTR 4<br>
&gt; -#define ARCH_SIZEOF_FLOAT 4<br>
&gt; -#define ARCH_SIZEOF_DOUBLE 8<br>
&gt; -#define ARCH_FLOAT_MANTISSA_BITS 24<br>
&gt; -#define ARCH_DOUBLE_MANTISSA_BITS 53<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Unsigned max values -------=
--------- */<br>
&gt; -<br>
&gt; -#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)<br>
&gt; -#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)=
<br>
&gt; -#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)<br>
&gt; -#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Miscellaneous -------------=
--- */<br>
&gt; -<br>
&gt; -#define ARCH_IS_BIG_ENDIAN 0<br>
&gt; -#define ARCH_PTRS_ARE_SIGNED 0<br>
&gt; -#define ARCH_FLOATS_ARE_IEEE 1<br>
&gt; -#define ARCH_ARITH_RSHIFT 2<br>
&gt; -#define ARCH_DIV_NEG_POS_TRUNCATES 1<br>
&gt; diff --git a/meta/recipes-extended/ghostscript/ghostscript/powerpc/ob=
jarch.h b/meta/recipes-extended/ghostscript/ghostscript/powerpc/objarch.h<b=
r>
&gt; deleted file mode 100644<br>
&gt; index 359097f356..0000000000<br>
&gt; --- a/meta/recipes-extended/ghostscript/ghostscript/powerpc/objarch.h=
<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,40 +0,0 @@<br>
&gt; -/* Parameters derived from machine and compiler architecture. */<br>
&gt; -/* This file is generated mechanically by genarch.c. */<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Scalar alignments ---------=
------- */<br>
&gt; -<br>
&gt; -#define ARCH_ALIGN_SHORT_MOD 2<br>
&gt; -#define ARCH_ALIGN_INT_MOD 4<br>
&gt; -#define ARCH_ALIGN_LONG_MOD 4<br>
&gt; -#define ARCH_ALIGN_PTR_MOD 4<br>
&gt; -#define ARCH_ALIGN_FLOAT_MOD 4<br>
&gt; -#define ARCH_ALIGN_DOUBLE_MOD 8<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Scalar sizes --------------=
-- */<br>
&gt; -<br>
&gt; -#define ARCH_LOG2_SIZEOF_CHAR 0<br>
&gt; -#define ARCH_LOG2_SIZEOF_SHORT 1<br>
&gt; -#define ARCH_LOG2_SIZEOF_INT 2<br>
&gt; -#define ARCH_LOG2_SIZEOF_LONG 2<br>
&gt; -#define ARCH_LOG2_SIZEOF_LONG_LONG 3<br>
&gt; -#define ARCH_SIZEOF_GX_COLOR_INDEX 8<br>
&gt; -#define ARCH_SIZEOF_PTR 4<br>
&gt; -#define ARCH_SIZEOF_FLOAT 4<br>
&gt; -#define ARCH_SIZEOF_DOUBLE 8<br>
&gt; -#define ARCH_FLOAT_MANTISSA_BITS 24<br>
&gt; -#define ARCH_DOUBLE_MANTISSA_BITS 53<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Unsigned max values -------=
--------- */<br>
&gt; -<br>
&gt; -#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)<br>
&gt; -#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)=
<br>
&gt; -#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)<br>
&gt; -#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Miscellaneous -------------=
--- */<br>
&gt; -<br>
&gt; -#define ARCH_IS_BIG_ENDIAN 1<br>
&gt; -#define ARCH_PTRS_ARE_SIGNED 0<br>
&gt; -#define ARCH_FLOATS_ARE_IEEE 1<br>
&gt; -#define ARCH_ARITH_RSHIFT 2<br>
&gt; -#define ARCH_DIV_NEG_POS_TRUNCATES 1<br>
&gt; diff --git a/meta/recipes-extended/ghostscript/ghostscript/powerpc64/=
objarch.h b/meta/recipes-extended/ghostscript/ghostscript/powerpc64/objarch=
.h<br>
&gt; deleted file mode 100644<br>
&gt; index 0d0a16bfa3..0000000000<br>
&gt; --- a/meta/recipes-extended/ghostscript/ghostscript/powerpc64/objarch=
.h<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,40 +0,0 @@<br>
&gt; -/* Parameters derived from machine and compiler architecture. */<br>
&gt; -/* This file is generated mechanically by genarch.c. */<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Scalar alignments ---------=
------- */<br>
&gt; -<br>
&gt; -#define ARCH_ALIGN_SHORT_MOD 2<br>
&gt; -#define ARCH_ALIGN_INT_MOD 4<br>
&gt; -#define ARCH_ALIGN_LONG_MOD 8<br>
&gt; -#define ARCH_ALIGN_PTR_MOD 8<br>
&gt; -#define ARCH_ALIGN_FLOAT_MOD 4<br>
&gt; -#define ARCH_ALIGN_DOUBLE_MOD 8<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Scalar sizes --------------=
-- */<br>
&gt; -<br>
&gt; -#define ARCH_LOG2_SIZEOF_CHAR 0<br>
&gt; -#define ARCH_LOG2_SIZEOF_SHORT 1<br>
&gt; -#define ARCH_LOG2_SIZEOF_INT 2<br>
&gt; -#define ARCH_LOG2_SIZEOF_LONG 3<br>
&gt; -#define ARCH_LOG2_SIZEOF_LONG_LONG 3<br>
&gt; -#define ARCH_SIZEOF_GX_COLOR_INDEX 8<br>
&gt; -#define ARCH_SIZEOF_PTR 8<br>
&gt; -#define ARCH_SIZEOF_FLOAT 4<br>
&gt; -#define ARCH_SIZEOF_DOUBLE 8<br>
&gt; -#define ARCH_FLOAT_MANTISSA_BITS 24<br>
&gt; -#define ARCH_DOUBLE_MANTISSA_BITS 53<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Unsigned max values -------=
--------- */<br>
&gt; -<br>
&gt; -#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)<br>
&gt; -#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)=
<br>
&gt; -#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)<br>
&gt; -#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Miscellaneous -------------=
--- */<br>
&gt; -<br>
&gt; -#define ARCH_IS_BIG_ENDIAN 1<br>
&gt; -#define ARCH_PTRS_ARE_SIGNED 0<br>
&gt; -#define ARCH_FLOATS_ARE_IEEE 1<br>
&gt; -#define ARCH_ARITH_RSHIFT 2<br>
&gt; -#define ARCH_DIV_NEG_POS_TRUNCATES 1<br>
&gt; diff --git a/meta/recipes-extended/ghostscript/ghostscript/powerpc64l=
e/objarch.h b/meta/recipes-extended/ghostscript/ghostscript/powerpc64le/obj=
arch.h<br>
&gt; deleted file mode 100644<br>
&gt; index a05de29def..0000000000<br>
&gt; --- a/meta/recipes-extended/ghostscript/ghostscript/powerpc64le/objar=
ch.h<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,40 +0,0 @@<br>
&gt; -/* Parameters derived from machine and compiler architecture. */<br>
&gt; -/* This file is generated mechanically by genarch.c. */<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Scalar alignments ---------=
------- */<br>
&gt; -<br>
&gt; -#define ARCH_ALIGN_SHORT_MOD 2<br>
&gt; -#define ARCH_ALIGN_INT_MOD 4<br>
&gt; -#define ARCH_ALIGN_LONG_MOD 8<br>
&gt; -#define ARCH_ALIGN_PTR_MOD 8<br>
&gt; -#define ARCH_ALIGN_FLOAT_MOD 4<br>
&gt; -#define ARCH_ALIGN_DOUBLE_MOD 8<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Scalar sizes --------------=
-- */<br>
&gt; -<br>
&gt; -#define ARCH_LOG2_SIZEOF_CHAR 0<br>
&gt; -#define ARCH_LOG2_SIZEOF_SHORT 1<br>
&gt; -#define ARCH_LOG2_SIZEOF_INT 2<br>
&gt; -#define ARCH_LOG2_SIZEOF_LONG 3<br>
&gt; -#define ARCH_LOG2_SIZEOF_LONG_LONG 3<br>
&gt; -#define ARCH_SIZEOF_GX_COLOR_INDEX 8<br>
&gt; -#define ARCH_SIZEOF_PTR 8<br>
&gt; -#define ARCH_SIZEOF_FLOAT 4<br>
&gt; -#define ARCH_SIZEOF_DOUBLE 8<br>
&gt; -#define ARCH_FLOAT_MANTISSA_BITS 24<br>
&gt; -#define ARCH_DOUBLE_MANTISSA_BITS 53<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Unsigned max values -------=
--------- */<br>
&gt; -<br>
&gt; -#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)<br>
&gt; -#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)=
<br>
&gt; -#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)<br>
&gt; -#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Miscellaneous -------------=
--- */<br>
&gt; -<br>
&gt; -#define ARCH_IS_BIG_ENDIAN 0<br>
&gt; -#define ARCH_PTRS_ARE_SIGNED 0<br>
&gt; -#define ARCH_FLOATS_ARE_IEEE 1<br>
&gt; -#define ARCH_ARITH_RSHIFT 2<br>
&gt; -#define ARCH_DIV_NEG_POS_TRUNCATES 1<br>
&gt; diff --git a/meta/recipes-extended/ghostscript/ghostscript/x86-64/obj=
arch.h b/meta/recipes-extended/ghostscript/ghostscript/x86-64/objarch.h<br>
&gt; deleted file mode 100644<br>
&gt; index a05de29def..0000000000<br>
&gt; --- a/meta/recipes-extended/ghostscript/ghostscript/x86-64/objarch.h<=
br>
&gt; +++ /dev/null<br>
&gt; @@ -1,40 +0,0 @@<br>
&gt; -/* Parameters derived from machine and compiler architecture. */<br>
&gt; -/* This file is generated mechanically by genarch.c. */<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Scalar alignments ---------=
------- */<br>
&gt; -<br>
&gt; -#define ARCH_ALIGN_SHORT_MOD 2<br>
&gt; -#define ARCH_ALIGN_INT_MOD 4<br>
&gt; -#define ARCH_ALIGN_LONG_MOD 8<br>
&gt; -#define ARCH_ALIGN_PTR_MOD 8<br>
&gt; -#define ARCH_ALIGN_FLOAT_MOD 4<br>
&gt; -#define ARCH_ALIGN_DOUBLE_MOD 8<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Scalar sizes --------------=
-- */<br>
&gt; -<br>
&gt; -#define ARCH_LOG2_SIZEOF_CHAR 0<br>
&gt; -#define ARCH_LOG2_SIZEOF_SHORT 1<br>
&gt; -#define ARCH_LOG2_SIZEOF_INT 2<br>
&gt; -#define ARCH_LOG2_SIZEOF_LONG 3<br>
&gt; -#define ARCH_LOG2_SIZEOF_LONG_LONG 3<br>
&gt; -#define ARCH_SIZEOF_GX_COLOR_INDEX 8<br>
&gt; -#define ARCH_SIZEOF_PTR 8<br>
&gt; -#define ARCH_SIZEOF_FLOAT 4<br>
&gt; -#define ARCH_SIZEOF_DOUBLE 8<br>
&gt; -#define ARCH_FLOAT_MANTISSA_BITS 24<br>
&gt; -#define ARCH_DOUBLE_MANTISSA_BITS 53<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Unsigned max values -------=
--------- */<br>
&gt; -<br>
&gt; -#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)<br>
&gt; -#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)=
<br>
&gt; -#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)<br>
&gt; -#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* ---------------- Miscellaneous -------------=
--- */<br>
&gt; -<br>
&gt; -#define ARCH_IS_BIG_ENDIAN 0<br>
&gt; -#define ARCH_PTRS_ARE_SIGNED 0<br>
&gt; -#define ARCH_FLOATS_ARE_IEEE 1<br>
&gt; -#define ARCH_ARITH_RSHIFT 2<br>
&gt; -#define ARCH_DIV_NEG_POS_TRUNCATES 1<br>
&gt; diff --git a/meta/recipes-extended/ghostscript/<a href=3D"http://ghos=
tscript_9.50.bb" rel=3D"noreferrer" target=3D"_blank">ghostscript_9.50.bb</=
a> b/meta/recipes-extended/ghostscript/<a href=3D"http://ghostscript_9.52.b=
b" rel=3D"noreferrer" target=3D"_blank">ghostscript_9.52.bb</a><br>
&gt; similarity index 89%<br>
&gt; rename from meta/recipes-extended/ghostscript/<a href=3D"http://ghost=
script_9.50.bb" rel=3D"noreferrer" target=3D"_blank">ghostscript_9.50.bb</a=
><br>
&gt; rename to meta/recipes-extended/ghostscript/<a href=3D"http://ghostsc=
ript_9.52.bb" rel=3D"noreferrer" target=3D"_blank">ghostscript_9.52.bb</a><=
br>
&gt; index 5e8af8dc11..4cdb6e00d8 100644<br>
&gt; --- a/meta/recipes-extended/ghostscript/<a href=3D"http://ghostscript=
_9.50.bb" rel=3D"noreferrer" target=3D"_blank">ghostscript_9.50.bb</a><br>
&gt; +++ b/meta/recipes-extended/ghostscript/<a href=3D"http://ghostscript=
_9.52.bb" rel=3D"noreferrer" target=3D"_blank">ghostscript_9.52.bb</a><br>
&gt; @@ -29,13 +29,10 @@ SRC_URI_BASE =3D &quot;<a href=3D"https://github.=
com/ArtifexSoftware/ghostpdl-downloads/releases/d" rel=3D"noreferrer" targe=
t=3D"_blank">https://github.com/ArtifexSoftware/ghostpdl-downloads/releases=
/d</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f=
ile://do-not-check-local-libpng-source.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f=
ile://avoid-host-contamination.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f=
ile://mkdir-p.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2=
019-14869-0001.patch \<br>
&gt;=C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0SRC_URI =3D &quot;${SRC_URI_BASE} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://ghostscript-9.=
21-prevent_recompiling.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://ghostscript-9.02-gen=
arch.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://objarch.h \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://cups-no-gcrypt=
.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -44,8 +41,8 @@ SRC_URI_class-native =3D &quot;${SRC_URI_BASE} \<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0file://base-genht.c-add-a-preprocessor-define-t=
o-allow-fope.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -SRC_URI[md5sum] =3D &quot;00970cf622bd5b46f68eec9383753870&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;0f53e89fd647815828fc5171613e860e8535b68=
f7afbc91bf89aee886769ce89&quot;<br>
&gt; +SRC_URI[md5sum] =3D &quot;0f6964ab9b83a63b7e373f136243f901&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;c2501d8e8e0814c4a5aa7e443e230e73d7af7f7=
0287546f7b697e5ef49e32176&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0# Put something like<br>
&gt;=C2=A0 =C2=A0#<br>
&gt; @@ -76,7 +73,7 @@ EXTRA_OECONF_class-native =3D &quot;--without-x --w=
ith-system-libtiff=3Dno \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --without-jbig2dec --without-lib=
paper \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-fontpath=3D${datadir}/fon=
ts \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --without-libidn --disable-fontc=
onfig \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-freetype --disable-cups&qu=
ot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-freetype --disable-cups &qu=
ot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0# This has been fixed upstream but for now we need to sub=
vert the check for time.h<br>
&gt;=C2=A0 =C2=A0# <a href=3D"http://bugs.ghostscript.com/show_bug.cgi?id=
=3D692443" rel=3D"noreferrer" target=3D"_blank">http://bugs.ghostscript.co=
m/show_bug.cgi?id=3D692443</a><br>
&gt; @@ -84,15 +81,7 @@ EXTRA_OECONF_class-native =3D &quot;--without-x --=
with-system-libtiff=3Dno \<br>
&gt;=C2=A0 =C2=A0CFLAGS +=3D &quot;-DHAVE_SYS_TIME_H=3D1&quot;<br>
&gt;=C2=A0 =C2=A0BUILD_CFLAGS +=3D &quot;-DHAVE_SYS_TIME_H=3D1&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -inherit autotools<br>
&gt; -<br>
&gt; -do_configure_prepend () {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0mkdir -p obj<br>
&gt; -=C2=A0 =C2=A0 =C2=A0mkdir -p soobj<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if [ -e ${WORKDIR}/objarch.h ]; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp ${WORKDIR}/objarc=
h.h obj/arch.h<br>
&gt; -=C2=A0 =C2=A0 =C2=A0fi<br>
&gt; -}<br>
&gt; +inherit autotools-brokensep<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0do_configure_append () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# copy tools from the native ghostscript bu=
ild<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
</blockquote></div></div>

--00000000000090be2005a485073d--
