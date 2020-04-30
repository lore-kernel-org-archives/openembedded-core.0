Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web12.1161.1588268154650029078
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 10:35:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sUMzaY6V;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id x12so5691128qts.9
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 10:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gdnuEi24cfkgpZwX/lj73IBLUVG0vS4pM1S57uccNOE=;
        b=sUMzaY6VjRdcFviQp7YGrT+2MZLk84wFNH3pfqfnQeUfTYr5mN627w1WnQ3nOzMwg1
         9pi3ZvYImKWv8DcudwnCGWSXKSga45P5lfB7FBh3TI1xgVX1nKrcxAudVwtOGXu4D+xv
         Qnmf+vy+04SrBPcyNhlJh9gHI5upomhHEi0DG7bpf4X3bJrq3bm7ZXga1a4rbukDPtfc
         1YrJdppF9GKk25KXbHiLxf1fuzpdI6xfk/ViJZnifOs1ipWXZmu/Jf5Ahg85HEJDnrF4
         I1WR43UjAjK8Z8SUW5JG59Tg36bCiOC77LttjZdcMDVnSQQixRKYR/9YIfjvaM3Vy/pV
         IYjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gdnuEi24cfkgpZwX/lj73IBLUVG0vS4pM1S57uccNOE=;
        b=sRyy2lGdfMYj1waLmzsLwSuMaS+tfnky3YhzKoO9ZNZ967YcKTQKMLBTpN6jRHHl0B
         4uSDy7r04b9oGxi2LnfvrKUhDL2Tn6epuWkgZKIMDOZo+fmgCVQyCWcU3EyEyYQC+jcR
         GkGvO3EO0J3AGqdMvS+Wa+fXrulhN24CJK0yO9b1OlLoIZ5G2ib7Et7Jumjl3ZaBhatR
         lxKOFDoDzwE6ds2yRZYCbDD1jlWKsUgAlx1FG//QUXZuL0kQ1H3YUuFDwA5Y5RgZ7gHG
         +M+dtDXgMFt3V1QOulh5G0H2Z2fBwD42ctUOAGgYMzZagK0HxthO5bw9TW79ZdiMlYEN
         NH2w==
X-Gm-Message-State: AGi0PuYsHT995g8Y3YPV2kV1QkLqSuWsQJlTWrLbOwZ7A6EtEfIbi/eg
	i3D6e2T+lRHocoSnu8O3Y0u4WiM4Fm4=
X-Google-Smtp-Source: APiQypJIQx6jKa70bxOyv+4XAgF1V6nfQ7OtdygprD2vsnBsSsef2Oe+exEA2Ey/6vn+zlsBo6Fa5A==
X-Received: by 2002:ac8:1ad1:: with SMTP id h17mr4962527qtk.9.1588268152697;
        Thu, 30 Apr 2020 10:35:52 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:e02c:9432:3945:4d16? ([2601:646:9200:4e0:e02c:9432:3945:4d16])
        by smtp.gmail.com with ESMTPSA id k5sm509629qkj.53.2020.04.30.10.35.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2020 10:35:51 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 10/17] ghostscript: update 9.50 -> 9.52
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20200430095815.2824-1-alex.kanavin@gmail.com>
 <20200430095815.2824-10-alex.kanavin@gmail.com>
 <fcd6ba95-741e-e858-eb4f-20d757bd29db@gmail.com>
 <CANNYZj9RrB=jGX+Ba-XhtkNujpyjmZcnd-rHSFJJ5uzH=9vOUg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <0ccec988-9ef6-10b4-43b6-e546e2b132c5@gmail.com>
Date: Thu, 30 Apr 2020 10:35:50 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj9RrB=jGX+Ba-XhtkNujpyjmZcnd-rHSFJJ5uzH=9vOUg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 4/30/20 10:02 AM, Alexander Kanavin wrote:
> As far as I understand, yes:
> 
> http://git.ghostscript.com/?p=ghostpdl.git;a=blob;f=configure.ac;h=5a005ff16bc222f572695f569ce068a1153ed8b7;hb=HEAD#l3345
> 
> This seems to be cross-compiler safe to me: $host does not match $build 
> (which implies the block is meant for cross compile scenarios),
> and the macros are all determined via AC_CHECK_SIZEOF/AC_CHECK_ALIGNOF 
> which are cross compile safe.
> https://www.gnu.org/software/autoconf/manual/autoconf-2.67/html_node/Generic-Compiler-Characteristics.html
> 

OK, thats good to know. Perhaps worth comparing the headers its 
generating for something like arm or mips on a 64bit build host
and see if it matches with what cached headers had.

