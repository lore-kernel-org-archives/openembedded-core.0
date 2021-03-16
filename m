Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
 by mx.groups.io with SMTP id smtpd.web09.184.1615914634440017136
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Mar 2021 10:10:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YhOLvzMQ;
 spf=pass (domain: gmail.com, ip: 209.85.217.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f46.google.com with SMTP id f1so8478570vsl.0
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Mar 2021 10:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t0Vj8l7/pAUThG2TrUUtb04rbHh/AxsJIV0Vm3AJ0Fs=;
        b=YhOLvzMQQP+HBhF7aFalp9hELFiDe1jXx1SHZ/ojS83vD7HkqLhD20ssR8nDrW8YvD
         Cxwtd7MyHI/OcVRs9RJyjP5T1f6elu8mM43+FHwdGUL2ONDvF7zjPX+yNybxOIMEfa9i
         kleIJMqD+reVb063vO6O5IzqkPzNoQz47+2eR76j7KbQ18eH69L/fNt4o+/7iA1BSent
         /qSBx9RHv9VeT4yXF0BQivzIps7kcqlYLdrEIG4oq/+D9eil+NNkO+hLzwNFcrnYJ0gC
         6LJcdEcGMrghkI3MPjv0nICbNgES7zizkfWg2jPJwuzuungMLutWV/RQEpDYo6VX03CI
         6TmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t0Vj8l7/pAUThG2TrUUtb04rbHh/AxsJIV0Vm3AJ0Fs=;
        b=r4Vnx/yOUDfZUkMqA3VoahhdGaqVkg6ptzzwHMXN6ULKmsa7JWRJ9B3P+Yoevt8RZM
         LpOxz/kDN0JkKD11i5hWtBVG+Z6F48i8tyxFDkXN+Y9ovfu+dIqQQgYLUMPTsVgXLgqJ
         H3GCoQOURJrgNk9nqNa1VNrKB2c/jBJ913grMDwulkkx0jed7lrOAVh0kEtM4q9zA6IC
         A9CTXVhgFynPbH+EtJp8nYJcbTtFu45uDSjjruePiZjOg15Krrba3F6nP05FoNccs5qq
         Th1QvjFQ3saIou3JPRmm9orqjWfQhV6kuk8rzkj7IJ19KnC5Q9bEYbsbOFZWH8q4FMtO
         xlQw==
X-Gm-Message-State: AOAM533UoHN+Jeu4NrGDhhhWthzlwAT72wrOv9drDaQQXKZPJCmC6wWb
	o/6nXy3WIcP68gQ280IGpbN2a8rCLYAOBVDtSm+ALNFLBkY=
X-Google-Smtp-Source: ABdhPJx1E/FQkPOxpI/HuWElnP1MpmuZ+Z2++Xl6lrajHnsfQgBBrfKlZagH9mk3xQu34IQ894K4nMxlF8hx2nqkuNw=
X-Received: by 2002:a67:bc11:: with SMTP id t17mr610875vsn.51.1615914632625;
 Tue, 16 Mar 2021 10:10:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210316035243.6637-1-naveen.kumar.saini@intel.com>
 <CANNYZj-aizVd8z82KyO6ya+Q206L2fNmYcKksS32-FqWfPZYig@mail.gmail.com> <999f8cae4d12de651a267d7aef360a10690d7687.camel@intel.com>
In-Reply-To: <999f8cae4d12de651a267d7aef360a10690d7687.camel@intel.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 16 Mar 2021 18:10:19 +0100
Message-ID: <CANNYZj-aM2063wuv9VkB0ups1-CdzPTZvEPFj0j92mbmP7K95A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] grub: upgrade 2.04 -> 2.06-rc1
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "Saini, Naveen Kumar" <naveen.kumar.saini@intel.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000aa443c05bdaa711d"

--000000000000aa443c05bdaa711d
Content-Type: text/plain; charset="UTF-8"

That's ok, but then please label the version 2.06~rc1, so it won't go
backwards later.

Alex

On Tue, 16 Mar 2021 at 17:50, Mittal, Anuj <anuj.mittal@intel.com> wrote:

> I think the announcement said the final release might take a month or
> so. This version includes some important security fixes. If we don't
> take this version, we might have to backport more than a hundred
> commits:
>
>
> https://salsa.debian.org/grub-team/grub/-/commit/37c2a594625efba8b7f10d18a444393982d2e31f
>
> Thanks,
>
> Anuj
>
> On Tue, 2021-03-16 at 08:46 +0100, Alexander Kanavin wrote:
> > oe-core generally waits for the final releases, and does not provide
> > alphas, betas or rcs. Is the final release coming soon?
> >
> > Alex
> >
> > On Tue, 16 Mar 2021 at 04:41, Naveen Saini
> > <naveen.kumar.saini@intel.com> wrote:
> > > 2.06 RC1 release have a number of CVEs fixed:
> > > CVE-2020-15705
> > > CVE-2021-3418
> > > CVE-2020-27749
> > > CVE-2021-20233
> > > CVE-2021-20225
> > > CVE-2020-25647
> > > CVE-2020-25632
> > > CVE-2020-27779
> > > CVE-2020-14372
> > > CVE-2020-15707
> > > CVE-2020-15706
> > > CVE-2020-14309
> > > CVE-2020-14310
> > > CVE-2020-14311
> > > CVE-2020-14308
> > > CVE-2020-10713
> > > CVE-2014-4607
> > >
> > > Dropped backported patches.
> > >
> > > Official tar file for 2.06-rc1 is not available, so need to download
> > > gnublib
> > > module additionally in order to build from git repo.
> > >
> > > Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
> > > ---
> > >  ...507ce30f775008e093580f0c9499dfb2c485.patch |   47 -
> > >  .../grub/files/CVE-2020-10713.patch           |   73 -
> > >  ...308-calloc-Use-calloc-at-most-places.patch | 1863 ---------------
> > > --
> > >  ...low-checking-primitives-where-we-do-.patch | 1330 ------------
> > >  ...se-after-free-when-redefining-a-func.patch |  117 --
> > >  ...er-overflows-in-initrd-size-handling.patch |  177 --
> > >  .../grub/files/autogen.sh-exclude-pc.patch    |   15 +-
> > >  ...-we-always-have-an-overflow-checking.patch |  246 ---
> > >  meta/recipes-bsp/grub/files/determinism.patch |   58 +-
> > >  ...dd-LVM-cache-logical-volume-handling.patch |  287 ---
> > >  ...e-arithmetic-primitives-that-check-f.patch |   94 -
> > >  ...used-fields-from-grub_script_functio.patch |   37 -
> > >  ...{grub-efi_2.04.bb => grub-efi_2.06-rc1.bb} |    2 -
> > >  meta/recipes-bsp/grub/grub2.inc               |   22 +-
> > >  .../grub/{grub_2.04.bb => grub_2.06-rc1.bb}   |    0
> > >  15 files changed, 52 insertions(+), 4316 deletions(-)
> > >  delete mode 100644 meta/recipes-
> > > bsp/grub/files/6643507ce30f775008e093580f0c9499dfb2c485.patch
> > >  delete mode 100644 meta/recipes-bsp/grub/files/CVE-2020-10713.patch
> > >  delete mode 100644 meta/recipes-bsp/grub/files/CVE-2020-14308-
> > > calloc-Use-calloc-at-most-places.patch
> > >  delete mode 100644 meta/recipes-bsp/grub/files/CVE-2020-14309-CVE-
> > > 2020-14310-CVE-2020-14311-malloc-Use-overflow-checking-primitives-
> > > where-we-do-.patch
> > >  delete mode 100644 meta/recipes-bsp/grub/files/CVE-2020-15706-
> > > script-Avoid-a-use-after-free-when-redefining-a-func.patch
> > >  delete mode 100644 meta/recipes-bsp/grub/files/CVE-2020-15707-linux-
> > > Fix-integer-overflows-in-initrd-size-handling.patch
> > >  delete mode 100644 meta/recipes-bsp/grub/files/calloc-Make-sure-we-
> > > always-have-an-overflow-checking.patch
> > >  delete mode 100644 meta/recipes-bsp/grub/files/lvm-Add-LVM-cache-
> > > logical-volume-handling.patch
> > >  delete mode 100644 meta/recipes-bsp/grub/files/safemath-Add-some-
> > > arithmetic-primitives-that-check-f.patch
> > >  delete mode 100644 meta/recipes-bsp/grub/files/script-Remove-unused-
> > > fields-from-grub_script_functio.patch
> > >  rename meta/recipes-bsp/grub/{grub-efi_2.04.bb =>
> > > grub-efi_2.06-rc1.bb} (98%)
> > >  rename meta/recipes-bsp/grub/{grub_2.04.bb => grub_2.06-rc1.bb}
> > > (100%)
> > >
> > > diff --git a/meta/recipes-
> > > bsp/grub/files/6643507ce30f775008e093580f0c9499dfb2c485.patch
> > > b/meta/recipes-
> > > bsp/grub/files/6643507ce30f775008e093580f0c9499dfb2c485.patch
> > > deleted file mode 100644
> > > index 8aa2091444..0000000000
> > > --- a/meta/recipes-
> > > bsp/grub/files/6643507ce30f775008e093580f0c9499dfb2c485.patch
> > > +++ /dev/null
> > > @@ -1,47 +0,0 @@
> > > -From 6643507ce30f775008e093580f0c9499dfb2c485 Mon Sep 17 00:00:00
> > > 2001
> > > -From: Simon Hardy <simon.hardy@itdev.co.uk>
> > > -Date: Tue, 24 Mar 2020 13:29:12 +0000
> > > -Subject: build: Fix GRUB i386-pc build with Ubuntu gcc
> > > -
> > > -With recent versions of gcc on Ubuntu a very large
> > > lzma_decompress.img file is
> > > -output. (e.g. 134479600 bytes instead of 2864.) This causes grub-
> > > mkimage to
> > > -fail with: "error: Decompressor is too big."
> > > -
> > > -This seems to be caused by a section .note.gnu.property that is
> > > placed at an
> > > -offset such that objcopy needs to pad the img file with zeros.
> > > -
> > > -This issue is present on:
> > > -Ubuntu 19.10 with gcc (Ubuntu 8.3.0-26ubuntu1~19.10) 8.3.0
> > > -Ubuntu 19.10 with gcc (Ubuntu 9.2.1-9ubuntu2) 9.2.1 20191008
> > > -
> > > -This issue is not present on:
> > > -Ubuntu 19.10 with gcc (Ubuntu 7.5.0-3ubuntu1~19.10) 7.5.0
> > > -RHEL 8.0 with gcc 8.3.1 20190507 (Red Hat 8.3.1-4)
> > > -
> > > -The issue can be fixed by removing the section using objcopy as
> > > shown in
> > > -this patch.
> > > -
> > > -Signed-off-by: Simon Hardy <simon.hardy@itdev.co.uk>
> > > -Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> > > ----
> > > - gentpl.py | 2 +-
> > > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > > -
> > > -Upstream-Status: Backport
> > > -
> > > -diff --git a/gentpl.py b/gentpl.py
> > > -index 387588c05..c86550d4f 100644
> > > ---- a/gentpl.py
> > > -+++ b/gentpl.py
> > > -@@ -766,7 +766,7 @@ def image(defn, platform):
> > > - if test x$(TARGET_APPLE_LINKER) = x1; then \
> > > -   $(MACHO2IMG) $< $@; \
> > > - else \
> > > --  $(TARGET_OBJCOPY) $(""" + cname(defn) + """_OBJCOPYFLAGS) --
> > > strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R
> > > .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R
> > > .ARM.exidx $< $@; \
> > > -+  $(TARGET_OBJCOPY) $(""" + cname(defn) + """_OBJCOPYFLAGS) --
> > > strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R
> > > .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R
> > > .note.gnu.property -R .ARM.exidx $< $@; \
> > > - fi
> > > - """)
> > > -
> > > ---
> > > -cgit v1.2.1
> > > -
> > > diff --git a/meta/recipes-bsp/grub/files/CVE-2020-10713.patch
> > > b/meta/recipes-bsp/grub/files/CVE-2020-10713.patch
> > > deleted file mode 100644
> > > index c507ed3ea8..0000000000
> > > --- a/meta/recipes-bsp/grub/files/CVE-2020-10713.patch
> > > +++ /dev/null
> > > @@ -1,73 +0,0 @@
> > > -From a4d3fbdff1e3ca8f87642af2ac8752c30c617a3e Mon Sep 17 00:00:00
> > > 2001
> > > -From: Peter Jones <pjones@redhat.com>
> > > -Date: Wed, 15 Apr 2020 15:45:02 -0400
> > > -Subject: yylex: Make lexer fatal errors actually be fatal
> > > -
> > > -When presented with a command that can't be tokenized to anything
> > > -smaller than YYLMAX characters, the parser calls
> > > YY_FATAL_ERROR(errmsg),
> > > -expecting that will stop further processing, as such:
> > > -
> > > -  #define YY_DO_BEFORE_ACTION \
> > > -        yyg->yytext_ptr = yy_bp; \
> > > -        yyleng = (int) (yy_cp - yy_bp); \
> > > -        yyg->yy_hold_char = *yy_cp; \
> > > -        *yy_cp = '\0'; \
> > > -        if ( yyleng >= YYLMAX ) \
> > > -                YY_FATAL_ERROR( "token too large, exceeds YYLMAX" );
> > > \
> > > -        yy_flex_strncpy( yytext, yyg->yytext_ptr, yyleng + 1 ,
> > > yyscanner); \
> > > -        yyg->yy_c_buf_p = yy_cp;
> > > -
> > > -The code flex generates expects that YY_FATAL_ERROR() will either
> > > return
> > > -for it or do some form of longjmp(), or handle the error in some way
> > > at
> > > -least, and so the strncpy() call isn't in an "else" clause, and thus
> > > if
> > > -YY_FATAL_ERROR() is *not* actually fatal, it does the call with the
> > > -questionable limit, and predictable results ensue.
> > > -
> > > -Unfortunately, our implementation of YY_FATAL_ERROR() is:
> > > -
> > > -   #define YY_FATAL_ERROR(msg)                     \
> > > -     do {                                          \
> > > -       grub_printf (_("fatal error: %s\n"), _(msg));     \
> > > -     } while (0)
> > > -
> > > -The same pattern exists in yyless(), and similar problems exist in
> > > users
> > > -of YY_INPUT(), several places in the main parsing loop,
> > > -yy_get_next_buffer(), yy_load_buffer_state(), yyensure_buffer_stack,
> > > -yy_scan_buffer(), etc.
> > > -
> > > -All of these callers expect YY_FATAL_ERROR() to actually be fatal,
> > > and
> > > -the things they do if it returns after calling it are wildly unsafe.
> > > -
> > > -Fixes: CVE-2020-10713
> > > -
> > > -Signed-off-by: Peter Jones <pjones@redhat.com>
> > > -Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> > > -
> > > -Upstream-Status: Backport
> > > [
> https://git.savannah.gnu.org/cgit/grub.git/commit/?id=a4d3fbdff1e3ca8f87642af2ac8752c30c617a3e
> > > ]
> > > -CVE: CVE-2020-10713
> > > -Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
> > > ----
> > > - grub-core/script/yylex.l | 4 ++--
> > > - 1 file changed, 2 insertions(+), 2 deletions(-)
> > > -
> > > -diff --git a/grub-core/script/yylex.l b/grub-core/script/yylex.l
> > > -index 7b44c37b7..b7203c823 100644
> > > ---- a/grub-core/script/yylex.l
> > > -+++ b/grub-core/script/yylex.l
> > > -@@ -37,11 +37,11 @@
> > > -
> > > - /*
> > > -  * As we don't have access to yyscanner, we cannot do much except
> > > to
> > > -- * print the fatal error.
> > > -+ * print the fatal error and exit.
> > > -  */
> > > - #define YY_FATAL_ERROR(msg)                     \
> > > -   do {                                          \
> > > --    grub_printf (_("fatal error: %s\n"), _(msg));     \
> > > -+    grub_fatal (_("fatal error: %s\n"), _(msg));\
> > > -   } while (0)
> > > -
> > > - #define COPY(str, hint)                         \
> > > ---
> > > -cgit v1.2.1
> > > -
> > > diff --git a/meta/recipes-bsp/grub/files/CVE-2020-14308-calloc-Use-
> > > calloc-at-most-places.patch b/meta/recipes-bsp/grub/files/CVE-2020-
> > > 14308-calloc-Use-calloc-at-most-places.patch
> > > deleted file mode 100644
> > > index 637e368cb0..0000000000
> > > --- a/meta/recipes-bsp/grub/files/CVE-2020-14308-calloc-Use-calloc-
> > > at-most-places.patch
> > > +++ /dev/null
> > > @@ -1,1863 +0,0 @@
> > > -From bcdd6a55952222ec9829a59348240a4f983b0b56 Mon Sep 17 00:00:00
> > > 2001
> > > -From: Peter Jones <pjones@redhat.com>
> > > -Date: Mon, 15 Jun 2020 12:26:01 -0400
> > > -Subject: [PATCH 4/9] calloc: Use calloc() at most places
> > > -
> > > -This modifies most of the places we do some form of:
> > > -
> > > -  X = malloc(Y * Z);
> > > -
> > > -to use calloc(Y, Z) instead.
> > > -
> > > -Among other issues, this fixes:
> > > -  - allocation of integer overflow in grub_png_decode_image_header()
> > > -    reported by Chris Coulson,
> > > -  - allocation of integer overflow in luks_recover_key()
> > > -    reported by Chris Coulson,
> > > -  - allocation of integer overflow in grub_lvm_detect()
> > > -    reported by Chris Coulson.
> > > -
> > > -Fixes: CVE-2020-14308
> > > -
> > > -Signed-off-by: Peter Jones <pjones@redhat.com>
> > > -Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> > > -
> > > -Upstream-Status: Backport
> > > -CVE: CVE-2020-14308
> > > -
> > > -Reference to upstream patch:
> > > -
> > >
> https://git.savannah.gnu.org/cgit/grub.git/commit/?id=f725fa7cb2ece547c5af01eeeecfe8d95802ed41
> > > -
> > > -[YL: don't patch on grub-core/lib/json/json.c, which is not existing
> > > in grub 2.04]
> > > -Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
> > > ----
> > > - grub-core/bus/usb/usbhub.c                |  8 ++++----
> > > - grub-core/commands/efi/lsefisystab.c      |  3 ++-
> > > - grub-core/commands/legacycfg.c            |  6 +++---
> > > - grub-core/commands/menuentry.c            |  2 +-
> > > - grub-core/commands/nativedisk.c           |  2 +-
> > > - grub-core/commands/parttool.c             | 12 +++++++++---
> > > - grub-core/commands/regexp.c               |  2 +-
> > > - grub-core/commands/search_wrap.c          |  2 +-
> > > - grub-core/disk/diskfilter.c               |  4 ++--
> > > - grub-core/disk/ieee1275/ofdisk.c          |  2 +-
> > > - grub-core/disk/ldm.c                      | 14 +++++++-------
> > > - grub-core/disk/luks.c                     |  2 +-
> > > - grub-core/disk/lvm.c                      | 12 ++++++------
> > > - grub-core/disk/xen/xendisk.c              |  2 +-
> > > - grub-core/efiemu/loadcore.c               |  2 +-
> > > - grub-core/efiemu/mm.c                     |  6 +++---
> > > - grub-core/font/font.c                     |  3 +--
> > > - grub-core/fs/affs.c                       |  6 +++---
> > > - grub-core/fs/btrfs.c                      |  6 +++---
> > > - grub-core/fs/hfs.c                        |  2 +-
> > > - grub-core/fs/hfsplus.c                    |  6 +++---
> > > - grub-core/fs/iso9660.c                    |  2 +-
> > > - grub-core/fs/ntfs.c                       |  4 ++--
> > > - grub-core/fs/sfs.c                        |  2 +-
> > > - grub-core/fs/tar.c                        |  2 +-
> > > - grub-core/fs/udf.c                        |  4 ++--
> > > - grub-core/fs/zfs/zfs.c                    |  4 ++--
> > > - grub-core/gfxmenu/gui_string_util.c       |  2 +-
> > > - grub-core/gfxmenu/widget-box.c            |  4 ++--
> > > - grub-core/io/gzio.c                       |  2 +-
> > > - grub-core/kern/efi/efi.c                  |  6 +++---
> > > - grub-core/kern/emu/hostdisk.c             |  2 +-
> > > - grub-core/kern/fs.c                       |  2 +-
> > > - grub-core/kern/misc.c                     |  2 +-
> > > - grub-core/kern/parser.c                   |  2 +-
> > > - grub-core/kern/uboot/uboot.c              |  2 +-
> > > - grub-core/lib/libgcrypt/cipher/ac.c       |  8 ++++----
> > > - grub-core/lib/libgcrypt/cipher/primegen.c |  4 ++--
> > > - grub-core/lib/libgcrypt/cipher/pubkey.c   |  4 ++--
> > > - grub-core/lib/priority_queue.c            |  2 +-
> > > - grub-core/lib/reed_solomon.c              |  7 +++----
> > > - grub-core/lib/relocator.c                 | 10 +++++-----
> > > - grub-core/lib/zstd/fse_decompress.c       |  2 +-
> > > - grub-core/loader/arm/linux.c              |  2 +-
> > > - grub-core/loader/efi/chainloader.c        |  2 +-
> > > - grub-core/loader/i386/bsdXX.c             |  2 +-
> > > - grub-core/loader/i386/xnu.c               |  4 ++--
> > > - grub-core/loader/macho.c                  |  2 +-
> > > - grub-core/loader/multiboot_elfxx.c        |  2 +-
> > > - grub-core/loader/xnu.c                    |  2 +-
> > > - grub-core/mmap/mmap.c                     |  4 ++--
> > > - grub-core/net/bootp.c                     |  2 +-
> > > - grub-core/net/dns.c                       | 10 +++++-----
> > > - grub-core/net/net.c                       |  4 ++--
> > > - grub-core/normal/charset.c                | 10 +++++-----
> > > - grub-core/normal/cmdline.c                | 14 +++++++-------
> > > - grub-core/normal/menu_entry.c             | 14 +++++++-------
> > > - grub-core/normal/menu_text.c              |  4 ++--
> > > - grub-core/normal/term.c                   |  4 ++--
> > > - grub-core/osdep/linux/getroot.c           |  6 +++---
> > > - grub-core/osdep/unix/config.c             |  2 +-
> > > - grub-core/osdep/windows/getroot.c         |  2 +-
> > > - grub-core/osdep/windows/hostdisk.c        |  4 ++--
> > > - grub-core/osdep/windows/init.c            |  2 +-
> > > - grub-core/osdep/windows/platform.c        |  4 ++--
> > > - grub-core/osdep/windows/relpath.c         |  2 +-
> > > - grub-core/partmap/gpt.c                   |  2 +-
> > > - grub-core/partmap/msdos.c                 |  2 +-
> > > - grub-core/script/execute.c                |  2 +-
> > > - grub-core/tests/fake_input.c              |  2 +-
> > > - grub-core/tests/video_checksum.c          |  6 +++---
> > > - grub-core/video/capture.c                 |  2 +-
> > > - grub-core/video/emu/sdl.c                 |  2 +-
> > > - grub-core/video/i386/pc/vga.c             |  2 +-
> > > - grub-core/video/readers/png.c             |  2 +-
> > > - include/grub/unicode.h                    |  4 ++--
> > > - util/getroot.c                            |  2 +-
> > > - util/grub-file.c                          |  2 +-
> > > - util/grub-fstest.c                        |  4 ++--
> > > - util/grub-install-common.c                |  2 +-
> > > - util/grub-install.c                       |  4 ++--
> > > - util/grub-mkimagexx.c                     |  6 ++----
> > > - util/grub-mkrescue.c                      |  4 ++--
> > > - util/grub-mkstandalone.c                  |  2 +-
> > > - util/grub-pe2elf.c                        | 12 +++++-------
> > > - util/grub-probe.c                         |  4 ++--
> > > - 86 files changed, 178 insertions(+), 177 deletions(-)
> > > -
> > > -diff --git a/grub-core/bus/usb/usbhub.c b/grub-core/bus/usb/usbhub.c
> > > -index 34a7ff1..a06cce3 100644
> > > ---- a/grub-core/bus/usb/usbhub.c
> > > -+++ b/grub-core/bus/usb/usbhub.c
> > > -@@ -149,8 +149,8 @@ grub_usb_add_hub (grub_usb_device_t dev)
> > > -   grub_usb_set_configuration (dev, 1);
> > > -
> > > -   dev->nports = hubdesc.portcnt;
> > > --  dev->children = grub_zalloc (hubdesc.portcnt * sizeof (dev-
> > > > children[0]));
> > > --  dev->ports = grub_zalloc (dev->nports * sizeof (dev->ports[0]));
> > > -+  dev->children = grub_calloc (hubdesc.portcnt, sizeof (dev-
> > > > children[0]));
> > > -+  dev->ports = grub_calloc (dev->nports, sizeof (dev->ports[0]));
> > > -   if (!dev->children || !dev->ports)
> > > -     {
> > > -       grub_free (dev->children);
> > > -@@ -268,8 +268,8 @@ grub_usb_controller_dev_register_iter
> > > (grub_usb_controller_t controller, void *d
> > > -
> > > -   /* Query the number of ports the root Hub has.  */
> > > -   hub->nports = controller->dev->hubports (controller);
> > > --  hub->devices = grub_zalloc (sizeof (hub->devices[0]) * hub-
> > > > nports);
> > > --  hub->ports = grub_zalloc (sizeof (hub->ports[0]) * hub->nports);
> > > -+  hub->devices = grub_calloc (hub->nports, sizeof (hub-
> > > > devices[0]));
> > > -+  hub->ports = grub_calloc (hub->nports, sizeof (hub->ports[0]));
> > > -   if (!hub->devices || !hub->ports)
> > > -     {
> > > -       grub_free (hub->devices);
> > > -diff --git a/grub-core/commands/efi/lsefisystab.c b/grub-
> > > core/commands/efi/lsefisystab.c
> > > -index df10302..cd81507 100644
> > > ---- a/grub-core/commands/efi/lsefisystab.c
> > > -+++ b/grub-core/commands/efi/lsefisystab.c
> > > -@@ -71,7 +71,8 @@ grub_cmd_lsefisystab (struct grub_command *cmd
> > > __attribute__ ((unused)),
> > > -     grub_printf ("Vendor: ");
> > > -
> > > -     for (vendor_utf16 = st->firmware_vendor; *vendor_utf16;
> > > vendor_utf16++);
> > > --    vendor = grub_malloc (4 * (vendor_utf16 - st->firmware_vendor)
> > > + 1);
> > > -+    /* Allocate extra 3 bytes to simplify math. */
> > > -+    vendor = grub_calloc (4, vendor_utf16 - st->firmware_vendor +
> > > 1);
> > > -     if (!vendor)
> > > -       return grub_errno;
> > > -     *grub_utf16_to_utf8 ((grub_uint8_t *) vendor, st-
> > > > firmware_vendor,
> > > -diff --git a/grub-core/commands/legacycfg.c b/grub-
> > > core/commands/legacycfg.c
> > > -index db7a8f0..5e3ec0d 100644
> > > ---- a/grub-core/commands/legacycfg.c
> > > -+++ b/grub-core/commands/legacycfg.c
> > > -@@ -314,7 +314,7 @@ grub_cmd_legacy_kernel (struct grub_command
> > > *mycmd __attribute__ ((unused)),
> > > -   if (argc < 2)
> > > -     return grub_error (GRUB_ERR_BAD_ARGUMENT, N_("filename
> > > expected"));
> > > -
> > > --  cutargs = grub_malloc (sizeof (cutargs[0]) * (argc - 1));
> > > -+  cutargs = grub_calloc (argc - 1, sizeof (cutargs[0]));
> > > -   if (!cutargs)
> > > -     return grub_errno;
> > > -   cutargc = argc - 1;
> > > -@@ -436,7 +436,7 @@ grub_cmd_legacy_kernel (struct grub_command
> > > *mycmd __attribute__ ((unused)),
> > > -           {
> > > -             char rbuf[3] = "-r";
> > > -             bsdargc = cutargc + 2;
> > > --            bsdargs = grub_malloc (sizeof (bsdargs[0]) * bsdargc);
> > > -+            bsdargs = grub_calloc (bsdargc, sizeof (bsdargs[0]));
> > > -             if (!bsdargs)
> > > -               {
> > > -                 err = grub_errno;
> > > -@@ -559,7 +559,7 @@ grub_cmd_legacy_initrdnounzip (struct
> > > grub_command *mycmd __attribute__ ((unused
> > > -       return grub_error (GRUB_ERR_BAD_ARGUMENT, N_("can't find
> > > command `%s'"),
> > > -                          "module");
> > > -
> > > --      newargs = grub_malloc ((argc + 1) * sizeof (newargs[0]));
> > > -+      newargs = grub_calloc (argc + 1, sizeof (newargs[0]));
> > > -       if (!newargs)
> > > -       return grub_errno;
> > > -       grub_memcpy (newargs + 1, args, argc * sizeof (newargs[0]));
> > > -diff --git a/grub-core/commands/menuentry.c b/grub-
> > > core/commands/menuentry.c
> > > -index 2c5363d..9164df7 100644
> > > ---- a/grub-core/commands/menuentry.c
> > > -+++ b/grub-core/commands/menuentry.c
> > > -@@ -154,7 +154,7 @@ grub_normal_add_menu_entry (int argc, const char
> > > **args,
> > > -     goto fail;
> > > -
> > > -   /* Save argc, args to pass as parameters to block arg later. */
> > > --  menu_args = grub_malloc (sizeof (char*) * (argc + 1));
> > > -+  menu_args = grub_calloc (argc + 1, sizeof (char *));
> > > -   if (! menu_args)
> > > -     goto fail;
> > > -
> > > -diff --git a/grub-core/commands/nativedisk.c b/grub-
> > > core/commands/nativedisk.c
> > > -index 699447d..7c8f97f 100644
> > > ---- a/grub-core/commands/nativedisk.c
> > > -+++ b/grub-core/commands/nativedisk.c
> > > -@@ -195,7 +195,7 @@ grub_cmd_nativedisk (grub_command_t cmd
> > > __attribute__ ((unused)),
> > > -   else
> > > -     path_prefix = prefix;
> > > -
> > > --  mods = grub_malloc (argc * sizeof (mods[0]));
> > > -+  mods = grub_calloc (argc, sizeof (mods[0]));
> > > -   if (!mods)
> > > -     return grub_errno;
> > > -
> > > -diff --git a/grub-core/commands/parttool.c b/grub-
> > > core/commands/parttool.c
> > > -index 22b46b1..051e313 100644
> > > ---- a/grub-core/commands/parttool.c
> > > -+++ b/grub-core/commands/parttool.c
> > > -@@ -59,7 +59,13 @@ grub_parttool_register(const char *part_name,
> > > -   for (nargs = 0; args[nargs].name != 0; nargs++);
> > > -   cur->nargs = nargs;
> > > -   cur->args = (struct grub_parttool_argdesc *)
> > > --    grub_malloc ((nargs + 1) * sizeof (struct
> > > grub_parttool_argdesc));
> > > -+    grub_calloc (nargs + 1, sizeof (struct grub_parttool_argdesc));
> > > -+  if (!cur->args)
> > > -+    {
> > > -+      grub_free (cur);
> > > -+      curhandle--;
> > > -+      return -1;
> > > -+    }
> > > -   grub_memcpy (cur->args, args,
> > > -              (nargs + 1) * sizeof (struct grub_parttool_argdesc));
> > > -
> > > -@@ -257,7 +263,7 @@ grub_cmd_parttool (grub_command_t cmd
> > > __attribute__ ((unused)),
> > > -       return err;
> > > -       }
> > > -
> > > --  parsed = (int *) grub_zalloc (argc * sizeof (int));
> > > -+  parsed = (int *) grub_calloc (argc, sizeof (int));
> > > -
> > > -   for (i = 1; i < argc; i++)
> > > -     if (! parsed[i])
> > > -@@ -290,7 +296,7 @@ grub_cmd_parttool (grub_command_t cmd
> > > __attribute__ ((unused)),
> > > -         }
> > > -       ptool = cur;
> > > -       pargs = (struct grub_parttool_args *)
> > > --        grub_zalloc (ptool->nargs * sizeof (struct
> > > grub_parttool_args));
> > > -+        grub_calloc (ptool->nargs, sizeof (struct
> > > grub_parttool_args));
> > > -       for (j = i; j < argc; j++)
> > > -         if (! parsed[j])
> > > -           {
> > > -diff --git a/grub-core/commands/regexp.c b/grub-
> > > core/commands/regexp.c
> > > -index f00b184..4019164 100644
> > > ---- a/grub-core/commands/regexp.c
> > > -+++ b/grub-core/commands/regexp.c
> > > -@@ -116,7 +116,7 @@ grub_cmd_regexp (grub_extcmd_context_t ctxt, int
> > > argc, char **args)
> > > -   if (ret)
> > > -     goto fail;
> > > -
> > > --  matches = grub_zalloc (sizeof (*matches) * (regex.re_nsub + 1));
> > > -+  matches = grub_calloc (regex.re_nsub + 1, sizeof (*matches));
> > > -   if (! matches)
> > > -     goto fail;
> > > -
> > > -diff --git a/grub-core/commands/search_wrap.c b/grub-
> > > core/commands/search_wrap.c
> > > -index d7fd26b..47fc8eb 100644
> > > ---- a/grub-core/commands/search_wrap.c
> > > -+++ b/grub-core/commands/search_wrap.c
> > > -@@ -122,7 +122,7 @@ grub_cmd_search (grub_extcmd_context_t ctxt, int
> > > argc, char **args)
> > > -     for (i = 0; state[SEARCH_HINT_BAREMETAL].args[i]; i++)
> > > -       nhints++;
> > > -
> > > --  hints = grub_malloc (sizeof (hints[0]) * nhints);
> > > -+  hints = grub_calloc (nhints, sizeof (hints[0]));
> > > -   if (!hints)
> > > -     return grub_errno;
> > > -   j = 0;
> > > -diff --git a/grub-core/disk/diskfilter.c b/grub-
> > > core/disk/diskfilter.c
> > > -index c3b578a..68ca9e0 100644
> > > ---- a/grub-core/disk/diskfilter.c
> > > -+++ b/grub-core/disk/diskfilter.c
> > > -@@ -1134,7 +1134,7 @@ grub_diskfilter_make_raid (grub_size_t
> > > uuidlen, char *uuid, int nmemb,
> > > -   array->lvs->segments->node_count = nmemb;
> > > -   array->lvs->segments->raid_member_size = disk_size;
> > > -   array->lvs->segments->nodes
> > > --    = grub_zalloc (nmemb * sizeof (array->lvs->segments-
> > > > nodes[0]));
> > > -+    = grub_calloc (nmemb, sizeof (array->lvs->segments->nodes[0]));
> > > -   array->lvs->segments->stripe_size = stripe_size;
> > > -   for (i = 0; i < nmemb; i++)
> > > -     {
> > > -@@ -1226,7 +1226,7 @@ insert_array (grub_disk_t disk, const struct
> > > grub_diskfilter_pv_id *id,
> > > -         grub_partition_t p;
> > > -         for (p = disk->partition; p; p = p->parent)
> > > -           s++;
> > > --        pv->partmaps = xmalloc (s * sizeof (pv->partmaps[0]));
> > > -+        pv->partmaps = xcalloc (s, sizeof (pv->partmaps[0]));
> > > -         s = 0;
> > > -         for (p = disk->partition; p; p = p->parent)
> > > -           pv->partmaps[s++] = xstrdup (p->partmap->name);
> > > -diff --git a/grub-core/disk/ieee1275/ofdisk.c b/grub-
> > > core/disk/ieee1275/ofdisk.c
> > > -index f73257e..03674cb 100644
> > > ---- a/grub-core/disk/ieee1275/ofdisk.c
> > > -+++ b/grub-core/disk/ieee1275/ofdisk.c
> > > -@@ -297,7 +297,7 @@ dev_iterate (const struct grub_ieee1275_devalias
> > > *alias)
> > > -       /* Power machines documentation specify 672 as maximum SAS
> > > disks in
> > > -          one system. Using a slightly larger value to be safe. */
> > > -       table_size = 768;
> > > --      table = grub_malloc (table_size * sizeof (grub_uint64_t));
> > > -+      table = grub_calloc (table_size, sizeof (grub_uint64_t));
> > > -
> > > -       if (!table)
> > > -         {
> > > -diff --git a/grub-core/disk/ldm.c b/grub-core/disk/ldm.c
> > > -index 2a22d2d..e632370 100644
> > > ---- a/grub-core/disk/ldm.c
> > > -+++ b/grub-core/disk/ldm.c
> > > -@@ -323,8 +323,8 @@ make_vg (grub_disk_t disk,
> > > -         lv->segments->type = GRUB_DISKFILTER_MIRROR;
> > > -         lv->segments->node_count = 0;
> > > -         lv->segments->node_alloc = 8;
> > > --        lv->segments->nodes = grub_zalloc (sizeof (*lv->segments-
> > > > nodes)
> > > --                                           * lv->segments-
> > > > node_alloc);
> > > -+        lv->segments->nodes = grub_calloc (lv->segments-
> > > > node_alloc,
> > > -+                                           sizeof (*lv->segments-
> > > > nodes));
> > > -         if (!lv->segments->nodes)
> > > -           goto fail2;
> > > -         ptr = vblk[i].dynamic;
> > > -@@ -543,8 +543,8 @@ make_vg (grub_disk_t disk,
> > > -           {
> > > -             comp->segment_alloc = 8;
> > > -             comp->segment_count = 0;
> > > --            comp->segments = grub_malloc (sizeof (*comp->segments)
> > > --                                          * comp->segment_alloc);
> > > -+            comp->segments = grub_calloc (comp->segment_alloc,
> > > -+                                          sizeof (*comp-
> > > > segments));
> > > -             if (!comp->segments)
> > > -               goto fail2;
> > > -           }
> > > -@@ -590,8 +590,8 @@ make_vg (grub_disk_t disk,
> > > -               }
> > > -             comp->segments->node_count = read_int (ptr + 1, *ptr);
> > > -             comp->segments->node_alloc = comp->segments-
> > > > node_count;
> > > --            comp->segments->nodes = grub_zalloc (sizeof (*comp-
> > > > segments->nodes)
> > > --                                                 * comp->segments-
> > > > node_alloc);
> > > -+            comp->segments->nodes = grub_calloc (comp->segments-
> > > > node_alloc,
> > > -+                                                 sizeof (*comp-
> > > > segments->nodes));
> > > -             if (!lv->segments->nodes)
> > > -               goto fail2;
> > > -           }
> > > -@@ -1017,7 +1017,7 @@ grub_util_ldm_embed (struct grub_disk *disk,
> > > unsigned int *nsectors,
> > > -       *nsectors = lv->size;
> > > -       if (*nsectors > max_nsectors)
> > > -       *nsectors = max_nsectors;
> > > --      *sectors = grub_malloc (*nsectors * sizeof (**sectors));
> > > -+      *sectors = grub_calloc (*nsectors, sizeof (**sectors));
> > > -       if (!*sectors)
> > > -       return grub_errno;
> > > -       for (i = 0; i < *nsectors; i++)
> > > -diff --git a/grub-core/disk/luks.c b/grub-core/disk/luks.c
> > > -index 86c50c6..18b3a8b 100644
> > > ---- a/grub-core/disk/luks.c
> > > -+++ b/grub-core/disk/luks.c
> > > -@@ -336,7 +336,7 @@ luks_recover_key (grub_disk_t source,
> > > -       && grub_be_to_cpu32 (header.keyblock[i].stripes) >
> > > max_stripes)
> > > -       max_stripes = grub_be_to_cpu32 (header.keyblock[i].stripes);
> > > -
> > > --  split_key = grub_malloc (keysize * max_stripes);
> > > -+  split_key = grub_calloc (keysize, max_stripes);
> > > -   if (!split_key)
> > > -     return grub_errno;
> > > -
> > > -diff --git a/grub-core/disk/lvm.c b/grub-core/disk/lvm.c
> > > -index dc6b83b..7b5fbbc 100644
> > > ---- a/grub-core/disk/lvm.c
> > > -+++ b/grub-core/disk/lvm.c
> > > -@@ -209,7 +209,7 @@ grub_lvm_detect (grub_disk_t disk,
> > > -      first one.  */
> > > -
> > > -   /* Allocate buffer space for the circular worst-case scenario. */
> > > --  metadatabuf = grub_malloc (2 * mda_size);
> > > -+  metadatabuf = grub_calloc (2, mda_size);
> > > -   if (! metadatabuf)
> > > -     goto fail;
> > > -
> > > -@@ -464,7 +464,7 @@ grub_lvm_detect (grub_disk_t disk,
> > > - #endif
> > > -                 goto lvs_fail;
> > > -               }
> > > --            lv->segments = grub_zalloc (sizeof (*seg) * lv-
> > > > segment_count);
> > > -+            lv->segments = grub_calloc (lv->segment_count, sizeof
> > > (*seg));
> > > -             seg = lv->segments;
> > > -
> > > -             for (i = 0; i < lv->segment_count; i++)
> > > -@@ -521,8 +521,8 @@ grub_lvm_detect (grub_disk_t disk,
> > > -                     if (seg->node_count != 1)
> > > -                       seg->stripe_size = grub_lvm_getvalue (&p,
> > > "stripe_size = ");
> > > -
> > > --                    seg->nodes = grub_zalloc (sizeof (*stripe)
> > > --                                              * seg->node_count);
> > > -+                    seg->nodes = grub_calloc (seg->node_count,
> > > -+                                              sizeof (*stripe));
> > > -                     stripe = seg->nodes;
> > > -
> > > -                     p = grub_strstr (p, "stripes = [");
> > > -@@ -898,7 +898,7 @@ grub_lvm_detect (grub_disk_t disk,
> > > -               break;
> > > -           if (lv)
> > > -             {
> > > --              cache->lv->segments = grub_malloc (lv->segment_count
> > > * sizeof (*lv->segments));
> > > -+              cache->lv->segments = grub_calloc (lv->segment_count,
> > > sizeof (*lv->segments));
> > > -               if (!cache->lv->segments)
> > > -                 {
> > > -                   grub_lvm_free_cache_lvs (cache_lvs);
> > > -@@ -911,7 +911,7 @@ grub_lvm_detect (grub_disk_t disk,
> > > -                   struct grub_diskfilter_node *nodes = lv-
> > > > segments[i].nodes;
> > > -                   grub_size_t node_count = lv-
> > > > segments[i].node_count;
> > > -
> > > --                  cache->lv->segments[i].nodes = grub_malloc
> > > (node_count * sizeof (*nodes));
> > > -+                  cache->lv->segments[i].nodes = grub_calloc
> > > (node_count, sizeof (*nodes));
> > > -                   if (!cache->lv->segments[i].nodes)
> > > -                     {
> > > -                       for (j = 0; j < i; ++j)
> > > -diff --git a/grub-core/disk/xen/xendisk.c b/grub-
> > > core/disk/xen/xendisk.c
> > > -index 48476cb..d6612ee 100644
> > > ---- a/grub-core/disk/xen/xendisk.c
> > > -+++ b/grub-core/disk/xen/xendisk.c
> > > -@@ -426,7 +426,7 @@ grub_xendisk_init (void)
> > > -   if (!ctr)
> > > -     return;
> > > -
> > > --  virtdisks = grub_malloc (ctr * sizeof (virtdisks[0]));
> > > -+  virtdisks = grub_calloc (ctr, sizeof (virtdisks[0]));
> > > -   if (!virtdisks)
> > > -     return;
> > > -   if (grub_xenstore_dir ("device/vbd", fill, &ctr))
> > > -diff --git a/grub-core/efiemu/loadcore.c b/grub-
> > > core/efiemu/loadcore.c
> > > -index 44085ef..2b92462 100644
> > > ---- a/grub-core/efiemu/loadcore.c
> > > -+++ b/grub-core/efiemu/loadcore.c
> > > -@@ -201,7 +201,7 @@ grub_efiemu_count_symbols (const Elf_Ehdr *e)
> > > -
> > > -   grub_efiemu_nelfsyms = (unsigned) s->sh_size / (unsigned) s-
> > > > sh_entsize;
> > > -   grub_efiemu_elfsyms = (struct grub_efiemu_elf_sym *)
> > > --    grub_malloc (sizeof (struct grub_efiemu_elf_sym) *
> > > grub_efiemu_nelfsyms);
> > > -+    grub_calloc (grub_efiemu_nelfsyms, sizeof (struct
> > > grub_efiemu_elf_sym));
> > > -
> > > -   /* Relocators */
> > > -   for (i = 0, s = (Elf_Shdr *) ((char *) e + e->e_shoff);
> > > -diff --git a/grub-core/efiemu/mm.c b/grub-core/efiemu/mm.c
> > > -index 52a032f..9b8e0d0 100644
> > > ---- a/grub-core/efiemu/mm.c
> > > -+++ b/grub-core/efiemu/mm.c
> > > -@@ -554,11 +554,11 @@ grub_efiemu_mmap_sort_and_uniq (void)
> > > -   /* Initialize variables*/
> > > -   grub_memset (present, 0, sizeof (int) *
> > > GRUB_EFI_MAX_MEMORY_TYPE);
> > > -   scanline_events = (struct grub_efiemu_mmap_scan *)
> > > --    grub_malloc (sizeof (struct grub_efiemu_mmap_scan) * 2 *
> > > mmap_num);
> > > -+    grub_calloc (mmap_num, sizeof (struct grub_efiemu_mmap_scan) *
> > > 2);
> > > -
> > > -   /* Number of chunks can't increase more than by factor of 2 */
> > > -   result = (grub_efi_memory_descriptor_t *)
> > > --    grub_malloc (sizeof (grub_efi_memory_descriptor_t) * 2 *
> > > mmap_num);
> > > -+    grub_calloc (mmap_num, sizeof (grub_efi_memory_descriptor_t) *
> > > 2);
> > > -   if (!result || !scanline_events)
> > > -     {
> > > -       grub_free (result);
> > > -@@ -660,7 +660,7 @@ grub_efiemu_mm_do_alloc (void)
> > > -
> > > -   /* Preallocate mmap */
> > > -   efiemu_mmap = (grub_efi_memory_descriptor_t *)
> > > --    grub_malloc (mmap_reserved_size * sizeof
> > > (grub_efi_memory_descriptor_t));
> > > -+    grub_calloc (mmap_reserved_size, sizeof
> > > (grub_efi_memory_descriptor_t));
> > > -   if (!efiemu_mmap)
> > > -     {
> > > -       grub_efiemu_unload ();
> > > -diff --git a/grub-core/font/font.c b/grub-core/font/font.c
> > > -index 85a2925..8e118b3 100644
> > > ---- a/grub-core/font/font.c
> > > -+++ b/grub-core/font/font.c
> > > -@@ -293,8 +293,7 @@ load_font_index (grub_file_t file, grub_uint32_t
> > > sect_length, struct
> > > -   font->num_chars = sect_length / FONT_CHAR_INDEX_ENTRY_SIZE;
> > > -
> > > -   /* Allocate the character index array.  */
> > > --  font->char_index = grub_malloc (font->num_chars
> > > --                                * sizeof (struct
> > > char_index_entry));
> > > -+  font->char_index = grub_calloc (font->num_chars, sizeof (struct
> > > char_index_entry));
> > > -   if (!font->char_index)
> > > -     return 1;
> > > -   font->bmp_idx = grub_malloc (0x10000 * sizeof (grub_uint16_t));
> > > -diff --git a/grub-core/fs/affs.c b/grub-core/fs/affs.c
> > > -index 6b6a2bc..220b371 100644
> > > ---- a/grub-core/fs/affs.c
> > > -+++ b/grub-core/fs/affs.c
> > > -@@ -301,7 +301,7 @@ grub_affs_read_symlink (grub_fshelp_node_t node)
> > > -       return 0;
> > > -     }
> > > -   latin1[symlink_size] = 0;
> > > --  utf8 = grub_malloc (symlink_size * GRUB_MAX_UTF8_PER_LATIN1 + 1);
> > > -+  utf8 = grub_calloc (GRUB_MAX_UTF8_PER_LATIN1 + 1, symlink_size);
> > > -   if (!utf8)
> > > -     {
> > > -       grub_free (latin1);
> > > -@@ -422,7 +422,7 @@ grub_affs_iterate_dir (grub_fshelp_node_t dir,
> > > -       return 1;
> > > -     }
> > > -
> > > --  hashtable = grub_zalloc (data->htsize * sizeof (*hashtable));
> > > -+  hashtable = grub_calloc (data->htsize, sizeof (*hashtable));
> > > -   if (!hashtable)
> > > -     return 1;
> > > -
> > > -@@ -628,7 +628,7 @@ grub_affs_label (grub_device_t device, char
> > > **label)
> > > -       len = file.namelen;
> > > -       if (len > sizeof (file.name))
> > > -       len = sizeof (file.name);
> > > --      *label = grub_malloc (len * GRUB_MAX_UTF8_PER_LATIN1 + 1);
> > > -+      *label = grub_calloc (GRUB_MAX_UTF8_PER_LATIN1 + 1, len);
> > > -       if (*label)
> > > -       *grub_latin1_to_utf8 ((grub_uint8_t *) *label, file.name,
> > > len) = '\0';
> > > -     }
> > > -diff --git a/grub-core/fs/btrfs.c b/grub-core/fs/btrfs.c
> > > -index 48bd3d0..11272ef 100644
> > > ---- a/grub-core/fs/btrfs.c
> > > -+++ b/grub-core/fs/btrfs.c
> > > -@@ -413,7 +413,7 @@ lower_bound (struct grub_btrfs_data *data,
> > > -     {
> > > -       desc->allocated = 16;
> > > -       desc->depth = 0;
> > > --      desc->data = grub_malloc (sizeof (desc->data[0]) * desc-
> > > > allocated);
> > > -+      desc->data = grub_calloc (desc->allocated, sizeof (desc-
> > > > data[0]));
> > > -       if (!desc->data)
> > > -       return grub_errno;
> > > -     }
> > > -@@ -752,7 +752,7 @@ raid56_read_retry (struct grub_btrfs_data *data,
> > > -   grub_err_t ret = GRUB_ERR_OUT_OF_MEMORY;
> > > -   grub_uint64_t i, failed_devices;
> > > -
> > > --  buffers = grub_zalloc (sizeof(*buffers) * nstripes);
> > > -+  buffers = grub_calloc (nstripes, sizeof (*buffers));
> > > -   if (!buffers)
> > > -     goto cleanup;
> > > -
> > > -@@ -2160,7 +2160,7 @@ grub_btrfs_embed (grub_device_t device
> > > __attribute__ ((unused)),
> > > -   *nsectors = 64 * 2 - 1;
> > > -   if (*nsectors > max_nsectors)
> > > -     *nsectors = max_nsectors;
> > > --  *sectors = grub_malloc (*nsectors * sizeof (**sectors));
> > > -+  *sectors = grub_calloc (*nsectors, sizeof (**sectors));
> > > -   if (!*sectors)
> > > -     return grub_errno;
> > > -   for (i = 0; i < *nsectors; i++)
> > > -diff --git a/grub-core/fs/hfs.c b/grub-core/fs/hfs.c
> > > -index ac0a409..3fe842b 100644
> > > ---- a/grub-core/fs/hfs.c
> > > -+++ b/grub-core/fs/hfs.c
> > > -@@ -1360,7 +1360,7 @@ grub_hfs_label (grub_device_t device, char
> > > **label)
> > > -       grub_size_t len = data->sblock.volname[0];
> > > -       if (len > sizeof (data->sblock.volname) - 1)
> > > -       len = sizeof (data->sblock.volname) - 1;
> > > --      *label = grub_malloc (len * MAX_UTF8_PER_MAC_ROMAN + 1);
> > > -+      *label = grub_calloc (MAX_UTF8_PER_MAC_ROMAN + 1, len);
> > > -       if (*label)
> > > -       macroman_to_utf8 (*label, data->sblock.volname + 1,
> > > -                         len + 1, 0);
> > > -diff --git a/grub-core/fs/hfsplus.c b/grub-core/fs/hfsplus.c
> > > -index 54786bb..dae43be 100644
> > > ---- a/grub-core/fs/hfsplus.c
> > > -+++ b/grub-core/fs/hfsplus.c
> > > -@@ -720,7 +720,7 @@ list_nodes (void *record, void *hook_arg)
> > > -   if (! filename)
> > > -     return 0;
> > > -
> > > --  keyname = grub_malloc (grub_be_to_cpu16 (catkey->namelen) *
> > > sizeof (*keyname));
> > > -+  keyname = grub_calloc (grub_be_to_cpu16 (catkey->namelen), sizeof
> > > (*keyname));
> > > -   if (!keyname)
> > > -     {
> > > -       grub_free (filename);
> > > -@@ -1007,7 +1007,7 @@ grub_hfsplus_label (grub_device_t device, char
> > > **label)
> > > -     grub_hfsplus_btree_recptr (&data->catalog_tree, node, ptr);
> > > -
> > > -   label_len = grub_be_to_cpu16 (catkey->namelen);
> > > --  label_name = grub_malloc (label_len * sizeof (*label_name));
> > > -+  label_name = grub_calloc (label_len, sizeof (*label_name));
> > > -   if (!label_name)
> > > -     {
> > > -       grub_free (node);
> > > -@@ -1029,7 +1029,7 @@ grub_hfsplus_label (grub_device_t device, char
> > > **label)
> > > -       }
> > > -     }
> > > -
> > > --  *label = grub_malloc (label_len * GRUB_MAX_UTF8_PER_UTF16 + 1);
> > > -+  *label = grub_calloc (label_len, GRUB_MAX_UTF8_PER_UTF16 + 1);
> > > -   if (! *label)
> > > -     {
> > > -       grub_free (label_name);
> > > -diff --git a/grub-core/fs/iso9660.c b/grub-core/fs/iso9660.c
> > > -index 49c0c63..4f1b52a 100644
> > > ---- a/grub-core/fs/iso9660.c
> > > -+++ b/grub-core/fs/iso9660.c
> > > -@@ -331,7 +331,7 @@ grub_iso9660_convert_string (grub_uint8_t *us,
> > > int len)
> > > -   int i;
> > > -   grub_uint16_t t[MAX_NAMELEN / 2 + 1];
> > > -
> > > --  p = grub_malloc (len * GRUB_MAX_UTF8_PER_UTF16 + 1);
> > > -+  p = grub_calloc (len, GRUB_MAX_UTF8_PER_UTF16 + 1);
> > > -   if (! p)
> > > -     return NULL;
> > > -
> > > -diff --git a/grub-core/fs/ntfs.c b/grub-core/fs/ntfs.c
> > > -index fc4e1f6..2f34f76 100644
> > > ---- a/grub-core/fs/ntfs.c
> > > -+++ b/grub-core/fs/ntfs.c
> > > -@@ -556,8 +556,8 @@ get_utf8 (grub_uint8_t *in, grub_size_t len)
> > > -   grub_uint16_t *tmp;
> > > -   grub_size_t i;
> > > -
> > > --  buf = grub_malloc (len * GRUB_MAX_UTF8_PER_UTF16 + 1);
> > > --  tmp = grub_malloc (len * sizeof (tmp[0]));
> > > -+  buf = grub_calloc (len, GRUB_MAX_UTF8_PER_UTF16 + 1);
> > > -+  tmp = grub_calloc (len, sizeof (tmp[0]));
> > > -   if (!buf || !tmp)
> > > -     {
> > > -       grub_free (buf);
> > > -diff --git a/grub-core/fs/sfs.c b/grub-core/fs/sfs.c
> > > -index 50c1fe7..90f7fb3 100644
> > > ---- a/grub-core/fs/sfs.c
> > > -+++ b/grub-core/fs/sfs.c
> > > -@@ -266,7 +266,7 @@ grub_sfs_read_block (grub_fshelp_node_t node,
> > > grub_disk_addr_t fileblock)
> > > -       node->next_extent = node->block;
> > > -       node->cache_size = 0;
> > > -
> > > --      node->cache = grub_malloc (sizeof (node->cache[0]) *
> > > cache_size);
> > > -+      node->cache = grub_calloc (cache_size, sizeof (node-
> > > > cache[0]));
> > > -       if (!node->cache)
> > > -       {
> > > -         grub_errno = 0;
> > > -diff --git a/grub-core/fs/tar.c b/grub-core/fs/tar.c
> > > -index 7d63e0c..c551ed6 100644
> > > ---- a/grub-core/fs/tar.c
> > > -+++ b/grub-core/fs/tar.c
> > > -@@ -120,7 +120,7 @@ grub_cpio_find_file (struct grub_archelp_data
> > > *data, char **name,
> > > -         if (data->linkname_alloc < linksize + 1)
> > > -           {
> > > -             char *n;
> > > --            n = grub_malloc (2 * (linksize + 1));
> > > -+            n = grub_calloc (2, linksize + 1);
> > > -             if (!n)
> > > -               return grub_errno;
> > > -             grub_free (data->linkname);
> > > -diff --git a/grub-core/fs/udf.c b/grub-core/fs/udf.c
> > > -index dc8b6e2..a837616 100644
> > > ---- a/grub-core/fs/udf.c
> > > -+++ b/grub-core/fs/udf.c
> > > -@@ -873,7 +873,7 @@ read_string (const grub_uint8_t *raw,
> > > grub_size_t sz, char *outbuf)
> > > -     {
> > > -       unsigned i;
> > > -       utf16len = sz - 1;
> > > --      utf16 = grub_malloc (utf16len * sizeof (utf16[0]));
> > > -+      utf16 = grub_calloc (utf16len, sizeof (utf16[0]));
> > > -       if (!utf16)
> > > -       return NULL;
> > > -       for (i = 0; i < utf16len; i++)
> > > -@@ -883,7 +883,7 @@ read_string (const grub_uint8_t *raw,
> > > grub_size_t sz, char *outbuf)
> > > -     {
> > > -       unsigned i;
> > > -       utf16len = (sz - 1) / 2;
> > > --      utf16 = grub_malloc (utf16len * sizeof (utf16[0]));
> > > -+      utf16 = grub_calloc (utf16len, sizeof (utf16[0]));
> > > -       if (!utf16)
> > > -       return NULL;
> > > -       for (i = 0; i < utf16len; i++)
> > > -diff --git a/grub-core/fs/zfs/zfs.c b/grub-core/fs/zfs/zfs.c
> > > -index 2f72e42..381dde5 100644
> > > ---- a/grub-core/fs/zfs/zfs.c
> > > -+++ b/grub-core/fs/zfs/zfs.c
> > > -@@ -3325,7 +3325,7 @@ dnode_get_fullpath (const char *fullpath,
> > > struct subvolume *subvol,
> > > -       }
> > > -       subvol->nkeys = 0;
> > > -       zap_iterate (&keychain_dn, 8, count_zap_keys, &ctx, data);
> > > --      subvol->keyring = grub_zalloc (subvol->nkeys * sizeof
> > > (subvol->keyring[0]));
> > > -+      subvol->keyring = grub_calloc (subvol->nkeys, sizeof (subvol-
> > > > keyring[0]));
> > > -       if (!subvol->keyring)
> > > -       {
> > > -         grub_free (fsname);
> > > -@@ -4336,7 +4336,7 @@ grub_zfs_embed (grub_device_t device
> > > __attribute__ ((unused)),
> > > -   *nsectors = (VDEV_BOOT_SIZE >> GRUB_DISK_SECTOR_BITS);
> > > -   if (*nsectors > max_nsectors)
> > > -     *nsectors = max_nsectors;
> > > --  *sectors = grub_malloc (*nsectors * sizeof (**sectors));
> > > -+  *sectors = grub_calloc (*nsectors, sizeof (**sectors));
> > > -   if (!*sectors)
> > > -     return grub_errno;
> > > -   for (i = 0; i < *nsectors; i++)
> > > -diff --git a/grub-core/gfxmenu/gui_string_util.c b/grub-
> > > core/gfxmenu/gui_string_util.c
> > > -index a9a415e..ba1e1ea 100644
> > > ---- a/grub-core/gfxmenu/gui_string_util.c
> > > -+++ b/grub-core/gfxmenu/gui_string_util.c
> > > -@@ -55,7 +55,7 @@ canonicalize_path (const char *path)
> > > -     if (*p == '/')
> > > -       components++;
> > > -
> > > --  char **path_array = grub_malloc (components * sizeof
> > > (*path_array));
> > > -+  char **path_array = grub_calloc (components, sizeof
> > > (*path_array));
> > > -   if (! path_array)
> > > -     return 0;
> > > -
> > > -diff --git a/grub-core/gfxmenu/widget-box.c b/grub-
> > > core/gfxmenu/widget-box.c
> > > -index b606028..470597d 100644
> > > ---- a/grub-core/gfxmenu/widget-box.c
> > > -+++ b/grub-core/gfxmenu/widget-box.c
> > > -@@ -303,10 +303,10 @@ grub_gfxmenu_create_box (const char
> > > *pixmaps_prefix,
> > > -   box->content_height = 0;
> > > -   box->raw_pixmaps =
> > > -     (struct grub_video_bitmap **)
> > > --    grub_malloc (BOX_NUM_PIXMAPS * sizeof (struct grub_video_bitmap
> > > *));
> > > -+    grub_calloc (BOX_NUM_PIXMAPS, sizeof (struct grub_video_bitmap
> > > *));
> > > -   box->scaled_pixmaps =
> > > -     (struct grub_video_bitmap **)
> > > --    grub_malloc (BOX_NUM_PIXMAPS * sizeof (struct grub_video_bitmap
> > > *));
> > > -+    grub_calloc (BOX_NUM_PIXMAPS, sizeof (struct grub_video_bitmap
> > > *));
> > > -
> > > -   /* Initialize all pixmap pointers to NULL so that proper
> > > destruction can
> > > -      be performed if an error is encountered partway through
> > > construction.  */
> > > -diff --git a/grub-core/io/gzio.c b/grub-core/io/gzio.c
> > > -index 6208a97..43d98a7 100644
> > > ---- a/grub-core/io/gzio.c
> > > -+++ b/grub-core/io/gzio.c
> > > -@@ -554,7 +554,7 @@ huft_build (unsigned *b,   /* code lengths in
> > > bits (all assumed <= BMAX) */
> > > -             z = 1 << j;       /* table entries for j-bit table */
> > > -
> > > -             /* allocate and link in new table */
> > > --            q = (struct huft *) grub_zalloc ((z + 1) * sizeof
> > > (struct huft));
> > > -+            q = (struct huft *) grub_calloc (z + 1, sizeof (struct
> > > huft));
> > > -             if (! q)
> > > -               {
> > > -                 if (h)
> > > -diff --git a/grub-core/kern/efi/efi.c b/grub-core/kern/efi/efi.c
> > > -index 6e1ceb9..dc31caa 100644
> > > ---- a/grub-core/kern/efi/efi.c
> > > -+++ b/grub-core/kern/efi/efi.c
> > > -@@ -202,7 +202,7 @@ grub_efi_set_variable(const char *var, const
> > > grub_efi_guid_t *guid,
> > > -
> > > -   len = grub_strlen (var);
> > > -   len16 = len * GRUB_MAX_UTF16_PER_UTF8;
> > > --  var16 = grub_malloc ((len16 + 1) * sizeof (var16[0]));
> > > -+  var16 = grub_calloc (len16 + 1, sizeof (var16[0]));
> > > -   if (!var16)
> > > -     return grub_errno;
> > > -   len16 = grub_utf8_to_utf16 (var16, len16, (grub_uint8_t *) var,
> > > len, NULL);
> > > -@@ -237,7 +237,7 @@ grub_efi_get_variable (const char *var, const
> > > grub_efi_guid_t *guid,
> > > -
> > > -   len = grub_strlen (var);
> > > -   len16 = len * GRUB_MAX_UTF16_PER_UTF8;
> > > --  var16 = grub_malloc ((len16 + 1) * sizeof (var16[0]));
> > > -+  var16 = grub_calloc (len16 + 1, sizeof (var16[0]));
> > > -   if (!var16)
> > > -     return NULL;
> > > -   len16 = grub_utf8_to_utf16 (var16, len16, (grub_uint8_t *) var,
> > > len, NULL);
> > > -@@ -383,7 +383,7 @@ grub_efi_get_filename (grub_efi_device_path_t
> > > *dp0)
> > > -         while (len > 0 && fp->path_name[len - 1] == 0)
> > > -           len--;
> > > -
> > > --        dup_name = grub_malloc (len * sizeof (*dup_name));
> > > -+        dup_name = grub_calloc (len, sizeof (*dup_name));
> > > -         if (!dup_name)
> > > -           {
> > > -             grub_free (name);
> > > -diff --git a/grub-core/kern/emu/hostdisk.c b/grub-
> > > core/kern/emu/hostdisk.c
> > > -index e9ec680..d975265 100644
> > > ---- a/grub-core/kern/emu/hostdisk.c
> > > -+++ b/grub-core/kern/emu/hostdisk.c
> > > -@@ -615,7 +615,7 @@ static char *
> > > - grub_util_path_concat_real (size_t n, int ext, va_list ap)
> > > - {
> > > -   size_t totlen = 0;
> > > --  char **l = xmalloc ((n + ext) * sizeof (l[0]));
> > > -+  char **l = xcalloc (n + ext, sizeof (l[0]));
> > > -   char *r, *p, *pi;
> > > -   size_t i;
> > > -   int first = 1;
> > > -diff --git a/grub-core/kern/fs.c b/grub-core/kern/fs.c
> > > -index 2b85f49..f90be65 100644
> > > ---- a/grub-core/kern/fs.c
> > > -+++ b/grub-core/kern/fs.c
> > > -@@ -151,7 +151,7 @@ grub_fs_blocklist_open (grub_file_t file, const
> > > char *name)
> > > -   while (p);
> > > -
> > > -   /* Allocate a block list.  */
> > > --  blocks = grub_zalloc (sizeof (struct grub_fs_block) * (num + 1));
> > > -+  blocks = grub_calloc (num + 1, sizeof (struct grub_fs_block));
> > > -   if (! blocks)
> > > -     return 0;
> > > -
> > > -diff --git a/grub-core/kern/misc.c b/grub-core/kern/misc.c
> > > -index 3b633d5..a7abd36 100644
> > > ---- a/grub-core/kern/misc.c
> > > -+++ b/grub-core/kern/misc.c
> > > -@@ -690,7 +690,7 @@ parse_printf_args (const char *fmt0, struct
> > > printf_args *args,
> > > -     args->ptr = args->prealloc;
> > > -   else
> > > -     {
> > > --      args->ptr = grub_malloc (args->count * sizeof (args-
> > > > ptr[0]));
> > > -+      args->ptr = grub_calloc (args->count, sizeof (args->ptr[0]));
> > > -       if (!args->ptr)
> > > -       {
> > > -         grub_errno = GRUB_ERR_NONE;
> > > -diff --git a/grub-core/kern/parser.c b/grub-core/kern/parser.c
> > > -index 78175aa..619db31 100644
> > > ---- a/grub-core/kern/parser.c
> > > -+++ b/grub-core/kern/parser.c
> > > -@@ -213,7 +213,7 @@ grub_parser_split_cmdline (const char *cmdline,
> > > -     return grub_errno;
> > > -   grub_memcpy (args, buffer, bp - buffer);
> > > -
> > > --  *argv = grub_malloc (sizeof (char *) * (*argc + 1));
> > > -+  *argv = grub_calloc (*argc + 1, sizeof (char *));
> > > -   if (!*argv)
> > > -     {
> > > -       grub_free (args);
> > > -diff --git a/grub-core/kern/uboot/uboot.c b/grub-
> > > core/kern/uboot/uboot.c
> > > -index be4816f..aac8f9a 100644
> > > ---- a/grub-core/kern/uboot/uboot.c
> > > -+++ b/grub-core/kern/uboot/uboot.c
> > > -@@ -133,7 +133,7 @@ grub_uboot_dev_enum (void)
> > > -     return num_devices;
> > > -
> > > -   max_devices = 2;
> > > --  enum_devices = grub_malloc (sizeof(struct device_info) *
> > > max_devices);
> > > -+  enum_devices = grub_calloc (max_devices, sizeof(struct
> > > device_info));
> > > -   if (!enum_devices)
> > > -     return 0;
> > > -
> > > -diff --git a/grub-core/lib/libgcrypt/cipher/ac.c b/grub-
> > > core/lib/libgcrypt/cipher/ac.c
> > > -index f5e946a..63f6fcd 100644
> > > ---- a/grub-core/lib/libgcrypt/cipher/ac.c
> > > -+++ b/grub-core/lib/libgcrypt/cipher/ac.c
> > > -@@ -185,7 +185,7 @@ ac_data_mpi_copy (gcry_ac_mpi_t *data_mpis,
> > > unsigned int data_mpis_n,
> > > -   gcry_mpi_t mpi;
> > > -   char *label;
> > > -
> > > --  data_mpis_new = gcry_malloc (sizeof (*data_mpis_new) *
> > > data_mpis_n);
> > > -+  data_mpis_new = gcry_calloc (data_mpis_n, sizeof
> > > (*data_mpis_new));
> > > -   if (! data_mpis_new)
> > > -     {
> > > -       err = gcry_error_from_errno (errno);
> > > -@@ -572,7 +572,7 @@ _gcry_ac_data_to_sexp (gcry_ac_data_t data,
> > > gcry_sexp_t *sexp,
> > > -     }
> > > -
> > > -   /* Add MPI list.  */
> > > --  arg_list = gcry_malloc (sizeof (*arg_list) * (data_n + 1));
> > > -+  arg_list = gcry_calloc (data_n + 1, sizeof (*arg_list));
> > > -   if (! arg_list)
> > > -     {
> > > -       err = gcry_error_from_errno (errno);
> > > -@@ -1283,7 +1283,7 @@ ac_data_construct (const char *identifier, int
> > > include_flags,
> > > -   /* We build a list of arguments to pass to
> > > -      gcry_sexp_build_array().  */
> > > -   data_length = _gcry_ac_data_length (data);
> > > --  arg_list = gcry_malloc (sizeof (*arg_list) * (data_length * 2));
> > > -+  arg_list = gcry_calloc (data_length, sizeof (*arg_list) * 2);
> > > -   if (! arg_list)
> > > -     {
> > > -       err = gcry_error_from_errno (errno);
> > > -@@ -1593,7 +1593,7 @@ _gcry_ac_key_pair_generate (gcry_ac_handle_t
> > > handle, unsigned int nbits,
> > > -       arg_list_n += 2;
> > > -
> > > -   /* Allocate list.  */
> > > --  arg_list = gcry_malloc (sizeof (*arg_list) * arg_list_n);
> > > -+  arg_list = gcry_calloc (arg_list_n, sizeof (*arg_list));
> > > -   if (! arg_list)
> > > -     {
> > > -       err = gcry_error_from_errno (errno);
> > > -diff --git a/grub-core/lib/libgcrypt/cipher/primegen.c b/grub-
> > > core/lib/libgcrypt/cipher/primegen.c
> > > -index 2788e34..b12e79b 100644
> > > ---- a/grub-core/lib/libgcrypt/cipher/primegen.c
> > > -+++ b/grub-core/lib/libgcrypt/cipher/primegen.c
> > > -@@ -383,7 +383,7 @@ prime_generate_internal (int need_q_factor,
> > > -     }
> > > -
> > > -   /* Allocate an array to track pool usage. */
> > > --  pool_in_use = gcry_malloc (n * sizeof *pool_in_use);
> > > -+  pool_in_use = gcry_calloc (n, sizeof *pool_in_use);
> > > -   if (!pool_in_use)
> > > -     {
> > > -       err = gpg_err_code_from_errno (errno);
> > > -@@ -765,7 +765,7 @@ gen_prime (unsigned int nbits, int secret, int
> > > randomlevel,
> > > -   if (nbits < 16)
> > > -     log_fatal ("can't generate a prime with less than %d bits\n",
> > > 16);
> > > -
> > > --  mods = gcry_xmalloc( no_of_small_prime_numbers * sizeof *mods );
> > > -+  mods = gcry_xcalloc( no_of_small_prime_numbers, sizeof *mods);
> > > -   /* Make nbits fit into gcry_mpi_t implementation. */
> > > -   val_2  = mpi_alloc_set_ui( 2 );
> > > -   val_3 = mpi_alloc_set_ui( 3);
> > > -diff --git a/grub-core/lib/libgcrypt/cipher/pubkey.c b/grub-
> > > core/lib/libgcrypt/cipher/pubkey.c
> > > -index 9109821..ca087ad 100644
> > > ---- a/grub-core/lib/libgcrypt/cipher/pubkey.c
> > > -+++ b/grub-core/lib/libgcrypt/cipher/pubkey.c
> > > -@@ -2941,7 +2941,7 @@ gcry_pk_encrypt (gcry_sexp_t *r_ciph,
> > > gcry_sexp_t s_data, gcry_sexp_t s_pkey)
> > > -        * array to a format string, so we have to do it this way :-
> > > (.  */
> > > -       /* FIXME: There is now such a format specifier, so we can
> > > -          change the code to be more clear. */
> > > --      arg_list = malloc (nelem * sizeof *arg_list);
> > > -+      arg_list = calloc (nelem, sizeof *arg_list);
> > > -       if (!arg_list)
> > > -         {
> > > -           rc = gpg_err_code_from_syserror ();
> > > -@@ -3233,7 +3233,7 @@ gcry_pk_sign (gcry_sexp_t *r_sig, gcry_sexp_t
> > > s_hash, gcry_sexp_t s_skey)
> > > -         }
> > > -       strcpy (p, "))");
> > > -
> > > --      arg_list = malloc (nelem * sizeof *arg_list);
> > > -+      arg_list = calloc (nelem, sizeof *arg_list);
> > > -       if (!arg_list)
> > > -         {
> > > -           rc = gpg_err_code_from_syserror ();
> > > -diff --git a/grub-core/lib/priority_queue.c b/grub-
> > > core/lib/priority_queue.c
> > > -index 659be0b..7d5e7c0 100644
> > > ---- a/grub-core/lib/priority_queue.c
> > > -+++ b/grub-core/lib/priority_queue.c
> > > -@@ -92,7 +92,7 @@ grub_priority_queue_new (grub_size_t elsize,
> > > - {
> > > -   struct grub_priority_queue *ret;
> > > -   void *els;
> > > --  els = grub_malloc (elsize * 8);
> > > -+  els = grub_calloc (8, elsize);
> > > -   if (!els)
> > > -     return 0;
> > > -   ret = (struct grub_priority_queue *) grub_malloc (sizeof (*ret));
> > > -diff --git a/grub-core/lib/reed_solomon.c b/grub-
> > > core/lib/reed_solomon.c
> > > -index ee9fa7b..467305b 100644
> > > ---- a/grub-core/lib/reed_solomon.c
> > > -+++ b/grub-core/lib/reed_solomon.c
> > > -@@ -20,6 +20,7 @@
> > > - #include <stdio.h>
> > > - #include <string.h>
> > > - #include <stdlib.h>
> > > -+#define xcalloc calloc
> > > - #define xmalloc malloc
> > > - #define grub_memset memset
> > > - #define grub_memcpy memcpy
> > > -@@ -158,11 +159,9 @@ rs_encode (gf_single_t *data, grub_size_t s,
> > > grub_size_t rs)
> > > -   gf_single_t *rs_polynomial;
> > > -   int i, j;
> > > -   gf_single_t *m;
> > > --  m = xmalloc ((s + rs) * sizeof (gf_single_t));
> > > -+  m = xcalloc (s + rs, sizeof (gf_single_t));
> > > -   grub_memcpy (m, data, s * sizeof (gf_single_t));
> > > --  grub_memset (m + s, 0, rs * sizeof (gf_single_t));
> > > --  rs_polynomial = xmalloc ((rs + 1) * sizeof (gf_single_t));
> > > --  grub_memset (rs_polynomial, 0, (rs + 1) * sizeof (gf_single_t));
> > > -+  rs_polynomial = xcalloc (rs + 1, sizeof (gf_single_t));
> > > -   rs_polynomial[rs] = 1;
> > > -   /* Multiply with X - a^r */
> > > -   for (j = 0; j < rs; j++)
> > > -diff --git a/grub-core/lib/relocator.c b/grub-core/lib/relocator.c
> > > -index ea3ebc7..5847aac 100644
> > > ---- a/grub-core/lib/relocator.c
> > > -+++ b/grub-core/lib/relocator.c
> > > -@@ -495,9 +495,9 @@ malloc_in_range (struct grub_relocator *rel,
> > > -   }
> > > - #endif
> > > -
> > > --  eventt = grub_malloc (maxevents * sizeof (events[0]));
> > > -+  eventt = grub_calloc (maxevents, sizeof (events[0]));
> > > -   counter = grub_malloc ((DIGITSORT_MASK + 2) * sizeof
> > > (counter[0]));
> > > --  events = grub_malloc (maxevents * sizeof (events[0]));
> > > -+  events = grub_calloc (maxevents, sizeof (events[0]));
> > > -   if (!events || !eventt || !counter)
> > > -     {
> > > -       grub_dprintf ("relocator", "events or counter allocation
> > > failed %d\n",
> > > -@@ -963,7 +963,7 @@ malloc_in_range (struct grub_relocator *rel,
> > > - #endif
> > > -     unsigned cural = 0;
> > > -     int oom = 0;
> > > --    res->subchunks = grub_malloc (sizeof (res->subchunks[0]) *
> > > nallocs);
> > > -+    res->subchunks = grub_calloc (nallocs, sizeof (res-
> > > > subchunks[0]));
> > > -     if (!res->subchunks)
> > > -       oom = 1;
> > > -     res->nsubchunks = nallocs;
> > > -@@ -1562,8 +1562,8 @@ grub_relocator_prepare_relocs (struct
> > > grub_relocator *rel, grub_addr_t addr,
> > > -           count[(chunk->src & 0xff) + 1]++;
> > > -         }
> > > -     }
> > > --    from = grub_malloc (nchunks * sizeof (sorted[0]));
> > > --    to = grub_malloc (nchunks * sizeof (sorted[0]));
> > > -+    from = grub_calloc (nchunks, sizeof (sorted[0]));
> > > -+    to = grub_calloc (nchunks, sizeof (sorted[0]));
> > > -     if (!from || !to)
> > > -       {
> > > -       grub_free (from);
> > > -diff --git a/grub-core/lib/zstd/fse_decompress.c b/grub-
> > > core/lib/zstd/fse_decompress.c
> > > -index 72bbead..2227b84 100644
> > > ---- a/grub-core/lib/zstd/fse_decompress.c
> > > -+++ b/grub-core/lib/zstd/fse_decompress.c
> > > -@@ -82,7 +82,7 @@
> > > - FSE_DTable* FSE_createDTable (unsigned tableLog)
> > > - {
> > > -     if (tableLog > FSE_TABLELOG_ABSOLUTE_MAX) tableLog =
> > > FSE_TABLELOG_ABSOLUTE_MAX;
> > > --    return (FSE_DTable*)malloc( FSE_DTABLE_SIZE_U32(tableLog) *
> > > sizeof (U32) );
> > > -+    return (FSE_DTable*)calloc( FSE_DTABLE_SIZE_U32(tableLog),
> > > sizeof (U32) );
> > > - }
> > > -
> > > - void FSE_freeDTable (FSE_DTable* dt)
> > > -diff --git a/grub-core/loader/arm/linux.c b/grub-
> > > core/loader/arm/linux.c
> > > -index 5168491..d70c174 100644
> > > ---- a/grub-core/loader/arm/linux.c
> > > -+++ b/grub-core/loader/arm/linux.c
> > > -@@ -78,7 +78,7 @@ linux_prepare_atag (void *target_atag)
> > > -
> > > -   /* some place for cmdline, initrd and terminator.  */
> > > -   tmp_size = get_atag_size (atag_orig) + 20 + (arg_size) / 4;
> > > --  tmp_atag = grub_malloc (tmp_size * sizeof (grub_uint32_t));
> > > -+  tmp_atag = grub_calloc (tmp_size, sizeof (grub_uint32_t));
> > > -   if (!tmp_atag)
> > > -     return grub_errno;
> > > -
> > > -diff --git a/grub-core/loader/efi/chainloader.c b/grub-
> > > core/loader/efi/chainloader.c
> > > -index cd92ea3..daf8c6b 100644
> > > ---- a/grub-core/loader/efi/chainloader.c
> > > -+++ b/grub-core/loader/efi/chainloader.c
> > > -@@ -116,7 +116,7 @@ copy_file_path (grub_efi_file_path_device_path_t
> > > *fp,
> > > -   fp->header.type = GRUB_EFI_MEDIA_DEVICE_PATH_TYPE;
> > > -   fp->header.subtype = GRUB_EFI_FILE_PATH_DEVICE_PATH_SUBTYPE;
> > > -
> > > --  path_name = grub_malloc (len * GRUB_MAX_UTF16_PER_UTF8 * sizeof
> > > (*path_name));
> > > -+  path_name = grub_calloc (len, GRUB_MAX_UTF16_PER_UTF8 * sizeof
> > > (*path_name));
> > > -   if (!path_name)
> > > -     return;
> > > -
> > > -diff --git a/grub-core/loader/i386/bsdXX.c b/grub-
> > > core/loader/i386/bsdXX.c
> > > -index af6741d..a8d8bf7 100644
> > > ---- a/grub-core/loader/i386/bsdXX.c
> > > -+++ b/grub-core/loader/i386/bsdXX.c
> > > -@@ -48,7 +48,7 @@ read_headers (grub_file_t file, const char
> > > *filename, Elf_Ehdr *e, char **shdr)
> > > -   if (e->e_ident[EI_CLASS] != SUFFIX (ELFCLASS))
> > > -     return grub_error (GRUB_ERR_BAD_OS, N_("invalid arch-dependent
> > > ELF magic"));
> > > -
> > > --  *shdr = grub_malloc ((grub_uint32_t) e->e_shnum * e-
> > > > e_shentsize);
> > > -+  *shdr = grub_calloc (e->e_shnum, e->e_shentsize);
> > > -   if (! *shdr)
> > > -     return grub_errno;
> > > -
> > > -diff --git a/grub-core/loader/i386/xnu.c b/grub-
> > > core/loader/i386/xnu.c
> > > -index e64ed08..b7d176b 100644
> > > ---- a/grub-core/loader/i386/xnu.c
> > > -+++ b/grub-core/loader/i386/xnu.c
> > > -@@ -295,7 +295,7 @@ grub_xnu_devprop_add_property_utf8 (struct
> > > grub_xnu_devprop_device_descriptor *d
> > > -     return grub_errno;
> > > -
> > > -   len = grub_strlen (name);
> > > --  utf16 = grub_malloc (sizeof (grub_uint16_t) * len);
> > > -+  utf16 = grub_calloc (len, sizeof (grub_uint16_t));
> > > -   if (!utf16)
> > > -     {
> > > -       grub_free (utf8);
> > > -@@ -331,7 +331,7 @@ grub_xnu_devprop_add_property_utf16 (struct
> > > grub_xnu_devprop_device_descriptor *
> > > -   grub_uint16_t *utf16;
> > > -   grub_err_t err;
> > > -
> > > --  utf16 = grub_malloc (sizeof (grub_uint16_t) * namelen);
> > > -+  utf16 = grub_calloc (namelen, sizeof (grub_uint16_t));
> > > -   if (!utf16)
> > > -     return grub_errno;
> > > -   grub_memcpy (utf16, name, sizeof (grub_uint16_t) * namelen);
> > > -diff --git a/grub-core/loader/macho.c b/grub-core/loader/macho.c
> > > -index 085f9c6..05710c4 100644
> > > ---- a/grub-core/loader/macho.c
> > > -+++ b/grub-core/loader/macho.c
> > > -@@ -97,7 +97,7 @@ grub_macho_file (grub_file_t file, const char
> > > *filename, int is_64bit)
> > > -       if (grub_file_seek (macho->file, sizeof (struct
> > > grub_macho_fat_header))
> > > -         == (grub_off_t) -1)
> > > -       goto fail;
> > > --      archs = grub_malloc (sizeof (struct grub_macho_fat_arch) *
> > > narchs);
> > > -+      archs = grub_calloc (narchs, sizeof (struct
> > > grub_macho_fat_arch));
> > > -       if (!archs)
> > > -       goto fail;
> > > -       if (grub_file_read (macho->file, archs,
> > > -diff --git a/grub-core/loader/multiboot_elfxx.c b/grub-
> > > core/loader/multiboot_elfxx.c
> > > -index 70cd1db..cc68536 100644
> > > ---- a/grub-core/loader/multiboot_elfxx.c
> > > -+++ b/grub-core/loader/multiboot_elfxx.c
> > > -@@ -217,7 +217,7 @@ CONCAT(grub_multiboot_load_elf, XX)
> > > (mbi_load_data_t *mld)
> > > -     {
> > > -       grub_uint8_t *shdr, *shdrptr;
> > > -
> > > --      shdr = grub_malloc ((grub_uint32_t) ehdr->e_shnum * ehdr-
> > > > e_shentsize);
> > > -+      shdr = grub_calloc (ehdr->e_shnum, ehdr->e_shentsize);
> > > -       if (!shdr)
> > > -       return grub_errno;
> > > -
> > > -diff --git a/grub-core/loader/xnu.c b/grub-core/loader/xnu.c
> > > -index 7f74d1d..77d7060 100644
> > > ---- a/grub-core/loader/xnu.c
> > > -+++ b/grub-core/loader/xnu.c
> > > -@@ -800,7 +800,7 @@ grub_cmd_xnu_mkext (grub_command_t cmd
> > > __attribute__ ((unused)),
> > > -   if (grub_be_to_cpu32 (head.magic) == GRUB_MACHO_FAT_MAGIC)
> > > -     {
> > > -       narchs = grub_be_to_cpu32 (head.nfat_arch);
> > > --      archs = grub_malloc (sizeof (struct grub_macho_fat_arch) *
> > > narchs);
> > > -+      archs = grub_calloc (narchs, sizeof (struct
> > > grub_macho_fat_arch));
> > > -       if (! archs)
> > > -       {
> > > -         grub_file_close (file);
> > > -diff --git a/grub-core/mmap/mmap.c b/grub-core/mmap/mmap.c
> > > -index 6a31cba..57b4e9a 100644
> > > ---- a/grub-core/mmap/mmap.c
> > > -+++ b/grub-core/mmap/mmap.c
> > > -@@ -143,9 +143,9 @@ grub_mmap_iterate (grub_memory_hook_t hook, void
> > > *hook_data)
> > > -
> > > -   /* Initialize variables. */
> > > -   ctx.scanline_events = (struct grub_mmap_scan *)
> > > --    grub_malloc (sizeof (struct grub_mmap_scan) * 2 * mmap_num);
> > > -+    grub_calloc (mmap_num, sizeof (struct grub_mmap_scan) * 2);
> > > -
> > > --  present = grub_zalloc (sizeof (present[0]) * current_priority);
> > > -+  present = grub_calloc (current_priority, sizeof (present[0]));
> > > -
> > > -   if (! ctx.scanline_events || !present)
> > > -     {
> > > -diff --git a/grub-core/net/bootp.c b/grub-core/net/bootp.c
> > > -index 04cfbb0..6539572 100644
> > > ---- a/grub-core/net/bootp.c
> > > -+++ b/grub-core/net/bootp.c
> > > -@@ -766,7 +766,7 @@ grub_cmd_bootp (struct grub_command *cmd
> > > __attribute__ ((unused)),
> > > -   if (ncards == 0)
> > > -     return grub_error (GRUB_ERR_NET_NO_CARD, N_("no network card
> > > found"));
> > > -
> > > --  ifaces = grub_zalloc (ncards * sizeof (ifaces[0]));
> > > -+  ifaces = grub_calloc (ncards, sizeof (ifaces[0]));
> > > -   if (!ifaces)
> > > -     return grub_errno;
> > > -
> > > -diff --git a/grub-core/net/dns.c b/grub-core/net/dns.c
> > > -index 5d9afe0..e332d5e 100644
> > > ---- a/grub-core/net/dns.c
> > > -+++ b/grub-core/net/dns.c
> > > -@@ -285,8 +285,8 @@ recv_hook (grub_net_udp_socket_t sock
> > > __attribute__ ((unused)),
> > > -       ptr++;
> > > -       ptr += 4;
> > > -     }
> > > --  *data->addresses = grub_malloc (sizeof ((*data->addresses)[0])
> > > --                               * grub_be_to_cpu16 (head->ancount));
> > > -+  *data->addresses = grub_calloc (grub_be_to_cpu16 (head->ancount),
> > > -+                                sizeof ((*data->addresses)[0]));
> > > -   if (!*data->addresses)
> > > -     {
> > > -       grub_errno = GRUB_ERR_NONE;
> > > -@@ -406,8 +406,8 @@ recv_hook (grub_net_udp_socket_t sock
> > > __attribute__ ((unused)),
> > > -       dns_cache[h].addresses = 0;
> > > -       dns_cache[h].name = grub_strdup (data->oname);
> > > -       dns_cache[h].naddresses = *data->naddresses;
> > > --      dns_cache[h].addresses = grub_malloc (*data->naddresses
> > > --                                          * sizeof
> > > (dns_cache[h].addresses[0]));
> > > -+      dns_cache[h].addresses = grub_calloc (*data->naddresses,
> > > -+                                          sizeof
> > > (dns_cache[h].addresses[0]));
> > > -       dns_cache[h].limit_time = grub_get_time_ms () + 1000 *
> > > ttl_all;
> > > -       if (!dns_cache[h].addresses || !dns_cache[h].name)
> > > -       {
> > > -@@ -479,7 +479,7 @@ grub_net_dns_lookup (const char *name,
> > > -       }
> > > -     }
> > > -
> > > --  sockets = grub_malloc (sizeof (sockets[0]) * n_servers);
> > > -+  sockets = grub_calloc (n_servers, sizeof (sockets[0]));
> > > -   if (!sockets)
> > > -     return grub_errno;
> > > -
> > > -diff --git a/grub-core/net/net.c b/grub-core/net/net.c
> > > -index d5d726a..38f19df 100644
> > > ---- a/grub-core/net/net.c
> > > -+++ b/grub-core/net/net.c
> > > -@@ -333,8 +333,8 @@ grub_cmd_ipv6_autoconf (struct grub_command *cmd
> > > __attribute__ ((unused)),
> > > -     ncards++;
> > > -   }
> > > -
> > > --  ifaces = grub_zalloc (ncards * sizeof (ifaces[0]));
> > > --  slaacs = grub_zalloc (ncards * sizeof (slaacs[0]));
> > > -+  ifaces = grub_calloc (ncards, sizeof (ifaces[0]));
> > > -+  slaacs = grub_calloc (ncards, sizeof (slaacs[0]));
> > > -   if (!ifaces || !slaacs)
> > > -     {
> > > -       grub_free (ifaces);
> > > -diff --git a/grub-core/normal/charset.c b/grub-core/normal/charset.c
> > > -index b0ab47d..d57fb72 100644
> > > ---- a/grub-core/normal/charset.c
> > > -+++ b/grub-core/normal/charset.c
> > > -@@ -203,7 +203,7 @@ grub_utf8_to_ucs4_alloc (const char *msg,
> > > grub_uint32_t **unicode_msg,
> > > - {
> > > -   grub_size_t msg_len = grub_strlen (msg);
> > > -
> > > --  *unicode_msg = grub_malloc (msg_len * sizeof (grub_uint32_t));
> > > -+  *unicode_msg = grub_calloc (msg_len, sizeof (grub_uint32_t));
> > > -
> > > -   if (!*unicode_msg)
> > > -     return -1;
> > > -@@ -488,7 +488,7 @@ grub_unicode_aglomerate_comb (const
> > > grub_uint32_t *in, grub_size_t inlen,
> > > -           }
> > > -         else
> > > -           {
> > > --            n = grub_malloc (sizeof (n[0]) * (out->ncomb + 1));
> > > -+            n = grub_calloc (out->ncomb + 1, sizeof (n[0]));
> > > -             if (!n)
> > > -               {
> > > -                 grub_errno = GRUB_ERR_NONE;
> > > -@@ -842,7 +842,7 @@ grub_bidi_line_logical_to_visual (const
> > > grub_uint32_t *logical,
> > > -       }                                                       \
> > > -   }
> > > -
> > > --  visual = grub_malloc (sizeof (visual[0]) * logical_len);
> > > -+  visual = grub_calloc (logical_len, sizeof (visual[0]));
> > > -   if (!visual)
> > > -     return -1;
> > > -
> > > -@@ -1165,8 +1165,8 @@ grub_bidi_logical_to_visual (const
> > > grub_uint32_t *logical,
> > > - {
> > > -   const grub_uint32_t *line_start = logical, *ptr;
> > > -   struct grub_unicode_glyph *visual_ptr;
> > > --  *visual_out = visual_ptr = grub_malloc (3 * sizeof
> > > (visual_ptr[0])
> > > --                                        * (logical_len + 2));
> > > -+  *visual_out = visual_ptr = grub_calloc (logical_len + 2,
> > > -+                                        3 * sizeof
> > > (visual_ptr[0]));
> > > -   if (!visual_ptr)
> > > -     return -1;
> > > -   for (ptr = logical; ptr <= logical + logical_len; ptr++)
> > > -diff --git a/grub-core/normal/cmdline.c b/grub-core/normal/cmdline.c
> > > -index c037d50..c57242e 100644
> > > ---- a/grub-core/normal/cmdline.c
> > > -+++ b/grub-core/normal/cmdline.c
> > > -@@ -41,7 +41,7 @@ grub_err_t
> > > - grub_set_history (int newsize)
> > > - {
> > > -   grub_uint32_t **old_hist_lines = hist_lines;
> > > --  hist_lines = grub_malloc (sizeof (grub_uint32_t *) * newsize);
> > > -+  hist_lines = grub_calloc (newsize, sizeof (grub_uint32_t *));
> > > -
> > > -   /* Copy the old lines into the new buffer.  */
> > > -   if (old_hist_lines)
> > > -@@ -114,7 +114,7 @@ static void
> > > - grub_history_set (int pos, grub_uint32_t *s, grub_size_t len)
> > > - {
> > > -   grub_free (hist_lines[pos]);
> > > --  hist_lines[pos] = grub_malloc ((len + 1) * sizeof
> > > (grub_uint32_t));
> > > -+  hist_lines[pos] = grub_calloc (len + 1, sizeof (grub_uint32_t));
> > > -   if (!hist_lines[pos])
> > > -     {
> > > -       grub_print_error ();
> > > -@@ -349,7 +349,7 @@ grub_cmdline_get (const char *prompt_translated)
> > > -   char *ret;
> > > -   unsigned nterms;
> > > -
> > > --  buf = grub_malloc (max_len * sizeof (grub_uint32_t));
> > > -+  buf = grub_calloc (max_len, sizeof (grub_uint32_t));
> > > -   if (!buf)
> > > -     return 0;
> > > -
> > > -@@ -377,7 +377,7 @@ grub_cmdline_get (const char *prompt_translated)
> > > -     FOR_ACTIVE_TERM_OUTPUTS(cur)
> > > -       nterms++;
> > > -
> > > --    cl_terms = grub_malloc (sizeof (cl_terms[0]) * nterms);
> > > -+    cl_terms = grub_calloc (nterms, sizeof (cl_terms[0]));
> > > -     if (!cl_terms)
> > > -       {
> > > -       grub_free (buf);
> > > -@@ -385,7 +385,7 @@ grub_cmdline_get (const char *prompt_translated)
> > > -       }
> > > -     cl_term_cur = cl_terms;
> > > -
> > > --    unicode_msg = grub_malloc (msg_len * sizeof (grub_uint32_t));
> > > -+    unicode_msg = grub_calloc (msg_len, sizeof (grub_uint32_t));
> > > -     if (!unicode_msg)
> > > -       {
> > > -       grub_free (buf);
> > > -@@ -495,7 +495,7 @@ grub_cmdline_get (const char *prompt_translated)
> > > -               grub_uint32_t *insert;
> > > -
> > > -               insertlen = grub_strlen (insertu8);
> > > --              insert = grub_malloc ((insertlen + 1) * sizeof
> > > (grub_uint32_t));
> > > -+              insert = grub_calloc (insertlen + 1, sizeof
> > > (grub_uint32_t));
> > > -               if (!insert)
> > > -                 {
> > > -                   grub_free (insertu8);
> > > -@@ -602,7 +602,7 @@ grub_cmdline_get (const char *prompt_translated)
> > > -
> > > -             grub_free (kill_buf);
> > > -
> > > --            kill_buf = grub_malloc ((n + 1) *
> > > sizeof(grub_uint32_t));
> > > -+            kill_buf = grub_calloc (n + 1, sizeof (grub_uint32_t));
> > > -             if (grub_errno)
> > > -               {
> > > -                 grub_print_error ();
> > > -diff --git a/grub-core/normal/menu_entry.c b/grub-
> > > core/normal/menu_entry.c
> > > -index cdf3590..1993995 100644
> > > ---- a/grub-core/normal/menu_entry.c
> > > -+++ b/grub-core/normal/menu_entry.c
> > > -@@ -95,8 +95,8 @@ init_line (struct screen *screen, struct line
> > > *linep)
> > > - {
> > > -   linep->len = 0;
> > > -   linep->max_len = 80;
> > > --  linep->buf = grub_malloc ((linep->max_len + 1) * sizeof (linep-
> > > > buf[0]));
> > > --  linep->pos = grub_zalloc (screen->nterms * sizeof (linep-
> > > > pos[0]));
> > > -+  linep->buf = grub_calloc (linep->max_len + 1, sizeof (linep-
> > > > buf[0]));
> > > -+  linep->pos = grub_calloc (screen->nterms, sizeof (linep-
> > > > pos[0]));
> > > -   if (! linep->buf || !linep->pos)
> > > -     {
> > > -       grub_free (linep->buf);
> > > -@@ -287,7 +287,7 @@ update_screen (struct screen *screen, struct
> > > per_term_screen *term_screen,
> > > -         pos = linep->pos + (term_screen - screen->terms);
> > > -
> > > -         if (!*pos)
> > > --          *pos = grub_zalloc ((linep->len + 1) * sizeof (**pos));
> > > -+          *pos = grub_calloc (linep->len + 1, sizeof (**pos));
> > > -
> > > -         if (i == region_start || linep == screen->lines + screen-
> > > > line
> > > -             || (i > region_start && mode == ALL_LINES))
> > > -@@ -471,7 +471,7 @@ insert_string (struct screen *screen, const char
> > > *s, int update)
> > > -
> > > -         /* Insert the string.  */
> > > -         current_linep = screen->lines + screen->line;
> > > --        unicode_msg = grub_malloc ((p - s) * sizeof
> > > (grub_uint32_t));
> > > -+        unicode_msg = grub_calloc (p - s, sizeof (grub_uint32_t));
> > > -
> > > -         if (!unicode_msg)
> > > -           return 0;
> > > -@@ -1023,7 +1023,7 @@ complete (struct screen *screen, int
> > > continuous, int update)
> > > -   if (completion_buffer.buf)
> > > -     {
> > > -       buflen = grub_strlen (completion_buffer.buf);
> > > --      ucs4 = grub_malloc (sizeof (grub_uint32_t) * (buflen + 1));
> > > -+      ucs4 = grub_calloc (buflen + 1, sizeof (grub_uint32_t));
> > > -
> > > -       if (!ucs4)
> > > -       {
> > > -@@ -1268,7 +1268,7 @@ grub_menu_entry_run (grub_menu_entry_t entry)
> > > -   for (i = 0; i < (unsigned) screen->num_lines; i++)
> > > -     {
> > > -       grub_free (screen->lines[i].pos);
> > > --      screen->lines[i].pos = grub_zalloc (screen->nterms * sizeof
> > > (screen->lines[i].pos[0]));
> > > -+      screen->lines[i].pos = grub_calloc (screen->nterms, sizeof
> > > (screen->lines[i].pos[0]));
> > > -       if (! screen->lines[i].pos)
> > > -       {
> > > -         grub_print_error ();
> > > -@@ -1278,7 +1278,7 @@ grub_menu_entry_run (grub_menu_entry_t entry)
> > > -       }
> > > -     }
> > > -
> > > --  screen->terms = grub_zalloc (screen->nterms * sizeof (screen-
> > > > terms[0]));
> > > -+  screen->terms = grub_calloc (screen->nterms, sizeof (screen-
> > > > terms[0]));
> > > -   if (!screen->terms)
> > > -     {
> > > -       grub_print_error ();
> > > -diff --git a/grub-core/normal/menu_text.c b/grub-
> > > core/normal/menu_text.c
> > > -index e22bb91..18240e7 100644
> > > ---- a/grub-core/normal/menu_text.c
> > > -+++ b/grub-core/normal/menu_text.c
> > > -@@ -78,7 +78,7 @@ grub_print_message_indented_real (const char *msg,
> > > int margin_left,
> > > -   grub_size_t msg_len = grub_strlen (msg) + 2;
> > > -   int ret = 0;
> > > -
> > > --  unicode_msg = grub_malloc (msg_len * sizeof (grub_uint32_t));
> > > -+  unicode_msg = grub_calloc (msg_len, sizeof (grub_uint32_t));
> > > -
> > > -   if (!unicode_msg)
> > > -     return 0;
> > > -@@ -211,7 +211,7 @@ print_entry (int y, int highlight,
> > > grub_menu_entry_t entry,
> > > -
> > > -   title = entry ? entry->title : "";
> > > -   title_len = grub_strlen (title);
> > > --  unicode_title = grub_malloc (title_len * sizeof
> > > (*unicode_title));
> > > -+  unicode_title = grub_calloc (title_len, sizeof (*unicode_title));
> > > -   if (! unicode_title)
> > > -     /* XXX How to show this error?  */
> > > -     return;
> > > -diff --git a/grub-core/normal/term.c b/grub-core/normal/term.c
> > > -index a1e5c5a..cc8c173 100644
> > > ---- a/grub-core/normal/term.c
> > > -+++ b/grub-core/normal/term.c
> > > -@@ -264,7 +264,7 @@ grub_term_save_pos (void)
> > > -   FOR_ACTIVE_TERM_OUTPUTS(cur)
> > > -     cnt++;
> > > -
> > > --  ret = grub_malloc (cnt * sizeof (ret[0]));
> > > -+  ret = grub_calloc (cnt, sizeof (ret[0]));
> > > -   if (!ret)
> > > -     return NULL;
> > > -
> > > -@@ -1013,7 +1013,7 @@ grub_xnputs (const char *str, grub_size_t
> > > msg_len)
> > > -
> > > -   grub_error_push ();
> > > -
> > > --  unicode_str = grub_malloc (msg_len * sizeof (grub_uint32_t));
> > > -+  unicode_str = grub_calloc (msg_len, sizeof (grub_uint32_t));
> > > -
> > > -   grub_error_pop ();
> > > -
> > > -diff --git a/grub-core/osdep/linux/getroot.c b/grub-
> > > core/osdep/linux/getroot.c
> > > -index 90d92d3..5b41ad0 100644
> > > ---- a/grub-core/osdep/linux/getroot.c
> > > -+++ b/grub-core/osdep/linux/getroot.c
> > > -@@ -168,7 +168,7 @@ grub_util_raid_getmembers (const char *name, int
> > > bootable)
> > > -   if (ret != 0)
> > > -     grub_util_error (_("ioctl GET_ARRAY_INFO error: %s"), strerror
> > > (errno));
> > > -
> > > --  devicelist = xmalloc ((info.nr_disks + 1) * sizeof (char *));
> > > -+  devicelist = xcalloc (info.nr_disks + 1, sizeof (char *));
> > > -
> > > -   for (i = 0, j = 0; j < info.nr_disks; i++)
> > > -     {
> > > -@@ -241,7 +241,7 @@ grub_find_root_devices_from_btrfs (const char
> > > *dir)
> > > -       return NULL;
> > > -     }
> > > -
> > > --  ret = xmalloc ((fsi.num_devices + 1) * sizeof (ret[0]));
> > > -+  ret = xcalloc (fsi.num_devices + 1, sizeof (ret[0]));
> > > -
> > > -   for (i = 1; i <= fsi.max_id && j < fsi.num_devices; i++)
> > > -     {
> > > -@@ -396,7 +396,7 @@ grub_find_root_devices_from_mountinfo (const
> > > char *dir, char **relroot)
> > > -   if (relroot)
> > > -     *relroot = NULL;
> > > -
> > > --  entries = xmalloc (entry_max * sizeof (*entries));
> > > -+  entries = xcalloc (entry_max, sizeof (*entries));
> > > -
> > > - again:
> > > -   fp = grub_util_fopen ("/proc/self/mountinfo", "r");
> > > -diff --git a/grub-core/osdep/unix/config.c b/grub-
> > > core/osdep/unix/config.c
> > > -index 65effa9..7d63251 100644
> > > ---- a/grub-core/osdep/unix/config.c
> > > -+++ b/grub-core/osdep/unix/config.c
> > > -@@ -89,7 +89,7 @@ grub_util_load_config (struct grub_util_config
> > > *cfg)
> > > -   argv[0] = "sh";
> > > -   argv[1] = "-c";
> > > -
> > > --  script = xmalloc (4 * strlen (cfgfile) + 300);
> > > -+  script = xcalloc (4, strlen (cfgfile) + 300);
> > > -
> > > -   ptr = script;
> > > -   memcpy (ptr, ". '", 3);
> > > -diff --git a/grub-core/osdep/windows/getroot.c b/grub-
> > > core/osdep/windows/getroot.c
> > > -index 661d954..eada663 100644
> > > ---- a/grub-core/osdep/windows/getroot.c
> > > -+++ b/grub-core/osdep/windows/getroot.c
> > > -@@ -59,7 +59,7 @@ grub_get_mount_point (const TCHAR *path)
> > > -
> > > -   for (ptr = path; *ptr; ptr++);
> > > -   allocsize = (ptr - path + 10) * 2;
> > > --  out = xmalloc (allocsize * sizeof (out[0]));
> > > -+  out = xcalloc (allocsize, sizeof (out[0]));
> > > -
> > > -   /* When pointing to EFI system partition GetVolumePathName fails
> > > -      for ESP root and returns abberant information for everything
> > > -diff --git a/grub-core/osdep/windows/hostdisk.c b/grub-
> > > core/osdep/windows/hostdisk.c
> > > -index 3551007..0be3273 100644
> > > ---- a/grub-core/osdep/windows/hostdisk.c
> > > -+++ b/grub-core/osdep/windows/hostdisk.c
> > > -@@ -111,7 +111,7 @@ grub_util_get_windows_path_real (const char
> > > *path)
> > > -
> > > -   while (1)
> > > -     {
> > > --      fpa = xmalloc (alloc * sizeof (fpa[0]));
> > > -+      fpa = xcalloc (alloc, sizeof (fpa[0]));
> > > -
> > > -       len = GetFullPathName (tpath, alloc, fpa, NULL);
> > > -       if (len >= alloc)
> > > -@@ -399,7 +399,7 @@ grub_util_fd_opendir (const char *name)
> > > -   for (l = 0; name_windows[l]; l++);
> > > -   for (l--; l >= 0 && (name_windows[l] == '\\' || name_windows[l]
> > > == '/'); l--);
> > > -   l++;
> > > --  pattern = xmalloc ((l + 3) * sizeof (pattern[0]));
> > > -+  pattern = xcalloc (l + 3, sizeof (pattern[0]));
> > > -   memcpy (pattern, name_windows, l * sizeof (pattern[0]));
> > > -   pattern[l] = '\\';
> > > -   pattern[l + 1] = '*';
> > > -diff --git a/grub-core/osdep/windows/init.c b/grub-
> > > core/osdep/windows/init.c
> > > -index e8ffd62..6297de6 100644
> > > ---- a/grub-core/osdep/windows/init.c
> > > -+++ b/grub-core/osdep/windows/init.c
> > > -@@ -161,7 +161,7 @@ grub_util_host_init (int *argc __attribute__
> > > ((unused)),
> > > -   LPWSTR *targv;
> > > -
> > > -   targv = CommandLineToArgvW (tcmdline, argc);
> > > --  *argv = xmalloc ((*argc + 1) * sizeof (argv[0]));
> > > -+  *argv = xcalloc (*argc + 1, sizeof (argv[0]));
> > > -
> > > -   for (i = 0; i < *argc; i++)
> > > -     (*argv)[i] = grub_util_tchar_to_utf8 (targv[i]);
> > > -diff --git a/grub-core/osdep/windows/platform.c b/grub-
> > > core/osdep/windows/platform.c
> > > -index 7eb53fe..1ef86bf 100644
> > > ---- a/grub-core/osdep/windows/platform.c
> > > -+++ b/grub-core/osdep/windows/platform.c
> > > -@@ -225,8 +225,8 @@ grub_install_register_efi (grub_device_t
> > > efidir_grub_dev,
> > > -     grub_util_error ("%s", _("no EFI routines are available when
> > > running in BIOS mode"));
> > > -
> > > -   distrib8_len = grub_strlen (efi_distributor);
> > > --  distributor16 = xmalloc ((distrib8_len + 1) *
> > > GRUB_MAX_UTF16_PER_UTF8
> > > --                         * sizeof (grub_uint16_t));
> > > -+  distributor16 = xcalloc (distrib8_len + 1,
> > > -+                         GRUB_MAX_UTF16_PER_UTF8 * sizeof
> > > (grub_uint16_t));
> > > -   distrib16_len = grub_utf8_to_utf16 (distributor16, distrib8_len *
> > > GRUB_MAX_UTF16_PER_UTF8,
> > > -                                     (const grub_uint8_t *)
> > > efi_distributor,
> > > -                                     distrib8_len, 0);
> > > -diff --git a/grub-core/osdep/windows/relpath.c b/grub-
> > > core/osdep/windows/relpath.c
> > > -index cb08617..478e8ef 100644
> > > ---- a/grub-core/osdep/windows/relpath.c
> > > -+++ b/grub-core/osdep/windows/relpath.c
> > > -@@ -72,7 +72,7 @@ grub_make_system_path_relative_to_its_root (const
> > > char *path)
> > > -       if (dirwindows[0] && dirwindows[1] == ':')
> > > -       offset = 2;
> > > -     }
> > > --  ret = xmalloc (sizeof (ret[0]) * (flen - offset + 2));
> > > -+  ret = xcalloc (flen - offset + 2, sizeof (ret[0]));
> > > -   if (dirwindows[offset] != '\\'
> > > -       && dirwindows[offset] != '/'
> > > -       && dirwindows[offset])
> > > -diff --git a/grub-core/partmap/gpt.c b/grub-core/partmap/gpt.c
> > > -index 103f679..72a2e37 100644
> > > ---- a/grub-core/partmap/gpt.c
> > > -+++ b/grub-core/partmap/gpt.c
> > > -@@ -199,7 +199,7 @@ gpt_partition_map_embed (struct grub_disk *disk,
> > > unsigned int *nsectors,
> > > -   *nsectors = ctx.len;
> > > -   if (*nsectors > max_nsectors)
> > > -     *nsectors = max_nsectors;
> > > --  *sectors = grub_malloc (*nsectors * sizeof (**sectors));
> > > -+  *sectors = grub_calloc (*nsectors, sizeof (**sectors));
> > > -   if (!*sectors)
> > > -     return grub_errno;
> > > -   for (i = 0; i < *nsectors; i++)
> > > -diff --git a/grub-core/partmap/msdos.c b/grub-core/partmap/msdos.c
> > > -index 7b8e450..ee3f249 100644
> > > ---- a/grub-core/partmap/msdos.c
> > > -+++ b/grub-core/partmap/msdos.c
> > > -@@ -337,7 +337,7 @@ pc_partition_map_embed (struct grub_disk *disk,
> > > unsigned int *nsectors,
> > > -       avail_nsectors = *nsectors;
> > > -       if (*nsectors > max_nsectors)
> > > -       *nsectors = max_nsectors;
> > > --      *sectors = grub_malloc (*nsectors * sizeof (**sectors));
> > > -+      *sectors = grub_calloc (*nsectors, sizeof (**sectors));
> > > -       if (!*sectors)
> > > -       return grub_errno;
> > > -       for (i = 0; i < *nsectors; i++)
> > > -diff --git a/grub-core/script/execute.c b/grub-core/script/execute.c
> > > -index ee299fd..c8d6806 100644
> > > ---- a/grub-core/script/execute.c
> > > -+++ b/grub-core/script/execute.c
> > > -@@ -553,7 +553,7 @@ gettext_append (struct grub_script_argv *result,
> > > const char *orig_str)
> > > -   for (iptr = orig_str; *iptr; iptr++)
> > > -     if (*iptr == '$')
> > > -       dollar_cnt++;
> > > --  ctx.allowed_strings = grub_malloc (sizeof
> > > (ctx.allowed_strings[0]) * dollar_cnt);
> > > -+  ctx.allowed_strings = grub_calloc (dollar_cnt, sizeof
> > > (ctx.allowed_strings[0]));
> > > -
> > > -   if (parse_string (orig_str, gettext_save_allow, &ctx, 0))
> > > -     goto fail;
> > > -diff --git a/grub-core/tests/fake_input.c b/grub-
> > > core/tests/fake_input.c
> > > -index 2d60852..b5eb516 100644
> > > ---- a/grub-core/tests/fake_input.c
> > > -+++ b/grub-core/tests/fake_input.c
> > > -@@ -49,7 +49,7 @@ grub_terminal_input_fake_sequence (int *seq_in,
> > > int nseq_in)
> > > -     saved = grub_term_inputs;
> > > -   if (seq)
> > > -     grub_free (seq);
> > > --  seq = grub_malloc (nseq_in * sizeof (seq[0]));
> > > -+  seq = grub_calloc (nseq_in, sizeof (seq[0]));
> > > -   if (!seq)
> > > -     return;
> > > -
> > > -diff --git a/grub-core/tests/video_checksum.c b/grub-
> > > core/tests/video_checksum.c
> > > -index 74d5b65..44d0810 100644
> > > ---- a/grub-core/tests/video_checksum.c
> > > -+++ b/grub-core/tests/video_checksum.c
> > > -@@ -336,7 +336,7 @@ grub_video_capture_write_bmp (const char *fname,
> > > -     {
> > > -     case 4:
> > > -       {
> > > --      grub_uint8_t *buffer = xmalloc (mode_info->width * 3);
> > > -+      grub_uint8_t *buffer = xcalloc (3, mode_info->width);
> > > -       grub_uint32_t rmask = ((1 << mode_info->red_mask_size) - 1);
> > > -       grub_uint32_t gmask = ((1 << mode_info->green_mask_size) -
> > > 1);
> > > -       grub_uint32_t bmask = ((1 << mode_info->blue_mask_size) - 1);
> > > -@@ -367,7 +367,7 @@ grub_video_capture_write_bmp (const char *fname,
> > > -       }
> > > -     case 3:
> > > -       {
> > > --      grub_uint8_t *buffer = xmalloc (mode_info->width * 3);
> > > -+      grub_uint8_t *buffer = xcalloc (3, mode_info->width);
> > > -       grub_uint32_t rmask = ((1 << mode_info->red_mask_size) - 1);
> > > -       grub_uint32_t gmask = ((1 << mode_info->green_mask_size) -
> > > 1);
> > > -       grub_uint32_t bmask = ((1 << mode_info->blue_mask_size) - 1);
> > > -@@ -407,7 +407,7 @@ grub_video_capture_write_bmp (const char *fname,
> > > -       }
> > > -     case 2:
> > > -       {
> > > --      grub_uint8_t *buffer = xmalloc (mode_info->width * 3);
> > > -+      grub_uint8_t *buffer = xcalloc (3, mode_info->width);
> > > -       grub_uint16_t rmask = ((1 << mode_info->red_mask_size) - 1);
> > > -       grub_uint16_t gmask = ((1 << mode_info->green_mask_size) -
> > > 1);
> > > -       grub_uint16_t bmask = ((1 << mode_info->blue_mask_size) - 1);
> > > -diff --git a/grub-core/video/capture.c b/grub-core/video/capture.c
> > > -index 4f83c74..4d3195e 100644
> > > ---- a/grub-core/video/capture.c
> > > -+++ b/grub-core/video/capture.c
> > > -@@ -89,7 +89,7 @@ grub_video_capture_start (const struct
> > > grub_video_mode_info *mode_info,
> > > -   framebuffer.mode_info = *mode_info;
> > > -   framebuffer.mode_info.blit_format = grub_video_get_blit_format
> > > (&framebuffer.mode_info);
> > > -
> > > --  framebuffer.ptr = grub_malloc (framebuffer.mode_info.height *
> > > framebuffer.mode_info.pitch);
> > > -+  framebuffer.ptr = grub_calloc (framebuffer.mode_info.height,
> > > framebuffer.mode_info.pitch);
> > > -   if (!framebuffer.ptr)
> > > -     return grub_errno;
> > > -
> > > -diff --git a/grub-core/video/emu/sdl.c b/grub-core/video/emu/sdl.c
> > > -index a2f639f..0ebab6f 100644
> > > ---- a/grub-core/video/emu/sdl.c
> > > -+++ b/grub-core/video/emu/sdl.c
> > > -@@ -172,7 +172,7 @@ grub_video_sdl_set_palette (unsigned int start,
> > > unsigned int count,
> > > -       if (start + count > mode_info.number_of_colors)
> > > -       count = mode_info.number_of_colors - start;
> > > -
> > > --      tmp = grub_malloc (count * sizeof (tmp[0]));
> > > -+      tmp = grub_calloc (count, sizeof (tmp[0]));
> > > -       for (i = 0; i < count; i++)
> > > -       {
> > > -         tmp[i].r = palette_data[i].r;
> > > -diff --git a/grub-core/video/i386/pc/vga.c b/grub-
> > > core/video/i386/pc/vga.c
> > > -index 01f4711..b2f776c 100644
> > > ---- a/grub-core/video/i386/pc/vga.c
> > > -+++ b/grub-core/video/i386/pc/vga.c
> > > -@@ -127,7 +127,7 @@ grub_video_vga_setup (unsigned int width,
> > > unsigned int height,
> > > -
> > > -   vga_height = height ? : 480;
> > > -
> > > --  framebuffer.temporary_buffer = grub_malloc (vga_height *
> > > VGA_WIDTH);
> > > -+  framebuffer.temporary_buffer = grub_calloc (vga_height,
> > > VGA_WIDTH);
> > > -   framebuffer.front_page = 0;
> > > -   framebuffer.back_page = 0;
> > > -   if (!framebuffer.temporary_buffer)
> > > -diff --git a/grub-core/video/readers/png.c b/grub-
> > > core/video/readers/png.c
> > > -index 777e713..61bd645 100644
> > > ---- a/grub-core/video/readers/png.c
> > > -+++ b/grub-core/video/readers/png.c
> > > -@@ -309,7 +309,7 @@ grub_png_decode_image_header (struct
> > > grub_png_data *data)
> > > -   if (data->is_16bit || data->is_gray || data->is_palette)
> > > - #endif
> > > -     {
> > > --      data->image_data = grub_malloc (data->image_height * data-
> > > > row_bytes);
> > > -+      data->image_data = grub_calloc (data->image_height, data-
> > > > row_bytes);
> > > -       if (grub_errno)
> > > -         return grub_errno;
> > > -
> > > -diff --git a/include/grub/unicode.h b/include/grub/unicode.h
> > > -index a0403e9..4de986a 100644
> > > ---- a/include/grub/unicode.h
> > > -+++ b/include/grub/unicode.h
> > > -@@ -293,7 +293,7 @@ grub_unicode_glyph_dup (const struct
> > > grub_unicode_glyph *in)
> > > -   grub_memcpy (out, in, sizeof (*in));
> > > -   if (in->ncomb > ARRAY_SIZE (out->combining_inline))
> > > -     {
> > > --      out->combining_ptr = grub_malloc (in->ncomb * sizeof (out-
> > > > combining_ptr[0]));
> > > -+      out->combining_ptr = grub_calloc (in->ncomb, sizeof (out-
> > > > combining_ptr[0]));
> > > -       if (!out->combining_ptr)
> > > -       {
> > > -         grub_free (out);
> > > -@@ -315,7 +315,7 @@ grub_unicode_set_glyph (struct
> > > grub_unicode_glyph *out,
> > > -   grub_memcpy (out, in, sizeof (*in));
> > > -   if (in->ncomb > ARRAY_SIZE (out->combining_inline))
> > > -     {
> > > --      out->combining_ptr = grub_malloc (in->ncomb * sizeof (out-
> > > > combining_ptr[0]));
> > > -+      out->combining_ptr = grub_calloc (in->ncomb, sizeof (out-
> > > > combining_ptr[0]));
> > > -       if (!out->combining_ptr)
> > > -       return;
> > > -       grub_memcpy (out->combining_ptr, in->combining_ptr,
> > > -diff --git a/util/getroot.c b/util/getroot.c
> > > -index 847406f..a5eaa64 100644
> > > ---- a/util/getroot.c
> > > -+++ b/util/getroot.c
> > > -@@ -200,7 +200,7 @@ make_device_name (const char *drive)
> > > -   char *ret, *ptr;
> > > -   const char *iptr;
> > > -
> > > --  ret = xmalloc (strlen (drive) * 2);
> > > -+  ret = xcalloc (2, strlen (drive));
> > > -   ptr = ret;
> > > -   for (iptr = drive; *iptr; iptr++)
> > > -     {
> > > -diff --git a/util/grub-file.c b/util/grub-file.c
> > > -index 50c18b6..b2e7dd6 100644
> > > ---- a/util/grub-file.c
> > > -+++ b/util/grub-file.c
> > > -@@ -54,7 +54,7 @@ main (int argc, char *argv[])
> > > -
> > > -   grub_util_host_init (&argc, &argv);
> > > -
> > > --  argv2 = xmalloc (argc * sizeof (argv2[0]));
> > > -+  argv2 = xcalloc (argc, sizeof (argv2[0]));
> > > -
> > > -   if (argc == 2 && strcmp (argv[1], "--version") == 0)
> > > -     {
> > > -diff --git a/util/grub-fstest.c b/util/grub-fstest.c
> > > -index f14e02d..57246af 100644
> > > ---- a/util/grub-fstest.c
> > > -+++ b/util/grub-fstest.c
> > > -@@ -650,7 +650,7 @@ argp_parser (int key, char *arg, struct
> > > argp_state *state)
> > > -   if (args_count < num_disks)
> > > -     {
> > > -       if (args_count == 0)
> > > --      images = xmalloc (num_disks * sizeof (images[0]));
> > > -+      images = xcalloc (num_disks, sizeof (images[0]));
> > > -       images[args_count] = grub_canonicalize_file_name (arg);
> > > -       args_count++;
> > > -       return 0;
> > > -@@ -734,7 +734,7 @@ main (int argc, char *argv[])
> > > -
> > > -   grub_util_host_init (&argc, &argv);
> > > -
> > > --  args = xmalloc (argc * sizeof (args[0]));
> > > -+  args = xcalloc (argc, sizeof (args[0]));
> > > -
> > > -   argp_parse (&argp, argc, argv, 0, 0, 0);
> > > -
> > > -diff --git a/util/grub-install-common.c b/util/grub-install-common.c
> > > -index ca0ac61..0295d40 100644
> > > ---- a/util/grub-install-common.c
> > > -+++ b/util/grub-install-common.c
> > > -@@ -286,7 +286,7 @@ handle_install_list (struct install_list *il,
> > > const char *val,
> > > -       il->n_entries++;
> > > -     }
> > > -   il->n_alloc = il->n_entries + 1;
> > > --  il->entries = xmalloc (il->n_alloc * sizeof (il->entries[0]));
> > > -+  il->entries = xcalloc (il->n_alloc, sizeof (il->entries[0]));
> > > -   ptr = val;
> > > -   for (ce = il->entries; ; ce++)
> > > -     {
> > > -diff --git a/util/grub-install.c b/util/grub-install.c
> > > -index 8a55ad4..a82725f 100644
> > > ---- a/util/grub-install.c
> > > -+++ b/util/grub-install.c
> > > -@@ -626,7 +626,7 @@ device_map_check_duplicates (const char
> > > *dev_map)
> > > -   if (! fp)
> > > -     return;
> > > -
> > > --  d = xmalloc (alloced * sizeof (d[0]));
> > > -+  d = xcalloc (alloced, sizeof (d[0]));
> > > -
> > > -   while (fgets (buf, sizeof (buf), fp))
> > > -     {
> > > -@@ -1260,7 +1260,7 @@ main (int argc, char *argv[])
> > > -       ndev++;
> > > -     }
> > > -
> > > --  grub_drives = xmalloc (sizeof (grub_drives[0]) * (ndev + 1));
> > > -+  grub_drives = xcalloc (ndev + 1, sizeof (grub_drives[0]));
> > > -
> > > -   for (curdev = grub_devices, curdrive = grub_drives; *curdev;
> > > curdev++,
> > > -        curdrive++)
> > > -diff --git a/util/grub-mkimagexx.c b/util/grub-mkimagexx.c
> > > -index bc087c2..d97d0e7 100644
> > > ---- a/util/grub-mkimagexx.c
> > > -+++ b/util/grub-mkimagexx.c
> > > -@@ -2294,10 +2294,8 @@ SUFFIX (grub_mkimage_load_image) (const char
> > > *kernel_path,
> > > -                     + grub_host_to_target16 (e->e_shstrndx) *
> > > smd.section_entsize);
> > > -   smd.strtab = (char *) e + grub_host_to_target_addr (s-
> > > > sh_offset);
> > > -
> > > --  smd.addrs = xmalloc (sizeof (*smd.addrs) * smd.num_sections);
> > > --  memset (smd.addrs, 0, sizeof (*smd.addrs) * smd.num_sections);
> > > --  smd.vaddrs = xmalloc (sizeof (*smd.vaddrs) * smd.num_sections);
> > > --  memset (smd.vaddrs, 0, sizeof (*smd.vaddrs) * smd.num_sections);
> > > -+  smd.addrs = xcalloc (smd.num_sections, sizeof (*smd.addrs));
> > > -+  smd.vaddrs = xcalloc (smd.num_sections, sizeof (*smd.vaddrs));
> > > -
> > > -   SUFFIX (locate_sections) (e, kernel_path, &smd, layout,
> > > image_target);
> > > -
> > > -diff --git a/util/grub-mkrescue.c b/util/grub-mkrescue.c
> > > -index ce2cbc4..5183102 100644
> > > ---- a/util/grub-mkrescue.c
> > > -+++ b/util/grub-mkrescue.c
> > > -@@ -441,8 +441,8 @@ main (int argc, char *argv[])
> > > -   xorriso = xstrdup ("xorriso");
> > > -   label_font = grub_util_path_concat (2, pkgdatadir,
> > > "unicode.pf2");
> > > -
> > > --  argp_argv = xmalloc (sizeof (argp_argv[0]) * argc);
> > > --  xorriso_tail_argv = xmalloc (sizeof (argp_argv[0]) * argc);
> > > -+  argp_argv = xcalloc (argc, sizeof (argp_argv[0]));
> > > -+  xorriso_tail_argv = xcalloc (argc, sizeof (argp_argv[0]));
> > > -
> > > -   xorriso_tail_argc = 0;
> > > -   /* Program name */
> > > -diff --git a/util/grub-mkstandalone.c b/util/grub-mkstandalone.c
> > > -index 4907d44..edf3097 100644
> > > ---- a/util/grub-mkstandalone.c
> > > -+++ b/util/grub-mkstandalone.c
> > > -@@ -296,7 +296,7 @@ main (int argc, char *argv[])
> > > -   grub_util_host_init (&argc, &argv);
> > > -   grub_util_disable_fd_syncs ();
> > > -
> > > --  files = xmalloc ((argc + 1) * sizeof (files[0]));
> > > -+  files = xcalloc (argc + 1, sizeof (files[0]));
> > > -
> > > -   argp_parse (&argp, argc, argv, 0, 0, 0);
> > > -
> > > -diff --git a/util/grub-pe2elf.c b/util/grub-pe2elf.c
> > > -index 0d4084a..1133129 100644
> > > ---- a/util/grub-pe2elf.c
> > > -+++ b/util/grub-pe2elf.c
> > > -@@ -100,9 +100,9 @@ write_section_data (FILE* fp, const char *name,
> > > char *image,
> > > -   char *pe_strtab = (image + pe_chdr->symtab_offset
> > > -                    + pe_chdr->num_symbols * sizeof (struct
> > > grub_pe32_symbol));
> > > -
> > > --  section_map = xmalloc ((2 * pe_chdr->num_sections + 5) * sizeof
> > > (int));
> > > -+  section_map = xcalloc (2 * pe_chdr->num_sections + 5, sizeof
> > > (int));
> > > -   section_map[0] = 0;
> > > --  shdr = xmalloc ((2 * pe_chdr->num_sections + 5) * sizeof
> > > (shdr[0]));
> > > -+  shdr = xcalloc (2 * pe_chdr->num_sections + 5, sizeof (shdr[0]));
> > > -   idx = 1;
> > > -   idx_reloc = pe_chdr->num_sections + 1;
> > > -
> > > -@@ -233,7 +233,7 @@ write_reloc_section (FILE* fp, const char *name,
> > > char *image,
> > > -
> > > -       pe_sec = pe_shdr + shdr[i].sh_link;
> > > -       pe_rel = (struct grub_pe32_reloc *) (image + pe_sec-
> > > > relocations_offset);
> > > --      rel = (elf_reloc_t *) xmalloc (pe_sec->num_relocations *
> > > sizeof (elf_reloc_t));
> > > -+      rel = (elf_reloc_t *) xcalloc (pe_sec->num_relocations,
> > > sizeof (elf_reloc_t));
> > > -       num_rels = 0;
> > > -       modified = 0;
> > > -
> > > -@@ -365,12 +365,10 @@ write_symbol_table (FILE* fp, const char
> > > *name, char *image,
> > > -   pe_symtab = (struct grub_pe32_symbol *) (image + pe_chdr-
> > > > symtab_offset);
> > > -   pe_strtab = (char *) (pe_symtab + pe_chdr->num_symbols);
> > > -
> > > --  symtab = (Elf_Sym *) xmalloc ((pe_chdr->num_symbols + 1) *
> > > --                              sizeof (Elf_Sym));
> > > --  memset (symtab, 0, (pe_chdr->num_symbols + 1) * sizeof
> > > (Elf_Sym));
> > > -+  symtab = (Elf_Sym *) xcalloc (pe_chdr->num_symbols + 1, sizeof
> > > (Elf_Sym));
> > > -   num_syms = 1;
> > > -
> > > --  symtab_map = (int *) xmalloc (pe_chdr->num_symbols * sizeof
> > > (int));
> > > -+  symtab_map = (int *) xcalloc (pe_chdr->num_symbols, sizeof
> > > (int));
> > > -
> > > -   for (i = 0; i < (int) pe_chdr->num_symbols;
> > > -        i += pe_symtab->num_aux + 1, pe_symtab += pe_symtab->num_aux
> > > + 1)
> > > -diff --git a/util/grub-probe.c b/util/grub-probe.c
> > > -index 81d27ee..cbe6ed9 100644
> > > ---- a/util/grub-probe.c
> > > -+++ b/util/grub-probe.c
> > > -@@ -361,8 +361,8 @@ probe (const char *path, char **device_names,
> > > char delim)
> > > -       grub_util_pull_device (*curdev);
> > > -       ndev++;
> > > -     }
> > > --
> > > -+
> > > -+  drives_names = xcalloc (ndev + 1, sizeof (drives_names[0]));
> > > -
> > > -   for (curdev = device_names, curdrive = drives_names; *curdev;
> > > curdev++,
> > > -        curdrive++)
> > > ---
> > > -2.14.4
> > > -
> > > diff --git a/meta/recipes-bsp/grub/files/CVE-2020-14309-CVE-2020-
> > > 14310-CVE-2020-14311-malloc-Use-overflow-checking-primitives-where-
> > > we-do-.patch b/meta/recipes-bsp/grub/files/CVE-2020-14309-CVE-2020-
> > > 14310-CVE-2020-14311-malloc-Use-overflow-checking-primitives-where-
> > > we-do-.patch
> > > deleted file mode 100644
> > > index 7214ead9a7..0000000000
> > > --- a/meta/recipes-bsp/grub/files/CVE-2020-14309-CVE-2020-14310-CVE-
> > > 2020-14311-malloc-Use-overflow-checking-primitives-where-we-do-.patch
> > > +++ /dev/null
> > > @@ -1,1330 +0,0 @@
> > > -From eb77d1ef65e25746acff43545f62a71360b15eec Mon Sep 17 00:00:00
> > > 2001
> > > -From: Peter Jones <pjones@redhat.com>
> > > -Date: Mon, 15 Jun 2020 12:28:27 -0400
> > > -Subject: [PATCH 6/9] malloc: Use overflow checking primitives where
> > > we do
> > > - complex allocations
> > > -
> > > -This attempts to fix the places where we do the following where
> > > -arithmetic_expr may include unvalidated data:
> > > -
> > > -  X = grub_malloc(arithmetic_expr);
> > > -
> > > -It accomplishes this by doing the arithmetic ahead of time using
> > > grub_add(),
> > > -grub_sub(), grub_mul() and testing for overflow before proceeding.
> > > -
> > > -Among other issues, this fixes:
> > > -  - allocation of integer overflow in grub_video_bitmap_create()
> > > -    reported by Chris Coulson,
> > > -  - allocation of integer overflow in grub_png_decode_image_header()
> > > -    reported by Chris Coulson,
> > > -  - allocation of integer overflow in grub_squash_read_symlink()
> > > -    reported by Chris Coulson,
> > > -  - allocation of integer overflow in grub_ext2_read_symlink()
> > > -    reported by Chris Coulson,
> > > -  - allocation of integer overflow in read_section_as_string()
> > > -    reported by Chris Coulson.
> > > -
> > > -Fixes: CVE-2020-14309, CVE-2020-14310, CVE-2020-14311
> > > -
> > > -Signed-off-by: Peter Jones <pjones@redhat.com>
> > > -Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> > > -
> > > -Upstream-Status: Backport
> > > -CVE: CVE-2020-14309 CVE-2020-14310 CVE-2020-14311
> > > -
> > > -Reference to upstream patch:
> > > -
> > >
> https://git.savannah.gnu.org/cgit/grub.git/commit/?id=3f05d693d1274965ffbe4ba99080dc2c570944c6
> > > -
> > > -Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
> > > ----
> > > - grub-core/commands/legacycfg.c | 29 +++++++++++++++++++-----
> > > - grub-core/commands/wildcard.c  | 36 ++++++++++++++++++++++++-----
> > > - grub-core/disk/ldm.c           | 32 ++++++++++++++++++--------
> > > - grub-core/font/font.c          |  7 +++++-
> > > - grub-core/fs/btrfs.c           | 28 +++++++++++++++--------
> > > - grub-core/fs/ext2.c            | 10 ++++++++-
> > > - grub-core/fs/iso9660.c         | 51 +++++++++++++++++++++++++++++--
> > > -----------
> > > - grub-core/fs/sfs.c             | 27 +++++++++++++++++-----
> > > - grub-core/fs/squash4.c         | 45 ++++++++++++++++++++++++++++---
> > > ------
> > > - grub-core/fs/udf.c             | 41 +++++++++++++++++++++----------
> > > --
> > > - grub-core/fs/xfs.c             | 11 +++++----
> > > - grub-core/fs/zfs/zfs.c         | 22 ++++++++++++------
> > > - grub-core/fs/zfs/zfscrypt.c    |  7 +++++-
> > > - grub-core/lib/arg.c            | 20 +++++++++++++++--
> > > - grub-core/loader/i386/bsd.c    |  8 ++++++-
> > > - grub-core/net/dns.c            |  9 +++++++-
> > > - grub-core/normal/charset.c     | 10 +++++++--
> > > - grub-core/normal/cmdline.c     | 14 ++++++++++--
> > > - grub-core/normal/menu_entry.c  | 13 +++++++++--
> > > - grub-core/script/argv.c        | 16 +++++++++++--
> > > - grub-core/script/lexer.c       | 21 ++++++++++++++---
> > > - grub-core/video/bitmap.c       | 25 +++++++++++++--------
> > > - grub-core/video/readers/png.c  | 13 +++++++++--
> > > - 23 files changed, 382 insertions(+), 113 deletions(-)
> > > -
> > > -diff --git a/grub-core/commands/legacycfg.c b/grub-
> > > core/commands/legacycfg.c
> > > -index 5e3ec0d..cc5971f 100644
> > > ---- a/grub-core/commands/legacycfg.c
> > > -+++ b/grub-core/commands/legacycfg.c
> > > -@@ -32,6 +32,7 @@
> > > - #include <grub/auth.h>
> > > - #include <grub/disk.h>
> > > - #include <grub/partition.h>
> > > -+#include <grub/safemath.h>
> > > -
> > > - GRUB_MOD_LICENSE ("GPLv3+");
> > > -
> > > -@@ -104,13 +105,22 @@ legacy_file (const char *filename)
> > > -       if (newsuffix)
> > > -         {
> > > -           char *t;
> > > --
> > > -+          grub_size_t sz;
> > > -+
> > > -+          if (grub_add (grub_strlen (suffix), grub_strlen
> > > (newsuffix), &sz) ||
> > > -+              grub_add (sz, 1, &sz))
> > > -+            {
> > > -+              grub_errno = GRUB_ERR_OUT_OF_RANGE;
> > > -+              goto fail_0;
> > > -+            }
> > > -+
> > > -           t = suffix;
> > > --          suffix = grub_realloc (suffix, grub_strlen (suffix)
> > > --                                 + grub_strlen (newsuffix) + 1);
> > > -+          suffix = grub_realloc (suffix, sz);
> > > -           if (!suffix)
> > > -             {
> > > -               grub_free (t);
> > > -+
> > > -+ fail_0:
> > > -               grub_free (entrysrc);
> > > -               grub_free (parsed);
> > > -               grub_free (newsuffix);
> > > -@@ -154,13 +164,22 @@ legacy_file (const char *filename)
> > > -         else
> > > -           {
> > > -             char *t;
> > > -+            grub_size_t sz;
> > > -+
> > > -+            if (grub_add (grub_strlen (entrysrc), grub_strlen
> > > (parsed), &sz) ||
> > > -+                grub_add (sz, 1, &sz))
> > > -+              {
> > > -+                grub_errno = GRUB_ERR_OUT_OF_RANGE;
> > > -+                goto fail_1;
> > > -+              }
> > > -
> > > -             t = entrysrc;
> > > --            entrysrc = grub_realloc (entrysrc, grub_strlen
> > > (entrysrc)
> > > --                                     + grub_strlen (parsed) + 1);
> > > -+            entrysrc = grub_realloc (entrysrc, sz);
> > > -             if (!entrysrc)
> > > -               {
> > > -                 grub_free (t);
> > > -+
> > > -+ fail_1:
> > > -                 grub_free (parsed);
> > > -                 grub_free (suffix);
> > > -                 return grub_errno;
> > > -diff --git a/grub-core/commands/wildcard.c b/grub-
> > > core/commands/wildcard.c
> > > -index 4a106ca..cc32903 100644
> > > ---- a/grub-core/commands/wildcard.c
> > > -+++ b/grub-core/commands/wildcard.c
> > > -@@ -23,6 +23,7 @@
> > > - #include <grub/file.h>
> > > - #include <grub/device.h>
> > > - #include <grub/script_sh.h>
> > > -+#include <grub/safemath.h>
> > > -
> > > - #include <regex.h>
> > > -
> > > -@@ -48,6 +49,7 @@ merge (char **dest, char **ps)
> > > -   int i;
> > > -   int j;
> > > -   char **p;
> > > -+  grub_size_t sz;
> > > -
> > > -   if (! dest)
> > > -     return ps;
> > > -@@ -60,7 +62,12 @@ merge (char **dest, char **ps)
> > > -   for (j = 0; ps[j]; j++)
> > > -     ;
> > > -
> > > --  p = grub_realloc (dest, sizeof (char*) * (i + j + 1));
> > > -+  if (grub_add (i, j, &sz) ||
> > > -+      grub_add (sz, 1, &sz) ||
> > > -+      grub_mul (sz, sizeof (char *), &sz))
> > > -+    return dest;
> > > -+
> > > -+  p = grub_realloc (dest, sz);
> > > -   if (! p)
> > > -     {
> > > -       grub_free (dest);
> > > -@@ -115,8 +122,15 @@ make_regex (const char *start, const char *end,
> > > regex_t *regexp)
> > > -   char ch;
> > > -   int i = 0;
> > > -   unsigned len = end - start;
> > > --  char *buffer = grub_malloc (len * 2 + 2 + 1); /* worst case size.
> > > */
> > > -+  char *buffer;
> > > -+  grub_size_t sz;
> > > -
> > > -+  /* Worst case size is (len * 2 + 2 + 1). */
> > > -+  if (grub_mul (len, 2, &sz) ||
> > > -+      grub_add (sz, 3, &sz))
> > > -+    return 1;
> > > -+
> > > -+  buffer = grub_malloc (sz);
> > > -   if (! buffer)
> > > -     return 1;
> > > -
> > > -@@ -226,6 +240,7 @@ match_devices_iter (const char *name, void
> > > *data)
> > > -   struct match_devices_ctx *ctx = data;
> > > -   char **t;
> > > -   char *buffer;
> > > -+  grub_size_t sz;
> > > -
> > > -   /* skip partitions if asked to. */
> > > -   if (ctx->noparts && grub_strchr (name, ','))
> > > -@@ -239,11 +254,16 @@ match_devices_iter (const char *name, void
> > > *data)
> > > -   if (regexec (ctx->regexp, buffer, 0, 0, 0))
> > > -     {
> > > -       grub_dprintf ("expand", "not matched\n");
> > > -+ fail:
> > > -       grub_free (buffer);
> > > -       return 0;
> > > -     }
> > > -
> > > --  t = grub_realloc (ctx->devs, sizeof (char*) * (ctx->ndev + 2));
> > > -+  if (grub_add (ctx->ndev, 2, &sz) ||
> > > -+      grub_mul (sz, sizeof (char *), &sz))
> > > -+    goto fail;
> > > -+
> > > -+  t = grub_realloc (ctx->devs, sz);
> > > -   if (! t)
> > > -     {
> > > -       grub_free (buffer);
> > > -@@ -300,6 +320,7 @@ match_files_iter (const char *name,
> > > -   struct match_files_ctx *ctx = data;
> > > -   char **t;
> > > -   char *buffer;
> > > -+  grub_size_t sz;
> > > -
> > > -   /* skip . and .. names */
> > > -   if (grub_strcmp(".", name) == 0 || grub_strcmp("..", name) == 0)
> > > -@@ -315,9 +336,14 @@ match_files_iter (const char *name,
> > > -   if (! buffer)
> > > -     return 1;
> > > -
> > > --  t = grub_realloc (ctx->files, sizeof (char*) * (ctx->nfile + 2));
> > > --  if (! t)
> > > -+  if (grub_add (ctx->nfile, 2, &sz) ||
> > > -+      grub_mul (sz, sizeof (char *), &sz))
> > > -+    goto fail;
> > > -+
> > > -+  t = grub_realloc (ctx->files, sz);
> > > -+  if (!t)
> > > -     {
> > > -+ fail:
> > > -       grub_free (buffer);
> > > -       return 1;
> > > -     }
> > > -diff --git a/grub-core/disk/ldm.c b/grub-core/disk/ldm.c
> > > -index e632370..58f8a53 100644
> > > ---- a/grub-core/disk/ldm.c
> > > -+++ b/grub-core/disk/ldm.c
> > > -@@ -25,6 +25,7 @@
> > > - #include <grub/msdos_partition.h>
> > > - #include <grub/gpt_partition.h>
> > > - #include <grub/i18n.h>
> > > -+#include <grub/safemath.h>
> > > -
> > > - #ifdef GRUB_UTIL
> > > - #include <grub/emu/misc.h>
> > > -@@ -289,6 +290,7 @@ make_vg (grub_disk_t disk,
> > > -       struct grub_ldm_vblk vblk[GRUB_DISK_SECTOR_SIZE
> > > -                               / sizeof (struct grub_ldm_vblk)];
> > > -       unsigned i;
> > > -+      grub_size_t sz;
> > > -       err = grub_disk_read (disk, cursec, 0,
> > > -                           sizeof(vblk), &vblk);
> > > -       if (err)
> > > -@@ -350,7 +352,13 @@ make_vg (grub_disk_t disk,
> > > -             grub_free (lv);
> > > -             goto fail2;
> > > -           }
> > > --        lv->name = grub_malloc (*ptr + 1);
> > > -+        if (grub_add (*ptr, 1, &sz))
> > > -+          {
> > > -+            grub_free (lv->internal_id);
> > > -+            grub_free (lv);
> > > -+            goto fail2;
> > > -+          }
> > > -+        lv->name = grub_malloc (sz);
> > > -         if (!lv->name)
> > > -           {
> > > -             grub_free (lv->internal_id);
> > > -@@ -599,10 +607,13 @@ make_vg (grub_disk_t disk,
> > > -         if (lv->segments->node_alloc == lv->segments->node_count)
> > > -           {
> > > -             void *t;
> > > --            lv->segments->node_alloc *= 2;
> > > --            t = grub_realloc (lv->segments->nodes,
> > > --                              sizeof (*lv->segments->nodes)
> > > --                              * lv->segments->node_alloc);
> > > -+            grub_size_t sz;
> > > -+
> > > -+            if (grub_mul (lv->segments->node_alloc, 2, &lv-
> > > > segments->node_alloc) ||
> > > -+                grub_mul (lv->segments->node_alloc, sizeof (*lv-
> > > > segments->nodes), &sz))
> > > -+              goto fail2;
> > > -+
> > > -+            t = grub_realloc (lv->segments->nodes, sz);
> > > -             if (!t)
> > > -               goto fail2;
> > > -             lv->segments->nodes = t;
> > > -@@ -723,10 +734,13 @@ make_vg (grub_disk_t disk,
> > > -             if (comp->segment_alloc == comp->segment_count)
> > > -               {
> > > -                 void *t;
> > > --                comp->segment_alloc *= 2;
> > > --                t = grub_realloc (comp->segments,
> > > --                                  comp->segment_alloc
> > > --                                  * sizeof (*comp->segments));
> > > -+                grub_size_t sz;
> > > -+
> > > -+                if (grub_mul (comp->segment_alloc, 2, &comp-
> > > > segment_alloc) ||
> > > -+                    grub_mul (comp->segment_alloc, sizeof (*comp-
> > > > segments), &sz))
> > > -+                  goto fail2;
> > > -+
> > > -+                t = grub_realloc (comp->segments, sz);
> > > -                 if (!t)
> > > -                   goto fail2;
> > > -                 comp->segments = t;
> > > -diff --git a/grub-core/font/font.c b/grub-core/font/font.c
> > > -index 8e118b3..5edb477 100644
> > > ---- a/grub-core/font/font.c
> > > -+++ b/grub-core/font/font.c
> > > -@@ -30,6 +30,7 @@
> > > - #include <grub/unicode.h>
> > > - #include <grub/fontformat.h>
> > > - #include <grub/env.h>
> > > -+#include <grub/safemath.h>
> > > -
> > > - GRUB_MOD_LICENSE ("GPLv3+");
> > > -
> > > -@@ -360,9 +361,13 @@ static char *
> > > - read_section_as_string (struct font_file_section *section)
> > > - {
> > > -   char *str;
> > > -+  grub_size_t sz;
> > > -   grub_ssize_t ret;
> > > -
> > > --  str = grub_malloc (section->length + 1);
> > > -+  if (grub_add (section->length, 1, &sz))
> > > -+    return NULL;
> > > -+
> > > -+  str = grub_malloc (sz);
> > > -   if (!str)
> > > -     return 0;
> > > -
> > > -diff --git a/grub-core/fs/btrfs.c b/grub-core/fs/btrfs.c
> > > -index 11272ef..2b65bd5 100644
> > > ---- a/grub-core/fs/btrfs.c
> > > -+++ b/grub-core/fs/btrfs.c
> > > -@@ -40,6 +40,7 @@
> > > - #include <grub/btrfs.h>
> > > - #include <grub/crypto.h>
> > > - #include <grub/diskfilter.h>
> > > -+#include <grub/safemath.h>
> > > -
> > > - GRUB_MOD_LICENSE ("GPLv3+");
> > > -
> > > -@@ -329,9 +330,13 @@ save_ref (struct grub_btrfs_leaf_descriptor
> > > *desc,
> > > -   if (desc->allocated < desc->depth)
> > > -     {
> > > -       void *newdata;
> > > --      desc->allocated *= 2;
> > > --      newdata = grub_realloc (desc->data, sizeof (desc->data[0])
> > > --                            * desc->allocated);
> > > -+      grub_size_t sz;
> > > -+
> > > -+      if (grub_mul (desc->allocated, 2, &desc->allocated) ||
> > > -+        grub_mul (desc->allocated, sizeof (desc->data[0]), &sz))
> > > -+      return GRUB_ERR_OUT_OF_RANGE;
> > > -+
> > > -+      newdata = grub_realloc (desc->data, sz);
> > > -       if (!newdata)
> > > -       return grub_errno;
> > > -       desc->data = newdata;
> > > -@@ -622,16 +627,21 @@ find_device (struct grub_btrfs_data *data,
> > > grub_uint64_t id)
> > > -   if (data->n_devices_attached > data->n_devices_allocated)
> > > -     {
> > > -       void *tmp;
> > > --      data->n_devices_allocated = 2 * data->n_devices_attached + 1;
> > > --      data->devices_attached
> > > --      = grub_realloc (tmp = data->devices_attached,
> > > --                      data->n_devices_allocated
> > > --                      * sizeof (data->devices_attached[0]));
> > > -+      grub_size_t sz;
> > > -+
> > > -+      if (grub_mul (data->n_devices_attached, 2, &data-
> > > > n_devices_allocated) ||
> > > -+        grub_add (data->n_devices_allocated, 1, &data-
> > > > n_devices_allocated) ||
> > > -+        grub_mul (data->n_devices_allocated, sizeof (data-
> > > > devices_attached[0]), &sz))
> > > -+      goto fail;
> > > -+
> > > -+      data->devices_attached = grub_realloc (tmp = data-
> > > > devices_attached, sz);
> > > -       if (!data->devices_attached)
> > > -       {
> > > -+        data->devices_attached = tmp;
> > > -+
> > > -+ fail:
> > > -         if (ctx.dev_found)
> > > -           grub_device_close (ctx.dev_found);
> > > --        data->devices_attached = tmp;
> > > -         return NULL;
> > > -       }
> > > -     }
> > > -diff --git a/grub-core/fs/ext2.c b/grub-core/fs/ext2.c
> > > -index 9b38980..ac33bcd 100644
> > > ---- a/grub-core/fs/ext2.c
> > > -+++ b/grub-core/fs/ext2.c
> > > -@@ -46,6 +46,7 @@
> > > - #include <grub/dl.h>
> > > - #include <grub/types.h>
> > > - #include <grub/fshelp.h>
> > > -+#include <grub/safemath.h>
> > > -
> > > - GRUB_MOD_LICENSE ("GPLv3+");
> > > -
> > > -@@ -703,6 +704,7 @@ grub_ext2_read_symlink (grub_fshelp_node_t node)
> > > - {
> > > -   char *symlink;
> > > -   struct grub_fshelp_node *diro = node;
> > > -+  grub_size_t sz;
> > > -
> > > -   if (! diro->inode_read)
> > > -     {
> > > -@@ -717,7 +719,13 @@ grub_ext2_read_symlink (grub_fshelp_node_t
> > > node)
> > > -        }
> > > -     }
> > > -
> > > --  symlink = grub_malloc (grub_le_to_cpu32 (diro->inode.size) + 1);
> > > -+  if (grub_add (grub_le_to_cpu32 (diro->inode.size), 1, &sz))
> > > -+    {
> > > -+      grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow is
> > > detected"));
> > > -+      return NULL;
> > > -+    }
> > > -+
> > > -+  symlink = grub_malloc (sz);
> > > -   if (! symlink)
> > > -     return 0;
> > > -
> > > -diff --git a/grub-core/fs/iso9660.c b/grub-core/fs/iso9660.c
> > > -index 4f1b52a..7ba5b30 100644
> > > ---- a/grub-core/fs/iso9660.c
> > > -+++ b/grub-core/fs/iso9660.c
> > > -@@ -28,6 +28,7 @@
> > > - #include <grub/fshelp.h>
> > > - #include <grub/charset.h>
> > > - #include <grub/datetime.h>
> > > -+#include <grub/safemath.h>
> > > -
> > > - GRUB_MOD_LICENSE ("GPLv3+");
> > > -
> > > -@@ -531,8 +532,13 @@ add_part (struct iterate_dir_ctx *ctx,
> > > -         int len2)
> > > - {
> > > -   int size = ctx->symlink ? grub_strlen (ctx->symlink) : 0;
> > > -+  grub_size_t sz;
> > > -
> > > --  ctx->symlink = grub_realloc (ctx->symlink, size + len2 + 1);
> > > -+  if (grub_add (size, len2, &sz) ||
> > > -+      grub_add (sz, 1, &sz))
> > > -+    return;
> > > -+
> > > -+  ctx->symlink = grub_realloc (ctx->symlink, sz);
> > > -   if (! ctx->symlink)
> > > -     return;
> > > -
> > > -@@ -560,17 +566,24 @@ susp_iterate_dir (struct
> > > grub_iso9660_susp_entry *entry,
> > > -       {
> > > -         grub_size_t off = 0, csize = 1;
> > > -         char *old;
> > > -+        grub_size_t sz;
> > > -+
> > > -         csize = entry->len - 5;
> > > -         old = ctx->filename;
> > > -         if (ctx->filename_alloc)
> > > -           {
> > > -             off = grub_strlen (ctx->filename);
> > > --            ctx->filename = grub_realloc (ctx->filename, csize +
> > > off + 1);
> > > -+            if (grub_add (csize, off, &sz) ||
> > > -+                grub_add (sz, 1, &sz))
> > > -+              return GRUB_ERR_OUT_OF_RANGE;
> > > -+            ctx->filename = grub_realloc (ctx->filename, sz);
> > > -           }
> > > -         else
> > > -           {
> > > -             off = 0;
> > > --            ctx->filename = grub_zalloc (csize + 1);
> > > -+            if (grub_add (csize, 1, &sz))
> > > -+              return GRUB_ERR_OUT_OF_RANGE;
> > > -+            ctx->filename = grub_zalloc (sz);
> > > -           }
> > > -         if (!ctx->filename)
> > > -           {
> > > -@@ -776,14 +789,18 @@ grub_iso9660_iterate_dir (grub_fshelp_node_t
> > > dir,
> > > -           if (node->have_dirents >= node->alloc_dirents)
> > > -             {
> > > -               struct grub_fshelp_node *new_node;
> > > --              node->alloc_dirents *= 2;
> > > --              new_node = grub_realloc (node,
> > > --                                       sizeof (struct
> > > grub_fshelp_node)
> > > --                                       + ((node->alloc_dirents
> > > --                                           - ARRAY_SIZE (node-
> > > > dirents))
> > > --                                          * sizeof (node-
> > > > dirents[0])));
> > > -+              grub_size_t sz;
> > > -+
> > > -+              if (grub_mul (node->alloc_dirents, 2, &node-
> > > > alloc_dirents) ||
> > > -+                  grub_sub (node->alloc_dirents, ARRAY_SIZE (node-
> > > > dirents), &sz) ||
> > > -+                  grub_mul (sz, sizeof (node->dirents[0]), &sz) ||
> > > -+                  grub_add (sz, sizeof (struct grub_fshelp_node),
> > > &sz))
> > > -+                goto fail_0;
> > > -+
> > > -+              new_node = grub_realloc (node, sz);
> > > -               if (!new_node)
> > > -                 {
> > > -+ fail_0:
> > > -                   if (ctx.filename_alloc)
> > > -                     grub_free (ctx.filename);
> > > -                   grub_free (node);
> > > -@@ -799,14 +816,18 @@ grub_iso9660_iterate_dir (grub_fshelp_node_t
> > > dir,
> > > -               * sizeof (node->dirents[0]) < grub_strlen
> > > (ctx.symlink) + 1)
> > > -             {
> > > -               struct grub_fshelp_node *new_node;
> > > --              new_node = grub_realloc (node,
> > > --                                       sizeof (struct
> > > grub_fshelp_node)
> > > --                                       + ((node->alloc_dirents
> > > --                                           - ARRAY_SIZE (node-
> > > > dirents))
> > > --                                          * sizeof (node-
> > > > dirents[0]))
> > > --                                       + grub_strlen (ctx.symlink)
> > > + 1);
> > > -+              grub_size_t sz;
> > > -+
> > > -+              if (grub_sub (node->alloc_dirents, ARRAY_SIZE (node-
> > > > dirents), &sz) ||
> > > -+                  grub_mul (sz, sizeof (node->dirents[0]), &sz) ||
> > > -+                  grub_add (sz, sizeof (struct grub_fshelp_node) +
> > > 1, &sz) ||
> > > -+                  grub_add (sz, grub_strlen (ctx.symlink), &sz))
> > > -+                goto fail_1;
> > > -+
> > > -+              new_node = grub_realloc (node, sz);
> > > -               if (!new_node)
> > > -                 {
> > > -+ fail_1:
> > > -                   if (ctx.filename_alloc)
> > > -                     grub_free (ctx.filename);
> > > -                   grub_free (node);
> > > -diff --git a/grub-core/fs/sfs.c b/grub-core/fs/sfs.c
> > > -index 90f7fb3..de2b107 100644
> > > ---- a/grub-core/fs/sfs.c
> > > -+++ b/grub-core/fs/sfs.c
> > > -@@ -26,6 +26,7 @@
> > > - #include <grub/types.h>
> > > - #include <grub/fshelp.h>
> > > - #include <grub/charset.h>
> > > -+#include <grub/safemath.h>
> > > -
> > > - GRUB_MOD_LICENSE ("GPLv3+");
> > > -
> > > -@@ -307,10 +308,15 @@ grub_sfs_read_block (grub_fshelp_node_t node,
> > > grub_disk_addr_t fileblock)
> > > -       if (node->cache && node->cache_size >= node->cache_allocated)
> > > -       {
> > > -         struct cache_entry *e = node->cache;
> > > --        e = grub_realloc (node->cache,node->cache_allocated * 2
> > > --                          * sizeof (e[0]));
> > > -+        grub_size_t sz;
> > > -+
> > > -+        if (grub_mul (node->cache_allocated, 2 * sizeof (e[0]),
> > > &sz))
> > > -+          goto fail;
> > > -+
> > > -+        e = grub_realloc (node->cache, sz);
> > > -         if (!e)
> > > -           {
> > > -+ fail:
> > > -             grub_errno = 0;
> > > -             grub_free (node->cache);
> > > -             node->cache = 0;
> > > -@@ -477,10 +483,16 @@ grub_sfs_create_node (struct grub_fshelp_node
> > > **node,
> > > -   grub_size_t len = grub_strlen (name);
> > > -   grub_uint8_t *name_u8;
> > > -   int ret;
> > > -+  grub_size_t sz;
> > > -+
> > > -+  if (grub_mul (len, GRUB_MAX_UTF8_PER_LATIN1, &sz) ||
> > > -+      grub_add (sz, 1, &sz))
> > > -+    return 1;
> > > -+
> > > -   *node = grub_malloc (sizeof (**node));
> > > -   if (!*node)
> > > -     return 1;
> > > --  name_u8 = grub_malloc (len * GRUB_MAX_UTF8_PER_LATIN1 + 1);
> > > -+  name_u8 = grub_malloc (sz);
> > > -   if (!name_u8)
> > > -     {
> > > -       grub_free (*node);
> > > -@@ -724,8 +736,13 @@ grub_sfs_label (grub_device_t device, char
> > > **label)
> > > -   data = grub_sfs_mount (disk);
> > > -   if (data)
> > > -     {
> > > --      grub_size_t len = grub_strlen (data->label);
> > > --      *label = grub_malloc (len * GRUB_MAX_UTF8_PER_LATIN1 + 1);
> > > -+      grub_size_t sz, len = grub_strlen (data->label);
> > > -+
> > > -+      if (grub_mul (len, GRUB_MAX_UTF8_PER_LATIN1, &sz) ||
> > > -+        grub_add (sz, 1, &sz))
> > > -+      return GRUB_ERR_OUT_OF_RANGE;
> > > -+
> > > -+      *label = grub_malloc (sz);
> > > -       if (*label)
> > > -       *grub_latin1_to_utf8 ((grub_uint8_t *) *label,
> > > -                             (const grub_uint8_t *) data->label,
> > > -diff --git a/grub-core/fs/squash4.c b/grub-core/fs/squash4.c
> > > -index 95d5c1e..7851238 100644
> > > ---- a/grub-core/fs/squash4.c
> > > -+++ b/grub-core/fs/squash4.c
> > > -@@ -26,6 +26,7 @@
> > > - #include <grub/types.h>
> > > - #include <grub/fshelp.h>
> > > - #include <grub/deflate.h>
> > > -+#include <grub/safemath.h>
> > > - #include <minilzo.h>
> > > -
> > > - #include "xz.h"
> > > -@@ -459,7 +460,17 @@ grub_squash_read_symlink (grub_fshelp_node_t
> > > node)
> > > - {
> > > -   char *ret;
> > > -   grub_err_t err;
> > > --  ret = grub_malloc (grub_le_to_cpu32 (node->ino.symlink.namelen) +
> > > 1);
> > > -+  grub_size_t sz;
> > > -+
> > > -+  if (grub_add (grub_le_to_cpu32 (node->ino.symlink.namelen), 1,
> > > &sz))
> > > -+    {
> > > -+      grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow is
> > > detected"));
> > > -+      return NULL;
> > > -+    }
> > > -+
> > > -+  ret = grub_malloc (sz);
> > > -+  if (!ret)
> > > -+    return NULL;
> > > -
> > > -   err = read_chunk (node->data, ret,
> > > -                   grub_le_to_cpu32 (node->ino.symlink.namelen),
> > > -@@ -506,11 +517,16 @@ grub_squash_iterate_dir (grub_fshelp_node_t
> > > dir,
> > > -
> > > -   {
> > > -     grub_fshelp_node_t node;
> > > --    node = grub_malloc (sizeof (*node) + dir->stsize * sizeof (dir-
> > > > stack[0]));
> > > -+    grub_size_t sz;
> > > -+
> > > -+    if (grub_mul (dir->stsize, sizeof (dir->stack[0]), &sz) ||
> > > -+      grub_add (sz, sizeof (*node), &sz))
> > > -+      return 0;
> > > -+
> > > -+    node = grub_malloc (sz);
> > > -     if (!node)
> > > -       return 0;
> > > --    grub_memcpy (node, dir,
> > > --               sizeof (*node) + dir->stsize * sizeof (dir-
> > > > stack[0]));
> > > -+    grub_memcpy (node, dir, sz);
> > > -     if (hook (".", GRUB_FSHELP_DIR, node, hook_data))
> > > -       return 1;
> > > -
> > > -@@ -518,12 +534,15 @@ grub_squash_iterate_dir (grub_fshelp_node_t
> > > dir,
> > > -       {
> > > -       grub_err_t err;
> > > -
> > > --      node = grub_malloc (sizeof (*node) + dir->stsize * sizeof
> > > (dir->stack[0]));
> > > -+      if (grub_mul (dir->stsize, sizeof (dir->stack[0]), &sz) ||
> > > -+          grub_add (sz, sizeof (*node), &sz))
> > > -+        return 0;
> > > -+
> > > -+      node = grub_malloc (sz);
> > > -       if (!node)
> > > -         return 0;
> > > -
> > > --      grub_memcpy (node, dir,
> > > --                   sizeof (*node) + dir->stsize * sizeof (dir-
> > > > stack[0]));
> > > -+      grub_memcpy (node, dir, sz);
> > > -
> > > -       node->stsize--;
> > > -       err = read_chunk (dir->data, &node->ino, sizeof (node->ino),
> > > -@@ -557,6 +576,7 @@ grub_squash_iterate_dir (grub_fshelp_node_t dir,
> > > -         enum grub_fshelp_filetype filetype = GRUB_FSHELP_REG;
> > > -         struct grub_squash_dirent di;
> > > -         struct grub_squash_inode ino;
> > > -+        grub_size_t sz;
> > > -
> > > -         err = read_chunk (dir->data, &di, sizeof (di),
> > > -                           grub_le_to_cpu64 (dir->data-
> > > > sb.diroffset)
> > > -@@ -589,13 +609,16 @@ grub_squash_iterate_dir (grub_fshelp_node_t
> > > dir,
> > > -         if (grub_le_to_cpu16 (di.type) == SQUASH_TYPE_SYMLINK)
> > > -           filetype = GRUB_FSHELP_SYMLINK;
> > > -
> > > --        node = grub_malloc (sizeof (*node)
> > > --                            + (dir->stsize + 1) * sizeof (dir-
> > > > stack[0]));
> > > -+        if (grub_add (dir->stsize, 1, &sz) ||
> > > -+            grub_mul (sz, sizeof (dir->stack[0]), &sz) ||
> > > -+            grub_add (sz, sizeof (*node), &sz))
> > > -+          return 0;
> > > -+
> > > -+        node = grub_malloc (sz);
> > > -         if (! node)
> > > -           return 0;
> > > -
> > > --        grub_memcpy (node, dir,
> > > --                     sizeof (*node) + dir->stsize * sizeof (dir-
> > > > stack[0]));
> > > -+        grub_memcpy (node, dir, sz - sizeof(dir->stack[0]));
> > > -
> > > -         node->ino = ino;
> > > -         node->stack[node->stsize].ino_chunk = grub_le_to_cpu32
> > > (dh.ino_chunk);
> > > -diff --git a/grub-core/fs/udf.c b/grub-core/fs/udf.c
> > > -index a837616..21ac7f4 100644
> > > ---- a/grub-core/fs/udf.c
> > > -+++ b/grub-core/fs/udf.c
> > > -@@ -28,6 +28,7 @@
> > > - #include <grub/charset.h>
> > > - #include <grub/datetime.h>
> > > - #include <grub/udf.h>
> > > -+#include <grub/safemath.h>
> > > -
> > > - GRUB_MOD_LICENSE ("GPLv3+");
> > > -
> > > -@@ -890,9 +891,19 @@ read_string (const grub_uint8_t *raw,
> > > grub_size_t sz, char *outbuf)
> > > -       utf16[i] = (raw[2 * i + 1] << 8) | raw[2*i + 2];
> > > -     }
> > > -   if (!outbuf)
> > > --    outbuf = grub_malloc (utf16len * GRUB_MAX_UTF8_PER_UTF16 + 1);
> > > -+    {
> > > -+      grub_size_t size;
> > > -+
> > > -+      if (grub_mul (utf16len, GRUB_MAX_UTF8_PER_UTF16, &size) ||
> > > -+        grub_add (size, 1, &size))
> > > -+      goto fail;
> > > -+
> > > -+      outbuf = grub_malloc (size);
> > > -+    }
> > > -   if (outbuf)
> > > -     *grub_utf16_to_utf8 ((grub_uint8_t *) outbuf, utf16, utf16len)
> > > = '\0';
> > > -+
> > > -+ fail:
> > > -   grub_free (utf16);
> > > -   return outbuf;
> > > - }
> > > -@@ -1005,7 +1016,7 @@ grub_udf_read_symlink (grub_fshelp_node_t
> > > node)
> > > -   grub_size_t sz = U64 (node->block.fe.file_size);
> > > -   grub_uint8_t *raw;
> > > -   const grub_uint8_t *ptr;
> > > --  char *out, *optr;
> > > -+  char *out = NULL, *optr;
> > > -
> > > -   if (sz < 4)
> > > -     return NULL;
> > > -@@ -1013,14 +1024,16 @@ grub_udf_read_symlink (grub_fshelp_node_t
> > > node)
> > > -   if (!raw)
> > > -     return NULL;
> > > -   if (grub_udf_read_file (node, NULL, NULL, 0, sz, (char *) raw) <
> > > 0)
> > > --    {
> > > --      grub_free (raw);
> > > --      return NULL;
> > > --    }
> > > -+    goto fail_1;
> > > -
> > > --  out = grub_malloc (sz * 2 + 1);
> > > -+  if (grub_mul (sz, 2, &sz) ||
> > > -+      grub_add (sz, 1, &sz))
> > > -+    goto fail_0;
> > > -+
> > > -+  out = grub_malloc (sz);
> > > -   if (!out)
> > > -     {
> > > -+ fail_0:
> > > -       grub_free (raw);
> > > -       return NULL;
> > > -     }
> > > -@@ -1031,17 +1044,17 @@ grub_udf_read_symlink (grub_fshelp_node_t
> > > node)
> > > -     {
> > > -       grub_size_t s;
> > > -       if ((grub_size_t) (ptr - raw + 4) > sz)
> > > --      goto fail;
> > > -+      goto fail_1;
> > > -       if (!(ptr[2] == 0 && ptr[3] == 0))
> > > --      goto fail;
> > > -+      goto fail_1;
> > > -       s = 4 + ptr[1];
> > > -       if ((grub_size_t) (ptr - raw + s) > sz)
> > > --      goto fail;
> > > -+      goto fail_1;
> > > -       switch (*ptr)
> > > -       {
> > > -       case 1:
> > > -         if (ptr[1])
> > > --          goto fail;
> > > -+          goto fail_1;
> > > -         /* Fallthrough.  */
> > > -       case 2:
> > > -         /* in 4 bytes. out: 1 byte.  */
> > > -@@ -1066,11 +1079,11 @@ grub_udf_read_symlink (grub_fshelp_node_t
> > > node)
> > > -         if (optr != out)
> > > -           *optr++ = '/';
> > > -         if (!read_string (ptr + 4, s - 4, optr))
> > > --          goto fail;
> > > -+          goto fail_1;
> > > -         optr += grub_strlen (optr);
> > > -         break;
> > > -       default:
> > > --        goto fail;
> > > -+        goto fail_1;
> > > -       }
> > > -       ptr += s;
> > > -     }
> > > -@@ -1078,7 +1091,7 @@ grub_udf_read_symlink (grub_fshelp_node_t
> > > node)
> > > -   grub_free (raw);
> > > -   return out;
> > > -
> > > -- fail:
> > > -+ fail_1:
> > > -   grub_free (raw);
> > > -   grub_free (out);
> > > -   grub_error (GRUB_ERR_BAD_FS, "invalid symlink");
> > > -diff --git a/grub-core/fs/xfs.c b/grub-core/fs/xfs.c
> > > -index 96ffecb..ea65902 100644
> > > ---- a/grub-core/fs/xfs.c
> > > -+++ b/grub-core/fs/xfs.c
> > > -@@ -25,6 +25,7 @@
> > > - #include <grub/dl.h>
> > > - #include <grub/types.h>
> > > - #include <grub/fshelp.h>
> > > -+#include <grub/safemath.h>
> > > -
> > > - GRUB_MOD_LICENSE ("GPLv3+");
> > > -
> > > -@@ -899,6 +900,7 @@ static struct grub_xfs_data *
> > > - grub_xfs_mount (grub_disk_t disk)
> > > - {
> > > -   struct grub_xfs_data *data = 0;
> > > -+  grub_size_t sz;
> > > -
> > > -   data = grub_zalloc (sizeof (struct grub_xfs_data));
> > > -   if (!data)
> > > -@@ -913,10 +915,11 @@ grub_xfs_mount (grub_disk_t disk)
> > > -   if (!grub_xfs_sb_valid(data))
> > > -     goto fail;
> > > -
> > > --  data = grub_realloc (data,
> > > --                     sizeof (struct grub_xfs_data)
> > > --                     - sizeof (struct grub_xfs_inode)
> > > --                     + grub_xfs_inode_size(data) + 1);
> > > -+  if (grub_add (grub_xfs_inode_size (data),
> > > -+      sizeof (struct grub_xfs_data) - sizeof (struct
> > > grub_xfs_inode) + 1, &sz))
> > > -+    goto fail;
> > > -+
> > > -+  data = grub_realloc (data, sz);
> > > -
> > > -   if (! data)
> > > -     goto fail;
> > > -diff --git a/grub-core/fs/zfs/zfs.c b/grub-core/fs/zfs/zfs.c
> > > -index 381dde5..36d0373 100644
> > > ---- a/grub-core/fs/zfs/zfs.c
> > > -+++ b/grub-core/fs/zfs/zfs.c
> > > -@@ -55,6 +55,7 @@
> > > - #include <grub/deflate.h>
> > > - #include <grub/crypto.h>
> > > - #include <grub/i18n.h>
> > > -+#include <grub/safemath.h>
> > > -
> > > - GRUB_MOD_LICENSE ("GPLv3+");
> > > -
> > > -@@ -773,11 +774,14 @@ fill_vdev_info (struct grub_zfs_data *data,
> > > -   if (data->n_devices_attached > data->n_devices_allocated)
> > > -     {
> > > -       void *tmp;
> > > --      data->n_devices_allocated = 2 * data->n_devices_attached + 1;
> > > --      data->devices_attached
> > > --      = grub_realloc (tmp = data->devices_attached,
> > > --                      data->n_devices_allocated
> > > --                      * sizeof (data->devices_attached[0]));
> > > -+      grub_size_t sz;
> > > -+
> > > -+      if (grub_mul (data->n_devices_attached, 2, &data-
> > > > n_devices_allocated) ||
> > > -+        grub_add (data->n_devices_allocated, 1, &data-
> > > > n_devices_allocated) ||
> > > -+        grub_mul (data->n_devices_allocated, sizeof (data-
> > > > devices_attached[0]), &sz))
> > > -+      return GRUB_ERR_OUT_OF_RANGE;
> > > -+
> > > -+      data->devices_attached = grub_realloc (tmp = data-
> > > > devices_attached, sz);
> > > -       if (!data->devices_attached)
> > > -       {
> > > -         data->devices_attached = tmp;
> > > -@@ -3468,14 +3472,18 @@ grub_zfs_nvlist_lookup_nvlist (const char
> > > *nvlist, const char *name)
> > > - {
> > > -   char *nvpair;
> > > -   char *ret;
> > > --  grub_size_t size;
> > > -+  grub_size_t size, sz;
> > > -   int found;
> > > -
> > > -   found = nvlist_find_value (nvlist, name, DATA_TYPE_NVLIST,
> > > &nvpair,
> > > -                            &size, 0);
> > > -   if (!found)
> > > -     return 0;
> > > --  ret = grub_zalloc (size + 3 * sizeof (grub_uint32_t));
> > > -+
> > > -+  if (grub_add (size, 3 * sizeof (grub_uint32_t), &sz))
> > > -+      return 0;
> > > -+
> > > -+  ret = grub_zalloc (sz);
> > > -   if (!ret)
> > > -     return 0;
> > > -   grub_memcpy (ret, nvlist, sizeof (grub_uint32_t));
> > > -diff --git a/grub-core/fs/zfs/zfscrypt.c b/grub-
> > > core/fs/zfs/zfscrypt.c
> > > -index 1402e0b..de3b015 100644
> > > ---- a/grub-core/fs/zfs/zfscrypt.c
> > > -+++ b/grub-core/fs/zfs/zfscrypt.c
> > > -@@ -22,6 +22,7 @@
> > > - #include <grub/misc.h>
> > > - #include <grub/disk.h>
> > > - #include <grub/partition.h>
> > > -+#include <grub/safemath.h>
> > > - #include <grub/dl.h>
> > > - #include <grub/types.h>
> > > - #include <grub/zfs/zfs.h>
> > > -@@ -82,9 +83,13 @@ grub_zfs_add_key (grub_uint8_t *key_in,
> > > -                 int passphrase)
> > > - {
> > > -   struct grub_zfs_wrap_key *key;
> > > -+  grub_size_t sz;
> > > -+
> > > -   if (!passphrase && keylen > 32)
> > > -     keylen = 32;
> > > --  key = grub_malloc (sizeof (*key) + keylen);
> > > -+  if (grub_add (sizeof (*key), keylen, &sz))
> > > -+    return GRUB_ERR_OUT_OF_RANGE;
> > > -+  key = grub_malloc (sz);
> > > -   if (!key)
> > > -     return grub_errno;
> > > -   key->is_passphrase = passphrase;
> > > -diff --git a/grub-core/lib/arg.c b/grub-core/lib/arg.c
> > > -index fd7744a..3288609 100644
> > > ---- a/grub-core/lib/arg.c
> > > -+++ b/grub-core/lib/arg.c
> > > -@@ -23,6 +23,7 @@
> > > - #include <grub/term.h>
> > > - #include <grub/extcmd.h>
> > > - #include <grub/i18n.h>
> > > -+#include <grub/safemath.h>
> > > -
> > > - /* Built-in parser for default options.  */
> > > - static const struct grub_arg_option help_options[] =
> > > -@@ -216,7 +217,13 @@ static inline grub_err_t
> > > - add_arg (char ***argl, int *num, char *s)
> > > - {
> > > -   char **p = *argl;
> > > --  *argl = grub_realloc (*argl, (++(*num) + 1) * sizeof (char *));
> > > -+  grub_size_t sz;
> > > -+
> > > -+  if (grub_add (++(*num), 1, &sz) ||
> > > -+      grub_mul (sz, sizeof (char *), &sz))
> > > -+    return grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow is
> > > detected"));
> > > -+
> > > -+  *argl = grub_realloc (*argl, sz);
> > > -   if (! *argl)
> > > -     {
> > > -       grub_free (p);
> > > -@@ -431,6 +438,7 @@ grub_arg_list_alloc(grub_extcmd_t extcmd, int
> > > argc,
> > > -   grub_size_t argcnt;
> > > -   struct grub_arg_list *list;
> > > -   const struct grub_arg_option *options;
> > > -+  grub_size_t sz0, sz1;
> > > -
> > > -   options = extcmd->options;
> > > -   if (! options)
> > > -@@ -443,7 +451,15 @@ grub_arg_list_alloc(grub_extcmd_t extcmd, int
> > > argc,
> > > -       argcnt += ((grub_size_t) argc + 1) / 2 + 1; /* max possible
> > > for any option */
> > > -     }
> > > -
> > > --  list = grub_zalloc (sizeof (*list) * i + sizeof (char*) *
> > > argcnt);
> > > -+  if (grub_mul (sizeof (*list), i, &sz0) ||
> > > -+      grub_mul (sizeof (char *), argcnt, &sz1) ||
> > > -+      grub_add (sz0, sz1, &sz0))
> > > -+    {
> > > -+      grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow is
> > > detected"));
> > > -+      return 0;
> > > -+    }
> > > -+
> > > -+  list = grub_zalloc (sz0);
> > > -   if (! list)
> > > -     return 0;
> > > -
> > > -diff --git a/grub-core/loader/i386/bsd.c b/grub-
> > > core/loader/i386/bsd.c
> > > -index 3730ed3..b92cbe9 100644
> > > ---- a/grub-core/loader/i386/bsd.c
> > > -+++ b/grub-core/loader/i386/bsd.c
> > > -@@ -35,6 +35,7 @@
> > > - #include <grub/ns8250.h>
> > > - #include <grub/bsdlabel.h>
> > > - #include <grub/crypto.h>
> > > -+#include <grub/safemath.h>
> > > - #include <grub/verify.h>
> > > - #ifdef GRUB_MACHINE_PCBIOS
> > > - #include <grub/machine/int.h>
> > > -@@ -1012,11 +1013,16 @@ grub_netbsd_add_modules (void)
> > > -   struct grub_netbsd_btinfo_modules *mods;
> > > -   unsigned i;
> > > -   grub_err_t err;
> > > -+  grub_size_t sz;
> > > -
> > > -   for (mod = netbsd_mods; mod; mod = mod->next)
> > > -     modcnt++;
> > > -
> > > --  mods = grub_malloc (sizeof (*mods) + sizeof (mods->mods[0]) *
> > > modcnt);
> > > -+  if (grub_mul (modcnt, sizeof (mods->mods[0]), &sz) ||
> > > -+      grub_add (sz, sizeof (*mods), &sz))
> > > -+    return GRUB_ERR_OUT_OF_RANGE;
> > > -+
> > > -+  mods = grub_malloc (sz);
> > > -   if (!mods)
> > > -     return grub_errno;
> > > -
> > > -diff --git a/grub-core/net/dns.c b/grub-core/net/dns.c
> > > -index e332d5e..906ec7d 100644
> > > ---- a/grub-core/net/dns.c
> > > -+++ b/grub-core/net/dns.c
> > > -@@ -22,6 +22,7 @@
> > > - #include <grub/i18n.h>
> > > - #include <grub/err.h>
> > > - #include <grub/time.h>
> > > -+#include <grub/safemath.h>
> > > -
> > > - struct dns_cache_element
> > > - {
> > > -@@ -51,9 +52,15 @@ grub_net_add_dns_server (const struct
> > > grub_net_network_level_address *s)
> > > -     {
> > > -       int na = dns_servers_alloc * 2;
> > > -       struct grub_net_network_level_address *ns;
> > > -+      grub_size_t sz;
> > > -+
> > > -       if (na < 8)
> > > -       na = 8;
> > > --      ns = grub_realloc (dns_servers, na * sizeof (ns[0]));
> > > -+
> > > -+      if (grub_mul (na, sizeof (ns[0]), &sz))
> > > -+      return GRUB_ERR_OUT_OF_RANGE;
> > > -+
> > > -+      ns = grub_realloc (dns_servers, sz);
> > > -       if (!ns)
> > > -       return grub_errno;
> > > -       dns_servers_alloc = na;
> > > -diff --git a/grub-core/normal/charset.c b/grub-core/normal/charset.c
> > > -index d57fb72..4dfcc31 100644
> > > ---- a/grub-core/normal/charset.c
> > > -+++ b/grub-core/normal/charset.c
> > > -@@ -48,6 +48,7 @@
> > > - #include <grub/unicode.h>
> > > - #include <grub/term.h>
> > > - #include <grub/normal.h>
> > > -+#include <grub/safemath.h>
> > > -
> > > - #if HAVE_FONT_SOURCE
> > > - #include "widthspec.h"
> > > -@@ -464,6 +465,7 @@ grub_unicode_aglomerate_comb (const
> > > grub_uint32_t *in, grub_size_t inlen,
> > > -       {
> > > -         struct grub_unicode_combining *n;
> > > -         unsigned j;
> > > -+        grub_size_t sz;
> > > -
> > > -         if (!haveout)
> > > -           continue;
> > > -@@ -477,10 +479,14 @@ grub_unicode_aglomerate_comb (const
> > > grub_uint32_t *in, grub_size_t inlen,
> > > -           n = out->combining_inline;
> > > -         else if (out->ncomb > (int) ARRAY_SIZE (out-
> > > > combining_inline))
> > > -           {
> > > --            n = grub_realloc (out->combining_ptr,
> > > --                              sizeof (n[0]) * (out->ncomb + 1));
> > > -+            if (grub_add (out->ncomb, 1, &sz) ||
> > > -+                grub_mul (sz, sizeof (n[0]), &sz))
> > > -+              goto fail;
> > > -+
> > > -+            n = grub_realloc (out->combining_ptr, sz);
> > > -             if (!n)
> > > -               {
> > > -+ fail:
> > > -                 grub_errno = GRUB_ERR_NONE;
> > > -                 continue;
> > > -               }
> > > -diff --git a/grub-core/normal/cmdline.c b/grub-core/normal/cmdline.c
> > > -index c57242e..de03fe6 100644
> > > ---- a/grub-core/normal/cmdline.c
> > > -+++ b/grub-core/normal/cmdline.c
> > > -@@ -28,6 +28,7 @@
> > > - #include <grub/env.h>
> > > - #include <grub/i18n.h>
> > > - #include <grub/charset.h>
> > > -+#include <grub/safemath.h>
> > > -
> > > - static grub_uint32_t *kill_buf;
> > > -
> > > -@@ -307,12 +308,21 @@ cl_insert (struct cmdline_term *cl_terms,
> > > unsigned nterms,
> > > -   if (len + (*llen) >= (*max_len))
> > > -     {
> > > -       grub_uint32_t *nbuf;
> > > --      (*max_len) *= 2;
> > > --      nbuf = grub_realloc ((*buf), sizeof (grub_uint32_t) *
> > > (*max_len));
> > > -+      grub_size_t sz;
> > > -+
> > > -+      if (grub_mul (*max_len, 2, max_len) ||
> > > -+        grub_mul (*max_len, sizeof (grub_uint32_t), &sz))
> > > -+      {
> > > -+        grub_errno = GRUB_ERR_OUT_OF_RANGE;
> > > -+        goto fail;
> > > -+      }
> > > -+
> > > -+      nbuf = grub_realloc ((*buf), sz);
> > > -       if (nbuf)
> > > -       (*buf) = nbuf;
> > > -       else
> > > -       {
> > > -+ fail:
> > > -         grub_print_error ();
> > > -         grub_errno = GRUB_ERR_NONE;
> > > -         (*max_len) /= 2;
> > > -diff --git a/grub-core/normal/menu_entry.c b/grub-
> > > core/normal/menu_entry.c
> > > -index 1993995..50eef91 100644
> > > ---- a/grub-core/normal/menu_entry.c
> > > -+++ b/grub-core/normal/menu_entry.c
> > > -@@ -27,6 +27,7 @@
> > > - #include <grub/auth.h>
> > > - #include <grub/i18n.h>
> > > - #include <grub/charset.h>
> > > -+#include <grub/safemath.h>
> > > -
> > > - enum update_mode
> > > -   {
> > > -@@ -113,10 +114,18 @@ ensure_space (struct line *linep, int extra)
> > > - {
> > > -   if (linep->max_len < linep->len + extra)
> > > -     {
> > > --      linep->max_len = 2 * (linep->len + extra);
> > > --      linep->buf = grub_realloc (linep->buf, (linep->max_len + 1) *
> > > sizeof (linep->buf[0]));
> > > -+      grub_size_t sz0, sz1;
> > > -+
> > > -+      if (grub_add (linep->len, extra, &sz0) ||
> > > -+        grub_mul (sz0, 2, &sz0) ||
> > > -+        grub_add (sz0, 1, &sz1) ||
> > > -+        grub_mul (sz1, sizeof (linep->buf[0]), &sz1))
> > > -+      return 0;
> > > -+
> > > -+      linep->buf = grub_realloc (linep->buf, sz1);
> > > -       if (! linep->buf)
> > > -       return 0;
> > > -+      linep->max_len = sz0;
> > > -     }
> > > -
> > > -   return 1;
> > > -diff --git a/grub-core/script/argv.c b/grub-core/script/argv.c
> > > -index 217ec5d..5751fdd 100644
> > > ---- a/grub-core/script/argv.c
> > > -+++ b/grub-core/script/argv.c
> > > -@@ -20,6 +20,7 @@
> > > - #include <grub/mm.h>
> > > - #include <grub/misc.h>
> > > - #include <grub/script_sh.h>
> > > -+#include <grub/safemath.h>
> > > -
> > > - /* Return nearest power of two that is >= v.  */
> > > - static unsigned
> > > -@@ -81,11 +82,16 @@ int
> > > - grub_script_argv_next (struct grub_script_argv *argv)
> > > - {
> > > -   char **p = argv->args;
> > > -+  grub_size_t sz;
> > > -
> > > -   if (argv->args && argv->argc && argv->args[argv->argc - 1] == 0)
> > > -     return 0;
> > > -
> > > --  p = grub_realloc (p, round_up_exp ((argv->argc + 2) * sizeof
> > > (char *)));
> > > -+  if (grub_add (argv->argc, 2, &sz) ||
> > > -+      grub_mul (sz, sizeof (char *), &sz))
> > > -+    return 1;
> > > -+
> > > -+  p = grub_realloc (p, round_up_exp (sz));
> > > -   if (! p)
> > > -     return 1;
> > > -
> > > -@@ -105,13 +111,19 @@ grub_script_argv_append (struct
> > > grub_script_argv *argv, const char *s,
> > > - {
> > > -   grub_size_t a;
> > > -   char *p = argv->args[argv->argc - 1];
> > > -+  grub_size_t sz;
> > > -
> > > -   if (! s)
> > > -     return 0;
> > > -
> > > -   a = p ? grub_strlen (p) : 0;
> > > -
> > > --  p = grub_realloc (p, round_up_exp ((a + slen + 1) * sizeof
> > > (char)));
> > > -+  if (grub_add (a, slen, &sz) ||
> > > -+      grub_add (sz, 1, &sz) ||
> > > -+      grub_mul (sz, sizeof (char), &sz))
> > > -+    return 1;
> > > -+
> > > -+  p = grub_realloc (p, round_up_exp (sz));
> > > -   if (! p)
> > > -     return 1;
> > > -
> > > -diff --git a/grub-core/script/lexer.c b/grub-core/script/lexer.c
> > > -index c6bd317..5fb0cbd 100644
> > > ---- a/grub-core/script/lexer.c
> > > -+++ b/grub-core/script/lexer.c
> > > -@@ -24,6 +24,7 @@
> > > - #include <grub/mm.h>
> > > - #include <grub/script_sh.h>
> > > - #include <grub/i18n.h>
> > > -+#include <grub/safemath.h>
> > > -
> > > - #define yytext_ptr char *
> > > - #include "grub_script.tab.h"
> > > -@@ -110,10 +111,14 @@ grub_script_lexer_record (struct
> > > grub_parser_param *parser, char *str)
> > > -       old = lexer->recording;
> > > -       if (lexer->recordlen < len)
> > > -       lexer->recordlen = len;
> > > --      lexer->recordlen *= 2;
> > > -+
> > > -+      if (grub_mul (lexer->recordlen, 2, &lexer->recordlen))
> > > -+      goto fail;
> > > -+
> > > -       lexer->recording = grub_realloc (lexer->recording, lexer-
> > > > recordlen);
> > > -       if (!lexer->recording)
> > > -       {
> > > -+ fail:
> > > -         grub_free (old);
> > > -         lexer->recordpos = 0;
> > > -         lexer->recordlen = 0;
> > > -@@ -130,7 +135,7 @@ int
> > > - grub_script_lexer_yywrap (struct grub_parser_param *parserstate,
> > > -                         const char *input)
> > > - {
> > > --  grub_size_t len = 0;
> > > -+  grub_size_t len = 0, sz;
> > > -   char *p = 0;
> > > -   char *line = 0;
> > > -   YY_BUFFER_STATE buffer;
> > > -@@ -168,12 +173,22 @@ grub_script_lexer_yywrap (struct
> > > grub_parser_param *parserstate,
> > > -     }
> > > -   else if (len && line[len - 1] != '\n')
> > > -     {
> > > --      p = grub_realloc (line, len + 2);
> > > -+      if (grub_add (len, 2, &sz))
> > > -+      {
> > > -+        grub_free (line);
> > > -+        grub_script_yyerror (parserstate, N_("overflow is
> > > detected"));
> > > -+        return 1;
> > > -+      }
> > > -+
> > > -+      p = grub_realloc (line, sz);
> > > -       if (p)
> > > -       {
> > > -         p[len++] = '\n';
> > > -         p[len] = '\0';
> > > -       }
> > > -+      else
> > > -+      grub_free (line);
> > > -+
> > > -       line = p;
> > > -     }
> > > -
> > > -diff --git a/grub-core/video/bitmap.c b/grub-core/video/bitmap.c
> > > -index b2e0315..6256e20 100644
> > > ---- a/grub-core/video/bitmap.c
> > > -+++ b/grub-core/video/bitmap.c
> > > -@@ -23,6 +23,7 @@
> > > - #include <grub/mm.h>
> > > - #include <grub/misc.h>
> > > - #include <grub/i18n.h>
> > > -+#include <grub/safemath.h>
> > > -
> > > - GRUB_MOD_LICENSE ("GPLv3+");
> > > -
> > > -@@ -58,7 +59,7 @@ grub_video_bitmap_create (struct grub_video_bitmap
> > > **bitmap,
> > > -                           enum grub_video_blit_format blit_format)
> > > - {
> > > -   struct grub_video_mode_info *mode_info;
> > > --  unsigned int size;
> > > -+  grub_size_t size;
> > > -
> > > -   if (!bitmap)
> > > -     return grub_error (GRUB_ERR_BUG, "invalid argument");
> > > -@@ -137,19 +138,25 @@ grub_video_bitmap_create (struct
> > > grub_video_bitmap **bitmap,
> > > -
> > > -   mode_info->pitch = width * mode_info->bytes_per_pixel;
> > > -
> > > --  /* Calculate size needed for the data.  */
> > > --  size = (width * mode_info->bytes_per_pixel) * height;
> > > -+  /* Calculate size needed for the data. */
> > > -+  if (grub_mul (width, mode_info->bytes_per_pixel, &size) ||
> > > -+      grub_mul (size, height, &size))
> > > -+    {
> > > -+      grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow is
> > > detected"));
> > > -+      goto fail;
> > > -+    }
> > > -
> > > -   (*bitmap)->data = grub_zalloc (size);
> > > -   if (! (*bitmap)->data)
> > > --    {
> > > --      grub_free (*bitmap);
> > > --      *bitmap = 0;
> > > --
> > > --      return grub_errno;
> > > --    }
> > > -+    goto fail;
> > > -
> > > -   return GRUB_ERR_NONE;
> > > -+
> > > -+ fail:
> > > -+  grub_free (*bitmap);
> > > -+  *bitmap = NULL;
> > > -+
> > > -+  return grub_errno;
> > > - }
> > > -
> > > - /* Frees all resources allocated by bitmap.  */
> > > -diff --git a/grub-core/video/readers/png.c b/grub-
> > > core/video/readers/png.c
> > > -index 61bd645..0157ff7 100644
> > > ---- a/grub-core/video/readers/png.c
> > > -+++ b/grub-core/video/readers/png.c
> > > -@@ -23,6 +23,7 @@
> > > - #include <grub/mm.h>
> > > - #include <grub/misc.h>
> > > - #include <grub/bufio.h>
> > > -+#include <grub/safemath.h>
> > > -
> > > - GRUB_MOD_LICENSE ("GPLv3+");
> > > -
> > > -@@ -301,9 +302,17 @@ grub_png_decode_image_header (struct
> > > grub_png_data *data)
> > > -       data->bpp <<= 1;
> > > -
> > > -   data->color_bits = color_bits;
> > > --  data->row_bytes = data->image_width * data->bpp;
> > > -+
> > > -+  if (grub_mul (data->image_width, data->bpp, &data->row_bytes))
> > > -+    return grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow is
> > > detected"));
> > > -+
> > > -   if (data->color_bits <= 4)
> > > --    data->row_bytes = (data->image_width * data->color_bits + 7) /
> > > 8;
> > > -+    {
> > > -+      if (grub_mul (data->image_width, data->color_bits + 7, &data-
> > > > row_bytes))
> > > -+      return grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow is
> > > detected"));
> > > -+
> > > -+      data->row_bytes >>= 3;
> > > -+    }
> > > -
> > > - #ifndef GRUB_CPU_WORDS_BIGENDIAN
> > > -   if (data->is_16bit || data->is_gray || data->is_palette)
> > > ---
> > > -2.14.4
> > > -
> > > diff --git a/meta/recipes-bsp/grub/files/CVE-2020-15706-script-Avoid-
> > > a-use-after-free-when-redefining-a-func.patch b/meta/recipes-
> > > bsp/grub/files/CVE-2020-15706-script-Avoid-a-use-after-free-when-
> > > redefining-a-func.patch
> > > deleted file mode 100644
> > > index 329e554a68..0000000000
> > > --- a/meta/recipes-bsp/grub/files/CVE-2020-15706-script-Avoid-a-use-
> > > after-free-when-redefining-a-func.patch
> > > +++ /dev/null
> > > @@ -1,117 +0,0 @@
> > > -From c65fc7e75b7b7e880d90766057040011701e97f4 Mon Sep 17 00:00:00
> > > 2001
> > > -From: Chris Coulson <chris.coulson@canonical.com>
> > > -Date: Fri, 10 Jul 2020 14:41:45 +0100
> > > -Subject: [PATCH 8/9] script: Avoid a use-after-free when redefining
> > > a function
> > > - during execution
> > > -
> > > -Defining a new function with the same name as a previously defined
> > > -function causes the grub_script and associated resources for the
> > > -previous function to be freed. If the previous function is currently
> > > -executing when a function with the same name is defined, this
> > > results
> > > -in use-after-frees when processing subsequent commands in the
> > > original
> > > -function.
> > > -
> > > -Instead, reject a new function definition if it has the same name as
> > > -a previously defined function, and that function is currently being
> > > -executed. Although a behavioural change, this should be backwards
> > > -compatible with existing configurations because they can't be
> > > -dependent on the current behaviour without being broken.
> > > -
> > > -Fixes: CVE-2020-15706
> > > -
> > > -Signed-off-by: Chris Coulson <chris.coulson@canonical.com>
> > > -Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> > > -
> > > -Upstream-Status: Backport
> > > -CVE: CVE-2020-15706
> > > -
> > > -Reference to upstream patch:
> > > -
> > >
> https://git.savannah.gnu.org/cgit/grub.git/commit/?id=426f57383d647406ae9c628c472059c27cd6e040
> > > -
> > > -Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
> > > ----
> > > - grub-core/script/execute.c  |  2 ++
> > > - grub-core/script/function.c | 16 +++++++++++++---
> > > - grub-core/script/parser.y   |  3 ++-
> > > - include/grub/script_sh.h    |  2 ++
> > > - 4 files changed, 19 insertions(+), 4 deletions(-)
> > > -
> > > -diff --git a/grub-core/script/execute.c b/grub-core/script/execute.c
> > > -index c8d6806..7e028e1 100644
> > > ---- a/grub-core/script/execute.c
> > > -+++ b/grub-core/script/execute.c
> > > -@@ -838,7 +838,9 @@ grub_script_function_call
> > > (grub_script_function_t func, int argc, char **args)
> > > -   old_scope = scope;
> > > -   scope = &new_scope;
> > > -
> > > -+  func->executing++;
> > > -   ret = grub_script_execute (func->func);
> > > -+  func->executing--;
> > > -
> > > -   function_return = 0;
> > > -   active_loops = loops;
> > > -diff --git a/grub-core/script/function.c b/grub-
> > > core/script/function.c
> > > -index d36655e..3aad04b 100644
> > > ---- a/grub-core/script/function.c
> > > -+++ b/grub-core/script/function.c
> > > -@@ -34,6 +34,7 @@ grub_script_function_create (struct
> > > grub_script_arg *functionname_arg,
> > > -   func = (grub_script_function_t) grub_malloc (sizeof (*func));
> > > -   if (! func)
> > > -     return 0;
> > > -+  func->executing = 0;
> > > -
> > > -   func->name = grub_strdup (functionname_arg->str);
> > > -   if (! func->name)
> > > -@@ -60,10 +61,19 @@ grub_script_function_create (struct
> > > grub_script_arg *functionname_arg,
> > > -       grub_script_function_t q;
> > > -
> > > -       q = *p;
> > > --      grub_script_free (q->func);
> > > --      q->func = cmd;
> > > -       grub_free (func);
> > > --      func = q;
> > > -+      if (q->executing > 0)
> > > -+        {
> > > -+          grub_error (GRUB_ERR_BAD_ARGUMENT,
> > > -+                    N_("attempt to redefine a function being
> > > executed"));
> > > -+          func = NULL;
> > > -+        }
> > > -+      else
> > > -+        {
> > > -+          grub_script_free (q->func);
> > > -+          q->func = cmd;
> > > -+          func = q;
> > > -+        }
> > > -     }
> > > -   else
> > > -     {
> > > -diff --git a/grub-core/script/parser.y b/grub-core/script/parser.y
> > > -index 4f0ab83..f80b86b 100644
> > > ---- a/grub-core/script/parser.y
> > > -+++ b/grub-core/script/parser.y
> > > -@@ -289,7 +289,8 @@ function: "function" "name"
> > > -             grub_script_mem_free (state->func_mem);
> > > -           else {
> > > -             script->children = state->scripts;
> > > --            grub_script_function_create ($2, script);
> > > -+            if (!grub_script_function_create ($2, script))
> > > -+              grub_script_free (script);
> > > -           }
> > > -
> > > -           state->scripts = $<scripts>3;
> > > -diff --git a/include/grub/script_sh.h b/include/grub/script_sh.h
> > > -index b382bcf..6c48e07 100644
> > > ---- a/include/grub/script_sh.h
> > > -+++ b/include/grub/script_sh.h
> > > -@@ -361,6 +361,8 @@ struct grub_script_function
> > > -
> > > -   /* The next element.  */
> > > -   struct grub_script_function *next;
> > > -+
> > > -+  unsigned executing;
> > > - };
> > > - typedef struct grub_script_function *grub_script_function_t;
> > > -
> > > ---
> > > -2.14.4
> > > -
> > > diff --git a/meta/recipes-bsp/grub/files/CVE-2020-15707-linux-Fix-
> > > integer-overflows-in-initrd-size-handling.patch b/meta/recipes-
> > > bsp/grub/files/CVE-2020-15707-linux-Fix-integer-overflows-in-initrd-
> > > size-handling.patch
> > > deleted file mode 100644
> > > index d4f9300c0a..0000000000
> > > --- a/meta/recipes-bsp/grub/files/CVE-2020-15707-linux-Fix-integer-
> > > overflows-in-initrd-size-handling.patch
> > > +++ /dev/null
> > > @@ -1,177 +0,0 @@
> > > -From 68a09a74f6d726d79709847f3671c0a08e4fb5a0 Mon Sep 17 00:00:00
> > > 2001
> > > -From: Colin Watson <cjwatson@debian.org>
> > > -Date: Sat, 25 Jul 2020 12:15:37 +0100
> > > -Subject: [PATCH 9/9] linux: Fix integer overflows in initrd size
> > > handling
> > > -
> > > -These could be triggered by a crafted filesystem with very large
> > > files.
> > > -
> > > -Fixes: CVE-2020-15707
> > > -
> > > -Signed-off-by: Colin Watson <cjwatson@debian.org>
> > > -Reviewed-by: Jan Setje-Eilers <jan.setjeeilers@oracle.com>
> > > -Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> > > -
> > > -Upstream-Status: Backport
> > > -CVE: CVE-2020-15707
> > > -
> > > -Reference to upstream patch:
> > > -
> > >
> https://git.savannah.gnu.org/cgit/grub.git/commit/?id=e7b8856f8be3292afdb38d2e8c70ad8d62a61e10
> > > -
> > > -Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
> > > ----
> > > - grub-core/loader/linux.c | 74 +++++++++++++++++++++++++++++++++++--
> > > -----------
> > > - 1 file changed, 54 insertions(+), 20 deletions(-)
> > > -
> > > -diff --git a/grub-core/loader/linux.c b/grub-core/loader/linux.c
> > > -index 471b214..8c8565a 100644
> > > ---- a/grub-core/loader/linux.c
> > > -+++ b/grub-core/loader/linux.c
> > > -@@ -4,6 +4,7 @@
> > > - #include <grub/misc.h>
> > > - #include <grub/file.h>
> > > - #include <grub/mm.h>
> > > -+#include <grub/safemath.h>
> > > -
> > > - struct newc_head
> > > - {
> > > -@@ -98,13 +99,13 @@ free_dir (struct dir *root)
> > > -   grub_free (root);
> > > - }
> > > -
> > > --static grub_size_t
> > > -+static grub_err_t
> > > - insert_dir (const char *name, struct dir **root,
> > > --          grub_uint8_t *ptr)
> > > -+          grub_uint8_t *ptr, grub_size_t *size)
> > > - {
> > > -   struct dir *cur, **head = root;
> > > -   const char *cb, *ce = name;
> > > --  grub_size_t size = 0;
> > > -+  *size = 0;
> > > -   while (1)
> > > -     {
> > > -       for (cb = ce; *cb == '/'; cb++);
> > > -@@ -130,14 +131,22 @@ insert_dir (const char *name, struct dir
> > > **root,
> > > -             ptr = make_header (ptr, name, ce - name,
> > > -                                040777, 0);
> > > -           }
> > > --        size += ALIGN_UP ((ce - (char *) name)
> > > --                          + sizeof (struct newc_head), 4);
> > > -+        if (grub_add (*size,
> > > -+                      ALIGN_UP ((ce - (char *) name)
> > > -+                                + sizeof (struct newc_head), 4),
> > > -+                      size))
> > > -+          {
> > > -+            grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow is
> > > detected"));
> > > -+            grub_free (n->name);
> > > -+            grub_free (n);
> > > -+            return grub_errno;
> > > -+          }
> > > -         *head = n;
> > > -         cur = n;
> > > -       }
> > > -       root = &cur->next;
> > > -     }
> > > --  return size;
> > > -+  return GRUB_ERR_NONE;
> > > - }
> > > -
> > > - grub_err_t
> > > -@@ -173,26 +182,33 @@ grub_initrd_init (int argc, char *argv[],
> > > -         eptr = grub_strchr (ptr, ':');
> > > -         if (eptr)
> > > -           {
> > > -+            grub_size_t dir_size, name_len;
> > > -+
> > > -             initrd_ctx->components[i].newc_name = grub_strndup
> > > (ptr, eptr - ptr);
> > > --            if (!initrd_ctx->components[i].newc_name)
> > > -+            if (!initrd_ctx->components[i].newc_name ||
> > > -+                insert_dir (initrd_ctx->components[i].newc_name,
> > > &root, 0,
> > > -+                            &dir_size))
> > > -               {
> > > -                 grub_initrd_close (initrd_ctx);
> > > -                 return grub_errno;
> > > -               }
> > > --            initrd_ctx->size
> > > --              += ALIGN_UP (sizeof (struct newc_head)
> > > --                          + grub_strlen (initrd_ctx-
> > > > components[i].newc_name),
> > > --                           4);
> > > --            initrd_ctx->size += insert_dir (initrd_ctx-
> > > > components[i].newc_name,
> > > --                                            &root, 0);
> > > -+            name_len = grub_strlen (initrd_ctx-
> > > > components[i].newc_name);
> > > -+            if (grub_add (initrd_ctx->size,
> > > -+                          ALIGN_UP (sizeof (struct newc_head) +
> > > name_len, 4),
> > > -+                          &initrd_ctx->size) ||
> > > -+                grub_add (initrd_ctx->size, dir_size, &initrd_ctx-
> > > > size))
> > > -+              goto overflow;
> > > -             newc = 1;
> > > -             fname = eptr + 1;
> > > -           }
> > > -       }
> > > -       else if (newc)
> > > -       {
> > > --        initrd_ctx->size += ALIGN_UP (sizeof (struct newc_head)
> > > --                                      + sizeof ("TRAILER!!!") - 1,
> > > 4);
> > > -+        if (grub_add (initrd_ctx->size,
> > > -+                      ALIGN_UP (sizeof (struct newc_head)
> > > -+                                + sizeof ("TRAILER!!!") - 1, 4),
> > > -+                      &initrd_ctx->size))
> > > -+          goto overflow;
> > > -         free_dir (root);
> > > -         root = 0;
> > > -         newc = 0;
> > > -@@ -208,19 +224,29 @@ grub_initrd_init (int argc, char *argv[],
> > > -       initrd_ctx->nfiles++;
> > > -       initrd_ctx->components[i].size
> > > -       = grub_file_size (initrd_ctx->components[i].file);
> > > --      initrd_ctx->size += initrd_ctx->components[i].size;
> > > -+      if (grub_add (initrd_ctx->size, initrd_ctx-
> > > > components[i].size,
> > > -+                  &initrd_ctx->size))
> > > -+      goto overflow;
> > > -     }
> > > -
> > > -   if (newc)
> > > -     {
> > > -       initrd_ctx->size = ALIGN_UP (initrd_ctx->size, 4);
> > > --      initrd_ctx->size += ALIGN_UP (sizeof (struct newc_head)
> > > --                                  + sizeof ("TRAILER!!!") - 1, 4);
> > > -+      if (grub_add (initrd_ctx->size,
> > > -+                  ALIGN_UP (sizeof (struct newc_head)
> > > -+                            + sizeof ("TRAILER!!!") - 1, 4),
> > > -+                  &initrd_ctx->size))
> > > -+      goto overflow;
> > > -       free_dir (root);
> > > -       root = 0;
> > > -     }
> > > -
> > > -   return GRUB_ERR_NONE;
> > > -+
> > > -+ overflow:
> > > -+  free_dir (root);
> > > -+  grub_initrd_close (initrd_ctx);
> > > -+  return grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow is
> > > detected"));
> > > - }
> > > -
> > > - grub_size_t
> > > -@@ -261,8 +287,16 @@ grub_initrd_load (struct
> > > grub_linux_initrd_context *initrd_ctx,
> > > -
> > > -       if (initrd_ctx->components[i].newc_name)
> > > -       {
> > > --        ptr += insert_dir (initrd_ctx->components[i].newc_name,
> > > --                           &root, ptr);
> > > -+        grub_size_t dir_size;
> > > -+
> > > -+        if (insert_dir (initrd_ctx->components[i].newc_name, &root,
> > > ptr,
> > > -+                        &dir_size))
> > > -+          {
> > > -+            free_dir (root);
> > > -+            grub_initrd_close (initrd_ctx);
> > > -+            return grub_errno;
> > > -+          }
> > > -+        ptr += dir_size;
> > > -         ptr = make_header (ptr, initrd_ctx-
> > > > components[i].newc_name,
> > > -                            grub_strlen (initrd_ctx-
> > > > components[i].newc_name),
> > > -                            0100777,
> > > ---
> > > -2.14.4
> > > -
> > > diff --git a/meta/recipes-bsp/grub/files/autogen.sh-exclude-pc.patch
> > > b/meta/recipes-bsp/grub/files/autogen.sh-exclude-pc.patch
> > > index faa7fde232..1323a54a59 100644
> > > --- a/meta/recipes-bsp/grub/files/autogen.sh-exclude-pc.patch
> > > +++ b/meta/recipes-bsp/grub/files/autogen.sh-exclude-pc.patch
> > > @@ -1,6 +1,6 @@
> > > -From 72c30928d3d461e0e2d20c5ff33bd96b6991d585 Mon Sep 17 00:00:00
> > > 2001
> > > -From: Robert Yang <liezhi.yang@windriver.com>
> > > -Date: Sat, 25 Jan 2014 23:49:44 -0500
> > > +From 8790aa8bea736f52341a0430ff3e317d3be0f99b Mon Sep 17 00:00:00
> > > 2001
> > > +From: Naveen Saini <naveen.kumar.saini@intel.com>
> > > +Date: Mon, 15 Mar 2021 14:44:15 +0800
> > >  Subject: [PATCH] autogen.sh: exclude .pc from po/POTFILES.in
> > >
> > >  Exclude the .pc from po/POTFILES.in since quilt uses "patch --
> > > backup",
> > > @@ -13,23 +13,24 @@ Upstream-Status: Inappropriate [OE specific]
> > >
> > >  Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > >  Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> > > +Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
> > >  ---
> > >   autogen.sh | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > >  diff --git a/autogen.sh b/autogen.sh
> > > -index ef43270..a7067a7 100755
> > > +index 31b0ced7e..c63ae766c 100755
> > >  --- a/autogen.sh
> > >  +++ b/autogen.sh
> > >  @@ -13,7 +13,7 @@ fi
> > >   export LC_COLLATE=C
> > >   unset LC_ALL
> > >
> > > --find . -iname '*.[ch]' ! -ipath './grub-core/lib/libgcrypt-grub/*'
> > > ! -ipath './build-aux/*' ! -ipath './grub-
> > > core/lib/libgcrypt/src/misc.c' ! -ipath './grub-
> > > core/lib/libgcrypt/src/global.c' ! -ipath './grub-
> > > core/lib/libgcrypt/src/secmem.c'  ! -ipath './util/grub-gen-
> > > widthspec.c' ! -ipath './util/grub-gen-asciih.c' ! -ipath
> > > './gnulib/*' ! -iname './grub-core/lib/gnulib/*' |sort >
> > > po/POTFILES.in
> > > -+find . -iname '*.[ch]' ! -ipath './grub-core/lib/libgcrypt-grub/*'
> > > ! -ipath './build-aux/*' ! -ipath './grub-
> > > core/lib/libgcrypt/src/misc.c' ! -ipath './grub-
> > > core/lib/libgcrypt/src/global.c' ! -ipath './grub-
> > > core/lib/libgcrypt/src/secmem.c'  ! -ipath './util/grub-gen-
> > > widthspec.c' ! -ipath './util/grub-gen-asciih.c' ! -ipath
> > > './gnulib/*' ! -iname './grub-core/lib/gnulib/*' ! -path './.pc/*'
> > > |sort > po/POTFILES.in
> > > +-find . -iname '*.[ch]' ! -ipath './grub-core/lib/libgcrypt-grub/*'
> > > ! -ipath './build-aux/*' ! -ipath './grub-
> > > core/lib/libgcrypt/src/misc.c' ! -ipath './grub-
> > > core/lib/libgcrypt/src/global.c' ! -ipath './grub-
> > > core/lib/libgcrypt/src/secmem.c'  ! -ipath './util/grub-gen-
> > > widthspec.c' ! -ipath './util/grub-gen-asciih.c' ! -ipath
> > > './gnulib/*' ! -ipath './grub-core/lib/gnulib/*' |sort >
> > > po/POTFILES.in
> > > ++find . -iname '*.[ch]' ! -ipath './grub-core/lib/libgcrypt-grub/*'
> > > ! -ipath './build-aux/*' ! -ipath './grub-
> > > core/lib/libgcrypt/src/misc.c' ! -ipath './grub-
> > > core/lib/libgcrypt/src/global.c' ! -ipath './grub-
> > > core/lib/libgcrypt/src/secmem.c'  ! -ipath './util/grub-gen-
> > > widthspec.c' ! -ipath './util/grub-gen-asciih.c' ! -ipath
> > > './gnulib/*' ! -ipath './grub-core/lib/gnulib/*' ! -path './.pc/*'
> > > |sort > po/POTFILES.in
> > >   find util -iname '*.in' ! -name Makefile.in  |sort > po/POTFILES-
> > > shell.in
> > >
> > >   echo "Importing unicode..."
> > >  --
> > > -2.7.4
> > > +2.17.1
> > >
> > > diff --git a/meta/recipes-bsp/grub/files/calloc-Make-sure-we-always-
> > > have-an-overflow-checking.patch b/meta/recipes-bsp/grub/files/calloc-
> > > Make-sure-we-always-have-an-overflow-checking.patch
> > > deleted file mode 100644
> > > index c9536e68ef..0000000000
> > > --- a/meta/recipes-bsp/grub/files/calloc-Make-sure-we-always-have-an-
> > > overflow-checking.patch
> > > +++ /dev/null
> > > @@ -1,246 +0,0 @@
> > > -From c005f62f5c4b26a77b916c8f76a852324439ecb3 Mon Sep 17 00:00:00
> > > 2001
> > > -From: Peter Jones <pjones@redhat.com>
> > > -Date: Mon, 15 Jun 2020 12:15:29 -0400
> > > -Subject: [PATCH 2/9] calloc: Make sure we always have an overflow-
> > > checking
> > > - calloc() available
> > > -
> > > -This tries to make sure that everywhere in this source tree, we
> > > always have
> > > -an appropriate version of calloc() (i.e. grub_calloc(), xcalloc(),
> > > etc.)
> > > -available, and that they all safely check for overflow and return
> > > NULL when
> > > -it would occur.
> > > -
> > > -Upstream-Status: Backport [commit
> > > 64e26162ebfe68317c143ca5ec996c892019f8f8
> > > -from https://git.savannah.gnu.org/git/grub.git]
> > > -
> > > -Signed-off-by: Peter Jones <pjones@redhat.com>
> > > -Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> > > -Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
> > > ----
> > > - grub-core/kern/emu/misc.c          | 12 ++++++++++++
> > > - grub-core/kern/emu/mm.c            | 10 ++++++++++
> > > - grub-core/kern/mm.c                | 40
> > > ++++++++++++++++++++++++++++++++++++++
> > > - grub-core/lib/libgcrypt_wrap/mem.c | 11 +++++++++--
> > > - grub-core/lib/posix_wrap/stdlib.h  |  8 +++++++-
> > > - include/grub/emu/misc.h            |  1 +
> > > - include/grub/mm.h                  |  6 ++++++
> > > - 7 files changed, 85 insertions(+), 3 deletions(-)
> > > -
> > > -diff --git a/grub-core/kern/emu/misc.c b/grub-core/kern/emu/misc.c
> > > -index 65db79b..dfd8a8e 100644
> > > ---- a/grub-core/kern/emu/misc.c
> > > -+++ b/grub-core/kern/emu/misc.c
> > > -@@ -85,6 +85,18 @@ grub_util_error (const char *fmt, ...)
> > > -   exit (1);
> > > - }
> > > -
> > > -+void *
> > > -+xcalloc (grub_size_t nmemb, grub_size_t size)
> > > -+{
> > > -+  void *p;
> > > -+
> > > -+  p = calloc (nmemb, size);
> > > -+  if (!p)
> > > -+    grub_util_error ("%s", _("out of memory"));
> > > -+
> > > -+  return p;
> > > -+}
> > > -+
> > > - void *
> > > - xmalloc (grub_size_t size)
> > > - {
> > > -diff --git a/grub-core/kern/emu/mm.c b/grub-core/kern/emu/mm.c
> > > -index f262e95..145b01d 100644
> > > ---- a/grub-core/kern/emu/mm.c
> > > -+++ b/grub-core/kern/emu/mm.c
> > > -@@ -25,6 +25,16 @@
> > > - #include <string.h>
> > > - #include <grub/i18n.h>
> > > -
> > > -+void *
> > > -+grub_calloc (grub_size_t nmemb, grub_size_t size)
> > > -+{
> > > -+  void *ret;
> > > -+  ret = calloc (nmemb, size);
> > > -+  if (!ret)
> > > -+    grub_error (GRUB_ERR_OUT_OF_MEMORY, N_("out of memory"));
> > > -+  return ret;
> > > -+}
> > > -+
> > > - void *
> > > - grub_malloc (grub_size_t size)
> > > - {
> > > -diff --git a/grub-core/kern/mm.c b/grub-core/kern/mm.c
> > > -index ee88ff6..f2822a8 100644
> > > ---- a/grub-core/kern/mm.c
> > > -+++ b/grub-core/kern/mm.c
> > > -@@ -67,8 +67,10 @@
> > > - #include <grub/dl.h>
> > > - #include <grub/i18n.h>
> > > - #include <grub/mm_private.h>
> > > -+#include <grub/safemath.h>
> > > -
> > > - #ifdef MM_DEBUG
> > > -+# undef grub_calloc
> > > - # undef grub_malloc
> > > - # undef grub_zalloc
> > > - # undef grub_realloc
> > > -@@ -375,6 +377,30 @@ grub_memalign (grub_size_t align, grub_size_t
> > > size)
> > > -   return 0;
> > > - }
> > > -
> > > -+/*
> > > -+ * Allocate NMEMB instances of SIZE bytes and return the pointer,
> > > or error on
> > > -+ * integer overflow.
> > > -+ */
> > > -+void *
> > > -+grub_calloc (grub_size_t nmemb, grub_size_t size)
> > > -+{
> > > -+  void *ret;
> > > -+  grub_size_t sz = 0;
> > > -+
> > > -+  if (grub_mul (nmemb, size, &sz))
> > > -+    {
> > > -+      grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow is
> > > detected"));
> > > -+      return NULL;
> > > -+    }
> > > -+
> > > -+  ret = grub_memalign (0, sz);
> > > -+  if (!ret)
> > > -+    return NULL;
> > > -+
> > > -+  grub_memset (ret, 0, sz);
> > > -+  return ret;
> > > -+}
> > > -+
> > > - /* Allocate SIZE bytes and return the pointer.  */
> > > - void *
> > > - grub_malloc (grub_size_t size)
> > > -@@ -561,6 +587,20 @@ grub_mm_dump (unsigned lineno)
> > > -   grub_printf ("\n");
> > > - }
> > > -
> > > -+void *
> > > -+grub_debug_calloc (const char *file, int line, grub_size_t nmemb,
> > > grub_size_t size)
> > > -+{
> > > -+  void *ptr;
> > > -+
> > > -+  if (grub_mm_debug)
> > > -+    grub_printf ("%s:%d: calloc (0x%" PRIxGRUB_SIZE ", 0x%"
> > > PRIxGRUB_SIZE ") = ",
> > > -+               file, line, size);
> > > -+  ptr = grub_calloc (nmemb, size);
> > > -+  if (grub_mm_debug)
> > > -+    grub_printf ("%p\n", ptr);
> > > -+  return ptr;
> > > -+}
> > > -+
> > > - void *
> > > - grub_debug_malloc (const char *file, int line, grub_size_t size)
> > > - {
> > > -diff --git a/grub-core/lib/libgcrypt_wrap/mem.c b/grub-
> > > core/lib/libgcrypt_wrap/mem.c
> > > -index beeb661..74c6eaf 100644
> > > ---- a/grub-core/lib/libgcrypt_wrap/mem.c
> > > -+++ b/grub-core/lib/libgcrypt_wrap/mem.c
> > > -@@ -4,6 +4,7 @@
> > > - #include <grub/crypto.h>
> > > - #include <grub/dl.h>
> > > - #include <grub/env.h>
> > > -+#include <grub/safemath.h>
> > > -
> > > - GRUB_MOD_LICENSE ("GPLv3+");
> > > -
> > > -@@ -36,7 +37,10 @@ void *
> > > - gcry_xcalloc (size_t n, size_t m)
> > > - {
> > > -   void *ret;
> > > --  ret = grub_zalloc (n * m);
> > > -+  size_t sz;
> > > -+  if (grub_mul (n, m, &sz))
> > > -+    grub_fatal ("gcry_xcalloc would overflow");
> > > -+  ret = grub_zalloc (sz);
> > > -   if (!ret)
> > > -     grub_fatal ("gcry_xcalloc failed");
> > > -   return ret;
> > > -@@ -56,7 +60,10 @@ void *
> > > - gcry_xcalloc_secure (size_t n, size_t m)
> > > - {
> > > -   void *ret;
> > > --  ret = grub_zalloc (n * m);
> > > -+  size_t sz;
> > > -+  if (grub_mul (n, m, &sz))
> > > -+    grub_fatal ("gcry_xcalloc would overflow");
> > > -+  ret = grub_zalloc (sz);
> > > -   if (!ret)
> > > -     grub_fatal ("gcry_xcalloc failed");
> > > -   return ret;
> > > -diff --git a/grub-core/lib/posix_wrap/stdlib.h b/grub-
> > > core/lib/posix_wrap/stdlib.h
> > > -index 3b46f47..7a8d385 100644
> > > ---- a/grub-core/lib/posix_wrap/stdlib.h
> > > -+++ b/grub-core/lib/posix_wrap/stdlib.h
> > > -@@ -21,6 +21,7 @@
> > > -
> > > - #include <grub/mm.h>
> > > - #include <grub/misc.h>
> > > -+#include <grub/safemath.h>
> > > -
> > > - static inline void
> > > - free (void *ptr)
> > > -@@ -37,7 +38,12 @@ malloc (grub_size_t size)
> > > - static inline void *
> > > - calloc (grub_size_t size, grub_size_t nelem)
> > > - {
> > > --  return grub_zalloc (size * nelem);
> > > -+  grub_size_t sz;
> > > -+
> > > -+  if (grub_mul (size, nelem, &sz))
> > > -+    return NULL;
> > > -+
> > > -+  return grub_zalloc (sz);
> > > - }
> > > -
> > > - static inline void *
> > > -diff --git a/include/grub/emu/misc.h b/include/grub/emu/misc.h
> > > -index ce464cf..ff9c48a 100644
> > > ---- a/include/grub/emu/misc.h
> > > -+++ b/include/grub/emu/misc.h
> > > -@@ -47,6 +47,7 @@ grub_util_device_is_mapped (const char *dev);
> > > - #define GRUB_HOST_PRIuLONG_LONG "llu"
> > > - #define GRUB_HOST_PRIxLONG_LONG "llx"
> > > -
> > > -+void * EXPORT_FUNC(xcalloc) (grub_size_t nmemb, grub_size_t size)
> > > WARN_UNUSED_RESULT;
> > > - void * EXPORT_FUNC(xmalloc) (grub_size_t size) WARN_UNUSED_RESULT;
> > > - void * EXPORT_FUNC(xrealloc) (void *ptr, grub_size_t size)
> > > WARN_UNUSED_RESULT;
> > > - char * EXPORT_FUNC(xstrdup) (const char *str) WARN_UNUSED_RESULT;
> > > -diff --git a/include/grub/mm.h b/include/grub/mm.h
> > > -index 28e2e53..9c38dd3 100644
> > > ---- a/include/grub/mm.h
> > > -+++ b/include/grub/mm.h
> > > -@@ -29,6 +29,7 @@
> > > - #endif
> > > -
> > > - void grub_mm_init_region (void *addr, grub_size_t size);
> > > -+void *EXPORT_FUNC(grub_calloc) (grub_size_t nmemb, grub_size_t
> > > size);
> > > - void *EXPORT_FUNC(grub_malloc) (grub_size_t size);
> > > - void *EXPORT_FUNC(grub_zalloc) (grub_size_t size);
> > > - void EXPORT_FUNC(grub_free) (void *ptr);
> > > -@@ -48,6 +49,9 @@ extern int EXPORT_VAR(grub_mm_debug);
> > > - void grub_mm_dump_free (void);
> > > - void grub_mm_dump (unsigned lineno);
> > > -
> > > -+#define grub_calloc(nmemb, size)      \
> > > -+  grub_debug_calloc (GRUB_FILE, __LINE__, nmemb, size)
> > > -+
> > > - #define grub_malloc(size)     \
> > > -   grub_debug_malloc (GRUB_FILE, __LINE__, size)
> > > -
> > > -@@ -63,6 +67,8 @@ void grub_mm_dump (unsigned lineno);
> > > - #define grub_free(ptr)        \
> > > -   grub_debug_free (GRUB_FILE, __LINE__, ptr)
> > > -
> > > -+void *EXPORT_FUNC(grub_debug_calloc) (const char *file, int line,
> > > -+                                    grub_size_t nmemb, grub_size_t
> > > size);
> > > - void *EXPORT_FUNC(grub_debug_malloc) (const char *file, int line,
> > > -                                     grub_size_t size);
> > > - void *EXPORT_FUNC(grub_debug_zalloc) (const char *file, int line,
> > > ---
> > > -2.14.4
> > > -
> > > diff --git a/meta/recipes-bsp/grub/files/determinism.patch
> > > b/meta/recipes-bsp/grub/files/determinism.patch
> > > index 3c1f562c71..2828e80975 100644
> > > --- a/meta/recipes-bsp/grub/files/determinism.patch
> > > +++ b/meta/recipes-bsp/grub/files/determinism.patch
> > > @@ -1,6 +1,9 @@
> > > -The output in moddep.lst generated from syminfo.lst using
> > > genmoddep.awk is
> > > -not deterministic since the order of the dependencies on each line
> > > can vary
> > > -depending on how awk sorts the values in the array.
> > > +From b6f9b3f6fa782807c4a7ec16ee8ef868cdfbf468 Mon Sep 17 00:00:00
> > > 2001
> > > +From: Naveen Saini <naveen.kumar.saini@intel.com>
> > > +Date: Mon, 15 Mar 2021 14:56:18 +0800
> > > +Subject: [PATCH] The output in moddep.lst generated from syminfo.lst
> > > using
> > > + genmoddep.awk is not deterministic since the order of the
> > > dependencies on
> > > + each line can vary depending on how awk sorts the values in the
> > > array.
> > >
> > >  Be deterministic in the output by sorting the dependencies on each
> > > line.
> > >
> > > @@ -13,11 +16,29 @@ keys of the dict.
> > >
> > >  Upstream-Status: Pending
> > >  Richard Purdie <richard.purdie@linuxfoundation.org>
> > > +Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
> > > +---
> > > + gentpl.py               | 1 +
> > > + grub-core/genmoddep.awk | 4 +++-
> > > + util/import_unicode.py  | 2 +-
> > > + 3 files changed, 5 insertions(+), 2 deletions(-)
> > >
> > > -Index: grub-2.04/grub-core/genmoddep.awk
> > > -===================================================================
> > > ---- grub-2.04.orig/grub-core/genmoddep.awk
> > > -+++ grub-2.04/grub-core/genmoddep.awk
> > > +diff --git a/gentpl.py b/gentpl.py
> > > +index c86550d4f..589285192 100644
> > > +--- a/gentpl.py
> > > ++++ b/gentpl.py
> > > +@@ -568,6 +568,7 @@ def foreach_platform_value(defn, platform,
> > > suffix, closure):
> > > +     for group in RMAP[platform]:
> > > +         for value in defn.find_all(group + suffix):
> > > +             r.append(closure(value))
> > > ++    r.sort()
> > > +     return ''.join(r)
> > > +
> > > + def platform_conditional(platform, closure):
> > > +diff --git a/grub-core/genmoddep.awk b/grub-core/genmoddep.awk
> > > +index 04c2863e5..247436392 100644
> > > +--- a/grub-core/genmoddep.awk
> > > ++++ b/grub-core/genmoddep.awk
> > >  @@ -59,7 +59,9 @@ END {
> > >       }
> > >       modlist = ""
> > > @@ -29,22 +50,10 @@ Index: grub-2.04/grub-core/genmoddep.awk
> > >         modlist = modlist " " depmod;
> > >         inverse_dependencies[depmod] = inverse_dependencies[depmod] "
> > > " mod
> > >         depcount[mod]++
> > > -Index: grub-2.04/gentpl.py
> > > -===================================================================
> > > ---- grub-2.04.orig/gentpl.py
> > > -+++ grub-2.04/gentpl.py
> > > -@@ -568,6 +568,7 @@ def foreach_platform_value(defn, platfor
> > > -     for group in RMAP[platform]:
> > > -         for value in defn.find_all(group + suffix):
> > > -             r.append(closure(value))
> > > -+    r.sort()
> > > -     return ''.join(r)
> > > -
> > > - def platform_conditional(platform, closure):
> > > -Index: grub-2.04/util/import_unicode.py
> > > -===================================================================
> > > ---- grub-2.04.orig/util/import_unicode.py
> > > -+++ grub-2.04/util/import_unicode.py
> > > +diff --git a/util/import_unicode.py b/util/import_unicode.py
> > > +index 08f80591e..1f434a069 100644
> > > +--- a/util/import_unicode.py
> > > ++++ b/util/import_unicode.py
> > >  @@ -174,7 +174,7 @@ infile.close ()
> > >
> > >   outfile.write ("struct grub_unicode_arabic_shape
> > > grub_unicode_arabic_shapes[] = {\n ")
> > > @@ -54,3 +63,6 @@ Index: grub-2.04/util/import_unicode.py
> > >       try:
> > >           if arabicsubst[x]['join'] == "DUAL":
> > >               outfile.write ("{0x%x, 0x%x, 0x%x, 0x%x, 0x%x},\n " %
> > > (arabicsubst[x][0], arabicsubst[x][1], arabicsubst[x][2],
> > > arabicsubst[x][3], arabicsubst[x][4]))
> > > +--
> > > +2.17.1
> > > +
> > > diff --git a/meta/recipes-bsp/grub/files/lvm-Add-LVM-cache-logical-
> > > volume-handling.patch b/meta/recipes-bsp/grub/files/lvm-Add-LVM-
> > > cache-logical-volume-handling.patch
> > > deleted file mode 100644
> > > index 2b8157f592..0000000000
> > > --- a/meta/recipes-bsp/grub/files/lvm-Add-LVM-cache-logical-volume-
> > > handling.patch
> > > +++ /dev/null
> > > @@ -1,287 +0,0 @@
> > > -From 8eb02bcb5897b238b29ff762402bb0c3028f0eab Mon Sep 17 00:00:00
> > > 2001
> > > -From: Michael Chang <mchang@suse.com>
> > > -Date: Thu, 19 Mar 2020 13:56:13 +0800
> > > -Subject: [PATCH 3/9] lvm: Add LVM cache logical volume handling
> > > -
> > > -The LVM cache logical volume is the logical volume consisting of the
> > > original
> > > -and the cache pool logical volume. The original is usually on a
> > > larger and
> > > -slower storage device while the cache pool is on a smaller and
> > > faster one. The
> > > -performance of the original volume can be improved by storing the
> > > frequently
> > > -used data on the cache pool to utilize the greater performance of
> > > faster
> > > -device.
> > > -
> > > -The default cache mode "writethrough" ensures that any data written
> > > will be
> > > -stored both in the cache and on the origin LV, therefore grub can be
> > > straight
> > > -to read the original lv as no data loss is guarenteed.
> > > -
> > > -The second cache mode is "writeback", which delays writing from the
> > > cache pool
> > > -back to the origin LV to have increased performance. The drawback is
> > > potential
> > > -data loss if losing the associated cache device.
> > > -
> > > -During the boot time grub reads the LVM offline i.e. LVM volumes are
> > > not
> > > -activated and mounted, hence it should be fine to read directly from
> > > original
> > > -lv since all cached data should have been flushed back in the
> > > process of taking
> > > -it offline.
> > > -
> > > -It is also not much helpful to the situation by adding fsync calls
> > > to the
> > > -install code. The fsync did not force to write back dirty cache to
> > > the original
> > > -device and rather it would update associated cache metadata to
> > > complete the
> > > -write transaction with the cache device. IOW the writes to cached
> > > blocks still
> > > -go only to the cache device.
> > > -
> > > -To write back dirty cache, as LVM cache did not support dirty cache
> > > flush per
> > > -block range, there'no way to do it for file. On the other hand the
> > > "cleaner"
> > > -policy is implemented and can be used to write back "all" dirty
> > > blocks in a
> > > -cache, which effectively drain all dirty cache gradually to attain
> > > and last in
> > > -the "clean" state, which can be useful for shrinking or
> > > decommissioning a
> > > -cache. The result and effect is not what we are looking for here.
> > > -
> > > -In conclusion, as it seems no way to enforce file writes to the
> > > original
> > > -device, grub may suffer from power failure as it cannot assemble the
> > > cache
> > > -device and read the dirty data from it. However since the case is
> > > only
> > > -applicable to writeback mode which is sensitive to data lost in
> > > nature, I'd
> > > -still like to propose my (relatively simple) patch and treat reading
> > > dirty
> > > -cache as improvement.
> > > -
> > > -Upstream-Status: Backport [commit
> > > 0454b0445393aafc5600e92ef0c39494e333b135
> > > -from https://git.savannah.gnu.org/git/grub.git]
> > > -
> > > -Signed-off-by: Michael Chang <mchang@suse.com>
> > > -Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> > > -Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
> > > ----
> > > - grub-core/disk/lvm.c | 190
> > > +++++++++++++++++++++++++++++++++++++++++++++++++++
> > > - 1 file changed, 190 insertions(+)
> > > -
> > > -diff --git a/grub-core/disk/lvm.c b/grub-core/disk/lvm.c
> > > -index 7b265c7..dc6b83b 100644
> > > ---- a/grub-core/disk/lvm.c
> > > -+++ b/grub-core/disk/lvm.c
> > > -@@ -33,6 +33,14 @@
> > > -
> > > - GRUB_MOD_LICENSE ("GPLv3+");
> > > -
> > > -+struct cache_lv
> > > -+{
> > > -+  struct grub_diskfilter_lv *lv;
> > > -+  char *cache_pool;
> > > -+  char *origin;
> > > -+  struct cache_lv *next;
> > > -+};
> > > -+
> > > -
> > > - /* Go the string STR and return the number after STR.  *P will
> > > point
> > > -    at the number.  In case STR is not found, *P will be NULL and
> > > the
> > > -@@ -95,6 +103,34 @@ grub_lvm_check_flag (char *p, const char *str,
> > > const char *flag)
> > > -     }
> > > - }
> > > -
> > > -+static void
> > > -+grub_lvm_free_cache_lvs (struct cache_lv *cache_lvs)
> > > -+{
> > > -+  struct cache_lv *cache;
> > > -+
> > > -+  while ((cache = cache_lvs))
> > > -+    {
> > > -+      cache_lvs = cache_lvs->next;
> > > -+
> > > -+      if (cache->lv)
> > > -+      {
> > > -+        unsigned int i;
> > > -+
> > > -+        for (i = 0; i < cache->lv->segment_count; ++i)
> > > -+          if (cache->lv->segments)
> > > -+            grub_free (cache->lv->segments[i].nodes);
> > > -+        grub_free (cache->lv->segments);
> > > -+        grub_free (cache->lv->fullname);
> > > -+        grub_free (cache->lv->idname);
> > > -+        grub_free (cache->lv->name);
> > > -+      }
> > > -+      grub_free (cache->lv);
> > > -+      grub_free (cache->origin);
> > > -+      grub_free (cache->cache_pool);
> > > -+      grub_free (cache);
> > > -+    }
> > > -+}
> > > -+
> > > - static struct grub_diskfilter_vg *
> > > - grub_lvm_detect (grub_disk_t disk,
> > > -                struct grub_diskfilter_pv_id *id,
> > > -@@ -242,6 +278,8 @@ grub_lvm_detect (grub_disk_t disk,
> > > -
> > > -   if (! vg)
> > > -     {
> > > -+      struct cache_lv *cache_lvs = NULL;
> > > -+
> > > -       /* First time we see this volume group. We've to create the
> > > -        whole volume group structure. */
> > > -       vg = grub_malloc (sizeof (*vg));
> > > -@@ -671,6 +709,106 @@ grub_lvm_detect (grub_disk_t disk,
> > > -                         seg->nodes[seg->node_count - 1].name = tmp;
> > > -                       }
> > > -                   }
> > > -+                else if (grub_memcmp (p, "cache\"",
> > > -+                                 sizeof ("cache\"") - 1) == 0)
> > > -+                  {
> > > -+                    struct cache_lv *cache = NULL;
> > > -+
> > > -+                    char *p2, *p3;
> > > -+                    grub_size_t sz;
> > > -+
> > > -+                    cache = grub_zalloc (sizeof (*cache));
> > > -+                    if (!cache)
> > > -+                      goto cache_lv_fail;
> > > -+                    cache->lv = grub_zalloc (sizeof (*cache->lv));
> > > -+                    if (!cache->lv)
> > > -+                      goto cache_lv_fail;
> > > -+                    grub_memcpy (cache->lv, lv, sizeof (*cache-
> > > > lv));
> > > -+
> > > -+                    if (lv->fullname)
> > > -+                      {
> > > -+                        cache->lv->fullname = grub_strdup (lv-
> > > > fullname);
> > > -+                        if (!cache->lv->fullname)
> > > -+                          goto cache_lv_fail;
> > > -+                      }
> > > -+                    if (lv->idname)
> > > -+                      {
> > > -+                        cache->lv->idname = grub_strdup (lv-
> > > > idname);
> > > -+                        if (!cache->lv->idname)
> > > -+                          goto cache_lv_fail;
> > > -+                      }
> > > -+                    if (lv->name)
> > > -+                      {
> > > -+                        cache->lv->name = grub_strdup (lv->name);
> > > -+                        if (!cache->lv->name)
> > > -+                          goto cache_lv_fail;
> > > -+                      }
> > > -+
> > > -+                    skip_lv = 1;
> > > -+
> > > -+                    p2 = grub_strstr (p, "cache_pool = \"");
> > > -+                    if (!p2)
> > > -+                      goto cache_lv_fail;
> > > -+
> > > -+                    p2 = grub_strchr (p2, '"');
> > > -+                    if (!p2)
> > > -+                      goto cache_lv_fail;
> > > -+
> > > -+                    p3 = ++p2;
> > > -+                    p3 = grub_strchr (p3, '"');
> > > -+                    if (!p3)
> > > -+                      goto cache_lv_fail;
> > > -+
> > > -+                    sz = p3 - p2;
> > > -+
> > > -+                    cache->cache_pool = grub_malloc (sz + 1);
> > > -+                    if (!cache->cache_pool)
> > > -+                      goto cache_lv_fail;
> > > -+                    grub_memcpy (cache->cache_pool, p2, sz);
> > > -+                    cache->cache_pool[sz] = '\0';
> > > -+
> > > -+                    p2 = grub_strstr (p, "origin = \"");
> > > -+                    if (!p2)
> > > -+                      goto cache_lv_fail;
> > > -+
> > > -+                    p2 = grub_strchr (p2, '"');
> > > -+                    if (!p2)
> > > -+                      goto cache_lv_fail;
> > > -+
> > > -+                    p3 = ++p2;
> > > -+                    p3 = grub_strchr (p3, '"');
> > > -+                    if (!p3)
> > > -+                      goto cache_lv_fail;
> > > -+
> > > -+                    sz = p3 - p2;
> > > -+
> > > -+                    cache->origin = grub_malloc (sz + 1);
> > > -+                    if (!cache->origin)
> > > -+                      goto cache_lv_fail;
> > > -+                    grub_memcpy (cache->origin, p2, sz);
> > > -+                    cache->origin[sz] = '\0';
> > > -+
> > > -+                    cache->next = cache_lvs;
> > > -+                    cache_lvs = cache;
> > > -+                    break;
> > > -+
> > > -+                  cache_lv_fail:
> > > -+                    if (cache)
> > > -+                      {
> > > -+                        grub_free (cache->origin);
> > > -+                        grub_free (cache->cache_pool);
> > > -+                        if (cache->lv)
> > > -+                          {
> > > -+                            grub_free (cache->lv->fullname);
> > > -+                            grub_free (cache->lv->idname);
> > > -+                            grub_free (cache->lv->name);
> > > -+                          }
> > > -+                        grub_free (cache->lv);
> > > -+                        grub_free (cache);
> > > -+                      }
> > > -+                    grub_lvm_free_cache_lvs (cache_lvs);
> > > -+                    goto fail4;
> > > -+                  }
> > > -                 else
> > > -                   {
> > > - #ifdef GRUB_UTIL
> > > -@@ -747,6 +885,58 @@ grub_lvm_detect (grub_disk_t disk,
> > > -             }
> > > -
> > > -       }
> > > -+
> > > -+      {
> > > -+      struct cache_lv *cache;
> > > -+
> > > -+      for (cache = cache_lvs; cache; cache = cache->next)
> > > -+        {
> > > -+          struct grub_diskfilter_lv *lv;
> > > -+
> > > -+          for (lv = vg->lvs; lv; lv = lv->next)
> > > -+            if (grub_strcmp (lv->name, cache->origin) == 0)
> > > -+              break;
> > > -+          if (lv)
> > > -+            {
> > > -+              cache->lv->segments = grub_malloc (lv->segment_count
> > > * sizeof (*lv->segments));
> > > -+              if (!cache->lv->segments)
> > > -+                {
> > > -+                  grub_lvm_free_cache_lvs (cache_lvs);
> > > -+                  goto fail4;
> > > -+                }
> > > -+              grub_memcpy (cache->lv->segments, lv->segments, lv-
> > > > segment_count * sizeof (*lv->segments));
> > > -+
> > > -+              for (i = 0; i < lv->segment_count; ++i)
> > > -+                {
> > > -+                  struct grub_diskfilter_node *nodes = lv-
> > > > segments[i].nodes;
> > > -+                  grub_size_t node_count = lv-
> > > > segments[i].node_count;
> > > -+
> > > -+                  cache->lv->segments[i].nodes = grub_malloc
> > > (node_count * sizeof (*nodes));
> > > -+                  if (!cache->lv->segments[i].nodes)
> > > -+                    {
> > > -+                      for (j = 0; j < i; ++j)
> > > -+                        grub_free (cache->lv->segments[j].nodes);
> > > -+                      grub_free (cache->lv->segments);
> > > -+                      cache->lv->segments = NULL;
> > > -+                      grub_lvm_free_cache_lvs (cache_lvs);
> > > -+                      goto fail4;
> > > -+                    }
> > > -+                  grub_memcpy (cache->lv->segments[i].nodes, nodes,
> > > node_count * sizeof (*nodes));
> > > -+                }
> > > -+
> > > -+              if (cache->lv->segments)
> > > -+                {
> > > -+                  cache->lv->segment_count = lv->segment_count;
> > > -+                  cache->lv->vg = vg;
> > > -+                  cache->lv->next = vg->lvs;
> > > -+                  vg->lvs = cache->lv;
> > > -+                  cache->lv = NULL;
> > > -+                }
> > > -+            }
> > > -+        }
> > > -+      }
> > > -+
> > > -+      grub_lvm_free_cache_lvs (cache_lvs);
> > > -       if (grub_diskfilter_vg_register (vg))
> > > -       goto fail4;
> > > -     }
> > > ---
> > > -2.14.4
> > > -
> > > diff --git a/meta/recipes-bsp/grub/files/safemath-Add-some-
> > > arithmetic-primitives-that-check-f.patch b/meta/recipes-
> > > bsp/grub/files/safemath-Add-some-arithmetic-primitives-that-check-
> > > f.patch
> > > deleted file mode 100644
> > > index 29021e8d8f..0000000000
> > > --- a/meta/recipes-bsp/grub/files/safemath-Add-some-arithmetic-
> > > primitives-that-check-f.patch
> > > +++ /dev/null
> > > @@ -1,94 +0,0 @@
> > > -From 06c361a71c4998635493610e5d76d0d223925251 Mon Sep 17 00:00:00
> > > 2001
> > > -From: Peter Jones <pjones@redhat.com>
> > > -Date: Mon, 15 Jun 2020 10:58:42 -0400
> > > -Subject: [PATCH 5/9] safemath: Add some arithmetic primitives that
> > > check for
> > > - overflow
> > > -
> > > -This adds a new header, include/grub/safemath.h, that includes easy
> > > to
> > > -use wrappers for __builtin_{add,sub,mul}_overflow() declared like:
> > > -
> > > -  bool OP(a, b, res)
> > > -
> > > -where OP is grub_add, grub_sub or grub_mul. OP() returns true in the
> > > -case where the operation would overflow and res is not modified.
> > > -Otherwise, false is returned and the operation is executed.
> > > -
> > > -These arithmetic primitives require newer compiler versions. So,
> > > bump
> > > -these requirements in the INSTALL file too.
> > > -
> > > -Upstream-Status: Backport [commit
> > > 68708c4503018d61dbcce7ac11cbb511d6425f4d
> > > -from https://git.savannah.gnu.org/git/grub.git]
> > > -
> > > -Signed-off-by: Peter Jones <pjones@redhat.com>
> > > -Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> > > -[YL: omit the change to INSTALL from original patch]
> > > -Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
> > > ----
> > > - include/grub/compiler.h |  8 ++++++++
> > > - include/grub/safemath.h | 37 +++++++++++++++++++++++++++++++++++++
> > > - 2 files changed, 45 insertions(+)
> > > - create mode 100644 include/grub/safemath.h
> > > -
> > > -diff --git a/include/grub/compiler.h b/include/grub/compiler.h
> > > -index c9e1d7a..8f3be3a 100644
> > > ---- a/include/grub/compiler.h
> > > -+++ b/include/grub/compiler.h
> > > -@@ -48,4 +48,12 @@
> > > - #  define WARN_UNUSED_RESULT
> > > - #endif
> > > -
> > > -+#if defined(__clang__) && defined(__clang_major__) &&
> > > defined(__clang_minor__)
> > > -+#  define CLANG_PREREQ(maj,min) \
> > > -+          ((__clang_major__ > (maj)) || \
> > > -+         (__clang_major__ == (maj) && __clang_minor__ >= (min)))
> > > -+#else
> > > -+#  define CLANG_PREREQ(maj,min) 0
> > > -+#endif
> > > -+
> > > - #endif /* ! GRUB_COMPILER_HEADER */
> > > -diff --git a/include/grub/safemath.h b/include/grub/safemath.h
> > > -new file mode 100644
> > > -index 0000000..c17b89b
> > > ---- /dev/null
> > > -+++ b/include/grub/safemath.h
> > > -@@ -0,0 +1,37 @@
> > > -+/*
> > > -+ *  GRUB  --  GRand Unified Bootloader
> > > -+ *  Copyright (C) 2020  Free Software Foundation, Inc.
> > > -+ *
> > > -+ *  GRUB is free software: you can redistribute it and/or modify
> > > -+ *  it under the terms of the GNU General Public License as
> > > published by
> > > -+ *  the Free Software Foundation, either version 3 of the License,
> > > or
> > > -+ *  (at your option) any later version.
> > > -+ *
> > > -+ *  GRUB is distributed in the hope that it will be useful,
> > > -+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> > > -+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > > -+ *  GNU General Public License for more details.
> > > -+ *
> > > -+ *  You should have received a copy of the GNU General Public
> > > License
> > > -+ *  along with GRUB.  If not, see <http://www.gnu.org/licenses/>.
> > > -+ *
> > > -+ *  Arithmetic operations that protect against overflow.
> > > -+ */
> > > -+
> > > -+#ifndef GRUB_SAFEMATH_H
> > > -+#define GRUB_SAFEMATH_H 1
> > > -+
> > > -+#include <grub/compiler.h>
> > > -+
> > > -+/* These appear in gcc 5.1 and clang 3.8. */
> > > -+#if GNUC_PREREQ(5, 1) || CLANG_PREREQ(3, 8)
> > > -+
> > > -+#define grub_add(a, b, res)   __builtin_add_overflow(a, b, res)
> > > -+#define grub_sub(a, b, res)   __builtin_sub_overflow(a, b, res)
> > > -+#define grub_mul(a, b, res)   __builtin_mul_overflow(a, b, res)
> > > -+
> > > -+#else
> > > -+#error gcc 5.1 or newer or clang 3.8 or newer is required
> > > -+#endif
> > > -+
> > > -+#endif /* GRUB_SAFEMATH_H */
> > > ---
> > > -2.14.4
> > > -
> > > diff --git a/meta/recipes-bsp/grub/files/script-Remove-unused-fields-
> > > from-grub_script_functio.patch b/meta/recipes-bsp/grub/files/script-
> > > Remove-unused-fields-from-grub_script_functio.patch
> > > deleted file mode 100644
> > > index 84a80d5ffd..0000000000
> > > --- a/meta/recipes-bsp/grub/files/script-Remove-unused-fields-from-
> > > grub_script_functio.patch
> > > +++ /dev/null
> > > @@ -1,37 +0,0 @@
> > > -From e219bad8cee67b2bb21712df8f055706f8da25d2 Mon Sep 17 00:00:00
> > > 2001
> > > -From: Chris Coulson <chris.coulson@canonical.com>
> > > -Date: Fri, 10 Jul 2020 11:21:14 +0100
> > > -Subject: [PATCH 7/9] script: Remove unused fields from
> > > grub_script_function
> > > - struct
> > > -
> > > -Upstream-Status: Backport [commit
> > > 1a8d9c9b4ab6df7669b5aa36a56477f297825b96
> > > -from https://git.savannah.gnu.org/git/grub.git]
> > > -
> > > -Signed-off-by: Chris Coulson <chris.coulson@canonical.com>
> > > -Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> > > -Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
> > > ----
> > > - include/grub/script_sh.h | 5 -----
> > > - 1 file changed, 5 deletions(-)
> > > -
> > > -diff --git a/include/grub/script_sh.h b/include/grub/script_sh.h
> > > -index 360c2be..b382bcf 100644
> > > ---- a/include/grub/script_sh.h
> > > -+++ b/include/grub/script_sh.h
> > > -@@ -359,13 +359,8 @@ struct grub_script_function
> > > -   /* The script function.  */
> > > -   struct grub_script *func;
> > > -
> > > --  /* The flags.  */
> > > --  unsigned flags;
> > > --
> > > -   /* The next element.  */
> > > -   struct grub_script_function *next;
> > > --
> > > --  int references;
> > > - };
> > > - typedef struct grub_script_function *grub_script_function_t;
> > > -
> > > ---
> > > -2.14.4
> > > -
> > > diff --git a/meta/recipes-bsp/grub/grub-efi_2.04.bb b/meta/recipes-
> > > bsp/grub/grub-efi_2.06-rc1.bb
> > > similarity index 98%
> > > rename from meta/recipes-bsp/grub/grub-efi_2.04.bb
> > > rename to meta/recipes-bsp/grub/grub-efi_2.06-rc1.bb
> > > index 287845c507..240fde7dbf 100644
> > > --- a/meta/recipes-bsp/grub/grub-efi_2.04.bb
> > > +++ b/meta/recipes-bsp/grub/grub-efi_2.06-rc1.bb
> > > @@ -11,8 +11,6 @@ SRC_URI += " \
> > >             file://cfg \
> > >            "
> > >
> > > -S = "${WORKDIR}/grub-${PV}"
> > > -
> > >  # Determine the target arch for the grub modules
> > >  python __anonymous () {
> > >      import re
> > > diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-
> > > bsp/grub/grub2.inc
> > > index f870d41f6a..9312404ed9 100644
> > > --- a/meta/recipes-bsp/grub/grub2.inc
> > > +++ b/meta/recipes-bsp/grub/grub2.inc
> > > @@ -13,25 +13,20 @@ LIC_FILES_CHKSUM =
> > > "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> > >
> > >  CVE_PRODUCT = "grub2"
> > >
> > > -SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
> > > +SRC_URI = "git://git.savannah.gnu.org/git/grub.git;name=grub \
> > > +
> > >  git://git.sv.gnu.org/gnulib.git;destsuffix=git/grub-
> > > core/lib/gnulib;name=gnulib
> > > \
> > >             file://0001-Disable-mfpmath-sse-as-well-when-SSE-is-
> > > disabled.patch \
> > >             file://autogen.sh-exclude-pc.patch \
> > >             file://grub-module-explicitly-keeps-symbole-
> > > .module_license.patch \
> > >             file://0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch
> > > \
> > > -           file://CVE-2020-10713.patch \
> > > -           file://calloc-Make-sure-we-always-have-an-overflow-
> > > checking.patch \
> > > -           file://lvm-Add-LVM-cache-logical-volume-handling.patch \
> > > -           file://CVE-2020-14308-calloc-Use-calloc-at-most-
> > > places.patch \
> > > -           file://safemath-Add-some-arithmetic-primitives-that-
> > > check-f.patch \
> > > -           file://CVE-2020-14309-CVE-2020-14310-CVE-2020-14311-
> > > malloc-Use-overflow-checking-primitives-where-we-do-.patch \
> > > -           file://script-Remove-unused-fields-from-
> > > grub_script_functio.patch \
> > > -           file://CVE-2020-15706-script-Avoid-a-use-after-free-when-
> > > redefining-a-func.patch \
> > > -           file://CVE-2020-15707-linux-Fix-integer-overflows-in-
> > > initrd-size-handling.patch \
> > > -           file://6643507ce30f775008e093580f0c9499dfb2c485.patch \
> > >             file://determinism.patch \
> > >  "
> > > -SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
> > > -SRC_URI[sha256sum] =
> > > "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
> > > +
> > > +SRCREV_grub = "a53e530f8ad3770c3b03c208c08ae4162f68e3b1"
> > > +SRCREV_gnulib = "d271f868a8df9bbec29049d01e056481b7a1a263"
> > > +SRCREV_FORMAT = "grub_gnulib"
> > > +
> > > +S = "${WORKDIR}/git"
> > >
> > >  DEPENDS = "flex-native bison-native gettext-native"
> > >
> > > @@ -76,6 +71,7 @@ export PYTHON = "python3"
> > >
> > >  do_configure_prepend() {
> > >         cd ${S}
> > > +       ${S}/bootstrap --gnulib-srcdir=${S}/grub-core/lib/gnulib
> > >         FROM_BOOTSTRAP=1 ${S}/autogen.sh
> > >         cd ${B}
> > >  }
> > > diff --git a/meta/recipes-bsp/grub/grub_2.04.bb b/meta/recipes-
> > > bsp/grub/grub_2.06-rc1.bb
> > > similarity index 100%
> > > rename from meta/recipes-bsp/grub/grub_2.04.bb
> > > rename to meta/recipes-bsp/grub/grub_2.06-rc1.bb
> > >
> > > 
> > >
>
>

--000000000000aa443c05bdaa711d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>That&#39;s ok, but then please label the version 2.06=
~rc1, so it won&#39;t go backwards later.</div><div><br></div><div>Alex<br>=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Tue, 16 Mar 2021 at 17:50, Mittal, Anuj &lt;<a href=3D"mailto:anuj=
.mittal@intel.com">anuj.mittal@intel.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">I think the announcement said the f=
inal release might take a month or<br>
so.=C2=A0This version includes some important security fixes. If we don&#3=
9;t<br>
take this version, we might have to backport more than a hundred<br>
commits:<br>
<br>
<a href=3D"https://salsa.debian.org/grub-team/grub/-/commit/37c2a594625efb=
a8b7f10d18a444393982d2e31f" rel=3D"noreferrer" target=3D"_blank">https://sa=
lsa.debian.org/grub-team/grub/-/commit/37c2a594625efba8b7f10d18a444393982d2=
e31f</a><br>
<br>
Thanks,<br>
<br>
Anuj<br>
<br>
On Tue, 2021-03-16 at 08:46 +0100, Alexander Kanavin wrote:<br>
&gt; oe-core generally waits for the final releases, and does not provide<=
br>
&gt; alphas, betas or rcs. Is the final release coming soon?<br>
&gt; <br>
&gt; Alex<br>
&gt; <br>
&gt; On Tue, 16 Mar 2021 at 04:41, Naveen Saini<br>
&gt; &lt;<a href=3D"mailto:naveen.kumar.saini@intel.com" target=3D"_blank"=
>naveen.kumar.saini@intel.com</a>&gt; wrote:<br>
&gt; &gt; 2.06 RC1 release have a number of CVEs fixed:<br>
&gt; &gt; CVE-2020-15705<br>
&gt; &gt; CVE-2021-3418<br>
&gt; &gt; CVE-2020-27749<br>
&gt; &gt; CVE-2021-20233<br>
&gt; &gt; CVE-2021-20225<br>
&gt; &gt; CVE-2020-25647<br>
&gt; &gt; CVE-2020-25632<br>
&gt; &gt; CVE-2020-27779<br>
&gt; &gt; CVE-2020-14372<br>
&gt; &gt; CVE-2020-15707<br>
&gt; &gt; CVE-2020-15706<br>
&gt; &gt; CVE-2020-14309<br>
&gt; &gt; CVE-2020-14310<br>
&gt; &gt; CVE-2020-14311<br>
&gt; &gt; CVE-2020-14308<br>
&gt; &gt; CVE-2020-10713<br>
&gt; &gt; CVE-2014-4607<br>
&gt; &gt; <br>
&gt; &gt; Dropped backported patches.<br>
&gt; &gt; <br>
&gt; &gt; Official tar file for 2.06-rc1 is not available, so need to down=
load<br>
&gt; &gt; gnublib<br>
&gt; &gt; module additionally in order to build from git repo.<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Naveen Saini &lt;<a href=3D"mailto:naveen.kumar.s=
aini@intel.com" target=3D"_blank">naveen.kumar.saini@intel.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; =C2=A0...507ce30f775008e093580f0c9499dfb2c485.patch |=C2=A0 =C2=
=A047 -<br>
&gt; &gt; =C2=A0.../grub/files/CVE-2020-10713.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A073 -<br>
&gt; &gt; =C2=A0...308-calloc-Use-calloc-at-most-places.patch | 1863 -----=
----------<br>
&gt; &gt; --<br>
&gt; &gt; =C2=A0...low-checking-primitives-where-we-do-.patch | 1330 -----=
-------<br>
&gt; &gt; =C2=A0...se-after-free-when-redefining-a-func.patch |=C2=A0 117 =
--<br>
&gt; &gt; =C2=A0...er-overflows-in-initrd-size-handling.patch |=C2=A0 177 =
--<br>
&gt; &gt; =C2=A0.../grub/files/autogen.sh-exclude-pc.patch=C2=A0 =C2=A0 |=
=C2=A0 =C2=A015 +-<br>
&gt; &gt; =C2=A0...-we-always-have-an-overflow-checking.patch |=C2=A0 246 =
---<br>
&gt; &gt; =C2=A0meta/recipes-bsp/grub/files/determinism.patch |=C2=A0 =C2=
=A058 +-<br>
&gt; &gt; =C2=A0...dd-LVM-cache-logical-volume-handling.patch |=C2=A0 287 =
---<br>
&gt; &gt; =C2=A0...e-arithmetic-primitives-that-check-f.patch |=C2=A0 =C2=
=A094 -<br>
&gt; &gt; =C2=A0...used-fields-from-grub_script_functio.patch |=C2=A0 =C2=
=A037 -<br>
&gt; &gt; =C2=A0...{<a href=3D"http://grub-efi_2.04.bb" rel=3D"noreferrer"=
 target=3D"_blank">grub-efi_2.04.bb</a> =3D&gt; <a href=3D"http://grub-efi_=
2.06-rc1.bb" rel=3D"noreferrer" target=3D"_blank">grub-efi_2.06-rc1.bb</a>}=
 |=C2=A0 =C2=A0 2 -<br>
&gt; &gt; =C2=A0meta/recipes-bsp/grub/grub2.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A022 +-<br>
&gt; &gt; =C2=A0.../grub/{<a href=3D"http://grub_2.04.bb" rel=3D"noreferre=
r" target=3D"_blank">grub_2.04.bb</a> =3D&gt; <a href=3D"http://grub_2.06-r=
c1.bb" rel=3D"noreferrer" target=3D"_blank">grub_2.06-rc1.bb</a>}=C2=A0 =C2=
=
=A0|=C2=A0 =C2=A0 0<br>
&gt; &gt; =C2=A015 files changed, 52 insertions(+), 4316 deletions(-)<br>
&gt; &gt; =C2=A0delete mode 100644 meta/recipes-<br>
&gt; &gt; bsp/grub/files/6643507ce30f775008e093580f0c9499dfb2c485.patch<br=
>
&gt; &gt; =C2=A0delete mode 100644 meta/recipes-bsp/grub/files/CVE-2020-10=
713.patch<br>
&gt; &gt; =C2=A0delete mode 100644 meta/recipes-bsp/grub/files/CVE-2020-14=
308-<br>
&gt; &gt; calloc-Use-calloc-at-most-places.patch<br>
&gt; &gt; =C2=A0delete mode 100644 meta/recipes-bsp/grub/files/CVE-2020-14=
309-CVE-<br>
&gt; &gt; 2020-14310-CVE-2020-14311-malloc-Use-overflow-checking-primitive=
s-<br>
&gt; &gt; where-we-do-.patch<br>
&gt; &gt; =C2=A0delete mode 100644 meta/recipes-bsp/grub/files/CVE-2020-15=
706-<br>
&gt; &gt; script-Avoid-a-use-after-free-when-redefining-a-func.patch<br>
&gt; &gt; =C2=A0delete mode 100644 meta/recipes-bsp/grub/files/CVE-2020-15=
707-linux-<br>
&gt; &gt; Fix-integer-overflows-in-initrd-size-handling.patch<br>
&gt; &gt; =C2=A0delete mode 100644 meta/recipes-bsp/grub/files/calloc-Make=
-sure-we-<br>
&gt; &gt; always-have-an-overflow-checking.patch<br>
&gt; &gt; =C2=A0delete mode 100644 meta/recipes-bsp/grub/files/lvm-Add-LVM=
-cache-<br>
&gt; &gt; logical-volume-handling.patch<br>
&gt; &gt; =C2=A0delete mode 100644 meta/recipes-bsp/grub/files/safemath-Ad=
d-some-<br>
&gt; &gt; arithmetic-primitives-that-check-f.patch<br>
&gt; &gt; =C2=A0delete mode 100644 meta/recipes-bsp/grub/files/script-Remo=
ve-unused-<br>
&gt; &gt; fields-from-grub_script_functio.patch<br>
&gt; &gt; =C2=A0rename meta/recipes-bsp/grub/{<a href=3D"http://grub-efi_2=
.04.bb" rel=3D"noreferrer" target=3D"_blank">grub-efi_2.04.bb</a> =3D&gt;<b=
r>
&gt; &gt; <a href=3D"http://grub-efi_2.06-rc1.bb" rel=3D"noreferrer" targe=
t=3D"_blank">grub-efi_2.06-rc1.bb</a>} (98%)<br>
&gt; &gt; =C2=A0rename meta/recipes-bsp/grub/{<a href=3D"http://grub_2.04.=
bb" rel=3D"noreferrer" target=3D"_blank">grub_2.04.bb</a> =3D&gt; <a href=
=3D"http://grub_2.06-rc1.bb" rel=3D"noreferrer" target=3D"_blank">grub_2.0=
6-rc1.bb</a>}<br>
&gt; &gt; (100%)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta/recipes-<br>
&gt; &gt; bsp/grub/files/6643507ce30f775008e093580f0c9499dfb2c485.patch<br=
>
&gt; &gt; b/meta/recipes-<br>
&gt; &gt; bsp/grub/files/6643507ce30f775008e093580f0c9499dfb2c485.patch<br=
>
&gt; &gt; deleted file mode 100644<br>
&gt; &gt; index 8aa2091444..0000000000<br>
&gt; &gt; --- a/meta/recipes-<br>
&gt; &gt; bsp/grub/files/6643507ce30f775008e093580f0c9499dfb2c485.patch<br=
>
&gt; &gt; +++ /dev/null<br>
&gt; &gt; @@ -1,47 +0,0 @@<br>
&gt; &gt; -From 6643507ce30f775008e093580f0c9499dfb2c485 Mon Sep 17 00:00:=
00<br>
&gt; &gt; 2001<br>
&gt; &gt; -From: Simon Hardy &lt;<a href=3D"mailto:simon.hardy@itdev.co.uk=
" target=3D"_blank">simon.hardy@itdev.co.uk</a>&gt;<br>
&gt; &gt; -Date: Tue, 24 Mar 2020 13:29:12 +0000<br>
&gt; &gt; -Subject: build: Fix GRUB i386-pc build with Ubuntu gcc<br>
&gt; &gt; -<br>
&gt; &gt; -With recent versions of gcc on Ubuntu a very large<br>
&gt; &gt; lzma_decompress.img file is<br>
&gt; &gt; -output. (e.g. 134479600 bytes instead of 2864.) This causes gru=
b-<br>
&gt; &gt; mkimage to<br>
&gt; &gt; -fail with: &quot;error: Decompressor is too big.&quot;<br>
&gt; &gt; -<br>
&gt; &gt; -This seems to be caused by a section .note.gnu.property that is=
<br>
&gt; &gt; placed at an<br>
&gt; &gt; -offset such that objcopy needs to pad the img file with zeros.<=
br>
&gt; &gt; -<br>
&gt; &gt; -This issue is present on:<br>
&gt; &gt; -Ubuntu 19.10 with gcc (Ubuntu 8.3.0-26ubuntu1~19.10) 8.3.0<br>
&gt; &gt; -Ubuntu 19.10 with gcc (Ubuntu 9.2.1-9ubuntu2) 9.2.1 20191008<br=
>
&gt; &gt; -<br>
&gt; &gt; -This issue is not present on:<br>
&gt; &gt; -Ubuntu 19.10 with gcc (Ubuntu 7.5.0-3ubuntu1~19.10) 7.5.0<br>
&gt; &gt; -RHEL 8.0 with gcc 8.3.1 20190507 (Red Hat 8.3.1-4)<br>
&gt; &gt; -<br>
&gt; &gt; -The issue can be fixed by removing the section using objcopy as=
<br>
&gt; &gt; shown in<br>
&gt; &gt; -this patch.<br>
&gt; &gt; -<br>
&gt; &gt; -Signed-off-by: Simon Hardy &lt;<a href=3D"mailto:simon.hardy@it=
dev.co.uk" target=3D"_blank">simon.hardy@itdev.co.uk</a>&gt;<br>
&gt; &gt; -Reviewed-by: Daniel Kiper &lt;<a href=3D"mailto:daniel.kiper@or=
acle.com" target=3D"_blank">daniel.kiper@oracle.com</a>&gt;<br>
&gt; &gt; ----<br>
&gt; &gt; - gentpl.py | 2 +-<br>
&gt; &gt; - 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt; -<br>
&gt; &gt; -Upstream-Status: Backport<br>
&gt; &gt; -<br>
&gt; &gt; -diff --git a/gentpl.py b/gentpl.py<br>
&gt; &gt; -index 387588c05..c86550d4f 100644<br>
&gt; &gt; ---- a/gentpl.py<br>
&gt; &gt; -+++ b/gentpl.py<br>
&gt; &gt; -@@ -766,7 +766,7 @@ def image(defn, platform):<br>
&gt; &gt; - if test x$(TARGET_APPLE_LINKER) =3D x1; then \<br>
&gt; &gt; -=C2=A0 =C2=A0$(MACHO2IMG) $&lt; $@; \<br>
&gt; &gt; - else \<br>
&gt; &gt; --=C2=A0 $(TARGET_OBJCOPY) $(&quot;&quot;&quot; + cname(defn) + =
&quot;&quot;&quot;_OBJCOPYFLAGS) --<br>
&gt; &gt; strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R<br>
&gt; &gt; .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version=
 -R<br>
&gt; &gt; .ARM.exidx $&lt; $@; \<br>
&gt; &gt; -+=C2=A0 $(TARGET_OBJCOPY) $(&quot;&quot;&quot; + cname(defn) + =
&quot;&quot;&quot;_OBJCOPYFLAGS) --<br>
&gt; &gt; strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R<br>
&gt; &gt; .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version=
 -R<br>
&gt; &gt; .note.gnu.property -R .ARM.exidx $&lt; $@; \<br>
&gt; &gt; - fi<br>
&gt; &gt; - &quot;&quot;&quot;)<br>
&gt; &gt; - <br>
&gt; &gt; --- <br>
&gt; &gt; -cgit v1.2.1<br>
&gt; &gt; -<br>
&gt; &gt; diff --git a/meta/recipes-bsp/grub/files/CVE-2020-10713.patch<br=
>
&gt; &gt; b/meta/recipes-bsp/grub/files/CVE-2020-10713.patch<br>
&gt; &gt; deleted file mode 100644<br>
&gt; &gt; index c507ed3ea8..0000000000<br>
&gt; &gt; --- a/meta/recipes-bsp/grub/files/CVE-2020-10713.patch<br>
&gt; &gt; +++ /dev/null<br>
&gt; &gt; @@ -1,73 +0,0 @@<br>
&gt; &gt; -From a4d3fbdff1e3ca8f87642af2ac8752c30c617a3e Mon Sep 17 00:00:=
00<br>
&gt; &gt; 2001<br>
&gt; &gt; -From: Peter Jones &lt;<a href=3D"mailto:pjones@redhat.com" targ=
et=3D"_blank">pjones@redhat.com</a>&gt;<br>
&gt; &gt; -Date: Wed, 15 Apr 2020 15:45:02 -0400<br>
&gt; &gt; -Subject: yylex: Make lexer fatal errors actually be fatal<br>
&gt; &gt; -<br>
&gt; &gt; -When presented with a command that can&#39;t be tokenized to an=
ything<br>
&gt; &gt; -smaller than YYLMAX characters, the parser calls<br>
&gt; &gt; YY_FATAL_ERROR(errmsg),<br>
&gt; &gt; -expecting that will stop further processing, as such:<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 #define YY_DO_BEFORE_ACTION \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 yyg-&gt;yytext_ptr =3D yy_bp; \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 yyleng =3D (int) (yy_cp - yy_bp); \=
<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 yyg-&gt;yy_hold_char =3D *yy_cp; \<=
br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 *yy_cp =3D &#39;\0&#39;; \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( yyleng &gt;=3D YYLMAX ) \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 YY_FATA=
L_ERROR( &quot;token too large, exceeds YYLMAX&quot; );<br>
&gt; &gt; \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 yy_flex_strncpy( yytext, yyg-&gt;yy=
text_ptr, yyleng + 1 ,<br>
&gt; &gt; yyscanner); \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 yyg-&gt;yy_c_buf_p =3D yy_cp;<br>
&gt; &gt; -<br>
&gt; &gt; -The code flex generates expects that YY_FATAL_ERROR() will eith=
er<br>
&gt; &gt; return<br>
&gt; &gt; -for it or do some form of longjmp(), or handle the error in som=
e way<br>
&gt; &gt; at<br>
&gt; &gt; -least, and so the strncpy() call isn&#39;t in an &quot;else&quo=
t; clause, and thus<br>
&gt; &gt; if<br>
&gt; &gt; -YY_FATAL_ERROR() is *not* actually fatal, it does the call with=
 the<br>
&gt; &gt; -questionable limit, and predictable results ensue.<br>
&gt; &gt; -<br>
&gt; &gt; -Unfortunately, our implementation of YY_FATAL_ERROR() is:<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0#define YY_FATAL_ERROR(msg)=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0do {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_printf (_(&quot;fatal error: %s=
\n&quot;), _(msg));=C2=A0 =C2=A0 =C2=A0\<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0} while (0)<br>
&gt; &gt; -<br>
&gt; &gt; -The same pattern exists in yyless(), and similar problems exist=
 in<br>
&gt; &gt; users<br>
&gt; &gt; -of YY_INPUT(), several places in the main parsing loop,<br>
&gt; &gt; -yy_get_next_buffer(), yy_load_buffer_state(), yyensure_buffer_s=
tack,<br>
&gt; &gt; -yy_scan_buffer(), etc.<br>
&gt; &gt; -<br>
&gt; &gt; -All of these callers expect YY_FATAL_ERROR() to actually be fat=
al,<br>
&gt; &gt; and<br>
&gt; &gt; -the things they do if it returns after calling it are wildly un=
safe.<br>
&gt; &gt; -<br>
&gt; &gt; -Fixes: CVE-2020-10713<br>
&gt; &gt; -<br>
&gt; &gt; -Signed-off-by: Peter Jones &lt;<a href=3D"mailto:pjones@redhat.=
com" target=3D"_blank">pjones@redhat.com</a>&gt;<br>
&gt; &gt; -Reviewed-by: Daniel Kiper &lt;<a href=3D"mailto:daniel.kiper@or=
acle.com" target=3D"_blank">daniel.kiper@oracle.com</a>&gt;<br>
&gt; &gt; -<br>
&gt; &gt; -Upstream-Status: Backport<br>
&gt; &gt; [<a href=3D"https://git.savannah.gnu.org/cgit/grub.git/commit/?i=
d=3Da4d3fbdff1e3ca8f87642af2ac8752c30c617a3e" rel=3D"noreferrer" target=3D"=
_blank">https://git.savannah.gnu.org/cgit/grub.git/commit/?id=3Da4d3fbdff1e=
3ca8f87642af2ac8752c30c617a3e</a><br>
&gt; &gt; ]<br>
&gt; &gt; -CVE: CVE-2020-10713<br>
&gt; &gt; -Signed-off-by: Chee Yang Lee &lt;<a href=3D"mailto:chee.yang.le=
e@intel.com" target=3D"_blank">chee.yang.lee@intel.com</a>&gt;<br>
&gt; &gt; ----<br>
&gt; &gt; - grub-core/script/yylex.l | 4 ++--<br>
&gt; &gt; - 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; &gt; -<br>
&gt; &gt; -diff --git a/grub-core/script/yylex.l b/grub-core/script/yylex.=
l<br>
&gt; &gt; -index 7b44c37b7..b7203c823 100644<br>
&gt; &gt; ---- a/grub-core/script/yylex.l<br>
&gt; &gt; -+++ b/grub-core/script/yylex.l<br>
&gt; &gt; -@@ -37,11 +37,11 @@<br>
&gt; &gt; - <br>
&gt; &gt; - /* <br>
&gt; &gt; -=C2=A0 * As we don&#39;t have access to yyscanner, we cannot do=
 much except<br>
&gt; &gt; to<br>
&gt; &gt; -- * print the fatal error.<br>
&gt; &gt; -+ * print the fatal error and exit.<br>
&gt; &gt; -=C2=A0 */<br>
&gt; &gt; - #define YY_FATAL_ERROR(msg)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; &gt; -=C2=A0 =C2=A0do {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; &gt; --=C2=A0 =C2=A0 grub_printf (_(&quot;fatal error: %s\n&quot;), _=
(msg));=C2=A0 =C2=A0 =C2=A0\<br>
&gt; &gt; -+=C2=A0 =C2=A0 grub_fatal (_(&quot;fatal error: %s\n&quot;), _(=
msg));\<br>
&gt; &gt; -=C2=A0 =C2=A0} while (0)<br>
&gt; &gt; - <br>
&gt; &gt; - #define COPY(str, hint)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; &gt; --- <br>
&gt; &gt; -cgit v1.2.1<br>
&gt; &gt; -<br>
&gt; &gt; diff --git a/meta/recipes-bsp/grub/files/CVE-2020-14308-calloc-U=
se-<br>
&gt; &gt; calloc-at-most-places.patch b/meta/recipes-bsp/grub/files/CVE-20=
20-<br>
&gt; &gt; 14308-calloc-Use-calloc-at-most-places.patch<br>
&gt; &gt; deleted file mode 100644<br>
&gt; &gt; index 637e368cb0..0000000000<br>
&gt; &gt; --- a/meta/recipes-bsp/grub/files/CVE-2020-14308-calloc-Use-call=
oc-<br>
&gt; &gt; at-most-places.patch<br>
&gt; &gt; +++ /dev/null<br>
&gt; &gt; @@ -1,1863 +0,0 @@<br>
&gt; &gt; -From bcdd6a55952222ec9829a59348240a4f983b0b56 Mon Sep 17 00:00:=
00<br>
&gt; &gt; 2001<br>
&gt; &gt; -From: Peter Jones &lt;<a href=3D"mailto:pjones@redhat.com" targ=
et=3D"_blank">pjones@redhat.com</a>&gt;<br>
&gt; &gt; -Date: Mon, 15 Jun 2020 12:26:01 -0400<br>
&gt; &gt; -Subject: [PATCH 4/9] calloc: Use calloc() at most places<br>
&gt; &gt; -<br>
&gt; &gt; -This modifies most of the places we do some form of:<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 X =3D malloc(Y * Z);<br>
&gt; &gt; -<br>
&gt; &gt; -to use calloc(Y, Z) instead.<br>
&gt; &gt; -<br>
&gt; &gt; -Among other issues, this fixes:<br>
&gt; &gt; -=C2=A0 - allocation of integer overflow in grub_png_decode_imag=
e_header()<br>
&gt; &gt; -=C2=A0 =C2=A0 reported by Chris Coulson,<br>
&gt; &gt; -=C2=A0 - allocation of integer overflow in luks_recover_key()<b=
r>
&gt; &gt; -=C2=A0 =C2=A0 reported by Chris Coulson,<br>
&gt; &gt; -=C2=A0 - allocation of integer overflow in grub_lvm_detect()<br=
>
&gt; &gt; -=C2=A0 =C2=A0 reported by Chris Coulson.<br>
&gt; &gt; -<br>
&gt; &gt; -Fixes: CVE-2020-14308<br>
&gt; &gt; -<br>
&gt; &gt; -Signed-off-by: Peter Jones &lt;<a href=3D"mailto:pjones@redhat.=
com" target=3D"_blank">pjones@redhat.com</a>&gt;<br>
&gt; &gt; -Reviewed-by: Daniel Kiper &lt;<a href=3D"mailto:daniel.kiper@or=
acle.com" target=3D"_blank">daniel.kiper@oracle.com</a>&gt;<br>
&gt; &gt; -<br>
&gt; &gt; -Upstream-Status: Backport<br>
&gt; &gt; -CVE: CVE-2020-14308<br>
&gt; &gt; -<br>
&gt; &gt; -Reference to upstream patch:<br>
&gt; &gt; -<br>
&gt; &gt; <a href=3D"https://git.savannah.gnu.org/cgit/grub.git/commit/?id=
=
=3Df725fa7cb2ece547c5af01eeeecfe8d95802ed41" rel=3D"noreferrer" target=3D"=
_blank">https://git.savannah.gnu.org/cgit/grub.git/commit/?id=3Df725fa7cb2e=
ce547c5af01eeeecfe8d95802ed41</a><br>
&gt; &gt; -<br>
&gt; &gt; -[YL: don&#39;t patch on grub-core/lib/json/json.c, which is not=
 existing<br>
&gt; &gt; in grub 2.04]<br>
&gt; &gt; -Signed-off-by: Yongxin Liu &lt;<a href=3D"mailto:yongxin.liu@wi=
ndriver.com" target=3D"_blank">yongxin.liu@windriver.com</a>&gt;<br>
&gt; &gt; ----<br>
&gt; &gt; - grub-core/bus/usb/usbhub.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 ++++----<br>
&gt; &gt; - grub-core/commands/efi/lsefisystab.c=C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 3 ++-<br>
&gt; &gt; - grub-core/commands/legacycfg.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 6 +++---<br>
&gt; &gt; - grub-core/commands/menuentry.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; &gt; - grub-core/commands/nativedisk.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; &gt; - grub-core/commands/parttool.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 12 +++++++++---<br>
&gt; &gt; - grub-core/commands/regexp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; &gt; - grub-core/commands/search_wrap.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 2 +-<br>
&gt; &gt; - grub-core/disk/diskfilter.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++--<br>
&gt; &gt; - grub-core/disk/ieee1275/ofdisk.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 2 +-<br>
&gt; &gt; - grub-core/disk/ldm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 14 +++++++-------<br>
&gt; &gt; - grub-core/disk/luks.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; &gt; - grub-core/disk/lvm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 12 ++++++------<br>
&gt; &gt; - grub-core/disk/xen/xendisk.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; &gt; - grub-core/efiemu/loadcore.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; &gt; - grub-core/efiemu/mm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +++---<br>
&gt; &gt; - grub-core/font/font.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 +--<br>
&gt; &gt; - grub-core/fs/affs.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +++---<br>
&gt; &gt; - grub-core/fs/btrfs.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 +++---<br>
&gt; &gt; - grub-core/fs/hfs.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; &gt; - grub-core/fs/hfsplus.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 +++---<br>
&gt; &gt; - grub-core/fs/iso9660.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; &gt; - grub-core/fs/ntfs.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++--<br>
&gt; &gt; - grub-core/fs/sfs.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; &gt; - grub-core/fs/tar.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; &gt; - grub-core/fs/udf.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
&gt; &gt; - grub-core/fs/zfs/zfs.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
&gt; &gt; - grub-core/gfxmenu/gui_string_util.c=C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 2 +-<br>
&gt; &gt; - grub-core/gfxmenu/widget-box.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 4 ++--<br>
&gt; &gt; - grub-core/io/gzio.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; &gt; - grub-core/kern/efi/efi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 +++---<br>
&gt; &gt; - grub-core/kern/emu/hostdisk.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; &gt; - grub-core/kern/fs.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; &gt; - grub-core/kern/misc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; &gt; - grub-core/kern/parser.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; &gt; - grub-core/kern/uboot/uboot.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; &gt; - grub-core/lib/libgcrypt/cipher/ac.c=C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 8 ++++----<br>
&gt; &gt; - grub-core/lib/libgcrypt/cipher/primegen.c |=C2=A0 4 ++--<br>
&gt; &gt; - grub-core/lib/libgcrypt/cipher/pubkey.c=C2=A0 =C2=A0|=C2=A0 4 =
++--<br>
&gt; &gt; - grub-core/lib/priority_queue.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; &gt; - grub-core/lib/reed_solomon.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 7 +++----<br>
&gt; &gt; - grub-core/lib/relocator.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 +++++-----<br>
&gt; &gt; - grub-core/lib/zstd/fse_decompress.c=C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 2 +-<br>
&gt; &gt; - grub-core/loader/arm/linux.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; &gt; - grub-core/loader/efi/chainloader.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 2 +-<br>
&gt; &gt; - grub-core/loader/i386/bsdXX.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; &gt; - grub-core/loader/i386/xnu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++--<br>
&gt; &gt; - grub-core/loader/macho.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; &gt; - grub-core/loader/multiboot_elfxx.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 2 +-<br>
&gt; &gt; - grub-core/loader/xnu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; &gt; - grub-core/mmap/mmap.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++--<br>
&gt; &gt; - grub-core/net/bootp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; &gt; - grub-core/net/dns.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 +++++-----<br>
&gt; &gt; - grub-core/net/net.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++--<br>
&gt; &gt; - grub-core/normal/charset.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 10 +++++-----<br>
&gt; &gt; - grub-core/normal/cmdline.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 14 +++++++-------<br>
&gt; &gt; - grub-core/normal/menu_entry.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 14 +++++++-------<br>
&gt; &gt; - grub-core/normal/menu_text.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
&gt; &gt; - grub-core/normal/term.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++--<br>
&gt; &gt; - grub-core/osdep/linux/getroot.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0|=C2=A0 6 +++---<br>
&gt; &gt; - grub-core/osdep/unix/config.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; &gt; - grub-core/osdep/windows/getroot.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 2 +-<br>
&gt; &gt; - grub-core/osdep/windows/hostdisk.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 4 ++--<br>
&gt; &gt; - grub-core/osdep/windows/init.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; &gt; - grub-core/osdep/windows/platform.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 4 ++--<br>
&gt; &gt; - grub-core/osdep/windows/relpath.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 2 +-<br>
&gt; &gt; - grub-core/partmap/gpt.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; &gt; - grub-core/partmap/msdos.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; &gt; - grub-core/script/execute.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; &gt; - grub-core/tests/fake_input.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; &gt; - grub-core/tests/video_checksum.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 6 +++---<br>
&gt; &gt; - grub-core/video/capture.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; &gt; - grub-core/video/emu/sdl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; &gt; - grub-core/video/i386/pc/vga.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; &gt; - grub-core/video/readers/png.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; &gt; - include/grub/unicode.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
&gt; &gt; - util/getroot.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; &gt; - util/grub-file.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; &gt; - util/grub-fstest.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
&gt; &gt; - util/grub-install-common.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; &gt; - util/grub-install.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++--<br>
&gt; &gt; - util/grub-mkimagexx.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 ++----<br>
&gt; &gt; - util/grub-mkrescue.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
&gt; &gt; - util/grub-mkstandalone.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; &gt; - util/grub-pe2elf.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 12 +++++-------<br>
&gt; &gt; - util/grub-probe.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++--<br>
&gt; &gt; - 86 files changed, 178 insertions(+), 177 deletions(-)<br>
&gt; &gt; -<br>
&gt; &gt; -diff --git a/grub-core/bus/usb/usbhub.c b/grub-core/bus/usb/usb=
hub.c<br>
&gt; &gt; -index 34a7ff1..a06cce3 100644<br>
&gt; &gt; ---- a/grub-core/bus/usb/usbhub.c<br>
&gt; &gt; -+++ b/grub-core/bus/usb/usbhub.c<br>
&gt; &gt; -@@ -149,8 +149,8 @@ grub_usb_add_hub (grub_usb_device_t dev)<br=
>
&gt; &gt; -=C2=A0 =C2=A0grub_usb_set_configuration (dev, 1);<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0dev-&gt;nports =3D hubdesc.portcnt;<br>
&gt; &gt; --=C2=A0 dev-&gt;children =3D grub_zalloc (hubdesc.portcnt * siz=
eof (dev-<br>
&gt; &gt; &gt; children[0]));<br>
&gt; &gt; --=C2=A0 dev-&gt;ports =3D grub_zalloc (dev-&gt;nports * sizeof =
(dev-&gt;ports[0]));<br>
&gt; &gt; -+=C2=A0 dev-&gt;children =3D grub_calloc (hubdesc.portcnt, size=
of (dev-<br>
&gt; &gt; &gt; children[0]));<br>
&gt; &gt; -+=C2=A0 dev-&gt;ports =3D grub_calloc (dev-&gt;nports, sizeof (=
dev-&gt;ports[0]));<br>
&gt; &gt; -=C2=A0 =C2=A0if (!dev-&gt;children || !dev-&gt;ports)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (dev-&gt;children);<br>
&gt; &gt; -@@ -268,8 +268,8 @@ grub_usb_controller_dev_register_iter<br>
&gt; &gt; (grub_usb_controller_t controller, void *d<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0/* Query the number of ports the root Hub has.=C2=
=A0 */<br>
&gt; &gt; -=C2=A0 =C2=A0hub-&gt;nports =3D controller-&gt;dev-&gt;hubports=
 (controller);<br>
&gt; &gt; --=C2=A0 hub-&gt;devices =3D grub_zalloc (sizeof (hub-&gt;device=
s[0]) * hub-<br>
&gt; &gt; &gt; nports);<br>
&gt; &gt; --=C2=A0 hub-&gt;ports =3D grub_zalloc (sizeof (hub-&gt;ports[0]=
) * hub-&gt;nports);<br>
&gt; &gt; -+=C2=A0 hub-&gt;devices =3D grub_calloc (hub-&gt;nports, sizeof=
 (hub-<br>
&gt; &gt; &gt; devices[0]));<br>
&gt; &gt; -+=C2=A0 hub-&gt;ports =3D grub_calloc (hub-&gt;nports, sizeof (=
hub-&gt;ports[0]));<br>
&gt; &gt; -=C2=A0 =C2=A0if (!hub-&gt;devices || !hub-&gt;ports)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (hub-&gt;devices);<br>
&gt; &gt; -diff --git a/grub-core/commands/efi/lsefisystab.c b/grub-<br>
&gt; &gt; core/commands/efi/lsefisystab.c<br>
&gt; &gt; -index df10302..cd81507 100644<br>
&gt; &gt; ---- a/grub-core/commands/efi/lsefisystab.c<br>
&gt; &gt; -+++ b/grub-core/commands/efi/lsefisystab.c<br>
&gt; &gt; -@@ -71,7 +71,8 @@ grub_cmd_lsefisystab (struct grub_command *cm=
d<br>
&gt; &gt; __attribute__ ((unused)),<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0grub_printf (&quot;Vendor: &quot;);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0for (vendor_utf16 =3D st-&gt;firmware_vendo=
r; *vendor_utf16;<br>
&gt; &gt; vendor_utf16++);<br>
&gt; &gt; --=C2=A0 =C2=A0 vendor =3D grub_malloc (4 * (vendor_utf16 - st-&=
gt;firmware_vendor)<br>
&gt; &gt; + 1);<br>
&gt; &gt; -+=C2=A0 =C2=A0 /* Allocate extra 3 bytes to simplify math. */<b=
r>
&gt; &gt; -+=C2=A0 =C2=A0 vendor =3D grub_calloc (4, vendor_utf16 - st-&gt=
;firmware_vendor +<br>
&gt; &gt; 1);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if (!vendor)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return grub_errno;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0*grub_utf16_to_utf8 ((grub_uint8_t *) vendo=
r, st-<br>
&gt; &gt; &gt; firmware_vendor,<br>
&gt; &gt; -diff --git a/grub-core/commands/legacycfg.c b/grub-<br>
&gt; &gt; core/commands/legacycfg.c<br>
&gt; &gt; -index db7a8f0..5e3ec0d 100644<br>
&gt; &gt; ---- a/grub-core/commands/legacycfg.c<br>
&gt; &gt; -+++ b/grub-core/commands/legacycfg.c<br>
&gt; &gt; -@@ -314,7 +314,7 @@ grub_cmd_legacy_kernel (struct grub_command=
<br>
&gt; &gt; *mycmd __attribute__ ((unused)),<br>
&gt; &gt; -=C2=A0 =C2=A0if (argc &lt; 2)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return grub_error (GRUB_ERR_BAD_ARGUMENT, N=
_(&quot;filename<br>
&gt; &gt; expected&quot;));<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 cutargs =3D grub_malloc (sizeof (cutargs[0]) * (argc - =
1));<br>
&gt; &gt; -+=C2=A0 cutargs =3D grub_calloc (argc - 1, sizeof (cutargs[0]))=
;<br>
&gt; &gt; -=C2=A0 =C2=A0if (!cutargs)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return grub_errno;<br>
&gt; &gt; -=C2=A0 =C2=A0cutargc =3D argc - 1;<br>
&gt; &gt; -@@ -436,7 +436,7 @@ grub_cmd_legacy_kernel (struct grub_command=
<br>
&gt; &gt; *mycmd __attribute__ ((unused)),<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char rbuf[3] =
=3D &quot;-r&quot;;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bsdargc =3D cut=
argc + 2;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bsdargs =3D grub_mal=
loc (sizeof (bsdargs[0]) * bsdargc);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bsdargs =3D grub_cal=
loc (bsdargc, sizeof (bsdargs[0]));<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!bsdargs)<b=
r>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0e=
rr =3D grub_errno;<br>
&gt; &gt; -@@ -559,7 +559,7 @@ grub_cmd_legacy_initrdnounzip (struct<br>
&gt; &gt; grub_command *mycmd __attribute__ ((unused<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return grub_error (GRUB_ERR_BAD_ARGU=
MENT, N_(&quot;can&#39;t find<br>
&gt; &gt; command `%s&#39;&quot;),<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;module&quot;);<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 newargs =3D grub_malloc ((argc + 1) * siz=
eof (newargs[0]));<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 newargs =3D grub_calloc (argc + 1, sizeof=
 (newargs[0]));<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!newargs)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return grub_errno;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_memcpy (newargs + 1, args, argc=
 * sizeof (newargs[0]));<br>
&gt; &gt; -diff --git a/grub-core/commands/menuentry.c b/grub-<br>
&gt; &gt; core/commands/menuentry.c<br>
&gt; &gt; -index 2c5363d..9164df7 100644<br>
&gt; &gt; ---- a/grub-core/commands/menuentry.c<br>
&gt; &gt; -+++ b/grub-core/commands/menuentry.c<br>
&gt; &gt; -@@ -154,7 +154,7 @@ grub_normal_add_menu_entry (int argc, const=
 char<br>
&gt; &gt; **args,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0goto fail;<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0/* Save argc, args to pass as parameters to block =
arg later. */<br>
&gt; &gt; --=C2=A0 menu_args =3D grub_malloc (sizeof (char*) * (argc + 1))=
;<br>
&gt; &gt; -+=C2=A0 menu_args =3D grub_calloc (argc + 1, sizeof (char *));<=
br>
&gt; &gt; -=C2=A0 =C2=A0if (! menu_args)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0goto fail;<br>
&gt; &gt; - <br>
&gt; &gt; -diff --git a/grub-core/commands/nativedisk.c b/grub-<br>
&gt; &gt; core/commands/nativedisk.c<br>
&gt; &gt; -index 699447d..7c8f97f 100644<br>
&gt; &gt; ---- a/grub-core/commands/nativedisk.c<br>
&gt; &gt; -+++ b/grub-core/commands/nativedisk.c<br>
&gt; &gt; -@@ -195,7 +195,7 @@ grub_cmd_nativedisk (grub_command_t cmd<br>
&gt; &gt; __attribute__ ((unused)),<br>
&gt; &gt; -=C2=A0 =C2=A0else<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0path_prefix =3D prefix;<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 mods =3D grub_malloc (argc * sizeof (mods[0]));<br>
&gt; &gt; -+=C2=A0 mods =3D grub_calloc (argc, sizeof (mods[0]));<br>
&gt; &gt; -=C2=A0 =C2=A0if (!mods)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return grub_errno;<br>
&gt; &gt; - <br>
&gt; &gt; -diff --git a/grub-core/commands/parttool.c b/grub-<br>
&gt; &gt; core/commands/parttool.c<br>
&gt; &gt; -index 22b46b1..051e313 100644<br>
&gt; &gt; ---- a/grub-core/commands/parttool.c<br>
&gt; &gt; -+++ b/grub-core/commands/parttool.c<br>
&gt; &gt; -@@ -59,7 +59,13 @@ grub_parttool_register(const char *part_name=
,<br>
&gt; &gt; -=C2=A0 =C2=A0for (nargs =3D 0; args[nargs].name !=3D 0; nargs++=
);<br>
&gt; &gt; -=C2=A0 =C2=A0cur-&gt;nargs =3D nargs;<br>
&gt; &gt; -=C2=A0 =C2=A0cur-&gt;args =3D (struct grub_parttool_argdesc *)<=
br>
&gt; &gt; --=C2=A0 =C2=A0 grub_malloc ((nargs + 1) * sizeof (struct<br>
&gt; &gt; grub_parttool_argdesc));<br>
&gt; &gt; -+=C2=A0 =C2=A0 grub_calloc (nargs + 1, sizeof (struct grub_part=
tool_argdesc));<br>
&gt; &gt; -+=C2=A0 if (!cur-&gt;args)<br>
&gt; &gt; -+=C2=A0 =C2=A0 {<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 grub_free (cur);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 curhandle--;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; &gt; -+=C2=A0 =C2=A0 }<br>
&gt; &gt; -=C2=A0 =C2=A0grub_memcpy (cur-&gt;args, args,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (nargs + 1) * =
sizeof (struct grub_parttool_argdesc));<br>
&gt; &gt; - <br>
&gt; &gt; -@@ -257,7 +263,7 @@ grub_cmd_parttool (grub_command_t cmd<br>
&gt; &gt; __attribute__ ((unused)),<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return err;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 parsed =3D (int *) grub_zalloc (argc * sizeof (int));<b=
r>
&gt; &gt; -+=C2=A0 parsed =3D (int *) grub_calloc (argc, sizeof (int));<br=
>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0for (i =3D 1; i &lt; argc; i++)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if (! parsed[i])<br>
&gt; &gt; -@@ -290,7 +296,7 @@ grub_cmd_parttool (grub_command_t cmd<br>
&gt; &gt; __attribute__ ((unused)),<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ptool =3D cur;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0pargs =3D (struct grub_parttool_args=
 *)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_zalloc (ptool-&gt;nargs * siz=
eof (struct<br>
&gt; &gt; grub_parttool_args));<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_calloc (ptool-&gt;nargs, size=
of (struct<br>
&gt; &gt; grub_parttool_args));<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0for (j =3D i; j &lt; argc; j++)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (! parsed[j])<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -diff --git a/grub-core/commands/regexp.c b/grub-<br>
&gt; &gt; core/commands/regexp.c<br>
&gt; &gt; -index f00b184..4019164 100644<br>
&gt; &gt; ---- a/grub-core/commands/regexp.c<br>
&gt; &gt; -+++ b/grub-core/commands/regexp.c<br>
&gt; &gt; -@@ -116,7 +116,7 @@ grub_cmd_regexp (grub_extcmd_context_t ctxt=
, int<br>
&gt; &gt; argc, char **args)<br>
&gt; &gt; -=C2=A0 =C2=A0if (ret)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0goto fail;<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 matches =3D grub_zalloc (sizeof (*matches) * (regex.re_=
nsub + 1));<br>
&gt; &gt; -+=C2=A0 matches =3D grub_calloc (regex.re_nsub + 1, sizeof (*ma=
tches));<br>
&gt; &gt; -=C2=A0 =C2=A0if (! matches)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0goto fail;<br>
&gt; &gt; - <br>
&gt; &gt; -diff --git a/grub-core/commands/search_wrap.c b/grub-<br>
&gt; &gt; core/commands/search_wrap.c<br>
&gt; &gt; -index d7fd26b..47fc8eb 100644<br>
&gt; &gt; ---- a/grub-core/commands/search_wrap.c<br>
&gt; &gt; -+++ b/grub-core/commands/search_wrap.c<br>
&gt; &gt; -@@ -122,7 +122,7 @@ grub_cmd_search (grub_extcmd_context_t ctxt=
, int<br>
&gt; &gt; argc, char **args)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0for (i =3D 0; state[SEARCH_HINT_BAREMETAL].=
args[i]; i++)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0nhints++;<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 hints =3D grub_malloc (sizeof (hints[0]) * nhints);<br>
&gt; &gt; -+=C2=A0 hints =3D grub_calloc (nhints, sizeof (hints[0]));<br>
&gt; &gt; -=C2=A0 =C2=A0if (!hints)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return grub_errno;<br>
&gt; &gt; -=C2=A0 =C2=A0j =3D 0;<br>
&gt; &gt; -diff --git a/grub-core/disk/diskfilter.c b/grub-<br>
&gt; &gt; core/disk/diskfilter.c<br>
&gt; &gt; -index c3b578a..68ca9e0 100644<br>
&gt; &gt; ---- a/grub-core/disk/diskfilter.c<br>
&gt; &gt; -+++ b/grub-core/disk/diskfilter.c<br>
&gt; &gt; -@@ -1134,7 +1134,7 @@ grub_diskfilter_make_raid (grub_size_t<br=
>
&gt; &gt; uuidlen, char *uuid, int nmemb,<br>
&gt; &gt; -=C2=A0 =C2=A0array-&gt;lvs-&gt;segments-&gt;node_count =3D nmem=
b;<br>
&gt; &gt; -=C2=A0 =C2=A0array-&gt;lvs-&gt;segments-&gt;raid_member_size =
=3D disk_size;<br>
&gt; &gt; -=C2=A0 =C2=A0array-&gt;lvs-&gt;segments-&gt;nodes<br>
&gt; &gt; --=C2=A0 =C2=A0 =3D grub_zalloc (nmemb * sizeof (array-&gt;lvs-&=
gt;segments-<br>
&gt; &gt; &gt; nodes[0]));<br>
&gt; &gt; -+=C2=A0 =C2=A0 =3D grub_calloc (nmemb, sizeof (array-&gt;lvs-&g=
t;segments-&gt;nodes[0]));<br>
&gt; &gt; -=C2=A0 =C2=A0array-&gt;lvs-&gt;segments-&gt;stripe_size =3D str=
ipe_size;<br>
&gt; &gt; -=C2=A0 =C2=A0for (i =3D 0; i &lt; nmemb; i++)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -@@ -1226,7 +1226,7 @@ insert_array (grub_disk_t disk, const str=
uct<br>
&gt; &gt; grub_diskfilter_pv_id *id,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_partition_t p;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (p =3D disk-&gt;partition=
; p; p =3D p-&gt;parent)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s++;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 pv-&gt;partmaps =3D xmalloc (s * s=
izeof (pv-&gt;partmaps[0]));<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pv-&gt;partmaps =3D xcalloc (s, si=
zeof (pv-&gt;partmaps[0]));<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s =3D 0;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (p =3D disk-&gt;partition=
; p; p =3D p-&gt;parent)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pv-&gt;partmaps[s++] =
=3D xstrdup (p-&gt;partmap-&gt;name);<br>
&gt; &gt; -diff --git a/grub-core/disk/ieee1275/ofdisk.c b/grub-<br>
&gt; &gt; core/disk/ieee1275/ofdisk.c<br>
&gt; &gt; -index f73257e..03674cb 100644<br>
&gt; &gt; ---- a/grub-core/disk/ieee1275/ofdisk.c<br>
&gt; &gt; -+++ b/grub-core/disk/ieee1275/ofdisk.c<br>
&gt; &gt; -@@ -297,7 +297,7 @@ dev_iterate (const struct grub_ieee1275_dev=
alias<br>
&gt; &gt; *alias)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Power machines documentation spec=
ify 672 as maximum SAS<br>
&gt; &gt; disks in<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 one system. Using a slightly=
 larger value to be safe. */<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0table_size =3D 768;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 table =3D grub_malloc (table_size * sizeo=
f (grub_uint64_t));<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 table =3D grub_calloc (table_size, sizeof=
 (grub_uint64_t));<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!table)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -diff --git a/grub-core/disk/ldm.c b/grub-core/disk/ldm.c<br>
&gt; &gt; -index 2a22d2d..e632370 100644<br>
&gt; &gt; ---- a/grub-core/disk/ldm.c<br>
&gt; &gt; -+++ b/grub-core/disk/ldm.c<br>
&gt; &gt; -@@ -323,8 +323,8 @@ make_vg (grub_disk_t disk,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lv-&gt;segments-&gt;type =3D =
GRUB_DISKFILTER_MIRROR;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lv-&gt;segments-&gt;node_coun=
t =3D 0;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lv-&gt;segments-&gt;node_allo=
c =3D 8;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 lv-&gt;segments-&gt;nodes =3D grub=
_zalloc (sizeof (*lv-&gt;segments-<br>
&gt; &gt; &gt; nodes)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0* lv-&gt;segments-<br>
&gt; &gt; &gt; node_alloc);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 lv-&gt;segments-&gt;nodes =3D grub=
_calloc (lv-&gt;segments-<br>
&gt; &gt; &gt; node_alloc,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0sizeof (*lv-&gt;segments-<br>
&gt; &gt; &gt; nodes));<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!lv-&gt;segments-&gt;node=
s)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail2;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D vblk[i].dynamic;<br>
&gt; &gt; -@@ -543,8 +543,8 @@ make_vg (grub_disk_t disk,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0comp-&gt;segmen=
t_alloc =3D 8;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0comp-&gt;segmen=
t_count =3D 0;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 comp-&gt;segments =
=3D grub_malloc (sizeof (*comp-&gt;segments)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * comp-&gt;segment_alloc);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 comp-&gt;segments =
=3D grub_calloc (comp-&gt;segment_alloc,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 sizeof (*comp-<br>
&gt; &gt; &gt; segments));<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!comp-&gt;s=
egments)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fai=
l2;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; -@@ -590,8 +590,8 @@ make_vg (grub_disk_t disk,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0comp-&gt;segmen=
ts-&gt;node_count =3D read_int (ptr + 1, *ptr);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0comp-&gt;segmen=
ts-&gt;node_alloc =3D comp-&gt;segments-<br>
&gt; &gt; &gt; node_count;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 comp-&gt;segments-&g=
t;nodes =3D grub_zalloc (sizeof (*comp-<br>
&gt; &gt; &gt; segments-&gt;nodes)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* comp-&gt;segments-<br>
&gt; &gt; &gt; node_alloc);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 comp-&gt;segments-&g=
t;nodes =3D grub_calloc (comp-&gt;segments-<br>
&gt; &gt; &gt; node_alloc,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof (*comp-<br>
&gt; &gt; &gt; segments-&gt;nodes));<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!lv-&gt;seg=
ments-&gt;nodes)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fai=
l2;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; -@@ -1017,7 +1017,7 @@ grub_util_ldm_embed (struct grub_disk *di=
sk,<br>
&gt; &gt; unsigned int *nsectors,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0*nsectors =3D lv-&gt;size;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (*nsectors &gt; max_nsectors)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0*nsectors =3D max_nsectors;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 *sectors =3D grub_malloc (*nsectors * siz=
eof (**sectors));<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 *sectors =3D grub_calloc (*nsectors, size=
of (**sectors));<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!*sectors)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return grub_errno;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; *nsectors; i++)=
<br>
&gt; &gt; -diff --git a/grub-core/disk/luks.c b/grub-core/disk/luks.c<br>
&gt; &gt; -index 86c50c6..18b3a8b 100644<br>
&gt; &gt; ---- a/grub-core/disk/luks.c<br>
&gt; &gt; -+++ b/grub-core/disk/luks.c<br>
&gt; &gt; -@@ -336,7 +336,7 @@ luks_recover_key (grub_disk_t source,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; grub_be_to_cpu32 (header.=
keyblock[i].stripes) &gt;<br>
&gt; &gt; max_stripes)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0max_stripes =3D grub_be_to_cpu32 (he=
ader.keyblock[i].stripes);<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 split_key =3D grub_malloc (keysize * max_stripes);<br>
&gt; &gt; -+=C2=A0 split_key =3D grub_calloc (keysize, max_stripes);<br>
&gt; &gt; -=C2=A0 =C2=A0if (!split_key)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return grub_errno;<br>
&gt; &gt; - <br>
&gt; &gt; -diff --git a/grub-core/disk/lvm.c b/grub-core/disk/lvm.c<br>
&gt; &gt; -index dc6b83b..7b5fbbc 100644<br>
&gt; &gt; ---- a/grub-core/disk/lvm.c<br>
&gt; &gt; -+++ b/grub-core/disk/lvm.c<br>
&gt; &gt; -@@ -209,7 +209,7 @@ grub_lvm_detect (grub_disk_t disk,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 first one.=C2=A0 */<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0/* Allocate buffer space for the circular worst-ca=
se scenario. */<br>
&gt; &gt; --=C2=A0 metadatabuf =3D grub_malloc (2 * mda_size);<br>
&gt; &gt; -+=C2=A0 metadatabuf =3D grub_calloc (2, mda_size);<br>
&gt; &gt; -=C2=A0 =C2=A0if (! metadatabuf)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0goto fail;<br>
&gt; &gt; - <br>
&gt; &gt; -@@ -464,7 +464,7 @@ grub_lvm_detect (grub_disk_t disk,<br>
&gt; &gt; - #endif<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g=
oto lvs_fail;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lv-&gt;segments =3D =
grub_zalloc (sizeof (*seg) * lv-<br>
&gt; &gt; &gt; segment_count);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lv-&gt;segments =3D =
grub_calloc (lv-&gt;segment_count, sizeof<br>
&gt; &gt; (*seg));<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0seg =3D lv-&gt;=
segments;<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i=
 &lt; lv-&gt;segment_count; i++)<br>
&gt; &gt; -@@ -521,8 +521,8 @@ grub_lvm_detect (grub_disk_t disk,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0if (seg-&gt;node_count !=3D 1)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0seg-&gt;stripe_size =3D grub_lvm_getvalue (&amp;p,<br>
&gt; &gt; &quot;stripe_size =3D &quot;);<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 seg-&gt;nodes =3D grub_zalloc (sizeof (*stripe)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 * seg-&gt;node_count);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 seg-&gt;nodes =3D grub_calloc (seg-&gt;node_count,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 sizeof (*stripe));<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0stripe =3D seg-&gt;nodes;<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0p =3D grub_strstr (p, &quot;stripes =3D [&quot;);<br>
&gt; &gt; -@@ -898,7 +898,7 @@ grub_lvm_detect (grub_disk_t disk,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<b=
r>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (lv)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cache-&gt;lv-=
&gt;segments =3D grub_malloc (lv-&gt;segment_count<br>
&gt; &gt; * sizeof (*lv-&gt;segments));<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cache-&gt;lv-=
&gt;segments =3D grub_calloc (lv-&gt;segment_count,<br>
&gt; &gt; sizeof (*lv-&gt;segments));<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!cac=
he-&gt;lv-&gt;segments)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{=
<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0grub_lvm_free_cache_lvs (cache_lvs);<br>
&gt; &gt; -@@ -911,7 +911,7 @@ grub_lvm_detect (grub_disk_t disk,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0struct grub_diskfilter_node *nodes =3D lv-<br>
&gt; &gt; &gt; segments[i].nodes;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0grub_size_t node_count =3D lv-<br>
&gt; &gt; &gt; segments[i].node_count;<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 cache-&gt;lv-&gt;segments[i].nodes =3D grub_malloc<br>
&gt; &gt; (node_count * sizeof (*nodes));<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 cache-&gt;lv-&gt;segments[i].nodes =3D grub_calloc<br>
&gt; &gt; (node_count, sizeof (*nodes));<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0if (!cache-&gt;lv-&gt;segments[i].nodes)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0for (j =3D 0; j &lt; i; ++j)<br>
&gt; &gt; -diff --git a/grub-core/disk/xen/xendisk.c b/grub-<br>
&gt; &gt; core/disk/xen/xendisk.c<br>
&gt; &gt; -index 48476cb..d6612ee 100644<br>
&gt; &gt; ---- a/grub-core/disk/xen/xendisk.c<br>
&gt; &gt; -+++ b/grub-core/disk/xen/xendisk.c<br>
&gt; &gt; -@@ -426,7 +426,7 @@ grub_xendisk_init (void)<br>
&gt; &gt; -=C2=A0 =C2=A0if (!ctr)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return;<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 virtdisks =3D grub_malloc (ctr * sizeof (virtdisks[0]))=
;<br>
&gt; &gt; -+=C2=A0 virtdisks =3D grub_calloc (ctr, sizeof (virtdisks[0]));=
<br>
&gt; &gt; -=C2=A0 =C2=A0if (!virtdisks)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return;<br>
&gt; &gt; -=C2=A0 =C2=A0if (grub_xenstore_dir (&quot;device/vbd&quot;, fil=
l, &amp;ctr))<br>
&gt; &gt; -diff --git a/grub-core/efiemu/loadcore.c b/grub-<br>
&gt; &gt; core/efiemu/loadcore.c<br>
&gt; &gt; -index 44085ef..2b92462 100644<br>
&gt; &gt; ---- a/grub-core/efiemu/loadcore.c<br>
&gt; &gt; -+++ b/grub-core/efiemu/loadcore.c<br>
&gt; &gt; -@@ -201,7 +201,7 @@ grub_efiemu_count_symbols (const Elf_Ehdr *=
e)<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0grub_efiemu_nelfsyms =3D (unsigned) s-&gt;sh_size =
/ (unsigned) s-<br>
&gt; &gt; &gt; sh_entsize;<br>
&gt; &gt; -=C2=A0 =C2=A0grub_efiemu_elfsyms =3D (struct grub_efiemu_elf_sy=
m *)<br>
&gt; &gt; --=C2=A0 =C2=A0 grub_malloc (sizeof (struct grub_efiemu_elf_sym)=
 *<br>
&gt; &gt; grub_efiemu_nelfsyms);<br>
&gt; &gt; -+=C2=A0 =C2=A0 grub_calloc (grub_efiemu_nelfsyms, sizeof (struc=
t<br>
&gt; &gt; grub_efiemu_elf_sym));<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0/* Relocators */<br>
&gt; &gt; -=C2=A0 =C2=A0for (i =3D 0, s =3D (Elf_Shdr *) ((char *) e + e-&=
gt;e_shoff);<br>
&gt; &gt; -diff --git a/grub-core/efiemu/mm.c b/grub-core/efiemu/mm.c<br>
&gt; &gt; -index 52a032f..9b8e0d0 100644<br>
&gt; &gt; ---- a/grub-core/efiemu/mm.c<br>
&gt; &gt; -+++ b/grub-core/efiemu/mm.c<br>
&gt; &gt; -@@ -554,11 +554,11 @@ grub_efiemu_mmap_sort_and_uniq (void)<br>
&gt; &gt; -=C2=A0 =C2=A0/* Initialize variables*/<br>
&gt; &gt; -=C2=A0 =C2=A0grub_memset (present, 0, sizeof (int) *<br>
&gt; &gt; GRUB_EFI_MAX_MEMORY_TYPE);<br>
&gt; &gt; -=C2=A0 =C2=A0scanline_events =3D (struct grub_efiemu_mmap_scan =
*)<br>
&gt; &gt; --=C2=A0 =C2=A0 grub_malloc (sizeof (struct grub_efiemu_mmap_sca=
n) * 2 *<br>
&gt; &gt; mmap_num);<br>
&gt; &gt; -+=C2=A0 =C2=A0 grub_calloc (mmap_num, sizeof (struct grub_efiem=
u_mmap_scan) *<br>
&gt; &gt; 2);<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0/* Number of chunks can&#39;t increase more than b=
y factor of 2 */<br>
&gt; &gt; -=C2=A0 =C2=A0result =3D (grub_efi_memory_descriptor_t *)<br>
&gt; &gt; --=C2=A0 =C2=A0 grub_malloc (sizeof (grub_efi_memory_descriptor_=
t) * 2 *<br>
&gt; &gt; mmap_num);<br>
&gt; &gt; -+=C2=A0 =C2=A0 grub_calloc (mmap_num, sizeof (grub_efi_memory_d=
escriptor_t) *<br>
&gt; &gt; 2);<br>
&gt; &gt; -=C2=A0 =C2=A0if (!result || !scanline_events)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (result);<br>
&gt; &gt; -@@ -660,7 +660,7 @@ grub_efiemu_mm_do_alloc (void)<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0/* Preallocate mmap */<br>
&gt; &gt; -=C2=A0 =C2=A0efiemu_mmap =3D (grub_efi_memory_descriptor_t *)<b=
r>
&gt; &gt; --=C2=A0 =C2=A0 grub_malloc (mmap_reserved_size * sizeof<br>
&gt; &gt; (grub_efi_memory_descriptor_t));<br>
&gt; &gt; -+=C2=A0 =C2=A0 grub_calloc (mmap_reserved_size, sizeof<br>
&gt; &gt; (grub_efi_memory_descriptor_t));<br>
&gt; &gt; -=C2=A0 =C2=A0if (!efiemu_mmap)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_efiemu_unload ();<br>
&gt; &gt; -diff --git a/grub-core/font/font.c b/grub-core/font/font.c<br>
&gt; &gt; -index 85a2925..8e118b3 100644<br>
&gt; &gt; ---- a/grub-core/font/font.c<br>
&gt; &gt; -+++ b/grub-core/font/font.c<br>
&gt; &gt; -@@ -293,8 +293,7 @@ load_font_index (grub_file_t file, grub_uin=
t32_t<br>
&gt; &gt; sect_length, struct<br>
&gt; &gt; -=C2=A0 =C2=A0font-&gt;num_chars =3D sect_length / FONT_CHAR_IND=
EX_ENTRY_SIZE;<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0/* Allocate the character index array.=C2=A0 */<br=
>
&gt; &gt; --=C2=A0 font-&gt;char_index =3D grub_malloc (font-&gt;num_chars=
<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * sizeof (struct<br>
&gt; &gt; char_index_entry));<br>
&gt; &gt; -+=C2=A0 font-&gt;char_index =3D grub_calloc (font-&gt;num_chars=
, sizeof (struct<br>
&gt; &gt; char_index_entry));<br>
&gt; &gt; -=C2=A0 =C2=A0if (!font-&gt;char_index)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return 1;<br>
&gt; &gt; -=C2=A0 =C2=A0font-&gt;bmp_idx =3D grub_malloc (0x10000 * sizeof=
 (grub_uint16_t));<br>
&gt; &gt; -diff --git a/grub-core/fs/affs.c b/grub-core/fs/affs.c<br>
&gt; &gt; -index 6b6a2bc..220b371 100644<br>
&gt; &gt; ---- a/grub-core/fs/affs.c<br>
&gt; &gt; -+++ b/grub-core/fs/affs.c<br>
&gt; &gt; -@@ -301,7 +301,7 @@ grub_affs_read_symlink (grub_fshelp_node_t =
node)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; -=C2=A0 =C2=A0latin1[symlink_size] =3D 0;<br>
&gt; &gt; --=C2=A0 utf8 =3D grub_malloc (symlink_size * GRUB_MAX_UTF8_PER_=
LATIN1 + 1);<br>
&gt; &gt; -+=C2=A0 utf8 =3D grub_calloc (GRUB_MAX_UTF8_PER_LATIN1 + 1, sym=
link_size);<br>
&gt; &gt; -=C2=A0 =C2=A0if (!utf8)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (latin1);<br>
&gt; &gt; -@@ -422,7 +422,7 @@ grub_affs_iterate_dir (grub_fshelp_node_t d=
ir,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 hashtable =3D grub_zalloc (data-&gt;htsize * sizeof (*h=
ashtable));<br>
&gt; &gt; -+=C2=A0 hashtable =3D grub_calloc (data-&gt;htsize, sizeof (*ha=
shtable));<br>
&gt; &gt; -=C2=A0 =C2=A0if (!hashtable)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return 1;<br>
&gt; &gt; - <br>
&gt; &gt; -@@ -628,7 +628,7 @@ grub_affs_label (grub_device_t device, char=
<br>
&gt; &gt; **label)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D file.namelen;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (len &gt; sizeof (<a href=3D"http=
://file.name" rel=3D"noreferrer" target=3D"_blank">file.name</a>))<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D sizeof (<a href=3D"http://fi=
le.name" rel=3D"noreferrer" target=3D"_blank">file.name</a>);<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 *label =3D grub_malloc (len * GRUB_MAX_UT=
F8_PER_LATIN1 + 1);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 *label =3D grub_calloc (GRUB_MAX_UTF8_PER=
_LATIN1 + 1, len);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (*label)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0*grub_latin1_to_utf8 ((grub_uint8_t =
*) *label, <a href=3D"http://file.name" rel=3D"noreferrer" target=3D"_blank=
">file.name</a>,<br>
&gt; &gt; len) =3D &#39;\0&#39;;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; -diff --git a/grub-core/fs/btrfs.c b/grub-core/fs/btrfs.c<br>
&gt; &gt; -index 48bd3d0..11272ef 100644<br>
&gt; &gt; ---- a/grub-core/fs/btrfs.c<br>
&gt; &gt; -+++ b/grub-core/fs/btrfs.c<br>
&gt; &gt; -@@ -413,7 +413,7 @@ lower_bound (struct grub_btrfs_data *data,<=
br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0desc-&gt;allocated =3D 16;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0desc-&gt;depth =3D 0;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 desc-&gt;data =3D grub_malloc (sizeof (de=
sc-&gt;data[0]) * desc-<br>
&gt; &gt; &gt; allocated);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 desc-&gt;data =3D grub_calloc (desc-&gt;a=
llocated, sizeof (desc-<br>
&gt; &gt; &gt; data[0]));<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!desc-&gt;data)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return grub_errno;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; -@@ -752,7 +752,7 @@ raid56_read_retry (struct grub_btrfs_data *=
data,<br>
&gt; &gt; -=C2=A0 =C2=A0grub_err_t ret =3D GRUB_ERR_OUT_OF_MEMORY;<br>
&gt; &gt; -=C2=A0 =C2=A0grub_uint64_t i, failed_devices;<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 buffers =3D grub_zalloc (sizeof(*buffers) * nstripes);<=
br>
&gt; &gt; -+=C2=A0 buffers =3D grub_calloc (nstripes, sizeof (*buffers));<=
br>
&gt; &gt; -=C2=A0 =C2=A0if (!buffers)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
&gt; &gt; - <br>
&gt; &gt; -@@ -2160,7 +2160,7 @@ grub_btrfs_embed (grub_device_t device<br=
>
&gt; &gt; __attribute__ ((unused)),<br>
&gt; &gt; -=C2=A0 =C2=A0*nsectors =3D 64 * 2 - 1;<br>
&gt; &gt; -=C2=A0 =C2=A0if (*nsectors &gt; max_nsectors)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0*nsectors =3D max_nsectors;<br>
&gt; &gt; --=C2=A0 *sectors =3D grub_malloc (*nsectors * sizeof (**sectors=
));<br>
&gt; &gt; -+=C2=A0 *sectors =3D grub_calloc (*nsectors, sizeof (**sectors)=
);<br>
&gt; &gt; -=C2=A0 =C2=A0if (!*sectors)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return grub_errno;<br>
&gt; &gt; -=C2=A0 =C2=A0for (i =3D 0; i &lt; *nsectors; i++)<br>
&gt; &gt; -diff --git a/grub-core/fs/hfs.c b/grub-core/fs/hfs.c<br>
&gt; &gt; -index ac0a409..3fe842b 100644<br>
&gt; &gt; ---- a/grub-core/fs/hfs.c<br>
&gt; &gt; -+++ b/grub-core/fs/hfs.c<br>
&gt; &gt; -@@ -1360,7 +1360,7 @@ grub_hfs_label (grub_device_t device, cha=
r<br>
&gt; &gt; **label)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_size_t len =3D data-&gt;sblock.=
volname[0];<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (len &gt; sizeof (data-&gt;sblock=
.volname) - 1)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D sizeof (data-&gt;sblock.voln=
ame) - 1;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 *label =3D grub_malloc (len * MAX_UTF8_PE=
R_MAC_ROMAN + 1);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 *label =3D grub_calloc (MAX_UTF8_PER_MAC_=
ROMAN + 1, len);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (*label)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0macroman_to_utf8 (*label, data-&gt;s=
block.volname + 1,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0len + 1, 0);<br>
&gt; &gt; -diff --git a/grub-core/fs/hfsplus.c b/grub-core/fs/hfsplus.c<br=
>
&gt; &gt; -index 54786bb..dae43be 100644<br>
&gt; &gt; ---- a/grub-core/fs/hfsplus.c<br>
&gt; &gt; -+++ b/grub-core/fs/hfsplus.c<br>
&gt; &gt; -@@ -720,7 +720,7 @@ list_nodes (void *record, void *hook_arg)<b=
r>
&gt; &gt; -=C2=A0 =C2=A0if (! filename)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 keyname =3D grub_malloc (grub_be_to_cpu16 (catkey-&gt;n=
amelen) *<br>
&gt; &gt; sizeof (*keyname));<br>
&gt; &gt; -+=C2=A0 keyname =3D grub_calloc (grub_be_to_cpu16 (catkey-&gt;n=
amelen), sizeof<br>
&gt; &gt; (*keyname));<br>
&gt; &gt; -=C2=A0 =C2=A0if (!keyname)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (filename);<br>
&gt; &gt; -@@ -1007,7 +1007,7 @@ grub_hfsplus_label (grub_device_t device,=
 char<br>
&gt; &gt; **label)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0grub_hfsplus_btree_recptr (&amp;data-&gt;ca=
talog_tree, node, ptr);<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0label_len =3D grub_be_to_cpu16 (catkey-&gt;namelen=
);<br>
&gt; &gt; --=C2=A0 label_name =3D grub_malloc (label_len * sizeof (*label_=
name));<br>
&gt; &gt; -+=C2=A0 label_name =3D grub_calloc (label_len, sizeof (*label_n=
ame));<br>
&gt; &gt; -=C2=A0 =C2=A0if (!label_name)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (node);<br>
&gt; &gt; -@@ -1029,7 +1029,7 @@ grub_hfsplus_label (grub_device_t device,=
 char<br>
&gt; &gt; **label)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 *label =3D grub_malloc (label_len * GRUB_MAX_UTF8_PER_U=
TF16 + 1);<br>
&gt; &gt; -+=C2=A0 *label =3D grub_calloc (label_len, GRUB_MAX_UTF8_PER_UT=
F16 + 1);<br>
&gt; &gt; -=C2=A0 =C2=A0if (! *label)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (label_name);<br>
&gt; &gt; -diff --git a/grub-core/fs/iso9660.c b/grub-core/fs/iso9660.c<br=
>
&gt; &gt; -index 49c0c63..4f1b52a 100644<br>
&gt; &gt; ---- a/grub-core/fs/iso9660.c<br>
&gt; &gt; -+++ b/grub-core/fs/iso9660.c<br>
&gt; &gt; -@@ -331,7 +331,7 @@ grub_iso9660_convert_string (grub_uint8_t *=
us,<br>
&gt; &gt; int len)<br>
&gt; &gt; -=C2=A0 =C2=A0int i;<br>
&gt; &gt; -=C2=A0 =C2=A0grub_uint16_t t[MAX_NAMELEN / 2 + 1];<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 p =3D grub_malloc (len * GRUB_MAX_UTF8_PER_UTF16 + 1);<=
br>
&gt; &gt; -+=C2=A0 p =3D grub_calloc (len, GRUB_MAX_UTF8_PER_UTF16 + 1);<b=
r>
&gt; &gt; -=C2=A0 =C2=A0if (! p)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt; &gt; - <br>
&gt; &gt; -diff --git a/grub-core/fs/ntfs.c b/grub-core/fs/ntfs.c<br>
&gt; &gt; -index fc4e1f6..2f34f76 100644<br>
&gt; &gt; ---- a/grub-core/fs/ntfs.c<br>
&gt; &gt; -+++ b/grub-core/fs/ntfs.c<br>
&gt; &gt; -@@ -556,8 +556,8 @@ get_utf8 (grub_uint8_t *in, grub_size_t len=
)<br>
&gt; &gt; -=C2=A0 =C2=A0grub_uint16_t *tmp;<br>
&gt; &gt; -=C2=A0 =C2=A0grub_size_t i;<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 buf =3D grub_malloc (len * GRUB_MAX_UTF8_PER_UTF16 + 1)=
;<br>
&gt; &gt; --=C2=A0 tmp =3D grub_malloc (len * sizeof (tmp[0]));<br>
&gt; &gt; -+=C2=A0 buf =3D grub_calloc (len, GRUB_MAX_UTF8_PER_UTF16 + 1);=
<br>
&gt; &gt; -+=C2=A0 tmp =3D grub_calloc (len, sizeof (tmp[0]));<br>
&gt; &gt; -=C2=A0 =C2=A0if (!buf || !tmp)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (buf);<br>
&gt; &gt; -diff --git a/grub-core/fs/sfs.c b/grub-core/fs/sfs.c<br>
&gt; &gt; -index 50c1fe7..90f7fb3 100644<br>
&gt; &gt; ---- a/grub-core/fs/sfs.c<br>
&gt; &gt; -+++ b/grub-core/fs/sfs.c<br>
&gt; &gt; -@@ -266,7 +266,7 @@ grub_sfs_read_block (grub_fshelp_node_t nod=
e,<br>
&gt; &gt; grub_disk_addr_t fileblock)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0node-&gt;next_extent =3D node-&gt;bl=
ock;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0node-&gt;cache_size =3D 0;<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 node-&gt;cache =3D grub_malloc (sizeof (n=
ode-&gt;cache[0]) *<br>
&gt; &gt; cache_size);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 node-&gt;cache =3D grub_calloc (cache_siz=
e, sizeof (node-<br>
&gt; &gt; &gt; cache[0]));<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!node-&gt;cache)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_errno =3D 0;<br>
&gt; &gt; -diff --git a/grub-core/fs/tar.c b/grub-core/fs/tar.c<br>
&gt; &gt; -index 7d63e0c..c551ed6 100644<br>
&gt; &gt; ---- a/grub-core/fs/tar.c<br>
&gt; &gt; -+++ b/grub-core/fs/tar.c<br>
&gt; &gt; -@@ -120,7 +120,7 @@ grub_cpio_find_file (struct grub_archelp_da=
ta<br>
&gt; &gt; *data, char **name,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (data-&gt;linkname_alloc &=
lt; linksize + 1)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *n;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 n =3D grub_malloc (2=
 * (linksize + 1));<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 n =3D grub_calloc (2=
, linksize + 1);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!n)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return g=
rub_errno;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (data=
-&gt;linkname);<br>
&gt; &gt; -diff --git a/grub-core/fs/udf.c b/grub-core/fs/udf.c<br>
&gt; &gt; -index dc8b6e2..a837616 100644<br>
&gt; &gt; ---- a/grub-core/fs/udf.c<br>
&gt; &gt; -+++ b/grub-core/fs/udf.c<br>
&gt; &gt; -@@ -873,7 +873,7 @@ read_string (const grub_uint8_t *raw,<br>
&gt; &gt; grub_size_t sz, char *outbuf)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned i;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0utf16len =3D sz - 1;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 utf16 =3D grub_malloc (utf16len * sizeof =
(utf16[0]));<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 utf16 =3D grub_calloc (utf16len, sizeof (=
utf16[0]));<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!utf16)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; utf16len; i++)<=
br>
&gt; &gt; -@@ -883,7 +883,7 @@ read_string (const grub_uint8_t *raw,<br>
&gt; &gt; grub_size_t sz, char *outbuf)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned i;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0utf16len =3D (sz - 1) / 2;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 utf16 =3D grub_malloc (utf16len * sizeof =
(utf16[0]));<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 utf16 =3D grub_calloc (utf16len, sizeof (=
utf16[0]));<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!utf16)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; utf16len; i++)<=
br>
&gt; &gt; -diff --git a/grub-core/fs/zfs/zfs.c b/grub-core/fs/zfs/zfs.c<br=
>
&gt; &gt; -index 2f72e42..381dde5 100644<br>
&gt; &gt; ---- a/grub-core/fs/zfs/zfs.c<br>
&gt; &gt; -+++ b/grub-core/fs/zfs/zfs.c<br>
&gt; &gt; -@@ -3325,7 +3325,7 @@ dnode_get_fullpath (const char *fullpath,=
<br>
&gt; &gt; struct subvolume *subvol,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0subvol-&gt;nkeys =3D 0;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0zap_iterate (&amp;keychain_dn, 8, co=
unt_zap_keys, &amp;ctx, data);<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 subvol-&gt;keyring =3D grub_zalloc (subvo=
l-&gt;nkeys * sizeof<br>
&gt; &gt; (subvol-&gt;keyring[0]));<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 subvol-&gt;keyring =3D grub_calloc (subvo=
l-&gt;nkeys, sizeof (subvol-<br>
&gt; &gt; &gt; keyring[0]));<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!subvol-&gt;keyring)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (fsname);<br>
&gt; &gt; -@@ -4336,7 +4336,7 @@ grub_zfs_embed (grub_device_t device<br>
&gt; &gt; __attribute__ ((unused)),<br>
&gt; &gt; -=C2=A0 =C2=A0*nsectors =3D (VDEV_BOOT_SIZE &gt;&gt; GRUB_DISK_S=
ECTOR_BITS);<br>
&gt; &gt; -=C2=A0 =C2=A0if (*nsectors &gt; max_nsectors)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0*nsectors =3D max_nsectors;<br>
&gt; &gt; --=C2=A0 *sectors =3D grub_malloc (*nsectors * sizeof (**sectors=
));<br>
&gt; &gt; -+=C2=A0 *sectors =3D grub_calloc (*nsectors, sizeof (**sectors)=
);<br>
&gt; &gt; -=C2=A0 =C2=A0if (!*sectors)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return grub_errno;<br>
&gt; &gt; -=C2=A0 =C2=A0for (i =3D 0; i &lt; *nsectors; i++)<br>
&gt; &gt; -diff --git a/grub-core/gfxmenu/gui_string_util.c b/grub-<br>
&gt; &gt; core/gfxmenu/gui_string_util.c<br>
&gt; &gt; -index a9a415e..ba1e1ea 100644<br>
&gt; &gt; ---- a/grub-core/gfxmenu/gui_string_util.c<br>
&gt; &gt; -+++ b/grub-core/gfxmenu/gui_string_util.c<br>
&gt; &gt; -@@ -55,7 +55,7 @@ canonicalize_path (const char *path)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if (*p =3D=3D &#39;/&#39;)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0components++;<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 char **path_array =3D grub_malloc (components * sizeof<=
br>
&gt; &gt; (*path_array));<br>
&gt; &gt; -+=C2=A0 char **path_array =3D grub_calloc (components, sizeof<b=
r>
&gt; &gt; (*path_array));<br>
&gt; &gt; -=C2=A0 =C2=A0if (! path_array)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt; - <br>
&gt; &gt; -diff --git a/grub-core/gfxmenu/widget-box.c b/grub-<br>
&gt; &gt; core/gfxmenu/widget-box.c<br>
&gt; &gt; -index b606028..470597d 100644<br>
&gt; &gt; ---- a/grub-core/gfxmenu/widget-box.c<br>
&gt; &gt; -+++ b/grub-core/gfxmenu/widget-box.c<br>
&gt; &gt; -@@ -303,10 +303,10 @@ grub_gfxmenu_create_box (const char<br>
&gt; &gt; *pixmaps_prefix,<br>
&gt; &gt; -=C2=A0 =C2=A0box-&gt;content_height =3D 0;<br>
&gt; &gt; -=C2=A0 =C2=A0box-&gt;raw_pixmaps =3D<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0(struct grub_video_bitmap **)<br>
&gt; &gt; --=C2=A0 =C2=A0 grub_malloc (BOX_NUM_PIXMAPS * sizeof (struct gr=
ub_video_bitmap<br>
&gt; &gt; *));<br>
&gt; &gt; -+=C2=A0 =C2=A0 grub_calloc (BOX_NUM_PIXMAPS, sizeof (struct gru=
b_video_bitmap<br>
&gt; &gt; *));<br>
&gt; &gt; -=C2=A0 =C2=A0box-&gt;scaled_pixmaps =3D<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0(struct grub_video_bitmap **)<br>
&gt; &gt; --=C2=A0 =C2=A0 grub_malloc (BOX_NUM_PIXMAPS * sizeof (struct gr=
ub_video_bitmap<br>
&gt; &gt; *));<br>
&gt; &gt; -+=C2=A0 =C2=A0 grub_calloc (BOX_NUM_PIXMAPS, sizeof (struct gru=
b_video_bitmap<br>
&gt; &gt; *));<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0/* Initialize all pixmap pointers to NULL so that =
proper<br>
&gt; &gt; destruction can<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 be performed if an error is encountered pa=
rtway through<br>
&gt; &gt; construction.=C2=A0 */<br>
&gt; &gt; -diff --git a/grub-core/io/gzio.c b/grub-core/io/gzio.c<br>
&gt; &gt; -index 6208a97..43d98a7 100644<br>
&gt; &gt; ---- a/grub-core/io/gzio.c<br>
&gt; &gt; -+++ b/grub-core/io/gzio.c<br>
&gt; &gt; -@@ -554,7 +554,7 @@ huft_build (unsigned *b,=C2=A0 =C2=A0/* cod=
e lengths in<br>
&gt; &gt; bits (all assumed &lt;=3D BMAX) */<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0z =3D 1 &lt;&lt=
; j;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* table entries for j-bit table */<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* allocate and=
 link in new table */<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 q =3D (struct huft *=
) grub_zalloc ((z + 1) * sizeof<br>
&gt; &gt; (struct huft));<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 q =3D (struct huft *=
) grub_calloc (z + 1, sizeof (struct<br>
&gt; &gt; huft));<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (! q)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i=
f (h)<br>
&gt; &gt; -diff --git a/grub-core/kern/efi/efi.c b/grub-core/kern/efi/efi.=
c<br>
&gt; &gt; -index 6e1ceb9..dc31caa 100644<br>
&gt; &gt; ---- a/grub-core/kern/efi/efi.c<br>
&gt; &gt; -+++ b/grub-core/kern/efi/efi.c<br>
&gt; &gt; -@@ -202,7 +202,7 @@ grub_efi_set_variable(const char *var, cons=
t<br>
&gt; &gt; grub_efi_guid_t *guid,<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0len =3D grub_strlen (var);<br>
&gt; &gt; -=C2=A0 =C2=A0len16 =3D len * GRUB_MAX_UTF16_PER_UTF8;<br>
&gt; &gt; --=C2=A0 var16 =3D grub_malloc ((len16 + 1) * sizeof (var16[0]))=
;<br>
&gt; &gt; -+=C2=A0 var16 =3D grub_calloc (len16 + 1, sizeof (var16[0]));<b=
r>
&gt; &gt; -=C2=A0 =C2=A0if (!var16)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return grub_errno;<br>
&gt; &gt; -=C2=A0 =C2=A0len16 =3D grub_utf8_to_utf16 (var16, len16, (grub_=
uint8_t *) var,<br>
&gt; &gt; len, NULL);<br>
&gt; &gt; -@@ -237,7 +237,7 @@ grub_efi_get_variable (const char *var, con=
st<br>
&gt; &gt; grub_efi_guid_t *guid,<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0len =3D grub_strlen (var);<br>
&gt; &gt; -=C2=A0 =C2=A0len16 =3D len * GRUB_MAX_UTF16_PER_UTF8;<br>
&gt; &gt; --=C2=A0 var16 =3D grub_malloc ((len16 + 1) * sizeof (var16[0]))=
;<br>
&gt; &gt; -+=C2=A0 var16 =3D grub_calloc (len16 + 1, sizeof (var16[0]));<b=
r>
&gt; &gt; -=C2=A0 =C2=A0if (!var16)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt; &gt; -=C2=A0 =C2=A0len16 =3D grub_utf8_to_utf16 (var16, len16, (grub_=
uint8_t *) var,<br>
&gt; &gt; len, NULL);<br>
&gt; &gt; -@@ -383,7 +383,7 @@ grub_efi_get_filename (grub_efi_device_path=
_t<br>
&gt; &gt; *dp0)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while (len &gt; 0 &amp;&amp; =
fp-&gt;path_name[len - 1] =3D=3D 0)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len--;<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 dup_name =3D grub_malloc (len * si=
zeof (*dup_name));<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dup_name =3D grub_calloc (len, siz=
eof (*dup_name));<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!dup_name)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (name=
);<br>
&gt; &gt; -diff --git a/grub-core/kern/emu/hostdisk.c b/grub-<br>
&gt; &gt; core/kern/emu/hostdisk.c<br>
&gt; &gt; -index e9ec680..d975265 100644<br>
&gt; &gt; ---- a/grub-core/kern/emu/hostdisk.c<br>
&gt; &gt; -+++ b/grub-core/kern/emu/hostdisk.c<br>
&gt; &gt; -@@ -615,7 +615,7 @@ static char *<br>
&gt; &gt; - grub_util_path_concat_real (size_t n, int ext, va_list ap)<br>
&gt; &gt; - {<br>
&gt; &gt; -=C2=A0 =C2=A0size_t totlen =3D 0;<br>
&gt; &gt; --=C2=A0 char **l =3D xmalloc ((n + ext) * sizeof (l[0]));<br>
&gt; &gt; -+=C2=A0 char **l =3D xcalloc (n + ext, sizeof (l[0]));<br>
&gt; &gt; -=C2=A0 =C2=A0char *r, *p, *pi;<br>
&gt; &gt; -=C2=A0 =C2=A0size_t i;<br>
&gt; &gt; -=C2=A0 =C2=A0int first =3D 1;<br>
&gt; &gt; -diff --git a/grub-core/kern/fs.c b/grub-core/kern/fs.c<br>
&gt; &gt; -index 2b85f49..f90be65 100644<br>
&gt; &gt; ---- a/grub-core/kern/fs.c<br>
&gt; &gt; -+++ b/grub-core/kern/fs.c<br>
&gt; &gt; -@@ -151,7 +151,7 @@ grub_fs_blocklist_open (grub_file_t file, c=
onst<br>
&gt; &gt; char *name)<br>
&gt; &gt; -=C2=A0 =C2=A0while (p);<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0/* Allocate a block list.=C2=A0 */<br>
&gt; &gt; --=C2=A0 blocks =3D grub_zalloc (sizeof (struct grub_fs_block) *=
 (num + 1));<br>
&gt; &gt; -+=C2=A0 blocks =3D grub_calloc (num + 1, sizeof (struct grub_fs=
_block));<br>
&gt; &gt; -=C2=A0 =C2=A0if (! blocks)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt; - <br>
&gt; &gt; -diff --git a/grub-core/kern/misc.c b/grub-core/kern/misc.c<br>
&gt; &gt; -index 3b633d5..a7abd36 100644<br>
&gt; &gt; ---- a/grub-core/kern/misc.c<br>
&gt; &gt; -+++ b/grub-core/kern/misc.c<br>
&gt; &gt; -@@ -690,7 +690,7 @@ parse_printf_args (const char *fmt0, struct=
<br>
&gt; &gt; printf_args *args,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0args-&gt;ptr =3D args-&gt;prealloc;<br>
&gt; &gt; -=C2=A0 =C2=A0else<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 args-&gt;ptr =3D grub_malloc (args-&gt;co=
unt * sizeof (args-<br>
&gt; &gt; &gt; ptr[0]));<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 args-&gt;ptr =3D grub_calloc (args-&gt;co=
unt, sizeof (args-&gt;ptr[0]));<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!args-&gt;ptr)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_errno =3D GRUB_ERR_NONE;=
<br>
&gt; &gt; -diff --git a/grub-core/kern/parser.c b/grub-core/kern/parser.c<=
br>
&gt; &gt; -index 78175aa..619db31 100644<br>
&gt; &gt; ---- a/grub-core/kern/parser.c<br>
&gt; &gt; -+++ b/grub-core/kern/parser.c<br>
&gt; &gt; -@@ -213,7 +213,7 @@ grub_parser_split_cmdline (const char *cmdl=
ine,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return grub_errno;<br>
&gt; &gt; -=C2=A0 =C2=A0grub_memcpy (args, buffer, bp - buffer);<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 *argv =3D grub_malloc (sizeof (char *) * (*argc + 1));<=
br>
&gt; &gt; -+=C2=A0 *argv =3D grub_calloc (*argc + 1, sizeof (char *));<br>
&gt; &gt; -=C2=A0 =C2=A0if (!*argv)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (args);<br>
&gt; &gt; -diff --git a/grub-core/kern/uboot/uboot.c b/grub-<br>
&gt; &gt; core/kern/uboot/uboot.c<br>
&gt; &gt; -index be4816f..aac8f9a 100644<br>
&gt; &gt; ---- a/grub-core/kern/uboot/uboot.c<br>
&gt; &gt; -+++ b/grub-core/kern/uboot/uboot.c<br>
&gt; &gt; -@@ -133,7 +133,7 @@ grub_uboot_dev_enum (void)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return num_devices;<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0max_devices =3D 2;<br>
&gt; &gt; --=C2=A0 enum_devices =3D grub_malloc (sizeof(struct device_info=
) *<br>
&gt; &gt; max_devices);<br>
&gt; &gt; -+=C2=A0 enum_devices =3D grub_calloc (max_devices, sizeof(struc=
t<br>
&gt; &gt; device_info));<br>
&gt; &gt; -=C2=A0 =C2=A0if (!enum_devices)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt; - <br>
&gt; &gt; -diff --git a/grub-core/lib/libgcrypt/cipher/ac.c b/grub-<br>
&gt; &gt; core/lib/libgcrypt/cipher/ac.c<br>
&gt; &gt; -index f5e946a..63f6fcd 100644<br>
&gt; &gt; ---- a/grub-core/lib/libgcrypt/cipher/ac.c<br>
&gt; &gt; -+++ b/grub-core/lib/libgcrypt/cipher/ac.c<br>
&gt; &gt; -@@ -185,7 +185,7 @@ ac_data_mpi_copy (gcry_ac_mpi_t *data_mpis,=
<br>
&gt; &gt; unsigned int data_mpis_n,<br>
&gt; &gt; -=C2=A0 =C2=A0gcry_mpi_t mpi;<br>
&gt; &gt; -=C2=A0 =C2=A0char *label;<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 data_mpis_new =3D gcry_malloc (sizeof (*data_mpis_new) =
*<br>
&gt; &gt; data_mpis_n);<br>
&gt; &gt; -+=C2=A0 data_mpis_new =3D gcry_calloc (data_mpis_n, sizeof<br>
&gt; &gt; (*data_mpis_new));<br>
&gt; &gt; -=C2=A0 =C2=A0if (! data_mpis_new)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D gcry_error_from_errno (errno=
);<br>
&gt; &gt; -@@ -572,7 +572,7 @@ _gcry_ac_data_to_sexp (gcry_ac_data_t data,=
<br>
&gt; &gt; gcry_sexp_t *sexp,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0/* Add MPI list.=C2=A0 */<br>
&gt; &gt; --=C2=A0 arg_list =3D gcry_malloc (sizeof (*arg_list) * (data_n =
+ 1));<br>
&gt; &gt; -+=C2=A0 arg_list =3D gcry_calloc (data_n + 1, sizeof (*arg_list=
));<br>
&gt; &gt; -=C2=A0 =C2=A0if (! arg_list)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D gcry_error_from_errno (errno=
);<br>
&gt; &gt; -@@ -1283,7 +1283,7 @@ ac_data_construct (const char *identifier=
, int<br>
&gt; &gt; include_flags,<br>
&gt; &gt; -=C2=A0 =C2=A0/* We build a list of arguments to pass to<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 gcry_sexp_build_array().=C2=A0 */<br>
&gt; &gt; -=C2=A0 =C2=A0data_length =3D _gcry_ac_data_length (data);<br>
&gt; &gt; --=C2=A0 arg_list =3D gcry_malloc (sizeof (*arg_list) * (data_le=
ngth * 2));<br>
&gt; &gt; -+=C2=A0 arg_list =3D gcry_calloc (data_length, sizeof (*arg_lis=
t) * 2);<br>
&gt; &gt; -=C2=A0 =C2=A0if (! arg_list)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D gcry_error_from_errno (errno=
);<br>
&gt; &gt; -@@ -1593,7 +1593,7 @@ _gcry_ac_key_pair_generate (gcry_ac_handl=
e_t<br>
&gt; &gt; handle, unsigned int nbits,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0arg_list_n +=3D 2;<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0/* Allocate list.=C2=A0 */<br>
&gt; &gt; --=C2=A0 arg_list =3D gcry_malloc (sizeof (*arg_list) * arg_list=
_n);<br>
&gt; &gt; -+=C2=A0 arg_list =3D gcry_calloc (arg_list_n, sizeof (*arg_list=
));<br>
&gt; &gt; -=C2=A0 =C2=A0if (! arg_list)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D gcry_error_from_errno (errno=
);<br>
&gt; &gt; -diff --git a/grub-core/lib/libgcrypt/cipher/primegen.c b/grub-<=
br>
&gt; &gt; core/lib/libgcrypt/cipher/primegen.c<br>
&gt; &gt; -index 2788e34..b12e79b 100644<br>
&gt; &gt; ---- a/grub-core/lib/libgcrypt/cipher/primegen.c<br>
&gt; &gt; -+++ b/grub-core/lib/libgcrypt/cipher/primegen.c<br>
&gt; &gt; -@@ -383,7 +383,7 @@ prime_generate_internal (int need_q_factor,=
<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0/* Allocate an array to track pool usage. */<br>
&gt; &gt; --=C2=A0 pool_in_use =3D gcry_malloc (n * sizeof *pool_in_use);<=
br>
&gt; &gt; -+=C2=A0 pool_in_use =3D gcry_calloc (n, sizeof *pool_in_use);<b=
r>
&gt; &gt; -=C2=A0 =C2=A0if (!pool_in_use)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D gpg_err_code_from_errno (err=
no);<br>
&gt; &gt; -@@ -765,7 +765,7 @@ gen_prime (unsigned int nbits, int secret, =
int<br>
&gt; &gt; randomlevel,<br>
&gt; &gt; -=C2=A0 =C2=A0if (nbits &lt; 16)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0log_fatal (&quot;can&#39;t generate a prime=
 with less than %d bits\n&quot;,<br>
&gt; &gt; 16);<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 mods =3D gcry_xmalloc( no_of_small_prime_numbers * size=
of *mods );<br>
&gt; &gt; -+=C2=A0 mods =3D gcry_xcalloc( no_of_small_prime_numbers, sizeo=
f *mods);<br>
&gt; &gt; -=C2=A0 =C2=A0/* Make nbits fit into gcry_mpi_t implementation. =
*/<br>
&gt; &gt; -=C2=A0 =C2=A0val_2=C2=A0 =3D mpi_alloc_set_ui( 2 );<br>
&gt; &gt; -=C2=A0 =C2=A0val_3 =3D mpi_alloc_set_ui( 3);<br>
&gt; &gt; -diff --git a/grub-core/lib/libgcrypt/cipher/pubkey.c b/grub-<br=
>
&gt; &gt; core/lib/libgcrypt/cipher/pubkey.c<br>
&gt; &gt; -index 9109821..ca087ad 100644<br>
&gt; &gt; ---- a/grub-core/lib/libgcrypt/cipher/pubkey.c<br>
&gt; &gt; -+++ b/grub-core/lib/libgcrypt/cipher/pubkey.c<br>
&gt; &gt; -@@ -2941,7 +2941,7 @@ gcry_pk_encrypt (gcry_sexp_t *r_ciph,<br>
&gt; &gt; gcry_sexp_t s_data, gcry_sexp_t s_pkey)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 * array to a format string, so we h=
ave to do it this way :-<br>
&gt; &gt; (.=C2=A0 */<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0/* FIXME: There is now such a format=
 specifier, so we can<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 change the code to be more c=
lear. */<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 arg_list =3D malloc (nelem * sizeof *arg_=
list);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 arg_list =3D calloc (nelem, sizeof *arg_l=
ist);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!arg_list)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D gpg_err_code_fr=
om_syserror ();<br>
&gt; &gt; -@@ -3233,7 +3233,7 @@ gcry_pk_sign (gcry_sexp_t *r_sig, gcry_se=
xp_t<br>
&gt; &gt; s_hash, gcry_sexp_t s_skey)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0strcpy (p, &quot;))&quot;);<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 arg_list =3D malloc (nelem * sizeof *arg_=
list);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 arg_list =3D calloc (nelem, sizeof *arg_l=
ist);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!arg_list)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D gpg_err_code_fr=
om_syserror ();<br>
&gt; &gt; -diff --git a/grub-core/lib/priority_queue.c b/grub-<br>
&gt; &gt; core/lib/priority_queue.c<br>
&gt; &gt; -index 659be0b..7d5e7c0 100644<br>
&gt; &gt; ---- a/grub-core/lib/priority_queue.c<br>
&gt; &gt; -+++ b/grub-core/lib/priority_queue.c<br>
&gt; &gt; -@@ -92,7 +92,7 @@ grub_priority_queue_new (grub_size_t elsize,<=
br>
&gt; &gt; - {<br>
&gt; &gt; -=C2=A0 =C2=A0struct grub_priority_queue *ret;<br>
&gt; &gt; -=C2=A0 =C2=A0void *els;<br>
&gt; &gt; --=C2=A0 els =3D grub_malloc (elsize * 8);<br>
&gt; &gt; -+=C2=A0 els =3D grub_calloc (8, elsize);<br>
&gt; &gt; -=C2=A0 =C2=A0if (!els)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt; -=C2=A0 =C2=A0ret =3D (struct grub_priority_queue *) grub_malloc=
 (sizeof (*ret));<br>
&gt; &gt; -diff --git a/grub-core/lib/reed_solomon.c b/grub-<br>
&gt; &gt; core/lib/reed_solomon.c<br>
&gt; &gt; -index ee9fa7b..467305b 100644<br>
&gt; &gt; ---- a/grub-core/lib/reed_solomon.c<br>
&gt; &gt; -+++ b/grub-core/lib/reed_solomon.c<br>
&gt; &gt; -@@ -20,6 +20,7 @@<br>
&gt; &gt; - #include &lt;stdio.h&gt;<br>
&gt; &gt; - #include &lt;string.h&gt;<br>
&gt; &gt; - #include &lt;stdlib.h&gt;<br>
&gt; &gt; -+#define xcalloc calloc<br>
&gt; &gt; - #define xmalloc malloc<br>
&gt; &gt; - #define grub_memset memset<br>
&gt; &gt; - #define grub_memcpy memcpy<br>
&gt; &gt; -@@ -158,11 +159,9 @@ rs_encode (gf_single_t *data, grub_size_t =
s,<br>
&gt; &gt; grub_size_t rs)<br>
&gt; &gt; -=C2=A0 =C2=A0gf_single_t *rs_polynomial;<br>
&gt; &gt; -=C2=A0 =C2=A0int i, j;<br>
&gt; &gt; -=C2=A0 =C2=A0gf_single_t *m;<br>
&gt; &gt; --=C2=A0 m =3D xmalloc ((s + rs) * sizeof (gf_single_t));<br>
&gt; &gt; -+=C2=A0 m =3D xcalloc (s + rs, sizeof (gf_single_t));<br>
&gt; &gt; -=C2=A0 =C2=A0grub_memcpy (m, data, s * sizeof (gf_single_t));<b=
r>
&gt; &gt; --=C2=A0 grub_memset (m + s, 0, rs * sizeof (gf_single_t));<br>
&gt; &gt; --=C2=A0 rs_polynomial =3D xmalloc ((rs + 1) * sizeof (gf_single=
_t));<br>
&gt; &gt; --=C2=A0 grub_memset (rs_polynomial, 0, (rs + 1) * sizeof (gf_si=
ngle_t));<br>
&gt; &gt; -+=C2=A0 rs_polynomial =3D xcalloc (rs + 1, sizeof (gf_single_t)=
);<br>
&gt; &gt; -=C2=A0 =C2=A0rs_polynomial[rs] =3D 1;<br>
&gt; &gt; -=C2=A0 =C2=A0/* Multiply with X - a^r */<br>
&gt; &gt; -=C2=A0 =C2=A0for (j =3D 0; j &lt; rs; j++)<br>
&gt; &gt; -diff --git a/grub-core/lib/relocator.c b/grub-core/lib/relocato=
r.c<br>
&gt; &gt; -index ea3ebc7..5847aac 100644<br>
&gt; &gt; ---- a/grub-core/lib/relocator.c<br>
&gt; &gt; -+++ b/grub-core/lib/relocator.c<br>
&gt; &gt; -@@ -495,9 +495,9 @@ malloc_in_range (struct grub_relocator *rel=
,<br>
&gt; &gt; -=C2=A0 =C2=A0}<br>
&gt; &gt; - #endif<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 eventt =3D grub_malloc (maxevents * sizeof (events[0]))=
;<br>
&gt; &gt; -+=C2=A0 eventt =3D grub_calloc (maxevents, sizeof (events[0]));=
<br>
&gt; &gt; -=C2=A0 =C2=A0counter =3D grub_malloc ((DIGITSORT_MASK + 2) * si=
zeof<br>
&gt; &gt; (counter[0]));<br>
&gt; &gt; --=C2=A0 events =3D grub_malloc (maxevents * sizeof (events[0]))=
;<br>
&gt; &gt; -+=C2=A0 events =3D grub_calloc (maxevents, sizeof (events[0]));=
<br>
&gt; &gt; -=C2=A0 =C2=A0if (!events || !eventt || !counter)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_dprintf (&quot;relocator&quot;,=
 &quot;events or counter allocation<br>
&gt; &gt; failed %d\n&quot;,<br>
&gt; &gt; -@@ -963,7 +963,7 @@ malloc_in_range (struct grub_relocator *rel=
,<br>
&gt; &gt; - #endif<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0unsigned cural =3D 0;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0int oom =3D 0;<br>
&gt; &gt; --=C2=A0 =C2=A0 res-&gt;subchunks =3D grub_malloc (sizeof (res-&=
gt;subchunks[0]) *<br>
&gt; &gt; nallocs);<br>
&gt; &gt; -+=C2=A0 =C2=A0 res-&gt;subchunks =3D grub_calloc (nallocs, size=
of (res-<br>
&gt; &gt; &gt; subchunks[0]));<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if (!res-&gt;subchunks)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0oom =3D 1;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0res-&gt;nsubchunks =3D nallocs;<br>
&gt; &gt; -@@ -1562,8 +1562,8 @@ grub_relocator_prepare_relocs (struct<br>
&gt; &gt; grub_relocator *rel, grub_addr_t addr,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0count[(chunk-&gt;src &=
amp; 0xff) + 1]++;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; --=C2=A0 =C2=A0 from =3D grub_malloc (nchunks * sizeof (sorted[0=
]));<br>
&gt; &gt; --=C2=A0 =C2=A0 to =3D grub_malloc (nchunks * sizeof (sorted[0])=
);<br>
&gt; &gt; -+=C2=A0 =C2=A0 from =3D grub_calloc (nchunks, sizeof (sorted[0]=
));<br>
&gt; &gt; -+=C2=A0 =C2=A0 to =3D grub_calloc (nchunks, sizeof (sorted[0]))=
;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if (!from || !to)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (from);<br>
&gt; &gt; -diff --git a/grub-core/lib/zstd/fse_decompress.c b/grub-<br>
&gt; &gt; core/lib/zstd/fse_decompress.c<br>
&gt; &gt; -index 72bbead..2227b84 100644<br>
&gt; &gt; ---- a/grub-core/lib/zstd/fse_decompress.c<br>
&gt; &gt; -+++ b/grub-core/lib/zstd/fse_decompress.c<br>
&gt; &gt; -@@ -82,7 +82,7 @@<br>
&gt; &gt; - FSE_DTable* FSE_createDTable (unsigned tableLog)<br>
&gt; &gt; - {<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if (tableLog &gt; FSE_TABLELOG_ABSOLUTE_MAX=
) tableLog =3D<br>
&gt; &gt; FSE_TABLELOG_ABSOLUTE_MAX;<br>
&gt; &gt; --=C2=A0 =C2=A0 return (FSE_DTable*)malloc( FSE_DTABLE_SIZE_U32(=
tableLog) *<br>
&gt; &gt; sizeof (U32) );<br>
&gt; &gt; -+=C2=A0 =C2=A0 return (FSE_DTable*)calloc( FSE_DTABLE_SIZE_U32(=
tableLog),<br>
&gt; &gt; sizeof (U32) );<br>
&gt; &gt; - }<br>
&gt; &gt; - <br>
&gt; &gt; - void FSE_freeDTable (FSE_DTable* dt)<br>
&gt; &gt; -diff --git a/grub-core/loader/arm/linux.c b/grub-<br>
&gt; &gt; core/loader/arm/linux.c<br>
&gt; &gt; -index 5168491..d70c174 100644<br>
&gt; &gt; ---- a/grub-core/loader/arm/linux.c<br>
&gt; &gt; -+++ b/grub-core/loader/arm/linux.c<br>
&gt; &gt; -@@ -78,7 +78,7 @@ linux_prepare_atag (void *target_atag)<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0/* some place for cmdline, initrd and terminator.=
=C2=A0 */<br>
&gt; &gt; -=C2=A0 =C2=A0tmp_size =3D get_atag_size (atag_orig) + 20 + (arg=
_size) / 4;<br>
&gt; &gt; --=C2=A0 tmp_atag =3D grub_malloc (tmp_size * sizeof (grub_uint3=
2_t));<br>
&gt; &gt; -+=C2=A0 tmp_atag =3D grub_calloc (tmp_size, sizeof (grub_uint32=
_t));<br>
&gt; &gt; -=C2=A0 =C2=A0if (!tmp_atag)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return grub_errno;<br>
&gt; &gt; - <br>
&gt; &gt; -diff --git a/grub-core/loader/efi/chainloader.c b/grub-<br>
&gt; &gt; core/loader/efi/chainloader.c<br>
&gt; &gt; -index cd92ea3..daf8c6b 100644<br>
&gt; &gt; ---- a/grub-core/loader/efi/chainloader.c<br>
&gt; &gt; -+++ b/grub-core/loader/efi/chainloader.c<br>
&gt; &gt; -@@ -116,7 +116,7 @@ copy_file_path (grub_efi_file_path_device_p=
ath_t<br>
&gt; &gt; *fp,<br>
&gt; &gt; -=C2=A0 =C2=A0fp-&gt;header.type =3D GRUB_EFI_MEDIA_DEVICE_PATH_=
TYPE;<br>
&gt; &gt; -=C2=A0 =C2=A0fp-&gt;header.subtype =3D GRUB_EFI_FILE_PATH_DEVIC=
E_PATH_SUBTYPE;<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 path_name =3D grub_malloc (len * GRUB_MAX_UTF16_PER_UTF=
8 * sizeof<br>
&gt; &gt; (*path_name));<br>
&gt; &gt; -+=C2=A0 path_name =3D grub_calloc (len, GRUB_MAX_UTF16_PER_UTF8=
 * sizeof<br>
&gt; &gt; (*path_name));<br>
&gt; &gt; -=C2=A0 =C2=A0if (!path_name)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return;<br>
&gt; &gt; - <br>
&gt; &gt; -diff --git a/grub-core/loader/i386/bsdXX.c b/grub-<br>
&gt; &gt; core/loader/i386/bsdXX.c<br>
&gt; &gt; -index af6741d..a8d8bf7 100644<br>
&gt; &gt; ---- a/grub-core/loader/i386/bsdXX.c<br>
&gt; &gt; -+++ b/grub-core/loader/i386/bsdXX.c<br>
&gt; &gt; -@@ -48,7 +48,7 @@ read_headers (grub_file_t file, const char<br=
>
&gt; &gt; *filename, Elf_Ehdr *e, char **shdr)<br>
&gt; &gt; -=C2=A0 =C2=A0if (e-&gt;e_ident[EI_CLASS] !=3D SUFFIX (ELFCLASS)=
)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return grub_error (GRUB_ERR_BAD_OS, N_(&quo=
t;invalid arch-dependent<br>
&gt; &gt; ELF magic&quot;));<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 *shdr =3D grub_malloc ((grub_uint32_t) e-&gt;e_shnum * =
e-<br>
&gt; &gt; &gt; e_shentsize);<br>
&gt; &gt; -+=C2=A0 *shdr =3D grub_calloc (e-&gt;e_shnum, e-&gt;e_shentsize=
);<br>
&gt; &gt; -=C2=A0 =C2=A0if (! *shdr)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return grub_errno;<br>
&gt; &gt; - <br>
&gt; &gt; -diff --git a/grub-core/loader/i386/xnu.c b/grub-<br>
&gt; &gt; core/loader/i386/xnu.c<br>
&gt; &gt; -index e64ed08..b7d176b 100644<br>
&gt; &gt; ---- a/grub-core/loader/i386/xnu.c<br>
&gt; &gt; -+++ b/grub-core/loader/i386/xnu.c<br>
&gt; &gt; -@@ -295,7 +295,7 @@ grub_xnu_devprop_add_property_utf8 (struct<=
br>
&gt; &gt; grub_xnu_devprop_device_descriptor *d<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return grub_errno;<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0len =3D grub_strlen (name);<br>
&gt; &gt; --=C2=A0 utf16 =3D grub_malloc (sizeof (grub_uint16_t) * len);<b=
r>
&gt; &gt; -+=C2=A0 utf16 =3D grub_calloc (len, sizeof (grub_uint16_t));<br=
>
&gt; &gt; -=C2=A0 =C2=A0if (!utf16)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (utf8);<br>
&gt; &gt; -@@ -331,7 +331,7 @@ grub_xnu_devprop_add_property_utf16 (struct=
<br>
&gt; &gt; grub_xnu_devprop_device_descriptor *<br>
&gt; &gt; -=C2=A0 =C2=A0grub_uint16_t *utf16;<br>
&gt; &gt; -=C2=A0 =C2=A0grub_err_t err;<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 utf16 =3D grub_malloc (sizeof (grub_uint16_t) * namelen=
);<br>
&gt; &gt; -+=C2=A0 utf16 =3D grub_calloc (namelen, sizeof (grub_uint16_t))=
;<br>
&gt; &gt; -=C2=A0 =C2=A0if (!utf16)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return grub_errno;<br>
&gt; &gt; -=C2=A0 =C2=A0grub_memcpy (utf16, name, sizeof (grub_uint16_t) *=
 namelen);<br>
&gt; &gt; -diff --git a/grub-core/loader/macho.c b/grub-core/loader/macho.=
c<br>
&gt; &gt; -index 085f9c6..05710c4 100644<br>
&gt; &gt; ---- a/grub-core/loader/macho.c<br>
&gt; &gt; -+++ b/grub-core/loader/macho.c<br>
&gt; &gt; -@@ -97,7 +97,7 @@ grub_macho_file (grub_file_t file, const char=
<br>
&gt; &gt; *filename, int is_64bit)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (grub_file_seek (macho-&gt;file, =
sizeof (struct<br>
&gt; &gt; grub_macho_fat_header))<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=3D (grub_off_t) -1)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 archs =3D grub_malloc (sizeof (struct gru=
b_macho_fat_arch) *<br>
&gt; &gt; narchs);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 archs =3D grub_calloc (narchs, sizeof (st=
ruct<br>
&gt; &gt; grub_macho_fat_arch));<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!archs)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (grub_file_read (macho-&gt;file, =
archs,<br>
&gt; &gt; -diff --git a/grub-core/loader/multiboot_elfxx.c b/grub-<br>
&gt; &gt; core/loader/multiboot_elfxx.c<br>
&gt; &gt; -index 70cd1db..cc68536 100644<br>
&gt; &gt; ---- a/grub-core/loader/multiboot_elfxx.c<br>
&gt; &gt; -+++ b/grub-core/loader/multiboot_elfxx.c<br>
&gt; &gt; -@@ -217,7 +217,7 @@ CONCAT(grub_multiboot_load_elf, XX)<br>
&gt; &gt; (mbi_load_data_t *mld)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_uint8_t *shdr, *shdrptr;<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 shdr =3D grub_malloc ((grub_uint32_t) ehd=
r-&gt;e_shnum * ehdr-<br>
&gt; &gt; &gt; e_shentsize);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 shdr =3D grub_calloc (ehdr-&gt;e_shnum, e=
hdr-&gt;e_shentsize);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!shdr)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return grub_errno;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt; &gt; -diff --git a/grub-core/loader/xnu.c b/grub-core/loader/xnu.c<br=
>
&gt; &gt; -index 7f74d1d..77d7060 100644<br>
&gt; &gt; ---- a/grub-core/loader/xnu.c<br>
&gt; &gt; -+++ b/grub-core/loader/xnu.c<br>
&gt; &gt; -@@ -800,7 +800,7 @@ grub_cmd_xnu_mkext (grub_command_t cmd<br>
&gt; &gt; __attribute__ ((unused)),<br>
&gt; &gt; -=C2=A0 =C2=A0if (grub_be_to_cpu32 (head.magic) =3D=3D GRUB_MACH=
O_FAT_MAGIC)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0narchs =3D grub_be_to_cpu32 (head.nf=
at_arch);<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 archs =3D grub_malloc (sizeof (struct gru=
b_macho_fat_arch) *<br>
&gt; &gt; narchs);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 archs =3D grub_calloc (narchs, sizeof (st=
ruct<br>
&gt; &gt; grub_macho_fat_arch));<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (! archs)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_file_close (file);<br>
&gt; &gt; -diff --git a/grub-core/mmap/mmap.c b/grub-core/mmap/mmap.c<br>
&gt; &gt; -index 6a31cba..57b4e9a 100644<br>
&gt; &gt; ---- a/grub-core/mmap/mmap.c<br>
&gt; &gt; -+++ b/grub-core/mmap/mmap.c<br>
&gt; &gt; -@@ -143,9 +143,9 @@ grub_mmap_iterate (grub_memory_hook_t hook,=
 void<br>
&gt; &gt; *hook_data)<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0/* Initialize variables. */<br>
&gt; &gt; -=C2=A0 =C2=A0ctx.scanline_events =3D (struct grub_mmap_scan *)<=
br>
&gt; &gt; --=C2=A0 =C2=A0 grub_malloc (sizeof (struct grub_mmap_scan) * 2 =
* mmap_num);<br>
&gt; &gt; -+=C2=A0 =C2=A0 grub_calloc (mmap_num, sizeof (struct grub_mmap_=
scan) * 2);<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 present =3D grub_zalloc (sizeof (present[0]) * current_=
priority);<br>
&gt; &gt; -+=C2=A0 present =3D grub_calloc (current_priority, sizeof (pres=
ent[0]));<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0if (! ctx.scanline_events || !present)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -diff --git a/grub-core/net/bootp.c b/grub-core/net/bootp.c<br>
&gt; &gt; -index 04cfbb0..6539572 100644<br>
&gt; &gt; ---- a/grub-core/net/bootp.c<br>
&gt; &gt; -+++ b/grub-core/net/bootp.c<br>
&gt; &gt; -@@ -766,7 +766,7 @@ grub_cmd_bootp (struct grub_command *cmd<br=
>
&gt; &gt; __attribute__ ((unused)),<br>
&gt; &gt; -=C2=A0 =C2=A0if (ncards =3D=3D 0)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return grub_error (GRUB_ERR_NET_NO_CARD, N_=
(&quot;no network card<br>
&gt; &gt; found&quot;));<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 ifaces =3D grub_zalloc (ncards * sizeof (ifaces[0]));<b=
r>
&gt; &gt; -+=C2=A0 ifaces =3D grub_calloc (ncards, sizeof (ifaces[0]));<br=
>
&gt; &gt; -=C2=A0 =C2=A0if (!ifaces)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return grub_errno;<br>
&gt; &gt; - <br>
&gt; &gt; -diff --git a/grub-core/net/dns.c b/grub-core/net/dns.c<br>
&gt; &gt; -index 5d9afe0..e332d5e 100644<br>
&gt; &gt; ---- a/grub-core/net/dns.c<br>
&gt; &gt; -+++ b/grub-core/net/dns.c<br>
&gt; &gt; -@@ -285,8 +285,8 @@ recv_hook (grub_net_udp_socket_t sock<br>
&gt; &gt; __attribute__ ((unused)),<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ptr++;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ptr +=3D 4;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; --=C2=A0 *data-&gt;addresses =3D grub_malloc (sizeof ((*data-&gt=
;addresses)[0])<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* grub_be_to_cpu16 (head-&=
gt;ancount));<br>
&gt; &gt; -+=C2=A0 *data-&gt;addresses =3D grub_calloc (grub_be_to_cpu16 (=
head-&gt;ancount),<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof ((*data-&gt;addres=
ses)[0]));<br>
&gt; &gt; -=C2=A0 =C2=A0if (!*data-&gt;addresses)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_errno =3D GRUB_ERR_NONE;<br>
&gt; &gt; -@@ -406,8 +406,8 @@ recv_hook (grub_net_udp_socket_t sock<br>
&gt; &gt; __attribute__ ((unused)),<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0dns_cache[h].addresses =3D 0;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0dns_cache[h].name =3D grub_strdup (d=
ata-&gt;oname);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0dns_cache[h].naddresses =3D *data-&g=
t;naddresses;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 dns_cache[h].addresses =3D grub_malloc (*=
data-&gt;naddresses<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * sizeof<br>
&gt; &gt; (dns_cache[h].addresses[0]));<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 dns_cache[h].addresses =3D grub_calloc (*=
data-&gt;naddresses,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 sizeof<br>
&gt; &gt; (dns_cache[h].addresses[0]));<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0dns_cache[h].limit_time =3D grub_get=
_time_ms () + 1000 *<br>
&gt; &gt; ttl_all;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!dns_cache[h].addresses || !dns_=
cache[h].name)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -@@ -479,7 +479,7 @@ grub_net_dns_lookup (const char *name,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 sockets =3D grub_malloc (sizeof (sockets[0]) * n_server=
s);<br>
&gt; &gt; -+=C2=A0 sockets =3D grub_calloc (n_servers, sizeof (sockets[0])=
);<br>
&gt; &gt; -=C2=A0 =C2=A0if (!sockets)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return grub_errno;<br>
&gt; &gt; - <br>
&gt; &gt; -diff --git a/grub-core/net/net.c b/grub-core/net/net.c<br>
&gt; &gt; -index d5d726a..38f19df 100644<br>
&gt; &gt; ---- a/grub-core/net/net.c<br>
&gt; &gt; -+++ b/grub-core/net/net.c<br>
&gt; &gt; -@@ -333,8 +333,8 @@ grub_cmd_ipv6_autoconf (struct grub_command=
 *cmd<br>
&gt; &gt; __attribute__ ((unused)),<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0ncards++;<br>
&gt; &gt; -=C2=A0 =C2=A0}<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 ifaces =3D grub_zalloc (ncards * sizeof (ifaces[0]));<b=
r>
&gt; &gt; --=C2=A0 slaacs =3D grub_zalloc (ncards * sizeof (slaacs[0]));<b=
r>
&gt; &gt; -+=C2=A0 ifaces =3D grub_calloc (ncards, sizeof (ifaces[0]));<br=
>
&gt; &gt; -+=C2=A0 slaacs =3D grub_calloc (ncards, sizeof (slaacs[0]));<br=
>
&gt; &gt; -=C2=A0 =C2=A0if (!ifaces || !slaacs)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (ifaces);<br>
&gt; &gt; -diff --git a/grub-core/normal/charset.c b/grub-core/normal/char=
set.c<br>
&gt; &gt; -index b0ab47d..d57fb72 100644<br>
&gt; &gt; ---- a/grub-core/normal/charset.c<br>
&gt; &gt; -+++ b/grub-core/normal/charset.c<br>
&gt; &gt; -@@ -203,7 +203,7 @@ grub_utf8_to_ucs4_alloc (const char *msg,<b=
r>
&gt; &gt; grub_uint32_t **unicode_msg,<br>
&gt; &gt; - {<br>
&gt; &gt; -=C2=A0 =C2=A0grub_size_t msg_len =3D grub_strlen (msg);<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 *unicode_msg =3D grub_malloc (msg_len * sizeof (grub_ui=
nt32_t));<br>
&gt; &gt; -+=C2=A0 *unicode_msg =3D grub_calloc (msg_len, sizeof (grub_uin=
t32_t));<br>
&gt; &gt; -=C2=A0 <br>
&gt; &gt; -=C2=A0 =C2=A0if (!*unicode_msg)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return -1;<br>
&gt; &gt; -@@ -488,7 +488,7 @@ grub_unicode_aglomerate_comb (const<br>
&gt; &gt; grub_uint32_t *in, grub_size_t inlen,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 n =3D grub_malloc (s=
izeof (n[0]) * (out-&gt;ncomb + 1));<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 n =3D grub_calloc (o=
ut-&gt;ncomb + 1, sizeof (n[0]));<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!n)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g=
rub_errno =3D GRUB_ERR_NONE;<br>
&gt; &gt; -@@ -842,7 +842,7 @@ grub_bidi_line_logical_to_visual (const<br>
&gt; &gt; grub_uint32_t *logical,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0\<br>
&gt; &gt; -=C2=A0 =C2=A0}<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 visual =3D grub_malloc (sizeof (visual[0]) * logical_le=
n);<br>
&gt; &gt; -+=C2=A0 visual =3D grub_calloc (logical_len, sizeof (visual[0])=
);<br>
&gt; &gt; -=C2=A0 =C2=A0if (!visual)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return -1;<br>
&gt; &gt; - <br>
&gt; &gt; -@@ -1165,8 +1165,8 @@ grub_bidi_logical_to_visual (const<br>
&gt; &gt; grub_uint32_t *logical,<br>
&gt; &gt; - {<br>
&gt; &gt; -=C2=A0 =C2=A0const grub_uint32_t *line_start =3D logical, *ptr;=
<br>
&gt; &gt; -=C2=A0 =C2=A0struct grub_unicode_glyph *visual_ptr;<br>
&gt; &gt; --=C2=A0 *visual_out =3D visual_ptr =3D grub_malloc (3 * sizeof<=
br>
&gt; &gt; (visual_ptr[0])<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 * (logical_len + 2));<br>
&gt; &gt; -+=C2=A0 *visual_out =3D visual_ptr =3D grub_calloc (logical_len=
 + 2,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 3 * sizeof<br>
&gt; &gt; (visual_ptr[0]));<br>
&gt; &gt; -=C2=A0 =C2=A0if (!visual_ptr)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return -1;<br>
&gt; &gt; -=C2=A0 =C2=A0for (ptr =3D logical; ptr &lt;=3D logical + logica=
l_len; ptr++)<br>
&gt; &gt; -diff --git a/grub-core/normal/cmdline.c b/grub-core/normal/cmdl=
ine.c<br>
&gt; &gt; -index c037d50..c57242e 100644<br>
&gt; &gt; ---- a/grub-core/normal/cmdline.c<br>
&gt; &gt; -+++ b/grub-core/normal/cmdline.c<br>
&gt; &gt; -@@ -41,7 +41,7 @@ grub_err_t<br>
&gt; &gt; - grub_set_history (int newsize)<br>
&gt; &gt; - {<br>
&gt; &gt; -=C2=A0 =C2=A0grub_uint32_t **old_hist_lines =3D hist_lines;<br>
&gt; &gt; --=C2=A0 hist_lines =3D grub_malloc (sizeof (grub_uint32_t *) * =
newsize);<br>
&gt; &gt; -+=C2=A0 hist_lines =3D grub_calloc (newsize, sizeof (grub_uint3=
2_t *));<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0/* Copy the old lines into the new buffer.=C2=A0 *=
/<br>
&gt; &gt; -=C2=A0 =C2=A0if (old_hist_lines)<br>
&gt; &gt; -@@ -114,7 +114,7 @@ static void<br>
&gt; &gt; - grub_history_set (int pos, grub_uint32_t *s, grub_size_t len)<=
br>
&gt; &gt; - {<br>
&gt; &gt; -=C2=A0 =C2=A0grub_free (hist_lines[pos]);<br>
&gt; &gt; --=C2=A0 hist_lines[pos] =3D grub_malloc ((len + 1) * sizeof<br>
&gt; &gt; (grub_uint32_t));<br>
&gt; &gt; -+=C2=A0 hist_lines[pos] =3D grub_calloc (len + 1, sizeof (grub_=
uint32_t));<br>
&gt; &gt; -=C2=A0 =C2=A0if (!hist_lines[pos])<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_print_error ();<br>
&gt; &gt; -@@ -349,7 +349,7 @@ grub_cmdline_get (const char *prompt_transl=
ated)<br>
&gt; &gt; -=C2=A0 =C2=A0char *ret;<br>
&gt; &gt; -=C2=A0 =C2=A0unsigned nterms;<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 buf =3D grub_malloc (max_len * sizeof (grub_uint32_t));=
<br>
&gt; &gt; -+=C2=A0 buf =3D grub_calloc (max_len, sizeof (grub_uint32_t));<=
br>
&gt; &gt; -=C2=A0 =C2=A0if (!buf)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt; - <br>
&gt; &gt; -@@ -377,7 +377,7 @@ grub_cmdline_get (const char *prompt_transl=
ated)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0FOR_ACTIVE_TERM_OUTPUTS(cur)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0nterms++;<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 =C2=A0 cl_terms =3D grub_malloc (sizeof (cl_terms[0]) *=
 nterms);<br>
&gt; &gt; -+=C2=A0 =C2=A0 cl_terms =3D grub_calloc (nterms, sizeof (cl_ter=
ms[0]));<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if (!cl_terms)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (buf);<br>
&gt; &gt; -@@ -385,7 +385,7 @@ grub_cmdline_get (const char *prompt_transl=
ated)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0cl_term_cur =3D cl_terms;<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 =C2=A0 unicode_msg =3D grub_malloc (msg_len * sizeof (g=
rub_uint32_t));<br>
&gt; &gt; -+=C2=A0 =C2=A0 unicode_msg =3D grub_calloc (msg_len, sizeof (gr=
ub_uint32_t));<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if (!unicode_msg)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (buf);<br>
&gt; &gt; -@@ -495,7 +495,7 @@ grub_cmdline_get (const char *prompt_transl=
ated)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_uin=
t32_t *insert;<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0insertle=
n =3D grub_strlen (insertu8);<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 insert =3D gr=
ub_malloc ((insertlen + 1) * sizeof<br>
&gt; &gt; (grub_uint32_t));<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 insert =3D gr=
ub_calloc (insertlen + 1, sizeof<br>
&gt; &gt; (grub_uint32_t));<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ins=
ert)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{=
<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0grub_free (insertu8);<br>
&gt; &gt; -@@ -602,7 +602,7 @@ grub_cmdline_get (const char *prompt_transl=
ated)<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (kill=
_buf);<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kill_buf =3D grub_ma=
lloc ((n + 1) *<br>
&gt; &gt; sizeof(grub_uint32_t));<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kill_buf =3D grub_ca=
lloc (n + 1, sizeof (grub_uint32_t));<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (grub_errno)=
<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g=
rub_print_error ();<br>
&gt; &gt; -diff --git a/grub-core/normal/menu_entry.c b/grub-<br>
&gt; &gt; core/normal/menu_entry.c<br>
&gt; &gt; -index cdf3590..1993995 100644<br>
&gt; &gt; ---- a/grub-core/normal/menu_entry.c<br>
&gt; &gt; -+++ b/grub-core/normal/menu_entry.c<br>
&gt; &gt; -@@ -95,8 +95,8 @@ init_line (struct screen *screen, struct line=
<br>
&gt; &gt; *linep)<br>
&gt; &gt; - {<br>
&gt; &gt; -=C2=A0 =C2=A0linep-&gt;len =3D 0;<br>
&gt; &gt; -=C2=A0 =C2=A0linep-&gt;max_len =3D 80;<br>
&gt; &gt; --=C2=A0 linep-&gt;buf =3D grub_malloc ((linep-&gt;max_len + 1) =
* sizeof (linep-<br>
&gt; &gt; &gt; buf[0]));<br>
&gt; &gt; --=C2=A0 linep-&gt;pos =3D grub_zalloc (screen-&gt;nterms * size=
of (linep-<br>
&gt; &gt; &gt; pos[0]));<br>
&gt; &gt; -+=C2=A0 linep-&gt;buf =3D grub_calloc (linep-&gt;max_len + 1, s=
izeof (linep-<br>
&gt; &gt; &gt; buf[0]));<br>
&gt; &gt; -+=C2=A0 linep-&gt;pos =3D grub_calloc (screen-&gt;nterms, sizeo=
f (linep-<br>
&gt; &gt; &gt; pos[0]));<br>
&gt; &gt; -=C2=A0 =C2=A0if (! linep-&gt;buf || !linep-&gt;pos)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (linep-&gt;buf);<br>
&gt; &gt; -@@ -287,7 +287,7 @@ update_screen (struct screen *screen, struc=
t<br>
&gt; &gt; per_term_screen *term_screen,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pos =3D linep-&gt;pos + (term=
_screen - screen-&gt;terms);<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!*pos)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *pos =3D grub_zalloc ((line=
p-&gt;len + 1) * sizeof (**pos));<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *pos =3D grub_calloc (linep=
-&gt;len + 1, sizeof (**pos));<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (i =3D=3D region_start || =
linep =3D=3D screen-&gt;lines + screen-<br>
&gt; &gt; &gt; line<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| (i &gt; regi=
on_start &amp;&amp; mode =3D=3D ALL_LINES))<br>
&gt; &gt; -@@ -471,7 +471,7 @@ insert_string (struct screen *screen, const=
 char<br>
&gt; &gt; *s, int update)<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Insert the string.=C2=A0 *=
/<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0current_linep =3D screen-&gt;=
lines + screen-&gt;line;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 unicode_msg =3D grub_malloc ((p - =
s) * sizeof<br>
&gt; &gt; (grub_uint32_t));<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 unicode_msg =3D grub_calloc (p - s=
, sizeof (grub_uint32_t));<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!unicode_msg)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt; -@@ -1023,7 +1023,7 @@ complete (struct screen *screen, int<br>
&gt; &gt; continuous, int update)<br>
&gt; &gt; -=C2=A0 =C2=A0if (completion_buffer.buf)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0buflen =3D grub_strlen (completion_b=
uffer.buf);<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 ucs4 =3D grub_malloc (sizeof (grub_uint32=
_t) * (buflen + 1));<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 ucs4 =3D grub_calloc (buflen + 1, sizeof =
(grub_uint32_t));<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ucs4)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -@@ -1268,7 +1268,7 @@ grub_menu_entry_run (grub_menu_entry_t en=
try)<br>
&gt; &gt; -=C2=A0 =C2=A0for (i =3D 0; i &lt; (unsigned) screen-&gt;num_lin=
es; i++)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (screen-&gt;lines[i].pos);=
<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 screen-&gt;lines[i].pos =3D grub_zalloc (=
screen-&gt;nterms * sizeof<br>
&gt; &gt; (screen-&gt;lines[i].pos[0]));<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 screen-&gt;lines[i].pos =3D grub_calloc (=
screen-&gt;nterms, sizeof<br>
&gt; &gt; (screen-&gt;lines[i].pos[0]));<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (! screen-&gt;lines[i].pos)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_print_error ();<br>
&gt; &gt; -@@ -1278,7 +1278,7 @@ grub_menu_entry_run (grub_menu_entry_t en=
try)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 screen-&gt;terms =3D grub_zalloc (screen-&gt;nterms * s=
izeof (screen-<br>
&gt; &gt; &gt; terms[0]));<br>
&gt; &gt; -+=C2=A0 screen-&gt;terms =3D grub_calloc (screen-&gt;nterms, si=
zeof (screen-<br>
&gt; &gt; &gt; terms[0]));<br>
&gt; &gt; -=C2=A0 =C2=A0if (!screen-&gt;terms)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_print_error ();<br>
&gt; &gt; -diff --git a/grub-core/normal/menu_text.c b/grub-<br>
&gt; &gt; core/normal/menu_text.c<br>
&gt; &gt; -index e22bb91..18240e7 100644<br>
&gt; &gt; ---- a/grub-core/normal/menu_text.c<br>
&gt; &gt; -+++ b/grub-core/normal/menu_text.c<br>
&gt; &gt; -@@ -78,7 +78,7 @@ grub_print_message_indented_real (const char =
*msg,<br>
&gt; &gt; int margin_left,<br>
&gt; &gt; -=C2=A0 =C2=A0grub_size_t msg_len =3D grub_strlen (msg) + 2;<br>
&gt; &gt; -=C2=A0 =C2=A0int ret =3D 0;<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 unicode_msg =3D grub_malloc (msg_len * sizeof (grub_uin=
t32_t));<br>
&gt; &gt; -+=C2=A0 unicode_msg =3D grub_calloc (msg_len, sizeof (grub_uint=
32_t));<br>
&gt; &gt; -=C2=A0 <br>
&gt; &gt; -=C2=A0 =C2=A0if (!unicode_msg)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt; -@@ -211,7 +211,7 @@ print_entry (int y, int highlight,<br>
&gt; &gt; grub_menu_entry_t entry,<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0title =3D entry ? entry-&gt;title : &quot;&quot;;<=
br>
&gt; &gt; -=C2=A0 =C2=A0title_len =3D grub_strlen (title);<br>
&gt; &gt; --=C2=A0 unicode_title =3D grub_malloc (title_len * sizeof<br>
&gt; &gt; (*unicode_title));<br>
&gt; &gt; -+=C2=A0 unicode_title =3D grub_calloc (title_len, sizeof (*unic=
ode_title));<br>
&gt; &gt; -=C2=A0 =C2=A0if (! unicode_title)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0/* XXX How to show this error?=C2=A0 */<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return;<br>
&gt; &gt; -diff --git a/grub-core/normal/term.c b/grub-core/normal/term.c<=
br>
&gt; &gt; -index a1e5c5a..cc8c173 100644<br>
&gt; &gt; ---- a/grub-core/normal/term.c<br>
&gt; &gt; -+++ b/grub-core/normal/term.c<br>
&gt; &gt; -@@ -264,7 +264,7 @@ grub_term_save_pos (void)<br>
&gt; &gt; -=C2=A0 =C2=A0FOR_ACTIVE_TERM_OUTPUTS(cur)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0cnt++;<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 ret =3D grub_malloc (cnt * sizeof (ret[0]));<br>
&gt; &gt; -+=C2=A0 ret =3D grub_calloc (cnt, sizeof (ret[0]));<br>
&gt; &gt; -=C2=A0 =C2=A0if (!ret)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt; &gt; - <br>
&gt; &gt; -@@ -1013,7 +1013,7 @@ grub_xnputs (const char *str, grub_size_t=
<br>
&gt; &gt; msg_len)<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0grub_error_push ();<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 unicode_str =3D grub_malloc (msg_len * sizeof (grub_uin=
t32_t));<br>
&gt; &gt; -+=C2=A0 unicode_str =3D grub_calloc (msg_len, sizeof (grub_uint=
32_t));<br>
&gt; &gt; -=C2=A0 <br>
&gt; &gt; -=C2=A0 =C2=A0grub_error_pop ();<br>
&gt; &gt; - <br>
&gt; &gt; -diff --git a/grub-core/osdep/linux/getroot.c b/grub-<br>
&gt; &gt; core/osdep/linux/getroot.c<br>
&gt; &gt; -index 90d92d3..5b41ad0 100644<br>
&gt; &gt; ---- a/grub-core/osdep/linux/getroot.c<br>
&gt; &gt; -+++ b/grub-core/osdep/linux/getroot.c<br>
&gt; &gt; -@@ -168,7 +168,7 @@ grub_util_raid_getmembers (const char *name=
, int<br>
&gt; &gt; bootable)<br>
&gt; &gt; -=C2=A0 =C2=A0if (ret !=3D 0)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0grub_util_error (_(&quot;ioctl GET_ARRAY_IN=
FO error: %s&quot;), strerror<br>
&gt; &gt; (errno));<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 devicelist =3D xmalloc ((info.nr_disks + 1) * sizeof (c=
har *));<br>
&gt; &gt; -+=C2=A0 devicelist =3D xcalloc (info.nr_disks + 1, sizeof (char=
 *));<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0for (i =3D 0, j =3D 0; j &lt; info.nr_disks; i++)<=
br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -@@ -241,7 +241,7 @@ grub_find_root_devices_from_btrfs (const ch=
ar<br>
&gt; &gt; *dir)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 ret =3D xmalloc ((fsi.num_devices + 1) * sizeof (ret[0]=
));<br>
&gt; &gt; -+=C2=A0 ret =3D xcalloc (fsi.num_devices + 1, sizeof (ret[0]));=
<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0for (i =3D 1; i &lt;=3D fsi.max_id &amp;&amp; j &l=
t; fsi.num_devices; i++)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -@@ -396,7 +396,7 @@ grub_find_root_devices_from_mountinfo (cons=
t<br>
&gt; &gt; char *dir, char **relroot)<br>
&gt; &gt; -=C2=A0 =C2=A0if (relroot)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0*relroot =3D NULL;<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 entries =3D xmalloc (entry_max * sizeof (*entries));<br=
>
&gt; &gt; -+=C2=A0 entries =3D xcalloc (entry_max, sizeof (*entries));<br>
&gt; &gt; - <br>
&gt; &gt; - again:<br>
&gt; &gt; -=C2=A0 =C2=A0fp =3D grub_util_fopen (&quot;/proc/self/mountinfo=
&quot;, &quot;r&quot;);<br>
&gt; &gt; -diff --git a/grub-core/osdep/unix/config.c b/grub-<br>
&gt; &gt; core/osdep/unix/config.c<br>
&gt; &gt; -index 65effa9..7d63251 100644<br>
&gt; &gt; ---- a/grub-core/osdep/unix/config.c<br>
&gt; &gt; -+++ b/grub-core/osdep/unix/config.c<br>
&gt; &gt; -@@ -89,7 +89,7 @@ grub_util_load_config (struct grub_util_confi=
g<br>
&gt; &gt; *cfg)<br>
&gt; &gt; -=C2=A0 =C2=A0argv[0] =3D &quot;sh&quot;;<br>
&gt; &gt; -=C2=A0 =C2=A0argv[1] =3D &quot;-c&quot;;<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 script =3D xmalloc (4 * strlen (cfgfile) + 300);<br>
&gt; &gt; -+=C2=A0 script =3D xcalloc (4, strlen (cfgfile) + 300);<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0ptr =3D script;<br>
&gt; &gt; -=C2=A0 =C2=A0memcpy (ptr, &quot;. &#39;&quot;, 3);<br>
&gt; &gt; -diff --git a/grub-core/osdep/windows/getroot.c b/grub-<br>
&gt; &gt; core/osdep/windows/getroot.c<br>
&gt; &gt; -index 661d954..eada663 100644<br>
&gt; &gt; ---- a/grub-core/osdep/windows/getroot.c<br>
&gt; &gt; -+++ b/grub-core/osdep/windows/getroot.c<br>
&gt; &gt; -@@ -59,7 +59,7 @@ grub_get_mount_point (const TCHAR *path)<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0for (ptr =3D path; *ptr; ptr++);<br>
&gt; &gt; -=C2=A0 =C2=A0allocsize =3D (ptr - path + 10) * 2;<br>
&gt; &gt; --=C2=A0 out =3D xmalloc (allocsize * sizeof (out[0]));<br>
&gt; &gt; -+=C2=A0 out =3D xcalloc (allocsize, sizeof (out[0]));<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0/* When pointing to EFI system partition GetVolume=
PathName fails<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 for ESP root and returns abberant informat=
ion for everything<br>
&gt; &gt; -diff --git a/grub-core/osdep/windows/hostdisk.c b/grub-<br>
&gt; &gt; core/osdep/windows/hostdisk.c<br>
&gt; &gt; -index 3551007..0be3273 100644<br>
&gt; &gt; ---- a/grub-core/osdep/windows/hostdisk.c<br>
&gt; &gt; -+++ b/grub-core/osdep/windows/hostdisk.c<br>
&gt; &gt; -@@ -111,7 +111,7 @@ grub_util_get_windows_path_real (const char=
<br>
&gt; &gt; *path)<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0while (1)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 fpa =3D xmalloc (alloc * sizeof (fpa[0]))=
;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 fpa =3D xcalloc (alloc, sizeof (fpa[0]));=
<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D GetFullPathName (tpath, allo=
c, fpa, NULL);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (len &gt;=3D alloc)<br>
&gt; &gt; -@@ -399,7 +399,7 @@ grub_util_fd_opendir (const char *name)<br>
&gt; &gt; -=C2=A0 =C2=A0for (l =3D 0; name_windows[l]; l++);<br>
&gt; &gt; -=C2=A0 =C2=A0for (l--; l &gt;=3D 0 &amp;&amp; (name_windows[l] =
=
=3D=3D &#39;\\&#39; || name_windows[l]<br>
&gt; &gt; =3D=3D &#39;/&#39;); l--);<br>
&gt; &gt; -=C2=A0 =C2=A0l++;<br>
&gt; &gt; --=C2=A0 pattern =3D xmalloc ((l + 3) * sizeof (pattern[0]));<br=
>
&gt; &gt; -+=C2=A0 pattern =3D xcalloc (l + 3, sizeof (pattern[0]));<br>
&gt; &gt; -=C2=A0 =C2=A0memcpy (pattern, name_windows, l * sizeof (pattern=
[0]));<br>
&gt; &gt; -=C2=A0 =C2=A0pattern[l] =3D &#39;\\&#39;;<br>
&gt; &gt; -=C2=A0 =C2=A0pattern[l + 1] =3D &#39;*&#39;;<br>
&gt; &gt; -diff --git a/grub-core/osdep/windows/init.c b/grub-<br>
&gt; &gt; core/osdep/windows/init.c<br>
&gt; &gt; -index e8ffd62..6297de6 100644<br>
&gt; &gt; ---- a/grub-core/osdep/windows/init.c<br>
&gt; &gt; -+++ b/grub-core/osdep/windows/init.c<br>
&gt; &gt; -@@ -161,7 +161,7 @@ grub_util_host_init (int *argc __attribute_=
_<br>
&gt; &gt; ((unused)),<br>
&gt; &gt; -=C2=A0 =C2=A0LPWSTR *targv;<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0targv =3D CommandLineToArgvW (tcmdline, argc);<br>
&gt; &gt; --=C2=A0 *argv =3D xmalloc ((*argc + 1) * sizeof (argv[0]));<br>
&gt; &gt; -+=C2=A0 *argv =3D xcalloc (*argc + 1, sizeof (argv[0]));<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0for (i =3D 0; i &lt; *argc; i++)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0(*argv)[i] =3D grub_util_tchar_to_utf8 (tar=
gv[i]); <br>
&gt; &gt; -diff --git a/grub-core/osdep/windows/platform.c b/grub-<br>
&gt; &gt; core/osdep/windows/platform.c<br>
&gt; &gt; -index 7eb53fe..1ef86bf 100644<br>
&gt; &gt; ---- a/grub-core/osdep/windows/platform.c<br>
&gt; &gt; -+++ b/grub-core/osdep/windows/platform.c<br>
&gt; &gt; -@@ -225,8 +225,8 @@ grub_install_register_efi (grub_device_t<br=
>
&gt; &gt; efidir_grub_dev,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0grub_util_error (&quot;%s&quot;, _(&quot;no=
 EFI routines are available when<br>
&gt; &gt; running in BIOS mode&quot;));<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0distrib8_len =3D grub_strlen (efi_distributor);<br=
>
&gt; &gt; --=C2=A0 distributor16 =3D xmalloc ((distrib8_len + 1) *<br>
&gt; &gt; GRUB_MAX_UTF16_PER_UTF8<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0* sizeof (grub_uint16_t));<br>
&gt; &gt; -+=C2=A0 distributor16 =3D xcalloc (distrib8_len + 1,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0GRUB_MAX_UTF16_PER_UTF8 * sizeof<br>
&gt; &gt; (grub_uint16_t));<br>
&gt; &gt; -=C2=A0 =C2=A0distrib16_len =3D grub_utf8_to_utf16 (distributor1=
6, distrib8_len *<br>
&gt; &gt; GRUB_MAX_UTF16_PER_UTF8,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(cons=
t grub_uint8_t *)<br>
&gt; &gt; efi_distributor,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0distr=
ib8_len, 0);<br>
&gt; &gt; -diff --git a/grub-core/osdep/windows/relpath.c b/grub-<br>
&gt; &gt; core/osdep/windows/relpath.c<br>
&gt; &gt; -index cb08617..478e8ef 100644<br>
&gt; &gt; ---- a/grub-core/osdep/windows/relpath.c<br>
&gt; &gt; -+++ b/grub-core/osdep/windows/relpath.c<br>
&gt; &gt; -@@ -72,7 +72,7 @@ grub_make_system_path_relative_to_its_root (c=
onst<br>
&gt; &gt; char *path)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (dirwindows[0] &amp;&amp; dirwind=
ows[1] =3D=3D &#39;:&#39;)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0offset =3D 2;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; --=C2=A0 ret =3D xmalloc (sizeof (ret[0]) * (flen - offset + 2))=
;<br>
&gt; &gt; -+=C2=A0 ret =3D xcalloc (flen - offset + 2, sizeof (ret[0]));<b=
r>
&gt; &gt; -=C2=A0 =C2=A0if (dirwindows[offset] !=3D &#39;\\&#39;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; dirwindows[offset] !=3D &=
#39;/&#39;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; dirwindows[offset])<br>
&gt; &gt; -diff --git a/grub-core/partmap/gpt.c b/grub-core/partmap/gpt.c<=
br>
&gt; &gt; -index 103f679..72a2e37 100644<br>
&gt; &gt; ---- a/grub-core/partmap/gpt.c<br>
&gt; &gt; -+++ b/grub-core/partmap/gpt.c<br>
&gt; &gt; -@@ -199,7 +199,7 @@ gpt_partition_map_embed (struct grub_disk *=
disk,<br>
&gt; &gt; unsigned int *nsectors,<br>
&gt; &gt; -=C2=A0 =C2=A0*nsectors =3D ctx.len;<br>
&gt; &gt; -=C2=A0 =C2=A0if (*nsectors &gt; max_nsectors)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0*nsectors =3D max_nsectors;<br>
&gt; &gt; --=C2=A0 *sectors =3D grub_malloc (*nsectors * sizeof (**sectors=
));<br>
&gt; &gt; -+=C2=A0 *sectors =3D grub_calloc (*nsectors, sizeof (**sectors)=
);<br>
&gt; &gt; -=C2=A0 =C2=A0if (!*sectors)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return grub_errno;<br>
&gt; &gt; -=C2=A0 =C2=A0for (i =3D 0; i &lt; *nsectors; i++)<br>
&gt; &gt; -diff --git a/grub-core/partmap/msdos.c b/grub-core/partmap/msdo=
s.c<br>
&gt; &gt; -index 7b8e450..ee3f249 100644<br>
&gt; &gt; ---- a/grub-core/partmap/msdos.c<br>
&gt; &gt; -+++ b/grub-core/partmap/msdos.c<br>
&gt; &gt; -@@ -337,7 +337,7 @@ pc_partition_map_embed (struct grub_disk *d=
isk,<br>
&gt; &gt; unsigned int *nsectors,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0avail_nsectors =3D *nsectors;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (*nsectors &gt; max_nsectors)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0*nsectors =3D max_nsectors;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 *sectors =3D grub_malloc (*nsectors * siz=
eof (**sectors));<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 *sectors =3D grub_calloc (*nsectors, size=
of (**sectors));<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!*sectors)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return grub_errno;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; *nsectors; i++)=
<br>
&gt; &gt; -diff --git a/grub-core/script/execute.c b/grub-core/script/exec=
ute.c<br>
&gt; &gt; -index ee299fd..c8d6806 100644<br>
&gt; &gt; ---- a/grub-core/script/execute.c<br>
&gt; &gt; -+++ b/grub-core/script/execute.c<br>
&gt; &gt; -@@ -553,7 +553,7 @@ gettext_append (struct grub_script_argv *re=
sult,<br>
&gt; &gt; const char *orig_str)<br>
&gt; &gt; -=C2=A0 =C2=A0for (iptr =3D orig_str; *iptr; iptr++)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if (*iptr =3D=3D &#39;$&#39;)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0dollar_cnt++;<br>
&gt; &gt; --=C2=A0 ctx.allowed_strings =3D grub_malloc (sizeof<br>
&gt; &gt; (ctx.allowed_strings[0]) * dollar_cnt);<br>
&gt; &gt; -+=C2=A0 ctx.allowed_strings =3D grub_calloc (dollar_cnt, sizeof=
<br>
&gt; &gt; (ctx.allowed_strings[0]));<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0if (parse_string (orig_str, gettext_save_allow, &a=
mp;ctx, 0))<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0goto fail;<br>
&gt; &gt; -diff --git a/grub-core/tests/fake_input.c b/grub-<br>
&gt; &gt; core/tests/fake_input.c<br>
&gt; &gt; -index 2d60852..b5eb516 100644<br>
&gt; &gt; ---- a/grub-core/tests/fake_input.c<br>
&gt; &gt; -+++ b/grub-core/tests/fake_input.c<br>
&gt; &gt; -@@ -49,7 +49,7 @@ grub_terminal_input_fake_sequence (int *seq_i=
n,<br>
&gt; &gt; int nseq_in)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0saved =3D grub_term_inputs;<br>
&gt; &gt; -=C2=A0 =C2=A0if (seq)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0grub_free (seq);<br>
&gt; &gt; --=C2=A0 seq =3D grub_malloc (nseq_in * sizeof (seq[0]));<br>
&gt; &gt; -+=C2=A0 seq =3D grub_calloc (nseq_in, sizeof (seq[0]));<br>
&gt; &gt; -=C2=A0 =C2=A0if (!seq)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return;<br>
&gt; &gt; - <br>
&gt; &gt; -diff --git a/grub-core/tests/video_checksum.c b/grub-<br>
&gt; &gt; core/tests/video_checksum.c<br>
&gt; &gt; -index 74d5b65..44d0810 100644<br>
&gt; &gt; ---- a/grub-core/tests/video_checksum.c<br>
&gt; &gt; -+++ b/grub-core/tests/video_checksum.c<br>
&gt; &gt; -@@ -336,7 +336,7 @@ grub_video_capture_write_bmp (const char *f=
name,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0case 4:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 grub_uint8_t *buffer =3D xmalloc (mode_in=
fo-&gt;width * 3);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 grub_uint8_t *buffer =3D xcalloc (3, mode=
_info-&gt;width);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_uint32_t rmask =3D ((1 &lt;&lt;=
 mode_info-&gt;red_mask_size) - 1);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_uint32_t gmask =3D ((1 &lt;&lt;=
 mode_info-&gt;green_mask_size) -<br>
&gt; &gt; 1);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_uint32_t bmask =3D ((1 &lt;&lt;=
 mode_info-&gt;blue_mask_size) - 1);<br>
&gt; &gt; -@@ -367,7 +367,7 @@ grub_video_capture_write_bmp (const char *f=
name,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0case 3:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 grub_uint8_t *buffer =3D xmalloc (mode_in=
fo-&gt;width * 3);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 grub_uint8_t *buffer =3D xcalloc (3, mode=
_info-&gt;width);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_uint32_t rmask =3D ((1 &lt;&lt;=
 mode_info-&gt;red_mask_size) - 1);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_uint32_t gmask =3D ((1 &lt;&lt;=
 mode_info-&gt;green_mask_size) -<br>
&gt; &gt; 1);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_uint32_t bmask =3D ((1 &lt;&lt;=
 mode_info-&gt;blue_mask_size) - 1);<br>
&gt; &gt; -@@ -407,7 +407,7 @@ grub_video_capture_write_bmp (const char *f=
name,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0case 2:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 grub_uint8_t *buffer =3D xmalloc (mode_in=
fo-&gt;width * 3);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 grub_uint8_t *buffer =3D xcalloc (3, mode=
_info-&gt;width);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_uint16_t rmask =3D ((1 &lt;&lt;=
 mode_info-&gt;red_mask_size) - 1);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_uint16_t gmask =3D ((1 &lt;&lt;=
 mode_info-&gt;green_mask_size) -<br>
&gt; &gt; 1);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_uint16_t bmask =3D ((1 &lt;&lt;=
 mode_info-&gt;blue_mask_size) - 1);<br>
&gt; &gt; -diff --git a/grub-core/video/capture.c b/grub-core/video/captur=
e.c<br>
&gt; &gt; -index 4f83c74..4d3195e 100644<br>
&gt; &gt; ---- a/grub-core/video/capture.c<br>
&gt; &gt; -+++ b/grub-core/video/capture.c<br>
&gt; &gt; -@@ -89,7 +89,7 @@ grub_video_capture_start (const struct<br>
&gt; &gt; grub_video_mode_info *mode_info,<br>
&gt; &gt; -=C2=A0 =C2=A0framebuffer.mode_info =3D *mode_info;<br>
&gt; &gt; -=C2=A0 =C2=A0framebuffer.mode_info.blit_format =3D grub_video_g=
et_blit_format<br>
&gt; &gt; (&amp;framebuffer.mode_info);<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 framebuffer.ptr =3D grub_malloc (framebuffer.mode_info.=
height *<br>
&gt; &gt; framebuffer.mode_info.pitch);<br>
&gt; &gt; -+=C2=A0 framebuffer.ptr =3D grub_calloc (framebuffer.mode_info.=
height,<br>
&gt; &gt; framebuffer.mode_info.pitch);<br>
&gt; &gt; -=C2=A0 =C2=A0if (!framebuffer.ptr)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return grub_errno;<br>
&gt; &gt; -=C2=A0 =C2=A0<br>
&gt; &gt; -diff --git a/grub-core/video/emu/sdl.c b/grub-core/video/emu/sd=
l.c<br>
&gt; &gt; -index a2f639f..0ebab6f 100644<br>
&gt; &gt; ---- a/grub-core/video/emu/sdl.c<br>
&gt; &gt; -+++ b/grub-core/video/emu/sdl.c<br>
&gt; &gt; -@@ -172,7 +172,7 @@ grub_video_sdl_set_palette (unsigned int st=
art,<br>
&gt; &gt; unsigned int count,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (start + count &gt; mode_info.num=
ber_of_colors)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0count =3D mode_info.number_of_colors=
 - start;<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 tmp =3D grub_malloc (count * sizeof (tmp[=
0]));<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 tmp =3D grub_calloc (count, sizeof (tmp[0=
]));<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; count; i++)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmp[i].r =3D palette_data[i].=
r;<br>
&gt; &gt; -diff --git a/grub-core/video/i386/pc/vga.c b/grub-<br>
&gt; &gt; core/video/i386/pc/vga.c<br>
&gt; &gt; -index 01f4711..b2f776c 100644<br>
&gt; &gt; ---- a/grub-core/video/i386/pc/vga.c<br>
&gt; &gt; -+++ b/grub-core/video/i386/pc/vga.c<br>
&gt; &gt; -@@ -127,7 +127,7 @@ grub_video_vga_setup (unsigned int width,<b=
r>
&gt; &gt; unsigned int height,<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0vga_height =3D height ? : 480;<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 framebuffer.temporary_buffer =3D grub_malloc (vga_heigh=
t *<br>
&gt; &gt; VGA_WIDTH);<br>
&gt; &gt; -+=C2=A0 framebuffer.temporary_buffer =3D grub_calloc (vga_heigh=
t,<br>
&gt; &gt; VGA_WIDTH);<br>
&gt; &gt; -=C2=A0 =C2=A0framebuffer.front_page =3D 0;<br>
&gt; &gt; -=C2=A0 =C2=A0framebuffer.back_page =3D 0;<br>
&gt; &gt; -=C2=A0 =C2=A0if (!framebuffer.temporary_buffer)<br>
&gt; &gt; -diff --git a/grub-core/video/readers/png.c b/grub-<br>
&gt; &gt; core/video/readers/png.c<br>
&gt; &gt; -index 777e713..61bd645 100644<br>
&gt; &gt; ---- a/grub-core/video/readers/png.c<br>
&gt; &gt; -+++ b/grub-core/video/readers/png.c<br>
&gt; &gt; -@@ -309,7 +309,7 @@ grub_png_decode_image_header (struct<br>
&gt; &gt; grub_png_data *data)<br>
&gt; &gt; -=C2=A0 =C2=A0if (data-&gt;is_16bit || data-&gt;is_gray || data-=
&gt;is_palette)<br>
&gt; &gt; - #endif<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 data-&gt;image_data =3D grub_malloc (data=
-&gt;image_height * data-<br>
&gt; &gt; &gt; row_bytes);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 data-&gt;image_data =3D grub_calloc (data=
-&gt;image_height, data-<br>
&gt; &gt; &gt; row_bytes);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (grub_errno)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return grub_errno;<br>
&gt; &gt; - <br>
&gt; &gt; -diff --git a/include/grub/unicode.h b/include/grub/unicode.h<br=
>
&gt; &gt; -index a0403e9..4de986a 100644<br>
&gt; &gt; ---- a/include/grub/unicode.h<br>
&gt; &gt; -+++ b/include/grub/unicode.h<br>
&gt; &gt; -@@ -293,7 +293,7 @@ grub_unicode_glyph_dup (const struct<br>
&gt; &gt; grub_unicode_glyph *in)<br>
&gt; &gt; -=C2=A0 =C2=A0grub_memcpy (out, in, sizeof (*in));<br>
&gt; &gt; -=C2=A0 =C2=A0if (in-&gt;ncomb &gt; ARRAY_SIZE (out-&gt;combinin=
g_inline))<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 out-&gt;combining_ptr =3D grub_malloc (in=
-&gt;ncomb * sizeof (out-<br>
&gt; &gt; &gt; combining_ptr[0]));<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 out-&gt;combining_ptr =3D grub_calloc (in=
-&gt;ncomb, sizeof (out-<br>
&gt; &gt; &gt; combining_ptr[0]));<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!out-&gt;combining_ptr)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (out);<br>
&gt; &gt; -@@ -315,7 +315,7 @@ grub_unicode_set_glyph (struct<br>
&gt; &gt; grub_unicode_glyph *out,<br>
&gt; &gt; -=C2=A0 =C2=A0grub_memcpy (out, in, sizeof (*in));<br>
&gt; &gt; -=C2=A0 =C2=A0if (in-&gt;ncomb &gt; ARRAY_SIZE (out-&gt;combinin=
g_inline))<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 out-&gt;combining_ptr =3D grub_malloc (in=
-&gt;ncomb * sizeof (out-<br>
&gt; &gt; &gt; combining_ptr[0]));<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 out-&gt;combining_ptr =3D grub_calloc (in=
-&gt;ncomb, sizeof (out-<br>
&gt; &gt; &gt; combining_ptr[0]));<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!out-&gt;combining_ptr)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_memcpy (out-&gt;combining_ptr, =
in-&gt;combining_ptr,<br>
&gt; &gt; -diff --git a/util/getroot.c b/util/getroot.c<br>
&gt; &gt; -index 847406f..a5eaa64 100644<br>
&gt; &gt; ---- a/util/getroot.c<br>
&gt; &gt; -+++ b/util/getroot.c<br>
&gt; &gt; -@@ -200,7 +200,7 @@ make_device_name (const char *drive)<br>
&gt; &gt; -=C2=A0 =C2=A0char *ret, *ptr;<br>
&gt; &gt; -=C2=A0 =C2=A0const char *iptr;<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 ret =3D xmalloc (strlen (drive) * 2);<br>
&gt; &gt; -+=C2=A0 ret =3D xcalloc (2, strlen (drive));<br>
&gt; &gt; -=C2=A0 =C2=A0ptr =3D ret;<br>
&gt; &gt; -=C2=A0 =C2=A0for (iptr =3D drive; *iptr; iptr++)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -diff --git a/util/grub-file.c b/util/grub-file.c<br>
&gt; &gt; -index 50c18b6..b2e7dd6 100644<br>
&gt; &gt; ---- a/util/grub-file.c<br>
&gt; &gt; -+++ b/util/grub-file.c<br>
&gt; &gt; -@@ -54,7 +54,7 @@ main (int argc, char *argv[])<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0grub_util_host_init (&amp;argc, &amp;argv);<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 argv2 =3D xmalloc (argc * sizeof (argv2[0]));<br>
&gt; &gt; -+=C2=A0 argv2 =3D xcalloc (argc, sizeof (argv2[0]));<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0if (argc =3D=3D 2 &amp;&amp; strcmp (argv[1], &quo=
t;--version&quot;) =3D=3D 0)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -diff --git a/util/grub-fstest.c b/util/grub-fstest.c<br>
&gt; &gt; -index f14e02d..57246af 100644<br>
&gt; &gt; ---- a/util/grub-fstest.c<br>
&gt; &gt; -+++ b/util/grub-fstest.c<br>
&gt; &gt; -@@ -650,7 +650,7 @@ argp_parser (int key, char *arg, struct<br>
&gt; &gt; argp_state *state)<br>
&gt; &gt; -=C2=A0 =C2=A0if (args_count &lt; num_disks)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (args_count =3D=3D 0)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 images =3D xmalloc (num_disks * sizeof (i=
mages[0]));<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 images =3D xcalloc (num_disks, sizeof (im=
ages[0]));<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0images[args_count] =3D grub_canonica=
lize_file_name (arg);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0args_count++;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt; -@@ -734,7 +734,7 @@ main (int argc, char *argv[])<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0grub_util_host_init (&amp;argc, &amp;argv);<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 args =3D xmalloc (argc * sizeof (args[0]));<br>
&gt; &gt; -+=C2=A0 args =3D xcalloc (argc, sizeof (args[0]));<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0argp_parse (&amp;argp, argc, argv, 0, 0, 0);<br>
&gt; &gt; - <br>
&gt; &gt; -diff --git a/util/grub-install-common.c b/util/grub-install-com=
mon.c<br>
&gt; &gt; -index ca0ac61..0295d40 100644<br>
&gt; &gt; ---- a/util/grub-install-common.c<br>
&gt; &gt; -+++ b/util/grub-install-common.c<br>
&gt; &gt; -@@ -286,7 +286,7 @@ handle_install_list (struct install_list *i=
l,<br>
&gt; &gt; const char *val,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0il-&gt;n_entries++;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; -=C2=A0 =C2=A0il-&gt;n_alloc =3D il-&gt;n_entries + 1;<br>
&gt; &gt; --=C2=A0 il-&gt;entries =3D xmalloc (il-&gt;n_alloc * sizeof (il=
-&gt;entries[0]));<br>
&gt; &gt; -+=C2=A0 il-&gt;entries =3D xcalloc (il-&gt;n_alloc, sizeof (il-=
&gt;entries[0]));<br>
&gt; &gt; -=C2=A0 =C2=A0ptr =3D val;<br>
&gt; &gt; -=C2=A0 =C2=A0for (ce =3D il-&gt;entries; ; ce++)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -diff --git a/util/grub-install.c b/util/grub-install.c<br>
&gt; &gt; -index 8a55ad4..a82725f 100644<br>
&gt; &gt; ---- a/util/grub-install.c<br>
&gt; &gt; -+++ b/util/grub-install.c<br>
&gt; &gt; -@@ -626,7 +626,7 @@ device_map_check_duplicates (const char<br>
&gt; &gt; *dev_map)<br>
&gt; &gt; -=C2=A0 =C2=A0if (! fp)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return;<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 d =3D xmalloc (alloced * sizeof (d[0]));<br>
&gt; &gt; -+=C2=A0 d =3D xcalloc (alloced, sizeof (d[0]));<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0while (fgets (buf, sizeof (buf), fp))<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -@@ -1260,7 +1260,7 @@ main (int argc, char *argv[])<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ndev++;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 grub_drives =3D xmalloc (sizeof (grub_drives[0]) * (nde=
v + 1)); <br>
&gt; &gt; -+=C2=A0 grub_drives =3D xcalloc (ndev + 1, sizeof (grub_drives[=
0]));<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0for (curdev =3D grub_devices, curdrive =3D grub_dr=
ives; *curdev;<br>
&gt; &gt; curdev++,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 curdrive++)<br>
&gt; &gt; -diff --git a/util/grub-mkimagexx.c b/util/grub-mkimagexx.c<br>
&gt; &gt; -index bc087c2..d97d0e7 100644<br>
&gt; &gt; ---- a/util/grub-mkimagexx.c<br>
&gt; &gt; -+++ b/util/grub-mkimagexx.c<br>
&gt; &gt; -@@ -2294,10 +2294,8 @@ SUFFIX (grub_mkimage_load_image) (const =
char<br>
&gt; &gt; *kernel_path,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0+ grub_host_to_target16 (e-&gt;e_shstrndx) *<br>
&gt; &gt; smd.section_entsize);<br>
&gt; &gt; -=C2=A0 =C2=A0smd.strtab =3D (char *) e + grub_host_to_target_ad=
dr (s-<br>
&gt; &gt; &gt; sh_offset);<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 smd.addrs =3D xmalloc (sizeof (*smd.addrs) * smd.num_se=
ctions);<br>
&gt; &gt; --=C2=A0 memset (smd.addrs, 0, sizeof (*smd.addrs) * smd.num_sec=
tions);<br>
&gt; &gt; --=C2=A0 smd.vaddrs =3D xmalloc (sizeof (*smd.vaddrs) * smd.num_=
sections);<br>
&gt; &gt; --=C2=A0 memset (smd.vaddrs, 0, sizeof (*smd.vaddrs) * smd.num_s=
ections);<br>
&gt; &gt; -+=C2=A0 smd.addrs =3D xcalloc (smd.num_sections, sizeof (*smd.a=
ddrs));<br>
&gt; &gt; -+=C2=A0 smd.vaddrs =3D xcalloc (smd.num_sections, sizeof (*smd.=
vaddrs));<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0SUFFIX (locate_sections) (e, kernel_path, &amp;smd=
, layout,<br>
&gt; &gt; image_target);<br>
&gt; &gt; - <br>
&gt; &gt; -diff --git a/util/grub-mkrescue.c b/util/grub-mkrescue.c<br>
&gt; &gt; -index ce2cbc4..5183102 100644<br>
&gt; &gt; ---- a/util/grub-mkrescue.c<br>
&gt; &gt; -+++ b/util/grub-mkrescue.c<br>
&gt; &gt; -@@ -441,8 +441,8 @@ main (int argc, char *argv[])<br>
&gt; &gt; -=C2=A0 =C2=A0xorriso =3D xstrdup (&quot;xorriso&quot;);<br>
&gt; &gt; -=C2=A0 =C2=A0label_font =3D grub_util_path_concat (2, pkgdatadi=
r,<br>
&gt; &gt; &quot;unicode.pf2&quot;);<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 argp_argv =3D xmalloc (sizeof (argp_argv[0]) * argc);<b=
r>
&gt; &gt; --=C2=A0 xorriso_tail_argv =3D xmalloc (sizeof (argp_argv[0]) * =
argc);<br>
&gt; &gt; -+=C2=A0 argp_argv =3D xcalloc (argc, sizeof (argp_argv[0]));<br=
>
&gt; &gt; -+=C2=A0 xorriso_tail_argv =3D xcalloc (argc, sizeof (argp_argv[=
0]));<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0xorriso_tail_argc =3D 0;<br>
&gt; &gt; -=C2=A0 =C2=A0/* Program name */<br>
&gt; &gt; -diff --git a/util/grub-mkstandalone.c b/util/grub-mkstandalone.=
c<br>
&gt; &gt; -index 4907d44..edf3097 100644<br>
&gt; &gt; ---- a/util/grub-mkstandalone.c<br>
&gt; &gt; -+++ b/util/grub-mkstandalone.c<br>
&gt; &gt; -@@ -296,7 +296,7 @@ main (int argc, char *argv[])<br>
&gt; &gt; -=C2=A0 =C2=A0grub_util_host_init (&amp;argc, &amp;argv);<br>
&gt; &gt; -=C2=A0 =C2=A0grub_util_disable_fd_syncs ();<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 files =3D xmalloc ((argc + 1) * sizeof (files[0]));<br>
&gt; &gt; -+=C2=A0 files =3D xcalloc (argc + 1, sizeof (files[0]));<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0argp_parse (&amp;argp, argc, argv, 0, 0, 0);<br>
&gt; &gt; - <br>
&gt; &gt; -diff --git a/util/grub-pe2elf.c b/util/grub-pe2elf.c<br>
&gt; &gt; -index 0d4084a..1133129 100644<br>
&gt; &gt; ---- a/util/grub-pe2elf.c<br>
&gt; &gt; -+++ b/util/grub-pe2elf.c<br>
&gt; &gt; -@@ -100,9 +100,9 @@ write_section_data (FILE* fp, const char *n=
ame,<br>
&gt; &gt; char *image,<br>
&gt; &gt; -=C2=A0 =C2=A0char *pe_strtab =3D (image + pe_chdr-&gt;symtab_of=
fset<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 + pe_chdr-&gt;num_symbols * sizeof (struct<br>
&gt; &gt; grub_pe32_symbol));<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 section_map =3D xmalloc ((2 * pe_chdr-&gt;num_sections =
+ 5) * sizeof<br>
&gt; &gt; (int));<br>
&gt; &gt; -+=C2=A0 section_map =3D xcalloc (2 * pe_chdr-&gt;num_sections +=
 5, sizeof<br>
&gt; &gt; (int));<br>
&gt; &gt; -=C2=A0 =C2=A0section_map[0] =3D 0;<br>
&gt; &gt; --=C2=A0 shdr =3D xmalloc ((2 * pe_chdr-&gt;num_sections + 5) * =
sizeof<br>
&gt; &gt; (shdr[0]));<br>
&gt; &gt; -+=C2=A0 shdr =3D xcalloc (2 * pe_chdr-&gt;num_sections + 5, siz=
eof (shdr[0]));<br>
&gt; &gt; -=C2=A0 =C2=A0idx =3D 1;<br>
&gt; &gt; -=C2=A0 =C2=A0idx_reloc =3D pe_chdr-&gt;num_sections + 1;<br>
&gt; &gt; - <br>
&gt; &gt; -@@ -233,7 +233,7 @@ write_reloc_section (FILE* fp, const char *=
name,<br>
&gt; &gt; char *image,<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0pe_sec =3D pe_shdr + shdr[i].sh_link=
;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0pe_rel =3D (struct grub_pe32_reloc *=
) (image + pe_sec-<br>
&gt; &gt; &gt; relocations_offset);<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 rel =3D (elf_reloc_t *) xmalloc (pe_sec-&=
gt;num_relocations *<br>
&gt; &gt; sizeof (elf_reloc_t));<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 rel =3D (elf_reloc_t *) xcalloc (pe_sec-&=
gt;num_relocations,<br>
&gt; &gt; sizeof (elf_reloc_t));<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0num_rels =3D 0;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0modified =3D 0;<br>
&gt; &gt; - <br>
&gt; &gt; -@@ -365,12 +365,10 @@ write_symbol_table (FILE* fp, const char<=
br>
&gt; &gt; *name, char *image,<br>
&gt; &gt; -=C2=A0 =C2=A0pe_symtab =3D (struct grub_pe32_symbol *) (image +=
 pe_chdr-<br>
&gt; &gt; &gt; symtab_offset);<br>
&gt; &gt; -=C2=A0 =C2=A0pe_strtab =3D (char *) (pe_symtab + pe_chdr-&gt;nu=
m_symbols);<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 symtab =3D (Elf_Sym *) xmalloc ((pe_chdr-&gt;num_symbol=
s + 1) *<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof (Elf_Sym));<br>
&gt; &gt; --=C2=A0 memset (symtab, 0, (pe_chdr-&gt;num_symbols + 1) * size=
of<br>
&gt; &gt; (Elf_Sym));<br>
&gt; &gt; -+=C2=A0 symtab =3D (Elf_Sym *) xcalloc (pe_chdr-&gt;num_symbols=
 + 1, sizeof<br>
&gt; &gt; (Elf_Sym));<br>
&gt; &gt; -=C2=A0 =C2=A0num_syms =3D 1;<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 symtab_map =3D (int *) xmalloc (pe_chdr-&gt;num_symbols=
 * sizeof<br>
&gt; &gt; (int));<br>
&gt; &gt; -+=C2=A0 symtab_map =3D (int *) xcalloc (pe_chdr-&gt;num_symbols=
, sizeof<br>
&gt; &gt; (int));<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0for (i =3D 0; i &lt; (int) pe_chdr-&gt;num_symbols=
;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 i +=3D pe_symtab-&gt;num_aux + 1, p=
e_symtab +=3D pe_symtab-&gt;num_aux<br>
&gt; &gt; + 1)<br>
&gt; &gt; -diff --git a/util/grub-probe.c b/util/grub-probe.c<br>
&gt; &gt; -index 81d27ee..cbe6ed9 100644<br>
&gt; &gt; ---- a/util/grub-probe.c<br>
&gt; &gt; -+++ b/util/grub-probe.c<br>
&gt; &gt; -@@ -361,8 +361,8 @@ probe (const char *path, char **device_name=
s,<br>
&gt; &gt; char delim)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_util_pull_device (*curdev);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ndev++;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; --=C2=A0 <br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 drives_names =3D xcalloc (ndev + 1, sizeof (drives_name=
s[0]));<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0for (curdev =3D device_names, curdrive =3D drives_=
names; *curdev;<br>
&gt; &gt; curdev++,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 curdrive++)<br>
&gt; &gt; --- <br>
&gt; &gt; -2.14.4<br>
&gt; &gt; -<br>
&gt; &gt; diff --git a/meta/recipes-bsp/grub/files/CVE-2020-14309-CVE-2020=
-<br>
&gt; &gt; 14310-CVE-2020-14311-malloc-Use-overflow-checking-primitives-whe=
re-<br>
&gt; &gt; we-do-.patch b/meta/recipes-bsp/grub/files/CVE-2020-14309-CVE-20=
20-<br>
&gt; &gt; 14310-CVE-2020-14311-malloc-Use-overflow-checking-primitives-whe=
re-<br>
&gt; &gt; we-do-.patch<br>
&gt; &gt; deleted file mode 100644<br>
&gt; &gt; index 7214ead9a7..0000000000<br>
&gt; &gt; --- a/meta/recipes-bsp/grub/files/CVE-2020-14309-CVE-2020-14310-=
CVE-<br>
&gt; &gt; 2020-14311-malloc-Use-overflow-checking-primitives-where-we-do-.=
patch<br>
&gt; &gt; +++ /dev/null<br>
&gt; &gt; @@ -1,1330 +0,0 @@<br>
&gt; &gt; -From eb77d1ef65e25746acff43545f62a71360b15eec Mon Sep 17 00:00:=
00<br>
&gt; &gt; 2001<br>
&gt; &gt; -From: Peter Jones &lt;<a href=3D"mailto:pjones@redhat.com" targ=
et=3D"_blank">pjones@redhat.com</a>&gt;<br>
&gt; &gt; -Date: Mon, 15 Jun 2020 12:28:27 -0400<br>
&gt; &gt; -Subject: [PATCH 6/9] malloc: Use overflow checking primitives w=
here<br>
&gt; &gt; we do<br>
&gt; &gt; - complex allocations<br>
&gt; &gt; -<br>
&gt; &gt; -This attempts to fix the places where we do the following where=
<br>
&gt; &gt; -arithmetic_expr may include unvalidated data:<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 X =3D grub_malloc(arithmetic_expr);<br>
&gt; &gt; -<br>
&gt; &gt; -It accomplishes this by doing the arithmetic ahead of time usin=
g<br>
&gt; &gt; grub_add(),<br>
&gt; &gt; -grub_sub(), grub_mul() and testing for overflow before proceedi=
ng.<br>
&gt; &gt; -<br>
&gt; &gt; -Among other issues, this fixes:<br>
&gt; &gt; -=C2=A0 - allocation of integer overflow in grub_video_bitmap_cr=
eate()<br>
&gt; &gt; -=C2=A0 =C2=A0 reported by Chris Coulson,<br>
&gt; &gt; -=C2=A0 - allocation of integer overflow in grub_png_decode_imag=
e_header()<br>
&gt; &gt; -=C2=A0 =C2=A0 reported by Chris Coulson,<br>
&gt; &gt; -=C2=A0 - allocation of integer overflow in grub_squash_read_sym=
link()<br>
&gt; &gt; -=C2=A0 =C2=A0 reported by Chris Coulson,<br>
&gt; &gt; -=C2=A0 - allocation of integer overflow in grub_ext2_read_symli=
nk()<br>
&gt; &gt; -=C2=A0 =C2=A0 reported by Chris Coulson,<br>
&gt; &gt; -=C2=A0 - allocation of integer overflow in read_section_as_stri=
ng()<br>
&gt; &gt; -=C2=A0 =C2=A0 reported by Chris Coulson.<br>
&gt; &gt; -<br>
&gt; &gt; -Fixes: CVE-2020-14309, CVE-2020-14310, CVE-2020-14311<br>
&gt; &gt; -<br>
&gt; &gt; -Signed-off-by: Peter Jones &lt;<a href=3D"mailto:pjones@redhat.=
com" target=3D"_blank">pjones@redhat.com</a>&gt;<br>
&gt; &gt; -Reviewed-by: Daniel Kiper &lt;<a href=3D"mailto:daniel.kiper@or=
acle.com" target=3D"_blank">daniel.kiper@oracle.com</a>&gt;<br>
&gt; &gt; -<br>
&gt; &gt; -Upstream-Status: Backport<br>
&gt; &gt; -CVE: CVE-2020-14309 CVE-2020-14310 CVE-2020-14311<br>
&gt; &gt; -<br>
&gt; &gt; -Reference to upstream patch:<br>
&gt; &gt; -<br>
&gt; &gt; <a href=3D"https://git.savannah.gnu.org/cgit/grub.git/commit/?id=
=
=3D3f05d693d1274965ffbe4ba99080dc2c570944c6" rel=3D"noreferrer" target=3D"=
_blank">https://git.savannah.gnu.org/cgit/grub.git/commit/?id=3D3f05d693d12=
74965ffbe4ba99080dc2c570944c6</a><br>
&gt; &gt; -<br>
&gt; &gt; -Signed-off-by: Yongxin Liu &lt;<a href=3D"mailto:yongxin.liu@wi=
ndriver.com" target=3D"_blank">yongxin.liu@windriver.com</a>&gt;<br>
&gt; &gt; ----<br>
&gt; &gt; - grub-core/commands/legacycfg.c | 29 +++++++++++++++++++-----<b=
r>
&gt; &gt; - grub-core/commands/wildcard.c=C2=A0 | 36 +++++++++++++++++++++=
+++-----<br>
&gt; &gt; - grub-core/disk/ldm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
 32 ++++++++++++++++++--------<br>
&gt; &gt; - grub-core/font/font.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 7 +++++-<br>
&gt; &gt; - grub-core/fs/btrfs.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
 28 +++++++++++++++--------<br>
&gt; &gt; - grub-core/fs/ext2.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 10 ++++++++-<br>
&gt; &gt; - grub-core/fs/iso9660.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 51 +=
++++++++++++++++++++++++++++--<br>
&gt; &gt; -----------<br>
&gt; &gt; - grub-core/fs/sfs.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 27 +++++++++++++++++-----<br>
&gt; &gt; - grub-core/fs/squash4.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 45 +=
+++++++++++++++++++++++++++---<br>
&gt; &gt; ------<br>
&gt; &gt; - grub-core/fs/udf.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 41 +++++++++++++++++++++----------<br>
&gt; &gt; --<br>
&gt; &gt; - grub-core/fs/xfs.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 11 +++++----<br>
&gt; &gt; - grub-core/fs/zfs/zfs.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 22 +=
+++++++++++------<br>
&gt; &gt; - grub-core/fs/zfs/zfscrypt.c=C2=A0 =C2=A0 |=C2=A0 7 +++++-<br>
&gt; &gt; - grub-core/lib/arg.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 20 +++++++++++++++--<br>
&gt; &gt; - grub-core/loader/i386/bsd.c=C2=A0 =C2=A0 |=C2=A0 8 ++++++-<br>
&gt; &gt; - grub-core/net/dns.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=
=C2=A0 9 +++++++-<br>
&gt; &gt; - grub-core/normal/charset.c=C2=A0 =C2=A0 =C2=A0| 10 +++++++--<b=
r>
&gt; &gt; - grub-core/normal/cmdline.c=C2=A0 =C2=A0 =C2=A0| 14 ++++++++++-=
-<br>
&gt; &gt; - grub-core/normal/menu_entry.c=C2=A0 | 13 +++++++++--<br>
&gt; &gt; - grub-core/script/argv.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 16 ++++++=
+++++--<br>
&gt; &gt; - grub-core/script/lexer.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 21 ++++++=
++++++++---<br>
&gt; &gt; - grub-core/video/bitmap.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 25 ++++++=
+++++++--------<br>
&gt; &gt; - grub-core/video/readers/png.c=C2=A0 | 13 +++++++++--<br>
&gt; &gt; - 23 files changed, 382 insertions(+), 113 deletions(-)<br>
&gt; &gt; -<br>
&gt; &gt; -diff --git a/grub-core/commands/legacycfg.c b/grub-<br>
&gt; &gt; core/commands/legacycfg.c<br>
&gt; &gt; -index 5e3ec0d..cc5971f 100644<br>
&gt; &gt; ---- a/grub-core/commands/legacycfg.c<br>
&gt; &gt; -+++ b/grub-core/commands/legacycfg.c<br>
&gt; &gt; -@@ -32,6 +32,7 @@<br>
&gt; &gt; - #include &lt;grub/auth.h&gt;<br>
&gt; &gt; - #include &lt;grub/disk.h&gt;<br>
&gt; &gt; - #include &lt;grub/partition.h&gt;<br>
&gt; &gt; -+#include &lt;grub/safemath.h&gt;<br>
&gt; &gt; - <br>
&gt; &gt; - GRUB_MOD_LICENSE (&quot;GPLv3+&quot;);<br>
&gt; &gt; - <br>
&gt; &gt; -@@ -104,13 +105,22 @@ legacy_file (const char *filename)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (newsuffix)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *t;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_size_t sz;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (grub_add (grub_strlen (=
suffix), grub_strlen<br>
&gt; &gt; (newsuffix), &amp;sz) ||<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_add (sz,=
 1, &amp;sz))<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_errno =
=3D GRUB_ERR_OUT_OF_RANGE;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail_0;<=
br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; -+<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0t =3D suffix;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 suffix =3D grub_realloc (su=
ffix, grub_strlen (suffix)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+ grub_strlen (news=
uffix) + 1);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 suffix =3D grub_realloc (su=
ffix, sz);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!suffix)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_fre=
e (t);<br>
&gt; &gt; -+<br>
&gt; &gt; -+ fail_0:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_fre=
e (entrysrc);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_fre=
e (parsed);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_fre=
e (newsuffix);<br>
&gt; &gt; -@@ -154,13 +164,22 @@ legacy_file (const char *filename)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *t;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_size_t sz;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (grub_add (grub_s=
trlen (entrysrc), grub_strlen<br>
&gt; &gt; (parsed), &amp;sz) ||<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_a=
dd (sz, 1, &amp;sz))<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_e=
rrno =3D GRUB_ERR_OUT_OF_RANGE;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto f=
ail_1;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0t =3D entrysrc;=
<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 entrysrc =3D grub_re=
alloc (entrysrc, grub_strlen<br>
&gt; &gt; (entrysrc)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+ gru=
b_strlen (parsed) + 1);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 entrysrc =3D grub_re=
alloc (entrysrc, sz);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!entrysrc)<=
br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g=
rub_free (t);<br>
&gt; &gt; -+<br>
&gt; &gt; -+ fail_1:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g=
rub_free (parsed);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g=
rub_free (suffix);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r=
eturn grub_errno;<br>
&gt; &gt; -diff --git a/grub-core/commands/wildcard.c b/grub-<br>
&gt; &gt; core/commands/wildcard.c<br>
&gt; &gt; -index 4a106ca..cc32903 100644<br>
&gt; &gt; ---- a/grub-core/commands/wildcard.c<br>
&gt; &gt; -+++ b/grub-core/commands/wildcard.c<br>
&gt; &gt; -@@ -23,6 +23,7 @@<br>
&gt; &gt; - #include &lt;grub/file.h&gt;<br>
&gt; &gt; - #include &lt;grub/device.h&gt;<br>
&gt; &gt; - #include &lt;grub/script_sh.h&gt;<br>
&gt; &gt; -+#include &lt;grub/safemath.h&gt;<br>
&gt; &gt; - <br>
&gt; &gt; - #include &lt;regex.h&gt;<br>
&gt; &gt; - <br>
&gt; &gt; -@@ -48,6 +49,7 @@ merge (char **dest, char **ps)<br>
&gt; &gt; -=C2=A0 =C2=A0int i;<br>
&gt; &gt; -=C2=A0 =C2=A0int j;<br>
&gt; &gt; -=C2=A0 =C2=A0char **p;<br>
&gt; &gt; -+=C2=A0 grub_size_t sz;<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0if (! dest)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return ps;<br>
&gt; &gt; -@@ -60,7 +62,12 @@ merge (char **dest, char **ps)<br>
&gt; &gt; -=C2=A0 =C2=A0for (j =3D 0; ps[j]; j++)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0;<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 p =3D grub_realloc (dest, sizeof (char*) * (i + j + 1))=
;<br>
&gt; &gt; -+=C2=A0 if (grub_add (i, j, &amp;sz) ||<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 grub_add (sz, 1, &amp;sz) ||<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 grub_mul (sz, sizeof (char *), &amp;sz))<=
br>
&gt; &gt; -+=C2=A0 =C2=A0 return dest;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 p =3D grub_realloc (dest, sz);<br>
&gt; &gt; -=C2=A0 =C2=A0if (! p)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (dest);<br>
&gt; &gt; -@@ -115,8 +122,15 @@ make_regex (const char *start, const char =
*end,<br>
&gt; &gt; regex_t *regexp)<br>
&gt; &gt; -=C2=A0 =C2=A0char ch;<br>
&gt; &gt; -=C2=A0 =C2=A0int i =3D 0;<br>
&gt; &gt; -=C2=A0 =C2=A0unsigned len =3D end - start;<br>
&gt; &gt; --=C2=A0 char *buffer =3D grub_malloc (len * 2 + 2 + 1); /* wors=
t case size.<br>
&gt; &gt; */<br>
&gt; &gt; -+=C2=A0 char *buffer;<br>
&gt; &gt; -+=C2=A0 grub_size_t sz;<br>
&gt; &gt; - <br>
&gt; &gt; -+=C2=A0 /* Worst case size is (len * 2 + 2 + 1). */<br>
&gt; &gt; -+=C2=A0 if (grub_mul (len, 2, &amp;sz) ||<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 grub_add (sz, 3, &amp;sz))<br>
&gt; &gt; -+=C2=A0 =C2=A0 return 1;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 buffer =3D grub_malloc (sz);<br>
&gt; &gt; -=C2=A0 =C2=A0if (! buffer)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return 1;<br>
&gt; &gt; - <br>
&gt; &gt; -@@ -226,6 +240,7 @@ match_devices_iter (const char *name, void<=
br>
&gt; &gt; *data)<br>
&gt; &gt; -=C2=A0 =C2=A0struct match_devices_ctx *ctx =3D data;<br>
&gt; &gt; -=C2=A0 =C2=A0char **t;<br>
&gt; &gt; -=C2=A0 =C2=A0char *buffer;<br>
&gt; &gt; -+=C2=A0 grub_size_t sz;<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0/* skip partitions if asked to. */<br>
&gt; &gt; -=C2=A0 =C2=A0if (ctx-&gt;noparts &amp;&amp; grub_strchr (name, =
&#39;,&#39;))<br>
&gt; &gt; -@@ -239,11 +254,16 @@ match_devices_iter (const char *name, voi=
d<br>
&gt; &gt; *data)<br>
&gt; &gt; -=C2=A0 =C2=A0if (regexec (ctx-&gt;regexp, buffer, 0, 0, 0))<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_dprintf (&quot;expand&quot;, &q=
uot;not matched\n&quot;);<br>
&gt; &gt; -+ fail:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (buffer);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 t =3D grub_realloc (ctx-&gt;devs, sizeof (char*) * (ctx=
-&gt;ndev + 2));<br>
&gt; &gt; -+=C2=A0 if (grub_add (ctx-&gt;ndev, 2, &amp;sz) ||<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 grub_mul (sz, sizeof (char *), &amp;sz))<=
br>
&gt; &gt; -+=C2=A0 =C2=A0 goto fail;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 t =3D grub_realloc (ctx-&gt;devs, sz);<br>
&gt; &gt; -=C2=A0 =C2=A0if (! t)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (buffer);<br>
&gt; &gt; -@@ -300,6 +320,7 @@ match_files_iter (const char *name,<br>
&gt; &gt; -=C2=A0 =C2=A0struct match_files_ctx *ctx =3D data;<br>
&gt; &gt; -=C2=A0 =C2=A0char **t;<br>
&gt; &gt; -=C2=A0 =C2=A0char *buffer;<br>
&gt; &gt; -+=C2=A0 grub_size_t sz;<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0/* skip . and .. names */<br>
&gt; &gt; -=C2=A0 =C2=A0if (grub_strcmp(&quot;.&quot;, name) =3D=3D 0 || g=
rub_strcmp(&quot;..&quot;, name) =3D=3D 0)<br>
&gt; &gt; -@@ -315,9 +336,14 @@ match_files_iter (const char *name,<br>
&gt; &gt; -=C2=A0 =C2=A0if (! buffer)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return 1;<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 t =3D grub_realloc (ctx-&gt;files, sizeof (char*) * (ct=
x-&gt;nfile + 2));<br>
&gt; &gt; --=C2=A0 if (! t)<br>
&gt; &gt; -+=C2=A0 if (grub_add (ctx-&gt;nfile, 2, &amp;sz) ||<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 grub_mul (sz, sizeof (char *), &amp;sz))<=
br>
&gt; &gt; -+=C2=A0 =C2=A0 goto fail;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 t =3D grub_realloc (ctx-&gt;files, sz);<br>
&gt; &gt; -+=C2=A0 if (!t)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -+ fail:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (buffer);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; -diff --git a/grub-core/disk/ldm.c b/grub-core/disk/ldm.c<br>
&gt; &gt; -index e632370..58f8a53 100644<br>
&gt; &gt; ---- a/grub-core/disk/ldm.c<br>
&gt; &gt; -+++ b/grub-core/disk/ldm.c<br>
&gt; &gt; -@@ -25,6 +25,7 @@<br>
&gt; &gt; - #include &lt;grub/msdos_partition.h&gt;<br>
&gt; &gt; - #include &lt;grub/gpt_partition.h&gt;<br>
&gt; &gt; - #include &lt;grub/i18n.h&gt;<br>
&gt; &gt; -+#include &lt;grub/safemath.h&gt;<br>
&gt; &gt; - <br>
&gt; &gt; - #ifdef GRUB_UTIL<br>
&gt; &gt; - #include &lt;grub/emu/misc.h&gt;<br>
&gt; &gt; -@@ -289,6 +290,7 @@ make_vg (grub_disk_t disk,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct grub_ldm_vblk vblk[GRUB_DISK_=
SECTOR_SIZE<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/ sizeof (struct grub_ldm_=
vblk)];<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned i;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 grub_size_t sz;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D grub_disk_read (disk, cursec=
, 0,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(vblk), &amp;vblk);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (err)<br>
&gt; &gt; -@@ -350,7 +352,13 @@ make_vg (grub_disk_t disk,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (lv);=
<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail2;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 lv-&gt;name =3D grub_malloc (*ptr =
+ 1);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (grub_add (*ptr, 1, &amp;sz))<b=
r>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_free (lv-&gt;in=
ternal_id);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_free (lv);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail2;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 lv-&gt;name =3D grub_malloc (sz);<=
br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!lv-&gt;name)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (lv-&=
gt;internal_id);<br>
&gt; &gt; -@@ -599,10 +607,13 @@ make_vg (grub_disk_t disk,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (lv-&gt;segments-&gt;node_=
alloc =3D=3D lv-&gt;segments-&gt;node_count)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *t;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lv-&gt;segments-&gt;=
node_alloc *=3D 2; <br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t =3D grub_realloc (=
lv-&gt;segments-&gt;nodes,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof (*lv-&gt;segments-&gt;nod=
es)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * lv-&gt;segments-&gt;node_alloc=
);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_size_t sz;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (grub_mul (lv-&gt=
;segments-&gt;node_alloc, 2, &amp;lv-<br>
&gt; &gt; &gt; segments-&gt;node_alloc) ||<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_m=
ul (lv-&gt;segments-&gt;node_alloc, sizeof (*lv-<br>
&gt; &gt; &gt; segments-&gt;nodes), &amp;sz))<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail2;<b=
r>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t =3D grub_realloc (=
lv-&gt;segments-&gt;nodes, sz);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!t)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fai=
l2;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lv-&gt;segments=
-&gt;nodes =3D t;<br>
&gt; &gt; -@@ -723,10 +734,13 @@ make_vg (grub_disk_t disk,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (comp-&gt;se=
gment_alloc =3D=3D comp-&gt;segment_count)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0v=
oid *t;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 comp-&=
gt;segment_alloc *=3D 2;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t =3D =
grub_realloc (comp-&gt;segments,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 comp-&gt;segment_a=
lloc<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * sizeof (*comp-&g=
t;segments));<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_s=
ize_t sz;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (gr=
ub_mul (comp-&gt;segment_alloc, 2, &amp;comp-<br>
&gt; &gt; &gt; segment_alloc) ||<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 grub_mul (comp-&gt;segment_alloc, sizeof (*comp-<br>
&gt; &gt; &gt; segments), &amp;sz))<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 goto fail2;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t =3D =
grub_realloc (comp-&gt;segments, sz);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i=
f (!t)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0goto fail2;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c=
omp-&gt;segments =3D t;<br>
&gt; &gt; -diff --git a/grub-core/font/font.c b/grub-core/font/font.c<br>
&gt; &gt; -index 8e118b3..5edb477 100644<br>
&gt; &gt; ---- a/grub-core/font/font.c<br>
&gt; &gt; -+++ b/grub-core/font/font.c<br>
&gt; &gt; -@@ -30,6 +30,7 @@<br>
&gt; &gt; - #include &lt;grub/unicode.h&gt;<br>
&gt; &gt; - #include &lt;grub/fontformat.h&gt;<br>
&gt; &gt; - #include &lt;grub/env.h&gt;<br>
&gt; &gt; -+#include &lt;grub/safemath.h&gt;<br>
&gt; &gt; - <br>
&gt; &gt; - GRUB_MOD_LICENSE (&quot;GPLv3+&quot;);<br>
&gt; &gt; - <br>
&gt; &gt; -@@ -360,9 +361,13 @@ static char *<br>
&gt; &gt; - read_section_as_string (struct font_file_section *section)<br>
&gt; &gt; - {<br>
&gt; &gt; -=C2=A0 =C2=A0char *str;<br>
&gt; &gt; -+=C2=A0 grub_size_t sz;<br>
&gt; &gt; -=C2=A0 =C2=A0grub_ssize_t ret;<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 str =3D grub_malloc (section-&gt;length + 1);<br>
&gt; &gt; -+=C2=A0 if (grub_add (section-&gt;length, 1, &amp;sz))<br>
&gt; &gt; -+=C2=A0 =C2=A0 return NULL;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 str =3D grub_malloc (sz);<br>
&gt; &gt; -=C2=A0 =C2=A0if (!str)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt; - <br>
&gt; &gt; -diff --git a/grub-core/fs/btrfs.c b/grub-core/fs/btrfs.c<br>
&gt; &gt; -index 11272ef..2b65bd5 100644<br>
&gt; &gt; ---- a/grub-core/fs/btrfs.c<br>
&gt; &gt; -+++ b/grub-core/fs/btrfs.c<br>
&gt; &gt; -@@ -40,6 +40,7 @@<br>
&gt; &gt; - #include &lt;grub/btrfs.h&gt;<br>
&gt; &gt; - #include &lt;grub/crypto.h&gt;<br>
&gt; &gt; - #include &lt;grub/diskfilter.h&gt;<br>
&gt; &gt; -+#include &lt;grub/safemath.h&gt;<br>
&gt; &gt; - <br>
&gt; &gt; - GRUB_MOD_LICENSE (&quot;GPLv3+&quot;);<br>
&gt; &gt; - <br>
&gt; &gt; -@@ -329,9 +330,13 @@ save_ref (struct grub_btrfs_leaf_descripto=
r<br>
&gt; &gt; *desc,<br>
&gt; &gt; -=C2=A0 =C2=A0if (desc-&gt;allocated &lt; desc-&gt;depth)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0void *newdata;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 desc-&gt;allocated *=3D 2;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 newdata =3D grub_realloc (desc-&gt;data, =
sizeof (desc-&gt;data[0])<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * desc-&gt;allocated);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 grub_size_t sz;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 if (grub_mul (desc-&gt;allocated, 2, &amp=
;desc-&gt;allocated) ||<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_mul (desc-&gt;allocated, size=
of (desc-&gt;data[0]), &amp;sz))<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 return GRUB_ERR_OUT_OF_RANGE;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 newdata =3D grub_realloc (desc-&gt;data, =
sz);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!newdata)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return grub_errno;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0desc-&gt;data =3D newdata;<br>
&gt; &gt; -@@ -622,16 +627,21 @@ find_device (struct grub_btrfs_data *data=
,<br>
&gt; &gt; grub_uint64_t id)<br>
&gt; &gt; -=C2=A0 =C2=A0if (data-&gt;n_devices_attached &gt; data-&gt;n_de=
vices_allocated)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0void *tmp;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 data-&gt;n_devices_allocated =3D 2 * data=
-&gt;n_devices_attached + 1;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 data-&gt;devices_attached<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =3D grub_realloc (tmp =3D data-&gt;device=
s_attached,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 data-&gt;n_devices_allocated<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 * sizeof (data-&gt;devices_attached[0]));<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 grub_size_t sz;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 if (grub_mul (data-&gt;n_devices_attached=
, 2, &amp;data-<br>
&gt; &gt; &gt; n_devices_allocated) ||<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_add (data-&gt;n_devices_alloc=
ated, 1, &amp;data-<br>
&gt; &gt; &gt; n_devices_allocated) ||<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_mul (data-&gt;n_devices_alloc=
ated, sizeof (data-<br>
&gt; &gt; &gt; devices_attached[0]), &amp;sz))<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 goto fail;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 data-&gt;devices_attached =3D grub_reallo=
c (tmp =3D data-<br>
&gt; &gt; &gt; devices_attached, sz);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!data-&gt;devices_attached)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 data-&gt;devices_attached =3D tmp;=
<br>
&gt; &gt; -+<br>
&gt; &gt; -+ fail:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ctx.dev_found)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_device_close (ctx=
.dev_found);<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 data-&gt;devices_attached =3D tmp;=
<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; -diff --git a/grub-core/fs/ext2.c b/grub-core/fs/ext2.c<br>
&gt; &gt; -index 9b38980..ac33bcd 100644<br>
&gt; &gt; ---- a/grub-core/fs/ext2.c<br>
&gt; &gt; -+++ b/grub-core/fs/ext2.c<br>
&gt; &gt; -@@ -46,6 +46,7 @@<br>
&gt; &gt; - #include &lt;grub/dl.h&gt;<br>
&gt; &gt; - #include &lt;grub/types.h&gt;<br>
&gt; &gt; - #include &lt;grub/fshelp.h&gt;<br>
&gt; &gt; -+#include &lt;grub/safemath.h&gt;<br>
&gt; &gt; - <br>
&gt; &gt; - GRUB_MOD_LICENSE (&quot;GPLv3+&quot;);<br>
&gt; &gt; - <br>
&gt; &gt; -@@ -703,6 +704,7 @@ grub_ext2_read_symlink (grub_fshelp_node_t =
node)<br>
&gt; &gt; - {<br>
&gt; &gt; -=C2=A0 =C2=A0char *symlink;<br>
&gt; &gt; -=C2=A0 =C2=A0struct grub_fshelp_node *diro =3D node;<br>
&gt; &gt; -+=C2=A0 grub_size_t sz;<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0if (! diro-&gt;inode_read)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -@@ -717,7 +719,13 @@ grub_ext2_read_symlink (grub_fshelp_node_t=
<br>
&gt; &gt; node)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 symlink =3D grub_malloc (grub_le_to_cpu32 (diro-&gt;ino=
de.size) + 1);<br>
&gt; &gt; -+=C2=A0 if (grub_add (grub_le_to_cpu32 (diro-&gt;inode.size), 1=
, &amp;sz))<br>
&gt; &gt; -+=C2=A0 =C2=A0 {<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 grub_error (GRUB_ERR_OUT_OF_RANGE, N_(&qu=
ot;overflow is<br>
&gt; &gt; detected&quot;));<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 return NULL;<br>
&gt; &gt; -+=C2=A0 =C2=A0 }<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 symlink =3D grub_malloc (sz);<br>
&gt; &gt; -=C2=A0 =C2=A0if (! symlink)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt; - <br>
&gt; &gt; -diff --git a/grub-core/fs/iso9660.c b/grub-core/fs/iso9660.c<br=
>
&gt; &gt; -index 4f1b52a..7ba5b30 100644<br>
&gt; &gt; ---- a/grub-core/fs/iso9660.c<br>
&gt; &gt; -+++ b/grub-core/fs/iso9660.c<br>
&gt; &gt; -@@ -28,6 +28,7 @@<br>
&gt; &gt; - #include &lt;grub/fshelp.h&gt;<br>
&gt; &gt; - #include &lt;grub/charset.h&gt;<br>
&gt; &gt; - #include &lt;grub/datetime.h&gt;<br>
&gt; &gt; -+#include &lt;grub/safemath.h&gt;<br>
&gt; &gt; - <br>
&gt; &gt; - GRUB_MOD_LICENSE (&quot;GPLv3+&quot;);<br>
&gt; &gt; - <br>
&gt; &gt; -@@ -531,8 +532,13 @@ add_part (struct iterate_dir_ctx *ctx,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int len2)<br>
&gt; &gt; - {<br>
&gt; &gt; -=C2=A0 =C2=A0int size =3D ctx-&gt;symlink ? grub_strlen (ctx-&g=
t;symlink) : 0;<br>
&gt; &gt; -+=C2=A0 grub_size_t sz;<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 ctx-&gt;symlink =3D grub_realloc (ctx-&gt;symlink, size=
 + len2 + 1);<br>
&gt; &gt; -+=C2=A0 if (grub_add (size, len2, &amp;sz) ||<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 grub_add (sz, 1, &amp;sz))<br>
&gt; &gt; -+=C2=A0 =C2=A0 return;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 ctx-&gt;symlink =3D grub_realloc (ctx-&gt;symlink, sz);=
<br>
&gt; &gt; -=C2=A0 =C2=A0if (! ctx-&gt;symlink)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return;<br>
&gt; &gt; - <br>
&gt; &gt; -@@ -560,17 +566,24 @@ susp_iterate_dir (struct<br>
&gt; &gt; grub_iso9660_susp_entry *entry,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_size_t off =3D 0, csize =
=
=3D 1;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *old;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_size_t sz;<br>
&gt; &gt; -+<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0csize =3D entry-&gt;len - 5;<=
br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0old =3D ctx-&gt;filename;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ctx-&gt;filename_alloc)<b=
r>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0off =3D grub_st=
rlen (ctx-&gt;filename);<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;filename =3D=
 grub_realloc (ctx-&gt;filename, csize +<br>
&gt; &gt; off + 1);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (grub_add (csize,=
 off, &amp;sz) ||<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_a=
dd (sz, 1, &amp;sz))<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return GRUB_E=
RR_OUT_OF_RANGE;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;filename =3D=
 grub_realloc (ctx-&gt;filename, sz);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0off =3D 0;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;filename =3D=
 grub_zalloc (csize + 1);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (grub_add (csize,=
 1, &amp;sz))<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return GRUB_E=
RR_OUT_OF_RANGE;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;filename =3D=
 grub_zalloc (sz);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ctx-&gt;filename)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -@@ -776,14 +789,18 @@ grub_iso9660_iterate_dir (grub_fshelp_nod=
e_t<br>
&gt; &gt; dir,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (node-&gt;have_dire=
nts &gt;=3D node-&gt;alloc_dirents)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct g=
rub_fshelp_node *new_node;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 node-&gt;allo=
c_dirents *=3D 2;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new_node =3D =
grub_realloc (node, <br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0sizeof (struct<br>
&gt; &gt; grub_fshelp_node)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0+ ((node-&gt;alloc_dirents<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0- ARRAY_SIZE (node-<br>
&gt; &gt; &gt; dirents))<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * sizeof (node-<br>
&gt; &gt; &gt; dirents[0])));<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_size_t s=
z;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (grub_mul =
(node-&gt;alloc_dirents, 2, &amp;node-<br>
&gt; &gt; &gt; alloc_dirents) ||<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 grub_sub (node-&gt;alloc_dirents, ARRAY_SIZE (node-<br>
&gt; &gt; &gt; dirents), &amp;sz) ||<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 grub_mul (sz, sizeof (node-&gt;dirents[0]), &amp;sz) ||<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 grub_add (sz, sizeof (struct grub_fshelp_node),<br>
&gt; &gt; &amp;sz))<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto f=
ail_0;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new_node =3D =
grub_realloc (node, sz);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!new=
_node)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{=
<br>
&gt; &gt; -+ fail_0:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0if (ctx.filename_alloc)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0grub_free (ctx.filename);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0grub_free (node);<br>
&gt; &gt; -@@ -799,14 +816,18 @@ grub_iso9660_iterate_dir (grub_fshelp_nod=
e_t<br>
&gt; &gt; dir,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* sizeof=
 (node-&gt;dirents[0]) &lt; grub_strlen<br>
&gt; &gt; (ctx.symlink) + 1)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct g=
rub_fshelp_node *new_node;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new_node =3D =
grub_realloc (node,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0sizeof (struct<br>
&gt; &gt; grub_fshelp_node)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0+ ((node-&gt;alloc_dirents<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0- ARRAY_SIZE (node-<br>
&gt; &gt; &gt; dirents))<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * sizeof (node-<br>
&gt; &gt; &gt; dirents[0]))<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0+ grub_strlen (ctx.symlink)<br>
&gt; &gt; + 1);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_size_t s=
z;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (grub_sub =
(node-&gt;alloc_dirents, ARRAY_SIZE (node-<br>
&gt; &gt; &gt; dirents), &amp;sz) ||<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 grub_mul (sz, sizeof (node-&gt;dirents[0]), &amp;sz) ||<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 grub_add (sz, sizeof (struct grub_fshelp_node) +<br>
&gt; &gt; 1, &amp;sz) ||<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 grub_add (sz, grub_strlen (ctx.symlink), &amp;sz))<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto f=
ail_1;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new_node =3D =
grub_realloc (node, sz);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!new=
_node)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{=
<br>
&gt; &gt; -+ fail_1:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0if (ctx.filename_alloc)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0grub_free (ctx.filename);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0grub_free (node);<br>
&gt; &gt; -diff --git a/grub-core/fs/sfs.c b/grub-core/fs/sfs.c<br>
&gt; &gt; -index 90f7fb3..de2b107 100644<br>
&gt; &gt; ---- a/grub-core/fs/sfs.c<br>
&gt; &gt; -+++ b/grub-core/fs/sfs.c<br>
&gt; &gt; -@@ -26,6 +26,7 @@<br>
&gt; &gt; - #include &lt;grub/types.h&gt;<br>
&gt; &gt; - #include &lt;grub/fshelp.h&gt;<br>
&gt; &gt; - #include &lt;grub/charset.h&gt;<br>
&gt; &gt; -+#include &lt;grub/safemath.h&gt;<br>
&gt; &gt; - <br>
&gt; &gt; - GRUB_MOD_LICENSE (&quot;GPLv3+&quot;);<br>
&gt; &gt; - <br>
&gt; &gt; -@@ -307,10 +308,15 @@ grub_sfs_read_block (grub_fshelp_node_t n=
ode,<br>
&gt; &gt; grub_disk_addr_t fileblock)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (node-&gt;cache &amp;&amp; node-&=
gt;cache_size &gt;=3D node-&gt;cache_allocated)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct cache_entry *e =3D nod=
e-&gt;cache;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 e =3D grub_realloc (node-&gt;cache=
,node-&gt;cache_allocated * 2<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * sizeof (e[0]));<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_size_t sz;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (grub_mul (node-&gt;cache_alloc=
ated, 2 * sizeof (e[0]),<br>
&gt; &gt; &amp;sz))<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 e =3D grub_realloc (node-&gt;cache=
, sz);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!e)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -+ fail:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_errno =3D =
0;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (node=
-&gt;cache);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0node-&gt;cache =
=
=3D 0;<br>
&gt; &gt; -@@ -477,10 +483,16 @@ grub_sfs_create_node (struct grub_fshelp_=
node<br>
&gt; &gt; **node,<br>
&gt; &gt; -=C2=A0 =C2=A0grub_size_t len =3D grub_strlen (name);<br>
&gt; &gt; -=C2=A0 =C2=A0grub_uint8_t *name_u8;<br>
&gt; &gt; -=C2=A0 =C2=A0int ret;<br>
&gt; &gt; -+=C2=A0 grub_size_t sz;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 if (grub_mul (len, GRUB_MAX_UTF8_PER_LATIN1, &amp;sz) |=
|<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 grub_add (sz, 1, &amp;sz))<br>
&gt; &gt; -+=C2=A0 =C2=A0 return 1;<br>
&gt; &gt; -+<br>
&gt; &gt; -=C2=A0 =C2=A0*node =3D grub_malloc (sizeof (**node));<br>
&gt; &gt; -=C2=A0 =C2=A0if (!*node)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return 1;<br>
&gt; &gt; --=C2=A0 name_u8 =3D grub_malloc (len * GRUB_MAX_UTF8_PER_LATIN1=
 + 1);<br>
&gt; &gt; -+=C2=A0 name_u8 =3D grub_malloc (sz);<br>
&gt; &gt; -=C2=A0 =C2=A0if (!name_u8)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (*node);<br>
&gt; &gt; -@@ -724,8 +736,13 @@ grub_sfs_label (grub_device_t device, char=
<br>
&gt; &gt; **label)<br>
&gt; &gt; -=C2=A0 =C2=A0data =3D grub_sfs_mount (disk);<br>
&gt; &gt; -=C2=A0 =C2=A0if (data)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 grub_size_t len =3D grub_strlen (data-&gt=
;label);<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 *label =3D grub_malloc (len * GRUB_MAX_UT=
F8_PER_LATIN1 + 1);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 grub_size_t sz, len =3D grub_strlen (data=
-&gt;label);<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 if (grub_mul (len, GRUB_MAX_UTF8_PER_LATI=
N1, &amp;sz) ||<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_add (sz, 1, &amp;sz))<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 return GRUB_ERR_OUT_OF_RANGE;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 *label =3D grub_malloc (sz);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (*label)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0*grub_latin1_to_utf8 ((grub_uint8_t =
*) *label,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(const grub_uint8_t *) data-&gt;l=
abel,<br>
&gt; &gt; -diff --git a/grub-core/fs/squash4.c b/grub-core/fs/squash4.c<br=
>
&gt; &gt; -index 95d5c1e..7851238 100644<br>
&gt; &gt; ---- a/grub-core/fs/squash4.c<br>
&gt; &gt; -+++ b/grub-core/fs/squash4.c<br>
&gt; &gt; -@@ -26,6 +26,7 @@<br>
&gt; &gt; - #include &lt;grub/types.h&gt;<br>
&gt; &gt; - #include &lt;grub/fshelp.h&gt;<br>
&gt; &gt; - #include &lt;grub/deflate.h&gt;<br>
&gt; &gt; -+#include &lt;grub/safemath.h&gt;<br>
&gt; &gt; - #include &lt;minilzo.h&gt;<br>
&gt; &gt; - <br>
&gt; &gt; - #include &quot;xz.h&quot;<br>
&gt; &gt; -@@ -459,7 +460,17 @@ grub_squash_read_symlink (grub_fshelp_node=
_t<br>
&gt; &gt; node)<br>
&gt; &gt; - {<br>
&gt; &gt; -=C2=A0 =C2=A0char *ret;<br>
&gt; &gt; -=C2=A0 =C2=A0grub_err_t err;<br>
&gt; &gt; --=C2=A0 ret =3D grub_malloc (grub_le_to_cpu32 (node-&gt;ino.sym=
link.namelen) +<br>
&gt; &gt; 1);<br>
&gt; &gt; -+=C2=A0 grub_size_t sz;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 if (grub_add (grub_le_to_cpu32 (node-&gt;ino.symlink.na=
melen), 1,<br>
&gt; &gt; &amp;sz))<br>
&gt; &gt; -+=C2=A0 =C2=A0 {<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 grub_error (GRUB_ERR_OUT_OF_RANGE, N_(&qu=
ot;overflow is<br>
&gt; &gt; detected&quot;));<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 return NULL;<br>
&gt; &gt; -+=C2=A0 =C2=A0 }<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 ret =3D grub_malloc (sz);<br>
&gt; &gt; -+=C2=A0 if (!ret)<br>
&gt; &gt; -+=C2=A0 =C2=A0 return NULL;<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0err =3D read_chunk (node-&gt;data, ret,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0grub_le_to_cpu32 (node-&gt;ino.symlink.namelen),<br>
&gt; &gt; -@@ -506,11 +517,16 @@ grub_squash_iterate_dir (grub_fshelp_node=
_t<br>
&gt; &gt; dir,<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0grub_fshelp_node_t node;<br>
&gt; &gt; --=C2=A0 =C2=A0 node =3D grub_malloc (sizeof (*node) + dir-&gt;s=
tsize * sizeof (dir-<br>
&gt; &gt; &gt; stack[0]));<br>
&gt; &gt; -+=C2=A0 =C2=A0 grub_size_t sz;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 if (grub_mul (dir-&gt;stsize, sizeof (dir-&gt;st=
ack[0]), &amp;sz) ||<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 grub_add (sz, sizeof (*node), &amp;sz))<b=
r>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 node =3D grub_malloc (sz);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if (!node)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt; --=C2=A0 =C2=A0 grub_memcpy (node, dir,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof =
(*node) + dir-&gt;stsize * sizeof (dir-<br>
&gt; &gt; &gt; stack[0]));<br>
&gt; &gt; -+=C2=A0 =C2=A0 grub_memcpy (node, dir, sz);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if (hook (&quot;.&quot;, GRUB_FSHELP_DIR, n=
ode, hook_data))<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
&gt; &gt; - <br>
&gt; &gt; -@@ -518,12 +534,15 @@ grub_squash_iterate_dir (grub_fshelp_node=
_t<br>
&gt; &gt; dir,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_err_t err;<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 node =3D grub_malloc (sizeof (*node) + di=
r-&gt;stsize * sizeof<br>
&gt; &gt; (dir-&gt;stack[0]));<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 if (grub_mul (dir-&gt;stsize, sizeof (dir=
-&gt;stack[0]), &amp;sz) ||<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_add (sz, sizeof (*node=
), &amp;sz))<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 node =3D grub_malloc (sz);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!node)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 grub_memcpy (node, dir,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0sizeof (*node) + dir-&gt;stsize * sizeof (dir-<br>
&gt; &gt; &gt; stack[0]));<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 grub_memcpy (node, dir, sz);<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0node-&gt;stsize--;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D read_chunk (dir-&gt;data, &a=
mp;node-&gt;ino, sizeof (node-&gt;ino),<br>
&gt; &gt; -@@ -557,6 +576,7 @@ grub_squash_iterate_dir (grub_fshelp_node_t=
 dir,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enum grub_fshelp_filetype fil=
etype =3D GRUB_FSHELP_REG;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct grub_squash_dirent di;=
<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct grub_squash_inode ino;=
<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_size_t sz;<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D read_chunk (dir-&gt;d=
ata, &amp;di, sizeof (di),<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_le_to_cpu64 (dir-&gt;data-<br>
&gt; &gt; &gt; sb.diroffset)<br>
&gt; &gt; -@@ -589,13 +609,16 @@ grub_squash_iterate_dir (grub_fshelp_node=
_t<br>
&gt; &gt; dir,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (grub_le_to_cpu16 (di.type=
) =3D=3D SQUASH_TYPE_SYMLINK)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0filetype =3D GRUB_FSHE=
LP_SYMLINK;<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 node =3D grub_malloc (sizeof (*nod=
e)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 + (dir-&gt;stsize + 1) * sizeof (dir-<b=
r>
&gt; &gt; &gt; stack[0]));<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (grub_add (dir-&gt;stsize, 1, &=
amp;sz) ||<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_mul (sz, sizeof=
 (dir-&gt;stack[0]), &amp;sz) ||<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_add (sz, sizeof=
 (*node), &amp;sz))<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 node =3D grub_malloc (sz);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (! node)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_memcpy (node, dir,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0sizeof (*node) + dir-&gt;stsize * sizeof (dir-<br>
&gt; &gt; &gt; stack[0]));<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_memcpy (node, dir, sz - sizeo=
f(dir-&gt;stack[0]));<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0node-&gt;ino =3D ino;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0node-&gt;stack[node-&gt;stsiz=
e].ino_chunk =3D grub_le_to_cpu32<br>
&gt; &gt; (dh.ino_chunk);<br>
&gt; &gt; -diff --git a/grub-core/fs/udf.c b/grub-core/fs/udf.c<br>
&gt; &gt; -index a837616..21ac7f4 100644<br>
&gt; &gt; ---- a/grub-core/fs/udf.c<br>
&gt; &gt; -+++ b/grub-core/fs/udf.c<br>
&gt; &gt; -@@ -28,6 +28,7 @@<br>
&gt; &gt; - #include &lt;grub/charset.h&gt;<br>
&gt; &gt; - #include &lt;grub/datetime.h&gt;<br>
&gt; &gt; - #include &lt;grub/udf.h&gt;<br>
&gt; &gt; -+#include &lt;grub/safemath.h&gt;<br>
&gt; &gt; - <br>
&gt; &gt; - GRUB_MOD_LICENSE (&quot;GPLv3+&quot;);<br>
&gt; &gt; - <br>
&gt; &gt; -@@ -890,9 +891,19 @@ read_string (const grub_uint8_t *raw,<br>
&gt; &gt; grub_size_t sz, char *outbuf)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0utf16[i] =3D (raw[2 * i + 1] &lt;&lt=
; 8) | raw[2*i + 2];<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; -=C2=A0 =C2=A0if (!outbuf)<br>
&gt; &gt; --=C2=A0 =C2=A0 outbuf =3D grub_malloc (utf16len * GRUB_MAX_UTF8=
_PER_UTF16 + 1);<br>
&gt; &gt; -+=C2=A0 =C2=A0 {<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 grub_size_t size;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 if (grub_mul (utf16len, GRUB_MAX_UTF8_PER=
_UTF16, &amp;size) ||<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_add (size, 1, &amp;size))<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 goto fail;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 outbuf =3D grub_malloc (size);<br>
&gt; &gt; -+=C2=A0 =C2=A0 }<br>
&gt; &gt; -=C2=A0 =C2=A0if (outbuf)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0*grub_utf16_to_utf8 ((grub_uint8_t *) outbu=
f, utf16, utf16len)<br>
&gt; &gt; =3D &#39;\0&#39;;<br>
&gt; &gt; -+<br>
&gt; &gt; -+ fail:<br>
&gt; &gt; -=C2=A0 =C2=A0grub_free (utf16);<br>
&gt; &gt; -=C2=A0 =C2=A0return outbuf;<br>
&gt; &gt; - }<br>
&gt; &gt; -@@ -1005,7 +1016,7 @@ grub_udf_read_symlink (grub_fshelp_node_t=
<br>
&gt; &gt; node)<br>
&gt; &gt; -=C2=A0 =C2=A0grub_size_t sz =3D U64 (node-&gt;block.fe.file_siz=
e);<br>
&gt; &gt; -=C2=A0 =C2=A0grub_uint8_t *raw;<br>
&gt; &gt; -=C2=A0 =C2=A0const grub_uint8_t *ptr;<br>
&gt; &gt; --=C2=A0 char *out, *optr;<br>
&gt; &gt; -+=C2=A0 char *out =3D NULL, *optr;<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0if (sz &lt; 4)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt; &gt; -@@ -1013,14 +1024,16 @@ grub_udf_read_symlink (grub_fshelp_node=
_t<br>
&gt; &gt; node)<br>
&gt; &gt; -=C2=A0 =C2=A0if (!raw)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt; &gt; -=C2=A0 =C2=A0if (grub_udf_read_file (node, NULL, NULL, 0, sz, (=
char *) raw) &lt;<br>
&gt; &gt; 0)<br>
&gt; &gt; --=C2=A0 =C2=A0 {<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 grub_free (raw);<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 return NULL;<br>
&gt; &gt; --=C2=A0 =C2=A0 }<br>
&gt; &gt; -+=C2=A0 =C2=A0 goto fail_1;<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 out =3D grub_malloc (sz * 2 + 1);<br>
&gt; &gt; -+=C2=A0 if (grub_mul (sz, 2, &amp;sz) ||<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 grub_add (sz, 1, &amp;sz))<br>
&gt; &gt; -+=C2=A0 =C2=A0 goto fail_0;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 out =3D grub_malloc (sz);<br>
&gt; &gt; -=C2=A0 =C2=A0if (!out)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -+ fail_0:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (raw);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; -@@ -1031,17 +1044,17 @@ grub_udf_read_symlink (grub_fshelp_node=
_t<br>
&gt; &gt; node)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_size_t s;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((grub_size_t) (ptr - raw + 4) &g=
t; sz)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 goto fail;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 goto fail_1;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(ptr[2] =3D=3D 0 &amp;&amp; ptr=
[3] =3D=3D 0))<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 goto fail;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 goto fail_1;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0s =3D 4 + ptr[1];<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((grub_size_t) (ptr - raw + s) &g=
t; sz)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 goto fail;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 goto fail_1;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (*ptr)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0case 1:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ptr[1])<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail_1;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Fallthrough.=C2=A0 */<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0case 2:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* in 4 bytes. out: 1 byte.=
=C2=A0 */<br>
&gt; &gt; -@@ -1066,11 +1079,11 @@ grub_udf_read_symlink (grub_fshelp_node=
_t<br>
&gt; &gt; node)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (optr !=3D out)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*optr++ =3D &#39;/&#39=
;;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!read_string (ptr + 4, s =
- 4, optr))<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail_1;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0optr +=3D grub_strlen (optr);=
<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail_1;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ptr +=3D s;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; -@@ -1078,7 +1091,7 @@ grub_udf_read_symlink (grub_fshelp_node_t=
<br>
&gt; &gt; node)<br>
&gt; &gt; -=C2=A0 =C2=A0grub_free (raw);<br>
&gt; &gt; -=C2=A0 =C2=A0return out;<br>
&gt; &gt; - <br>
&gt; &gt; -- fail:<br>
&gt; &gt; -+ fail_1:<br>
&gt; &gt; -=C2=A0 =C2=A0grub_free (raw);<br>
&gt; &gt; -=C2=A0 =C2=A0grub_free (out);<br>
&gt; &gt; -=C2=A0 =C2=A0grub_error (GRUB_ERR_BAD_FS, &quot;invalid symlink=
&quot;);<br>
&gt; &gt; -diff --git a/grub-core/fs/xfs.c b/grub-core/fs/xfs.c<br>
&gt; &gt; -index 96ffecb..ea65902 100644<br>
&gt; &gt; ---- a/grub-core/fs/xfs.c<br>
&gt; &gt; -+++ b/grub-core/fs/xfs.c<br>
&gt; &gt; -@@ -25,6 +25,7 @@<br>
&gt; &gt; - #include &lt;grub/dl.h&gt;<br>
&gt; &gt; - #include &lt;grub/types.h&gt;<br>
&gt; &gt; - #include &lt;grub/fshelp.h&gt;<br>
&gt; &gt; -+#include &lt;grub/safemath.h&gt;<br>
&gt; &gt; - <br>
&gt; &gt; - GRUB_MOD_LICENSE (&quot;GPLv3+&quot;);<br>
&gt; &gt; - <br>
&gt; &gt; -@@ -899,6 +900,7 @@ static struct grub_xfs_data *<br>
&gt; &gt; - grub_xfs_mount (grub_disk_t disk)<br>
&gt; &gt; - {<br>
&gt; &gt; -=C2=A0 =C2=A0struct grub_xfs_data *data =3D 0;<br>
&gt; &gt; -+=C2=A0 grub_size_t sz;<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0data =3D grub_zalloc (sizeof (struct grub_xfs_data=
));<br>
&gt; &gt; -=C2=A0 =C2=A0if (!data)<br>
&gt; &gt; -@@ -913,10 +915,11 @@ grub_xfs_mount (grub_disk_t disk)<br>
&gt; &gt; -=C2=A0 =C2=A0if (!grub_xfs_sb_valid(data))<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0goto fail;<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 data =3D grub_realloc (data,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0sizeof (struct grub_xfs_data)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0- sizeof (struct grub_xfs_inode)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0+ grub_xfs_inode_size(data) + 1);<br>
&gt; &gt; -+=C2=A0 if (grub_add (grub_xfs_inode_size (data),<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 sizeof (struct grub_xfs_data) - sizeof (s=
truct<br>
&gt; &gt; grub_xfs_inode) + 1, &amp;sz))<br>
&gt; &gt; -+=C2=A0 =C2=A0 goto fail;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 data =3D grub_realloc (data, sz);<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0if (! data)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0goto fail;<br>
&gt; &gt; -diff --git a/grub-core/fs/zfs/zfs.c b/grub-core/fs/zfs/zfs.c<br=
>
&gt; &gt; -index 381dde5..36d0373 100644<br>
&gt; &gt; ---- a/grub-core/fs/zfs/zfs.c<br>
&gt; &gt; -+++ b/grub-core/fs/zfs/zfs.c<br>
&gt; &gt; -@@ -55,6 +55,7 @@<br>
&gt; &gt; - #include &lt;grub/deflate.h&gt;<br>
&gt; &gt; - #include &lt;grub/crypto.h&gt;<br>
&gt; &gt; - #include &lt;grub/i18n.h&gt;<br>
&gt; &gt; -+#include &lt;grub/safemath.h&gt;<br>
&gt; &gt; - <br>
&gt; &gt; - GRUB_MOD_LICENSE (&quot;GPLv3+&quot;);<br>
&gt; &gt; - <br>
&gt; &gt; -@@ -773,11 +774,14 @@ fill_vdev_info (struct grub_zfs_data *dat=
a,<br>
&gt; &gt; -=C2=A0 =C2=A0if (data-&gt;n_devices_attached &gt; data-&gt;n_de=
vices_allocated)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0void *tmp;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 data-&gt;n_devices_allocated =3D 2 * data=
-&gt;n_devices_attached + 1;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 data-&gt;devices_attached<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =3D grub_realloc (tmp =3D data-&gt;device=
s_attached,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 data-&gt;n_devices_allocated<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 * sizeof (data-&gt;devices_attached[0]));<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 grub_size_t sz;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 if (grub_mul (data-&gt;n_devices_attached=
, 2, &amp;data-<br>
&gt; &gt; &gt; n_devices_allocated) ||<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_add (data-&gt;n_devices_alloc=
ated, 1, &amp;data-<br>
&gt; &gt; &gt; n_devices_allocated) ||<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_mul (data-&gt;n_devices_alloc=
ated, sizeof (data-<br>
&gt; &gt; &gt; devices_attached[0]), &amp;sz))<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 return GRUB_ERR_OUT_OF_RANGE;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 data-&gt;devices_attached =3D grub_reallo=
c (tmp =3D data-<br>
&gt; &gt; &gt; devices_attached, sz);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!data-&gt;devices_attached)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data-&gt;devices_attached =3D=
 tmp;<br>
&gt; &gt; -@@ -3468,14 +3472,18 @@ grub_zfs_nvlist_lookup_nvlist (const ch=
ar<br>
&gt; &gt; *nvlist, const char *name)<br>
&gt; &gt; - {<br>
&gt; &gt; -=C2=A0 =C2=A0char *nvpair;<br>
&gt; &gt; -=C2=A0 =C2=A0char *ret;<br>
&gt; &gt; --=C2=A0 grub_size_t size;<br>
&gt; &gt; -+=C2=A0 grub_size_t size, sz;<br>
&gt; &gt; -=C2=A0 =C2=A0int found;<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0found =3D nvlist_find_value (nvlist, name, DATA_TY=
PE_NVLIST,<br>
&gt; &gt; &amp;nvpair,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;size, 0);<br>
&gt; &gt; -=C2=A0 =C2=A0if (!found)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt; --=C2=A0 ret =3D grub_zalloc (size + 3 * sizeof (grub_uint32_t))=
;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 if (grub_add (size, 3 * sizeof (grub_uint32_t), &amp;sz=
))<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 ret =3D grub_zalloc (sz);<br>
&gt; &gt; -=C2=A0 =C2=A0if (!ret)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt; -=C2=A0 =C2=A0grub_memcpy (ret, nvlist, sizeof (grub_uint32_t));=
<br>
&gt; &gt; -diff --git a/grub-core/fs/zfs/zfscrypt.c b/grub-<br>
&gt; &gt; core/fs/zfs/zfscrypt.c<br>
&gt; &gt; -index 1402e0b..de3b015 100644<br>
&gt; &gt; ---- a/grub-core/fs/zfs/zfscrypt.c<br>
&gt; &gt; -+++ b/grub-core/fs/zfs/zfscrypt.c<br>
&gt; &gt; -@@ -22,6 +22,7 @@<br>
&gt; &gt; - #include &lt;grub/misc.h&gt;<br>
&gt; &gt; - #include &lt;grub/disk.h&gt;<br>
&gt; &gt; - #include &lt;grub/partition.h&gt;<br>
&gt; &gt; -+#include &lt;grub/safemath.h&gt;<br>
&gt; &gt; - #include &lt;grub/dl.h&gt;<br>
&gt; &gt; - #include &lt;grub/types.h&gt;<br>
&gt; &gt; - #include &lt;grub/zfs/zfs.h&gt;<br>
&gt; &gt; -@@ -82,9 +83,13 @@ grub_zfs_add_key (grub_uint8_t *key_in,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i=
nt passphrase)<br>
&gt; &gt; - {<br>
&gt; &gt; -=C2=A0 =C2=A0struct grub_zfs_wrap_key *key;<br>
&gt; &gt; -+=C2=A0 grub_size_t sz;<br>
&gt; &gt; -+<br>
&gt; &gt; -=C2=A0 =C2=A0if (!passphrase &amp;&amp; keylen &gt; 32)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0keylen =3D 32;<br>
&gt; &gt; --=C2=A0 key =3D grub_malloc (sizeof (*key) + keylen);<br>
&gt; &gt; -+=C2=A0 if (grub_add (sizeof (*key), keylen, &amp;sz))<br>
&gt; &gt; -+=C2=A0 =C2=A0 return GRUB_ERR_OUT_OF_RANGE;<br>
&gt; &gt; -+=C2=A0 key =3D grub_malloc (sz);<br>
&gt; &gt; -=C2=A0 =C2=A0if (!key)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return grub_errno;<br>
&gt; &gt; -=C2=A0 =C2=A0key-&gt;is_passphrase =3D passphrase;<br>
&gt; &gt; -diff --git a/grub-core/lib/arg.c b/grub-core/lib/arg.c<br>
&gt; &gt; -index fd7744a..3288609 100644<br>
&gt; &gt; ---- a/grub-core/lib/arg.c<br>
&gt; &gt; -+++ b/grub-core/lib/arg.c<br>
&gt; &gt; -@@ -23,6 +23,7 @@<br>
&gt; &gt; - #include &lt;grub/term.h&gt;<br>
&gt; &gt; - #include &lt;grub/extcmd.h&gt;<br>
&gt; &gt; - #include &lt;grub/i18n.h&gt;<br>
&gt; &gt; -+#include &lt;grub/safemath.h&gt;<br>
&gt; &gt; - <br>
&gt; &gt; - /* Built-in parser for default options.=C2=A0 */<br>
&gt; &gt; - static const struct grub_arg_option help_options[] =3D<br>
&gt; &gt; -@@ -216,7 +217,13 @@ static inline grub_err_t<br>
&gt; &gt; - add_arg (char ***argl, int *num, char *s)<br>
&gt; &gt; - {<br>
&gt; &gt; -=C2=A0 =C2=A0char **p =3D *argl;<br>
&gt; &gt; --=C2=A0 *argl =3D grub_realloc (*argl, (++(*num) + 1) * sizeof =
(char *));<br>
&gt; &gt; -+=C2=A0 grub_size_t sz;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 if (grub_add (++(*num), 1, &amp;sz) ||<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 grub_mul (sz, sizeof (char *), &amp;sz))<=
br>
&gt; &gt; -+=C2=A0 =C2=A0 return grub_error (GRUB_ERR_OUT_OF_RANGE, N_(&qu=
ot;overflow is<br>
&gt; &gt; detected&quot;));<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 *argl =3D grub_realloc (*argl, sz);<br>
&gt; &gt; -=C2=A0 =C2=A0if (! *argl)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (p);<br>
&gt; &gt; -@@ -431,6 +438,7 @@ grub_arg_list_alloc(grub_extcmd_t extcmd, i=
nt<br>
&gt; &gt; argc,<br>
&gt; &gt; -=C2=A0 =C2=A0grub_size_t argcnt;<br>
&gt; &gt; -=C2=A0 =C2=A0struct grub_arg_list *list;<br>
&gt; &gt; -=C2=A0 =C2=A0const struct grub_arg_option *options;<br>
&gt; &gt; -+=C2=A0 grub_size_t sz0, sz1;<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0options =3D extcmd-&gt;options;<br>
&gt; &gt; -=C2=A0 =C2=A0if (! options)<br>
&gt; &gt; -@@ -443,7 +451,15 @@ grub_arg_list_alloc(grub_extcmd_t extcmd, =
int<br>
&gt; &gt; argc,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0argcnt +=3D ((grub_size_t) argc + 1)=
 / 2 + 1; /* max possible<br>
&gt; &gt; for any option */<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 list =3D grub_zalloc (sizeof (*list) * i + sizeof (char=
*) *<br>
&gt; &gt; argcnt);<br>
&gt; &gt; -+=C2=A0 if (grub_mul (sizeof (*list), i, &amp;sz0) ||<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 grub_mul (sizeof (char *), argcnt, &amp;s=
z1) ||<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 grub_add (sz0, sz1, &amp;sz0))<br>
&gt; &gt; -+=C2=A0 =C2=A0 {<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 grub_error (GRUB_ERR_OUT_OF_RANGE, N_(&qu=
ot;overflow is<br>
&gt; &gt; detected&quot;));<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; &gt; -+=C2=A0 =C2=A0 }<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 list =3D grub_zalloc (sz0);<br>
&gt; &gt; -=C2=A0 =C2=A0if (! list)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt; - <br>
&gt; &gt; -diff --git a/grub-core/loader/i386/bsd.c b/grub-<br>
&gt; &gt; core/loader/i386/bsd.c<br>
&gt; &gt; -index 3730ed3..b92cbe9 100644<br>
&gt; &gt; ---- a/grub-core/loader/i386/bsd.c<br>
&gt; &gt; -+++ b/grub-core/loader/i386/bsd.c<br>
&gt; &gt; -@@ -35,6 +35,7 @@<br>
&gt; &gt; - #include &lt;grub/ns8250.h&gt;<br>
&gt; &gt; - #include &lt;grub/bsdlabel.h&gt;<br>
&gt; &gt; - #include &lt;grub/crypto.h&gt;<br>
&gt; &gt; -+#include &lt;grub/safemath.h&gt;<br>
&gt; &gt; - #include &lt;grub/verify.h&gt;<br>
&gt; &gt; - #ifdef GRUB_MACHINE_PCBIOS<br>
&gt; &gt; - #include &lt;grub/machine/int.h&gt;<br>
&gt; &gt; -@@ -1012,11 +1013,16 @@ grub_netbsd_add_modules (void)<br>
&gt; &gt; -=C2=A0 =C2=A0struct grub_netbsd_btinfo_modules *mods;<br>
&gt; &gt; -=C2=A0 =C2=A0unsigned i;<br>
&gt; &gt; -=C2=A0 =C2=A0grub_err_t err;<br>
&gt; &gt; -+=C2=A0 grub_size_t sz;<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0for (mod =3D netbsd_mods; mod; mod =3D mod-&gt;nex=
t)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0modcnt++;<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 mods =3D grub_malloc (sizeof (*mods) + sizeof (mods-&gt=
;mods[0]) *<br>
&gt; &gt; modcnt);<br>
&gt; &gt; -+=C2=A0 if (grub_mul (modcnt, sizeof (mods-&gt;mods[0]), &amp;s=
z) ||<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 grub_add (sz, sizeof (*mods), &amp;sz))<b=
r>
&gt; &gt; -+=C2=A0 =C2=A0 return GRUB_ERR_OUT_OF_RANGE;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 mods =3D grub_malloc (sz);<br>
&gt; &gt; -=C2=A0 =C2=A0if (!mods)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return grub_errno;<br>
&gt; &gt; - <br>
&gt; &gt; -diff --git a/grub-core/net/dns.c b/grub-core/net/dns.c<br>
&gt; &gt; -index e332d5e..906ec7d 100644<br>
&gt; &gt; ---- a/grub-core/net/dns.c<br>
&gt; &gt; -+++ b/grub-core/net/dns.c<br>
&gt; &gt; -@@ -22,6 +22,7 @@<br>
&gt; &gt; - #include &lt;grub/i18n.h&gt;<br>
&gt; &gt; - #include &lt;grub/err.h&gt;<br>
&gt; &gt; - #include &lt;grub/time.h&gt;<br>
&gt; &gt; -+#include &lt;grub/safemath.h&gt;<br>
&gt; &gt; - <br>
&gt; &gt; - struct dns_cache_element<br>
&gt; &gt; - {<br>
&gt; &gt; -@@ -51,9 +52,15 @@ grub_net_add_dns_server (const struct<br>
&gt; &gt; grub_net_network_level_address *s)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0int na =3D dns_servers_alloc * 2;<br=
>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct grub_net_network_level_addres=
s *ns;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 grub_size_t sz;<br>
&gt; &gt; -+<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (na &lt; 8)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0na =3D 8;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 ns =3D grub_realloc (dns_servers, na * si=
zeof (ns[0]));<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 if (grub_mul (na, sizeof (ns[0]), &amp;sz=
))<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 return GRUB_ERR_OUT_OF_RANGE;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 ns =3D grub_realloc (dns_servers, sz);<br=
>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ns)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return grub_errno;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0dns_servers_alloc =3D na;<br>
&gt; &gt; -diff --git a/grub-core/normal/charset.c b/grub-core/normal/char=
set.c<br>
&gt; &gt; -index d57fb72..4dfcc31 100644<br>
&gt; &gt; ---- a/grub-core/normal/charset.c<br>
&gt; &gt; -+++ b/grub-core/normal/charset.c<br>
&gt; &gt; -@@ -48,6 +48,7 @@<br>
&gt; &gt; - #include &lt;grub/unicode.h&gt;<br>
&gt; &gt; - #include &lt;grub/term.h&gt;<br>
&gt; &gt; - #include &lt;grub/normal.h&gt;<br>
&gt; &gt; -+#include &lt;grub/safemath.h&gt;<br>
&gt; &gt; - <br>
&gt; &gt; - #if HAVE_FONT_SOURCE<br>
&gt; &gt; - #include &quot;widthspec.h&quot;<br>
&gt; &gt; -@@ -464,6 +465,7 @@ grub_unicode_aglomerate_comb (const<br>
&gt; &gt; grub_uint32_t *in, grub_size_t inlen,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct grub_unicode_combining=
 *n;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned j;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_size_t sz;<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!haveout)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
&gt; &gt; -@@ -477,10 +479,14 @@ grub_unicode_aglomerate_comb (const<br>
&gt; &gt; grub_uint32_t *in, grub_size_t inlen,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0n =3D out-&gt;combinin=
g_inline;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else if (out-&gt;ncomb &gt; (=
int) ARRAY_SIZE (out-<br>
&gt; &gt; &gt; combining_inline))<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 n =3D grub_realloc (=
out-&gt;combining_ptr,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof (n[0]) * (out-&gt;ncomb +=
 1));<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (grub_add (out-&g=
t;ncomb, 1, &amp;sz) ||<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_m=
ul (sz, sizeof (n[0]), &amp;sz))<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br=
>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 n =3D grub_realloc (=
out-&gt;combining_ptr, sz);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!n)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -+ fail:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g=
rub_errno =3D GRUB_ERR_NONE;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c=
ontinue;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; -diff --git a/grub-core/normal/cmdline.c b/grub-core/normal/cmdl=
ine.c<br>
&gt; &gt; -index c57242e..de03fe6 100644<br>
&gt; &gt; ---- a/grub-core/normal/cmdline.c<br>
&gt; &gt; -+++ b/grub-core/normal/cmdline.c<br>
&gt; &gt; -@@ -28,6 +28,7 @@<br>
&gt; &gt; - #include &lt;grub/env.h&gt;<br>
&gt; &gt; - #include &lt;grub/i18n.h&gt;<br>
&gt; &gt; - #include &lt;grub/charset.h&gt;<br>
&gt; &gt; -+#include &lt;grub/safemath.h&gt;<br>
&gt; &gt; - <br>
&gt; &gt; - static grub_uint32_t *kill_buf;<br>
&gt; &gt; - <br>
&gt; &gt; -@@ -307,12 +308,21 @@ cl_insert (struct cmdline_term *cl_terms,=
<br>
&gt; &gt; unsigned nterms,<br>
&gt; &gt; -=C2=A0 =C2=A0if (len + (*llen) &gt;=3D (*max_len))<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_uint32_t *nbuf;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 (*max_len) *=3D 2;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 nbuf =3D grub_realloc ((*buf), sizeof (gr=
ub_uint32_t) *<br>
&gt; &gt; (*max_len));<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 grub_size_t sz;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 if (grub_mul (*max_len, 2, max_len) ||<br=
>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_mul (*max_len, sizeof (grub_u=
int32_t), &amp;sz))<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_errno =3D GRUB_ERR_OUT_OF_RAN=
GE;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 nbuf =3D grub_realloc ((*buf), sz);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (nbuf)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0(*buf) =3D nbuf;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -+ fail:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_print_error ();<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_errno =3D GRUB_ERR_NONE;=
<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(*max_len) /=3D 2;<br>
&gt; &gt; -diff --git a/grub-core/normal/menu_entry.c b/grub-<br>
&gt; &gt; core/normal/menu_entry.c<br>
&gt; &gt; -index 1993995..50eef91 100644<br>
&gt; &gt; ---- a/grub-core/normal/menu_entry.c<br>
&gt; &gt; -+++ b/grub-core/normal/menu_entry.c<br>
&gt; &gt; -@@ -27,6 +27,7 @@<br>
&gt; &gt; - #include &lt;grub/auth.h&gt;<br>
&gt; &gt; - #include &lt;grub/i18n.h&gt;<br>
&gt; &gt; - #include &lt;grub/charset.h&gt;<br>
&gt; &gt; -+#include &lt;grub/safemath.h&gt;<br>
&gt; &gt; - <br>
&gt; &gt; - enum update_mode<br>
&gt; &gt; -=C2=A0 =C2=A0{<br>
&gt; &gt; -@@ -113,10 +114,18 @@ ensure_space (struct line *linep, int ext=
ra)<br>
&gt; &gt; - {<br>
&gt; &gt; -=C2=A0 =C2=A0if (linep-&gt;max_len &lt; linep-&gt;len + extra)<=
br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 linep-&gt;max_len =3D 2 * (linep-&gt;len =
+ extra);<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 linep-&gt;buf =3D grub_realloc (linep-&gt=
;buf, (linep-&gt;max_len + 1) *<br>
&gt; &gt; sizeof (linep-&gt;buf[0]));<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 grub_size_t sz0, sz1;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 if (grub_add (linep-&gt;len, extra, &amp;=
sz0) ||<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_mul (sz0, 2, &amp;sz0) ||<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_add (sz0, 1, &amp;sz1) ||<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_mul (sz1, sizeof (linep-&gt;b=
uf[0]), &amp;sz1))<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 linep-&gt;buf =3D grub_realloc (linep-&gt=
;buf, sz1);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (! linep-&gt;buf)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 linep-&gt;max_len =3D sz0;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0return 1;<br>
&gt; &gt; -diff --git a/grub-core/script/argv.c b/grub-core/script/argv.c<=
br>
&gt; &gt; -index 217ec5d..5751fdd 100644<br>
&gt; &gt; ---- a/grub-core/script/argv.c<br>
&gt; &gt; -+++ b/grub-core/script/argv.c<br>
&gt; &gt; -@@ -20,6 +20,7 @@<br>
&gt; &gt; - #include &lt;grub/mm.h&gt;<br>
&gt; &gt; - #include &lt;grub/misc.h&gt;<br>
&gt; &gt; - #include &lt;grub/script_sh.h&gt;<br>
&gt; &gt; -+#include &lt;grub/safemath.h&gt;<br>
&gt; &gt; - <br>
&gt; &gt; - /* Return nearest power of two that is &gt;=3D v.=C2=A0 */<br>
&gt; &gt; - static unsigned<br>
&gt; &gt; -@@ -81,11 +82,16 @@ int<br>
&gt; &gt; - grub_script_argv_next (struct grub_script_argv *argv)<br>
&gt; &gt; - {<br>
&gt; &gt; -=C2=A0 =C2=A0char **p =3D argv-&gt;args;<br>
&gt; &gt; -+=C2=A0 grub_size_t sz;<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0if (argv-&gt;args &amp;&amp; argv-&gt;argc &amp;&a=
mp; argv-&gt;args[argv-&gt;argc - 1] =3D=3D 0)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 p =3D grub_realloc (p, round_up_exp ((argv-&gt;argc + 2=
) * sizeof<br>
&gt; &gt; (char *)));<br>
&gt; &gt; -+=C2=A0 if (grub_add (argv-&gt;argc, 2, &amp;sz) ||<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 grub_mul (sz, sizeof (char *), &amp;sz))<=
br>
&gt; &gt; -+=C2=A0 =C2=A0 return 1;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 p =3D grub_realloc (p, round_up_exp (sz));<br>
&gt; &gt; -=C2=A0 =C2=A0if (! p)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return 1;<br>
&gt; &gt; - <br>
&gt; &gt; -@@ -105,13 +111,19 @@ grub_script_argv_append (struct<br>
&gt; &gt; grub_script_argv *argv, const char *s,<br>
&gt; &gt; - {<br>
&gt; &gt; -=C2=A0 =C2=A0grub_size_t a;<br>
&gt; &gt; -=C2=A0 =C2=A0char *p =3D argv-&gt;args[argv-&gt;argc - 1];<br>
&gt; &gt; -+=C2=A0 grub_size_t sz;<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0if (! s)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0a =3D p ? grub_strlen (p) : 0;<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 p =3D grub_realloc (p, round_up_exp ((a + slen + 1) * s=
izeof<br>
&gt; &gt; (char)));<br>
&gt; &gt; -+=C2=A0 if (grub_add (a, slen, &amp;sz) ||<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 grub_add (sz, 1, &amp;sz) ||<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 grub_mul (sz, sizeof (char), &amp;sz))<br=
>
&gt; &gt; -+=C2=A0 =C2=A0 return 1;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 p =3D grub_realloc (p, round_up_exp (sz));<br>
&gt; &gt; -=C2=A0 =C2=A0if (! p)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return 1;<br>
&gt; &gt; - <br>
&gt; &gt; -diff --git a/grub-core/script/lexer.c b/grub-core/script/lexer.=
c<br>
&gt; &gt; -index c6bd317..5fb0cbd 100644<br>
&gt; &gt; ---- a/grub-core/script/lexer.c<br>
&gt; &gt; -+++ b/grub-core/script/lexer.c<br>
&gt; &gt; -@@ -24,6 +24,7 @@<br>
&gt; &gt; - #include &lt;grub/mm.h&gt;<br>
&gt; &gt; - #include &lt;grub/script_sh.h&gt;<br>
&gt; &gt; - #include &lt;grub/i18n.h&gt;<br>
&gt; &gt; -+#include &lt;grub/safemath.h&gt;<br>
&gt; &gt; - <br>
&gt; &gt; - #define yytext_ptr char *<br>
&gt; &gt; - #include &quot;grub_script.tab.h&quot;<br>
&gt; &gt; -@@ -110,10 +111,14 @@ grub_script_lexer_record (struct<br>
&gt; &gt; grub_parser_param *parser, char *str)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0old =3D lexer-&gt;recording;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (lexer-&gt;recordlen &lt; len)<br=
>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0lexer-&gt;recordlen =3D len;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 lexer-&gt;recordlen *=3D 2;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 if (grub_mul (lexer-&gt;recordlen, 2, &am=
p;lexer-&gt;recordlen))<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 goto fail;<br>
&gt; &gt; -+<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0lexer-&gt;recording =3D grub_realloc=
 (lexer-&gt;recording, lexer-<br>
&gt; &gt; &gt; recordlen);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!lexer-&gt;recording)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -+ fail:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (old);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lexer-&gt;recordpos =3D 0;<br=
>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lexer-&gt;recordlen =3D 0;<br=
>
&gt; &gt; -@@ -130,7 +135,7 @@ int<br>
&gt; &gt; - grub_script_lexer_yywrap (struct grub_parser_param *parserstat=
e,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *input)<br>
&gt; &gt; - {<br>
&gt; &gt; --=C2=A0 grub_size_t len =3D 0;<br>
&gt; &gt; -+=C2=A0 grub_size_t len =3D 0, sz;<br>
&gt; &gt; -=C2=A0 =C2=A0char *p =3D 0;<br>
&gt; &gt; -=C2=A0 =C2=A0char *line =3D 0;<br>
&gt; &gt; -=C2=A0 =C2=A0YY_BUFFER_STATE buffer;<br>
&gt; &gt; -@@ -168,12 +173,22 @@ grub_script_lexer_yywrap (struct<br>
&gt; &gt; grub_parser_param *parserstate,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; -=C2=A0 =C2=A0else if (len &amp;&amp; line[len - 1] !=3D &#39;\n=
&#39;)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 p =3D grub_realloc (line, len + 2);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 if (grub_add (len, 2, &amp;sz))<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_free (line);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_script_yyerror (parserstate, =
N_(&quot;overflow is<br>
&gt; &gt; detected&quot;));<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 p =3D grub_realloc (line, sz);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (p)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p[len++] =3D &#39;\n&#39;;<br=
>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p[len] =3D &#39;\0&#39;;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 else<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 grub_free (line);<br>
&gt; &gt; -+<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0line =3D p;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; - <br>
&gt; &gt; -diff --git a/grub-core/video/bitmap.c b/grub-core/video/bitmap.=
c<br>
&gt; &gt; -index b2e0315..6256e20 100644<br>
&gt; &gt; ---- a/grub-core/video/bitmap.c<br>
&gt; &gt; -+++ b/grub-core/video/bitmap.c<br>
&gt; &gt; -@@ -23,6 +23,7 @@<br>
&gt; &gt; - #include &lt;grub/mm.h&gt;<br>
&gt; &gt; - #include &lt;grub/misc.h&gt;<br>
&gt; &gt; - #include &lt;grub/i18n.h&gt;<br>
&gt; &gt; -+#include &lt;grub/safemath.h&gt;<br>
&gt; &gt; - <br>
&gt; &gt; - GRUB_MOD_LICENSE (&quot;GPLv3+&quot;);<br>
&gt; &gt; - <br>
&gt; &gt; -@@ -58,7 +59,7 @@ grub_video_bitmap_create (struct grub_video_b=
itmap<br>
&gt; &gt; **bitmap,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enum grub_video_blit_format blit_format)=
<br>
&gt; &gt; - {<br>
&gt; &gt; -=C2=A0 =C2=A0struct grub_video_mode_info *mode_info;<br>
&gt; &gt; --=C2=A0 unsigned int size;<br>
&gt; &gt; -+=C2=A0 grub_size_t size;<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0if (!bitmap)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return grub_error (GRUB_ERR_BUG, &quot;inva=
lid argument&quot;);<br>
&gt; &gt; -@@ -137,19 +138,25 @@ grub_video_bitmap_create (struct<br>
&gt; &gt; grub_video_bitmap **bitmap,<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0mode_info-&gt;pitch =3D width * mode_info-&gt;byte=
s_per_pixel;<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 /* Calculate size needed for the data.=C2=A0 */<br>
&gt; &gt; --=C2=A0 size =3D (width * mode_info-&gt;bytes_per_pixel) * heig=
ht;<br>
&gt; &gt; -+=C2=A0 /* Calculate size needed for the data. */<br>
&gt; &gt; -+=C2=A0 if (grub_mul (width, mode_info-&gt;bytes_per_pixel, &am=
p;size) ||<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 grub_mul (size, height, &amp;size))<br>
&gt; &gt; -+=C2=A0 =C2=A0 {<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 grub_error (GRUB_ERR_OUT_OF_RANGE, N_(&qu=
ot;overflow is<br>
&gt; &gt; detected&quot;));<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 goto fail;<br>
&gt; &gt; -+=C2=A0 =C2=A0 }<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0(*bitmap)-&gt;data =3D grub_zalloc (size);<br>
&gt; &gt; -=C2=A0 =C2=A0if (! (*bitmap)-&gt;data)<br>
&gt; &gt; --=C2=A0 =C2=A0 {<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 grub_free (*bitmap);<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 *bitmap =3D 0;<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 return grub_errno;<br>
&gt; &gt; --=C2=A0 =C2=A0 }<br>
&gt; &gt; -+=C2=A0 =C2=A0 goto fail;<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0return GRUB_ERR_NONE;<br>
&gt; &gt; -+<br>
&gt; &gt; -+ fail:<br>
&gt; &gt; -+=C2=A0 grub_free (*bitmap);<br>
&gt; &gt; -+=C2=A0 *bitmap =3D NULL;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 return grub_errno;<br>
&gt; &gt; - }<br>
&gt; &gt; - <br>
&gt; &gt; - /* Frees all resources allocated by bitmap.=C2=A0 */<br>
&gt; &gt; -diff --git a/grub-core/video/readers/png.c b/grub-<br>
&gt; &gt; core/video/readers/png.c<br>
&gt; &gt; -index 61bd645..0157ff7 100644<br>
&gt; &gt; ---- a/grub-core/video/readers/png.c<br>
&gt; &gt; -+++ b/grub-core/video/readers/png.c<br>
&gt; &gt; -@@ -23,6 +23,7 @@<br>
&gt; &gt; - #include &lt;grub/mm.h&gt;<br>
&gt; &gt; - #include &lt;grub/misc.h&gt;<br>
&gt; &gt; - #include &lt;grub/bufio.h&gt;<br>
&gt; &gt; -+#include &lt;grub/safemath.h&gt;<br>
&gt; &gt; - <br>
&gt; &gt; - GRUB_MOD_LICENSE (&quot;GPLv3+&quot;);<br>
&gt; &gt; - <br>
&gt; &gt; -@@ -301,9 +302,17 @@ grub_png_decode_image_header (struct<br>
&gt; &gt; grub_png_data *data)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0data-&gt;bpp &lt;&lt;=3D 1;<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0data-&gt;color_bits =3D color_bits;<br>
&gt; &gt; --=C2=A0 data-&gt;row_bytes =3D data-&gt;image_width * data-&gt;=
bpp;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 if (grub_mul (data-&gt;image_width, data-&gt;bpp, &amp;=
data-&gt;row_bytes))<br>
&gt; &gt; -+=C2=A0 =C2=A0 return grub_error (GRUB_ERR_OUT_OF_RANGE, N_(&qu=
ot;overflow is<br>
&gt; &gt; detected&quot;));<br>
&gt; &gt; -+<br>
&gt; &gt; -=C2=A0 =C2=A0if (data-&gt;color_bits &lt;=3D 4)<br>
&gt; &gt; --=C2=A0 =C2=A0 data-&gt;row_bytes =3D (data-&gt;image_width * d=
ata-&gt;color_bits + 7) /<br>
&gt; &gt; 8;<br>
&gt; &gt; -+=C2=A0 =C2=A0 {<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 if (grub_mul (data-&gt;image_width, data-=
&gt;color_bits + 7, &amp;data-<br>
&gt; &gt; &gt; row_bytes))<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 return grub_error (GRUB_ERR_OUT_OF_RANGE,=
 N_(&quot;overflow is<br>
&gt; &gt; detected&quot;));<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 data-&gt;row_bytes &gt;&gt;=3D 3;<br>
&gt; &gt; -+=C2=A0 =C2=A0 }<br>
&gt; &gt; - <br>
&gt; &gt; - #ifndef GRUB_CPU_WORDS_BIGENDIAN<br>
&gt; &gt; -=C2=A0 =C2=A0if (data-&gt;is_16bit || data-&gt;is_gray || data-=
&gt;is_palette)<br>
&gt; &gt; --- <br>
&gt; &gt; -2.14.4<br>
&gt; &gt; -<br>
&gt; &gt; diff --git a/meta/recipes-bsp/grub/files/CVE-2020-15706-script-A=
void-<br>
&gt; &gt; a-use-after-free-when-redefining-a-func.patch b/meta/recipes-<br=
>
&gt; &gt; bsp/grub/files/CVE-2020-15706-script-Avoid-a-use-after-free-when=
-<br>
&gt; &gt; redefining-a-func.patch<br>
&gt; &gt; deleted file mode 100644<br>
&gt; &gt; index 329e554a68..0000000000<br>
&gt; &gt; --- a/meta/recipes-bsp/grub/files/CVE-2020-15706-script-Avoid-a-=
use-<br>
&gt; &gt; after-free-when-redefining-a-func.patch<br>
&gt; &gt; +++ /dev/null<br>
&gt; &gt; @@ -1,117 +0,0 @@<br>
&gt; &gt; -From c65fc7e75b7b7e880d90766057040011701e97f4 Mon Sep 17 00:00:=
00<br>
&gt; &gt; 2001<br>
&gt; &gt; -From: Chris Coulson &lt;<a href=3D"mailto:chris.coulson@canonic=
al.com" target=3D"_blank">chris.coulson@canonical.com</a>&gt;<br>
&gt; &gt; -Date: Fri, 10 Jul 2020 14:41:45 +0100<br>
&gt; &gt; -Subject: [PATCH 8/9] script: Avoid a use-after-free when redefi=
ning<br>
&gt; &gt; a function<br>
&gt; &gt; - during execution<br>
&gt; &gt; -<br>
&gt; &gt; -Defining a new function with the same name as a previously defi=
ned<br>
&gt; &gt; -function causes the grub_script and associated resources for th=
e<br>
&gt; &gt; -previous function to be freed. If the previous function is curr=
ently<br>
&gt; &gt; -executing when a function with the same name is defined, this<b=
r>
&gt; &gt; results<br>
&gt; &gt; -in use-after-frees when processing subsequent commands in the<b=
r>
&gt; &gt; original<br>
&gt; &gt; -function.<br>
&gt; &gt; -<br>
&gt; &gt; -Instead, reject a new function definition if it has the same na=
me as<br>
&gt; &gt; -a previously defined function, and that function is currently b=
eing<br>
&gt; &gt; -executed. Although a behavioural change, this should be backwar=
ds<br>
&gt; &gt; -compatible with existing configurations because they can&#39;t =
be<br>
&gt; &gt; -dependent on the current behaviour without being broken.<br>
&gt; &gt; -<br>
&gt; &gt; -Fixes: CVE-2020-15706<br>
&gt; &gt; -<br>
&gt; &gt; -Signed-off-by: Chris Coulson &lt;<a href=3D"mailto:chris.coulso=
n@canonical.com" target=3D"_blank">chris.coulson@canonical.com</a>&gt;<br>
&gt; &gt; -Reviewed-by: Daniel Kiper &lt;<a href=3D"mailto:daniel.kiper@or=
acle.com" target=3D"_blank">daniel.kiper@oracle.com</a>&gt;<br>
&gt; &gt; -<br>
&gt; &gt; -Upstream-Status: Backport<br>
&gt; &gt; -CVE: CVE-2020-15706<br>
&gt; &gt; -<br>
&gt; &gt; -Reference to upstream patch:<br>
&gt; &gt; -<br>
&gt; &gt; <a href=3D"https://git.savannah.gnu.org/cgit/grub.git/commit/?id=
=
=3D426f57383d647406ae9c628c472059c27cd6e040" rel=3D"noreferrer" target=3D"=
_blank">https://git.savannah.gnu.org/cgit/grub.git/commit/?id=3D426f57383d6=
47406ae9c628c472059c27cd6e040</a><br>
&gt; &gt; -<br>
&gt; &gt; -Signed-off-by: Yongxin Liu &lt;<a href=3D"mailto:yongxin.liu@wi=
ndriver.com" target=3D"_blank">yongxin.liu@windriver.com</a>&gt;<br>
&gt; &gt; ----<br>
&gt; &gt; - grub-core/script/execute.c=C2=A0 |=C2=A0 2 ++<br>
&gt; &gt; - grub-core/script/function.c | 16 +++++++++++++---<br>
&gt; &gt; - grub-core/script/parser.y=C2=A0 =C2=A0|=C2=A0 3 ++-<br>
&gt; &gt; - include/grub/script_sh.h=C2=A0 =C2=A0 |=C2=A0 2 ++<br>
&gt; &gt; - 4 files changed, 19 insertions(+), 4 deletions(-)<br>
&gt; &gt; -<br>
&gt; &gt; -diff --git a/grub-core/script/execute.c b/grub-core/script/exec=
ute.c<br>
&gt; &gt; -index c8d6806..7e028e1 100644<br>
&gt; &gt; ---- a/grub-core/script/execute.c<br>
&gt; &gt; -+++ b/grub-core/script/execute.c<br>
&gt; &gt; -@@ -838,7 +838,9 @@ grub_script_function_call<br>
&gt; &gt; (grub_script_function_t func, int argc, char **args)<br>
&gt; &gt; -=C2=A0 =C2=A0old_scope =3D scope;<br>
&gt; &gt; -=C2=A0 =C2=A0scope =3D &amp;new_scope;<br>
&gt; &gt; - <br>
&gt; &gt; -+=C2=A0 func-&gt;executing++;<br>
&gt; &gt; -=C2=A0 =C2=A0ret =3D grub_script_execute (func-&gt;func);<br>
&gt; &gt; -+=C2=A0 func-&gt;executing--;<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0function_return =3D 0;<br>
&gt; &gt; -=C2=A0 =C2=A0active_loops =3D loops;<br>
&gt; &gt; -diff --git a/grub-core/script/function.c b/grub-<br>
&gt; &gt; core/script/function.c<br>
&gt; &gt; -index d36655e..3aad04b 100644<br>
&gt; &gt; ---- a/grub-core/script/function.c<br>
&gt; &gt; -+++ b/grub-core/script/function.c<br>
&gt; &gt; -@@ -34,6 +34,7 @@ grub_script_function_create (struct<br>
&gt; &gt; grub_script_arg *functionname_arg,<br>
&gt; &gt; -=C2=A0 =C2=A0func =3D (grub_script_function_t) grub_malloc (siz=
eof (*func));<br>
&gt; &gt; -=C2=A0 =C2=A0if (! func)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt; -+=C2=A0 func-&gt;executing =3D 0;<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0func-&gt;name =3D grub_strdup (functionname_arg-&g=
t;str);<br>
&gt; &gt; -=C2=A0 =C2=A0if (! func-&gt;name)<br>
&gt; &gt; -@@ -60,10 +61,19 @@ grub_script_function_create (struct<br>
&gt; &gt; grub_script_arg *functionname_arg,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_script_function_t q;<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0q =3D *p;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 grub_script_free (q-&gt;func);<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 q-&gt;func =3D cmd;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (func);<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 func =3D q;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 if (q-&gt;executing &gt; 0)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_error (GRUB_ERR_BAD_AR=
GUMENT,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 N_(&quot;attempt to redefine a function being<br>
&gt; &gt; executed&quot;));<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 func =3D NULL;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 else<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_script_free (q-&gt;fun=
c);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 q-&gt;func =3D cmd;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 func =3D q;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; -=C2=A0 =C2=A0else<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -diff --git a/grub-core/script/parser.y b/grub-core/script/parse=
r.y<br>
&gt; &gt; -index 4f0ab83..f80b86b 100644<br>
&gt; &gt; ---- a/grub-core/script/parser.y<br>
&gt; &gt; -+++ b/grub-core/script/parser.y<br>
&gt; &gt; -@@ -289,7 +289,8 @@ function: &quot;function&quot; &quot;name&q=
uot;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_script_mem=
_free (state-&gt;func_mem);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else {<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0script-&gt;chil=
dren =3D state-&gt;scripts;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_script_function=
_create ($2, script);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!grub_script_fun=
ction_create ($2, script))<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_script_f=
ree (script);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0state-&gt;scripts =3D =
$&lt;scripts&gt;3;<br>
&gt; &gt; -diff --git a/include/grub/script_sh.h b/include/grub/script_sh.=
h<br>
&gt; &gt; -index b382bcf..6c48e07 100644<br>
&gt; &gt; ---- a/include/grub/script_sh.h<br>
&gt; &gt; -+++ b/include/grub/script_sh.h<br>
&gt; &gt; -@@ -361,6 +361,8 @@ struct grub_script_function<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0/* The next element.=C2=A0 */<br>
&gt; &gt; -=C2=A0 =C2=A0struct grub_script_function *next;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 unsigned executing;<br>
&gt; &gt; - };<br>
&gt; &gt; - typedef struct grub_script_function *grub_script_function_t;<b=
r>
&gt; &gt; - <br>
&gt; &gt; --- <br>
&gt; &gt; -2.14.4<br>
&gt; &gt; -<br>
&gt; &gt; diff --git a/meta/recipes-bsp/grub/files/CVE-2020-15707-linux-Fi=
x-<br>
&gt; &gt; integer-overflows-in-initrd-size-handling.patch b/meta/recipes-<=
br>
&gt; &gt; bsp/grub/files/CVE-2020-15707-linux-Fix-integer-overflows-in-ini=
trd-<br>
&gt; &gt; size-handling.patch<br>
&gt; &gt; deleted file mode 100644<br>
&gt; &gt; index d4f9300c0a..0000000000<br>
&gt; &gt; --- a/meta/recipes-bsp/grub/files/CVE-2020-15707-linux-Fix-integ=
er-<br>
&gt; &gt; overflows-in-initrd-size-handling.patch<br>
&gt; &gt; +++ /dev/null<br>
&gt; &gt; @@ -1,177 +0,0 @@<br>
&gt; &gt; -From 68a09a74f6d726d79709847f3671c0a08e4fb5a0 Mon Sep 17 00:00:=
00<br>
&gt; &gt; 2001<br>
&gt; &gt; -From: Colin Watson &lt;<a href=3D"mailto:cjwatson@debian.org" t=
arget=3D"_blank">cjwatson@debian.org</a>&gt;<br>
&gt; &gt; -Date: Sat, 25 Jul 2020 12:15:37 +0100<br>
&gt; &gt; -Subject: [PATCH 9/9] linux: Fix integer overflows in initrd siz=
e<br>
&gt; &gt; handling<br>
&gt; &gt; -<br>
&gt; &gt; -These could be triggered by a crafted filesystem with very larg=
e<br>
&gt; &gt; files.<br>
&gt; &gt; -<br>
&gt; &gt; -Fixes: CVE-2020-15707<br>
&gt; &gt; -<br>
&gt; &gt; -Signed-off-by: Colin Watson &lt;<a href=3D"mailto:cjwatson@debi=
an.org" target=3D"_blank">cjwatson@debian.org</a>&gt;<br>
&gt; &gt; -Reviewed-by: Jan Setje-Eilers &lt;<a href=3D"mailto:jan.setjeei=
lers@oracle.com" target=3D"_blank">jan.setjeeilers@oracle.com</a>&gt;<br>
&gt; &gt; -Reviewed-by: Daniel Kiper &lt;<a href=3D"mailto:daniel.kiper@or=
acle.com" target=3D"_blank">daniel.kiper@oracle.com</a>&gt;<br>
&gt; &gt; -<br>
&gt; &gt; -Upstream-Status: Backport<br>
&gt; &gt; -CVE: CVE-2020-15707<br>
&gt; &gt; -<br>
&gt; &gt; -Reference to upstream patch:<br>
&gt; &gt; -<br>
&gt; &gt; <a href=3D"https://git.savannah.gnu.org/cgit/grub.git/commit/?id=
=
=3De7b8856f8be3292afdb38d2e8c70ad8d62a61e10" rel=3D"noreferrer" target=3D"=
_blank">https://git.savannah.gnu.org/cgit/grub.git/commit/?id=3De7b8856f8be=
3292afdb38d2e8c70ad8d62a61e10</a><br>
&gt; &gt; -<br>
&gt; &gt; -Signed-off-by: Yongxin Liu &lt;<a href=3D"mailto:yongxin.liu@wi=
ndriver.com" target=3D"_blank">yongxin.liu@windriver.com</a>&gt;<br>
&gt; &gt; ----<br>
&gt; &gt; - grub-core/loader/linux.c | 74 ++++++++++++++++++++++++++++++++=
+++--<br>
&gt; &gt; -----------<br>
&gt; &gt; - 1 file changed, 54 insertions(+), 20 deletions(-)<br>
&gt; &gt; -<br>
&gt; &gt; -diff --git a/grub-core/loader/linux.c b/grub-core/loader/linux.=
c<br>
&gt; &gt; -index 471b214..8c8565a 100644<br>
&gt; &gt; ---- a/grub-core/loader/linux.c<br>
&gt; &gt; -+++ b/grub-core/loader/linux.c<br>
&gt; &gt; -@@ -4,6 +4,7 @@<br>
&gt; &gt; - #include &lt;grub/misc.h&gt;<br>
&gt; &gt; - #include &lt;grub/file.h&gt;<br>
&gt; &gt; - #include &lt;grub/mm.h&gt;<br>
&gt; &gt; -+#include &lt;grub/safemath.h&gt;<br>
&gt; &gt; - <br>
&gt; &gt; - struct newc_head<br>
&gt; &gt; - {<br>
&gt; &gt; -@@ -98,13 +99,13 @@ free_dir (struct dir *root)<br>
&gt; &gt; -=C2=A0 =C2=A0grub_free (root);<br>
&gt; &gt; - }<br>
&gt; &gt; - <br>
&gt; &gt; --static grub_size_t<br>
&gt; &gt; -+static grub_err_t<br>
&gt; &gt; - insert_dir (const char *name, struct dir **root,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_uint8_t *ptr)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_uint8_t *ptr, grub_siz=
e_t *size)<br>
&gt; &gt; - {<br>
&gt; &gt; -=C2=A0 =C2=A0struct dir *cur, **head =3D root;<br>
&gt; &gt; -=C2=A0 =C2=A0const char *cb, *ce =3D name;<br>
&gt; &gt; --=C2=A0 grub_size_t size =3D 0;<br>
&gt; &gt; -+=C2=A0 *size =3D 0;<br>
&gt; &gt; -=C2=A0 =C2=A0while (1)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0for (cb =3D ce; *cb =3D=3D &#39;/&#3=
9;; cb++);<br>
&gt; &gt; -@@ -130,14 +131,22 @@ insert_dir (const char *name, struct dir<=
br>
&gt; &gt; **root,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D make_he=
ader (ptr, name, ce - name,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 040777, 0);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 size +=3D ALIGN_UP ((ce - (char *)=
 name)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 + sizeof (struct newc_head), 4);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (grub_add (*size,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 ALIGN_UP ((ce - (char *) name)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 + sizeof (struct newc_hea=
d), 4),<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 size))<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_error (GRUB_ERR=
_OUT_OF_RANGE, N_(&quot;overflow is<br>
&gt; &gt; detected&quot;));<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_free (n-&gt;nam=
e);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_free (n);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return grub_errno;<b=
r>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*head =3D n;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cur =3D n;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0root =3D &amp;cur-&gt;next;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; --=C2=A0 return size;<br>
&gt; &gt; -+=C2=A0 return GRUB_ERR_NONE;<br>
&gt; &gt; - }<br>
&gt; &gt; - <br>
&gt; &gt; - grub_err_t<br>
&gt; &gt; -@@ -173,26 +182,33 @@ grub_initrd_init (int argc, char *argv[],=
<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0eptr =3D grub_strchr (ptr, &#=
39;:&#39;);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (eptr)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_size_t dir_size=
, name_len;<br>
&gt; &gt; -+<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0initrd_ctx-&gt;=
components[i].newc_name =3D grub_strndup<br>
&gt; &gt; (ptr, eptr - ptr);<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!initrd_ctx-&gt;=
components[i].newc_name)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!initrd_ctx-&gt;=
components[i].newc_name ||<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 insert=
_dir (initrd_ctx-&gt;components[i].newc_name,<br>
&gt; &gt; &amp;root, 0,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;dir_size))<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g=
rub_initrd_close (initrd_ctx);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r=
eturn grub_errno;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 initrd_ctx-&gt;size<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D ALIGN_UP=
 (sizeof (struct newc_head)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 + grub_strlen (initrd_ctx-<br>
&gt; &gt; &gt; components[i].newc_name),<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04);<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 initrd_ctx-&gt;size =
+=3D insert_dir (initrd_ctx-<br>
&gt; &gt; &gt; components[i].newc_name,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &amp;root, 0);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name_len =3D grub_st=
rlen (initrd_ctx-<br>
&gt; &gt; &gt; components[i].newc_name);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (grub_add (initrd=
_ctx-&gt;size,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ALIGN_UP (sizeof (struct newc_head) +<br>
&gt; &gt; name_len, 4),<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;initrd_ctx-&gt;size) ||<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_a=
dd (initrd_ctx-&gt;size, dir_size, &amp;initrd_ctx-<br>
&gt; &gt; &gt; size))<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto overflow=
;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0newc =3D 1;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fname =3D eptr =
+ 1;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (newc)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 initrd_ctx-&gt;size +=3D ALIGN_UP =
(sizeof (struct newc_head)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 + si=
zeof (&quot;TRAILER!!!&quot;) - 1,<br>
&gt; &gt; 4);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (grub_add (initrd_ctx-&gt;size,=
<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 ALIGN_UP (sizeof (struct newc_head)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 + sizeof (&quot;TRAILER!!=
!&quot;) - 1, 4),<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 &amp;initrd_ctx-&gt;size))<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto overflow;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free_dir (root);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0root =3D 0;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0newc =3D 0;<br>
&gt; &gt; -@@ -208,19 +224,29 @@ grub_initrd_init (int argc, char *argv[],=
<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0initrd_ctx-&gt;nfiles++;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0initrd_ctx-&gt;components[i].size<br=
>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D grub_file_size (initrd_ctx-&gt;c=
omponents[i].file);<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 initrd_ctx-&gt;size +=3D initrd_ctx-&gt;c=
omponents[i].size;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 if (grub_add (initrd_ctx-&gt;size, initrd=
_ctx-<br>
&gt; &gt; &gt; components[i].size,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 &amp;initrd_ctx-&gt;size))<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 goto overflow;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0if (newc)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0initrd_ctx-&gt;size =3D ALIGN_UP (in=
itrd_ctx-&gt;size, 4);<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 initrd_ctx-&gt;size +=3D ALIGN_UP (sizeof=
 (struct newc_head)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 + sizeof (&quot;TR=
AILER!!!&quot;) - 1, 4);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 if (grub_add (initrd_ctx-&gt;size,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ALIGN_UP (sizeof (struct newc_head)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 + sizeof (&quot;TRAILER!!!&quot;) - 1, =
4),<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 &amp;initrd_ctx-&gt;size))<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 goto overflow;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0free_dir (root);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0root =3D 0;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; -=C2=A0 =C2=A0<br>
&gt; &gt; -=C2=A0 =C2=A0return GRUB_ERR_NONE;<br>
&gt; &gt; -+<br>
&gt; &gt; -+ overflow:<br>
&gt; &gt; -+=C2=A0 free_dir (root);<br>
&gt; &gt; -+=C2=A0 grub_initrd_close (initrd_ctx);<br>
&gt; &gt; -+=C2=A0 return grub_error (GRUB_ERR_OUT_OF_RANGE, N_(&quot;over=
flow is<br>
&gt; &gt; detected&quot;));<br>
&gt; &gt; - }<br>
&gt; &gt; - <br>
&gt; &gt; - grub_size_t<br>
&gt; &gt; -@@ -261,8 +287,16 @@ grub_initrd_load (struct<br>
&gt; &gt; grub_linux_initrd_context *initrd_ctx,<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (initrd_ctx-&gt;components[i].new=
c_name)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 ptr +=3D insert_dir (initrd_ctx-&g=
t;components[i].newc_name,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;root, ptr);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_size_t dir_size;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (insert_dir (initrd_ctx-&gt;com=
ponents[i].newc_name, &amp;root,<br>
&gt; &gt; ptr,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 &amp;dir_size))<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 free_dir (root);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_initrd_close (i=
nitrd_ctx);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return grub_errno;<b=
r>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ptr +=3D dir_size;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D make_header (ptr, ini=
trd_ctx-<br>
&gt; &gt; &gt; components[i].newc_name,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_strlen (initrd_ctx-<br>
&gt; &gt; &gt; components[i].newc_name),<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0100777,<br>
&gt; &gt; --- <br>
&gt; &gt; -2.14.4<br>
&gt; &gt; -<br>
&gt; &gt; diff --git a/meta/recipes-bsp/grub/files/autogen.sh-exclude-pc.p=
atch<br>
&gt; &gt; b/meta/recipes-bsp/grub/files/autogen.sh-exclude-pc.patch<br>
&gt; &gt; index faa7fde232..1323a54a59 100644<br>
&gt; &gt; --- a/meta/recipes-bsp/grub/files/autogen.sh-exclude-pc.patch<br=
>
&gt; &gt; +++ b/meta/recipes-bsp/grub/files/autogen.sh-exclude-pc.patch<br=
>
&gt; &gt; @@ -1,6 +1,6 @@<br>
&gt; &gt; -From 72c30928d3d461e0e2d20c5ff33bd96b6991d585 Mon Sep 17 00:00:=
00<br>
&gt; &gt; 2001<br>
&gt; &gt; -From: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.c=
om" target=3D"_blank">liezhi.yang@windriver.com</a>&gt;<br>
&gt; &gt; -Date: Sat, 25 Jan 2014 23:49:44 -0500<br>
&gt; &gt; +From 8790aa8bea736f52341a0430ff3e317d3be0f99b Mon Sep 17 00:00:=
00<br>
&gt; &gt; 2001<br>
&gt; &gt; +From: Naveen Saini &lt;<a href=3D"mailto:naveen.kumar.saini@int=
el.com" target=3D"_blank">naveen.kumar.saini@intel.com</a>&gt;<br>
&gt; &gt; +Date: Mon, 15 Mar 2021 14:44:15 +0800<br>
&gt; &gt; =C2=A0Subject: [PATCH] autogen.sh: exclude .pc from po/POTFILES.=
in<br>
&gt; &gt; <br>
&gt; &gt; =C2=A0Exclude the .pc from po/POTFILES.in since quilt uses &quot=
;patch --<br>
&gt; &gt; backup&quot;,<br>
&gt; &gt; @@ -13,23 +13,24 @@ Upstream-Status: Inappropriate [OE specific]=
<br>
&gt; &gt; <br>
&gt; &gt; =C2=A0Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.ya=
ng@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</a>&gt;<br>
&gt; &gt; =C2=A0Signed-off-by: Anuj Mittal &lt;<a href=3D"mailto:anuj.mitt=
al@intel.com" target=3D"_blank">anuj.mittal@intel.com</a>&gt;<br>
&gt; &gt; +Signed-off-by: Naveen Saini &lt;<a href=3D"mailto:naveen.kumar.=
saini@intel.com" target=3D"_blank">naveen.kumar.saini@intel.com</a>&gt;<br>
&gt; &gt; =C2=A0---<br>
&gt; &gt; =C2=A0 autogen.sh | 2 +-<br>
&gt; &gt; =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt; <br>
&gt; &gt; =C2=A0diff --git a/autogen.sh b/autogen.sh<br>
&gt; &gt; -index ef43270..a7067a7 100755<br>
&gt; &gt; +index 31b0ced7e..c63ae766c 100755<br>
&gt; &gt; =C2=A0--- a/autogen.sh<br>
&gt; &gt; =C2=A0+++ b/autogen.sh<br>
&gt; &gt; =C2=A0@@ -13,7 +13,7 @@ fi<br>
&gt; &gt; =C2=A0 export LC_COLLATE=3DC<br>
&gt; &gt; =C2=A0 unset LC_ALL<br>
&gt; &gt; <br>
&gt; &gt; --find . -iname &#39;*.[ch]&#39; ! -ipath &#39;./grub-core/lib/l=
ibgcrypt-grub/*&#39;<br>
&gt; &gt; ! -ipath &#39;./build-aux/*&#39; ! -ipath &#39;./grub-<br>
&gt; &gt; core/lib/libgcrypt/src/misc.c&#39; ! -ipath &#39;./grub-<br>
&gt; &gt; core/lib/libgcrypt/src/global.c&#39; ! -ipath &#39;./grub-<br>
&gt; &gt; core/lib/libgcrypt/src/secmem.c&#39;=C2=A0 ! -ipath &#39;./util/=
grub-gen-<br>
&gt; &gt; widthspec.c&#39; ! -ipath &#39;./util/grub-gen-asciih.c&#39; ! -=
ipath<br>
&gt; &gt; &#39;./gnulib/*&#39; ! -iname &#39;./grub-core/lib/gnulib/*&#39;=
 |sort &gt;<br>
&gt; &gt; po/POTFILES.in<br>
&gt; &gt; -+find . -iname &#39;*.[ch]&#39; ! -ipath &#39;./grub-core/lib/l=
ibgcrypt-grub/*&#39;<br>
&gt; &gt; ! -ipath &#39;./build-aux/*&#39; ! -ipath &#39;./grub-<br>
&gt; &gt; core/lib/libgcrypt/src/misc.c&#39; ! -ipath &#39;./grub-<br>
&gt; &gt; core/lib/libgcrypt/src/global.c&#39; ! -ipath &#39;./grub-<br>
&gt; &gt; core/lib/libgcrypt/src/secmem.c&#39;=C2=A0 ! -ipath &#39;./util/=
grub-gen-<br>
&gt; &gt; widthspec.c&#39; ! -ipath &#39;./util/grub-gen-asciih.c&#39; ! -=
ipath<br>
&gt; &gt; &#39;./gnulib/*&#39; ! -iname &#39;./grub-core/lib/gnulib/*&#39;=
 ! -path &#39;./.pc/*&#39;<br>
&gt; &gt; |sort &gt; po/POTFILES.in<br>
&gt; &gt; +-find . -iname &#39;*.[ch]&#39; ! -ipath &#39;./grub-core/lib/l=
ibgcrypt-grub/*&#39;<br>
&gt; &gt; ! -ipath &#39;./build-aux/*&#39; ! -ipath &#39;./grub-<br>
&gt; &gt; core/lib/libgcrypt/src/misc.c&#39; ! -ipath &#39;./grub-<br>
&gt; &gt; core/lib/libgcrypt/src/global.c&#39; ! -ipath &#39;./grub-<br>
&gt; &gt; core/lib/libgcrypt/src/secmem.c&#39;=C2=A0 ! -ipath &#39;./util/=
grub-gen-<br>
&gt; &gt; widthspec.c&#39; ! -ipath &#39;./util/grub-gen-asciih.c&#39; ! -=
ipath<br>
&gt; &gt; &#39;./gnulib/*&#39; ! -ipath &#39;./grub-core/lib/gnulib/*&#39;=
 |sort &gt;<br>
&gt; &gt; po/POTFILES.in<br>
&gt; &gt; ++find . -iname &#39;*.[ch]&#39; ! -ipath &#39;./grub-core/lib/l=
ibgcrypt-grub/*&#39;<br>
&gt; &gt; ! -ipath &#39;./build-aux/*&#39; ! -ipath &#39;./grub-<br>
&gt; &gt; core/lib/libgcrypt/src/misc.c&#39; ! -ipath &#39;./grub-<br>
&gt; &gt; core/lib/libgcrypt/src/global.c&#39; ! -ipath &#39;./grub-<br>
&gt; &gt; core/lib/libgcrypt/src/secmem.c&#39;=C2=A0 ! -ipath &#39;./util/=
grub-gen-<br>
&gt; &gt; widthspec.c&#39; ! -ipath &#39;./util/grub-gen-asciih.c&#39; ! -=
ipath<br>
&gt; &gt; &#39;./gnulib/*&#39; ! -ipath &#39;./grub-core/lib/gnulib/*&#39;=
 ! -path &#39;./.pc/*&#39;<br>
&gt; &gt; |sort &gt; po/POTFILES.in<br>
&gt; &gt; =C2=A0 find util -iname &#39;*.in&#39; ! -name Makefile.in=C2=A0=
 |sort &gt; po/POTFILES-<br>
&gt; &gt; <a href=3D"http://shell.in" rel=3D"noreferrer" target=3D"_blank"=
>shell.in</a><br>
&gt; &gt; <br>
&gt; &gt; =C2=A0 echo &quot;Importing unicode...&quot;<br>
&gt; &gt; =C2=A0-- <br>
&gt; &gt; -2.7.4<br>
&gt; &gt; +2.17.1<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta/recipes-bsp/grub/files/calloc-Make-sure-we-alw=
ays-<br>
&gt; &gt; have-an-overflow-checking.patch b/meta/recipes-bsp/grub/files/ca=
lloc-<br>
&gt; &gt; Make-sure-we-always-have-an-overflow-checking.patch<br>
&gt; &gt; deleted file mode 100644<br>
&gt; &gt; index c9536e68ef..0000000000<br>
&gt; &gt; --- a/meta/recipes-bsp/grub/files/calloc-Make-sure-we-always-hav=
e-an-<br>
&gt; &gt; overflow-checking.patch<br>
&gt; &gt; +++ /dev/null<br>
&gt; &gt; @@ -1,246 +0,0 @@<br>
&gt; &gt; -From c005f62f5c4b26a77b916c8f76a852324439ecb3 Mon Sep 17 00:00:=
00<br>
&gt; &gt; 2001<br>
&gt; &gt; -From: Peter Jones &lt;<a href=3D"mailto:pjones@redhat.com" targ=
et=3D"_blank">pjones@redhat.com</a>&gt;<br>
&gt; &gt; -Date: Mon, 15 Jun 2020 12:15:29 -0400<br>
&gt; &gt; -Subject: [PATCH 2/9] calloc: Make sure we always have an overfl=
ow-<br>
&gt; &gt; checking<br>
&gt; &gt; - calloc() available<br>
&gt; &gt; -<br>
&gt; &gt; -This tries to make sure that everywhere in this source tree, we=
<br>
&gt; &gt; always have<br>
&gt; &gt; -an appropriate version of calloc() (i.e. grub_calloc(), xcalloc=
(),<br>
&gt; &gt; etc.)<br>
&gt; &gt; -available, and that they all safely check for overflow and retu=
rn<br>
&gt; &gt; NULL when<br>
&gt; &gt; -it would occur.<br>
&gt; &gt; -<br>
&gt; &gt; -Upstream-Status: Backport [commit<br>
&gt; &gt; 64e26162ebfe68317c143ca5ec996c892019f8f8<br>
&gt; &gt; -from <a href=3D"https://git.savannah.gnu.org/git/grub.git" rel=
=3D"noreferrer" target=3D"_blank">https://git.savannah.gnu.org/git/grub.gi=
t</a>]<br>
&gt; &gt; -<br>
&gt; &gt; -Signed-off-by: Peter Jones &lt;<a href=3D"mailto:pjones@redhat.=
com" target=3D"_blank">pjones@redhat.com</a>&gt;<br>
&gt; &gt; -Reviewed-by: Daniel Kiper &lt;<a href=3D"mailto:daniel.kiper@or=
acle.com" target=3D"_blank">daniel.kiper@oracle.com</a>&gt;<br>
&gt; &gt; -Signed-off-by: Yongxin Liu &lt;<a href=3D"mailto:yongxin.liu@wi=
ndriver.com" target=3D"_blank">yongxin.liu@windriver.com</a>&gt;<br>
&gt; &gt; ----<br>
&gt; &gt; - grub-core/kern/emu/misc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
12 ++++++++++++<br>
&gt; &gt; - grub-core/kern/emu/mm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 10 ++++++++++<br>
&gt; &gt; - grub-core/kern/mm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 40<br>
&gt; &gt; ++++++++++++++++++++++++++++++++++++++<br>
&gt; &gt; - grub-core/lib/libgcrypt_wrap/mem.c | 11 +++++++++--<br>
&gt; &gt; - grub-core/lib/posix_wrap/stdlib.h=C2=A0 |=C2=A0 8 +++++++-<br>
&gt; &gt; - include/grub/emu/misc.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 1 +<br>
&gt; &gt; - include/grub/mm.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 |=C2=A0 6 ++++++<br>
&gt; &gt; - 7 files changed, 85 insertions(+), 3 deletions(-)<br>
&gt; &gt; -<br>
&gt; &gt; -diff --git a/grub-core/kern/emu/misc.c b/grub-core/kern/emu/mis=
c.c<br>
&gt; &gt; -index 65db79b..dfd8a8e 100644<br>
&gt; &gt; ---- a/grub-core/kern/emu/misc.c<br>
&gt; &gt; -+++ b/grub-core/kern/emu/misc.c<br>
&gt; &gt; -@@ -85,6 +85,18 @@ grub_util_error (const char *fmt, ...)<br>
&gt; &gt; -=C2=A0 =C2=A0exit (1);<br>
&gt; &gt; - }<br>
&gt; &gt; - <br>
&gt; &gt; -+void *<br>
&gt; &gt; -+xcalloc (grub_size_t nmemb, grub_size_t size)<br>
&gt; &gt; -+{<br>
&gt; &gt; -+=C2=A0 void *p;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 p =3D calloc (nmemb, size);<br>
&gt; &gt; -+=C2=A0 if (!p)<br>
&gt; &gt; -+=C2=A0 =C2=A0 grub_util_error (&quot;%s&quot;, _(&quot;out of =
memory&quot;));<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 return p;<br>
&gt; &gt; -+}<br>
&gt; &gt; -+<br>
&gt; &gt; - void *<br>
&gt; &gt; - xmalloc (grub_size_t size)<br>
&gt; &gt; - {<br>
&gt; &gt; -diff --git a/grub-core/kern/emu/mm.c b/grub-core/kern/emu/mm.c<=
br>
&gt; &gt; -index f262e95..145b01d 100644<br>
&gt; &gt; ---- a/grub-core/kern/emu/mm.c<br>
&gt; &gt; -+++ b/grub-core/kern/emu/mm.c<br>
&gt; &gt; -@@ -25,6 +25,16 @@<br>
&gt; &gt; - #include &lt;string.h&gt;<br>
&gt; &gt; - #include &lt;grub/i18n.h&gt;<br>
&gt; &gt; - <br>
&gt; &gt; -+void *<br>
&gt; &gt; -+grub_calloc (grub_size_t nmemb, grub_size_t size)<br>
&gt; &gt; -+{<br>
&gt; &gt; -+=C2=A0 void *ret;<br>
&gt; &gt; -+=C2=A0 ret =3D calloc (nmemb, size);<br>
&gt; &gt; -+=C2=A0 if (!ret)<br>
&gt; &gt; -+=C2=A0 =C2=A0 grub_error (GRUB_ERR_OUT_OF_MEMORY, N_(&quot;out=
 of memory&quot;));<br>
&gt; &gt; -+=C2=A0 return ret;<br>
&gt; &gt; -+}<br>
&gt; &gt; -+<br>
&gt; &gt; - void *<br>
&gt; &gt; - grub_malloc (grub_size_t size)<br>
&gt; &gt; - {<br>
&gt; &gt; -diff --git a/grub-core/kern/mm.c b/grub-core/kern/mm.c<br>
&gt; &gt; -index ee88ff6..f2822a8 100644<br>
&gt; &gt; ---- a/grub-core/kern/mm.c<br>
&gt; &gt; -+++ b/grub-core/kern/mm.c<br>
&gt; &gt; -@@ -67,8 +67,10 @@<br>
&gt; &gt; - #include &lt;grub/dl.h&gt;<br>
&gt; &gt; - #include &lt;grub/i18n.h&gt;<br>
&gt; &gt; - #include &lt;grub/mm_private.h&gt;<br>
&gt; &gt; -+#include &lt;grub/safemath.h&gt;<br>
&gt; &gt; - <br>
&gt; &gt; - #ifdef MM_DEBUG<br>
&gt; &gt; -+# undef grub_calloc<br>
&gt; &gt; - # undef grub_malloc<br>
&gt; &gt; - # undef grub_zalloc<br>
&gt; &gt; - # undef grub_realloc<br>
&gt; &gt; -@@ -375,6 +377,30 @@ grub_memalign (grub_size_t align, grub_siz=
e_t<br>
&gt; &gt; size)<br>
&gt; &gt; -=C2=A0 =C2=A0return 0;<br>
&gt; &gt; - }<br>
&gt; &gt; - <br>
&gt; &gt; -+/*<br>
&gt; &gt; -+ * Allocate NMEMB instances of SIZE bytes and return the point=
er,<br>
&gt; &gt; or error on<br>
&gt; &gt; -+ * integer overflow.<br>
&gt; &gt; -+ */<br>
&gt; &gt; -+void *<br>
&gt; &gt; -+grub_calloc (grub_size_t nmemb, grub_size_t size)<br>
&gt; &gt; -+{<br>
&gt; &gt; -+=C2=A0 void *ret;<br>
&gt; &gt; -+=C2=A0 grub_size_t sz =3D 0;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 if (grub_mul (nmemb, size, &amp;sz))<br>
&gt; &gt; -+=C2=A0 =C2=A0 {<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 grub_error (GRUB_ERR_OUT_OF_RANGE, N_(&qu=
ot;overflow is<br>
&gt; &gt; detected&quot;));<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 return NULL;<br>
&gt; &gt; -+=C2=A0 =C2=A0 }<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 ret =3D grub_memalign (0, sz);<br>
&gt; &gt; -+=C2=A0 if (!ret)<br>
&gt; &gt; -+=C2=A0 =C2=A0 return NULL;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 grub_memset (ret, 0, sz);<br>
&gt; &gt; -+=C2=A0 return ret;<br>
&gt; &gt; -+}<br>
&gt; &gt; -+<br>
&gt; &gt; - /* Allocate SIZE bytes and return the pointer.=C2=A0 */<br>
&gt; &gt; - void *<br>
&gt; &gt; - grub_malloc (grub_size_t size)<br>
&gt; &gt; -@@ -561,6 +587,20 @@ grub_mm_dump (unsigned lineno)<br>
&gt; &gt; -=C2=A0 =C2=A0grub_printf (&quot;\n&quot;);<br>
&gt; &gt; - }<br>
&gt; &gt; - <br>
&gt; &gt; -+void *<br>
&gt; &gt; -+grub_debug_calloc (const char *file, int line, grub_size_t nme=
mb,<br>
&gt; &gt; grub_size_t size)<br>
&gt; &gt; -+{<br>
&gt; &gt; -+=C2=A0 void *ptr;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 if (grub_mm_debug)<br>
&gt; &gt; -+=C2=A0 =C2=A0 grub_printf (&quot;%s:%d: calloc (0x%&quot; PRIx=
GRUB_SIZE &quot;, 0x%&quot;<br>
&gt; &gt; PRIxGRUB_SIZE &quot;) =3D &quot;,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file, l=
ine, size);<br>
&gt; &gt; -+=C2=A0 ptr =3D grub_calloc (nmemb, size);<br>
&gt; &gt; -+=C2=A0 if (grub_mm_debug)<br>
&gt; &gt; -+=C2=A0 =C2=A0 grub_printf (&quot;%p\n&quot;, ptr);<br>
&gt; &gt; -+=C2=A0 return ptr;<br>
&gt; &gt; -+}<br>
&gt; &gt; -+<br>
&gt; &gt; - void *<br>
&gt; &gt; - grub_debug_malloc (const char *file, int line, grub_size_t siz=
e)<br>
&gt; &gt; - {<br>
&gt; &gt; -diff --git a/grub-core/lib/libgcrypt_wrap/mem.c b/grub-<br>
&gt; &gt; core/lib/libgcrypt_wrap/mem.c<br>
&gt; &gt; -index beeb661..74c6eaf 100644<br>
&gt; &gt; ---- a/grub-core/lib/libgcrypt_wrap/mem.c<br>
&gt; &gt; -+++ b/grub-core/lib/libgcrypt_wrap/mem.c<br>
&gt; &gt; -@@ -4,6 +4,7 @@<br>
&gt; &gt; - #include &lt;grub/crypto.h&gt;<br>
&gt; &gt; - #include &lt;grub/dl.h&gt;<br>
&gt; &gt; - #include &lt;grub/env.h&gt;<br>
&gt; &gt; -+#include &lt;grub/safemath.h&gt;<br>
&gt; &gt; - <br>
&gt; &gt; - GRUB_MOD_LICENSE (&quot;GPLv3+&quot;);<br>
&gt; &gt; - <br>
&gt; &gt; -@@ -36,7 +37,10 @@ void *<br>
&gt; &gt; - gcry_xcalloc (size_t n, size_t m)<br>
&gt; &gt; - {<br>
&gt; &gt; -=C2=A0 =C2=A0void *ret;<br>
&gt; &gt; --=C2=A0 ret =3D grub_zalloc (n * m);<br>
&gt; &gt; -+=C2=A0 size_t sz;<br>
&gt; &gt; -+=C2=A0 if (grub_mul (n, m, &amp;sz))<br>
&gt; &gt; -+=C2=A0 =C2=A0 grub_fatal (&quot;gcry_xcalloc would overflow&qu=
ot;);<br>
&gt; &gt; -+=C2=A0 ret =3D grub_zalloc (sz);<br>
&gt; &gt; -=C2=A0 =C2=A0if (!ret)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0grub_fatal (&quot;gcry_xcalloc failed&quot;=
);<br>
&gt; &gt; -=C2=A0 =C2=A0return ret;<br>
&gt; &gt; -@@ -56,7 +60,10 @@ void *<br>
&gt; &gt; - gcry_xcalloc_secure (size_t n, size_t m)<br>
&gt; &gt; - {<br>
&gt; &gt; -=C2=A0 =C2=A0void *ret;<br>
&gt; &gt; --=C2=A0 ret =3D grub_zalloc (n * m);<br>
&gt; &gt; -+=C2=A0 size_t sz;<br>
&gt; &gt; -+=C2=A0 if (grub_mul (n, m, &amp;sz))<br>
&gt; &gt; -+=C2=A0 =C2=A0 grub_fatal (&quot;gcry_xcalloc would overflow&qu=
ot;);<br>
&gt; &gt; -+=C2=A0 ret =3D grub_zalloc (sz);<br>
&gt; &gt; -=C2=A0 =C2=A0if (!ret)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0grub_fatal (&quot;gcry_xcalloc failed&quot;=
);<br>
&gt; &gt; -=C2=A0 =C2=A0return ret;<br>
&gt; &gt; -diff --git a/grub-core/lib/posix_wrap/stdlib.h b/grub-<br>
&gt; &gt; core/lib/posix_wrap/stdlib.h<br>
&gt; &gt; -index 3b46f47..7a8d385 100644<br>
&gt; &gt; ---- a/grub-core/lib/posix_wrap/stdlib.h<br>
&gt; &gt; -+++ b/grub-core/lib/posix_wrap/stdlib.h<br>
&gt; &gt; -@@ -21,6 +21,7 @@<br>
&gt; &gt; - <br>
&gt; &gt; - #include &lt;grub/mm.h&gt;<br>
&gt; &gt; - #include &lt;grub/misc.h&gt;<br>
&gt; &gt; -+#include &lt;grub/safemath.h&gt;<br>
&gt; &gt; - <br>
&gt; &gt; - static inline void <br>
&gt; &gt; - free (void *ptr)<br>
&gt; &gt; -@@ -37,7 +38,12 @@ malloc (grub_size_t size)<br>
&gt; &gt; - static inline void *<br>
&gt; &gt; - calloc (grub_size_t size, grub_size_t nelem)<br>
&gt; &gt; - {<br>
&gt; &gt; --=C2=A0 return grub_zalloc (size * nelem);<br>
&gt; &gt; -+=C2=A0 grub_size_t sz;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 if (grub_mul (size, nelem, &amp;sz))<br>
&gt; &gt; -+=C2=A0 =C2=A0 return NULL;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 return grub_zalloc (sz);<br>
&gt; &gt; - }<br>
&gt; &gt; - <br>
&gt; &gt; - static inline void *<br>
&gt; &gt; -diff --git a/include/grub/emu/misc.h b/include/grub/emu/misc.h<=
br>
&gt; &gt; -index ce464cf..ff9c48a 100644<br>
&gt; &gt; ---- a/include/grub/emu/misc.h<br>
&gt; &gt; -+++ b/include/grub/emu/misc.h<br>
&gt; &gt; -@@ -47,6 +47,7 @@ grub_util_device_is_mapped (const char *dev);=
<br>
&gt; &gt; - #define GRUB_HOST_PRIuLONG_LONG &quot;llu&quot;<br>
&gt; &gt; - #define GRUB_HOST_PRIxLONG_LONG &quot;llx&quot;<br>
&gt; &gt; - <br>
&gt; &gt; -+void * EXPORT_FUNC(xcalloc) (grub_size_t nmemb, grub_size_t si=
ze)<br>
&gt; &gt; WARN_UNUSED_RESULT;<br>
&gt; &gt; - void * EXPORT_FUNC(xmalloc) (grub_size_t size) WARN_UNUSED_RES=
ULT;<br>
&gt; &gt; - void * EXPORT_FUNC(xrealloc) (void *ptr, grub_size_t size)<br>
&gt; &gt; WARN_UNUSED_RESULT;<br>
&gt; &gt; - char * EXPORT_FUNC(xstrdup) (const char *str) WARN_UNUSED_RESU=
LT;<br>
&gt; &gt; -diff --git a/include/grub/mm.h b/include/grub/mm.h<br>
&gt; &gt; -index 28e2e53..9c38dd3 100644<br>
&gt; &gt; ---- a/include/grub/mm.h<br>
&gt; &gt; -+++ b/include/grub/mm.h<br>
&gt; &gt; -@@ -29,6 +29,7 @@<br>
&gt; &gt; - #endif<br>
&gt; &gt; - <br>
&gt; &gt; - void grub_mm_init_region (void *addr, grub_size_t size);<br>
&gt; &gt; -+void *EXPORT_FUNC(grub_calloc) (grub_size_t nmemb, grub_size_t=
<br>
&gt; &gt; size);<br>
&gt; &gt; - void *EXPORT_FUNC(grub_malloc) (grub_size_t size);<br>
&gt; &gt; - void *EXPORT_FUNC(grub_zalloc) (grub_size_t size);<br>
&gt; &gt; - void EXPORT_FUNC(grub_free) (void *ptr);<br>
&gt; &gt; -@@ -48,6 +49,9 @@ extern int EXPORT_VAR(grub_mm_debug);<br>
&gt; &gt; - void grub_mm_dump_free (void);<br>
&gt; &gt; - void grub_mm_dump (unsigned lineno);<br>
&gt; &gt; - <br>
&gt; &gt; -+#define grub_calloc(nmemb, size)=C2=A0 =C2=A0 =C2=A0 \<br>
&gt; &gt; -+=C2=A0 grub_debug_calloc (GRUB_FILE, __LINE__, nmemb, size)<br=
>
&gt; &gt; -+<br>
&gt; &gt; - #define grub_malloc(size)=C2=A0 =C2=A0 =C2=A0\<br>
&gt; &gt; -=C2=A0 =C2=A0grub_debug_malloc (GRUB_FILE, __LINE__, size)<br>
&gt; &gt; - <br>
&gt; &gt; -@@ -63,6 +67,8 @@ void grub_mm_dump (unsigned lineno);<br>
&gt; &gt; - #define grub_free(ptr)=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; &gt; -=C2=A0 =C2=A0grub_debug_free (GRUB_FILE, __LINE__, ptr)<br>
&gt; &gt; - <br>
&gt; &gt; -+void *EXPORT_FUNC(grub_debug_calloc) (const char *file, int li=
ne,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_size_t=
 nmemb, grub_size_t<br>
&gt; &gt; size);<br>
&gt; &gt; - void *EXPORT_FUNC(grub_debug_malloc) (const char *file, int li=
ne,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_=
size_t size);<br>
&gt; &gt; - void *EXPORT_FUNC(grub_debug_zalloc) (const char *file, int li=
ne,<br>
&gt; &gt; --- <br>
&gt; &gt; -2.14.4<br>
&gt; &gt; -<br>
&gt; &gt; diff --git a/meta/recipes-bsp/grub/files/determinism.patch<br>
&gt; &gt; b/meta/recipes-bsp/grub/files/determinism.patch<br>
&gt; &gt; index 3c1f562c71..2828e80975 100644<br>
&gt; &gt; --- a/meta/recipes-bsp/grub/files/determinism.patch<br>
&gt; &gt; +++ b/meta/recipes-bsp/grub/files/determinism.patch<br>
&gt; &gt; @@ -1,6 +1,9 @@<br>
&gt; &gt; -The output in moddep.lst generated from syminfo.lst using<br>
&gt; &gt; genmoddep.awk is<br>
&gt; &gt; -not deterministic since the order of the dependencies on each l=
ine<br>
&gt; &gt; can vary<br>
&gt; &gt; -depending on how awk sorts the values in the array.<br>
&gt; &gt; +From b6f9b3f6fa782807c4a7ec16ee8ef868cdfbf468 Mon Sep 17 00:00:=
00<br>
&gt; &gt; 2001<br>
&gt; &gt; +From: Naveen Saini &lt;<a href=3D"mailto:naveen.kumar.saini@int=
el.com" target=3D"_blank">naveen.kumar.saini@intel.com</a>&gt;<br>
&gt; &gt; +Date: Mon, 15 Mar 2021 14:56:18 +0800<br>
&gt; &gt; +Subject: [PATCH] The output in moddep.lst generated from syminf=
o.lst<br>
&gt; &gt; using<br>
&gt; &gt; + genmoddep.awk is not deterministic since the order of the<br>
&gt; &gt; dependencies on<br>
&gt; &gt; + each line can vary depending on how awk sorts the values in th=
e<br>
&gt; &gt; array.<br>
&gt; &gt; <br>
&gt; &gt; =C2=A0Be deterministic in the output by sorting the dependencies=
 on each<br>
&gt; &gt; line.<br>
&gt; &gt; <br>
&gt; &gt; @@ -13,11 +16,29 @@ keys of the dict.<br>
&gt; &gt; <br>
&gt; &gt; =C2=A0Upstream-Status: Pending<br>
&gt; &gt; =C2=A0Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxf=
oundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;=
<br>
&gt; &gt; +Signed-off-by: Naveen Saini &lt;<a href=3D"mailto:naveen.kumar.=
saini@intel.com" target=3D"_blank">naveen.kumar.saini@intel.com</a>&gt;<br>
&gt; &gt; +---<br>
&gt; &gt; + gentpl.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 1 +<br>
&gt; &gt; + grub-core/genmoddep.awk | 4 +++-<br>
&gt; &gt; + util/import_unicode.py=C2=A0 | 2 +-<br>
&gt; &gt; + 3 files changed, 5 insertions(+), 2 deletions(-)<br>
&gt; &gt; <br>
&gt; &gt; -Index: grub-2.04/grub-core/genmoddep.awk<br>
&gt; &gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt; ---- grub-2.04.orig/grub-core/genmoddep.awk<br>
&gt; &gt; -+++ grub-2.04/grub-core/genmoddep.awk<br>
&gt; &gt; +diff --git a/gentpl.py b/gentpl.py<br>
&gt; &gt; +index c86550d4f..589285192 100644<br>
&gt; &gt; +--- a/gentpl.py<br>
&gt; &gt; ++++ b/gentpl.py<br>
&gt; &gt; +@@ -568,6 +568,7 @@ def foreach_platform_value(defn, platform,<=
br>
&gt; &gt; suffix, closure):<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0for group in RMAP[platform]:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for value in defn.find_all(gr=
oup + suffix):<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r.append(closur=
e(value))<br>
&gt; &gt; ++=C2=A0 =C2=A0 r.sort()<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0return &#39;&#39;.join(r)<br>
&gt; &gt; + <br>
&gt; &gt; + def platform_conditional(platform, closure):<br>
&gt; &gt; +diff --git a/grub-core/genmoddep.awk b/grub-core/genmoddep.awk<=
br>
&gt; &gt; +index 04c2863e5..247436392 100644<br>
&gt; &gt; +--- a/grub-core/genmoddep.awk<br>
&gt; &gt; ++++ b/grub-core/genmoddep.awk<br>
&gt; &gt; =C2=A0@@ -59,7 +59,9 @@ END {<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 modlist =3D &quot;&quot;<br>
&gt; &gt; @@ -29,22 +50,10 @@ Index: grub-2.04/grub-core/genmoddep.awk<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 modlist =3D modlist &quot; &quot; de=
pmod;<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 inverse_dependencies[depmod] =3D inv=
erse_dependencies[depmod] &quot;<br>
&gt; &gt; &quot; mod<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 depcount[mod]++<br>
&gt; &gt; -Index: grub-2.04/gentpl.py<br>
&gt; &gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt; ---- grub-2.04.orig/gentpl.py<br>
&gt; &gt; -+++ grub-2.04/gentpl.py<br>
&gt; &gt; -@@ -568,6 +568,7 @@ def foreach_platform_value(defn, platfor<br=
>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0for group in RMAP[platform]:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for value in defn.find_all(gr=
oup + suffix):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r.append(closur=
e(value))<br>
&gt; &gt; -+=C2=A0 =C2=A0 r.sort()<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return &#39;&#39;.join(r)<br>
&gt; &gt; - <br>
&gt; &gt; - def platform_conditional(platform, closure):<br>
&gt; &gt; -Index: grub-2.04/util/import_unicode.py<br>
&gt; &gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt; ---- grub-2.04.orig/util/import_unicode.py<br>
&gt; &gt; -+++ grub-2.04/util/import_unicode.py<br>
&gt; &gt; +diff --git a/util/import_unicode.py b/util/import_unicode.py<br=
>
&gt; &gt; +index 08f80591e..1f434a069 100644<br>
&gt; &gt; +--- a/util/import_unicode.py<br>
&gt; &gt; ++++ b/util/import_unicode.py<br>
&gt; &gt; =C2=A0@@ -174,7 +174,7 @@ infile.close ()<br>
&gt; &gt; <br>
&gt; &gt; =C2=A0 outfile.write (&quot;struct grub_unicode_arabic_shape<br>
&gt; &gt; grub_unicode_arabic_shapes[] =3D {\n &quot;)<br>
&gt; &gt; @@ -54,3 +63,6 @@ Index: grub-2.04/util/import_unicode.py<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if arabicsubst[x][&#39;join&#=
39;] =3D=3D &quot;DUAL&quot;:<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 outfile.write (=
&quot;{0x%x, 0x%x, 0x%x, 0x%x, 0x%x},\n &quot; %<br>
&gt; &gt; (arabicsubst[x][0], arabicsubst[x][1], arabicsubst[x][2],<br>
&gt; &gt; arabicsubst[x][3], arabicsubst[x][4]))<br>
&gt; &gt; +-- <br>
&gt; &gt; +2.17.1<br>
&gt; &gt; +<br>
&gt; &gt; diff --git a/meta/recipes-bsp/grub/files/lvm-Add-LVM-cache-logic=
al-<br>
&gt; &gt; volume-handling.patch b/meta/recipes-bsp/grub/files/lvm-Add-LVM-=
<br>
&gt; &gt; cache-logical-volume-handling.patch<br>
&gt; &gt; deleted file mode 100644<br>
&gt; &gt; index 2b8157f592..0000000000<br>
&gt; &gt; --- a/meta/recipes-bsp/grub/files/lvm-Add-LVM-cache-logical-volu=
me-<br>
&gt; &gt; handling.patch<br>
&gt; &gt; +++ /dev/null<br>
&gt; &gt; @@ -1,287 +0,0 @@<br>
&gt; &gt; -From 8eb02bcb5897b238b29ff762402bb0c3028f0eab Mon Sep 17 00:00:=
00<br>
&gt; &gt; 2001<br>
&gt; &gt; -From: Michael Chang &lt;<a href=3D"mailto:mchang@suse.com" targ=
et=3D"_blank">mchang@suse.com</a>&gt;<br>
&gt; &gt; -Date: Thu, 19 Mar 2020 13:56:13 +0800<br>
&gt; &gt; -Subject: [PATCH 3/9] lvm: Add LVM cache logical volume handling=
<br>
&gt; &gt; -<br>
&gt; &gt; -The LVM cache logical volume is the logical volume consisting o=
f the<br>
&gt; &gt; original<br>
&gt; &gt; -and the cache pool logical volume. The original is usually on a=
<br>
&gt; &gt; larger and<br>
&gt; &gt; -slower storage device while the cache pool is on a smaller and<=
br>
&gt; &gt; faster one. The<br>
&gt; &gt; -performance of the original volume can be improved by storing t=
he<br>
&gt; &gt; frequently<br>
&gt; &gt; -used data on the cache pool to utilize the greater performance =
of<br>
&gt; &gt; faster<br>
&gt; &gt; -device.<br>
&gt; &gt; -<br>
&gt; &gt; -The default cache mode &quot;writethrough&quot; ensures that an=
y data written<br>
&gt; &gt; will be<br>
&gt; &gt; -stored both in the cache and on the origin LV, therefore grub c=
an be<br>
&gt; &gt; straight<br>
&gt; &gt; -to read the original lv as no data loss is guarenteed.<br>
&gt; &gt; -<br>
&gt; &gt; -The second cache mode is &quot;writeback&quot;, which delays wr=
iting from the<br>
&gt; &gt; cache pool<br>
&gt; &gt; -back to the origin LV to have increased performance. The drawba=
ck is<br>
&gt; &gt; potential<br>
&gt; &gt; -data loss if losing the associated cache device.<br>
&gt; &gt; -<br>
&gt; &gt; -During the boot time grub reads the LVM offline i.e. LVM volume=
s are<br>
&gt; &gt; not<br>
&gt; &gt; -activated and mounted, hence it should be fine to read directly=
 from<br>
&gt; &gt; original<br>
&gt; &gt; -lv since all cached data should have been flushed back in the<b=
r>
&gt; &gt; process of taking<br>
&gt; &gt; -it offline.<br>
&gt; &gt; -<br>
&gt; &gt; -It is also not much helpful to the situation by adding fsync ca=
lls<br>
&gt; &gt; to the<br>
&gt; &gt; -install code. The fsync did not force to write back dirty cache=
 to<br>
&gt; &gt; the original<br>
&gt; &gt; -device and rather it would update associated cache metadata to<=
br>
&gt; &gt; complete the<br>
&gt; &gt; -write transaction with the cache device. IOW the writes to cach=
ed<br>
&gt; &gt; blocks still<br>
&gt; &gt; -go only to the cache device.<br>
&gt; &gt; -<br>
&gt; &gt; -To write back dirty cache, as LVM cache did not support dirty c=
ache<br>
&gt; &gt; flush per<br>
&gt; &gt; -block range, there&#39;no way to do it for file. On the other h=
and the<br>
&gt; &gt; &quot;cleaner&quot;<br>
&gt; &gt; -policy is implemented and can be used to write back &quot;all&q=
uot; dirty<br>
&gt; &gt; blocks in a<br>
&gt; &gt; -cache, which effectively drain all dirty cache gradually to att=
ain<br>
&gt; &gt; and last in<br>
&gt; &gt; -the &quot;clean&quot; state, which can be useful for shrinking =
or<br>
&gt; &gt; decommissioning a<br>
&gt; &gt; -cache. The result and effect is not what we are looking for her=
e.<br>
&gt; &gt; -<br>
&gt; &gt; -In conclusion, as it seems no way to enforce file writes to the=
<br>
&gt; &gt; original<br>
&gt; &gt; -device, grub may suffer from power failure as it cannot assembl=
e the<br>
&gt; &gt; cache<br>
&gt; &gt; -device and read the dirty data from it. However since the case =
is<br>
&gt; &gt; only<br>
&gt; &gt; -applicable to writeback mode which is sensitive to data lost in=
<br>
&gt; &gt; nature, I&#39;d<br>
&gt; &gt; -still like to propose my (relatively simple) patch and treat re=
ading<br>
&gt; &gt; dirty<br>
&gt; &gt; -cache as improvement.<br>
&gt; &gt; -<br>
&gt; &gt; -Upstream-Status: Backport [commit<br>
&gt; &gt; 0454b0445393aafc5600e92ef0c39494e333b135<br>
&gt; &gt; -from <a href=3D"https://git.savannah.gnu.org/git/grub.git" rel=
=3D"noreferrer" target=3D"_blank">https://git.savannah.gnu.org/git/grub.gi=
t</a>]<br>
&gt; &gt; -<br>
&gt; &gt; -Signed-off-by: Michael Chang &lt;<a href=3D"mailto:mchang@suse.=
com" target=3D"_blank">mchang@suse.com</a>&gt;<br>
&gt; &gt; -Reviewed-by: Daniel Kiper &lt;<a href=3D"mailto:daniel.kiper@or=
acle.com" target=3D"_blank">daniel.kiper@oracle.com</a>&gt;<br>
&gt; &gt; -Signed-off-by: Yongxin Liu &lt;<a href=3D"mailto:yongxin.liu@wi=
ndriver.com" target=3D"_blank">yongxin.liu@windriver.com</a>&gt;<br>
&gt; &gt; ----<br>
&gt; &gt; - grub-core/disk/lvm.c | 190<br>
&gt; &gt; +++++++++++++++++++++++++++++++++++++++++++++++++++<br>
&gt; &gt; - 1 file changed, 190 insertions(+)<br>
&gt; &gt; -<br>
&gt; &gt; -diff --git a/grub-core/disk/lvm.c b/grub-core/disk/lvm.c<br>
&gt; &gt; -index 7b265c7..dc6b83b 100644<br>
&gt; &gt; ---- a/grub-core/disk/lvm.c<br>
&gt; &gt; -+++ b/grub-core/disk/lvm.c<br>
&gt; &gt; -@@ -33,6 +33,14 @@<br>
&gt; &gt; - <br>
&gt; &gt; - GRUB_MOD_LICENSE (&quot;GPLv3+&quot;);<br>
&gt; &gt; - <br>
&gt; &gt; -+struct cache_lv<br>
&gt; &gt; -+{<br>
&gt; &gt; -+=C2=A0 struct grub_diskfilter_lv *lv;<br>
&gt; &gt; -+=C2=A0 char *cache_pool;<br>
&gt; &gt; -+=C2=A0 char *origin;<br>
&gt; &gt; -+=C2=A0 struct cache_lv *next;<br>
&gt; &gt; -+};<br>
&gt; &gt; -+<br>
&gt; &gt; - <br>
&gt; &gt; - /* Go the string STR and return the number after STR.=C2=A0 *P=
 will<br>
&gt; &gt; point<br>
&gt; &gt; -=C2=A0 =C2=A0 at the number.=C2=A0 In case STR is not found, *P=
 will be NULL and<br>
&gt; &gt; the<br>
&gt; &gt; -@@ -95,6 +103,34 @@ grub_lvm_check_flag (char *p, const char *s=
tr,<br>
&gt; &gt; const char *flag)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; - }<br>
&gt; &gt; - <br>
&gt; &gt; -+static void<br>
&gt; &gt; -+grub_lvm_free_cache_lvs (struct cache_lv *cache_lvs)<br>
&gt; &gt; -+{<br>
&gt; &gt; -+=C2=A0 struct cache_lv *cache;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 while ((cache =3D cache_lvs))<br>
&gt; &gt; -+=C2=A0 =C2=A0 {<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 cache_lvs =3D cache_lvs-&gt;next;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 if (cache-&gt;lv)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int i;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; cache-&gt;lv-=
&gt;segment_count; ++i)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cache-&gt;lv-&gt;segmen=
ts)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_free (cache-&gt=
;lv-&gt;segments[i].nodes);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_free (cache-&gt;lv-&gt;segmen=
ts);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_free (cache-&gt;lv-&gt;fullna=
me);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_free (cache-&gt;lv-&gt;idname=
);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_free (cache-&gt;lv-&gt;name);=
<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 grub_free (cache-&gt;lv);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 grub_free (cache-&gt;origin);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 grub_free (cache-&gt;cache_pool);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 grub_free (cache);<br>
&gt; &gt; -+=C2=A0 =C2=A0 }<br>
&gt; &gt; -+}<br>
&gt; &gt; -+<br>
&gt; &gt; - static struct grub_diskfilter_vg * <br>
&gt; &gt; - grub_lvm_detect (grub_disk_t disk,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct =
grub_diskfilter_pv_id *id,<br>
&gt; &gt; -@@ -242,6 +278,8 @@ grub_lvm_detect (grub_disk_t disk,<br>
&gt; &gt; - <br>
&gt; &gt; -=C2=A0 =C2=A0if (! vg)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 struct cache_lv *cache_lvs =3D NULL;<br>
&gt; &gt; -+<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0/* First time we see this volume gro=
up. We&#39;ve to create the<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 whole volume group structure. */<br=
>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0vg =3D grub_malloc (sizeof (*vg));<b=
r>
&gt; &gt; -@@ -671,6 +709,106 @@ grub_lvm_detect (grub_disk_t disk,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0seg-&gt;nodes[seg-&gt;node_count - 1].name =3D =
tmp;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0}<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else i=
f (grub_memcmp (p, &quot;cache\&quot;&quot;,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof (&quot;cache=
\&quot;&quot;) - 1) =3D=3D 0)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 {<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 struct cache_lv *cache =3D NULL;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 char *p2, *p3;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 grub_size_t sz;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 cache =3D grub_zalloc (sizeof (*cache));<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if (!cache)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 goto cache_lv_fail;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 cache-&gt;lv =3D grub_zalloc (sizeof (*cache-&gt;lv));<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if (!cache-&gt;lv)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 goto cache_lv_fail;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 grub_memcpy (cache-&gt;lv, lv, sizeof (*cache-<br>
&gt; &gt; &gt; lv));<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if (lv-&gt;fullname)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 {<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 cache-&gt;lv-&gt;fullname =3D grub_strdup (lv-<br>
&gt; &gt; &gt; fullname);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 if (!cache-&gt;lv-&gt;fullname)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cache_lv_fail;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 }<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if (lv-&gt;idname)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 {<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 cache-&gt;lv-&gt;idname =3D grub_strdup (lv-<br>
&gt; &gt; &gt; idname);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 if (!cache-&gt;lv-&gt;idname)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cache_lv_fail;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 }<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if (lv-&gt;name)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 {<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 cache-&gt;lv-&gt;name =3D grub_strdup (lv-&gt;name);<=
br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 if (!cache-&gt;lv-&gt;name)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cache_lv_fail;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 }<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 skip_lv =3D 1;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 p2 =3D grub_strstr (p, &quot;cache_pool =3D \&quot;&quot;);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if (!p2)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 goto cache_lv_fail;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 p2 =3D grub_strchr (p2, &#39;&quot;&#39;);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if (!p2)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 goto cache_lv_fail;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 p3 =3D ++p2;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 p3 =3D grub_strchr (p3, &#39;&quot;&#39;);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if (!p3)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 goto cache_lv_fail;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 sz =3D p3 - p2;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 cache-&gt;cache_pool =3D grub_malloc (sz + 1);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if (!cache-&gt;cache_pool)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 goto cache_lv_fail;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 grub_memcpy (cache-&gt;cache_pool, p2, sz);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 cache-&gt;cache_pool[sz] =3D &#39;\0&#39;;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 p2 =3D grub_strstr (p, &quot;origin =3D \&quot;&quot;);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if (!p2)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 goto cache_lv_fail;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 p2 =3D grub_strchr (p2, &#39;&quot;&#39;);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if (!p2)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 goto cache_lv_fail;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 p3 =3D ++p2;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 p3 =3D grub_strchr (p3, &#39;&quot;&#39;);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if (!p3)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 goto cache_lv_fail;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 sz =3D p3 - p2;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 cache-&gt;origin =3D grub_malloc (sz + 1);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if (!cache-&gt;origin)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 goto cache_lv_fail;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 grub_memcpy (cache-&gt;origin, p2, sz);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 cache-&gt;origin[sz] =3D &#39;\0&#39;;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 cache-&gt;next =3D cache_lvs;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 cache_lvs =3D cache;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 break;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 cache_lv_fail:<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if (cache)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 {<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 grub_free (cache-&gt;origin);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 grub_free (cache-&gt;cache_pool);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 if (cache-&gt;lv)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_free (cache-&gt;lv-&gt;fullname);<=
br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_free (cache-&gt;lv-&gt;idname);<br=
>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_free (cache-&gt;lv-&gt;name);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 grub_free (cache-&gt;lv);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 grub_free (cache);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 }<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 grub_lvm_free_cache_lvs (cache_lvs);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 goto fail4;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 }<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0e=
lse<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0{<br>
&gt; &gt; - #ifdef GRUB_UTIL<br>
&gt; &gt; -@@ -747,6 +885,58 @@ grub_lvm_detect (grub_disk_t disk,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 struct cache_lv *cache;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 for (cache =3D cache_lvs; cache; cache =
=3D cache-&gt;next)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct grub_diskfilter_lv *=
lv;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (lv =3D vg-&gt;lvs; lv;=
 lv =3D lv-&gt;next)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (grub_strcmp (lv-=
&gt;name, cache-&gt;origin) =3D=3D 0)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (lv)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cache-&gt;lv-=
&gt;segments =3D grub_malloc (lv-&gt;segment_count<br>
&gt; &gt; * sizeof (*lv-&gt;segments));<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!cache-&g=
t;lv-&gt;segments)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 grub_lvm_free_cache_lvs (cache_lvs);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 goto fail4;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_memcpy (=
cache-&gt;lv-&gt;segments, lv-&gt;segments, lv-<br>
&gt; &gt; &gt; segment_count * sizeof (*lv-&gt;segments));<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0;=
 i &lt; lv-&gt;segment_count; ++i)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 struct grub_diskfilter_node *nodes =3D lv-<br>
&gt; &gt; &gt; segments[i].nodes;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 grub_size_t node_count =3D lv-<br>
&gt; &gt; &gt; segments[i].node_count;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 cache-&gt;lv-&gt;segments[i].nodes =3D grub_malloc<br>
&gt; &gt; (node_count * sizeof (*nodes));<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 if (!cache-&gt;lv-&gt;segments[i].nodes)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 {<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 for (j =3D 0; j &lt; i; ++j)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 grub_free (cache-&gt;lv-&gt;segments[j].nodes);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 grub_free (cache-&gt;lv-&gt;segments);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 cache-&gt;lv-&gt;segments =3D NULL;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 grub_lvm_free_cache_lvs (cache_lvs);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 goto fail4;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 }<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 grub_memcpy (cache-&gt;lv-&gt;segments[i].nodes, nodes,<br>
&gt; &gt; node_count * sizeof (*nodes));<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cache-&gt=
;lv-&gt;segments)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 cache-&gt;lv-&gt;segment_count =3D lv-&gt;segment_count;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 cache-&gt;lv-&gt;vg =3D vg;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 cache-&gt;lv-&gt;next =3D vg-&gt;lvs;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 vg-&gt;lvs =3D cache-&gt;lv;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 cache-&gt;lv =3D NULL;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 grub_lvm_free_cache_lvs (cache_lvs);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (grub_diskfilter_vg_register (vg)=
)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail4;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; --- <br>
&gt; &gt; -2.14.4<br>
&gt; &gt; -<br>
&gt; &gt; diff --git a/meta/recipes-bsp/grub/files/safemath-Add-some-<br>
&gt; &gt; arithmetic-primitives-that-check-f.patch b/meta/recipes-<br>
&gt; &gt; bsp/grub/files/safemath-Add-some-arithmetic-primitives-that-chec=
k-<br>
&gt; &gt; f.patch<br>
&gt; &gt; deleted file mode 100644<br>
&gt; &gt; index 29021e8d8f..0000000000<br>
&gt; &gt; --- a/meta/recipes-bsp/grub/files/safemath-Add-some-arithmetic-<=
br>
&gt; &gt; primitives-that-check-f.patch<br>
&gt; &gt; +++ /dev/null<br>
&gt; &gt; @@ -1,94 +0,0 @@<br>
&gt; &gt; -From 06c361a71c4998635493610e5d76d0d223925251 Mon Sep 17 00:00:=
00<br>
&gt; &gt; 2001<br>
&gt; &gt; -From: Peter Jones &lt;<a href=3D"mailto:pjones@redhat.com" targ=
et=3D"_blank">pjones@redhat.com</a>&gt;<br>
&gt; &gt; -Date: Mon, 15 Jun 2020 10:58:42 -0400<br>
&gt; &gt; -Subject: [PATCH 5/9] safemath: Add some arithmetic primitives t=
hat<br>
&gt; &gt; check for<br>
&gt; &gt; - overflow<br>
&gt; &gt; -<br>
&gt; &gt; -This adds a new header, include/grub/safemath.h, that includes =
easy<br>
&gt; &gt; to<br>
&gt; &gt; -use wrappers for __builtin_{add,sub,mul}_overflow() declared li=
ke:<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 bool OP(a, b, res)<br>
&gt; &gt; -<br>
&gt; &gt; -where OP is grub_add, grub_sub or grub_mul. OP() returns true i=
n the<br>
&gt; &gt; -case where the operation would overflow and res is not modified=
.<br>
&gt; &gt; -Otherwise, false is returned and the operation is executed.<br>
&gt; &gt; -<br>
&gt; &gt; -These arithmetic primitives require newer compiler versions. So=
,<br>
&gt; &gt; bump<br>
&gt; &gt; -these requirements in the INSTALL file too.<br>
&gt; &gt; -<br>
&gt; &gt; -Upstream-Status: Backport [commit<br>
&gt; &gt; 68708c4503018d61dbcce7ac11cbb511d6425f4d<br>
&gt; &gt; -from <a href=3D"https://git.savannah.gnu.org/git/grub.git" rel=
=3D"noreferrer" target=3D"_blank">https://git.savannah.gnu.org/git/grub.gi=
t</a>]<br>
&gt; &gt; -<br>
&gt; &gt; -Signed-off-by: Peter Jones &lt;<a href=3D"mailto:pjones@redhat.=
com" target=3D"_blank">pjones@redhat.com</a>&gt;<br>
&gt; &gt; -Reviewed-by: Daniel Kiper &lt;<a href=3D"mailto:daniel.kiper@or=
acle.com" target=3D"_blank">daniel.kiper@oracle.com</a>&gt;<br>
&gt; &gt; -[YL: omit the change to INSTALL from original patch]<br>
&gt; &gt; -Signed-off-by: Yongxin Liu &lt;<a href=3D"mailto:yongxin.liu@wi=
ndriver.com" target=3D"_blank">yongxin.liu@windriver.com</a>&gt;<br>
&gt; &gt; ----<br>
&gt; &gt; - include/grub/compiler.h |=C2=A0 8 ++++++++<br>
&gt; &gt; - include/grub/safemath.h | 37 +++++++++++++++++++++++++++++++++=
++++<br>
&gt; &gt; - 2 files changed, 45 insertions(+)<br>
&gt; &gt; - create mode 100644 include/grub/safemath.h<br>
&gt; &gt; -<br>
&gt; &gt; -diff --git a/include/grub/compiler.h b/include/grub/compiler.h<=
br>
&gt; &gt; -index c9e1d7a..8f3be3a 100644<br>
&gt; &gt; ---- a/include/grub/compiler.h<br>
&gt; &gt; -+++ b/include/grub/compiler.h<br>
&gt; &gt; -@@ -48,4 +48,12 @@<br>
&gt; &gt; - #=C2=A0 define WARN_UNUSED_RESULT<br>
&gt; &gt; - #endif<br>
&gt; &gt; - <br>
&gt; &gt; -+#if defined(__clang__) &amp;&amp; defined(__clang_major__) &am=
p;&amp;<br>
&gt; &gt; defined(__clang_minor__)<br>
&gt; &gt; -+#=C2=A0 define CLANG_PREREQ(maj,min) \<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((__clang_major__ &gt; (maj=
)) || \<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(__clang_major__ =3D=3D (maj=
) &amp;&amp; __clang_minor__ &gt;=3D (min)))<br>
&gt; &gt; -+#else<br>
&gt; &gt; -+#=C2=A0 define CLANG_PREREQ(maj,min) 0<br>
&gt; &gt; -+#endif<br>
&gt; &gt; -+<br>
&gt; &gt; - #endif /* ! GRUB_COMPILER_HEADER */<br>
&gt; &gt; -diff --git a/include/grub/safemath.h b/include/grub/safemath.h<=
br>
&gt; &gt; -new file mode 100644<br>
&gt; &gt; -index 0000000..c17b89b<br>
&gt; &gt; ---- /dev/null<br>
&gt; &gt; -+++ b/include/grub/safemath.h<br>
&gt; &gt; -@@ -0,0 +1,37 @@<br>
&gt; &gt; -+/*<br>
&gt; &gt; -+ *=C2=A0 GRUB=C2=A0 --=C2=A0 GRand Unified Bootloader<br>
&gt; &gt; -+ *=C2=A0 Copyright (C) 2020=C2=A0 Free Software Foundation, In=
c.<br>
&gt; &gt; -+ *<br>
&gt; &gt; -+ *=C2=A0 GRUB is free software: you can redistribute it and/or=
 modify<br>
&gt; &gt; -+ *=C2=A0 it under the terms of the GNU General Public License =
as<br>
&gt; &gt; published by<br>
&gt; &gt; -+ *=C2=A0 the Free Software Foundation, either version 3 of the=
 License,<br>
&gt; &gt; or<br>
&gt; &gt; -+ *=C2=A0 (at your option) any later version.<br>
&gt; &gt; -+ *<br>
&gt; &gt; -+ *=C2=A0 GRUB is distributed in the hope that it will be usefu=
l,<br>
&gt; &gt; -+ *=C2=A0 but WITHOUT ANY WARRANTY; without even the implied wa=
rranty of<br>
&gt; &gt; -+ *=C2=A0 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=
=C2=A0 See the<br>
&gt; &gt; -+ *=C2=A0 GNU General Public License for more details.<br>
&gt; &gt; -+ *<br>
&gt; &gt; -+ *=C2=A0 You should have received a copy of the GNU General Pu=
blic<br>
&gt; &gt; License<br>
&gt; &gt; -+ *=C2=A0 along with GRUB.=C2=A0 If not, see &lt;<a href=3D"htt=
p://www.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.=
gnu.org/licenses/</a>&gt;.<br>
&gt; &gt; -+ *<br>
&gt; &gt; -+ *=C2=A0 Arithmetic operations that protect against overflow.<=
br>
&gt; &gt; -+ */<br>
&gt; &gt; -+<br>
&gt; &gt; -+#ifndef GRUB_SAFEMATH_H<br>
&gt; &gt; -+#define GRUB_SAFEMATH_H 1<br>
&gt; &gt; -+<br>
&gt; &gt; -+#include &lt;grub/compiler.h&gt;<br>
&gt; &gt; -+<br>
&gt; &gt; -+/* These appear in gcc 5.1 and clang 3.8. */<br>
&gt; &gt; -+#if GNUC_PREREQ(5, 1) || CLANG_PREREQ(3, 8)<br>
&gt; &gt; -+<br>
&gt; &gt; -+#define grub_add(a, b, res)=C2=A0 =C2=A0__builtin_add_overflow=
(a, b, res)<br>
&gt; &gt; -+#define grub_sub(a, b, res)=C2=A0 =C2=A0__builtin_sub_overflow=
(a, b, res)<br>
&gt; &gt; -+#define grub_mul(a, b, res)=C2=A0 =C2=A0__builtin_mul_overflow=
(a, b, res)<br>
&gt; &gt; -+<br>
&gt; &gt; -+#else<br>
&gt; &gt; -+#error gcc 5.1 or newer or clang 3.8 or newer is required<br>
&gt; &gt; -+#endif<br>
&gt; &gt; -+<br>
&gt; &gt; -+#endif /* GRUB_SAFEMATH_H */<br>
&gt; &gt; --- <br>
&gt; &gt; -2.14.4<br>
&gt; &gt; -<br>
&gt; &gt; diff --git a/meta/recipes-bsp/grub/files/script-Remove-unused-fi=
elds-<br>
&gt; &gt; from-grub_script_functio.patch b/meta/recipes-bsp/grub/files/scr=
ipt-<br>
&gt; &gt; Remove-unused-fields-from-grub_script_functio.patch<br>
&gt; &gt; deleted file mode 100644<br>
&gt; &gt; index 84a80d5ffd..0000000000<br>
&gt; &gt; --- a/meta/recipes-bsp/grub/files/script-Remove-unused-fields-fr=
om-<br>
&gt; &gt; grub_script_functio.patch<br>
&gt; &gt; +++ /dev/null<br>
&gt; &gt; @@ -1,37 +0,0 @@<br>
&gt; &gt; -From e219bad8cee67b2bb21712df8f055706f8da25d2 Mon Sep 17 00:00:=
00<br>
&gt; &gt; 2001<br>
&gt; &gt; -From: Chris Coulson &lt;<a href=3D"mailto:chris.coulson@canonic=
al.com" target=3D"_blank">chris.coulson@canonical.com</a>&gt;<br>
&gt; &gt; -Date: Fri, 10 Jul 2020 11:21:14 +0100<br>
&gt; &gt; -Subject: [PATCH 7/9] script: Remove unused fields from<br>
&gt; &gt; grub_script_function<br>
&gt; &gt; - struct<br>
&gt; &gt; -<br>
&gt; &gt; -Upstream-Status: Backport [commit<br>
&gt; &gt; 1a8d9c9b4ab6df7669b5aa36a56477f297825b96<br>
&gt; &gt; -from <a href=3D"https://git.savannah.gnu.org/git/grub.git" rel=
=3D"noreferrer" target=3D"_blank">https://git.savannah.gnu.org/git/grub.gi=
t</a>]<br>
&gt; &gt; -<br>
&gt; &gt; -Signed-off-by: Chris Coulson &lt;<a href=3D"mailto:chris.coulso=
n@canonical.com" target=3D"_blank">chris.coulson@canonical.com</a>&gt;<br>
&gt; &gt; -Reviewed-by: Daniel Kiper &lt;<a href=3D"mailto:daniel.kiper@or=
acle.com" target=3D"_blank">daniel.kiper@oracle.com</a>&gt;<br>
&gt; &gt; -Signed-off-by: Yongxin Liu &lt;<a href=3D"mailto:yongxin.liu@wi=
ndriver.com" target=3D"_blank">yongxin.liu@windriver.com</a>&gt;<br>
&gt; &gt; ----<br>
&gt; &gt; - include/grub/script_sh.h | 5 -----<br>
&gt; &gt; - 1 file changed, 5 deletions(-)<br>
&gt; &gt; -<br>
&gt; &gt; -diff --git a/include/grub/script_sh.h b/include/grub/script_sh.=
h<br>
&gt; &gt; -index 360c2be..b382bcf 100644<br>
&gt; &gt; ---- a/include/grub/script_sh.h<br>
&gt; &gt; -+++ b/include/grub/script_sh.h<br>
&gt; &gt; -@@ -359,13 +359,8 @@ struct grub_script_function<br>
&gt; &gt; -=C2=A0 =C2=A0/* The script function.=C2=A0 */<br>
&gt; &gt; -=C2=A0 =C2=A0struct grub_script *func;<br>
&gt; &gt; - <br>
&gt; &gt; --=C2=A0 /* The flags.=C2=A0 */<br>
&gt; &gt; --=C2=A0 unsigned flags;<br>
&gt; &gt; --<br>
&gt; &gt; -=C2=A0 =C2=A0/* The next element.=C2=A0 */<br>
&gt; &gt; -=C2=A0 =C2=A0struct grub_script_function *next;<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 int references;<br>
&gt; &gt; - };<br>
&gt; &gt; - typedef struct grub_script_function *grub_script_function_t;<b=
r>
&gt; &gt; - <br>
&gt; &gt; --- <br>
&gt; &gt; -2.14.4<br>
&gt; &gt; -<br>
&gt; &gt; diff --git a/meta/recipes-bsp/grub/<a href=3D"http://grub-efi_2.=
04.bb" rel=3D"noreferrer" target=3D"_blank">grub-efi_2.04.bb</a> b/meta/rec=
ipes-<br>
&gt; &gt; bsp/grub/<a href=3D"http://grub-efi_2.06-rc1.bb" rel=3D"noreferr=
er" target=3D"_blank">grub-efi_2.06-rc1.bb</a><br>
&gt; &gt; similarity index 98%<br>
&gt; &gt; rename from meta/recipes-bsp/grub/<a href=3D"http://grub-efi_2.0=
4.bb" rel=3D"noreferrer" target=3D"_blank">grub-efi_2.04.bb</a><br>
&gt; &gt; rename to meta/recipes-bsp/grub/<a href=3D"http://grub-efi_2.06-=
rc1.bb" rel=3D"noreferrer" target=3D"_blank">grub-efi_2.06-rc1.bb</a><br>
&gt; &gt; index 287845c507..240fde7dbf 100644<br>
&gt; &gt; --- a/meta/recipes-bsp/grub/<a href=3D"http://grub-efi_2.04.bb" =
rel=3D"noreferrer" target=3D"_blank">grub-efi_2.04.bb</a><br>
&gt; &gt; +++ b/meta/recipes-bsp/grub/<a href=3D"http://grub-efi_2.06-rc1.=
bb" rel=3D"noreferrer" target=3D"_blank">grub-efi_2.06-rc1.bb</a><br>
&gt; &gt; @@ -11,8 +11,6 @@ SRC_URI +=3D &quot; \<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://cfg \<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; &gt; <br>
&gt; &gt; -S =3D &quot;${WORKDIR}/grub-${PV}&quot;<br>
&gt; &gt; -<br>
&gt; &gt; =C2=A0# Determine the target arch for the grub modules<br>
&gt; &gt; =C2=A0python __anonymous () {<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0import re<br>
&gt; &gt; diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-<br>
&gt; &gt; bsp/grub/grub2.inc<br>
&gt; &gt; index f870d41f6a..9312404ed9 100644<br>
&gt; &gt; --- a/meta/recipes-bsp/grub/grub2.inc<br>
&gt; &gt; +++ b/meta/recipes-bsp/grub/grub2.inc<br>
&gt; &gt; @@ -13,25 +13,20 @@ LIC_FILES_CHKSUM =3D<br>
&gt; &gt; &quot;file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae504&quot=
;<br>
&gt; &gt; <br>
&gt; &gt; =C2=A0CVE_PRODUCT =3D &quot;grub2&quot;<br>
&gt; &gt; <br>
&gt; &gt; -SRC_URI =3D &quot;${GNU_MIRROR}/grub/grub-${PV}.tar.gz \<br>
&gt; &gt; +SRC_URI =3D &quot;git://<a href=3D"http://git.savannah.gnu.org/=
git/grub.git;name=3Dgrub" rel=3D"noreferrer" target=3D"_blank">git.savannah=
.gnu.org/git/grub.git;name=3Dgrub</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt; &gt; =C2=A0git://<a href=3D"http://git.sv.gnu.org/gnulib.git;destsuff=
ix=3Dgit/grub-" rel=3D"noreferrer" target=3D"_blank">git.sv.gnu.org/gnulib.=
git;destsuffix=3Dgit/grub-</a><br>
&gt; &gt; core/lib/gnulib;name=3Dgnulib<br>
&gt; &gt; \<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Disable-mf=
pmath-sse-as-well-when-SSE-is-<br>
&gt; &gt; disabled.patch \<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://autogen.sh-excl=
ude-pc.patch \<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://grub-module-exp=
licitly-keeps-symbole-<br>
&gt; &gt; .module_license.patch \<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-grub.d-10_=
linux.in-add-oe-s-kernel-name.patch<br>
&gt; &gt; \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2020-10713.=
patch \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://calloc-Make-sur=
e-we-always-have-an-overflow-<br>
&gt; &gt; checking.patch \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://lvm-Add-LVM-cac=
he-logical-volume-handling.patch \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2020-14308-=
calloc-Use-calloc-at-most-<br>
&gt; &gt; places.patch \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://safemath-Add-so=
me-arithmetic-primitives-that-<br>
&gt; &gt; check-f.patch \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2020-14309-=
CVE-2020-14310-CVE-2020-14311-<br>
&gt; &gt; malloc-Use-overflow-checking-primitives-where-we-do-.patch \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://script-Remove-u=
nused-fields-from-<br>
&gt; &gt; grub_script_functio.patch \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2020-15706-=
script-Avoid-a-use-after-free-when-<br>
&gt; &gt; redefining-a-func.patch \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2020-15707-=
linux-Fix-integer-overflows-in-<br>
&gt; &gt; initrd-size-handling.patch \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://6643507ce30f775=
008e093580f0c9499dfb2c485.patch \<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://determinism.pat=
ch \<br>
&gt; &gt; =C2=A0&quot;<br>
&gt; &gt; -SRC_URI[md5sum] =3D &quot;5ce674ca6b2612d8939b9e6abed32934&quot=
;<br>
&gt; &gt; -SRC_URI[sha256sum] =3D<br>
&gt; &gt; &quot;f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e503165=
8ba6ea&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +SRCREV_grub =3D &quot;a53e530f8ad3770c3b03c208c08ae4162f68e3b1&=
quot;<br>
&gt; &gt; +SRCREV_gnulib =3D &quot;d271f868a8df9bbec29049d01e056481b7a1a26=
3&quot;<br>
&gt; &gt; +SRCREV_FORMAT =3D &quot;grub_gnulib&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; &gt; <br>
&gt; &gt; =C2=A0DEPENDS =3D &quot;flex-native bison-native gettext-native&=
quot;<br>
&gt; &gt; <br>
&gt; &gt; @@ -76,6 +71,7 @@ export PYTHON =3D &quot;python3&quot;<br>
&gt; &gt; <br>
&gt; &gt; =C2=A0do_configure_prepend() {<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${S}<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0${S}/bootstrap --gnulib-srcdir=3D${S=
}/grub-core/lib/gnulib<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 FROM_BOOTSTRAP=3D1 ${S}/autogen.sh<b=
r>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${B}<br>
&gt; &gt; =C2=A0}<br>
&gt; &gt; diff --git a/meta/recipes-bsp/grub/<a href=3D"http://grub_2.04.b=
b" rel=3D"noreferrer" target=3D"_blank">grub_2.04.bb</a> b/meta/recipes-<br=
>
&gt; &gt; bsp/grub/<a href=3D"http://grub_2.06-rc1.bb" rel=3D"noreferrer" =
target=3D"_blank">grub_2.06-rc1.bb</a><br>
&gt; &gt; similarity index 100%<br>
&gt; &gt; rename from meta/recipes-bsp/grub/<a href=3D"http://grub_2.04.bb=
" rel=3D"noreferrer" target=3D"_blank">grub_2.04.bb</a><br>
&gt; &gt; rename to meta/recipes-bsp/grub/<a href=3D"http://grub_2.06-rc1.=
bb" rel=3D"noreferrer" target=3D"_blank">grub_2.06-rc1.bb</a><br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; <br>
<br>
</blockquote></div>

--000000000000aa443c05bdaa711d--