> Alex
> 
> 
> On Thu, 30 Apr 2020 at 17:48, Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>> wrote:
> 
>     they were generated in past too, but they were not cross compiler safe.
>     has that changed ?
> 
>      > Freetype can no longer be disabled.
>      >
>      > Building out of source tree is broken.
>      >
>      > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com
>     <mailto:alex.kanavin@gmail.com>>
>      > ---
>      >   .../do-not-check-local-libpng-source.patch    | 37 ++++------
>      >   .../ghostscript/CVE-2019-14869-0001.patch     | 70
>     -------------------
>      >   .../ghostscript/ghostscript/aarch64/objarch.h | 40 -----------
>      >   .../ghostscript/ghostscript/arm/objarch.h     | 40 -----------
>      >   .../ghostscript/ghostscript/armeb/objarch.h   | 40 -----------
>      >   .../ghostscript-9.02-genarch.patch            | 38 ----------
>      >   .../ghostscript/ghostscript/i586/objarch.h    | 41 -----------
>      >   .../ghostscript/microblaze/objarch.h          | 40 -----------
>      >   .../ghostscript/microblazeel/objarch.h        | 40 -----------
>      >   .../ghostscript/mipsarchn32eb/objarch.h       | 40 -----------
>      >   .../ghostscript/mipsarchn32el/objarch.h       | 40 -----------
>      >   .../ghostscript/mipsarchn64eb/objarch.h       | 40 -----------
>      >   .../ghostscript/mipsarchn64el/objarch.h       | 40 -----------
>      >   .../ghostscript/mipsarcho32eb/objarch.h       | 40 -----------
>      >   .../ghostscript/mipsarcho32el/objarch.h       | 40 -----------
>      >   .../ghostscript/ghostscript/nios2/objarch.h   | 40 -----------
>      >   .../ghostscript/ghostscript/powerpc/objarch.h | 40 -----------
>      >   .../ghostscript/powerpc64/objarch.h           | 40 -----------
>      >   .../ghostscript/powerpc64le/objarch.h         | 40 -----------
>      >   .../ghostscript/ghostscript/x86-64/objarch.h  | 40 -----------
>      >   ...hostscript_9.50.bb <http://hostscript_9.50.bb> =>
>     ghostscript_9.52.bb <http://ghostscript_9.52.bb>} | 19 ++---
>      >   21 files changed, 19 insertions(+), 826 deletions(-)
>      >   delete mode 100644
>     meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14869-0001.patch
>      >   delete mode 100644
>     meta/recipes-extended/ghostscript/ghostscript/aarch64/objarch.h
>      >   delete mode 100644
>     meta/recipes-extended/ghostscript/ghostscript/arm/objarch.h
>      >   delete mode 100644
>     meta/recipes-extended/ghostscript/ghostscript/armeb/objarch.h
>      >   delete mode 100644
>     meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-genarch.patch
>      >   delete mode 100644
>     meta/recipes-extended/ghostscript/ghostscript/i586/objarch.h
>      >   delete mode 100644
>     meta/recipes-extended/ghostscript/ghostscript/microblaze/objarch.h
>      >   delete mode 100644
>     meta/recipes-extended/ghostscript/ghostscript/microblazeel/objarch.h
>      >   delete mode 100644
>     meta/recipes-extended/ghostscript/ghostscript/mipsarchn32eb/objarch.h
>      >   delete mode 100644
>     meta/recipes-extended/ghostscript/ghostscript/mipsarchn32el/objarch.h
>      >   delete mode 100644
>     meta/recipes-extended/ghostscript/ghostscript/mipsarchn64eb/objarch.h
>      >   delete mode 100644
>     meta/recipes-extended/ghostscript/ghostscript/mipsarchn64el/objarch.h
>      >   delete mode 100644
>     meta/recipes-extended/ghostscript/ghostscript/mipsarcho32eb/objarch.h
>      >   delete mode 100644
>     meta/recipes-extended/ghostscript/ghostscript/mipsarcho32el/objarch.h
>      >   delete mode 100644
>     meta/recipes-extended/ghostscript/ghostscript/nios2/objarch.h
>      >   delete mode 100644
>     meta/recipes-extended/ghostscript/ghostscript/powerpc/objarch.h
>      >   delete mode 100644
>     meta/recipes-extended/ghostscript/ghostscript/powerpc64/objarch.h
>      >   delete mode 100644
>     meta/recipes-extended/ghostscript/ghostscript/powerpc64le/objarch.h
>      >   delete mode 100644
>     meta/recipes-extended/ghostscript/ghostscript/x86-64/objarch.h
>      >   rename meta/recipes-extended/ghostscript/{ghostscript_9.50.bb
>     <http://ghostscript_9.50.bb> => ghostscript_9.52.bb
>     <http://ghostscript_9.52.bb>} (89%)
>      >
>      > diff --git
>     a/meta/recipes-extended/ghostscript/files/do-not-check-local-libpng-source.patch
>     b/meta/recipes-extended/ghostscript/files/do-not-check-local-libpng-source.patch
>      > index 5834ffaf9f..a9afb9948c 100644
>      > ---
>     a/meta/recipes-extended/ghostscript/files/do-not-check-local-libpng-source.patch
>      > +++
>     b/meta/recipes-extended/ghostscript/files/do-not-check-local-libpng-source.patch
>      > @@ -1,7 +1,7 @@
>      > -From a954bf29a5f906b3151dffbecb5856e02e1565da Mon Sep 17
>     00:00:00 2001
>      > +From 2adaa7366064a8f18af864eda74e52877a89620c Mon Sep 17
>     00:00:00 2001
>      >   From: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>
>      >   Date: Mon, 18 Jan 2016 01:00:30 -0500
>      > -Subject: [PATCH 03/10] configure.ac <http://configure.ac>: do
>     not check local png source
>      > +Subject: [PATCH] configure.ac <http://configure.ac>: do not
>     check local png source
>      >
>      >   In oe-core, it did not need to compile local libpng
>      >   source in ghostscript, so do not check local png
>      > @@ -11,28 +11,21 @@ libpng library.
>      >   Upstream-Status: Inappropriate [OE-Core specific]
>      >
>      >   Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>
>      > +
>      >   ---
>      > - configure.ac <http://configure.ac> | 4 ++--
>      > - 1 file changed, 2 insertions(+), 2 deletions(-)
>      > + configure.ac <http://configure.ac> | 2 +-
>      > + 1 file changed, 1 insertion(+), 1 deletion(-)
>      >
>      >   diff --git a/configure.ac <http://configure.ac> b/configure.ac
>     <http://configure.ac>
>      > -index 9341930..80a60b1 100644
>      > +index 698abd3..e65ac8b 100644
>      >   --- a/configure.ac <http://configure.ac>
>      >   +++ b/configure.ac <http://configure.ac>
>      > -@@ -1114,11 +1114,11 @@ AC_SUBST(ZLIBDIR)
>      > - AC_SUBST(FT_SYS_ZLIB)
>      > -
>      > - dnl png for the png output device; it also requires zlib
>      > --LIBPNGDIR=src
>      > -+LIBPNGDIR=$srcdir/libpng
>      > - PNGDEVS=''
>      > - PNGDEVS_ALL='png48 png16m pnggray pngmono pngmonod png256 png16
>     pngalpha'
>      > - AC_MSG_CHECKING([for local png library source])
>      > --if test -f $srcdir/libpng/pngread.c; then
>      > -+if false; then
>      > -         AC_MSG_RESULT([yes])
>      > -         SHARE_LIBPNG=0
>      > -         LIBPNGDIR=$srcdir/libpng
>      > ---
>      > -1.8.3.1
>      > -
>      > +@@ -1241,7 +1241,7 @@ else
>      > +   PNGDEVS=''
>      > +   PNGDEVS_ALL='png48 png16m pnggray pngmono pngmonod png256
>     png16 pngalpha'
>      > +   AC_MSG_CHECKING([for local png library source])
>      > +-  if test -f $srcdir/libpng/pngread.c; then
>      > ++  if false; then
>      > +           AC_MSG_RESULT([yes])
>      > +           SHARE_LIBPNG=0
>      > +           LIBPNGDIR=$srcdir/libpng
>      > diff --git
>     a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14869-0001.patch
>     b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14869-0001.patch
>      > deleted file mode 100644
>      > index 715ec1c450..0000000000
>      > ---
>     a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14869-0001.patch
>      > +++ /dev/null
>      > @@ -1,70 +0,0 @@
>      > -From 485904772c5f0aa1140032746e5a0abfc40f4cef Mon Sep 17
>     00:00:00 2001
>      > -From: Chris Liddell <chris.liddell@artifex.com
>     <mailto:chris.liddell@artifex.com>>
>      > -Date: Tue, 5 Nov 2019 09:45:27 +0000
>      > -Subject: [PATCH] Bug 701841: remove .forceput from /.charkeys
>      > -
>      > -When loading Type 1 or Truetype fonts from disk, we attempt to
>     extend the glyph
>      > -name table to include all identifiable glyph names from the
>     Adobe Glyph List.
>      > -
>      > -In the case of Type 1 fonts, the font itself (almost always)
>     marks the
>      > -CharStrings dictionary as read-only, hence we have to use
>     .forceput for that
>      > -case.
>      > -
>      > -But for Truetype fonts, the CharStrings dictionary is created
>     internally and is
>      > -not read-only until *after* we have fully populated it
>     (including the extended
>      > -glyph names from the AGL), hence there is no need for .forceput,
>     and no need to
>      > -carry the security risk of using it.
>      > -
>      > -Replace with regular put.
>      > -
>      > -CVE: CVE-2019-14869
>      > -Upstream-Status: Backport
>     [git://git.ghostscript.com/ghostpdl.git
>     <http://git.ghostscript.com/ghostpdl.git>]
>      > -
>      > -Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com
>     <mailto:stefan.ghinea@windriver.com>>
>      > ----
>      > - Resource/Init/gs_ttf.ps <http://gs_ttf.ps> | 8 ++++----
>      > - 1 file changed, 4 insertions(+), 4 deletions(-)
>      > -
>      > -diff --git a/Resource/Init/gs_ttf.ps <http://gs_ttf.ps>
>     b/Resource/Init/gs_ttf.ps <http://gs_ttf.ps>
>      > -index e34967d..5354ff0 100644
>      > ---- a/Resource/Init/gs_ttf.ps <http://gs_ttf.ps>
>      > -+++ b/Resource/Init/gs_ttf.ps <http://gs_ttf.ps>
>      > -@@ -1301,7 +1301,7 @@ currentdict /.pickcmap_with_no_xlatmap .undef
>      > -           TTFDEBUG { (\n1 setting alias: ) print dup ==only
>      > -                 ( to be the same as  ) print 2 index //== exec } if
>      > -
>      > --          7 index 2 index 3 -1 roll exch .forceput
>      > -+          7 index 2 index 3 -1 roll exch put
>      > -         } forall
>      > -         pop pop pop
>      > -       }
>      > -@@ -1319,7 +1319,7 @@ currentdict /.pickcmap_with_no_xlatmap .undef
>      > -           exch pop
>      > -           TTFDEBUG { (\n2 setting alias: ) print 1 index ==only
>      > -                      ( to use glyph index: ) print dup //==
>     exec } if
>      > --          5 index 3 1 roll .forceput
>      > -+          5 index 3 1 roll put
>      > -           //false
>      > -         }
>      > -         {
>      > -@@ -1336,7 +1336,7 @@ currentdict /.pickcmap_with_no_xlatmap .undef
>      > -         {                            %  CharStrings(dict)
>     isunicode(boolean) cmap(dict) RAGL(dict) gname(name) codep(integer)
>     gindex(integer)
>      > -           TTFDEBUG { (\3 nsetting alias: ) print 1 index ==only
>      > -                 ( to be index: ) print dup //== exec } if
>      > --          exch pop 5 index 3 1 roll .forceput
>      > -+          exch pop 5 index 3 1 roll put
>      > -         }
>      > -         {
>      > -           pop pop
>      > -@@ -1366,7 +1366,7 @@ currentdict /.pickcmap_with_no_xlatmap .undef
>      > -       } ifelse
>      > -     ]
>      > -   TTFDEBUG { (Encoding: ) print dup === flush } if
>      > --} .bind executeonly odef            % hides .forceput
>      > -+} .bind odef
>      > -
>      > - % ---------------- CIDFontType 2 font loading ---------------- %
>      > -
>      > ---
>      > -2.20.1
>      > -
>      > diff --git
>     a/meta/recipes-extended/ghostscript/ghostscript/aarch64/objarch.h
>     b/meta/recipes-extended/ghostscript/ghostscript/aarch64/objarch.h
>      > deleted file mode 100644
>      > index a05de29def..0000000000
>      > --- a/meta/recipes-extended/ghostscript/ghostscript/aarch64/objarch.h
>      > +++ /dev/null
>      > @@ -1,40 +0,0 @@
>      > -/* Parameters derived from machine and compiler architecture. */
>      > -/* This file is generated mechanically by genarch.c. */
>      > -
>      > -      /* ---------------- Scalar alignments ---------------- */
>      > -
>      > -#define ARCH_ALIGN_SHORT_MOD 2
>      > -#define ARCH_ALIGN_INT_MOD 4
>      > -#define ARCH_ALIGN_LONG_MOD 8
>      > -#define ARCH_ALIGN_PTR_MOD 8
>      > -#define ARCH_ALIGN_FLOAT_MOD 4
>      > -#define ARCH_ALIGN_DOUBLE_MOD 8
>      > -
>      > -      /* ---------------- Scalar sizes ---------------- */
>      > -
>      > -#define ARCH_LOG2_SIZEOF_CHAR 0
>      > -#define ARCH_LOG2_SIZEOF_SHORT 1
>      > -#define ARCH_LOG2_SIZEOF_INT 2
>      > -#define ARCH_LOG2_SIZEOF_LONG 3
>      > -#define ARCH_LOG2_SIZEOF_LONG_LONG 3
>      > -#define ARCH_SIZEOF_GX_COLOR_INDEX 8
>      > -#define ARCH_SIZEOF_PTR 8
>      > -#define ARCH_SIZEOF_FLOAT 4
>      > -#define ARCH_SIZEOF_DOUBLE 8
>      > -#define ARCH_FLOAT_MANTISSA_BITS 24
>      > -#define ARCH_DOUBLE_MANTISSA_BITS 53
>      > -
>      > -      /* ---------------- Unsigned max values ---------------- */
>      > -
>      > -#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
>      > -#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
>      > -#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
>      > -#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
>      > -
>      > -      /* ---------------- Miscellaneous ---------------- */
>      > -
>      > -#define ARCH_IS_BIG_ENDIAN 0
>      > -#define ARCH_PTRS_ARE_SIGNED 0
>      > -#define ARCH_FLOATS_ARE_IEEE 1
>      > -#define ARCH_ARITH_RSHIFT 2
>      > -#define ARCH_DIV_NEG_POS_TRUNCATES 1
>      > diff --git
>     a/meta/recipes-extended/ghostscript/ghostscript/arm/objarch.h
>     b/meta/recipes-extended/ghostscript/ghostscript/arm/objarch.h
>      > deleted file mode 100644
>      > index e8772cd958..0000000000
>      > --- a/meta/recipes-extended/ghostscript/ghostscript/arm/objarch.h
>      > +++ /dev/null
>      > @@ -1,40 +0,0 @@
>      > -/* Parameters derived from machine and compiler architecture. */
>      > -/* This file is generated mechanically by genarch.c. */
>      > -
>      > -      /* ---------------- Scalar alignments ---------------- */
>      > -
>      > -#define ARCH_ALIGN_SHORT_MOD 2
>      > -#define ARCH_ALIGN_INT_MOD 4
>      > -#define ARCH_ALIGN_LONG_MOD 4
>      > -#define ARCH_ALIGN_PTR_MOD 4
>      > -#define ARCH_ALIGN_FLOAT_MOD 4
>      > -#define ARCH_ALIGN_DOUBLE_MOD 8
>      > -
>      > -      /* ---------------- Scalar sizes ---------------- */
>      > -
>      > -#define ARCH_LOG2_SIZEOF_CHAR 0
>      > -#define ARCH_LOG2_SIZEOF_SHORT 1
>      > -#define ARCH_LOG2_SIZEOF_INT 2
>      > -#define ARCH_LOG2_SIZEOF_LONG 2
>      > -#define ARCH_LOG2_SIZEOF_LONG_LONG 3
>      > -#define ARCH_SIZEOF_GX_COLOR_INDEX 8
>      > -#define ARCH_SIZEOF_PTR 4
>      > -#define ARCH_SIZEOF_FLOAT 4
>      > -#define ARCH_SIZEOF_DOUBLE 8
>      > -#define ARCH_FLOAT_MANTISSA_BITS 24
>      > -#define ARCH_DOUBLE_MANTISSA_BITS 53
>      > -
>      > -      /* ---------------- Unsigned max values ---------------- */
>      > -
>      > -#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
>      > -#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
>      > -#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
>      > -#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
>      > -
>      > -      /* ---------------- Miscellaneous ---------------- */
>      > -
>      > -#define ARCH_IS_BIG_ENDIAN 0
>      > -#define ARCH_PTRS_ARE_SIGNED 0
>      > -#define ARCH_FLOATS_ARE_IEEE 1
>      > -#define ARCH_ARITH_RSHIFT 2
>      > -#define ARCH_DIV_NEG_POS_TRUNCATES 1
>      > diff --git
>     a/meta/recipes-extended/ghostscript/ghostscript/armeb/objarch.h
>     b/meta/recipes-extended/ghostscript/ghostscript/armeb/objarch.h
>      > deleted file mode 100644
>      > index 359097f356..0000000000
>      > --- a/meta/recipes-extended/ghostscript/ghostscript/armeb/objarch.h
>      > +++ /dev/null
>      > @@ -1,40 +0,0 @@
>      > -/* Parameters derived from machine and compiler architecture. */
>      > -/* This file is generated mechanically by genarch.c. */
>      > -
>      > -      /* ---------------- Scalar alignments ---------------- */
>      > -
>      > -#define ARCH_ALIGN_SHORT_MOD 2
>      > -#define ARCH_ALIGN_INT_MOD 4
>      > -#define ARCH_ALIGN_LONG_MOD 4
>      > -#define ARCH_ALIGN_PTR_MOD 4
>      > -#define ARCH_ALIGN_FLOAT_MOD 4
>      > -#define ARCH_ALIGN_DOUBLE_MOD 8
>      > -
>      > -      /* ---------------- Scalar sizes ---------------- */
>      > -
>      > -#define ARCH_LOG2_SIZEOF_CHAR 0
>      > -#define ARCH_LOG2_SIZEOF_SHORT 1
>      > -#define ARCH_LOG2_SIZEOF_INT 2
>      > -#define ARCH_LOG2_SIZEOF_LONG 2
>      > -#define ARCH_LOG2_SIZEOF_LONG_LONG 3
>      > -#define ARCH_SIZEOF_GX_COLOR_INDEX 8
>      > -#define ARCH_SIZEOF_PTR 4
>      > -#define ARCH_SIZEOF_FLOAT 4
>      > -#define ARCH_SIZEOF_DOUBLE 8
>      > -#define ARCH_FLOAT_MANTISSA_BITS 24
>      > -#define ARCH_DOUBLE_MANTISSA_BITS 53
>      > -
>      > -      /* ---------------- Unsigned max values ---------------- */
>      > -
>      > -#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
>      > -#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
>      > -#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
>      > -#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
>      > -
>      > -      /* ---------------- Miscellaneous ---------------- */
>      > -
>      > -#define ARCH_IS_BIG_ENDIAN 1
>      > -#define ARCH_PTRS_ARE_SIGNED 0
>      > -#define ARCH_FLOATS_ARE_IEEE 1
>      > -#define ARCH_ARITH_RSHIFT 2
>      > -#define ARCH_DIV_NEG_POS_TRUNCATES 1
>      > diff --git
>     a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-genarch.patch
>     b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-genarch.patch
>      > deleted file mode 100644
>      > index 7b70bb8e2c..0000000000
>      > ---
>     a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-genarch.patch
>      > +++ /dev/null
>      > @@ -1,38 +0,0 @@
>      > -From c076d0fc970f190f723018258790c79b59daba2e Mon Sep 17
>     00:00:00 2001
>      > -From: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>
>      > -Date: Sat, 11 May 2019 21:20:27 +0800
>      > -Subject: [PATCH] not generate objarch.h at compile time
>      > -
>      > -Import patch from windriver linux for cross compilation, and split
>      > -patches into oe way under different directories such as i586,
>     powerpc etc
>      > -according to Richard's opinion.
>      > -
>      > -Upstream-Status: Pending
>      > -
>      > -Signed-off-by: Kang Kai <kai.kang@windriver.com
>     <mailto:kai.kang@windriver.com>>
>      > -Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com
>     <mailto:wenzong.fan@windriver.com>>
>      > -
>      > -Rebase to 9.27
>      > -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>
>      > ----
>      > - base/lib.mak | 4 ++--
>      > - 1 file changed, 2 insertions(+), 2 deletions(-)
>      > -
>      > -diff --git a/base/lib.mak b/base/lib.mak
>      > -index 3ed088a..5af2b43 100644
>      > ---- a/base/lib.mak
>      > -+++ b/base/lib.mak
>      > -@@ -87,8 +87,8 @@ arch_h=$(GLGEN)arch.h
>      > - stdpre_h=$(GLSRC)stdpre.h
>      > - stdint__h=$(GLSRC)stdint_.h
>      > -
>      > --$(GLGEN)arch.h : $(GENARCH_XE)
>      > --    $(EXP)$(GENARCH_XE) $(GLGEN)arch.h $(TARGET_ARCH_FILE)
>      > -+##$(GLGEN)arch.h : $(GENARCH_XE)
>      > -+##  $(EXP)$(GENARCH_XE) $(GLGEN)arch.h $(TARGET_ARCH_FILE)
>      > -
>      > - # Platform interfaces
>      > -
>      > ---
>      > -2.7.4
>      > -
>      > diff --git
>     a/meta/recipes-extended/ghostscript/ghostscript/i586/objarch.h
>     b/meta/recipes-extended/ghostscript/ghostscript/i586/objarch.h
>      > deleted file mode 100644
>      > index 5817b7a6d7..0000000000
>      > --- a/meta/recipes-extended/ghostscript/ghostscript/i586/objarch.h
>      > +++ /dev/null
>      > @@ -1,41 +0,0 @@
>      > -/* Parameters derived from machine and compiler architecture. */
>      > -/* This file is generated mechanically by genarch.c. */
>      > -
>      > -      /* ---------------- Scalar alignments ---------------- */
>      > -
>      > -#define ARCH_ALIGN_SHORT_MOD 2
>      > -#define ARCH_ALIGN_INT_MOD 4
>      > -#define ARCH_ALIGN_LONG_MOD 4
>      > -#define ARCH_ALIGN_PTR_MOD 4
>      > -#define ARCH_ALIGN_FLOAT_MOD 4
>      > -#define ARCH_ALIGN_DOUBLE_MOD 4
>      > -
>      > -      /* ---------------- Scalar sizes ---------------- */
>      > -
>      > -#define ARCH_LOG2_SIZEOF_CHAR 0
>      > -#define ARCH_LOG2_SIZEOF_SHORT 1
>      > -#define ARCH_LOG2_SIZEOF_INT 2
>      > -#define ARCH_LOG2_SIZEOF_LONG 2
>      > -#define ARCH_LOG2_SIZEOF_LONG_LONG 3
>      > -#define ARCH_SIZEOF_GX_COLOR_INDEX 8
>      > -#define ARCH_SIZEOF_PTR 4
>      > -#define ARCH_SIZEOF_FLOAT 4
>      > -#define ARCH_SIZEOF_DOUBLE 8
>      > -#define ARCH_FLOAT_MANTISSA_BITS 24
>      > -#define ARCH_DOUBLE_MANTISSA_BITS 53
>      > -
>      > -      /* ---------------- Unsigned max values ---------------- */
>      > -
>      > -#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
>      > -#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
>      > -#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
>      > -#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
>      > -
>      > -      /* ---------------- Miscellaneous ---------------- */
>      > -
>      > -#define ARCH_IS_BIG_ENDIAN 0
>      > -#define ARCH_PTRS_ARE_SIGNED 0
>      > -#define ARCH_FLOATS_ARE_IEEE 1
>      > -#define ARCH_ARITH_RSHIFT 2
>      > -#define ARCH_DIV_NEG_POS_TRUNCATES 1
>      > -
>      > diff --git
>     a/meta/recipes-extended/ghostscript/ghostscript/microblaze/objarch.h
>     b/meta/recipes-extended/ghostscript/ghostscript/microblaze/objarch.h
>      > deleted file mode 100644
>      > index 63232fdfa6..0000000000
>      > ---
>     a/meta/recipes-extended/ghostscript/ghostscript/microblaze/objarch.h
>      > +++ /dev/null
>      > @@ -1,40 +0,0 @@
>      > -/* Parameters derived from machine and compiler architecture. */
>      > -/* This file is generated mechanically by genarch.c. */
>      > -
>      > -      /* ---------------- Scalar alignments ---------------- */
>      > -
>      > -#define ARCH_ALIGN_SHORT_MOD 2
>      > -#define ARCH_ALIGN_INT_MOD 4
>      > -#define ARCH_ALIGN_LONG_MOD 4
>      > -#define ARCH_ALIGN_PTR_MOD 4
>      > -#define ARCH_ALIGN_FLOAT_MOD 4
>      > -#define ARCH_ALIGN_DOUBLE_MOD 4
>      > -
>      > -      /* ---------------- Scalar sizes ---------------- */
>      > -
>      > -#define ARCH_LOG2_SIZEOF_CHAR 0
>      > -#define ARCH_LOG2_SIZEOF_SHORT 1
>      > -#define ARCH_LOG2_SIZEOF_INT 2
>      > -#define ARCH_LOG2_SIZEOF_LONG 2
>      > -#define ARCH_LOG2_SIZEOF_LONG_LONG 3
>      > -#define ARCH_SIZEOF_GX_COLOR_INDEX 8
>      > -#define ARCH_SIZEOF_PTR 4
>      > -#define ARCH_SIZEOF_FLOAT 4
>      > -#define ARCH_SIZEOF_DOUBLE 8
>      > -#define ARCH_FLOAT_MANTISSA_BITS 24
>      > -#define ARCH_DOUBLE_MANTISSA_BITS 53
>      > -
>      > -      /* ---------------- Unsigned max values ---------------- */
>      > -
>      > -#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
>      > -#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
>      > -#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
>      > -#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
>      > -
>      > -      /* ---------------- Miscellaneous ---------------- */
>      > -
>      > -#define ARCH_IS_BIG_ENDIAN 1
>      > -#define ARCH_PTRS_ARE_SIGNED 0
>      > -#define ARCH_FLOATS_ARE_IEEE 1
>      > -#define ARCH_ARITH_RSHIFT 2
>      > -#define ARCH_DIV_NEG_POS_TRUNCATES 1
>      > diff --git
>     a/meta/recipes-extended/ghostscript/ghostscript/microblazeel/objarch.h
>     b/meta/recipes-extended/ghostscript/ghostscript/microblazeel/objarch.h
>      > deleted file mode 100644
>      > index 3ec8101681..0000000000
>      > ---
>     a/meta/recipes-extended/ghostscript/ghostscript/microblazeel/objarch.h
>      > +++ /dev/null
>      > @@ -1,40 +0,0 @@
>      > -/* Parameters derived from machine and compiler architecture. */
>      > -/* This file is generated mechanically by genarch.c. */
>      > -
>      > -      /* ---------------- Scalar alignments ---------------- */
>      > -
>      > -#define ARCH_ALIGN_SHORT_MOD 2
>      > -#define ARCH_ALIGN_INT_MOD 4
>      > -#define ARCH_ALIGN_LONG_MOD 4
>      > -#define ARCH_ALIGN_PTR_MOD 4
>      > -#define ARCH_ALIGN_FLOAT_MOD 4
>      > -#define ARCH_ALIGN_DOUBLE_MOD 4
>      > -
>      > -      /* ---------------- Scalar sizes ---------------- */
>      > -
>      > -#define ARCH_LOG2_SIZEOF_CHAR 0
>      > -#define ARCH_LOG2_SIZEOF_SHORT 1
>      > -#define ARCH_LOG2_SIZEOF_INT 2
>      > -#define ARCH_LOG2_SIZEOF_LONG 2
>      > -#define ARCH_LOG2_SIZEOF_LONG_LONG 3
>      > -#define ARCH_SIZEOF_GX_COLOR_INDEX 8
>      > -#define ARCH_SIZEOF_PTR 4
>      > -#define ARCH_SIZEOF_FLOAT 4
>      > -#define ARCH_SIZEOF_DOUBLE 8
>      > -#define ARCH_FLOAT_MANTISSA_BITS 24
>      > -#define ARCH_DOUBLE_MANTISSA_BITS 53
>      > -
>      > -      /* ---------------- Unsigned max values ---------------- */
>      > -
>      > -#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
>      > -#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
>      > -#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
>      > -#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
>      > -
>      > -      /* ---------------- Miscellaneous ---------------- */
>      > -
>      > -#define ARCH_IS_BIG_ENDIAN 0
>      > -#define ARCH_PTRS_ARE_SIGNED 0
>      > -#define ARCH_FLOATS_ARE_IEEE 1
>      > -#define ARCH_ARITH_RSHIFT 2
>      > -#define ARCH_DIV_NEG_POS_TRUNCATES 1
>      > diff --git
>     a/meta/recipes-extended/ghostscript/ghostscript/mipsarchn32eb/objarch.h
>     b/meta/recipes-extended/ghostscript/ghostscript/mipsarchn32eb/objarch.h
>      > deleted file mode 100644
>      > index 0d0a16bfa3..0000000000
>      > ---
>     a/meta/recipes-extended/ghostscript/ghostscript/mipsarchn32eb/objarch.h
>      > +++ /dev/null
>      > @@ -1,40 +0,0 @@
>      > -/* Parameters derived from machine and compiler architecture. */
>      > -/* This file is generated mechanically by genarch.c. */
>      > -
>      > -      /* ---------------- Scalar alignments ---------------- */
>      > -
>      > -#define ARCH_ALIGN_SHORT_MOD 2
>      > -#define ARCH_ALIGN_INT_MOD 4
>      > -#define ARCH_ALIGN_LONG_MOD 8
>      > -#define ARCH_ALIGN_PTR_MOD 8
>      > -#define ARCH_ALIGN_FLOAT_MOD 4
>      > -#define ARCH_ALIGN_DOUBLE_MOD 8
>      > -
>      > -      /* ---------------- Scalar sizes ---------------- */
>      > -
>      > -#define ARCH_LOG2_SIZEOF_CHAR 0
>      > -#define ARCH_LOG2_SIZEOF_SHORT 1
>      > -#define ARCH_LOG2_SIZEOF_INT 2
>      > -#define ARCH_LOG2_SIZEOF_LONG 3
>      > -#define ARCH_LOG2_SIZEOF_LONG_LONG 3
>      > -#define ARCH_SIZEOF_GX_COLOR_INDEX 8
>      > -#define ARCH_SIZEOF_PTR 8
>      > -#define ARCH_SIZEOF_FLOAT 4
>      > -#define ARCH_SIZEOF_DOUBLE 8
>      > -#define ARCH_FLOAT_MANTISSA_BITS 24
>      > -#define ARCH_DOUBLE_MANTISSA_BITS 53
>      > -
>      > -      /* ---------------- Unsigned max values ---------------- */
>      > -
>      > -#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
>      > -#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
>      > -#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
>      > -#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
>      > -
>      > -      /* ---------------- Miscellaneous ---------------- */
>      > -
>      > -#define ARCH_IS_BIG_ENDIAN 1
>      > -#define ARCH_PTRS_ARE_SIGNED 0
>      > -#define ARCH_FLOATS_ARE_IEEE 1
>      > -#define ARCH_ARITH_RSHIFT 2
>      > -#define ARCH_DIV_NEG_POS_TRUNCATES 1
>      > diff --git
>     a/meta/recipes-extended/ghostscript/ghostscript/mipsarchn32el/objarch.h
>     b/meta/recipes-extended/ghostscript/ghostscript/mipsarchn32el/objarch.h
>      > deleted file mode 100644
>      > index a05de29def..0000000000
>      > ---
>     a/meta/recipes-extended/ghostscript/ghostscript/mipsarchn32el/objarch.h
>      > +++ /dev/null
>      > @@ -1,40 +0,0 @@
>      > -/* Parameters derived from machine and compiler architecture. */
>      > -/* This file is generated mechanically by genarch.c. */
>      > -
>      > -      /* ---------------- Scalar alignments ---------------- */
>      > -
>      > -#define ARCH_ALIGN_SHORT_MOD 2
>      > -#define ARCH_ALIGN_INT_MOD 4
>      > -#define ARCH_ALIGN_LONG_MOD 8
>      > -#define ARCH_ALIGN_PTR_MOD 8
>      > -#define ARCH_ALIGN_FLOAT_MOD 4
>      > -#define ARCH_ALIGN_DOUBLE_MOD 8
>      > -
>      > -      /* ---------------- Scalar sizes ---------------- */
>      > -
>      > -#define ARCH_LOG2_SIZEOF_CHAR 0
>      > -#define ARCH_LOG2_SIZEOF_SHORT 1
>      > -#define ARCH_LOG2_SIZEOF_INT 2
>      > -#define ARCH_LOG2_SIZEOF_LONG 3
>      > -#define ARCH_LOG2_SIZEOF_LONG_LONG 3
>      > -#define ARCH_SIZEOF_GX_COLOR_INDEX 8
>      > -#define ARCH_SIZEOF_PTR 8
>      > -#define ARCH_SIZEOF_FLOAT 4
>      > -#define ARCH_SIZEOF_DOUBLE 8
>      > -#define ARCH_FLOAT_MANTISSA_BITS 24
>      > -#define ARCH_DOUBLE_MANTISSA_BITS 53
>      > -
>      > -      /* ---------------- Unsigned max values ---------------- */
>      > -
>      > -#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
>      > -#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
>      > -#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
>      > -#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
>      > -
>      > -      /* ---------------- Miscellaneous ---------------- */
>      > -
>      > -#define ARCH_IS_BIG_ENDIAN 0
>      > -#define ARCH_PTRS_ARE_SIGNED 0
>      > -#define ARCH_FLOATS_ARE_IEEE 1
>      > -#define ARCH_ARITH_RSHIFT 2
>      > -#define ARCH_DIV_NEG_POS_TRUNCATES 1
>      > diff --git
>     a/meta/recipes-extended/ghostscript/ghostscript/mipsarchn64eb/objarch.h
>     b/meta/recipes-extended/ghostscript/ghostscript/mipsarchn64eb/objarch.h
>      > deleted file mode 100644
>      > index 0d0a16bfa3..0000000000
>      > ---
>     a/meta/recipes-extended/ghostscript/ghostscript/mipsarchn64eb/objarch.h
>      > +++ /dev/null
>      > @@ -1,40 +0,0 @@
>      > -/* Parameters derived from machine and compiler architecture. */
>      > -/* This file is generated mechanically by genarch.c. */
>      > -
>      > -      /* ---------------- Scalar alignments ---------------- */
>      > -
>      > -#define ARCH_ALIGN_SHORT_MOD 2
>      > -#define ARCH_ALIGN_INT_MOD 4
>      > -#define ARCH_ALIGN_LONG_MOD 8
>      > -#define ARCH_ALIGN_PTR_MOD 8
>      > -#define ARCH_ALIGN_FLOAT_MOD 4
>      > -#define ARCH_ALIGN_DOUBLE_MOD 8
>      > -
>      > -      /* ---------------- Scalar sizes ---------------- */
>      > -
>      > -#define ARCH_LOG2_SIZEOF_CHAR 0
>      > -#define ARCH_LOG2_SIZEOF_SHORT 1
>      > -#define ARCH_LOG2_SIZEOF_INT 2
>      > -#define ARCH_LOG2_SIZEOF_LONG 3
>      > -#define ARCH_LOG2_SIZEOF_LONG_LONG 3
>      > -#define ARCH_SIZEOF_GX_COLOR_INDEX 8
>      > -#define ARCH_SIZEOF_PTR 8
>      > -#define ARCH_SIZEOF_FLOAT 4
>      > -#define ARCH_SIZEOF_DOUBLE 8
>      > -#define ARCH_FLOAT_MANTISSA_BITS 24
>      > -#define ARCH_DOUBLE_MANTISSA_BITS 53
>      > -
>      > -      /* ---------------- Unsigned max values ---------------- */
>      > -
>      > -#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
>      > -#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
>      > -#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
>      > -#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
>      > -
>      > -      /* ---------------- Miscellaneous ---------------- */
>      > -
>      > -#define ARCH_IS_BIG_ENDIAN 1
>      > -#define ARCH_PTRS_ARE_SIGNED 0
>      > -#define ARCH_FLOATS_ARE_IEEE 1
>      > -#define ARCH_ARITH_RSHIFT 2
>      > -#define ARCH_DIV_NEG_POS_TRUNCATES 1
>      > diff --git
>     a/meta/recipes-extended/ghostscript/ghostscript/mipsarchn64el/objarch.h
>     b/meta/recipes-extended/ghostscript/ghostscript/mipsarchn64el/objarch.h
>      > deleted file mode 100644
>      > index a05de29def..0000000000
>      > ---
>     a/meta/recipes-extended/ghostscript/ghostscript/mipsarchn64el/objarch.h
>      > +++ /dev/null
>      > @@ -1,40 +0,0 @@
>      > -/* Parameters derived from machine and compiler architecture. */
>      > -/* This file is generated mechanically by genarch.c. */
>      > -
>      > -      /* ---------------- Scalar alignments ---------------- */
>      > -
>      > -#define ARCH_ALIGN_SHORT_MOD 2
>      > -#define ARCH_ALIGN_INT_MOD 4
>      > -#define ARCH_ALIGN_LONG_MOD 8
>      > -#define ARCH_ALIGN_PTR_MOD 8
>      > -#define ARCH_ALIGN_FLOAT_MOD 4
>      > -#define ARCH_ALIGN_DOUBLE_MOD 8
>      > -
>      > -      /* ---------------- Scalar sizes ---------------- */
>      > -
>      > -#define ARCH_LOG2_SIZEOF_CHAR 0
>      > -#define ARCH_LOG2_SIZEOF_SHORT 1
>      > -#define ARCH_LOG2_SIZEOF_INT 2
>      > -#define ARCH_LOG2_SIZEOF_LONG 3
>      > -#define ARCH_LOG2_SIZEOF_LONG_LONG 3
>      > -#define ARCH_SIZEOF_GX_COLOR_INDEX 8
>      > -#define ARCH_SIZEOF_PTR 8
>      > -#define ARCH_SIZEOF_FLOAT 4
>      > -#define ARCH_SIZEOF_DOUBLE 8
>      > -#define ARCH_FLOAT_MANTISSA_BITS 24
>      > -#define ARCH_DOUBLE_MANTISSA_BITS 53
>      > -
>      > -      /* ---------------- Unsigned max values ---------------- */
>      > -
>      > -#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
>      > -#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
>      > -#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
>      > -#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
>      > -
>      > -      /* ---------------- Miscellaneous ---------------- */
>      > -
>      > -#define ARCH_IS_BIG_ENDIAN 0
>      > -#define ARCH_PTRS_ARE_SIGNED 0
>      > -#define ARCH_FLOATS_ARE_IEEE 1
>      > -#define ARCH_ARITH_RSHIFT 2
>      > -#define ARCH_DIV_NEG_POS_TRUNCATES 1
>      > diff --git
>     a/meta/recipes-extended/ghostscript/ghostscript/mipsarcho32eb/objarch.h
>     b/meta/recipes-extended/ghostscript/ghostscript/mipsarcho32eb/objarch.h
>      > deleted file mode 100644
>      > index b8b637cca2..0000000000
>      > ---
>     a/meta/recipes-extended/ghostscript/ghostscript/mipsarcho32eb/objarch.h
>      > +++ /dev/null
>      > @@ -1,40 +0,0 @@
>      > -/* Parameters derived from machine and compiler architecture. */
>      > -/* This file is generated mechanically by genarch.c. */
>      > -
>      > -      /* ---------------- Scalar alignments ---------------- */
>      > -
>      > -#define ARCH_ALIGN_SHORT_MOD 2
>      > -#define ARCH_ALIGN_INT_MOD 4
>      > -#define ARCH_ALIGN_LONG_MOD 4
>      > -#define ARCH_ALIGN_PTR_MOD 4
>      > -#define ARCH_ALIGN_FLOAT_MOD 4
>      > -#define ARCH_ALIGN_DOUBLE_MOD 8
>      > -
>      > -      /* ---------------- Scalar sizes ---------------- */
>      > -
>      > -#define ARCH_LOG2_SIZEOF_CHAR 0
>      > -#define ARCH_LOG2_SIZEOF_SHORT 1
>      > -#define ARCH_LOG2_SIZEOF_INT 2
>      > -#define ARCH_LOG2_SIZEOF_LONG 2
>      > -#define ARCH_LOG2_SIZEOF_LONG_LONG 3
>      > -#define ARCH_SIZEOF_GX_COLOR_INDEX 4
>      > -#define ARCH_SIZEOF_PTR 4
>      > -#define ARCH_SIZEOF_FLOAT 4
>      > -#define ARCH_SIZEOF_DOUBLE 8
>      > -#define ARCH_FLOAT_MANTISSA_BITS 24
>      > -#define ARCH_DOUBLE_MANTISSA_BITS 53
>      > -
>      > -      /* ---------------- Unsigned max values ---------------- */
>      > -
>      > -#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
>      > -#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
>      > -#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
>      > -#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
>      > -
>      > -      /* ---------------- Miscellaneous ---------------- */
>      > -
>      > -#define ARCH_IS_BIG_ENDIAN 1
>      > -#define ARCH_PTRS_ARE_SIGNED 0
>      > -#define ARCH_FLOATS_ARE_IEEE 1
>      > -#define ARCH_ARITH_RSHIFT 2
>      > -#define ARCH_DIV_NEG_POS_TRUNCATES 1
>      > diff --git
>     a/meta/recipes-extended/ghostscript/ghostscript/mipsarcho32el/objarch.h
>     b/meta/recipes-extended/ghostscript/ghostscript/mipsarcho32el/objarch.h
>      > deleted file mode 100644
>      > index 29f90ddf85..0000000000
>      > ---
>     a/meta/recipes-extended/ghostscript/ghostscript/mipsarcho32el/objarch.h
>      > +++ /dev/null
>      > @@ -1,40 +0,0 @@
>      > -/* Parameters derived from machine and compiler architecture. */
>      > -/* This file is generated mechanically by genarch.c. */
>      > -
>      > -      /* ---------------- Scalar alignments ---------------- */
>      > -
>      > -#define ARCH_ALIGN_SHORT_MOD 2
>      > -#define ARCH_ALIGN_INT_MOD 4
>      > -#define ARCH_ALIGN_LONG_MOD 4
>      > -#define ARCH_ALIGN_PTR_MOD 4
>      > -#define ARCH_ALIGN_FLOAT_MOD 4
>      > -#define ARCH_ALIGN_DOUBLE_MOD 8
>      > -
>      > -      /* ---------------- Scalar sizes ---------------- */
>      > -
>      > -#define ARCH_LOG2_SIZEOF_CHAR 0
>      > -#define ARCH_LOG2_SIZEOF_SHORT 1
>      > -#define ARCH_LOG2_SIZEOF_INT 2
>      > -#define ARCH_LOG2_SIZEOF_LONG 2
>      > -#define ARCH_LOG2_SIZEOF_LONG_LONG 3
>      > -#define ARCH_SIZEOF_GX_COLOR_INDEX 4
>      > -#define ARCH_SIZEOF_PTR 4
>      > -#define ARCH_SIZEOF_FLOAT 4
>      > -#define ARCH_SIZEOF_DOUBLE 8
>      > -#define ARCH_FLOAT_MANTISSA_BITS 24
>      > -#define ARCH_DOUBLE_MANTISSA_BITS 53
>      > -
>      > -      /* ---------------- Unsigned max values ---------------- */
>      > -
>      > -#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
>      > -#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
>      > -#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
>      > -#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
>      > -
>      > -      /* ---------------- Miscellaneous ---------------- */
>      > -
>      > -#define ARCH_IS_BIG_ENDIAN 0
>      > -#define ARCH_PTRS_ARE_SIGNED 0
>      > -#define ARCH_FLOATS_ARE_IEEE 1
>      > -#define ARCH_ARITH_RSHIFT 2
>      > -#define ARCH_DIV_NEG_POS_TRUNCATES 1
>      > diff --git
>     a/meta/recipes-extended/ghostscript/ghostscript/nios2/objarch.h
>     b/meta/recipes-extended/ghostscript/ghostscript/nios2/objarch.h
>      > deleted file mode 100644
>      > index 3ec8101681..0000000000
>      > --- a/meta/recipes-extended/ghostscript/ghostscript/nios2/objarch.h
>      > +++ /dev/null
>      > @@ -1,40 +0,0 @@
>      > -/* Parameters derived from machine and compiler architecture. */
>      > -/* This file is generated mechanically by genarch.c. */
>      > -
>      > -      /* ---------------- Scalar alignments ---------------- */
>      > -
>      > -#define ARCH_ALIGN_SHORT_MOD 2
>      > -#define ARCH_ALIGN_INT_MOD 4
>      > -#define ARCH_ALIGN_LONG_MOD 4
>      > -#define ARCH_ALIGN_PTR_MOD 4
>      > -#define ARCH_ALIGN_FLOAT_MOD 4
>      > -#define ARCH_ALIGN_DOUBLE_MOD 4
>      > -
>      > -      /* ---------------- Scalar sizes ---------------- */
>      > -
>      > -#define ARCH_LOG2_SIZEOF_CHAR 0
>      > -#define ARCH_LOG2_SIZEOF_SHORT 1
>      > -#define ARCH_LOG2_SIZEOF_INT 2
>      > -#define ARCH_LOG2_SIZEOF_LONG 2
>      > -#define ARCH_LOG2_SIZEOF_LONG_LONG 3
>      > -#define ARCH_SIZEOF_GX_COLOR_INDEX 8
>      > -#define ARCH_SIZEOF_PTR 4
>      > -#define ARCH_SIZEOF_FLOAT 4
>      > -#define ARCH_SIZEOF_DOUBLE 8
>      > -#define ARCH_FLOAT_MANTISSA_BITS 24
>      > -#define ARCH_DOUBLE_MANTISSA_BITS 53
>      > -
>      > -      /* ---------------- Unsigned max values ---------------- */
>      > -
>      > -#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
>      > -#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
>      > -#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
>      > -#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
>      > -
>      > -      /* ---------------- Miscellaneous ---------------- */
>      > -
>      > -#define ARCH_IS_BIG_ENDIAN 0
>      > -#define ARCH_PTRS_ARE_SIGNED 0
>      > -#define ARCH_FLOATS_ARE_IEEE 1
>      > -#define ARCH_ARITH_RSHIFT 2
>      > -#define ARCH_DIV_NEG_POS_TRUNCATES 1
>      > diff --git
>     a/meta/recipes-extended/ghostscript/ghostscript/powerpc/objarch.h
>     b/meta/recipes-extended/ghostscript/ghostscript/powerpc/objarch.h
>      > deleted file mode 100644
>      > index 359097f356..0000000000
>      > --- a/meta/recipes-extended/ghostscript/ghostscript/powerpc/objarch.h
>      > +++ /dev/null
>      > @@ -1,40 +0,0 @@
>      > -/* Parameters derived from machine and compiler architecture. */
>      > -/* This file is generated mechanically by genarch.c. */
>      > -
>      > -      /* ---------------- Scalar alignments ---------------- */
>      > -
>      > -#define ARCH_ALIGN_SHORT_MOD 2
>      > -#define ARCH_ALIGN_INT_MOD 4
>      > -#define ARCH_ALIGN_LONG_MOD 4
>      > -#define ARCH_ALIGN_PTR_MOD 4
>      > -#define ARCH_ALIGN_FLOAT_MOD 4
>      > -#define ARCH_ALIGN_DOUBLE_MOD 8
>      > -
>      > -      /* ---------------- Scalar sizes ---------------- */
>      > -
>      > -#define ARCH_LOG2_SIZEOF_CHAR 0
>      > -#define ARCH_LOG2_SIZEOF_SHORT 1
>      > -#define ARCH_LOG2_SIZEOF_INT 2
>      > -#define ARCH_LOG2_SIZEOF_LONG 2
>      > -#define ARCH_LOG2_SIZEOF_LONG_LONG 3
>      > -#define ARCH_SIZEOF_GX_COLOR_INDEX 8
>      > -#define ARCH_SIZEOF_PTR 4
>      > -#define ARCH_SIZEOF_FLOAT 4
>      > -#define ARCH_SIZEOF_DOUBLE 8
>      > -#define ARCH_FLOAT_MANTISSA_BITS 24
>      > -#define ARCH_DOUBLE_MANTISSA_BITS 53
>      > -
>      > -      /* ---------------- Unsigned max values ---------------- */
>      > -
>      > -#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
>      > -#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
>      > -#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
>      > -#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
>      > -
>      > -      /* ---------------- Miscellaneous ---------------- */
>      > -
>      > -#define ARCH_IS_BIG_ENDIAN 1
>      > -#define ARCH_PTRS_ARE_SIGNED 0
>      > -#define ARCH_FLOATS_ARE_IEEE 1
>      > -#define ARCH_ARITH_RSHIFT 2
>      > -#define ARCH_DIV_NEG_POS_TRUNCATES 1
>      > diff --git
>     a/meta/recipes-extended/ghostscript/ghostscript/powerpc64/objarch.h
>     b/meta/recipes-extended/ghostscript/ghostscript/powerpc64/objarch.h
>      > deleted file mode 100644
>      > index 0d0a16bfa3..0000000000
>      > ---
>     a/meta/recipes-extended/ghostscript/ghostscript/powerpc64/objarch.h
>      > +++ /dev/null
>      > @@ -1,40 +0,0 @@
>      > -/* Parameters derived from machine and compiler architecture. */
>      > -/* This file is generated mechanically by genarch.c. */
>      > -
>      > -      /* ---------------- Scalar alignments ---------------- */
>      > -
>      > -#define ARCH_ALIGN_SHORT_MOD 2
>      > -#define ARCH_ALIGN_INT_MOD 4
>      > -#define ARCH_ALIGN_LONG_MOD 8
>      > -#define ARCH_ALIGN_PTR_MOD 8
>      > -#define ARCH_ALIGN_FLOAT_MOD 4
>      > -#define ARCH_ALIGN_DOUBLE_MOD 8
>      > -
>      > -      /* ---------------- Scalar sizes ---------------- */
>      > -
>      > -#define ARCH_LOG2_SIZEOF_CHAR 0
>      > -#define ARCH_LOG2_SIZEOF_SHORT 1
>      > -#define ARCH_LOG2_SIZEOF_INT 2
>      > -#define ARCH_LOG2_SIZEOF_LONG 3
>      > -#define ARCH_LOG2_SIZEOF_LONG_LONG 3
>      > -#define ARCH_SIZEOF_GX_COLOR_INDEX 8
>      > -#define ARCH_SIZEOF_PTR 8
>      > -#define ARCH_SIZEOF_FLOAT 4
>      > -#define ARCH_SIZEOF_DOUBLE 8
>      > -#define ARCH_FLOAT_MANTISSA_BITS 24
>      > -#define ARCH_DOUBLE_MANTISSA_BITS 53
>      > -
>      > -      /* ---------------- Unsigned max values ---------------- */
>      > -
>      > -#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
>      > -#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
>      > -#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
>      > -#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
>      > -
>      > -      /* ---------------- Miscellaneous ---------------- */
>      > -
>      > -#define ARCH_IS_BIG_ENDIAN 1
>      > -#define ARCH_PTRS_ARE_SIGNED 0
>      > -#define ARCH_FLOATS_ARE_IEEE 1
>      > -#define ARCH_ARITH_RSHIFT 2
>      > -#define ARCH_DIV_NEG_POS_TRUNCATES 1
>      > diff --git
>     a/meta/recipes-extended/ghostscript/ghostscript/powerpc64le/objarch.h b/meta/recipes-extended/ghostscript/ghostscript/powerpc64le/objarch.h
>      > deleted file mode 100644
>      > index a05de29def..0000000000
>      > ---
>     a/meta/recipes-extended/ghostscript/ghostscript/powerpc64le/objarch.h
>      > +++ /dev/null
>      > @@ -1,40 +0,0 @@
>      > -/* Parameters derived from machine and compiler architecture. */
>      > -/* This file is generated mechanically by genarch.c. */
>      > -
>      > -      /* ---------------- Scalar alignments ---------------- */
>      > -
>      > -#define ARCH_ALIGN_SHORT_MOD 2
>      > -#define ARCH_ALIGN_INT_MOD 4
>      > -#define ARCH_ALIGN_LONG_MOD 8
>      > -#define ARCH_ALIGN_PTR_MOD 8
>      > -#define ARCH_ALIGN_FLOAT_MOD 4
>      > -#define ARCH_ALIGN_DOUBLE_MOD 8
>      > -
>      > -      /* ---------------- Scalar sizes ---------------- */
>      > -
>      > -#define ARCH_LOG2_SIZEOF_CHAR 0
>      > -#define ARCH_LOG2_SIZEOF_SHORT 1
>      > -#define ARCH_LOG2_SIZEOF_INT 2
>      > -#define ARCH_LOG2_SIZEOF_LONG 3
>      > -#define ARCH_LOG2_SIZEOF_LONG_LONG 3
>      > -#define ARCH_SIZEOF_GX_COLOR_INDEX 8
>      > -#define ARCH_SIZEOF_PTR 8
>      > -#define ARCH_SIZEOF_FLOAT 4
>      > -#define ARCH_SIZEOF_DOUBLE 8
>      > -#define ARCH_FLOAT_MANTISSA_BITS 24
>      > -#define ARCH_DOUBLE_MANTISSA_BITS 53
>      > -
>      > -      /* ---------------- Unsigned max values ---------------- */
>      > -
>      > -#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
>      > -#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
>      > -#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
>      > -#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
>      > -
>      > -      /* ---------------- Miscellaneous ---------------- */
>      > -
>      > -#define ARCH_IS_BIG_ENDIAN 0
>      > -#define ARCH_PTRS_ARE_SIGNED 0
>      > -#define ARCH_FLOATS_ARE_IEEE 1
>      > -#define ARCH_ARITH_RSHIFT 2
>      > -#define ARCH_DIV_NEG_POS_TRUNCATES 1
>      > diff --git
>     a/meta/recipes-extended/ghostscript/ghostscript/x86-64/objarch.h
>     b/meta/recipes-extended/ghostscript/ghostscript/x86-64/objarch.h
>      > deleted file mode 100644
>      > index a05de29def..0000000000
>      > --- a/meta/recipes-extended/ghostscript/ghostscript/x86-64/objarch.h
>      > +++ /dev/null
>      > @@ -1,40 +0,0 @@
>      > -/* Parameters derived from machine and compiler architecture. */
>      > -/* This file is generated mechanically by genarch.c. */
>      > -
>      > -      /* ---------------- Scalar alignments ---------------- */
>      > -
>      > -#define ARCH_ALIGN_SHORT_MOD 2
>      > -#define ARCH_ALIGN_INT_MOD 4
>      > -#define ARCH_ALIGN_LONG_MOD 8
>      > -#define ARCH_ALIGN_PTR_MOD 8
>      > -#define ARCH_ALIGN_FLOAT_MOD 4
>      > -#define ARCH_ALIGN_DOUBLE_MOD 8
>      > -
>      > -      /* ---------------- Scalar sizes ---------------- */
>      > -
>      > -#define ARCH_LOG2_SIZEOF_CHAR 0
>      > -#define ARCH_LOG2_SIZEOF_SHORT 1
>      > -#define ARCH_LOG2_SIZEOF_INT 2
>      > -#define ARCH_LOG2_SIZEOF_LONG 3
>      > -#define ARCH_LOG2_SIZEOF_LONG_LONG 3
>      > -#define ARCH_SIZEOF_GX_COLOR_INDEX 8
>      > -#define ARCH_SIZEOF_PTR 8
>      > -#define ARCH_SIZEOF_FLOAT 4
>      > -#define ARCH_SIZEOF_DOUBLE 8
>      > -#define ARCH_FLOAT_MANTISSA_BITS 24
>      > -#define ARCH_DOUBLE_MANTISSA_BITS 53
>      > -
>      > -      /* ---------------- Unsigned max values ---------------- */
>      > -
>      > -#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
>      > -#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
>      > -#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
>      > -#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
>      > -
>      > -      /* ---------------- Miscellaneous ---------------- */
>      > -
>      > -#define ARCH_IS_BIG_ENDIAN 0
>      > -#define ARCH_PTRS_ARE_SIGNED 0
>      > -#define ARCH_FLOATS_ARE_IEEE 1
>      > -#define ARCH_ARITH_RSHIFT 2
>      > -#define ARCH_DIV_NEG_POS_TRUNCATES 1
>      > diff --git
>     a/meta/recipes-extended/ghostscript/ghostscript_9.50.bb
>     <http://ghostscript_9.50.bb>
>     b/meta/recipes-extended/ghostscript/ghostscript_9.52.bb
>     <http://ghostscript_9.52.bb>
>      > similarity index 89%
>      > rename from meta/recipes-extended/ghostscript/ghostscript_9.50.bb
>     <http://ghostscript_9.50.bb>
>      > rename to meta/recipes-extended/ghostscript/ghostscript_9.52.bb
>     <http://ghostscript_9.52.bb>
>      > index 5e8af8dc11..4cdb6e00d8 100644
>      > --- a/meta/recipes-extended/ghostscript/ghostscript_9.50.bb
>     <http://ghostscript_9.50.bb>
>      > +++ b/meta/recipes-extended/ghostscript/ghostscript_9.52.bb
>     <http://ghostscript_9.52.bb>
>      > @@ -29,13 +29,10 @@ SRC_URI_BASE =
>     "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
>      >                   file://do-not-check-local-libpng-source.patch \
>      >                   file://avoid-host-contamination.patch \
>      >                   file://mkdir-p.patch \
>      > -                file://CVE-2019-14869-0001.patch \
>      >   "
>      >
>      >   SRC_URI = "${SRC_URI_BASE} \
>      >              file://ghostscript-9.21-prevent_recompiling.patch \
>      > -           file://ghostscript-9.02-genarch.patch \
>      > -           file://objarch.h \
>      >              file://cups-no-gcrypt.patch \
>      >              "
>      >
>      > @@ -44,8 +41,8 @@ SRC_URI_class-native = "${SRC_URI_BASE} \
>      >                         
>       file://base-genht.c-add-a-preprocessor-define-to-allow-fope.patch \
>      >                           "
>      >
>      > -SRC_URI[md5sum] = "00970cf622bd5b46f68eec9383753870"
>      > -SRC_URI[sha256sum] =
>     "0f53e89fd647815828fc5171613e860e8535b68f7afbc91bf89aee886769ce89"
>      > +SRC_URI[md5sum] = "0f6964ab9b83a63b7e373f136243f901"
>      > +SRC_URI[sha256sum] =
>     "c2501d8e8e0814c4a5aa7e443e230e73d7af7f70287546f7b697e5ef49e32176"
>      >
>      >   # Put something like
>      >   #
>      > @@ -76,7 +73,7 @@ EXTRA_OECONF_class-native = "--without-x
>     --with-system-libtiff=no \
>      >                                --without-jbig2dec
>     --without-libpaper \
>      >                                --with-fontpath=${datadir}/fonts \
>      >                                --without-libidn
>     --disable-fontconfig \
>      > -                             --disable-freetype --disable-cups"
>      > +                             --enable-freetype --disable-cups "
>      >
>      >   # This has been fixed upstream but for now we need to subvert
>     the check for time.h
>      >   # http://bugs.ghostscript.com/show_bug.cgi?id=692443
>      > @@ -84,15 +81,7 @@ EXTRA_OECONF_class-native = "--without-x
>     --with-system-libtiff=no \
>      >   CFLAGS += "-DHAVE_SYS_TIME_H=1"
>      >   BUILD_CFLAGS += "-DHAVE_SYS_TIME_H=1"
>      >
>      > -inherit autotools
>      > -
>      > -do_configure_prepend () {
>      > -     mkdir -p obj
>      > -     mkdir -p soobj
>      > -     if [ -e ${WORKDIR}/objarch.h ]; then
>      > -             cp ${WORKDIR}/objarch.h obj/arch.h
>      > -     fi
>      > -}
>      > +inherit autotools-brokensep
>      >
>      >   do_configure_append () {
>      >       # copy tools from the native ghostscript build
>      >
>      >
>      > 
>      >
> 
