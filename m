Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
 by mx.groups.io with SMTP id smtpd.web09.5274.1615880811191840943
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Mar 2021 00:46:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=h0R4Ptwk;
 spf=pass (domain: gmail.com, ip: 209.85.222.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f52.google.com with SMTP id c2so691800uaj.3
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Mar 2021 00:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kjSZ3Hvjh+4FFE8TLw0e1MsOlRNYNy59mgcIjzQoiRg=;
        b=h0R4PtwkqtP8gPGd7TbMqmebJK1iIqo5qser5bW5thX6xAcNsvWheiGTQbQFhlaV7j
         Akeq8H674nO7bBnObGL0omdfKnnd1JBHk0Cle+6Kuhx7i65qLc/8gL2hP4lT03O8RbY/
         eubSQs+lKGxcZ09GGpjI4Q5/mrjhePwDG5gK+hOUUregQAeIH+lbmD5vhZFqHCpAMUdn
         r0Xpsuv+XSIGP+Bg3p4GdFPB4WwwNDeQjDLM0dBOJQ5HovElsQ9NAc68p5WBLiK3bpS8
         R5UgIKzKPpIoMqq8z0qf6ij5Jmf9BN1Edo7GGpKoSLp0bglSDulUg5evEZ7qGrrERSwg
         iqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kjSZ3Hvjh+4FFE8TLw0e1MsOlRNYNy59mgcIjzQoiRg=;
        b=o44BCoBGn8InXEUX4kmCIVWyZCSJCg6eHRCM0pxsPaz4u9YPcU5EHFB2iCbP75orVF
         FE5vuF8GIEXHCLTFtHV45BuQRQh5fCpMOKm7bBYHdLrDrl5MnWTsURfGKOWi0WOvoY2G
         DEOn/P7t++zsrJZlKRRJQbnPz6YIFgTpHQjRc8fnKyOcAjzNv1AgD8CIzNOP+7cWpYuk
         xPtf2qlPU7I569gQX2DTbDGpo+uQWGtl5JOQG6nqVZ1vy0/SfDHM4pWNOymbTjcqU9jK
         hZn/IV6eQXv+FeEbmcFon5nXqe5K1fmpE1GXnwVeWpz+oFhchXen3svZtd+Tkiu1oCE2
         4DOg==
X-Gm-Message-State: AOAM531Gi9YaiSddSu1JR/qNMsKDoAnBkB51pGoAePY1hqlblCenbGC7
	Qf2OrfoRYzA0/a4jdcY9XxZSDfzl8w4EG/HySOE=
X-Google-Smtp-Source: ABdhPJwLXAjz5VaL38VwQDljoLK5dINeqcJj5gkU2MdJEN0WQGlJGVxUKEzWy15w4UdbmPgAevxVA5gSr19dRbuLrd8=
X-Received: by 2002:ab0:5e9:: with SMTP id e96mr6735994uae.89.1615880809483;
 Tue, 16 Mar 2021 00:46:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210316035243.6637-1-naveen.kumar.saini@intel.com>
In-Reply-To: <20210316035243.6637-1-naveen.kumar.saini@intel.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 16 Mar 2021 08:46:37 +0100
Message-ID: <CANNYZj-aizVd8z82KyO6ya+Q206L2fNmYcKksS32-FqWfPZYig@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] grub: upgrade 2.04 -> 2.06-rc1
To: Naveen Saini <naveen.kumar.saini@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a6122205bda291f0"

--000000000000a6122205bda291f0
Content-Type: text/plain; charset="UTF-8"

oe-core generally waits for the final releases, and does not provide
alphas, betas or rcs. Is the final release coming soon?

Alex

On Tue, 16 Mar 2021 at 04:41, Naveen Saini <naveen.kumar.saini@intel.com>
wrote:

> 2.06 RC1 release have a number of CVEs fixed:
> CVE-2020-15705
> CVE-2021-3418
> CVE-2020-27749
> CVE-2021-20233
> CVE-2021-20225
> CVE-2020-25647
> CVE-2020-25632
> CVE-2020-27779
> CVE-2020-14372
> CVE-2020-15707
> CVE-2020-15706
> CVE-2020-14309
> CVE-2020-14310
> CVE-2020-14311
> CVE-2020-14308
> CVE-2020-10713
> CVE-2014-4607
>
> Dropped backported patches.
>
> Official tar file for 2.06-rc1 is not available, so need to download
> gnublib
> module additionally in order to build from git repo.
>
> Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
> ---
>  ...507ce30f775008e093580f0c9499dfb2c485.patch |   47 -
>  .../grub/files/CVE-2020-10713.patch           |   73 -
>  ...308-calloc-Use-calloc-at-most-places.patch | 1863 -----------------
>  ...low-checking-primitives-where-we-do-.patch | 1330 ------------
>  ...se-after-free-when-redefining-a-func.patch |  117 --
>  ...er-overflows-in-initrd-size-handling.patch |  177 --
>  .../grub/files/autogen.sh-exclude-pc.patch    |   15 +-
>  ...-we-always-have-an-overflow-checking.patch |  246 ---
>  meta/recipes-bsp/grub/files/determinism.patch |   58 +-
>  ...dd-LVM-cache-logical-volume-handling.patch |  287 ---
>  ...e-arithmetic-primitives-that-check-f.patch |   94 -
>  ...used-fields-from-grub_script_functio.patch |   37 -
>  ...{grub-efi_2.04.bb => grub-efi_2.06-rc1.bb} |    2 -
>  meta/recipes-bsp/grub/grub2.inc               |   22 +-
>  .../grub/{grub_2.04.bb => grub_2.06-rc1.bb}   |    0
>  15 files changed, 52 insertions(+), 4316 deletions(-)
>  delete mode 100644
> meta/recipes-bsp/grub/files/6643507ce30f775008e093580f0c9499dfb2c485.patch
>  delete mode 100644 meta/recipes-bsp/grub/files/CVE-2020-10713.patch
>  delete mode 100644
> meta/recipes-bsp/grub/files/CVE-2020-14308-calloc-Use-calloc-at-most-places.patch
>  delete mode 100644
> meta/recipes-bsp/grub/files/CVE-2020-14309-CVE-2020-14310-CVE-2020-14311-malloc-Use-overflow-checking-primitives-where-we-do-.patch
>  delete mode 100644
> meta/recipes-bsp/grub/files/CVE-2020-15706-script-Avoid-a-use-after-free-when-redefining-a-func.patch
>  delete mode 100644
> meta/recipes-bsp/grub/files/CVE-2020-15707-linux-Fix-integer-overflows-in-initrd-size-handling.patch
>  delete mode 100644
> meta/recipes-bsp/grub/files/calloc-Make-sure-we-always-have-an-overflow-checking.patch
>  delete mode 100644
> meta/recipes-bsp/grub/files/lvm-Add-LVM-cache-logical-volume-handling.patch
>  delete mode 100644
> meta/recipes-bsp/grub/files/safemath-Add-some-arithmetic-primitives-that-check-f.patch
>  delete mode 100644
> meta/recipes-bsp/grub/files/script-Remove-unused-fields-from-grub_script_functio.patch
>  rename meta/recipes-bsp/grub/{grub-efi_2.04.bb => grub-efi_2.06-rc1.bb}
> (98%)
>  rename meta/recipes-bsp/grub/{grub_2.04.bb => grub_2.06-rc1.bb} (100%)
>
> diff --git
> a/meta/recipes-bsp/grub/files/6643507ce30f775008e093580f0c9499dfb2c485.patch
> b/meta/recipes-bsp/grub/files/6643507ce30f775008e093580f0c9499dfb2c485.patch
> deleted file mode 100644
> index 8aa2091444..0000000000
> ---
> a/meta/recipes-bsp/grub/files/6643507ce30f775008e093580f0c9499dfb2c485.patch
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -From 6643507ce30f775008e093580f0c9499dfb2c485 Mon Sep 17 00:00:00 2001
> -From: Simon Hardy <simon.hardy@itdev.co.uk>
> -Date: Tue, 24 Mar 2020 13:29:12 +0000
> -Subject: build: Fix GRUB i386-pc build with Ubuntu gcc
> -
> -With recent versions of gcc on Ubuntu a very large lzma_decompress.img
> file is
> -output. (e.g. 134479600 bytes instead of 2864.) This causes grub-mkimage
> to
> -fail with: "error: Decompressor is too big."
> -
> -This seems to be caused by a section .note.gnu.property that is placed at
> an
> -offset such that objcopy needs to pad the img file with zeros.
> -
> -This issue is present on:
> -Ubuntu 19.10 with gcc (Ubuntu 8.3.0-26ubuntu1~19.10) 8.3.0
> -Ubuntu 19.10 with gcc (Ubuntu 9.2.1-9ubuntu2) 9.2.1 20191008
> -
> -This issue is not present on:
> -Ubuntu 19.10 with gcc (Ubuntu 7.5.0-3ubuntu1~19.10) 7.5.0
> -RHEL 8.0 with gcc 8.3.1 20190507 (Red Hat 8.3.1-4)
> -
> -The issue can be fixed by removing the section using objcopy as shown in
> -this patch.
> -
> -Signed-off-by: Simon Hardy <simon.hardy@itdev.co.uk>
> -Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> ----
> - gentpl.py | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -Upstream-Status: Backport
> -
> -diff --git a/gentpl.py b/gentpl.py
> -index 387588c05..c86550d4f 100644
> ---- a/gentpl.py
> -+++ b/gentpl.py
> -@@ -766,7 +766,7 @@ def image(defn, platform):
> - if test x$(TARGET_APPLE_LINKER) = x1; then \
> -   $(MACHO2IMG) $< $@; \
> - else \
> --  $(TARGET_OBJCOPY) $(""" + cname(defn) + """_OBJCOPYFLAGS)
> --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R
> .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R
> .ARM.exidx $< $@; \
> -+  $(TARGET_OBJCOPY) $(""" + cname(defn) + """_OBJCOPYFLAGS)
> --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R
> .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R
> .note.gnu.property -R .ARM.exidx $< $@; \
> - fi
> - """)
> -
> ---
> -cgit v1.2.1
> -
> diff --git a/meta/recipes-bsp/grub/files/CVE-2020-10713.patch
> b/meta/recipes-bsp/grub/files/CVE-2020-10713.patch
> deleted file mode 100644
> index c507ed3ea8..0000000000
> --- a/meta/recipes-bsp/grub/files/CVE-2020-10713.patch
> +++ /dev/null
> @@ -1,73 +0,0 @@
> -From a4d3fbdff1e3ca8f87642af2ac8752c30c617a3e Mon Sep 17 00:00:00 2001
> -From: Peter Jones <pjones@redhat.com>
> -Date: Wed, 15 Apr 2020 15:45:02 -0400
> -Subject: yylex: Make lexer fatal errors actually be fatal
> -
> -When presented with a command that can't be tokenized to anything
> -smaller than YYLMAX characters, the parser calls YY_FATAL_ERROR(errmsg),
> -expecting that will stop further processing, as such:
> -
> -  #define YY_DO_BEFORE_ACTION \
> -        yyg->yytext_ptr = yy_bp; \
> -        yyleng = (int) (yy_cp - yy_bp); \
> -        yyg->yy_hold_char = *yy_cp; \
> -        *yy_cp = '\0'; \
> -        if ( yyleng >= YYLMAX ) \
> -                YY_FATAL_ERROR( "token too large, exceeds YYLMAX" ); \
> -        yy_flex_strncpy( yytext, yyg->yytext_ptr, yyleng + 1 ,
> yyscanner); \
> -        yyg->yy_c_buf_p = yy_cp;
> -
> -The code flex generates expects that YY_FATAL_ERROR() will either return
> -for it or do some form of longjmp(), or handle the error in some way at
> -least, and so the strncpy() call isn't in an "else" clause, and thus if
> -YY_FATAL_ERROR() is *not* actually fatal, it does the call with the
> -questionable limit, and predictable results ensue.
> -
> -Unfortunately, our implementation of YY_FATAL_ERROR() is:
> -
> -   #define YY_FATAL_ERROR(msg)                     \
> -     do {                                          \
> -       grub_printf (_("fatal error: %s\n"), _(msg));     \
> -     } while (0)
> -
> -The same pattern exists in yyless(), and similar problems exist in users
> -of YY_INPUT(), several places in the main parsing loop,
> -yy_get_next_buffer(), yy_load_buffer_state(), yyensure_buffer_stack,
> -yy_scan_buffer(), etc.
> -
> -All of these callers expect YY_FATAL_ERROR() to actually be fatal, and
> -the things they do if it returns after calling it are wildly unsafe.
> -
> -Fixes: CVE-2020-10713
> -
> -Signed-off-by: Peter Jones <pjones@redhat.com>
> -Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> -
> -Upstream-Status: Backport [
> https://git.savannah.gnu.org/cgit/grub.git/commit/?id=a4d3fbdff1e3ca8f87642af2ac8752c30c617a3e
> ]
> -CVE: CVE-2020-10713
> -Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
> ----
> - grub-core/script/yylex.l | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/grub-core/script/yylex.l b/grub-core/script/yylex.l
> -index 7b44c37b7..b7203c823 100644
> ---- a/grub-core/script/yylex.l
> -+++ b/grub-core/script/yylex.l
> -@@ -37,11 +37,11 @@
> -
> - /*
> -  * As we don't have access to yyscanner, we cannot do much except to
> -- * print the fatal error.
> -+ * print the fatal error and exit.
> -  */
> - #define YY_FATAL_ERROR(msg)                     \
> -   do {                                          \
> --    grub_printf (_("fatal error: %s\n"), _(msg));     \
> -+    grub_fatal (_("fatal error: %s\n"), _(msg));\
> -   } while (0)
> -
> - #define COPY(str, hint)                         \
> ---
> -cgit v1.2.1
> -
> diff --git
> a/meta/recipes-bsp/grub/files/CVE-2020-14308-calloc-Use-calloc-at-most-places.patch
> b/meta/recipes-bsp/grub/files/CVE-2020-14308-calloc-Use-calloc-at-most-places.patch
> deleted file mode 100644
> index 637e368cb0..0000000000
> ---
> a/meta/recipes-bsp/grub/files/CVE-2020-14308-calloc-Use-calloc-at-most-places.patch
> +++ /dev/null
> @@ -1,1863 +0,0 @@
> -From bcdd6a55952222ec9829a59348240a4f983b0b56 Mon Sep 17 00:00:00 2001
> -From: Peter Jones <pjones@redhat.com>
> -Date: Mon, 15 Jun 2020 12:26:01 -0400
> -Subject: [PATCH 4/9] calloc: Use calloc() at most places
> -
> -This modifies most of the places we do some form of:
> -
> -  X = malloc(Y * Z);
> -
> -to use calloc(Y, Z) instead.
> -
> -Among other issues, this fixes:
> -  - allocation of integer overflow in grub_png_decode_image_header()
> -    reported by Chris Coulson,
> -  - allocation of integer overflow in luks_recover_key()
> -    reported by Chris Coulson,
> -  - allocation of integer overflow in grub_lvm_detect()
> -    reported by Chris Coulson.
> -
> -Fixes: CVE-2020-14308
> -
> -Signed-off-by: Peter Jones <pjones@redhat.com>
> -Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> -
> -Upstream-Status: Backport
> -CVE: CVE-2020-14308
> -
> -Reference to upstream patch:
> -
> https://git.savannah.gnu.org/cgit/grub.git/commit/?id=f725fa7cb2ece547c5af01eeeecfe8d95802ed41
> -
> -[YL: don't patch on grub-core/lib/json/json.c, which is not existing in
> grub 2.04]
> -Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
> ----
> - grub-core/bus/usb/usbhub.c                |  8 ++++----
> - grub-core/commands/efi/lsefisystab.c      |  3 ++-
> - grub-core/commands/legacycfg.c            |  6 +++---
> - grub-core/commands/menuentry.c            |  2 +-
> - grub-core/commands/nativedisk.c           |  2 +-
> - grub-core/commands/parttool.c             | 12 +++++++++---
> - grub-core/commands/regexp.c               |  2 +-
> - grub-core/commands/search_wrap.c          |  2 +-
> - grub-core/disk/diskfilter.c               |  4 ++--
> - grub-core/disk/ieee1275/ofdisk.c          |  2 +-
> - grub-core/disk/ldm.c                      | 14 +++++++-------
> - grub-core/disk/luks.c                     |  2 +-
> - grub-core/disk/lvm.c                      | 12 ++++++------
> - grub-core/disk/xen/xendisk.c              |  2 +-
> - grub-core/efiemu/loadcore.c               |  2 +-
> - grub-core/efiemu/mm.c                     |  6 +++---
> - grub-core/font/font.c                     |  3 +--
> - grub-core/fs/affs.c                       |  6 +++---
> - grub-core/fs/btrfs.c                      |  6 +++---
> - grub-core/fs/hfs.c                        |  2 +-
> - grub-core/fs/hfsplus.c                    |  6 +++---
> - grub-core/fs/iso9660.c                    |  2 +-
> - grub-core/fs/ntfs.c                       |  4 ++--
> - grub-core/fs/sfs.c                        |  2 +-
> - grub-core/fs/tar.c                        |  2 +-
> - grub-core/fs/udf.c                        |  4 ++--
> - grub-core/fs/zfs/zfs.c                    |  4 ++--
> - grub-core/gfxmenu/gui_string_util.c       |  2 +-
> - grub-core/gfxmenu/widget-box.c            |  4 ++--
> - grub-core/io/gzio.c                       |  2 +-
> - grub-core/kern/efi/efi.c                  |  6 +++---
> - grub-core/kern/emu/hostdisk.c             |  2 +-
> - grub-core/kern/fs.c                       |  2 +-
> - grub-core/kern/misc.c                     |  2 +-
> - grub-core/kern/parser.c                   |  2 +-
> - grub-core/kern/uboot/uboot.c              |  2 +-
> - grub-core/lib/libgcrypt/cipher/ac.c       |  8 ++++----
> - grub-core/lib/libgcrypt/cipher/primegen.c |  4 ++--
> - grub-core/lib/libgcrypt/cipher/pubkey.c   |  4 ++--
> - grub-core/lib/priority_queue.c            |  2 +-
> - grub-core/lib/reed_solomon.c              |  7 +++----
> - grub-core/lib/relocator.c                 | 10 +++++-----
> - grub-core/lib/zstd/fse_decompress.c       |  2 +-
> - grub-core/loader/arm/linux.c              |  2 +-
> - grub-core/loader/efi/chainloader.c        |  2 +-
> - grub-core/loader/i386/bsdXX.c             |  2 +-
> - grub-core/loader/i386/xnu.c               |  4 ++--
> - grub-core/loader/macho.c                  |  2 +-
> - grub-core/loader/multiboot_elfxx.c        |  2 +-
> - grub-core/loader/xnu.c                    |  2 +-
> - grub-core/mmap/mmap.c                     |  4 ++--
> - grub-core/net/bootp.c                     |  2 +-
> - grub-core/net/dns.c                       | 10 +++++-----
> - grub-core/net/net.c                       |  4 ++--
> - grub-core/normal/charset.c                | 10 +++++-----
> - grub-core/normal/cmdline.c                | 14 +++++++-------
> - grub-core/normal/menu_entry.c             | 14 +++++++-------
> - grub-core/normal/menu_text.c              |  4 ++--
> - grub-core/normal/term.c                   |  4 ++--
> - grub-core/osdep/linux/getroot.c           |  6 +++---
> - grub-core/osdep/unix/config.c             |  2 +-
> - grub-core/osdep/windows/getroot.c         |  2 +-
> - grub-core/osdep/windows/hostdisk.c        |  4 ++--
> - grub-core/osdep/windows/init.c            |  2 +-
> - grub-core/osdep/windows/platform.c        |  4 ++--
> - grub-core/osdep/windows/relpath.c         |  2 +-
> - grub-core/partmap/gpt.c                   |  2 +-
> - grub-core/partmap/msdos.c                 |  2 +-
> - grub-core/script/execute.c                |  2 +-
> - grub-core/tests/fake_input.c              |  2 +-
> - grub-core/tests/video_checksum.c          |  6 +++---
> - grub-core/video/capture.c                 |  2 +-
> - grub-core/video/emu/sdl.c                 |  2 +-
> - grub-core/video/i386/pc/vga.c             |  2 +-
> - grub-core/video/readers/png.c             |  2 +-
> - include/grub/unicode.h                    |  4 ++--
> - util/getroot.c                            |  2 +-
> - util/grub-file.c                          |  2 +-
> - util/grub-fstest.c                        |  4 ++--
> - util/grub-install-common.c                |  2 +-
> - util/grub-install.c                       |  4 ++--
> - util/grub-mkimagexx.c                     |  6 ++----
> - util/grub-mkrescue.c                      |  4 ++--
> - util/grub-mkstandalone.c                  |  2 +-
> - util/grub-pe2elf.c                        | 12 +++++-------
> - util/grub-probe.c                         |  4 ++--
> - 86 files changed, 178 insertions(+), 177 deletions(-)
> -
> -diff --git a/grub-core/bus/usb/usbhub.c b/grub-core/bus/usb/usbhub.c
> -index 34a7ff1..a06cce3 100644
> ---- a/grub-core/bus/usb/usbhub.c
> -+++ b/grub-core/bus/usb/usbhub.c
> -@@ -149,8 +149,8 @@ grub_usb_add_hub (grub_usb_device_t dev)
> -   grub_usb_set_configuration (dev, 1);
> -
> -   dev->nports = hubdesc.portcnt;
> --  dev->children = grub_zalloc (hubdesc.portcnt * sizeof
> (dev->children[0]));
> --  dev->ports = grub_zalloc (dev->nports * sizeof (dev->ports[0]));
> -+  dev->children = grub_calloc (hubdesc.portcnt, sizeof
> (dev->children[0]));
> -+  dev->ports = grub_calloc (dev->nports, sizeof (dev->ports[0]));
> -   if (!dev->children || !dev->ports)
> -     {
> -       grub_free (dev->children);
> -@@ -268,8 +268,8 @@ grub_usb_controller_dev_register_iter
> (grub_usb_controller_t controller, void *d
> -
> -   /* Query the number of ports the root Hub has.  */
> -   hub->nports = controller->dev->hubports (controller);
> --  hub->devices = grub_zalloc (sizeof (hub->devices[0]) * hub->nports);
> --  hub->ports = grub_zalloc (sizeof (hub->ports[0]) * hub->nports);
> -+  hub->devices = grub_calloc (hub->nports, sizeof (hub->devices[0]));
> -+  hub->ports = grub_calloc (hub->nports, sizeof (hub->ports[0]));
> -   if (!hub->devices || !hub->ports)
> -     {
> -       grub_free (hub->devices);
> -diff --git a/grub-core/commands/efi/lsefisystab.c
> b/grub-core/commands/efi/lsefisystab.c
> -index df10302..cd81507 100644
> ---- a/grub-core/commands/efi/lsefisystab.c
> -+++ b/grub-core/commands/efi/lsefisystab.c
> -@@ -71,7 +71,8 @@ grub_cmd_lsefisystab (struct grub_command *cmd
> __attribute__ ((unused)),
> -     grub_printf ("Vendor: ");
> -
> -     for (vendor_utf16 = st->firmware_vendor; *vendor_utf16;
> vendor_utf16++);
> --    vendor = grub_malloc (4 * (vendor_utf16 - st->firmware_vendor) + 1);
> -+    /* Allocate extra 3 bytes to simplify math. */
> -+    vendor = grub_calloc (4, vendor_utf16 - st->firmware_vendor + 1);
> -     if (!vendor)
> -       return grub_errno;
> -     *grub_utf16_to_utf8 ((grub_uint8_t *) vendor, st->firmware_vendor,
> -diff --git a/grub-core/commands/legacycfg.c
> b/grub-core/commands/legacycfg.c
> -index db7a8f0..5e3ec0d 100644
> ---- a/grub-core/commands/legacycfg.c
> -+++ b/grub-core/commands/legacycfg.c
> -@@ -314,7 +314,7 @@ grub_cmd_legacy_kernel (struct grub_command *mycmd
> __attribute__ ((unused)),
> -   if (argc < 2)
> -     return grub_error (GRUB_ERR_BAD_ARGUMENT, N_("filename expected"));
> -
> --  cutargs = grub_malloc (sizeof (cutargs[0]) * (argc - 1));
> -+  cutargs = grub_calloc (argc - 1, sizeof (cutargs[0]));
> -   if (!cutargs)
> -     return grub_errno;
> -   cutargc = argc - 1;
> -@@ -436,7 +436,7 @@ grub_cmd_legacy_kernel (struct grub_command *mycmd
> __attribute__ ((unused)),
> -           {
> -             char rbuf[3] = "-r";
> -             bsdargc = cutargc + 2;
> --            bsdargs = grub_malloc (sizeof (bsdargs[0]) * bsdargc);
> -+            bsdargs = grub_calloc (bsdargc, sizeof (bsdargs[0]));
> -             if (!bsdargs)
> -               {
> -                 err = grub_errno;
> -@@ -559,7 +559,7 @@ grub_cmd_legacy_initrdnounzip (struct grub_command
> *mycmd __attribute__ ((unused
> -       return grub_error (GRUB_ERR_BAD_ARGUMENT, N_("can't find command
> `%s'"),
> -                          "module");
> -
> --      newargs = grub_malloc ((argc + 1) * sizeof (newargs[0]));
> -+      newargs = grub_calloc (argc + 1, sizeof (newargs[0]));
> -       if (!newargs)
> -       return grub_errno;
> -       grub_memcpy (newargs + 1, args, argc * sizeof (newargs[0]));
> -diff --git a/grub-core/commands/menuentry.c
> b/grub-core/commands/menuentry.c
> -index 2c5363d..9164df7 100644
> ---- a/grub-core/commands/menuentry.c
> -+++ b/grub-core/commands/menuentry.c
> -@@ -154,7 +154,7 @@ grub_normal_add_menu_entry (int argc, const char
> **args,
> -     goto fail;
> -
> -   /* Save argc, args to pass as parameters to block arg later. */
> --  menu_args = grub_malloc (sizeof (char*) * (argc + 1));
> -+  menu_args = grub_calloc (argc + 1, sizeof (char *));
> -   if (! menu_args)
> -     goto fail;
> -
> -diff --git a/grub-core/commands/nativedisk.c
> b/grub-core/commands/nativedisk.c
> -index 699447d..7c8f97f 100644
> ---- a/grub-core/commands/nativedisk.c
> -+++ b/grub-core/commands/nativedisk.c
> -@@ -195,7 +195,7 @@ grub_cmd_nativedisk (grub_command_t cmd __attribute__
> ((unused)),
> -   else
> -     path_prefix = prefix;
> -
> --  mods = grub_malloc (argc * sizeof (mods[0]));
> -+  mods = grub_calloc (argc, sizeof (mods[0]));
> -   if (!mods)
> -     return grub_errno;
> -
> -diff --git a/grub-core/commands/parttool.c b/grub-core/commands/parttool.c
> -index 22b46b1..051e313 100644
> ---- a/grub-core/commands/parttool.c
> -+++ b/grub-core/commands/parttool.c
> -@@ -59,7 +59,13 @@ grub_parttool_register(const char *part_name,
> -   for (nargs = 0; args[nargs].name != 0; nargs++);
> -   cur->nargs = nargs;
> -   cur->args = (struct grub_parttool_argdesc *)
> --    grub_malloc ((nargs + 1) * sizeof (struct grub_parttool_argdesc));
> -+    grub_calloc (nargs + 1, sizeof (struct grub_parttool_argdesc));
> -+  if (!cur->args)
> -+    {
> -+      grub_free (cur);
> -+      curhandle--;
> -+      return -1;
> -+    }
> -   grub_memcpy (cur->args, args,
> -              (nargs + 1) * sizeof (struct grub_parttool_argdesc));
> -
> -@@ -257,7 +263,7 @@ grub_cmd_parttool (grub_command_t cmd __attribute__
> ((unused)),
> -       return err;
> -       }
> -
> --  parsed = (int *) grub_zalloc (argc * sizeof (int));
> -+  parsed = (int *) grub_calloc (argc, sizeof (int));
> -
> -   for (i = 1; i < argc; i++)
> -     if (! parsed[i])
> -@@ -290,7 +296,7 @@ grub_cmd_parttool (grub_command_t cmd __attribute__
> ((unused)),
> -         }
> -       ptool = cur;
> -       pargs = (struct grub_parttool_args *)
> --        grub_zalloc (ptool->nargs * sizeof (struct grub_parttool_args));
> -+        grub_calloc (ptool->nargs, sizeof (struct grub_parttool_args));
> -       for (j = i; j < argc; j++)
> -         if (! parsed[j])
> -           {
> -diff --git a/grub-core/commands/regexp.c b/grub-core/commands/regexp.c
> -index f00b184..4019164 100644
> ---- a/grub-core/commands/regexp.c
> -+++ b/grub-core/commands/regexp.c
> -@@ -116,7 +116,7 @@ grub_cmd_regexp (grub_extcmd_context_t ctxt, int
> argc, char **args)
> -   if (ret)
> -     goto fail;
> -
> --  matches = grub_zalloc (sizeof (*matches) * (regex.re_nsub + 1));
> -+  matches = grub_calloc (regex.re_nsub + 1, sizeof (*matches));
> -   if (! matches)
> -     goto fail;
> -
> -diff --git a/grub-core/commands/search_wrap.c
> b/grub-core/commands/search_wrap.c
> -index d7fd26b..47fc8eb 100644
> ---- a/grub-core/commands/search_wrap.c
> -+++ b/grub-core/commands/search_wrap.c
> -@@ -122,7 +122,7 @@ grub_cmd_search (grub_extcmd_context_t ctxt, int
> argc, char **args)
> -     for (i = 0; state[SEARCH_HINT_BAREMETAL].args[i]; i++)
> -       nhints++;
> -
> --  hints = grub_malloc (sizeof (hints[0]) * nhints);
> -+  hints = grub_calloc (nhints, sizeof (hints[0]));
> -   if (!hints)
> -     return grub_errno;
> -   j = 0;
> -diff --git a/grub-core/disk/diskfilter.c b/grub-core/disk/diskfilter.c
> -index c3b578a..68ca9e0 100644
> ---- a/grub-core/disk/diskfilter.c
> -+++ b/grub-core/disk/diskfilter.c
> -@@ -1134,7 +1134,7 @@ grub_diskfilter_make_raid (grub_size_t uuidlen,
> char *uuid, int nmemb,
> -   array->lvs->segments->node_count = nmemb;
> -   array->lvs->segments->raid_member_size = disk_size;
> -   array->lvs->segments->nodes
> --    = grub_zalloc (nmemb * sizeof (array->lvs->segments->nodes[0]));
> -+    = grub_calloc (nmemb, sizeof (array->lvs->segments->nodes[0]));
> -   array->lvs->segments->stripe_size = stripe_size;
> -   for (i = 0; i < nmemb; i++)
> -     {
> -@@ -1226,7 +1226,7 @@ insert_array (grub_disk_t disk, const struct
> grub_diskfilter_pv_id *id,
> -         grub_partition_t p;
> -         for (p = disk->partition; p; p = p->parent)
> -           s++;
> --        pv->partmaps = xmalloc (s * sizeof (pv->partmaps[0]));
> -+        pv->partmaps = xcalloc (s, sizeof (pv->partmaps[0]));
> -         s = 0;
> -         for (p = disk->partition; p; p = p->parent)
> -           pv->partmaps[s++] = xstrdup (p->partmap->name);
> -diff --git a/grub-core/disk/ieee1275/ofdisk.c
> b/grub-core/disk/ieee1275/ofdisk.c
> -index f73257e..03674cb 100644
> ---- a/grub-core/disk/ieee1275/ofdisk.c
> -+++ b/grub-core/disk/ieee1275/ofdisk.c
> -@@ -297,7 +297,7 @@ dev_iterate (const struct grub_ieee1275_devalias
> *alias)
> -       /* Power machines documentation specify 672 as maximum SAS disks in
> -          one system. Using a slightly larger value to be safe. */
> -       table_size = 768;
> --      table = grub_malloc (table_size * sizeof (grub_uint64_t));
> -+      table = grub_calloc (table_size, sizeof (grub_uint64_t));
> -
> -       if (!table)
> -         {
> -diff --git a/grub-core/disk/ldm.c b/grub-core/disk/ldm.c
> -index 2a22d2d..e632370 100644
> ---- a/grub-core/disk/ldm.c
> -+++ b/grub-core/disk/ldm.c
> -@@ -323,8 +323,8 @@ make_vg (grub_disk_t disk,
> -         lv->segments->type = GRUB_DISKFILTER_MIRROR;
> -         lv->segments->node_count = 0;
> -         lv->segments->node_alloc = 8;
> --        lv->segments->nodes = grub_zalloc (sizeof (*lv->segments->nodes)
> --                                           * lv->segments->node_alloc);
> -+        lv->segments->nodes = grub_calloc (lv->segments->node_alloc,
> -+                                           sizeof
> (*lv->segments->nodes));
> -         if (!lv->segments->nodes)
> -           goto fail2;
> -         ptr = vblk[i].dynamic;
> -@@ -543,8 +543,8 @@ make_vg (grub_disk_t disk,
> -           {
> -             comp->segment_alloc = 8;
> -             comp->segment_count = 0;
> --            comp->segments = grub_malloc (sizeof (*comp->segments)
> --                                          * comp->segment_alloc);
> -+            comp->segments = grub_calloc (comp->segment_alloc,
> -+                                          sizeof (*comp->segments));
> -             if (!comp->segments)
> -               goto fail2;
> -           }
> -@@ -590,8 +590,8 @@ make_vg (grub_disk_t disk,
> -               }
> -             comp->segments->node_count = read_int (ptr + 1, *ptr);
> -             comp->segments->node_alloc = comp->segments->node_count;
> --            comp->segments->nodes = grub_zalloc (sizeof
> (*comp->segments->nodes)
> --                                                 *
> comp->segments->node_alloc);
> -+            comp->segments->nodes = grub_calloc
> (comp->segments->node_alloc,
> -+                                                 sizeof
> (*comp->segments->nodes));
> -             if (!lv->segments->nodes)
> -               goto fail2;
> -           }
> -@@ -1017,7 +1017,7 @@ grub_util_ldm_embed (struct grub_disk *disk,
> unsigned int *nsectors,
> -       *nsectors = lv->size;
> -       if (*nsectors > max_nsectors)
> -       *nsectors = max_nsectors;
> --      *sectors = grub_malloc (*nsectors * sizeof (**sectors));
> -+      *sectors = grub_calloc (*nsectors, sizeof (**sectors));
> -       if (!*sectors)
> -       return grub_errno;
> -       for (i = 0; i < *nsectors; i++)
> -diff --git a/grub-core/disk/luks.c b/grub-core/disk/luks.c
> -index 86c50c6..18b3a8b 100644
> ---- a/grub-core/disk/luks.c
> -+++ b/grub-core/disk/luks.c
> -@@ -336,7 +336,7 @@ luks_recover_key (grub_disk_t source,
> -       && grub_be_to_cpu32 (header.keyblock[i].stripes) > max_stripes)
> -       max_stripes = grub_be_to_cpu32 (header.keyblock[i].stripes);
> -
> --  split_key = grub_malloc (keysize * max_stripes);
> -+  split_key = grub_calloc (keysize, max_stripes);
> -   if (!split_key)
> -     return grub_errno;
> -
> -diff --git a/grub-core/disk/lvm.c b/grub-core/disk/lvm.c
> -index dc6b83b..7b5fbbc 100644
> ---- a/grub-core/disk/lvm.c
> -+++ b/grub-core/disk/lvm.c
> -@@ -209,7 +209,7 @@ grub_lvm_detect (grub_disk_t disk,
> -      first one.  */
> -
> -   /* Allocate buffer space for the circular worst-case scenario. */
> --  metadatabuf = grub_malloc (2 * mda_size);
> -+  metadatabuf = grub_calloc (2, mda_size);
> -   if (! metadatabuf)
> -     goto fail;
> -
> -@@ -464,7 +464,7 @@ grub_lvm_detect (grub_disk_t disk,
> - #endif
> -                 goto lvs_fail;
> -               }
> --            lv->segments = grub_zalloc (sizeof (*seg) *
> lv->segment_count);
> -+            lv->segments = grub_calloc (lv->segment_count, sizeof
> (*seg));
> -             seg = lv->segments;
> -
> -             for (i = 0; i < lv->segment_count; i++)
> -@@ -521,8 +521,8 @@ grub_lvm_detect (grub_disk_t disk,
> -                     if (seg->node_count != 1)
> -                       seg->stripe_size = grub_lvm_getvalue (&p,
> "stripe_size = ");
> -
> --                    seg->nodes = grub_zalloc (sizeof (*stripe)
> --                                              * seg->node_count);
> -+                    seg->nodes = grub_calloc (seg->node_count,
> -+                                              sizeof (*stripe));
> -                     stripe = seg->nodes;
> -
> -                     p = grub_strstr (p, "stripes = [");
> -@@ -898,7 +898,7 @@ grub_lvm_detect (grub_disk_t disk,
> -               break;
> -           if (lv)
> -             {
> --              cache->lv->segments = grub_malloc (lv->segment_count *
> sizeof (*lv->segments));
> -+              cache->lv->segments = grub_calloc (lv->segment_count,
> sizeof (*lv->segments));
> -               if (!cache->lv->segments)
> -                 {
> -                   grub_lvm_free_cache_lvs (cache_lvs);
> -@@ -911,7 +911,7 @@ grub_lvm_detect (grub_disk_t disk,
> -                   struct grub_diskfilter_node *nodes =
> lv->segments[i].nodes;
> -                   grub_size_t node_count = lv->segments[i].node_count;
> -
> --                  cache->lv->segments[i].nodes = grub_malloc (node_count
> * sizeof (*nodes));
> -+                  cache->lv->segments[i].nodes = grub_calloc
> (node_count, sizeof (*nodes));
> -                   if (!cache->lv->segments[i].nodes)
> -                     {
> -                       for (j = 0; j < i; ++j)
> -diff --git a/grub-core/disk/xen/xendisk.c b/grub-core/disk/xen/xendisk.c
> -index 48476cb..d6612ee 100644
> ---- a/grub-core/disk/xen/xendisk.c
> -+++ b/grub-core/disk/xen/xendisk.c
> -@@ -426,7 +426,7 @@ grub_xendisk_init (void)
> -   if (!ctr)
> -     return;
> -
> --  virtdisks = grub_malloc (ctr * sizeof (virtdisks[0]));
> -+  virtdisks = grub_calloc (ctr, sizeof (virtdisks[0]));
> -   if (!virtdisks)
> -     return;
> -   if (grub_xenstore_dir ("device/vbd", fill, &ctr))
> -diff --git a/grub-core/efiemu/loadcore.c b/grub-core/efiemu/loadcore.c
> -index 44085ef..2b92462 100644
> ---- a/grub-core/efiemu/loadcore.c
> -+++ b/grub-core/efiemu/loadcore.c
> -@@ -201,7 +201,7 @@ grub_efiemu_count_symbols (const Elf_Ehdr *e)
> -
> -   grub_efiemu_nelfsyms = (unsigned) s->sh_size / (unsigned)
> s->sh_entsize;
> -   grub_efiemu_elfsyms = (struct grub_efiemu_elf_sym *)
> --    grub_malloc (sizeof (struct grub_efiemu_elf_sym) *
> grub_efiemu_nelfsyms);
> -+    grub_calloc (grub_efiemu_nelfsyms, sizeof (struct
> grub_efiemu_elf_sym));
> -
> -   /* Relocators */
> -   for (i = 0, s = (Elf_Shdr *) ((char *) e + e->e_shoff);
> -diff --git a/grub-core/efiemu/mm.c b/grub-core/efiemu/mm.c
> -index 52a032f..9b8e0d0 100644
> ---- a/grub-core/efiemu/mm.c
> -+++ b/grub-core/efiemu/mm.c
> -@@ -554,11 +554,11 @@ grub_efiemu_mmap_sort_and_uniq (void)
> -   /* Initialize variables*/
> -   grub_memset (present, 0, sizeof (int) * GRUB_EFI_MAX_MEMORY_TYPE);
> -   scanline_events = (struct grub_efiemu_mmap_scan *)
> --    grub_malloc (sizeof (struct grub_efiemu_mmap_scan) * 2 * mmap_num);
> -+    grub_calloc (mmap_num, sizeof (struct grub_efiemu_mmap_scan) * 2);
> -
> -   /* Number of chunks can't increase more than by factor of 2 */
> -   result = (grub_efi_memory_descriptor_t *)
> --    grub_malloc (sizeof (grub_efi_memory_descriptor_t) * 2 * mmap_num);
> -+    grub_calloc (mmap_num, sizeof (grub_efi_memory_descriptor_t) * 2);
> -   if (!result || !scanline_events)
> -     {
> -       grub_free (result);
> -@@ -660,7 +660,7 @@ grub_efiemu_mm_do_alloc (void)
> -
> -   /* Preallocate mmap */
> -   efiemu_mmap = (grub_efi_memory_descriptor_t *)
> --    grub_malloc (mmap_reserved_size * sizeof
> (grub_efi_memory_descriptor_t));
> -+    grub_calloc (mmap_reserved_size, sizeof
> (grub_efi_memory_descriptor_t));
> -   if (!efiemu_mmap)
> -     {
> -       grub_efiemu_unload ();
> -diff --git a/grub-core/font/font.c b/grub-core/font/font.c
> -index 85a2925..8e118b3 100644
> ---- a/grub-core/font/font.c
> -+++ b/grub-core/font/font.c
> -@@ -293,8 +293,7 @@ load_font_index (grub_file_t file, grub_uint32_t
> sect_length, struct
> -   font->num_chars = sect_length / FONT_CHAR_INDEX_ENTRY_SIZE;
> -
> -   /* Allocate the character index array.  */
> --  font->char_index = grub_malloc (font->num_chars
> --                                * sizeof (struct char_index_entry));
> -+  font->char_index = grub_calloc (font->num_chars, sizeof (struct
> char_index_entry));
> -   if (!font->char_index)
> -     return 1;
> -   font->bmp_idx = grub_malloc (0x10000 * sizeof (grub_uint16_t));
> -diff --git a/grub-core/fs/affs.c b/grub-core/fs/affs.c
> -index 6b6a2bc..220b371 100644
> ---- a/grub-core/fs/affs.c
> -+++ b/grub-core/fs/affs.c
> -@@ -301,7 +301,7 @@ grub_affs_read_symlink (grub_fshelp_node_t node)
> -       return 0;
> -     }
> -   latin1[symlink_size] = 0;
> --  utf8 = grub_malloc (symlink_size * GRUB_MAX_UTF8_PER_LATIN1 + 1);
> -+  utf8 = grub_calloc (GRUB_MAX_UTF8_PER_LATIN1 + 1, symlink_size);
> -   if (!utf8)
> -     {
> -       grub_free (latin1);
> -@@ -422,7 +422,7 @@ grub_affs_iterate_dir (grub_fshelp_node_t dir,
> -       return 1;
> -     }
> -
> --  hashtable = grub_zalloc (data->htsize * sizeof (*hashtable));
> -+  hashtable = grub_calloc (data->htsize, sizeof (*hashtable));
> -   if (!hashtable)
> -     return 1;
> -
> -@@ -628,7 +628,7 @@ grub_affs_label (grub_device_t device, char **label)
> -       len = file.namelen;
> -       if (len > sizeof (file.name))
> -       len = sizeof (file.name);
> --      *label = grub_malloc (len * GRUB_MAX_UTF8_PER_LATIN1 + 1);
> -+      *label = grub_calloc (GRUB_MAX_UTF8_PER_LATIN1 + 1, len);
> -       if (*label)
> -       *grub_latin1_to_utf8 ((grub_uint8_t *) *label, file.name, len) =
> '\0';
> -     }
> -diff --git a/grub-core/fs/btrfs.c b/grub-core/fs/btrfs.c
> -index 48bd3d0..11272ef 100644
> ---- a/grub-core/fs/btrfs.c
> -+++ b/grub-core/fs/btrfs.c
> -@@ -413,7 +413,7 @@ lower_bound (struct grub_btrfs_data *data,
> -     {
> -       desc->allocated = 16;
> -       desc->depth = 0;
> --      desc->data = grub_malloc (sizeof (desc->data[0]) *
> desc->allocated);
> -+      desc->data = grub_calloc (desc->allocated, sizeof (desc->data[0]));
> -       if (!desc->data)
> -       return grub_errno;
> -     }
> -@@ -752,7 +752,7 @@ raid56_read_retry (struct grub_btrfs_data *data,
> -   grub_err_t ret = GRUB_ERR_OUT_OF_MEMORY;
> -   grub_uint64_t i, failed_devices;
> -
> --  buffers = grub_zalloc (sizeof(*buffers) * nstripes);
> -+  buffers = grub_calloc (nstripes, sizeof (*buffers));
> -   if (!buffers)
> -     goto cleanup;
> -
> -@@ -2160,7 +2160,7 @@ grub_btrfs_embed (grub_device_t device
> __attribute__ ((unused)),
> -   *nsectors = 64 * 2 - 1;
> -   if (*nsectors > max_nsectors)
> -     *nsectors = max_nsectors;
> --  *sectors = grub_malloc (*nsectors * sizeof (**sectors));
> -+  *sectors = grub_calloc (*nsectors, sizeof (**sectors));
> -   if (!*sectors)
> -     return grub_errno;
> -   for (i = 0; i < *nsectors; i++)
> -diff --git a/grub-core/fs/hfs.c b/grub-core/fs/hfs.c
> -index ac0a409..3fe842b 100644
> ---- a/grub-core/fs/hfs.c
> -+++ b/grub-core/fs/hfs.c
> -@@ -1360,7 +1360,7 @@ grub_hfs_label (grub_device_t device, char **label)
> -       grub_size_t len = data->sblock.volname[0];
> -       if (len > sizeof (data->sblock.volname) - 1)
> -       len = sizeof (data->sblock.volname) - 1;
> --      *label = grub_malloc (len * MAX_UTF8_PER_MAC_ROMAN + 1);
> -+      *label = grub_calloc (MAX_UTF8_PER_MAC_ROMAN + 1, len);
> -       if (*label)
> -       macroman_to_utf8 (*label, data->sblock.volname + 1,
> -                         len + 1, 0);
> -diff --git a/grub-core/fs/hfsplus.c b/grub-core/fs/hfsplus.c
> -index 54786bb..dae43be 100644
> ---- a/grub-core/fs/hfsplus.c
> -+++ b/grub-core/fs/hfsplus.c
> -@@ -720,7 +720,7 @@ list_nodes (void *record, void *hook_arg)
> -   if (! filename)
> -     return 0;
> -
> --  keyname = grub_malloc (grub_be_to_cpu16 (catkey->namelen) * sizeof
> (*keyname));
> -+  keyname = grub_calloc (grub_be_to_cpu16 (catkey->namelen), sizeof
> (*keyname));
> -   if (!keyname)
> -     {
> -       grub_free (filename);
> -@@ -1007,7 +1007,7 @@ grub_hfsplus_label (grub_device_t device, char
> **label)
> -     grub_hfsplus_btree_recptr (&data->catalog_tree, node, ptr);
> -
> -   label_len = grub_be_to_cpu16 (catkey->namelen);
> --  label_name = grub_malloc (label_len * sizeof (*label_name));
> -+  label_name = grub_calloc (label_len, sizeof (*label_name));
> -   if (!label_name)
> -     {
> -       grub_free (node);
> -@@ -1029,7 +1029,7 @@ grub_hfsplus_label (grub_device_t device, char
> **label)
> -       }
> -     }
> -
> --  *label = grub_malloc (label_len * GRUB_MAX_UTF8_PER_UTF16 + 1);
> -+  *label = grub_calloc (label_len, GRUB_MAX_UTF8_PER_UTF16 + 1);
> -   if (! *label)
> -     {
> -       grub_free (label_name);
> -diff --git a/grub-core/fs/iso9660.c b/grub-core/fs/iso9660.c
> -index 49c0c63..4f1b52a 100644
> ---- a/grub-core/fs/iso9660.c
> -+++ b/grub-core/fs/iso9660.c
> -@@ -331,7 +331,7 @@ grub_iso9660_convert_string (grub_uint8_t *us, int
> len)
> -   int i;
> -   grub_uint16_t t[MAX_NAMELEN / 2 + 1];
> -
> --  p = grub_malloc (len * GRUB_MAX_UTF8_PER_UTF16 + 1);
> -+  p = grub_calloc (len, GRUB_MAX_UTF8_PER_UTF16 + 1);
> -   if (! p)
> -     return NULL;
> -
> -diff --git a/grub-core/fs/ntfs.c b/grub-core/fs/ntfs.c
> -index fc4e1f6..2f34f76 100644
> ---- a/grub-core/fs/ntfs.c
> -+++ b/grub-core/fs/ntfs.c
> -@@ -556,8 +556,8 @@ get_utf8 (grub_uint8_t *in, grub_size_t len)
> -   grub_uint16_t *tmp;
> -   grub_size_t i;
> -
> --  buf = grub_malloc (len * GRUB_MAX_UTF8_PER_UTF16 + 1);
> --  tmp = grub_malloc (len * sizeof (tmp[0]));
> -+  buf = grub_calloc (len, GRUB_MAX_UTF8_PER_UTF16 + 1);
> -+  tmp = grub_calloc (len, sizeof (tmp[0]));
> -   if (!buf || !tmp)
> -     {
> -       grub_free (buf);
> -diff --git a/grub-core/fs/sfs.c b/grub-core/fs/sfs.c
> -index 50c1fe7..90f7fb3 100644
> ---- a/grub-core/fs/sfs.c
> -+++ b/grub-core/fs/sfs.c
> -@@ -266,7 +266,7 @@ grub_sfs_read_block (grub_fshelp_node_t node,
> grub_disk_addr_t fileblock)
> -       node->next_extent = node->block;
> -       node->cache_size = 0;
> -
> --      node->cache = grub_malloc (sizeof (node->cache[0]) * cache_size);
> -+      node->cache = grub_calloc (cache_size, sizeof (node->cache[0]));
> -       if (!node->cache)
> -       {
> -         grub_errno = 0;
> -diff --git a/grub-core/fs/tar.c b/grub-core/fs/tar.c
> -index 7d63e0c..c551ed6 100644
> ---- a/grub-core/fs/tar.c
> -+++ b/grub-core/fs/tar.c
> -@@ -120,7 +120,7 @@ grub_cpio_find_file (struct grub_archelp_data *data,
> char **name,
> -         if (data->linkname_alloc < linksize + 1)
> -           {
> -             char *n;
> --            n = grub_malloc (2 * (linksize + 1));
> -+            n = grub_calloc (2, linksize + 1);
> -             if (!n)
> -               return grub_errno;
> -             grub_free (data->linkname);
> -diff --git a/grub-core/fs/udf.c b/grub-core/fs/udf.c
> -index dc8b6e2..a837616 100644
> ---- a/grub-core/fs/udf.c
> -+++ b/grub-core/fs/udf.c
> -@@ -873,7 +873,7 @@ read_string (const grub_uint8_t *raw, grub_size_t sz,
> char *outbuf)
> -     {
> -       unsigned i;
> -       utf16len = sz - 1;
> --      utf16 = grub_malloc (utf16len * sizeof (utf16[0]));
> -+      utf16 = grub_calloc (utf16len, sizeof (utf16[0]));
> -       if (!utf16)
> -       return NULL;
> -       for (i = 0; i < utf16len; i++)
> -@@ -883,7 +883,7 @@ read_string (const grub_uint8_t *raw, grub_size_t sz,
> char *outbuf)
> -     {
> -       unsigned i;
> -       utf16len = (sz - 1) / 2;
> --      utf16 = grub_malloc (utf16len * sizeof (utf16[0]));
> -+      utf16 = grub_calloc (utf16len, sizeof (utf16[0]));
> -       if (!utf16)
> -       return NULL;
> -       for (i = 0; i < utf16len; i++)
> -diff --git a/grub-core/fs/zfs/zfs.c b/grub-core/fs/zfs/zfs.c
> -index 2f72e42..381dde5 100644
> ---- a/grub-core/fs/zfs/zfs.c
> -+++ b/grub-core/fs/zfs/zfs.c
> -@@ -3325,7 +3325,7 @@ dnode_get_fullpath (const char *fullpath, struct
> subvolume *subvol,
> -       }
> -       subvol->nkeys = 0;
> -       zap_iterate (&keychain_dn, 8, count_zap_keys, &ctx, data);
> --      subvol->keyring = grub_zalloc (subvol->nkeys * sizeof
> (subvol->keyring[0]));
> -+      subvol->keyring = grub_calloc (subvol->nkeys, sizeof
> (subvol->keyring[0]));
> -       if (!subvol->keyring)
> -       {
> -         grub_free (fsname);
> -@@ -4336,7 +4336,7 @@ grub_zfs_embed (grub_device_t device __attribute__
> ((unused)),
> -   *nsectors = (VDEV_BOOT_SIZE >> GRUB_DISK_SECTOR_BITS);
> -   if (*nsectors > max_nsectors)
> -     *nsectors = max_nsectors;
> --  *sectors = grub_malloc (*nsectors * sizeof (**sectors));
> -+  *sectors = grub_calloc (*nsectors, sizeof (**sectors));
> -   if (!*sectors)
> -     return grub_errno;
> -   for (i = 0; i < *nsectors; i++)
> -diff --git a/grub-core/gfxmenu/gui_string_util.c
> b/grub-core/gfxmenu/gui_string_util.c
> -index a9a415e..ba1e1ea 100644
> ---- a/grub-core/gfxmenu/gui_string_util.c
> -+++ b/grub-core/gfxmenu/gui_string_util.c
> -@@ -55,7 +55,7 @@ canonicalize_path (const char *path)
> -     if (*p == '/')
> -       components++;
> -
> --  char **path_array = grub_malloc (components * sizeof (*path_array));
> -+  char **path_array = grub_calloc (components, sizeof (*path_array));
> -   if (! path_array)
> -     return 0;
> -
> -diff --git a/grub-core/gfxmenu/widget-box.c
> b/grub-core/gfxmenu/widget-box.c
> -index b606028..470597d 100644
> ---- a/grub-core/gfxmenu/widget-box.c
> -+++ b/grub-core/gfxmenu/widget-box.c
> -@@ -303,10 +303,10 @@ grub_gfxmenu_create_box (const char *pixmaps_prefix,
> -   box->content_height = 0;
> -   box->raw_pixmaps =
> -     (struct grub_video_bitmap **)
> --    grub_malloc (BOX_NUM_PIXMAPS * sizeof (struct grub_video_bitmap *));
> -+    grub_calloc (BOX_NUM_PIXMAPS, sizeof (struct grub_video_bitmap *));
> -   box->scaled_pixmaps =
> -     (struct grub_video_bitmap **)
> --    grub_malloc (BOX_NUM_PIXMAPS * sizeof (struct grub_video_bitmap *));
> -+    grub_calloc (BOX_NUM_PIXMAPS, sizeof (struct grub_video_bitmap *));
> -
> -   /* Initialize all pixmap pointers to NULL so that proper destruction
> can
> -      be performed if an error is encountered partway through
> construction.  */
> -diff --git a/grub-core/io/gzio.c b/grub-core/io/gzio.c
> -index 6208a97..43d98a7 100644
> ---- a/grub-core/io/gzio.c
> -+++ b/grub-core/io/gzio.c
> -@@ -554,7 +554,7 @@ huft_build (unsigned *b,   /* code lengths in bits
> (all assumed <= BMAX) */
> -             z = 1 << j;       /* table entries for j-bit table */
> -
> -             /* allocate and link in new table */
> --            q = (struct huft *) grub_zalloc ((z + 1) * sizeof (struct
> huft));
> -+            q = (struct huft *) grub_calloc (z + 1, sizeof (struct
> huft));
> -             if (! q)
> -               {
> -                 if (h)
> -diff --git a/grub-core/kern/efi/efi.c b/grub-core/kern/efi/efi.c
> -index 6e1ceb9..dc31caa 100644
> ---- a/grub-core/kern/efi/efi.c
> -+++ b/grub-core/kern/efi/efi.c
> -@@ -202,7 +202,7 @@ grub_efi_set_variable(const char *var, const
> grub_efi_guid_t *guid,
> -
> -   len = grub_strlen (var);
> -   len16 = len * GRUB_MAX_UTF16_PER_UTF8;
> --  var16 = grub_malloc ((len16 + 1) * sizeof (var16[0]));
> -+  var16 = grub_calloc (len16 + 1, sizeof (var16[0]));
> -   if (!var16)
> -     return grub_errno;
> -   len16 = grub_utf8_to_utf16 (var16, len16, (grub_uint8_t *) var, len,
> NULL);
> -@@ -237,7 +237,7 @@ grub_efi_get_variable (const char *var, const
> grub_efi_guid_t *guid,
> -
> -   len = grub_strlen (var);
> -   len16 = len * GRUB_MAX_UTF16_PER_UTF8;
> --  var16 = grub_malloc ((len16 + 1) * sizeof (var16[0]));
> -+  var16 = grub_calloc (len16 + 1, sizeof (var16[0]));
> -   if (!var16)
> -     return NULL;
> -   len16 = grub_utf8_to_utf16 (var16, len16, (grub_uint8_t *) var, len,
> NULL);
> -@@ -383,7 +383,7 @@ grub_efi_get_filename (grub_efi_device_path_t *dp0)
> -         while (len > 0 && fp->path_name[len - 1] == 0)
> -           len--;
> -
> --        dup_name = grub_malloc (len * sizeof (*dup_name));
> -+        dup_name = grub_calloc (len, sizeof (*dup_name));
> -         if (!dup_name)
> -           {
> -             grub_free (name);
> -diff --git a/grub-core/kern/emu/hostdisk.c b/grub-core/kern/emu/hostdisk.c
> -index e9ec680..d975265 100644
> ---- a/grub-core/kern/emu/hostdisk.c
> -+++ b/grub-core/kern/emu/hostdisk.c
> -@@ -615,7 +615,7 @@ static char *
> - grub_util_path_concat_real (size_t n, int ext, va_list ap)
> - {
> -   size_t totlen = 0;
> --  char **l = xmalloc ((n + ext) * sizeof (l[0]));
> -+  char **l = xcalloc (n + ext, sizeof (l[0]));
> -   char *r, *p, *pi;
> -   size_t i;
> -   int first = 1;
> -diff --git a/grub-core/kern/fs.c b/grub-core/kern/fs.c
> -index 2b85f49..f90be65 100644
> ---- a/grub-core/kern/fs.c
> -+++ b/grub-core/kern/fs.c
> -@@ -151,7 +151,7 @@ grub_fs_blocklist_open (grub_file_t file, const char
> *name)
> -   while (p);
> -
> -   /* Allocate a block list.  */
> --  blocks = grub_zalloc (sizeof (struct grub_fs_block) * (num + 1));
> -+  blocks = grub_calloc (num + 1, sizeof (struct grub_fs_block));
> -   if (! blocks)
> -     return 0;
> -
> -diff --git a/grub-core/kern/misc.c b/grub-core/kern/misc.c
> -index 3b633d5..a7abd36 100644
> ---- a/grub-core/kern/misc.c
> -+++ b/grub-core/kern/misc.c
> -@@ -690,7 +690,7 @@ parse_printf_args (const char *fmt0, struct
> printf_args *args,
> -     args->ptr = args->prealloc;
> -   else
> -     {
> --      args->ptr = grub_malloc (args->count * sizeof (args->ptr[0]));
> -+      args->ptr = grub_calloc (args->count, sizeof (args->ptr[0]));
> -       if (!args->ptr)
> -       {
> -         grub_errno = GRUB_ERR_NONE;
> -diff --git a/grub-core/kern/parser.c b/grub-core/kern/parser.c
> -index 78175aa..619db31 100644
> ---- a/grub-core/kern/parser.c
> -+++ b/grub-core/kern/parser.c
> -@@ -213,7 +213,7 @@ grub_parser_split_cmdline (const char *cmdline,
> -     return grub_errno;
> -   grub_memcpy (args, buffer, bp - buffer);
> -
> --  *argv = grub_malloc (sizeof (char *) * (*argc + 1));
> -+  *argv = grub_calloc (*argc + 1, sizeof (char *));
> -   if (!*argv)
> -     {
> -       grub_free (args);
> -diff --git a/grub-core/kern/uboot/uboot.c b/grub-core/kern/uboot/uboot.c
> -index be4816f..aac8f9a 100644
> ---- a/grub-core/kern/uboot/uboot.c
> -+++ b/grub-core/kern/uboot/uboot.c
> -@@ -133,7 +133,7 @@ grub_uboot_dev_enum (void)
> -     return num_devices;
> -
> -   max_devices = 2;
> --  enum_devices = grub_malloc (sizeof(struct device_info) * max_devices);
> -+  enum_devices = grub_calloc (max_devices, sizeof(struct device_info));
> -   if (!enum_devices)
> -     return 0;
> -
> -diff --git a/grub-core/lib/libgcrypt/cipher/ac.c
> b/grub-core/lib/libgcrypt/cipher/ac.c
> -index f5e946a..63f6fcd 100644
> ---- a/grub-core/lib/libgcrypt/cipher/ac.c
> -+++ b/grub-core/lib/libgcrypt/cipher/ac.c
> -@@ -185,7 +185,7 @@ ac_data_mpi_copy (gcry_ac_mpi_t *data_mpis, unsigned
> int data_mpis_n,
> -   gcry_mpi_t mpi;
> -   char *label;
> -
> --  data_mpis_new = gcry_malloc (sizeof (*data_mpis_new) * data_mpis_n);
> -+  data_mpis_new = gcry_calloc (data_mpis_n, sizeof (*data_mpis_new));
> -   if (! data_mpis_new)
> -     {
> -       err = gcry_error_from_errno (errno);
> -@@ -572,7 +572,7 @@ _gcry_ac_data_to_sexp (gcry_ac_data_t data,
> gcry_sexp_t *sexp,
> -     }
> -
> -   /* Add MPI list.  */
> --  arg_list = gcry_malloc (sizeof (*arg_list) * (data_n + 1));
> -+  arg_list = gcry_calloc (data_n + 1, sizeof (*arg_list));
> -   if (! arg_list)
> -     {
> -       err = gcry_error_from_errno (errno);
> -@@ -1283,7 +1283,7 @@ ac_data_construct (const char *identifier, int
> include_flags,
> -   /* We build a list of arguments to pass to
> -      gcry_sexp_build_array().  */
> -   data_length = _gcry_ac_data_length (data);
> --  arg_list = gcry_malloc (sizeof (*arg_list) * (data_length * 2));
> -+  arg_list = gcry_calloc (data_length, sizeof (*arg_list) * 2);
> -   if (! arg_list)
> -     {
> -       err = gcry_error_from_errno (errno);
> -@@ -1593,7 +1593,7 @@ _gcry_ac_key_pair_generate (gcry_ac_handle_t
> handle, unsigned int nbits,
> -       arg_list_n += 2;
> -
> -   /* Allocate list.  */
> --  arg_list = gcry_malloc (sizeof (*arg_list) * arg_list_n);
> -+  arg_list = gcry_calloc (arg_list_n, sizeof (*arg_list));
> -   if (! arg_list)
> -     {
> -       err = gcry_error_from_errno (errno);
> -diff --git a/grub-core/lib/libgcrypt/cipher/primegen.c
> b/grub-core/lib/libgcrypt/cipher/primegen.c
> -index 2788e34..b12e79b 100644
> ---- a/grub-core/lib/libgcrypt/cipher/primegen.c
> -+++ b/grub-core/lib/libgcrypt/cipher/primegen.c
> -@@ -383,7 +383,7 @@ prime_generate_internal (int need_q_factor,
> -     }
> -
> -   /* Allocate an array to track pool usage. */
> --  pool_in_use = gcry_malloc (n * sizeof *pool_in_use);
> -+  pool_in_use = gcry_calloc (n, sizeof *pool_in_use);
> -   if (!pool_in_use)
> -     {
> -       err = gpg_err_code_from_errno (errno);
> -@@ -765,7 +765,7 @@ gen_prime (unsigned int nbits, int secret, int
> randomlevel,
> -   if (nbits < 16)
> -     log_fatal ("can't generate a prime with less than %d bits\n", 16);
> -
> --  mods = gcry_xmalloc( no_of_small_prime_numbers * sizeof *mods );
> -+  mods = gcry_xcalloc( no_of_small_prime_numbers, sizeof *mods);
> -   /* Make nbits fit into gcry_mpi_t implementation. */
> -   val_2  = mpi_alloc_set_ui( 2 );
> -   val_3 = mpi_alloc_set_ui( 3);
> -diff --git a/grub-core/lib/libgcrypt/cipher/pubkey.c
> b/grub-core/lib/libgcrypt/cipher/pubkey.c
> -index 9109821..ca087ad 100644
> ---- a/grub-core/lib/libgcrypt/cipher/pubkey.c
> -+++ b/grub-core/lib/libgcrypt/cipher/pubkey.c
> -@@ -2941,7 +2941,7 @@ gcry_pk_encrypt (gcry_sexp_t *r_ciph, gcry_sexp_t
> s_data, gcry_sexp_t s_pkey)
> -        * array to a format string, so we have to do it this way :-(.  */
> -       /* FIXME: There is now such a format specifier, so we can
> -          change the code to be more clear. */
> --      arg_list = malloc (nelem * sizeof *arg_list);
> -+      arg_list = calloc (nelem, sizeof *arg_list);
> -       if (!arg_list)
> -         {
> -           rc = gpg_err_code_from_syserror ();
> -@@ -3233,7 +3233,7 @@ gcry_pk_sign (gcry_sexp_t *r_sig, gcry_sexp_t
> s_hash, gcry_sexp_t s_skey)
> -         }
> -       strcpy (p, "))");
> -
> --      arg_list = malloc (nelem * sizeof *arg_list);
> -+      arg_list = calloc (nelem, sizeof *arg_list);
> -       if (!arg_list)
> -         {
> -           rc = gpg_err_code_from_syserror ();
> -diff --git a/grub-core/lib/priority_queue.c
> b/grub-core/lib/priority_queue.c
> -index 659be0b..7d5e7c0 100644
> ---- a/grub-core/lib/priority_queue.c
> -+++ b/grub-core/lib/priority_queue.c
> -@@ -92,7 +92,7 @@ grub_priority_queue_new (grub_size_t elsize,
> - {
> -   struct grub_priority_queue *ret;
> -   void *els;
> --  els = grub_malloc (elsize * 8);
> -+  els = grub_calloc (8, elsize);
> -   if (!els)
> -     return 0;
> -   ret = (struct grub_priority_queue *) grub_malloc (sizeof (*ret));
> -diff --git a/grub-core/lib/reed_solomon.c b/grub-core/lib/reed_solomon.c
> -index ee9fa7b..467305b 100644
> ---- a/grub-core/lib/reed_solomon.c
> -+++ b/grub-core/lib/reed_solomon.c
> -@@ -20,6 +20,7 @@
> - #include <stdio.h>
> - #include <string.h>
> - #include <stdlib.h>
> -+#define xcalloc calloc
> - #define xmalloc malloc
> - #define grub_memset memset
> - #define grub_memcpy memcpy
> -@@ -158,11 +159,9 @@ rs_encode (gf_single_t *data, grub_size_t s,
> grub_size_t rs)
> -   gf_single_t *rs_polynomial;
> -   int i, j;
> -   gf_single_t *m;
> --  m = xmalloc ((s + rs) * sizeof (gf_single_t));
> -+  m = xcalloc (s + rs, sizeof (gf_single_t));
> -   grub_memcpy (m, data, s * sizeof (gf_single_t));
> --  grub_memset (m + s, 0, rs * sizeof (gf_single_t));
> --  rs_polynomial = xmalloc ((rs + 1) * sizeof (gf_single_t));
> --  grub_memset (rs_polynomial, 0, (rs + 1) * sizeof (gf_single_t));
> -+  rs_polynomial = xcalloc (rs + 1, sizeof (gf_single_t));
> -   rs_polynomial[rs] = 1;
> -   /* Multiply with X - a^r */
> -   for (j = 0; j < rs; j++)
> -diff --git a/grub-core/lib/relocator.c b/grub-core/lib/relocator.c
> -index ea3ebc7..5847aac 100644
> ---- a/grub-core/lib/relocator.c
> -+++ b/grub-core/lib/relocator.c
> -@@ -495,9 +495,9 @@ malloc_in_range (struct grub_relocator *rel,
> -   }
> - #endif
> -
> --  eventt = grub_malloc (maxevents * sizeof (events[0]));
> -+  eventt = grub_calloc (maxevents, sizeof (events[0]));
> -   counter = grub_malloc ((DIGITSORT_MASK + 2) * sizeof (counter[0]));
> --  events = grub_malloc (maxevents * sizeof (events[0]));
> -+  events = grub_calloc (maxevents, sizeof (events[0]));
> -   if (!events || !eventt || !counter)
> -     {
> -       grub_dprintf ("relocator", "events or counter allocation failed
> %d\n",
> -@@ -963,7 +963,7 @@ malloc_in_range (struct grub_relocator *rel,
> - #endif
> -     unsigned cural = 0;
> -     int oom = 0;
> --    res->subchunks = grub_malloc (sizeof (res->subchunks[0]) * nallocs);
> -+    res->subchunks = grub_calloc (nallocs, sizeof (res->subchunks[0]));
> -     if (!res->subchunks)
> -       oom = 1;
> -     res->nsubchunks = nallocs;
> -@@ -1562,8 +1562,8 @@ grub_relocator_prepare_relocs (struct
> grub_relocator *rel, grub_addr_t addr,
> -           count[(chunk->src & 0xff) + 1]++;
> -         }
> -     }
> --    from = grub_malloc (nchunks * sizeof (sorted[0]));
> --    to = grub_malloc (nchunks * sizeof (sorted[0]));
> -+    from = grub_calloc (nchunks, sizeof (sorted[0]));
> -+    to = grub_calloc (nchunks, sizeof (sorted[0]));
> -     if (!from || !to)
> -       {
> -       grub_free (from);
> -diff --git a/grub-core/lib/zstd/fse_decompress.c
> b/grub-core/lib/zstd/fse_decompress.c
> -index 72bbead..2227b84 100644
> ---- a/grub-core/lib/zstd/fse_decompress.c
> -+++ b/grub-core/lib/zstd/fse_decompress.c
> -@@ -82,7 +82,7 @@
> - FSE_DTable* FSE_createDTable (unsigned tableLog)
> - {
> -     if (tableLog > FSE_TABLELOG_ABSOLUTE_MAX) tableLog =
> FSE_TABLELOG_ABSOLUTE_MAX;
> --    return (FSE_DTable*)malloc( FSE_DTABLE_SIZE_U32(tableLog) * sizeof
> (U32) );
> -+    return (FSE_DTable*)calloc( FSE_DTABLE_SIZE_U32(tableLog), sizeof
> (U32) );
> - }
> -
> - void FSE_freeDTable (FSE_DTable* dt)
> -diff --git a/grub-core/loader/arm/linux.c b/grub-core/loader/arm/linux.c
> -index 5168491..d70c174 100644
> ---- a/grub-core/loader/arm/linux.c
> -+++ b/grub-core/loader/arm/linux.c
> -@@ -78,7 +78,7 @@ linux_prepare_atag (void *target_atag)
> -
> -   /* some place for cmdline, initrd and terminator.  */
> -   tmp_size = get_atag_size (atag_orig) + 20 + (arg_size) / 4;
> --  tmp_atag = grub_malloc (tmp_size * sizeof (grub_uint32_t));
> -+  tmp_atag = grub_calloc (tmp_size, sizeof (grub_uint32_t));
> -   if (!tmp_atag)
> -     return grub_errno;
> -
> -diff --git a/grub-core/loader/efi/chainloader.c
> b/grub-core/loader/efi/chainloader.c
> -index cd92ea3..daf8c6b 100644
> ---- a/grub-core/loader/efi/chainloader.c
> -+++ b/grub-core/loader/efi/chainloader.c
> -@@ -116,7 +116,7 @@ copy_file_path (grub_efi_file_path_device_path_t *fp,
> -   fp->header.type = GRUB_EFI_MEDIA_DEVICE_PATH_TYPE;
> -   fp->header.subtype = GRUB_EFI_FILE_PATH_DEVICE_PATH_SUBTYPE;
> -
> --  path_name = grub_malloc (len * GRUB_MAX_UTF16_PER_UTF8 * sizeof
> (*path_name));
> -+  path_name = grub_calloc (len, GRUB_MAX_UTF16_PER_UTF8 * sizeof
> (*path_name));
> -   if (!path_name)
> -     return;
> -
> -diff --git a/grub-core/loader/i386/bsdXX.c b/grub-core/loader/i386/bsdXX.c
> -index af6741d..a8d8bf7 100644
> ---- a/grub-core/loader/i386/bsdXX.c
> -+++ b/grub-core/loader/i386/bsdXX.c
> -@@ -48,7 +48,7 @@ read_headers (grub_file_t file, const char *filename,
> Elf_Ehdr *e, char **shdr)
> -   if (e->e_ident[EI_CLASS] != SUFFIX (ELFCLASS))
> -     return grub_error (GRUB_ERR_BAD_OS, N_("invalid arch-dependent ELF
> magic"));
> -
> --  *shdr = grub_malloc ((grub_uint32_t) e->e_shnum * e->e_shentsize);
> -+  *shdr = grub_calloc (e->e_shnum, e->e_shentsize);
> -   if (! *shdr)
> -     return grub_errno;
> -
> -diff --git a/grub-core/loader/i386/xnu.c b/grub-core/loader/i386/xnu.c
> -index e64ed08..b7d176b 100644
> ---- a/grub-core/loader/i386/xnu.c
> -+++ b/grub-core/loader/i386/xnu.c
> -@@ -295,7 +295,7 @@ grub_xnu_devprop_add_property_utf8 (struct
> grub_xnu_devprop_device_descriptor *d
> -     return grub_errno;
> -
> -   len = grub_strlen (name);
> --  utf16 = grub_malloc (sizeof (grub_uint16_t) * len);
> -+  utf16 = grub_calloc (len, sizeof (grub_uint16_t));
> -   if (!utf16)
> -     {
> -       grub_free (utf8);
> -@@ -331,7 +331,7 @@ grub_xnu_devprop_add_property_utf16 (struct
> grub_xnu_devprop_device_descriptor *
> -   grub_uint16_t *utf16;
> -   grub_err_t err;
> -
> --  utf16 = grub_malloc (sizeof (grub_uint16_t) * namelen);
> -+  utf16 = grub_calloc (namelen, sizeof (grub_uint16_t));
> -   if (!utf16)
> -     return grub_errno;
> -   grub_memcpy (utf16, name, sizeof (grub_uint16_t) * namelen);
> -diff --git a/grub-core/loader/macho.c b/grub-core/loader/macho.c
> -index 085f9c6..05710c4 100644
> ---- a/grub-core/loader/macho.c
> -+++ b/grub-core/loader/macho.c
> -@@ -97,7 +97,7 @@ grub_macho_file (grub_file_t file, const char
> *filename, int is_64bit)
> -       if (grub_file_seek (macho->file, sizeof (struct
> grub_macho_fat_header))
> -         == (grub_off_t) -1)
> -       goto fail;
> --      archs = grub_malloc (sizeof (struct grub_macho_fat_arch) * narchs);
> -+      archs = grub_calloc (narchs, sizeof (struct grub_macho_fat_arch));
> -       if (!archs)
> -       goto fail;
> -       if (grub_file_read (macho->file, archs,
> -diff --git a/grub-core/loader/multiboot_elfxx.c
> b/grub-core/loader/multiboot_elfxx.c
> -index 70cd1db..cc68536 100644
> ---- a/grub-core/loader/multiboot_elfxx.c
> -+++ b/grub-core/loader/multiboot_elfxx.c
> -@@ -217,7 +217,7 @@ CONCAT(grub_multiboot_load_elf, XX) (mbi_load_data_t
> *mld)
> -     {
> -       grub_uint8_t *shdr, *shdrptr;
> -
> --      shdr = grub_malloc ((grub_uint32_t) ehdr->e_shnum *
> ehdr->e_shentsize);
> -+      shdr = grub_calloc (ehdr->e_shnum, ehdr->e_shentsize);
> -       if (!shdr)
> -       return grub_errno;
> -
> -diff --git a/grub-core/loader/xnu.c b/grub-core/loader/xnu.c
> -index 7f74d1d..77d7060 100644
> ---- a/grub-core/loader/xnu.c
> -+++ b/grub-core/loader/xnu.c
> -@@ -800,7 +800,7 @@ grub_cmd_xnu_mkext (grub_command_t cmd __attribute__
> ((unused)),
> -   if (grub_be_to_cpu32 (head.magic) == GRUB_MACHO_FAT_MAGIC)
> -     {
> -       narchs = grub_be_to_cpu32 (head.nfat_arch);
> --      archs = grub_malloc (sizeof (struct grub_macho_fat_arch) * narchs);
> -+      archs = grub_calloc (narchs, sizeof (struct grub_macho_fat_arch));
> -       if (! archs)
> -       {
> -         grub_file_close (file);
> -diff --git a/grub-core/mmap/mmap.c b/grub-core/mmap/mmap.c
> -index 6a31cba..57b4e9a 100644
> ---- a/grub-core/mmap/mmap.c
> -+++ b/grub-core/mmap/mmap.c
> -@@ -143,9 +143,9 @@ grub_mmap_iterate (grub_memory_hook_t hook, void
> *hook_data)
> -
> -   /* Initialize variables. */
> -   ctx.scanline_events = (struct grub_mmap_scan *)
> --    grub_malloc (sizeof (struct grub_mmap_scan) * 2 * mmap_num);
> -+    grub_calloc (mmap_num, sizeof (struct grub_mmap_scan) * 2);
> -
> --  present = grub_zalloc (sizeof (present[0]) * current_priority);
> -+  present = grub_calloc (current_priority, sizeof (present[0]));
> -
> -   if (! ctx.scanline_events || !present)
> -     {
> -diff --git a/grub-core/net/bootp.c b/grub-core/net/bootp.c
> -index 04cfbb0..6539572 100644
> ---- a/grub-core/net/bootp.c
> -+++ b/grub-core/net/bootp.c
> -@@ -766,7 +766,7 @@ grub_cmd_bootp (struct grub_command *cmd
> __attribute__ ((unused)),
> -   if (ncards == 0)
> -     return grub_error (GRUB_ERR_NET_NO_CARD, N_("no network card
> found"));
> -
> --  ifaces = grub_zalloc (ncards * sizeof (ifaces[0]));
> -+  ifaces = grub_calloc (ncards, sizeof (ifaces[0]));
> -   if (!ifaces)
> -     return grub_errno;
> -
> -diff --git a/grub-core/net/dns.c b/grub-core/net/dns.c
> -index 5d9afe0..e332d5e 100644
> ---- a/grub-core/net/dns.c
> -+++ b/grub-core/net/dns.c
> -@@ -285,8 +285,8 @@ recv_hook (grub_net_udp_socket_t sock __attribute__
> ((unused)),
> -       ptr++;
> -       ptr += 4;
> -     }
> --  *data->addresses = grub_malloc (sizeof ((*data->addresses)[0])
> --                               * grub_be_to_cpu16 (head->ancount));
> -+  *data->addresses = grub_calloc (grub_be_to_cpu16 (head->ancount),
> -+                                sizeof ((*data->addresses)[0]));
> -   if (!*data->addresses)
> -     {
> -       grub_errno = GRUB_ERR_NONE;
> -@@ -406,8 +406,8 @@ recv_hook (grub_net_udp_socket_t sock __attribute__
> ((unused)),
> -       dns_cache[h].addresses = 0;
> -       dns_cache[h].name = grub_strdup (data->oname);
> -       dns_cache[h].naddresses = *data->naddresses;
> --      dns_cache[h].addresses = grub_malloc (*data->naddresses
> --                                          * sizeof
> (dns_cache[h].addresses[0]));
> -+      dns_cache[h].addresses = grub_calloc (*data->naddresses,
> -+                                          sizeof
> (dns_cache[h].addresses[0]));
> -       dns_cache[h].limit_time = grub_get_time_ms () + 1000 * ttl_all;
> -       if (!dns_cache[h].addresses || !dns_cache[h].name)
> -       {
> -@@ -479,7 +479,7 @@ grub_net_dns_lookup (const char *name,
> -       }
> -     }
> -
> --  sockets = grub_malloc (sizeof (sockets[0]) * n_servers);
> -+  sockets = grub_calloc (n_servers, sizeof (sockets[0]));
> -   if (!sockets)
> -     return grub_errno;
> -
> -diff --git a/grub-core/net/net.c b/grub-core/net/net.c
> -index d5d726a..38f19df 100644
> ---- a/grub-core/net/net.c
> -+++ b/grub-core/net/net.c
> -@@ -333,8 +333,8 @@ grub_cmd_ipv6_autoconf (struct grub_command *cmd
> __attribute__ ((unused)),
> -     ncards++;
> -   }
> -
> --  ifaces = grub_zalloc (ncards * sizeof (ifaces[0]));
> --  slaacs = grub_zalloc (ncards * sizeof (slaacs[0]));
> -+  ifaces = grub_calloc (ncards, sizeof (ifaces[0]));
> -+  slaacs = grub_calloc (ncards, sizeof (slaacs[0]));
> -   if (!ifaces || !slaacs)
> -     {
> -       grub_free (ifaces);
> -diff --git a/grub-core/normal/charset.c b/grub-core/normal/charset.c
> -index b0ab47d..d57fb72 100644
> ---- a/grub-core/normal/charset.c
> -+++ b/grub-core/normal/charset.c
> -@@ -203,7 +203,7 @@ grub_utf8_to_ucs4_alloc (const char *msg,
> grub_uint32_t **unicode_msg,
> - {
> -   grub_size_t msg_len = grub_strlen (msg);
> -
> --  *unicode_msg = grub_malloc (msg_len * sizeof (grub_uint32_t));
> -+  *unicode_msg = grub_calloc (msg_len, sizeof (grub_uint32_t));
> -
> -   if (!*unicode_msg)
> -     return -1;
> -@@ -488,7 +488,7 @@ grub_unicode_aglomerate_comb (const grub_uint32_t
> *in, grub_size_t inlen,
> -           }
> -         else
> -           {
> --            n = grub_malloc (sizeof (n[0]) * (out->ncomb + 1));
> -+            n = grub_calloc (out->ncomb + 1, sizeof (n[0]));
> -             if (!n)
> -               {
> -                 grub_errno = GRUB_ERR_NONE;
> -@@ -842,7 +842,7 @@ grub_bidi_line_logical_to_visual (const grub_uint32_t
> *logical,
> -       }                                                       \
> -   }
> -
> --  visual = grub_malloc (sizeof (visual[0]) * logical_len);
> -+  visual = grub_calloc (logical_len, sizeof (visual[0]));
> -   if (!visual)
> -     return -1;
> -
> -@@ -1165,8 +1165,8 @@ grub_bidi_logical_to_visual (const grub_uint32_t
> *logical,
> - {
> -   const grub_uint32_t *line_start = logical, *ptr;
> -   struct grub_unicode_glyph *visual_ptr;
> --  *visual_out = visual_ptr = grub_malloc (3 * sizeof (visual_ptr[0])
> --                                        * (logical_len + 2));
> -+  *visual_out = visual_ptr = grub_calloc (logical_len + 2,
> -+                                        3 * sizeof (visual_ptr[0]));
> -   if (!visual_ptr)
> -     return -1;
> -   for (ptr = logical; ptr <= logical + logical_len; ptr++)
> -diff --git a/grub-core/normal/cmdline.c b/grub-core/normal/cmdline.c
> -index c037d50..c57242e 100644
> ---- a/grub-core/normal/cmdline.c
> -+++ b/grub-core/normal/cmdline.c
> -@@ -41,7 +41,7 @@ grub_err_t
> - grub_set_history (int newsize)
> - {
> -   grub_uint32_t **old_hist_lines = hist_lines;
> --  hist_lines = grub_malloc (sizeof (grub_uint32_t *) * newsize);
> -+  hist_lines = grub_calloc (newsize, sizeof (grub_uint32_t *));
> -
> -   /* Copy the old lines into the new buffer.  */
> -   if (old_hist_lines)
> -@@ -114,7 +114,7 @@ static void
> - grub_history_set (int pos, grub_uint32_t *s, grub_size_t len)
> - {
> -   grub_free (hist_lines[pos]);
> --  hist_lines[pos] = grub_malloc ((len + 1) * sizeof (grub_uint32_t));
> -+  hist_lines[pos] = grub_calloc (len + 1, sizeof (grub_uint32_t));
> -   if (!hist_lines[pos])
> -     {
> -       grub_print_error ();
> -@@ -349,7 +349,7 @@ grub_cmdline_get (const char *prompt_translated)
> -   char *ret;
> -   unsigned nterms;
> -
> --  buf = grub_malloc (max_len * sizeof (grub_uint32_t));
> -+  buf = grub_calloc (max_len, sizeof (grub_uint32_t));
> -   if (!buf)
> -     return 0;
> -
> -@@ -377,7 +377,7 @@ grub_cmdline_get (const char *prompt_translated)
> -     FOR_ACTIVE_TERM_OUTPUTS(cur)
> -       nterms++;
> -
> --    cl_terms = grub_malloc (sizeof (cl_terms[0]) * nterms);
> -+    cl_terms = grub_calloc (nterms, sizeof (cl_terms[0]));
> -     if (!cl_terms)
> -       {
> -       grub_free (buf);
> -@@ -385,7 +385,7 @@ grub_cmdline_get (const char *prompt_translated)
> -       }
> -     cl_term_cur = cl_terms;
> -
> --    unicode_msg = grub_malloc (msg_len * sizeof (grub_uint32_t));
> -+    unicode_msg = grub_calloc (msg_len, sizeof (grub_uint32_t));
> -     if (!unicode_msg)
> -       {
> -       grub_free (buf);
> -@@ -495,7 +495,7 @@ grub_cmdline_get (const char *prompt_translated)
> -               grub_uint32_t *insert;
> -
> -               insertlen = grub_strlen (insertu8);
> --              insert = grub_malloc ((insertlen + 1) * sizeof
> (grub_uint32_t));
> -+              insert = grub_calloc (insertlen + 1, sizeof
> (grub_uint32_t));
> -               if (!insert)
> -                 {
> -                   grub_free (insertu8);
> -@@ -602,7 +602,7 @@ grub_cmdline_get (const char *prompt_translated)
> -
> -             grub_free (kill_buf);
> -
> --            kill_buf = grub_malloc ((n + 1) * sizeof(grub_uint32_t));
> -+            kill_buf = grub_calloc (n + 1, sizeof (grub_uint32_t));
> -             if (grub_errno)
> -               {
> -                 grub_print_error ();
> -diff --git a/grub-core/normal/menu_entry.c b/grub-core/normal/menu_entry.c
> -index cdf3590..1993995 100644
> ---- a/grub-core/normal/menu_entry.c
> -+++ b/grub-core/normal/menu_entry.c
> -@@ -95,8 +95,8 @@ init_line (struct screen *screen, struct line *linep)
> - {
> -   linep->len = 0;
> -   linep->max_len = 80;
> --  linep->buf = grub_malloc ((linep->max_len + 1) * sizeof
> (linep->buf[0]));
> --  linep->pos = grub_zalloc (screen->nterms * sizeof (linep->pos[0]));
> -+  linep->buf = grub_calloc (linep->max_len + 1, sizeof (linep->buf[0]));
> -+  linep->pos = grub_calloc (screen->nterms, sizeof (linep->pos[0]));
> -   if (! linep->buf || !linep->pos)
> -     {
> -       grub_free (linep->buf);
> -@@ -287,7 +287,7 @@ update_screen (struct screen *screen, struct
> per_term_screen *term_screen,
> -         pos = linep->pos + (term_screen - screen->terms);
> -
> -         if (!*pos)
> --          *pos = grub_zalloc ((linep->len + 1) * sizeof (**pos));
> -+          *pos = grub_calloc (linep->len + 1, sizeof (**pos));
> -
> -         if (i == region_start || linep == screen->lines + screen->line
> -             || (i > region_start && mode == ALL_LINES))
> -@@ -471,7 +471,7 @@ insert_string (struct screen *screen, const char *s,
> int update)
> -
> -         /* Insert the string.  */
> -         current_linep = screen->lines + screen->line;
> --        unicode_msg = grub_malloc ((p - s) * sizeof (grub_uint32_t));
> -+        unicode_msg = grub_calloc (p - s, sizeof (grub_uint32_t));
> -
> -         if (!unicode_msg)
> -           return 0;
> -@@ -1023,7 +1023,7 @@ complete (struct screen *screen, int continuous,
> int update)
> -   if (completion_buffer.buf)
> -     {
> -       buflen = grub_strlen (completion_buffer.buf);
> --      ucs4 = grub_malloc (sizeof (grub_uint32_t) * (buflen + 1));
> -+      ucs4 = grub_calloc (buflen + 1, sizeof (grub_uint32_t));
> -
> -       if (!ucs4)
> -       {
> -@@ -1268,7 +1268,7 @@ grub_menu_entry_run (grub_menu_entry_t entry)
> -   for (i = 0; i < (unsigned) screen->num_lines; i++)
> -     {
> -       grub_free (screen->lines[i].pos);
> --      screen->lines[i].pos = grub_zalloc (screen->nterms * sizeof
> (screen->lines[i].pos[0]));
> -+      screen->lines[i].pos = grub_calloc (screen->nterms, sizeof
> (screen->lines[i].pos[0]));
> -       if (! screen->lines[i].pos)
> -       {
> -         grub_print_error ();
> -@@ -1278,7 +1278,7 @@ grub_menu_entry_run (grub_menu_entry_t entry)
> -       }
> -     }
> -
> --  screen->terms = grub_zalloc (screen->nterms * sizeof
> (screen->terms[0]));
> -+  screen->terms = grub_calloc (screen->nterms, sizeof
> (screen->terms[0]));
> -   if (!screen->terms)
> -     {
> -       grub_print_error ();
> -diff --git a/grub-core/normal/menu_text.c b/grub-core/normal/menu_text.c
> -index e22bb91..18240e7 100644
> ---- a/grub-core/normal/menu_text.c
> -+++ b/grub-core/normal/menu_text.c
> -@@ -78,7 +78,7 @@ grub_print_message_indented_real (const char *msg, int
> margin_left,
> -   grub_size_t msg_len = grub_strlen (msg) + 2;
> -   int ret = 0;
> -
> --  unicode_msg = grub_malloc (msg_len * sizeof (grub_uint32_t));
> -+  unicode_msg = grub_calloc (msg_len, sizeof (grub_uint32_t));
> -
> -   if (!unicode_msg)
> -     return 0;
> -@@ -211,7 +211,7 @@ print_entry (int y, int highlight, grub_menu_entry_t
> entry,
> -
> -   title = entry ? entry->title : "";
> -   title_len = grub_strlen (title);
> --  unicode_title = grub_malloc (title_len * sizeof (*unicode_title));
> -+  unicode_title = grub_calloc (title_len, sizeof (*unicode_title));
> -   if (! unicode_title)
> -     /* XXX How to show this error?  */
> -     return;
> -diff --git a/grub-core/normal/term.c b/grub-core/normal/term.c
> -index a1e5c5a..cc8c173 100644
> ---- a/grub-core/normal/term.c
> -+++ b/grub-core/normal/term.c
> -@@ -264,7 +264,7 @@ grub_term_save_pos (void)
> -   FOR_ACTIVE_TERM_OUTPUTS(cur)
> -     cnt++;
> -
> --  ret = grub_malloc (cnt * sizeof (ret[0]));
> -+  ret = grub_calloc (cnt, sizeof (ret[0]));
> -   if (!ret)
> -     return NULL;
> -
> -@@ -1013,7 +1013,7 @@ grub_xnputs (const char *str, grub_size_t msg_len)
> -
> -   grub_error_push ();
> -
> --  unicode_str = grub_malloc (msg_len * sizeof (grub_uint32_t));
> -+  unicode_str = grub_calloc (msg_len, sizeof (grub_uint32_t));
> -
> -   grub_error_pop ();
> -
> -diff --git a/grub-core/osdep/linux/getroot.c
> b/grub-core/osdep/linux/getroot.c
> -index 90d92d3..5b41ad0 100644
> ---- a/grub-core/osdep/linux/getroot.c
> -+++ b/grub-core/osdep/linux/getroot.c
> -@@ -168,7 +168,7 @@ grub_util_raid_getmembers (const char *name, int
> bootable)
> -   if (ret != 0)
> -     grub_util_error (_("ioctl GET_ARRAY_INFO error: %s"), strerror
> (errno));
> -
> --  devicelist = xmalloc ((info.nr_disks + 1) * sizeof (char *));
> -+  devicelist = xcalloc (info.nr_disks + 1, sizeof (char *));
> -
> -   for (i = 0, j = 0; j < info.nr_disks; i++)
> -     {
> -@@ -241,7 +241,7 @@ grub_find_root_devices_from_btrfs (const char *dir)
> -       return NULL;
> -     }
> -
> --  ret = xmalloc ((fsi.num_devices + 1) * sizeof (ret[0]));
> -+  ret = xcalloc (fsi.num_devices + 1, sizeof (ret[0]));
> -
> -   for (i = 1; i <= fsi.max_id && j < fsi.num_devices; i++)
> -     {
> -@@ -396,7 +396,7 @@ grub_find_root_devices_from_mountinfo (const char
> *dir, char **relroot)
> -   if (relroot)
> -     *relroot = NULL;
> -
> --  entries = xmalloc (entry_max * sizeof (*entries));
> -+  entries = xcalloc (entry_max, sizeof (*entries));
> -
> - again:
> -   fp = grub_util_fopen ("/proc/self/mountinfo", "r");
> -diff --git a/grub-core/osdep/unix/config.c b/grub-core/osdep/unix/config.c
> -index 65effa9..7d63251 100644
> ---- a/grub-core/osdep/unix/config.c
> -+++ b/grub-core/osdep/unix/config.c
> -@@ -89,7 +89,7 @@ grub_util_load_config (struct grub_util_config *cfg)
> -   argv[0] = "sh";
> -   argv[1] = "-c";
> -
> --  script = xmalloc (4 * strlen (cfgfile) + 300);
> -+  script = xcalloc (4, strlen (cfgfile) + 300);
> -
> -   ptr = script;
> -   memcpy (ptr, ". '", 3);
> -diff --git a/grub-core/osdep/windows/getroot.c
> b/grub-core/osdep/windows/getroot.c
> -index 661d954..eada663 100644
> ---- a/grub-core/osdep/windows/getroot.c
> -+++ b/grub-core/osdep/windows/getroot.c
> -@@ -59,7 +59,7 @@ grub_get_mount_point (const TCHAR *path)
> -
> -   for (ptr = path; *ptr; ptr++);
> -   allocsize = (ptr - path + 10) * 2;
> --  out = xmalloc (allocsize * sizeof (out[0]));
> -+  out = xcalloc (allocsize, sizeof (out[0]));
> -
> -   /* When pointing to EFI system partition GetVolumePathName fails
> -      for ESP root and returns abberant information for everything
> -diff --git a/grub-core/osdep/windows/hostdisk.c
> b/grub-core/osdep/windows/hostdisk.c
> -index 3551007..0be3273 100644
> ---- a/grub-core/osdep/windows/hostdisk.c
> -+++ b/grub-core/osdep/windows/hostdisk.c
> -@@ -111,7 +111,7 @@ grub_util_get_windows_path_real (const char *path)
> -
> -   while (1)
> -     {
> --      fpa = xmalloc (alloc * sizeof (fpa[0]));
> -+      fpa = xcalloc (alloc, sizeof (fpa[0]));
> -
> -       len = GetFullPathName (tpath, alloc, fpa, NULL);
> -       if (len >= alloc)
> -@@ -399,7 +399,7 @@ grub_util_fd_opendir (const char *name)
> -   for (l = 0; name_windows[l]; l++);
> -   for (l--; l >= 0 && (name_windows[l] == '\\' || name_windows[l] ==
> '/'); l--);
> -   l++;
> --  pattern = xmalloc ((l + 3) * sizeof (pattern[0]));
> -+  pattern = xcalloc (l + 3, sizeof (pattern[0]));
> -   memcpy (pattern, name_windows, l * sizeof (pattern[0]));
> -   pattern[l] = '\\';
> -   pattern[l + 1] = '*';
> -diff --git a/grub-core/osdep/windows/init.c
> b/grub-core/osdep/windows/init.c
> -index e8ffd62..6297de6 100644
> ---- a/grub-core/osdep/windows/init.c
> -+++ b/grub-core/osdep/windows/init.c
> -@@ -161,7 +161,7 @@ grub_util_host_init (int *argc __attribute__
> ((unused)),
> -   LPWSTR *targv;
> -
> -   targv = CommandLineToArgvW (tcmdline, argc);
> --  *argv = xmalloc ((*argc + 1) * sizeof (argv[0]));
> -+  *argv = xcalloc (*argc + 1, sizeof (argv[0]));
> -
> -   for (i = 0; i < *argc; i++)
> -     (*argv)[i] = grub_util_tchar_to_utf8 (targv[i]);
> -diff --git a/grub-core/osdep/windows/platform.c
> b/grub-core/osdep/windows/platform.c
> -index 7eb53fe..1ef86bf 100644
> ---- a/grub-core/osdep/windows/platform.c
> -+++ b/grub-core/osdep/windows/platform.c
> -@@ -225,8 +225,8 @@ grub_install_register_efi (grub_device_t
> efidir_grub_dev,
> -     grub_util_error ("%s", _("no EFI routines are available when running
> in BIOS mode"));
> -
> -   distrib8_len = grub_strlen (efi_distributor);
> --  distributor16 = xmalloc ((distrib8_len + 1) * GRUB_MAX_UTF16_PER_UTF8
> --                         * sizeof (grub_uint16_t));
> -+  distributor16 = xcalloc (distrib8_len + 1,
> -+                         GRUB_MAX_UTF16_PER_UTF8 * sizeof
> (grub_uint16_t));
> -   distrib16_len = grub_utf8_to_utf16 (distributor16, distrib8_len *
> GRUB_MAX_UTF16_PER_UTF8,
> -                                     (const grub_uint8_t *)
> efi_distributor,
> -                                     distrib8_len, 0);
> -diff --git a/grub-core/osdep/windows/relpath.c
> b/grub-core/osdep/windows/relpath.c
> -index cb08617..478e8ef 100644
> ---- a/grub-core/osdep/windows/relpath.c
> -+++ b/grub-core/osdep/windows/relpath.c
> -@@ -72,7 +72,7 @@ grub_make_system_path_relative_to_its_root (const char
> *path)
> -       if (dirwindows[0] && dirwindows[1] == ':')
> -       offset = 2;
> -     }
> --  ret = xmalloc (sizeof (ret[0]) * (flen - offset + 2));
> -+  ret = xcalloc (flen - offset + 2, sizeof (ret[0]));
> -   if (dirwindows[offset] != '\\'
> -       && dirwindows[offset] != '/'
> -       && dirwindows[offset])
> -diff --git a/grub-core/partmap/gpt.c b/grub-core/partmap/gpt.c
> -index 103f679..72a2e37 100644
> ---- a/grub-core/partmap/gpt.c
> -+++ b/grub-core/partmap/gpt.c
> -@@ -199,7 +199,7 @@ gpt_partition_map_embed (struct grub_disk *disk,
> unsigned int *nsectors,
> -   *nsectors = ctx.len;
> -   if (*nsectors > max_nsectors)
> -     *nsectors = max_nsectors;
> --  *sectors = grub_malloc (*nsectors * sizeof (**sectors));
> -+  *sectors = grub_calloc (*nsectors, sizeof (**sectors));
> -   if (!*sectors)
> -     return grub_errno;
> -   for (i = 0; i < *nsectors; i++)
> -diff --git a/grub-core/partmap/msdos.c b/grub-core/partmap/msdos.c
> -index 7b8e450..ee3f249 100644
> ---- a/grub-core/partmap/msdos.c
> -+++ b/grub-core/partmap/msdos.c
> -@@ -337,7 +337,7 @@ pc_partition_map_embed (struct grub_disk *disk,
> unsigned int *nsectors,
> -       avail_nsectors = *nsectors;
> -       if (*nsectors > max_nsectors)
> -       *nsectors = max_nsectors;
> --      *sectors = grub_malloc (*nsectors * sizeof (**sectors));
> -+      *sectors = grub_calloc (*nsectors, sizeof (**sectors));
> -       if (!*sectors)
> -       return grub_errno;
> -       for (i = 0; i < *nsectors; i++)
> -diff --git a/grub-core/script/execute.c b/grub-core/script/execute.c
> -index ee299fd..c8d6806 100644
> ---- a/grub-core/script/execute.c
> -+++ b/grub-core/script/execute.c
> -@@ -553,7 +553,7 @@ gettext_append (struct grub_script_argv *result,
> const char *orig_str)
> -   for (iptr = orig_str; *iptr; iptr++)
> -     if (*iptr == '$')
> -       dollar_cnt++;
> --  ctx.allowed_strings = grub_malloc (sizeof (ctx.allowed_strings[0]) *
> dollar_cnt);
> -+  ctx.allowed_strings = grub_calloc (dollar_cnt, sizeof
> (ctx.allowed_strings[0]));
> -
> -   if (parse_string (orig_str, gettext_save_allow, &ctx, 0))
> -     goto fail;
> -diff --git a/grub-core/tests/fake_input.c b/grub-core/tests/fake_input.c
> -index 2d60852..b5eb516 100644
> ---- a/grub-core/tests/fake_input.c
> -+++ b/grub-core/tests/fake_input.c
> -@@ -49,7 +49,7 @@ grub_terminal_input_fake_sequence (int *seq_in, int
> nseq_in)
> -     saved = grub_term_inputs;
> -   if (seq)
> -     grub_free (seq);
> --  seq = grub_malloc (nseq_in * sizeof (seq[0]));
> -+  seq = grub_calloc (nseq_in, sizeof (seq[0]));
> -   if (!seq)
> -     return;
> -
> -diff --git a/grub-core/tests/video_checksum.c
> b/grub-core/tests/video_checksum.c
> -index 74d5b65..44d0810 100644
> ---- a/grub-core/tests/video_checksum.c
> -+++ b/grub-core/tests/video_checksum.c
> -@@ -336,7 +336,7 @@ grub_video_capture_write_bmp (const char *fname,
> -     {
> -     case 4:
> -       {
> --      grub_uint8_t *buffer = xmalloc (mode_info->width * 3);
> -+      grub_uint8_t *buffer = xcalloc (3, mode_info->width);
> -       grub_uint32_t rmask = ((1 << mode_info->red_mask_size) - 1);
> -       grub_uint32_t gmask = ((1 << mode_info->green_mask_size) - 1);
> -       grub_uint32_t bmask = ((1 << mode_info->blue_mask_size) - 1);
> -@@ -367,7 +367,7 @@ grub_video_capture_write_bmp (const char *fname,
> -       }
> -     case 3:
> -       {
> --      grub_uint8_t *buffer = xmalloc (mode_info->width * 3);
> -+      grub_uint8_t *buffer = xcalloc (3, mode_info->width);
> -       grub_uint32_t rmask = ((1 << mode_info->red_mask_size) - 1);
> -       grub_uint32_t gmask = ((1 << mode_info->green_mask_size) - 1);
> -       grub_uint32_t bmask = ((1 << mode_info->blue_mask_size) - 1);
> -@@ -407,7 +407,7 @@ grub_video_capture_write_bmp (const char *fname,
> -       }
> -     case 2:
> -       {
> --      grub_uint8_t *buffer = xmalloc (mode_info->width * 3);
> -+      grub_uint8_t *buffer = xcalloc (3, mode_info->width);
> -       grub_uint16_t rmask = ((1 << mode_info->red_mask_size) - 1);
> -       grub_uint16_t gmask = ((1 << mode_info->green_mask_size) - 1);
> -       grub_uint16_t bmask = ((1 << mode_info->blue_mask_size) - 1);
> -diff --git a/grub-core/video/capture.c b/grub-core/video/capture.c
> -index 4f83c74..4d3195e 100644
> ---- a/grub-core/video/capture.c
> -+++ b/grub-core/video/capture.c
> -@@ -89,7 +89,7 @@ grub_video_capture_start (const struct
> grub_video_mode_info *mode_info,
> -   framebuffer.mode_info = *mode_info;
> -   framebuffer.mode_info.blit_format = grub_video_get_blit_format
> (&framebuffer.mode_info);
> -
> --  framebuffer.ptr = grub_malloc (framebuffer.mode_info.height *
> framebuffer.mode_info.pitch);
> -+  framebuffer.ptr = grub_calloc (framebuffer.mode_info.height,
> framebuffer.mode_info.pitch);
> -   if (!framebuffer.ptr)
> -     return grub_errno;
> -
> -diff --git a/grub-core/video/emu/sdl.c b/grub-core/video/emu/sdl.c
> -index a2f639f..0ebab6f 100644
> ---- a/grub-core/video/emu/sdl.c
> -+++ b/grub-core/video/emu/sdl.c
> -@@ -172,7 +172,7 @@ grub_video_sdl_set_palette (unsigned int start,
> unsigned int count,
> -       if (start + count > mode_info.number_of_colors)
> -       count = mode_info.number_of_colors - start;
> -
> --      tmp = grub_malloc (count * sizeof (tmp[0]));
> -+      tmp = grub_calloc (count, sizeof (tmp[0]));
> -       for (i = 0; i < count; i++)
> -       {
> -         tmp[i].r = palette_data[i].r;
> -diff --git a/grub-core/video/i386/pc/vga.c b/grub-core/video/i386/pc/vga.c
> -index 01f4711..b2f776c 100644
> ---- a/grub-core/video/i386/pc/vga.c
> -+++ b/grub-core/video/i386/pc/vga.c
> -@@ -127,7 +127,7 @@ grub_video_vga_setup (unsigned int width, unsigned
> int height,
> -
> -   vga_height = height ? : 480;
> -
> --  framebuffer.temporary_buffer = grub_malloc (vga_height * VGA_WIDTH);
> -+  framebuffer.temporary_buffer = grub_calloc (vga_height, VGA_WIDTH);
> -   framebuffer.front_page = 0;
> -   framebuffer.back_page = 0;
> -   if (!framebuffer.temporary_buffer)
> -diff --git a/grub-core/video/readers/png.c b/grub-core/video/readers/png.c
> -index 777e713..61bd645 100644
> ---- a/grub-core/video/readers/png.c
> -+++ b/grub-core/video/readers/png.c
> -@@ -309,7 +309,7 @@ grub_png_decode_image_header (struct grub_png_data
> *data)
> -   if (data->is_16bit || data->is_gray || data->is_palette)
> - #endif
> -     {
> --      data->image_data = grub_malloc (data->image_height *
> data->row_bytes);
> -+      data->image_data = grub_calloc (data->image_height,
> data->row_bytes);
> -       if (grub_errno)
> -         return grub_errno;
> -
> -diff --git a/include/grub/unicode.h b/include/grub/unicode.h
> -index a0403e9..4de986a 100644
> ---- a/include/grub/unicode.h
> -+++ b/include/grub/unicode.h
> -@@ -293,7 +293,7 @@ grub_unicode_glyph_dup (const struct
> grub_unicode_glyph *in)
> -   grub_memcpy (out, in, sizeof (*in));
> -   if (in->ncomb > ARRAY_SIZE (out->combining_inline))
> -     {
> --      out->combining_ptr = grub_malloc (in->ncomb * sizeof
> (out->combining_ptr[0]));
> -+      out->combining_ptr = grub_calloc (in->ncomb, sizeof
> (out->combining_ptr[0]));
> -       if (!out->combining_ptr)
> -       {
> -         grub_free (out);
> -@@ -315,7 +315,7 @@ grub_unicode_set_glyph (struct grub_unicode_glyph
> *out,
> -   grub_memcpy (out, in, sizeof (*in));
> -   if (in->ncomb > ARRAY_SIZE (out->combining_inline))
> -     {
> --      out->combining_ptr = grub_malloc (in->ncomb * sizeof
> (out->combining_ptr[0]));
> -+      out->combining_ptr = grub_calloc (in->ncomb, sizeof
> (out->combining_ptr[0]));
> -       if (!out->combining_ptr)
> -       return;
> -       grub_memcpy (out->combining_ptr, in->combining_ptr,
> -diff --git a/util/getroot.c b/util/getroot.c
> -index 847406f..a5eaa64 100644
> ---- a/util/getroot.c
> -+++ b/util/getroot.c
> -@@ -200,7 +200,7 @@ make_device_name (const char *drive)
> -   char *ret, *ptr;
> -   const char *iptr;
> -
> --  ret = xmalloc (strlen (drive) * 2);
> -+  ret = xcalloc (2, strlen (drive));
> -   ptr = ret;
> -   for (iptr = drive; *iptr; iptr++)
> -     {
> -diff --git a/util/grub-file.c b/util/grub-file.c
> -index 50c18b6..b2e7dd6 100644
> ---- a/util/grub-file.c
> -+++ b/util/grub-file.c
> -@@ -54,7 +54,7 @@ main (int argc, char *argv[])
> -
> -   grub_util_host_init (&argc, &argv);
> -
> --  argv2 = xmalloc (argc * sizeof (argv2[0]));
> -+  argv2 = xcalloc (argc, sizeof (argv2[0]));
> -
> -   if (argc == 2 && strcmp (argv[1], "--version") == 0)
> -     {
> -diff --git a/util/grub-fstest.c b/util/grub-fstest.c
> -index f14e02d..57246af 100644
> ---- a/util/grub-fstest.c
> -+++ b/util/grub-fstest.c
> -@@ -650,7 +650,7 @@ argp_parser (int key, char *arg, struct argp_state
> *state)
> -   if (args_count < num_disks)
> -     {
> -       if (args_count == 0)
> --      images = xmalloc (num_disks * sizeof (images[0]));
> -+      images = xcalloc (num_disks, sizeof (images[0]));
> -       images[args_count] = grub_canonicalize_file_name (arg);
> -       args_count++;
> -       return 0;
> -@@ -734,7 +734,7 @@ main (int argc, char *argv[])
> -
> -   grub_util_host_init (&argc, &argv);
> -
> --  args = xmalloc (argc * sizeof (args[0]));
> -+  args = xcalloc (argc, sizeof (args[0]));
> -
> -   argp_parse (&argp, argc, argv, 0, 0, 0);
> -
> -diff --git a/util/grub-install-common.c b/util/grub-install-common.c
> -index ca0ac61..0295d40 100644
> ---- a/util/grub-install-common.c
> -+++ b/util/grub-install-common.c
> -@@ -286,7 +286,7 @@ handle_install_list (struct install_list *il, const
> char *val,
> -       il->n_entries++;
> -     }
> -   il->n_alloc = il->n_entries + 1;
> --  il->entries = xmalloc (il->n_alloc * sizeof (il->entries[0]));
> -+  il->entries = xcalloc (il->n_alloc, sizeof (il->entries[0]));
> -   ptr = val;
> -   for (ce = il->entries; ; ce++)
> -     {
> -diff --git a/util/grub-install.c b/util/grub-install.c
> -index 8a55ad4..a82725f 100644
> ---- a/util/grub-install.c
> -+++ b/util/grub-install.c
> -@@ -626,7 +626,7 @@ device_map_check_duplicates (const char *dev_map)
> -   if (! fp)
> -     return;
> -
> --  d = xmalloc (alloced * sizeof (d[0]));
> -+  d = xcalloc (alloced, sizeof (d[0]));
> -
> -   while (fgets (buf, sizeof (buf), fp))
> -     {
> -@@ -1260,7 +1260,7 @@ main (int argc, char *argv[])
> -       ndev++;
> -     }
> -
> --  grub_drives = xmalloc (sizeof (grub_drives[0]) * (ndev + 1));
> -+  grub_drives = xcalloc (ndev + 1, sizeof (grub_drives[0]));
> -
> -   for (curdev = grub_devices, curdrive = grub_drives; *curdev; curdev++,
> -        curdrive++)
> -diff --git a/util/grub-mkimagexx.c b/util/grub-mkimagexx.c
> -index bc087c2..d97d0e7 100644
> ---- a/util/grub-mkimagexx.c
> -+++ b/util/grub-mkimagexx.c
> -@@ -2294,10 +2294,8 @@ SUFFIX (grub_mkimage_load_image) (const char
> *kernel_path,
> -                     + grub_host_to_target16 (e->e_shstrndx) *
> smd.section_entsize);
> -   smd.strtab = (char *) e + grub_host_to_target_addr (s->sh_offset);
> -
> --  smd.addrs = xmalloc (sizeof (*smd.addrs) * smd.num_sections);
> --  memset (smd.addrs, 0, sizeof (*smd.addrs) * smd.num_sections);
> --  smd.vaddrs = xmalloc (sizeof (*smd.vaddrs) * smd.num_sections);
> --  memset (smd.vaddrs, 0, sizeof (*smd.vaddrs) * smd.num_sections);
> -+  smd.addrs = xcalloc (smd.num_sections, sizeof (*smd.addrs));
> -+  smd.vaddrs = xcalloc (smd.num_sections, sizeof (*smd.vaddrs));
> -
> -   SUFFIX (locate_sections) (e, kernel_path, &smd, layout, image_target);
> -
> -diff --git a/util/grub-mkrescue.c b/util/grub-mkrescue.c
> -index ce2cbc4..5183102 100644
> ---- a/util/grub-mkrescue.c
> -+++ b/util/grub-mkrescue.c
> -@@ -441,8 +441,8 @@ main (int argc, char *argv[])
> -   xorriso = xstrdup ("xorriso");
> -   label_font = grub_util_path_concat (2, pkgdatadir, "unicode.pf2");
> -
> --  argp_argv = xmalloc (sizeof (argp_argv[0]) * argc);
> --  xorriso_tail_argv = xmalloc (sizeof (argp_argv[0]) * argc);
> -+  argp_argv = xcalloc (argc, sizeof (argp_argv[0]));
> -+  xorriso_tail_argv = xcalloc (argc, sizeof (argp_argv[0]));
> -
> -   xorriso_tail_argc = 0;
> -   /* Program name */
> -diff --git a/util/grub-mkstandalone.c b/util/grub-mkstandalone.c
> -index 4907d44..edf3097 100644
> ---- a/util/grub-mkstandalone.c
> -+++ b/util/grub-mkstandalone.c
> -@@ -296,7 +296,7 @@ main (int argc, char *argv[])
> -   grub_util_host_init (&argc, &argv);
> -   grub_util_disable_fd_syncs ();
> -
> --  files = xmalloc ((argc + 1) * sizeof (files[0]));
> -+  files = xcalloc (argc + 1, sizeof (files[0]));
> -
> -   argp_parse (&argp, argc, argv, 0, 0, 0);
> -
> -diff --git a/util/grub-pe2elf.c b/util/grub-pe2elf.c
> -index 0d4084a..1133129 100644
> ---- a/util/grub-pe2elf.c
> -+++ b/util/grub-pe2elf.c
> -@@ -100,9 +100,9 @@ write_section_data (FILE* fp, const char *name, char
> *image,
> -   char *pe_strtab = (image + pe_chdr->symtab_offset
> -                    + pe_chdr->num_symbols * sizeof (struct
> grub_pe32_symbol));
> -
> --  section_map = xmalloc ((2 * pe_chdr->num_sections + 5) * sizeof (int));
> -+  section_map = xcalloc (2 * pe_chdr->num_sections + 5, sizeof (int));
> -   section_map[0] = 0;
> --  shdr = xmalloc ((2 * pe_chdr->num_sections + 5) * sizeof (shdr[0]));
> -+  shdr = xcalloc (2 * pe_chdr->num_sections + 5, sizeof (shdr[0]));
> -   idx = 1;
> -   idx_reloc = pe_chdr->num_sections + 1;
> -
> -@@ -233,7 +233,7 @@ write_reloc_section (FILE* fp, const char *name, char
> *image,
> -
> -       pe_sec = pe_shdr + shdr[i].sh_link;
> -       pe_rel = (struct grub_pe32_reloc *) (image +
> pe_sec->relocations_offset);
> --      rel = (elf_reloc_t *) xmalloc (pe_sec->num_relocations * sizeof
> (elf_reloc_t));
> -+      rel = (elf_reloc_t *) xcalloc (pe_sec->num_relocations, sizeof
> (elf_reloc_t));
> -       num_rels = 0;
> -       modified = 0;
> -
> -@@ -365,12 +365,10 @@ write_symbol_table (FILE* fp, const char *name,
> char *image,
> -   pe_symtab = (struct grub_pe32_symbol *) (image +
> pe_chdr->symtab_offset);
> -   pe_strtab = (char *) (pe_symtab + pe_chdr->num_symbols);
> -
> --  symtab = (Elf_Sym *) xmalloc ((pe_chdr->num_symbols + 1) *
> --                              sizeof (Elf_Sym));
> --  memset (symtab, 0, (pe_chdr->num_symbols + 1) * sizeof (Elf_Sym));
> -+  symtab = (Elf_Sym *) xcalloc (pe_chdr->num_symbols + 1, sizeof
> (Elf_Sym));
> -   num_syms = 1;
> -
> --  symtab_map = (int *) xmalloc (pe_chdr->num_symbols * sizeof (int));
> -+  symtab_map = (int *) xcalloc (pe_chdr->num_symbols, sizeof (int));
> -
> -   for (i = 0; i < (int) pe_chdr->num_symbols;
> -        i += pe_symtab->num_aux + 1, pe_symtab += pe_symtab->num_aux + 1)
> -diff --git a/util/grub-probe.c b/util/grub-probe.c
> -index 81d27ee..cbe6ed9 100644
> ---- a/util/grub-probe.c
> -+++ b/util/grub-probe.c
> -@@ -361,8 +361,8 @@ probe (const char *path, char **device_names, char
> delim)
> -       grub_util_pull_device (*curdev);
> -       ndev++;
> -     }
> --
> --  drives_names = xmalloc (sizeof (drives_names[0]) * (ndev + 1));
> -+
> -+  drives_names = xcalloc (ndev + 1, sizeof (drives_names[0]));
> -
> -   for (curdev = device_names, curdrive = drives_names; *curdev; curdev++,
> -        curdrive++)
> ---
> -2.14.4
> -
> diff --git
> a/meta/recipes-bsp/grub/files/CVE-2020-14309-CVE-2020-14310-CVE-2020-14311-malloc-Use-overflow-checking-primitives-where-we-do-.patch
> b/meta/recipes-bsp/grub/files/CVE-2020-14309-CVE-2020-14310-CVE-2020-14311-malloc-Use-overflow-checking-primitives-where-we-do-.patch
> deleted file mode 100644
> index 7214ead9a7..0000000000
> ---
> a/meta/recipes-bsp/grub/files/CVE-2020-14309-CVE-2020-14310-CVE-2020-14311-malloc-Use-overflow-checking-primitives-where-we-do-.patch
> +++ /dev/null
> @@ -1,1330 +0,0 @@
> -From eb77d1ef65e25746acff43545f62a71360b15eec Mon Sep 17 00:00:00 2001
> -From: Peter Jones <pjones@redhat.com>
> -Date: Mon, 15 Jun 2020 12:28:27 -0400
> -Subject: [PATCH 6/9] malloc: Use overflow checking primitives where we do
> - complex allocations
> -
> -This attempts to fix the places where we do the following where
> -arithmetic_expr may include unvalidated data:
> -
> -  X = grub_malloc(arithmetic_expr);
> -
> -It accomplishes this by doing the arithmetic ahead of time using
> grub_add(),
> -grub_sub(), grub_mul() and testing for overflow before proceeding.
> -
> -Among other issues, this fixes:
> -  - allocation of integer overflow in grub_video_bitmap_create()
> -    reported by Chris Coulson,
> -  - allocation of integer overflow in grub_png_decode_image_header()
> -    reported by Chris Coulson,
> -  - allocation of integer overflow in grub_squash_read_symlink()
> -    reported by Chris Coulson,
> -  - allocation of integer overflow in grub_ext2_read_symlink()
> -    reported by Chris Coulson,
> -  - allocation of integer overflow in read_section_as_string()
> -    reported by Chris Coulson.
> -
> -Fixes: CVE-2020-14309, CVE-2020-14310, CVE-2020-14311
> -
> -Signed-off-by: Peter Jones <pjones@redhat.com>
> -Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> -
> -Upstream-Status: Backport
> -CVE: CVE-2020-14309 CVE-2020-14310 CVE-2020-14311
> -
> -Reference to upstream patch:
> -
> https://git.savannah.gnu.org/cgit/grub.git/commit/?id=3f05d693d1274965ffbe4ba99080dc2c570944c6
> -
> -Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
> ----
> - grub-core/commands/legacycfg.c | 29 +++++++++++++++++++-----
> - grub-core/commands/wildcard.c  | 36 ++++++++++++++++++++++++-----
> - grub-core/disk/ldm.c           | 32 ++++++++++++++++++--------
> - grub-core/font/font.c          |  7 +++++-
> - grub-core/fs/btrfs.c           | 28 +++++++++++++++--------
> - grub-core/fs/ext2.c            | 10 ++++++++-
> - grub-core/fs/iso9660.c         | 51
> +++++++++++++++++++++++++++++-------------
> - grub-core/fs/sfs.c             | 27 +++++++++++++++++-----
> - grub-core/fs/squash4.c         | 45 ++++++++++++++++++++++++++++---------
> - grub-core/fs/udf.c             | 41 +++++++++++++++++++++------------
> - grub-core/fs/xfs.c             | 11 +++++----
> - grub-core/fs/zfs/zfs.c         | 22 ++++++++++++------
> - grub-core/fs/zfs/zfscrypt.c    |  7 +++++-
> - grub-core/lib/arg.c            | 20 +++++++++++++++--
> - grub-core/loader/i386/bsd.c    |  8 ++++++-
> - grub-core/net/dns.c            |  9 +++++++-
> - grub-core/normal/charset.c     | 10 +++++++--
> - grub-core/normal/cmdline.c     | 14 ++++++++++--
> - grub-core/normal/menu_entry.c  | 13 +++++++++--
> - grub-core/script/argv.c        | 16 +++++++++++--
> - grub-core/script/lexer.c       | 21 ++++++++++++++---
> - grub-core/video/bitmap.c       | 25 +++++++++++++--------
> - grub-core/video/readers/png.c  | 13 +++++++++--
> - 23 files changed, 382 insertions(+), 113 deletions(-)
> -
> -diff --git a/grub-core/commands/legacycfg.c
> b/grub-core/commands/legacycfg.c
> -index 5e3ec0d..cc5971f 100644
> ---- a/grub-core/commands/legacycfg.c
> -+++ b/grub-core/commands/legacycfg.c
> -@@ -32,6 +32,7 @@
> - #include <grub/auth.h>
> - #include <grub/disk.h>
> - #include <grub/partition.h>
> -+#include <grub/safemath.h>
> -
> - GRUB_MOD_LICENSE ("GPLv3+");
> -
> -@@ -104,13 +105,22 @@ legacy_file (const char *filename)
> -       if (newsuffix)
> -         {
> -           char *t;
> --
> -+          grub_size_t sz;
> -+
> -+          if (grub_add (grub_strlen (suffix), grub_strlen (newsuffix),
> &sz) ||
> -+              grub_add (sz, 1, &sz))
> -+            {
> -+              grub_errno = GRUB_ERR_OUT_OF_RANGE;
> -+              goto fail_0;
> -+            }
> -+
> -           t = suffix;
> --          suffix = grub_realloc (suffix, grub_strlen (suffix)
> --                                 + grub_strlen (newsuffix) + 1);
> -+          suffix = grub_realloc (suffix, sz);
> -           if (!suffix)
> -             {
> -               grub_free (t);
> -+
> -+ fail_0:
> -               grub_free (entrysrc);
> -               grub_free (parsed);
> -               grub_free (newsuffix);
> -@@ -154,13 +164,22 @@ legacy_file (const char *filename)
> -         else
> -           {
> -             char *t;
> -+            grub_size_t sz;
> -+
> -+            if (grub_add (grub_strlen (entrysrc), grub_strlen (parsed),
> &sz) ||
> -+                grub_add (sz, 1, &sz))
> -+              {
> -+                grub_errno = GRUB_ERR_OUT_OF_RANGE;
> -+                goto fail_1;
> -+              }
> -
> -             t = entrysrc;
> --            entrysrc = grub_realloc (entrysrc, grub_strlen (entrysrc)
> --                                     + grub_strlen (parsed) + 1);
> -+            entrysrc = grub_realloc (entrysrc, sz);
> -             if (!entrysrc)
> -               {
> -                 grub_free (t);
> -+
> -+ fail_1:
> -                 grub_free (parsed);
> -                 grub_free (suffix);
> -                 return grub_errno;
> -diff --git a/grub-core/commands/wildcard.c b/grub-core/commands/wildcard.c
> -index 4a106ca..cc32903 100644
> ---- a/grub-core/commands/wildcard.c
> -+++ b/grub-core/commands/wildcard.c
> -@@ -23,6 +23,7 @@
> - #include <grub/file.h>
> - #include <grub/device.h>
> - #include <grub/script_sh.h>
> -+#include <grub/safemath.h>
> -
> - #include <regex.h>
> -
> -@@ -48,6 +49,7 @@ merge (char **dest, char **ps)
> -   int i;
> -   int j;
> -   char **p;
> -+  grub_size_t sz;
> -
> -   if (! dest)
> -     return ps;
> -@@ -60,7 +62,12 @@ merge (char **dest, char **ps)
> -   for (j = 0; ps[j]; j++)
> -     ;
> -
> --  p = grub_realloc (dest, sizeof (char*) * (i + j + 1));
> -+  if (grub_add (i, j, &sz) ||
> -+      grub_add (sz, 1, &sz) ||
> -+      grub_mul (sz, sizeof (char *), &sz))
> -+    return dest;
> -+
> -+  p = grub_realloc (dest, sz);
> -   if (! p)
> -     {
> -       grub_free (dest);
> -@@ -115,8 +122,15 @@ make_regex (const char *start, const char *end,
> regex_t *regexp)
> -   char ch;
> -   int i = 0;
> -   unsigned len = end - start;
> --  char *buffer = grub_malloc (len * 2 + 2 + 1); /* worst case size. */
> -+  char *buffer;
> -+  grub_size_t sz;
> -
> -+  /* Worst case size is (len * 2 + 2 + 1). */
> -+  if (grub_mul (len, 2, &sz) ||
> -+      grub_add (sz, 3, &sz))
> -+    return 1;
> -+
> -+  buffer = grub_malloc (sz);
> -   if (! buffer)
> -     return 1;
> -
> -@@ -226,6 +240,7 @@ match_devices_iter (const char *name, void *data)
> -   struct match_devices_ctx *ctx = data;
> -   char **t;
> -   char *buffer;
> -+  grub_size_t sz;
> -
> -   /* skip partitions if asked to. */
> -   if (ctx->noparts && grub_strchr (name, ','))
> -@@ -239,11 +254,16 @@ match_devices_iter (const char *name, void *data)
> -   if (regexec (ctx->regexp, buffer, 0, 0, 0))
> -     {
> -       grub_dprintf ("expand", "not matched\n");
> -+ fail:
> -       grub_free (buffer);
> -       return 0;
> -     }
> -
> --  t = grub_realloc (ctx->devs, sizeof (char*) * (ctx->ndev + 2));
> -+  if (grub_add (ctx->ndev, 2, &sz) ||
> -+      grub_mul (sz, sizeof (char *), &sz))
> -+    goto fail;
> -+
> -+  t = grub_realloc (ctx->devs, sz);
> -   if (! t)
> -     {
> -       grub_free (buffer);
> -@@ -300,6 +320,7 @@ match_files_iter (const char *name,
> -   struct match_files_ctx *ctx = data;
> -   char **t;
> -   char *buffer;
> -+  grub_size_t sz;
> -
> -   /* skip . and .. names */
> -   if (grub_strcmp(".", name) == 0 || grub_strcmp("..", name) == 0)
> -@@ -315,9 +336,14 @@ match_files_iter (const char *name,
> -   if (! buffer)
> -     return 1;
> -
> --  t = grub_realloc (ctx->files, sizeof (char*) * (ctx->nfile + 2));
> --  if (! t)
> -+  if (grub_add (ctx->nfile, 2, &sz) ||
> -+      grub_mul (sz, sizeof (char *), &sz))
> -+    goto fail;
> -+
> -+  t = grub_realloc (ctx->files, sz);
> -+  if (!t)
> -     {
> -+ fail:
> -       grub_free (buffer);
> -       return 1;
> -     }
> -diff --git a/grub-core/disk/ldm.c b/grub-core/disk/ldm.c
> -index e632370..58f8a53 100644
> ---- a/grub-core/disk/ldm.c
> -+++ b/grub-core/disk/ldm.c
> -@@ -25,6 +25,7 @@
> - #include <grub/msdos_partition.h>
> - #include <grub/gpt_partition.h>
> - #include <grub/i18n.h>
> -+#include <grub/safemath.h>
> -
> - #ifdef GRUB_UTIL
> - #include <grub/emu/misc.h>
> -@@ -289,6 +290,7 @@ make_vg (grub_disk_t disk,
> -       struct grub_ldm_vblk vblk[GRUB_DISK_SECTOR_SIZE
> -                               / sizeof (struct grub_ldm_vblk)];
> -       unsigned i;
> -+      grub_size_t sz;
> -       err = grub_disk_read (disk, cursec, 0,
> -                           sizeof(vblk), &vblk);
> -       if (err)
> -@@ -350,7 +352,13 @@ make_vg (grub_disk_t disk,
> -             grub_free (lv);
> -             goto fail2;
> -           }
> --        lv->name = grub_malloc (*ptr + 1);
> -+        if (grub_add (*ptr, 1, &sz))
> -+          {
> -+            grub_free (lv->internal_id);
> -+            grub_free (lv);
> -+            goto fail2;
> -+          }
> -+        lv->name = grub_malloc (sz);
> -         if (!lv->name)
> -           {
> -             grub_free (lv->internal_id);
> -@@ -599,10 +607,13 @@ make_vg (grub_disk_t disk,
> -         if (lv->segments->node_alloc == lv->segments->node_count)
> -           {
> -             void *t;
> --            lv->segments->node_alloc *= 2;
> --            t = grub_realloc (lv->segments->nodes,
> --                              sizeof (*lv->segments->nodes)
> --                              * lv->segments->node_alloc);
> -+            grub_size_t sz;
> -+
> -+            if (grub_mul (lv->segments->node_alloc, 2,
> &lv->segments->node_alloc) ||
> -+                grub_mul (lv->segments->node_alloc, sizeof
> (*lv->segments->nodes), &sz))
> -+              goto fail2;
> -+
> -+            t = grub_realloc (lv->segments->nodes, sz);
> -             if (!t)
> -               goto fail2;
> -             lv->segments->nodes = t;
> -@@ -723,10 +734,13 @@ make_vg (grub_disk_t disk,
> -             if (comp->segment_alloc == comp->segment_count)
> -               {
> -                 void *t;
> --                comp->segment_alloc *= 2;
> --                t = grub_realloc (comp->segments,
> --                                  comp->segment_alloc
> --                                  * sizeof (*comp->segments));
> -+                grub_size_t sz;
> -+
> -+                if (grub_mul (comp->segment_alloc, 2,
> &comp->segment_alloc) ||
> -+                    grub_mul (comp->segment_alloc, sizeof
> (*comp->segments), &sz))
> -+                  goto fail2;
> -+
> -+                t = grub_realloc (comp->segments, sz);
> -                 if (!t)
> -                   goto fail2;
> -                 comp->segments = t;
> -diff --git a/grub-core/font/font.c b/grub-core/font/font.c
> -index 8e118b3..5edb477 100644
> ---- a/grub-core/font/font.c
> -+++ b/grub-core/font/font.c
> -@@ -30,6 +30,7 @@
> - #include <grub/unicode.h>
> - #include <grub/fontformat.h>
> - #include <grub/env.h>
> -+#include <grub/safemath.h>
> -
> - GRUB_MOD_LICENSE ("GPLv3+");
> -
> -@@ -360,9 +361,13 @@ static char *
> - read_section_as_string (struct font_file_section *section)
> - {
> -   char *str;
> -+  grub_size_t sz;
> -   grub_ssize_t ret;
> -
> --  str = grub_malloc (section->length + 1);
> -+  if (grub_add (section->length, 1, &sz))
> -+    return NULL;
> -+
> -+  str = grub_malloc (sz);
> -   if (!str)
> -     return 0;
> -
> -diff --git a/grub-core/fs/btrfs.c b/grub-core/fs/btrfs.c
> -index 11272ef..2b65bd5 100644
> ---- a/grub-core/fs/btrfs.c
> -+++ b/grub-core/fs/btrfs.c
> -@@ -40,6 +40,7 @@
> - #include <grub/btrfs.h>
> - #include <grub/crypto.h>
> - #include <grub/diskfilter.h>
> -+#include <grub/safemath.h>
> -
> - GRUB_MOD_LICENSE ("GPLv3+");
> -
> -@@ -329,9 +330,13 @@ save_ref (struct grub_btrfs_leaf_descriptor *desc,
> -   if (desc->allocated < desc->depth)
> -     {
> -       void *newdata;
> --      desc->allocated *= 2;
> --      newdata = grub_realloc (desc->data, sizeof (desc->data[0])
> --                            * desc->allocated);
> -+      grub_size_t sz;
> -+
> -+      if (grub_mul (desc->allocated, 2, &desc->allocated) ||
> -+        grub_mul (desc->allocated, sizeof (desc->data[0]), &sz))
> -+      return GRUB_ERR_OUT_OF_RANGE;
> -+
> -+      newdata = grub_realloc (desc->data, sz);
> -       if (!newdata)
> -       return grub_errno;
> -       desc->data = newdata;
> -@@ -622,16 +627,21 @@ find_device (struct grub_btrfs_data *data,
> grub_uint64_t id)
> -   if (data->n_devices_attached > data->n_devices_allocated)
> -     {
> -       void *tmp;
> --      data->n_devices_allocated = 2 * data->n_devices_attached + 1;
> --      data->devices_attached
> --      = grub_realloc (tmp = data->devices_attached,
> --                      data->n_devices_allocated
> --                      * sizeof (data->devices_attached[0]));
> -+      grub_size_t sz;
> -+
> -+      if (grub_mul (data->n_devices_attached, 2,
> &data->n_devices_allocated) ||
> -+        grub_add (data->n_devices_allocated, 1,
> &data->n_devices_allocated) ||
> -+        grub_mul (data->n_devices_allocated, sizeof
> (data->devices_attached[0]), &sz))
> -+      goto fail;
> -+
> -+      data->devices_attached = grub_realloc (tmp =
> data->devices_attached, sz);
> -       if (!data->devices_attached)
> -       {
> -+        data->devices_attached = tmp;
> -+
> -+ fail:
> -         if (ctx.dev_found)
> -           grub_device_close (ctx.dev_found);
> --        data->devices_attached = tmp;
> -         return NULL;
> -       }
> -     }
> -diff --git a/grub-core/fs/ext2.c b/grub-core/fs/ext2.c
> -index 9b38980..ac33bcd 100644
> ---- a/grub-core/fs/ext2.c
> -+++ b/grub-core/fs/ext2.c
> -@@ -46,6 +46,7 @@
> - #include <grub/dl.h>
> - #include <grub/types.h>
> - #include <grub/fshelp.h>
> -+#include <grub/safemath.h>
> -
> - GRUB_MOD_LICENSE ("GPLv3+");
> -
> -@@ -703,6 +704,7 @@ grub_ext2_read_symlink (grub_fshelp_node_t node)
> - {
> -   char *symlink;
> -   struct grub_fshelp_node *diro = node;
> -+  grub_size_t sz;
> -
> -   if (! diro->inode_read)
> -     {
> -@@ -717,7 +719,13 @@ grub_ext2_read_symlink (grub_fshelp_node_t node)
> -        }
> -     }
> -
> --  symlink = grub_malloc (grub_le_to_cpu32 (diro->inode.size) + 1);
> -+  if (grub_add (grub_le_to_cpu32 (diro->inode.size), 1, &sz))
> -+    {
> -+      grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow is detected"));
> -+      return NULL;
> -+    }
> -+
> -+  symlink = grub_malloc (sz);
> -   if (! symlink)
> -     return 0;
> -
> -diff --git a/grub-core/fs/iso9660.c b/grub-core/fs/iso9660.c
> -index 4f1b52a..7ba5b30 100644
> ---- a/grub-core/fs/iso9660.c
> -+++ b/grub-core/fs/iso9660.c
> -@@ -28,6 +28,7 @@
> - #include <grub/fshelp.h>
> - #include <grub/charset.h>
> - #include <grub/datetime.h>
> -+#include <grub/safemath.h>
> -
> - GRUB_MOD_LICENSE ("GPLv3+");
> -
> -@@ -531,8 +532,13 @@ add_part (struct iterate_dir_ctx *ctx,
> -         int len2)
> - {
> -   int size = ctx->symlink ? grub_strlen (ctx->symlink) : 0;
> -+  grub_size_t sz;
> -
> --  ctx->symlink = grub_realloc (ctx->symlink, size + len2 + 1);
> -+  if (grub_add (size, len2, &sz) ||
> -+      grub_add (sz, 1, &sz))
> -+    return;
> -+
> -+  ctx->symlink = grub_realloc (ctx->symlink, sz);
> -   if (! ctx->symlink)
> -     return;
> -
> -@@ -560,17 +566,24 @@ susp_iterate_dir (struct grub_iso9660_susp_entry
> *entry,
> -       {
> -         grub_size_t off = 0, csize = 1;
> -         char *old;
> -+        grub_size_t sz;
> -+
> -         csize = entry->len - 5;
> -         old = ctx->filename;
> -         if (ctx->filename_alloc)
> -           {
> -             off = grub_strlen (ctx->filename);
> --            ctx->filename = grub_realloc (ctx->filename, csize + off +
> 1);
> -+            if (grub_add (csize, off, &sz) ||
> -+                grub_add (sz, 1, &sz))
> -+              return GRUB_ERR_OUT_OF_RANGE;
> -+            ctx->filename = grub_realloc (ctx->filename, sz);
> -           }
> -         else
> -           {
> -             off = 0;
> --            ctx->filename = grub_zalloc (csize + 1);
> -+            if (grub_add (csize, 1, &sz))
> -+              return GRUB_ERR_OUT_OF_RANGE;
> -+            ctx->filename = grub_zalloc (sz);
> -           }
> -         if (!ctx->filename)
> -           {
> -@@ -776,14 +789,18 @@ grub_iso9660_iterate_dir (grub_fshelp_node_t dir,
> -           if (node->have_dirents >= node->alloc_dirents)
> -             {
> -               struct grub_fshelp_node *new_node;
> --              node->alloc_dirents *= 2;
> --              new_node = grub_realloc (node,
> --                                       sizeof (struct grub_fshelp_node)
> --                                       + ((node->alloc_dirents
> --                                           - ARRAY_SIZE (node->dirents))
> --                                          * sizeof (node->dirents[0])));
> -+              grub_size_t sz;
> -+
> -+              if (grub_mul (node->alloc_dirents, 2,
> &node->alloc_dirents) ||
> -+                  grub_sub (node->alloc_dirents, ARRAY_SIZE
> (node->dirents), &sz) ||
> -+                  grub_mul (sz, sizeof (node->dirents[0]), &sz) ||
> -+                  grub_add (sz, sizeof (struct grub_fshelp_node), &sz))
> -+                goto fail_0;
> -+
> -+              new_node = grub_realloc (node, sz);
> -               if (!new_node)
> -                 {
> -+ fail_0:
> -                   if (ctx.filename_alloc)
> -                     grub_free (ctx.filename);
> -                   grub_free (node);
> -@@ -799,14 +816,18 @@ grub_iso9660_iterate_dir (grub_fshelp_node_t dir,
> -               * sizeof (node->dirents[0]) < grub_strlen (ctx.symlink) +
> 1)
> -             {
> -               struct grub_fshelp_node *new_node;
> --              new_node = grub_realloc (node,
> --                                       sizeof (struct grub_fshelp_node)
> --                                       + ((node->alloc_dirents
> --                                           - ARRAY_SIZE (node->dirents))
> --                                          * sizeof (node->dirents[0]))
> --                                       + grub_strlen (ctx.symlink) + 1);
> -+              grub_size_t sz;
> -+
> -+              if (grub_sub (node->alloc_dirents, ARRAY_SIZE
> (node->dirents), &sz) ||
> -+                  grub_mul (sz, sizeof (node->dirents[0]), &sz) ||
> -+                  grub_add (sz, sizeof (struct grub_fshelp_node) + 1,
> &sz) ||
> -+                  grub_add (sz, grub_strlen (ctx.symlink), &sz))
> -+                goto fail_1;
> -+
> -+              new_node = grub_realloc (node, sz);
> -               if (!new_node)
> -                 {
> -+ fail_1:
> -                   if (ctx.filename_alloc)
> -                     grub_free (ctx.filename);
> -                   grub_free (node);
> -diff --git a/grub-core/fs/sfs.c b/grub-core/fs/sfs.c
> -index 90f7fb3..de2b107 100644
> ---- a/grub-core/fs/sfs.c
> -+++ b/grub-core/fs/sfs.c
> -@@ -26,6 +26,7 @@
> - #include <grub/types.h>
> - #include <grub/fshelp.h>
> - #include <grub/charset.h>
> -+#include <grub/safemath.h>
> -
> - GRUB_MOD_LICENSE ("GPLv3+");
> -
> -@@ -307,10 +308,15 @@ grub_sfs_read_block (grub_fshelp_node_t node,
> grub_disk_addr_t fileblock)
> -       if (node->cache && node->cache_size >= node->cache_allocated)
> -       {
> -         struct cache_entry *e = node->cache;
> --        e = grub_realloc (node->cache,node->cache_allocated * 2
> --                          * sizeof (e[0]));
> -+        grub_size_t sz;
> -+
> -+        if (grub_mul (node->cache_allocated, 2 * sizeof (e[0]), &sz))
> -+          goto fail;
> -+
> -+        e = grub_realloc (node->cache, sz);
> -         if (!e)
> -           {
> -+ fail:
> -             grub_errno = 0;
> -             grub_free (node->cache);
> -             node->cache = 0;
> -@@ -477,10 +483,16 @@ grub_sfs_create_node (struct grub_fshelp_node
> **node,
> -   grub_size_t len = grub_strlen (name);
> -   grub_uint8_t *name_u8;
> -   int ret;
> -+  grub_size_t sz;
> -+
> -+  if (grub_mul (len, GRUB_MAX_UTF8_PER_LATIN1, &sz) ||
> -+      grub_add (sz, 1, &sz))
> -+    return 1;
> -+
> -   *node = grub_malloc (sizeof (**node));
> -   if (!*node)
> -     return 1;
> --  name_u8 = grub_malloc (len * GRUB_MAX_UTF8_PER_LATIN1 + 1);
> -+  name_u8 = grub_malloc (sz);
> -   if (!name_u8)
> -     {
> -       grub_free (*node);
> -@@ -724,8 +736,13 @@ grub_sfs_label (grub_device_t device, char **label)
> -   data = grub_sfs_mount (disk);
> -   if (data)
> -     {
> --      grub_size_t len = grub_strlen (data->label);
> --      *label = grub_malloc (len * GRUB_MAX_UTF8_PER_LATIN1 + 1);
> -+      grub_size_t sz, len = grub_strlen (data->label);
> -+
> -+      if (grub_mul (len, GRUB_MAX_UTF8_PER_LATIN1, &sz) ||
> -+        grub_add (sz, 1, &sz))
> -+      return GRUB_ERR_OUT_OF_RANGE;
> -+
> -+      *label = grub_malloc (sz);
> -       if (*label)
> -       *grub_latin1_to_utf8 ((grub_uint8_t *) *label,
> -                             (const grub_uint8_t *) data->label,
> -diff --git a/grub-core/fs/squash4.c b/grub-core/fs/squash4.c
> -index 95d5c1e..7851238 100644
> ---- a/grub-core/fs/squash4.c
> -+++ b/grub-core/fs/squash4.c
> -@@ -26,6 +26,7 @@
> - #include <grub/types.h>
> - #include <grub/fshelp.h>
> - #include <grub/deflate.h>
> -+#include <grub/safemath.h>
> - #include <minilzo.h>
> -
> - #include "xz.h"
> -@@ -459,7 +460,17 @@ grub_squash_read_symlink (grub_fshelp_node_t node)
> - {
> -   char *ret;
> -   grub_err_t err;
> --  ret = grub_malloc (grub_le_to_cpu32 (node->ino.symlink.namelen) + 1);
> -+  grub_size_t sz;
> -+
> -+  if (grub_add (grub_le_to_cpu32 (node->ino.symlink.namelen), 1, &sz))
> -+    {
> -+      grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow is detected"));
> -+      return NULL;
> -+    }
> -+
> -+  ret = grub_malloc (sz);
> -+  if (!ret)
> -+    return NULL;
> -
> -   err = read_chunk (node->data, ret,
> -                   grub_le_to_cpu32 (node->ino.symlink.namelen),
> -@@ -506,11 +517,16 @@ grub_squash_iterate_dir (grub_fshelp_node_t dir,
> -
> -   {
> -     grub_fshelp_node_t node;
> --    node = grub_malloc (sizeof (*node) + dir->stsize * sizeof
> (dir->stack[0]));
> -+    grub_size_t sz;
> -+
> -+    if (grub_mul (dir->stsize, sizeof (dir->stack[0]), &sz) ||
> -+      grub_add (sz, sizeof (*node), &sz))
> -+      return 0;
> -+
> -+    node = grub_malloc (sz);
> -     if (!node)
> -       return 0;
> --    grub_memcpy (node, dir,
> --               sizeof (*node) + dir->stsize * sizeof (dir->stack[0]));
> -+    grub_memcpy (node, dir, sz);
> -     if (hook (".", GRUB_FSHELP_DIR, node, hook_data))
> -       return 1;
> -
> -@@ -518,12 +534,15 @@ grub_squash_iterate_dir (grub_fshelp_node_t dir,
> -       {
> -       grub_err_t err;
> -
> --      node = grub_malloc (sizeof (*node) + dir->stsize * sizeof
> (dir->stack[0]));
> -+      if (grub_mul (dir->stsize, sizeof (dir->stack[0]), &sz) ||
> -+          grub_add (sz, sizeof (*node), &sz))
> -+        return 0;
> -+
> -+      node = grub_malloc (sz);
> -       if (!node)
> -         return 0;
> -
> --      grub_memcpy (node, dir,
> --                   sizeof (*node) + dir->stsize * sizeof
> (dir->stack[0]));
> -+      grub_memcpy (node, dir, sz);
> -
> -       node->stsize--;
> -       err = read_chunk (dir->data, &node->ino, sizeof (node->ino),
> -@@ -557,6 +576,7 @@ grub_squash_iterate_dir (grub_fshelp_node_t dir,
> -         enum grub_fshelp_filetype filetype = GRUB_FSHELP_REG;
> -         struct grub_squash_dirent di;
> -         struct grub_squash_inode ino;
> -+        grub_size_t sz;
> -
> -         err = read_chunk (dir->data, &di, sizeof (di),
> -                           grub_le_to_cpu64 (dir->data->sb.diroffset)
> -@@ -589,13 +609,16 @@ grub_squash_iterate_dir (grub_fshelp_node_t dir,
> -         if (grub_le_to_cpu16 (di.type) == SQUASH_TYPE_SYMLINK)
> -           filetype = GRUB_FSHELP_SYMLINK;
> -
> --        node = grub_malloc (sizeof (*node)
> --                            + (dir->stsize + 1) * sizeof
> (dir->stack[0]));
> -+        if (grub_add (dir->stsize, 1, &sz) ||
> -+            grub_mul (sz, sizeof (dir->stack[0]), &sz) ||
> -+            grub_add (sz, sizeof (*node), &sz))
> -+          return 0;
> -+
> -+        node = grub_malloc (sz);
> -         if (! node)
> -           return 0;
> -
> --        grub_memcpy (node, dir,
> --                     sizeof (*node) + dir->stsize * sizeof
> (dir->stack[0]));
> -+        grub_memcpy (node, dir, sz - sizeof(dir->stack[0]));
> -
> -         node->ino = ino;
> -         node->stack[node->stsize].ino_chunk = grub_le_to_cpu32
> (dh.ino_chunk);
> -diff --git a/grub-core/fs/udf.c b/grub-core/fs/udf.c
> -index a837616..21ac7f4 100644
> ---- a/grub-core/fs/udf.c
> -+++ b/grub-core/fs/udf.c
> -@@ -28,6 +28,7 @@
> - #include <grub/charset.h>
> - #include <grub/datetime.h>
> - #include <grub/udf.h>
> -+#include <grub/safemath.h>
> -
> - GRUB_MOD_LICENSE ("GPLv3+");
> -
> -@@ -890,9 +891,19 @@ read_string (const grub_uint8_t *raw, grub_size_t
> sz, char *outbuf)
> -       utf16[i] = (raw[2 * i + 1] << 8) | raw[2*i + 2];
> -     }
> -   if (!outbuf)
> --    outbuf = grub_malloc (utf16len * GRUB_MAX_UTF8_PER_UTF16 + 1);
> -+    {
> -+      grub_size_t size;
> -+
> -+      if (grub_mul (utf16len, GRUB_MAX_UTF8_PER_UTF16, &size) ||
> -+        grub_add (size, 1, &size))
> -+      goto fail;
> -+
> -+      outbuf = grub_malloc (size);
> -+    }
> -   if (outbuf)
> -     *grub_utf16_to_utf8 ((grub_uint8_t *) outbuf, utf16, utf16len) =
> '\0';
> -+
> -+ fail:
> -   grub_free (utf16);
> -   return outbuf;
> - }
> -@@ -1005,7 +1016,7 @@ grub_udf_read_symlink (grub_fshelp_node_t node)
> -   grub_size_t sz = U64 (node->block.fe.file_size);
> -   grub_uint8_t *raw;
> -   const grub_uint8_t *ptr;
> --  char *out, *optr;
> -+  char *out = NULL, *optr;
> -
> -   if (sz < 4)
> -     return NULL;
> -@@ -1013,14 +1024,16 @@ grub_udf_read_symlink (grub_fshelp_node_t node)
> -   if (!raw)
> -     return NULL;
> -   if (grub_udf_read_file (node, NULL, NULL, 0, sz, (char *) raw) < 0)
> --    {
> --      grub_free (raw);
> --      return NULL;
> --    }
> -+    goto fail_1;
> -
> --  out = grub_malloc (sz * 2 + 1);
> -+  if (grub_mul (sz, 2, &sz) ||
> -+      grub_add (sz, 1, &sz))
> -+    goto fail_0;
> -+
> -+  out = grub_malloc (sz);
> -   if (!out)
> -     {
> -+ fail_0:
> -       grub_free (raw);
> -       return NULL;
> -     }
> -@@ -1031,17 +1044,17 @@ grub_udf_read_symlink (grub_fshelp_node_t node)
> -     {
> -       grub_size_t s;
> -       if ((grub_size_t) (ptr - raw + 4) > sz)
> --      goto fail;
> -+      goto fail_1;
> -       if (!(ptr[2] == 0 && ptr[3] == 0))
> --      goto fail;
> -+      goto fail_1;
> -       s = 4 + ptr[1];
> -       if ((grub_size_t) (ptr - raw + s) > sz)
> --      goto fail;
> -+      goto fail_1;
> -       switch (*ptr)
> -       {
> -       case 1:
> -         if (ptr[1])
> --          goto fail;
> -+          goto fail_1;
> -         /* Fallthrough.  */
> -       case 2:
> -         /* in 4 bytes. out: 1 byte.  */
> -@@ -1066,11 +1079,11 @@ grub_udf_read_symlink (grub_fshelp_node_t node)
> -         if (optr != out)
> -           *optr++ = '/';
> -         if (!read_string (ptr + 4, s - 4, optr))
> --          goto fail;
> -+          goto fail_1;
> -         optr += grub_strlen (optr);
> -         break;
> -       default:
> --        goto fail;
> -+        goto fail_1;
> -       }
> -       ptr += s;
> -     }
> -@@ -1078,7 +1091,7 @@ grub_udf_read_symlink (grub_fshelp_node_t node)
> -   grub_free (raw);
> -   return out;
> -
> -- fail:
> -+ fail_1:
> -   grub_free (raw);
> -   grub_free (out);
> -   grub_error (GRUB_ERR_BAD_FS, "invalid symlink");
> -diff --git a/grub-core/fs/xfs.c b/grub-core/fs/xfs.c
> -index 96ffecb..ea65902 100644
> ---- a/grub-core/fs/xfs.c
> -+++ b/grub-core/fs/xfs.c
> -@@ -25,6 +25,7 @@
> - #include <grub/dl.h>
> - #include <grub/types.h>
> - #include <grub/fshelp.h>
> -+#include <grub/safemath.h>
> -
> - GRUB_MOD_LICENSE ("GPLv3+");
> -
> -@@ -899,6 +900,7 @@ static struct grub_xfs_data *
> - grub_xfs_mount (grub_disk_t disk)
> - {
> -   struct grub_xfs_data *data = 0;
> -+  grub_size_t sz;
> -
> -   data = grub_zalloc (sizeof (struct grub_xfs_data));
> -   if (!data)
> -@@ -913,10 +915,11 @@ grub_xfs_mount (grub_disk_t disk)
> -   if (!grub_xfs_sb_valid(data))
> -     goto fail;
> -
> --  data = grub_realloc (data,
> --                     sizeof (struct grub_xfs_data)
> --                     - sizeof (struct grub_xfs_inode)
> --                     + grub_xfs_inode_size(data) + 1);
> -+  if (grub_add (grub_xfs_inode_size (data),
> -+      sizeof (struct grub_xfs_data) - sizeof (struct grub_xfs_inode) +
> 1, &sz))
> -+    goto fail;
> -+
> -+  data = grub_realloc (data, sz);
> -
> -   if (! data)
> -     goto fail;
> -diff --git a/grub-core/fs/zfs/zfs.c b/grub-core/fs/zfs/zfs.c
> -index 381dde5..36d0373 100644
> ---- a/grub-core/fs/zfs/zfs.c
> -+++ b/grub-core/fs/zfs/zfs.c
> -@@ -55,6 +55,7 @@
> - #include <grub/deflate.h>
> - #include <grub/crypto.h>
> - #include <grub/i18n.h>
> -+#include <grub/safemath.h>
> -
> - GRUB_MOD_LICENSE ("GPLv3+");
> -
> -@@ -773,11 +774,14 @@ fill_vdev_info (struct grub_zfs_data *data,
> -   if (data->n_devices_attached > data->n_devices_allocated)
> -     {
> -       void *tmp;
> --      data->n_devices_allocated = 2 * data->n_devices_attached + 1;
> --      data->devices_attached
> --      = grub_realloc (tmp = data->devices_attached,
> --                      data->n_devices_allocated
> --                      * sizeof (data->devices_attached[0]));
> -+      grub_size_t sz;
> -+
> -+      if (grub_mul (data->n_devices_attached, 2,
> &data->n_devices_allocated) ||
> -+        grub_add (data->n_devices_allocated, 1,
> &data->n_devices_allocated) ||
> -+        grub_mul (data->n_devices_allocated, sizeof
> (data->devices_attached[0]), &sz))
> -+      return GRUB_ERR_OUT_OF_RANGE;
> -+
> -+      data->devices_attached = grub_realloc (tmp =
> data->devices_attached, sz);
> -       if (!data->devices_attached)
> -       {
> -         data->devices_attached = tmp;
> -@@ -3468,14 +3472,18 @@ grub_zfs_nvlist_lookup_nvlist (const char
> *nvlist, const char *name)
> - {
> -   char *nvpair;
> -   char *ret;
> --  grub_size_t size;
> -+  grub_size_t size, sz;
> -   int found;
> -
> -   found = nvlist_find_value (nvlist, name, DATA_TYPE_NVLIST, &nvpair,
> -                            &size, 0);
> -   if (!found)
> -     return 0;
> --  ret = grub_zalloc (size + 3 * sizeof (grub_uint32_t));
> -+
> -+  if (grub_add (size, 3 * sizeof (grub_uint32_t), &sz))
> -+      return 0;
> -+
> -+  ret = grub_zalloc (sz);
> -   if (!ret)
> -     return 0;
> -   grub_memcpy (ret, nvlist, sizeof (grub_uint32_t));
> -diff --git a/grub-core/fs/zfs/zfscrypt.c b/grub-core/fs/zfs/zfscrypt.c
> -index 1402e0b..de3b015 100644
> ---- a/grub-core/fs/zfs/zfscrypt.c
> -+++ b/grub-core/fs/zfs/zfscrypt.c
> -@@ -22,6 +22,7 @@
> - #include <grub/misc.h>
> - #include <grub/disk.h>
> - #include <grub/partition.h>
> -+#include <grub/safemath.h>
> - #include <grub/dl.h>
> - #include <grub/types.h>
> - #include <grub/zfs/zfs.h>
> -@@ -82,9 +83,13 @@ grub_zfs_add_key (grub_uint8_t *key_in,
> -                 int passphrase)
> - {
> -   struct grub_zfs_wrap_key *key;
> -+  grub_size_t sz;
> -+
> -   if (!passphrase && keylen > 32)
> -     keylen = 32;
> --  key = grub_malloc (sizeof (*key) + keylen);
> -+  if (grub_add (sizeof (*key), keylen, &sz))
> -+    return GRUB_ERR_OUT_OF_RANGE;
> -+  key = grub_malloc (sz);
> -   if (!key)
> -     return grub_errno;
> -   key->is_passphrase = passphrase;
> -diff --git a/grub-core/lib/arg.c b/grub-core/lib/arg.c
> -index fd7744a..3288609 100644
> ---- a/grub-core/lib/arg.c
> -+++ b/grub-core/lib/arg.c
> -@@ -23,6 +23,7 @@
> - #include <grub/term.h>
> - #include <grub/extcmd.h>
> - #include <grub/i18n.h>
> -+#include <grub/safemath.h>
> -
> - /* Built-in parser for default options.  */
> - static const struct grub_arg_option help_options[] =
> -@@ -216,7 +217,13 @@ static inline grub_err_t
> - add_arg (char ***argl, int *num, char *s)
> - {
> -   char **p = *argl;
> --  *argl = grub_realloc (*argl, (++(*num) + 1) * sizeof (char *));
> -+  grub_size_t sz;
> -+
> -+  if (grub_add (++(*num), 1, &sz) ||
> -+      grub_mul (sz, sizeof (char *), &sz))
> -+    return grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow is
> detected"));
> -+
> -+  *argl = grub_realloc (*argl, sz);
> -   if (! *argl)
> -     {
> -       grub_free (p);
> -@@ -431,6 +438,7 @@ grub_arg_list_alloc(grub_extcmd_t extcmd, int argc,
> -   grub_size_t argcnt;
> -   struct grub_arg_list *list;
> -   const struct grub_arg_option *options;
> -+  grub_size_t sz0, sz1;
> -
> -   options = extcmd->options;
> -   if (! options)
> -@@ -443,7 +451,15 @@ grub_arg_list_alloc(grub_extcmd_t extcmd, int argc,
> -       argcnt += ((grub_size_t) argc + 1) / 2 + 1; /* max possible for
> any option */
> -     }
> -
> --  list = grub_zalloc (sizeof (*list) * i + sizeof (char*) * argcnt);
> -+  if (grub_mul (sizeof (*list), i, &sz0) ||
> -+      grub_mul (sizeof (char *), argcnt, &sz1) ||
> -+      grub_add (sz0, sz1, &sz0))
> -+    {
> -+      grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow is detected"));
> -+      return 0;
> -+    }
> -+
> -+  list = grub_zalloc (sz0);
> -   if (! list)
> -     return 0;
> -
> -diff --git a/grub-core/loader/i386/bsd.c b/grub-core/loader/i386/bsd.c
> -index 3730ed3..b92cbe9 100644
> ---- a/grub-core/loader/i386/bsd.c
> -+++ b/grub-core/loader/i386/bsd.c
> -@@ -35,6 +35,7 @@
> - #include <grub/ns8250.h>
> - #include <grub/bsdlabel.h>
> - #include <grub/crypto.h>
> -+#include <grub/safemath.h>
> - #include <grub/verify.h>
> - #ifdef GRUB_MACHINE_PCBIOS
> - #include <grub/machine/int.h>
> -@@ -1012,11 +1013,16 @@ grub_netbsd_add_modules (void)
> -   struct grub_netbsd_btinfo_modules *mods;
> -   unsigned i;
> -   grub_err_t err;
> -+  grub_size_t sz;
> -
> -   for (mod = netbsd_mods; mod; mod = mod->next)
> -     modcnt++;
> -
> --  mods = grub_malloc (sizeof (*mods) + sizeof (mods->mods[0]) * modcnt);
> -+  if (grub_mul (modcnt, sizeof (mods->mods[0]), &sz) ||
> -+      grub_add (sz, sizeof (*mods), &sz))
> -+    return GRUB_ERR_OUT_OF_RANGE;
> -+
> -+  mods = grub_malloc (sz);
> -   if (!mods)
> -     return grub_errno;
> -
> -diff --git a/grub-core/net/dns.c b/grub-core/net/dns.c
> -index e332d5e..906ec7d 100644
> ---- a/grub-core/net/dns.c
> -+++ b/grub-core/net/dns.c
> -@@ -22,6 +22,7 @@
> - #include <grub/i18n.h>
> - #include <grub/err.h>
> - #include <grub/time.h>
> -+#include <grub/safemath.h>
> -
> - struct dns_cache_element
> - {
> -@@ -51,9 +52,15 @@ grub_net_add_dns_server (const struct
> grub_net_network_level_address *s)
> -     {
> -       int na = dns_servers_alloc * 2;
> -       struct grub_net_network_level_address *ns;
> -+      grub_size_t sz;
> -+
> -       if (na < 8)
> -       na = 8;
> --      ns = grub_realloc (dns_servers, na * sizeof (ns[0]));
> -+
> -+      if (grub_mul (na, sizeof (ns[0]), &sz))
> -+      return GRUB_ERR_OUT_OF_RANGE;
> -+
> -+      ns = grub_realloc (dns_servers, sz);
> -       if (!ns)
> -       return grub_errno;
> -       dns_servers_alloc = na;
> -diff --git a/grub-core/normal/charset.c b/grub-core/normal/charset.c
> -index d57fb72..4dfcc31 100644
> ---- a/grub-core/normal/charset.c
> -+++ b/grub-core/normal/charset.c
> -@@ -48,6 +48,7 @@
> - #include <grub/unicode.h>
> - #include <grub/term.h>
> - #include <grub/normal.h>
> -+#include <grub/safemath.h>
> -
> - #if HAVE_FONT_SOURCE
> - #include "widthspec.h"
> -@@ -464,6 +465,7 @@ grub_unicode_aglomerate_comb (const grub_uint32_t
> *in, grub_size_t inlen,
> -       {
> -         struct grub_unicode_combining *n;
> -         unsigned j;
> -+        grub_size_t sz;
> -
> -         if (!haveout)
> -           continue;
> -@@ -477,10 +479,14 @@ grub_unicode_aglomerate_comb (const grub_uint32_t
> *in, grub_size_t inlen,
> -           n = out->combining_inline;
> -         else if (out->ncomb > (int) ARRAY_SIZE (out->combining_inline))
> -           {
> --            n = grub_realloc (out->combining_ptr,
> --                              sizeof (n[0]) * (out->ncomb + 1));
> -+            if (grub_add (out->ncomb, 1, &sz) ||
> -+                grub_mul (sz, sizeof (n[0]), &sz))
> -+              goto fail;
> -+
> -+            n = grub_realloc (out->combining_ptr, sz);
> -             if (!n)
> -               {
> -+ fail:
> -                 grub_errno = GRUB_ERR_NONE;
> -                 continue;
> -               }
> -diff --git a/grub-core/normal/cmdline.c b/grub-core/normal/cmdline.c
> -index c57242e..de03fe6 100644
> ---- a/grub-core/normal/cmdline.c
> -+++ b/grub-core/normal/cmdline.c
> -@@ -28,6 +28,7 @@
> - #include <grub/env.h>
> - #include <grub/i18n.h>
> - #include <grub/charset.h>
> -+#include <grub/safemath.h>
> -
> - static grub_uint32_t *kill_buf;
> -
> -@@ -307,12 +308,21 @@ cl_insert (struct cmdline_term *cl_terms, unsigned
> nterms,
> -   if (len + (*llen) >= (*max_len))
> -     {
> -       grub_uint32_t *nbuf;
> --      (*max_len) *= 2;
> --      nbuf = grub_realloc ((*buf), sizeof (grub_uint32_t) * (*max_len));
> -+      grub_size_t sz;
> -+
> -+      if (grub_mul (*max_len, 2, max_len) ||
> -+        grub_mul (*max_len, sizeof (grub_uint32_t), &sz))
> -+      {
> -+        grub_errno = GRUB_ERR_OUT_OF_RANGE;
> -+        goto fail;
> -+      }
> -+
> -+      nbuf = grub_realloc ((*buf), sz);
> -       if (nbuf)
> -       (*buf) = nbuf;
> -       else
> -       {
> -+ fail:
> -         grub_print_error ();
> -         grub_errno = GRUB_ERR_NONE;
> -         (*max_len) /= 2;
> -diff --git a/grub-core/normal/menu_entry.c b/grub-core/normal/menu_entry.c
> -index 1993995..50eef91 100644
> ---- a/grub-core/normal/menu_entry.c
> -+++ b/grub-core/normal/menu_entry.c
> -@@ -27,6 +27,7 @@
> - #include <grub/auth.h>
> - #include <grub/i18n.h>
> - #include <grub/charset.h>
> -+#include <grub/safemath.h>
> -
> - enum update_mode
> -   {
> -@@ -113,10 +114,18 @@ ensure_space (struct line *linep, int extra)
> - {
> -   if (linep->max_len < linep->len + extra)
> -     {
> --      linep->max_len = 2 * (linep->len + extra);
> --      linep->buf = grub_realloc (linep->buf, (linep->max_len + 1) *
> sizeof (linep->buf[0]));
> -+      grub_size_t sz0, sz1;
> -+
> -+      if (grub_add (linep->len, extra, &sz0) ||
> -+        grub_mul (sz0, 2, &sz0) ||
> -+        grub_add (sz0, 1, &sz1) ||
> -+        grub_mul (sz1, sizeof (linep->buf[0]), &sz1))
> -+      return 0;
> -+
> -+      linep->buf = grub_realloc (linep->buf, sz1);
> -       if (! linep->buf)
> -       return 0;
> -+      linep->max_len = sz0;
> -     }
> -
> -   return 1;
> -diff --git a/grub-core/script/argv.c b/grub-core/script/argv.c
> -index 217ec5d..5751fdd 100644
> ---- a/grub-core/script/argv.c
> -+++ b/grub-core/script/argv.c
> -@@ -20,6 +20,7 @@
> - #include <grub/mm.h>
> - #include <grub/misc.h>
> - #include <grub/script_sh.h>
> -+#include <grub/safemath.h>
> -
> - /* Return nearest power of two that is >= v.  */
> - static unsigned
> -@@ -81,11 +82,16 @@ int
> - grub_script_argv_next (struct grub_script_argv *argv)
> - {
> -   char **p = argv->args;
> -+  grub_size_t sz;
> -
> -   if (argv->args && argv->argc && argv->args[argv->argc - 1] == 0)
> -     return 0;
> -
> --  p = grub_realloc (p, round_up_exp ((argv->argc + 2) * sizeof (char
> *)));
> -+  if (grub_add (argv->argc, 2, &sz) ||
> -+      grub_mul (sz, sizeof (char *), &sz))
> -+    return 1;
> -+
> -+  p = grub_realloc (p, round_up_exp (sz));
> -   if (! p)
> -     return 1;
> -
> -@@ -105,13 +111,19 @@ grub_script_argv_append (struct grub_script_argv
> *argv, const char *s,
> - {
> -   grub_size_t a;
> -   char *p = argv->args[argv->argc - 1];
> -+  grub_size_t sz;
> -
> -   if (! s)
> -     return 0;
> -
> -   a = p ? grub_strlen (p) : 0;
> -
> --  p = grub_realloc (p, round_up_exp ((a + slen + 1) * sizeof (char)));
> -+  if (grub_add (a, slen, &sz) ||
> -+      grub_add (sz, 1, &sz) ||
> -+      grub_mul (sz, sizeof (char), &sz))
> -+    return 1;
> -+
> -+  p = grub_realloc (p, round_up_exp (sz));
> -   if (! p)
> -     return 1;
> -
> -diff --git a/grub-core/script/lexer.c b/grub-core/script/lexer.c
> -index c6bd317..5fb0cbd 100644
> ---- a/grub-core/script/lexer.c
> -+++ b/grub-core/script/lexer.c
> -@@ -24,6 +24,7 @@
> - #include <grub/mm.h>
> - #include <grub/script_sh.h>
> - #include <grub/i18n.h>
> -+#include <grub/safemath.h>
> -
> - #define yytext_ptr char *
> - #include "grub_script.tab.h"
> -@@ -110,10 +111,14 @@ grub_script_lexer_record (struct grub_parser_param
> *parser, char *str)
> -       old = lexer->recording;
> -       if (lexer->recordlen < len)
> -       lexer->recordlen = len;
> --      lexer->recordlen *= 2;
> -+
> -+      if (grub_mul (lexer->recordlen, 2, &lexer->recordlen))
> -+      goto fail;
> -+
> -       lexer->recording = grub_realloc (lexer->recording,
> lexer->recordlen);
> -       if (!lexer->recording)
> -       {
> -+ fail:
> -         grub_free (old);
> -         lexer->recordpos = 0;
> -         lexer->recordlen = 0;
> -@@ -130,7 +135,7 @@ int
> - grub_script_lexer_yywrap (struct grub_parser_param *parserstate,
> -                         const char *input)
> - {
> --  grub_size_t len = 0;
> -+  grub_size_t len = 0, sz;
> -   char *p = 0;
> -   char *line = 0;
> -   YY_BUFFER_STATE buffer;
> -@@ -168,12 +173,22 @@ grub_script_lexer_yywrap (struct grub_parser_param
> *parserstate,
> -     }
> -   else if (len && line[len - 1] != '\n')
> -     {
> --      p = grub_realloc (line, len + 2);
> -+      if (grub_add (len, 2, &sz))
> -+      {
> -+        grub_free (line);
> -+        grub_script_yyerror (parserstate, N_("overflow is detected"));
> -+        return 1;
> -+      }
> -+
> -+      p = grub_realloc (line, sz);
> -       if (p)
> -       {
> -         p[len++] = '\n';
> -         p[len] = '\0';
> -       }
> -+      else
> -+      grub_free (line);
> -+
> -       line = p;
> -     }
> -
> -diff --git a/grub-core/video/bitmap.c b/grub-core/video/bitmap.c
> -index b2e0315..6256e20 100644
> ---- a/grub-core/video/bitmap.c
> -+++ b/grub-core/video/bitmap.c
> -@@ -23,6 +23,7 @@
> - #include <grub/mm.h>
> - #include <grub/misc.h>
> - #include <grub/i18n.h>
> -+#include <grub/safemath.h>
> -
> - GRUB_MOD_LICENSE ("GPLv3+");
> -
> -@@ -58,7 +59,7 @@ grub_video_bitmap_create (struct grub_video_bitmap
> **bitmap,
> -                           enum grub_video_blit_format blit_format)
> - {
> -   struct grub_video_mode_info *mode_info;
> --  unsigned int size;
> -+  grub_size_t size;
> -
> -   if (!bitmap)
> -     return grub_error (GRUB_ERR_BUG, "invalid argument");
> -@@ -137,19 +138,25 @@ grub_video_bitmap_create (struct grub_video_bitmap
> **bitmap,
> -
> -   mode_info->pitch = width * mode_info->bytes_per_pixel;
> -
> --  /* Calculate size needed for the data.  */
> --  size = (width * mode_info->bytes_per_pixel) * height;
> -+  /* Calculate size needed for the data. */
> -+  if (grub_mul (width, mode_info->bytes_per_pixel, &size) ||
> -+      grub_mul (size, height, &size))
> -+    {
> -+      grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow is detected"));
> -+      goto fail;
> -+    }
> -
> -   (*bitmap)->data = grub_zalloc (size);
> -   if (! (*bitmap)->data)
> --    {
> --      grub_free (*bitmap);
> --      *bitmap = 0;
> --
> --      return grub_errno;
> --    }
> -+    goto fail;
> -
> -   return GRUB_ERR_NONE;
> -+
> -+ fail:
> -+  grub_free (*bitmap);
> -+  *bitmap = NULL;
> -+
> -+  return grub_errno;
> - }
> -
> - /* Frees all resources allocated by bitmap.  */
> -diff --git a/grub-core/video/readers/png.c b/grub-core/video/readers/png.c
> -index 61bd645..0157ff7 100644
> ---- a/grub-core/video/readers/png.c
> -+++ b/grub-core/video/readers/png.c
> -@@ -23,6 +23,7 @@
> - #include <grub/mm.h>
> - #include <grub/misc.h>
> - #include <grub/bufio.h>
> -+#include <grub/safemath.h>
> -
> - GRUB_MOD_LICENSE ("GPLv3+");
> -
> -@@ -301,9 +302,17 @@ grub_png_decode_image_header (struct grub_png_data
> *data)
> -       data->bpp <<= 1;
> -
> -   data->color_bits = color_bits;
> --  data->row_bytes = data->image_width * data->bpp;
> -+
> -+  if (grub_mul (data->image_width, data->bpp, &data->row_bytes))
> -+    return grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow is
> detected"));
> -+
> -   if (data->color_bits <= 4)
> --    data->row_bytes = (data->image_width * data->color_bits + 7) / 8;
> -+    {
> -+      if (grub_mul (data->image_width, data->color_bits + 7,
> &data->row_bytes))
> -+      return grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow is
> detected"));
> -+
> -+      data->row_bytes >>= 3;
> -+    }
> -
> - #ifndef GRUB_CPU_WORDS_BIGENDIAN
> -   if (data->is_16bit || data->is_gray || data->is_palette)
> ---
> -2.14.4
> -
> diff --git
> a/meta/recipes-bsp/grub/files/CVE-2020-15706-script-Avoid-a-use-after-free-when-redefining-a-func.patch
> b/meta/recipes-bsp/grub/files/CVE-2020-15706-script-Avoid-a-use-after-free-when-redefining-a-func.patch
> deleted file mode 100644
> index 329e554a68..0000000000
> ---
> a/meta/recipes-bsp/grub/files/CVE-2020-15706-script-Avoid-a-use-after-free-when-redefining-a-func.patch
> +++ /dev/null
> @@ -1,117 +0,0 @@
> -From c65fc7e75b7b7e880d90766057040011701e97f4 Mon Sep 17 00:00:00 2001
> -From: Chris Coulson <chris.coulson@canonical.com>
> -Date: Fri, 10 Jul 2020 14:41:45 +0100
> -Subject: [PATCH 8/9] script: Avoid a use-after-free when redefining a
> function
> - during execution
> -
> -Defining a new function with the same name as a previously defined
> -function causes the grub_script and associated resources for the
> -previous function to be freed. If the previous function is currently
> -executing when a function with the same name is defined, this results
> -in use-after-frees when processing subsequent commands in the original
> -function.
> -
> -Instead, reject a new function definition if it has the same name as
> -a previously defined function, and that function is currently being
> -executed. Although a behavioural change, this should be backwards
> -compatible with existing configurations because they can't be
> -dependent on the current behaviour without being broken.
> -
> -Fixes: CVE-2020-15706
> -
> -Signed-off-by: Chris Coulson <chris.coulson@canonical.com>
> -Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> -
> -Upstream-Status: Backport
> -CVE: CVE-2020-15706
> -
> -Reference to upstream patch:
> -
> https://git.savannah.gnu.org/cgit/grub.git/commit/?id=426f57383d647406ae9c628c472059c27cd6e040
> -
> -Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
> ----
> - grub-core/script/execute.c  |  2 ++
> - grub-core/script/function.c | 16 +++++++++++++---
> - grub-core/script/parser.y   |  3 ++-
> - include/grub/script_sh.h    |  2 ++
> - 4 files changed, 19 insertions(+), 4 deletions(-)
> -
> -diff --git a/grub-core/script/execute.c b/grub-core/script/execute.c
> -index c8d6806..7e028e1 100644
> ---- a/grub-core/script/execute.c
> -+++ b/grub-core/script/execute.c
> -@@ -838,7 +838,9 @@ grub_script_function_call (grub_script_function_t
> func, int argc, char **args)
> -   old_scope = scope;
> -   scope = &new_scope;
> -
> -+  func->executing++;
> -   ret = grub_script_execute (func->func);
> -+  func->executing--;
> -
> -   function_return = 0;
> -   active_loops = loops;
> -diff --git a/grub-core/script/function.c b/grub-core/script/function.c
> -index d36655e..3aad04b 100644
> ---- a/grub-core/script/function.c
> -+++ b/grub-core/script/function.c
> -@@ -34,6 +34,7 @@ grub_script_function_create (struct grub_script_arg
> *functionname_arg,
> -   func = (grub_script_function_t) grub_malloc (sizeof (*func));
> -   if (! func)
> -     return 0;
> -+  func->executing = 0;
> -
> -   func->name = grub_strdup (functionname_arg->str);
> -   if (! func->name)
> -@@ -60,10 +61,19 @@ grub_script_function_create (struct grub_script_arg
> *functionname_arg,
> -       grub_script_function_t q;
> -
> -       q = *p;
> --      grub_script_free (q->func);
> --      q->func = cmd;
> -       grub_free (func);
> --      func = q;
> -+      if (q->executing > 0)
> -+        {
> -+          grub_error (GRUB_ERR_BAD_ARGUMENT,
> -+                    N_("attempt to redefine a function being executed"));
> -+          func = NULL;
> -+        }
> -+      else
> -+        {
> -+          grub_script_free (q->func);
> -+          q->func = cmd;
> -+          func = q;
> -+        }
> -     }
> -   else
> -     {
> -diff --git a/grub-core/script/parser.y b/grub-core/script/parser.y
> -index 4f0ab83..f80b86b 100644
> ---- a/grub-core/script/parser.y
> -+++ b/grub-core/script/parser.y
> -@@ -289,7 +289,8 @@ function: "function" "name"
> -             grub_script_mem_free (state->func_mem);
> -           else {
> -             script->children = state->scripts;
> --            grub_script_function_create ($2, script);
> -+            if (!grub_script_function_create ($2, script))
> -+              grub_script_free (script);
> -           }
> -
> -           state->scripts = $<scripts>3;
> -diff --git a/include/grub/script_sh.h b/include/grub/script_sh.h
> -index b382bcf..6c48e07 100644
> ---- a/include/grub/script_sh.h
> -+++ b/include/grub/script_sh.h
> -@@ -361,6 +361,8 @@ struct grub_script_function
> -
> -   /* The next element.  */
> -   struct grub_script_function *next;
> -+
> -+  unsigned executing;
> - };
> - typedef struct grub_script_function *grub_script_function_t;
> -
> ---
> -2.14.4
> -
> diff --git
> a/meta/recipes-bsp/grub/files/CVE-2020-15707-linux-Fix-integer-overflows-in-initrd-size-handling.patch
> b/meta/recipes-bsp/grub/files/CVE-2020-15707-linux-Fix-integer-overflows-in-initrd-size-handling.patch
> deleted file mode 100644
> index d4f9300c0a..0000000000
> ---
> a/meta/recipes-bsp/grub/files/CVE-2020-15707-linux-Fix-integer-overflows-in-initrd-size-handling.patch
> +++ /dev/null
> @@ -1,177 +0,0 @@
> -From 68a09a74f6d726d79709847f3671c0a08e4fb5a0 Mon Sep 17 00:00:00 2001
> -From: Colin Watson <cjwatson@debian.org>
> -Date: Sat, 25 Jul 2020 12:15:37 +0100
> -Subject: [PATCH 9/9] linux: Fix integer overflows in initrd size handling
> -
> -These could be triggered by a crafted filesystem with very large files.
> -
> -Fixes: CVE-2020-15707
> -
> -Signed-off-by: Colin Watson <cjwatson@debian.org>
> -Reviewed-by: Jan Setje-Eilers <jan.setjeeilers@oracle.com>
> -Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> -
> -Upstream-Status: Backport
> -CVE: CVE-2020-15707
> -
> -Reference to upstream patch:
> -
> https://git.savannah.gnu.org/cgit/grub.git/commit/?id=e7b8856f8be3292afdb38d2e8c70ad8d62a61e10
> -
> -Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
> ----
> - grub-core/loader/linux.c | 74
> +++++++++++++++++++++++++++++++++++-------------
> - 1 file changed, 54 insertions(+), 20 deletions(-)
> -
> -diff --git a/grub-core/loader/linux.c b/grub-core/loader/linux.c
> -index 471b214..8c8565a 100644
> ---- a/grub-core/loader/linux.c
> -+++ b/grub-core/loader/linux.c
> -@@ -4,6 +4,7 @@
> - #include <grub/misc.h>
> - #include <grub/file.h>
> - #include <grub/mm.h>
> -+#include <grub/safemath.h>
> -
> - struct newc_head
> - {
> -@@ -98,13 +99,13 @@ free_dir (struct dir *root)
> -   grub_free (root);
> - }
> -
> --static grub_size_t
> -+static grub_err_t
> - insert_dir (const char *name, struct dir **root,
> --          grub_uint8_t *ptr)
> -+          grub_uint8_t *ptr, grub_size_t *size)
> - {
> -   struct dir *cur, **head = root;
> -   const char *cb, *ce = name;
> --  grub_size_t size = 0;
> -+  *size = 0;
> -   while (1)
> -     {
> -       for (cb = ce; *cb == '/'; cb++);
> -@@ -130,14 +131,22 @@ insert_dir (const char *name, struct dir **root,
> -             ptr = make_header (ptr, name, ce - name,
> -                                040777, 0);
> -           }
> --        size += ALIGN_UP ((ce - (char *) name)
> --                          + sizeof (struct newc_head), 4);
> -+        if (grub_add (*size,
> -+                      ALIGN_UP ((ce - (char *) name)
> -+                                + sizeof (struct newc_head), 4),
> -+                      size))
> -+          {
> -+            grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow is
> detected"));
> -+            grub_free (n->name);
> -+            grub_free (n);
> -+            return grub_errno;
> -+          }
> -         *head = n;
> -         cur = n;
> -       }
> -       root = &cur->next;
> -     }
> --  return size;
> -+  return GRUB_ERR_NONE;
> - }
> -
> - grub_err_t
> -@@ -173,26 +182,33 @@ grub_initrd_init (int argc, char *argv[],
> -         eptr = grub_strchr (ptr, ':');
> -         if (eptr)
> -           {
> -+            grub_size_t dir_size, name_len;
> -+
> -             initrd_ctx->components[i].newc_name = grub_strndup (ptr,
> eptr - ptr);
> --            if (!initrd_ctx->components[i].newc_name)
> -+            if (!initrd_ctx->components[i].newc_name ||
> -+                insert_dir (initrd_ctx->components[i].newc_name, &root,
> 0,
> -+                            &dir_size))
> -               {
> -                 grub_initrd_close (initrd_ctx);
> -                 return grub_errno;
> -               }
> --            initrd_ctx->size
> --              += ALIGN_UP (sizeof (struct newc_head)
> --                          + grub_strlen
> (initrd_ctx->components[i].newc_name),
> --                           4);
> --            initrd_ctx->size += insert_dir
> (initrd_ctx->components[i].newc_name,
> --                                            &root, 0);
> -+            name_len = grub_strlen (initrd_ctx->components[i].newc_name);
> -+            if (grub_add (initrd_ctx->size,
> -+                          ALIGN_UP (sizeof (struct newc_head) +
> name_len, 4),
> -+                          &initrd_ctx->size) ||
> -+                grub_add (initrd_ctx->size, dir_size, &initrd_ctx->size))
> -+              goto overflow;
> -             newc = 1;
> -             fname = eptr + 1;
> -           }
> -       }
> -       else if (newc)
> -       {
> --        initrd_ctx->size += ALIGN_UP (sizeof (struct newc_head)
> --                                      + sizeof ("TRAILER!!!") - 1, 4);
> -+        if (grub_add (initrd_ctx->size,
> -+                      ALIGN_UP (sizeof (struct newc_head)
> -+                                + sizeof ("TRAILER!!!") - 1, 4),
> -+                      &initrd_ctx->size))
> -+          goto overflow;
> -         free_dir (root);
> -         root = 0;
> -         newc = 0;
> -@@ -208,19 +224,29 @@ grub_initrd_init (int argc, char *argv[],
> -       initrd_ctx->nfiles++;
> -       initrd_ctx->components[i].size
> -       = grub_file_size (initrd_ctx->components[i].file);
> --      initrd_ctx->size += initrd_ctx->components[i].size;
> -+      if (grub_add (initrd_ctx->size, initrd_ctx->components[i].size,
> -+                  &initrd_ctx->size))
> -+      goto overflow;
> -     }
> -
> -   if (newc)
> -     {
> -       initrd_ctx->size = ALIGN_UP (initrd_ctx->size, 4);
> --      initrd_ctx->size += ALIGN_UP (sizeof (struct newc_head)
> --                                  + sizeof ("TRAILER!!!") - 1, 4);
> -+      if (grub_add (initrd_ctx->size,
> -+                  ALIGN_UP (sizeof (struct newc_head)
> -+                            + sizeof ("TRAILER!!!") - 1, 4),
> -+                  &initrd_ctx->size))
> -+      goto overflow;
> -       free_dir (root);
> -       root = 0;
> -     }
> -
> -   return GRUB_ERR_NONE;
> -+
> -+ overflow:
> -+  free_dir (root);
> -+  grub_initrd_close (initrd_ctx);
> -+  return grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow is detected"));
> - }
> -
> - grub_size_t
> -@@ -261,8 +287,16 @@ grub_initrd_load (struct grub_linux_initrd_context
> *initrd_ctx,
> -
> -       if (initrd_ctx->components[i].newc_name)
> -       {
> --        ptr += insert_dir (initrd_ctx->components[i].newc_name,
> --                           &root, ptr);
> -+        grub_size_t dir_size;
> -+
> -+        if (insert_dir (initrd_ctx->components[i].newc_name, &root, ptr,
> -+                        &dir_size))
> -+          {
> -+            free_dir (root);
> -+            grub_initrd_close (initrd_ctx);
> -+            return grub_errno;
> -+          }
> -+        ptr += dir_size;
> -         ptr = make_header (ptr, initrd_ctx->components[i].newc_name,
> -                            grub_strlen
> (initrd_ctx->components[i].newc_name),
> -                            0100777,
> ---
> -2.14.4
> -
> diff --git a/meta/recipes-bsp/grub/files/autogen.sh-exclude-pc.patch
> b/meta/recipes-bsp/grub/files/autogen.sh-exclude-pc.patch
> index faa7fde232..1323a54a59 100644
> --- a/meta/recipes-bsp/grub/files/autogen.sh-exclude-pc.patch
> +++ b/meta/recipes-bsp/grub/files/autogen.sh-exclude-pc.patch
> @@ -1,6 +1,6 @@
> -From 72c30928d3d461e0e2d20c5ff33bd96b6991d585 Mon Sep 17 00:00:00 2001
> -From: Robert Yang <liezhi.yang@windriver.com>
> -Date: Sat, 25 Jan 2014 23:49:44 -0500
> +From 8790aa8bea736f52341a0430ff3e317d3be0f99b Mon Sep 17 00:00:00 2001
> +From: Naveen Saini <naveen.kumar.saini@intel.com>
> +Date: Mon, 15 Mar 2021 14:44:15 +0800
>  Subject: [PATCH] autogen.sh: exclude .pc from po/POTFILES.in
>
>  Exclude the .pc from po/POTFILES.in since quilt uses "patch --backup",
> @@ -13,23 +13,24 @@ Upstream-Status: Inappropriate [OE specific]
>
>  Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>  Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> +Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
>  ---
>   autogen.sh | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/autogen.sh b/autogen.sh
> -index ef43270..a7067a7 100755
> +index 31b0ced7e..c63ae766c 100755
>  --- a/autogen.sh
>  +++ b/autogen.sh
>  @@ -13,7 +13,7 @@ fi
>   export LC_COLLATE=C
>   unset LC_ALL
>
> --find . -iname '*.[ch]' ! -ipath './grub-core/lib/libgcrypt-grub/*' !
> -ipath './build-aux/*' ! -ipath './grub-core/lib/libgcrypt/src/misc.c' !
> -ipath './grub-core/lib/libgcrypt/src/global.c' ! -ipath
> './grub-core/lib/libgcrypt/src/secmem.c'  ! -ipath
> './util/grub-gen-widthspec.c' ! -ipath './util/grub-gen-asciih.c' ! -ipath
> './gnulib/*' ! -iname './grub-core/lib/gnulib/*' |sort > po/POTFILES.in
> -+find . -iname '*.[ch]' ! -ipath './grub-core/lib/libgcrypt-grub/*' !
> -ipath './build-aux/*' ! -ipath './grub-core/lib/libgcrypt/src/misc.c' !
> -ipath './grub-core/lib/libgcrypt/src/global.c' ! -ipath
> './grub-core/lib/libgcrypt/src/secmem.c'  ! -ipath
> './util/grub-gen-widthspec.c' ! -ipath './util/grub-gen-asciih.c' ! -ipath
> './gnulib/*' ! -iname './grub-core/lib/gnulib/*' ! -path './.pc/*' |sort >
> po/POTFILES.in
> +-find . -iname '*.[ch]' ! -ipath './grub-core/lib/libgcrypt-grub/*' !
> -ipath './build-aux/*' ! -ipath './grub-core/lib/libgcrypt/src/misc.c' !
> -ipath './grub-core/lib/libgcrypt/src/global.c' ! -ipath
> './grub-core/lib/libgcrypt/src/secmem.c'  ! -ipath
> './util/grub-gen-widthspec.c' ! -ipath './util/grub-gen-asciih.c' ! -ipath
> './gnulib/*' ! -ipath './grub-core/lib/gnulib/*' |sort > po/POTFILES.in
> ++find . -iname '*.[ch]' ! -ipath './grub-core/lib/libgcrypt-grub/*' !
> -ipath './build-aux/*' ! -ipath './grub-core/lib/libgcrypt/src/misc.c' !
> -ipath './grub-core/lib/libgcrypt/src/global.c' ! -ipath
> './grub-core/lib/libgcrypt/src/secmem.c'  ! -ipath
> './util/grub-gen-widthspec.c' ! -ipath './util/grub-gen-asciih.c' ! -ipath
> './gnulib/*' ! -ipath './grub-core/lib/gnulib/*' ! -path './.pc/*' |sort >
> po/POTFILES.in
>   find util -iname '*.in' ! -name Makefile.in  |sort > po/POTFILES-shell.in
>
>   echo "Importing unicode..."
>  --
> -2.7.4
> +2.17.1
>
> diff --git
> a/meta/recipes-bsp/grub/files/calloc-Make-sure-we-always-have-an-overflow-checking.patch
> b/meta/recipes-bsp/grub/files/calloc-Make-sure-we-always-have-an-overflow-checking.patch
> deleted file mode 100644
> index c9536e68ef..0000000000
> ---
> a/meta/recipes-bsp/grub/files/calloc-Make-sure-we-always-have-an-overflow-checking.patch
> +++ /dev/null
> @@ -1,246 +0,0 @@
> -From c005f62f5c4b26a77b916c8f76a852324439ecb3 Mon Sep 17 00:00:00 2001
> -From: Peter Jones <pjones@redhat.com>
> -Date: Mon, 15 Jun 2020 12:15:29 -0400
> -Subject: [PATCH 2/9] calloc: Make sure we always have an overflow-checking
> - calloc() available
> -
> -This tries to make sure that everywhere in this source tree, we always
> have
> -an appropriate version of calloc() (i.e. grub_calloc(), xcalloc(), etc.)
> -available, and that they all safely check for overflow and return NULL
> when
> -it would occur.
> -
> -Upstream-Status: Backport [commit 64e26162ebfe68317c143ca5ec996c892019f8f8
> -from https://git.savannah.gnu.org/git/grub.git]
> -
> -Signed-off-by: Peter Jones <pjones@redhat.com>
> -Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> -Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
> ----
> - grub-core/kern/emu/misc.c          | 12 ++++++++++++
> - grub-core/kern/emu/mm.c            | 10 ++++++++++
> - grub-core/kern/mm.c                | 40
> ++++++++++++++++++++++++++++++++++++++
> - grub-core/lib/libgcrypt_wrap/mem.c | 11 +++++++++--
> - grub-core/lib/posix_wrap/stdlib.h  |  8 +++++++-
> - include/grub/emu/misc.h            |  1 +
> - include/grub/mm.h                  |  6 ++++++
> - 7 files changed, 85 insertions(+), 3 deletions(-)
> -
> -diff --git a/grub-core/kern/emu/misc.c b/grub-core/kern/emu/misc.c
> -index 65db79b..dfd8a8e 100644
> ---- a/grub-core/kern/emu/misc.c
> -+++ b/grub-core/kern/emu/misc.c
> -@@ -85,6 +85,18 @@ grub_util_error (const char *fmt, ...)
> -   exit (1);
> - }
> -
> -+void *
> -+xcalloc (grub_size_t nmemb, grub_size_t size)
> -+{
> -+  void *p;
> -+
> -+  p = calloc (nmemb, size);
> -+  if (!p)
> -+    grub_util_error ("%s", _("out of memory"));
> -+
> -+  return p;
> -+}
> -+
> - void *
> - xmalloc (grub_size_t size)
> - {
> -diff --git a/grub-core/kern/emu/mm.c b/grub-core/kern/emu/mm.c
> -index f262e95..145b01d 100644
> ---- a/grub-core/kern/emu/mm.c
> -+++ b/grub-core/kern/emu/mm.c
> -@@ -25,6 +25,16 @@
> - #include <string.h>
> - #include <grub/i18n.h>
> -
> -+void *
> -+grub_calloc (grub_size_t nmemb, grub_size_t size)
> -+{
> -+  void *ret;
> -+  ret = calloc (nmemb, size);
> -+  if (!ret)
> -+    grub_error (GRUB_ERR_OUT_OF_MEMORY, N_("out of memory"));
> -+  return ret;
> -+}
> -+
> - void *
> - grub_malloc (grub_size_t size)
> - {
> -diff --git a/grub-core/kern/mm.c b/grub-core/kern/mm.c
> -index ee88ff6..f2822a8 100644
> ---- a/grub-core/kern/mm.c
> -+++ b/grub-core/kern/mm.c
> -@@ -67,8 +67,10 @@
> - #include <grub/dl.h>
> - #include <grub/i18n.h>
> - #include <grub/mm_private.h>
> -+#include <grub/safemath.h>
> -
> - #ifdef MM_DEBUG
> -+# undef grub_calloc
> - # undef grub_malloc
> - # undef grub_zalloc
> - # undef grub_realloc
> -@@ -375,6 +377,30 @@ grub_memalign (grub_size_t align, grub_size_t size)
> -   return 0;
> - }
> -
> -+/*
> -+ * Allocate NMEMB instances of SIZE bytes and return the pointer, or
> error on
> -+ * integer overflow.
> -+ */
> -+void *
> -+grub_calloc (grub_size_t nmemb, grub_size_t size)
> -+{
> -+  void *ret;
> -+  grub_size_t sz = 0;
> -+
> -+  if (grub_mul (nmemb, size, &sz))
> -+    {
> -+      grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow is detected"));
> -+      return NULL;
> -+    }
> -+
> -+  ret = grub_memalign (0, sz);
> -+  if (!ret)
> -+    return NULL;
> -+
> -+  grub_memset (ret, 0, sz);
> -+  return ret;
> -+}
> -+
> - /* Allocate SIZE bytes and return the pointer.  */
> - void *
> - grub_malloc (grub_size_t size)
> -@@ -561,6 +587,20 @@ grub_mm_dump (unsigned lineno)
> -   grub_printf ("\n");
> - }
> -
> -+void *
> -+grub_debug_calloc (const char *file, int line, grub_size_t nmemb,
> grub_size_t size)
> -+{
> -+  void *ptr;
> -+
> -+  if (grub_mm_debug)
> -+    grub_printf ("%s:%d: calloc (0x%" PRIxGRUB_SIZE ", 0x%"
> PRIxGRUB_SIZE ") = ",
> -+               file, line, size);
> -+  ptr = grub_calloc (nmemb, size);
> -+  if (grub_mm_debug)
> -+    grub_printf ("%p\n", ptr);
> -+  return ptr;
> -+}
> -+
> - void *
> - grub_debug_malloc (const char *file, int line, grub_size_t size)
> - {
> -diff --git a/grub-core/lib/libgcrypt_wrap/mem.c
> b/grub-core/lib/libgcrypt_wrap/mem.c
> -index beeb661..74c6eaf 100644
> ---- a/grub-core/lib/libgcrypt_wrap/mem.c
> -+++ b/grub-core/lib/libgcrypt_wrap/mem.c
> -@@ -4,6 +4,7 @@
> - #include <grub/crypto.h>
> - #include <grub/dl.h>
> - #include <grub/env.h>
> -+#include <grub/safemath.h>
> -
> - GRUB_MOD_LICENSE ("GPLv3+");
> -
> -@@ -36,7 +37,10 @@ void *
> - gcry_xcalloc (size_t n, size_t m)
> - {
> -   void *ret;
> --  ret = grub_zalloc (n * m);
> -+  size_t sz;
> -+  if (grub_mul (n, m, &sz))
> -+    grub_fatal ("gcry_xcalloc would overflow");
> -+  ret = grub_zalloc (sz);
> -   if (!ret)
> -     grub_fatal ("gcry_xcalloc failed");
> -   return ret;
> -@@ -56,7 +60,10 @@ void *
> - gcry_xcalloc_secure (size_t n, size_t m)
> - {
> -   void *ret;
> --  ret = grub_zalloc (n * m);
> -+  size_t sz;
> -+  if (grub_mul (n, m, &sz))
> -+    grub_fatal ("gcry_xcalloc would overflow");
> -+  ret = grub_zalloc (sz);
> -   if (!ret)
> -     grub_fatal ("gcry_xcalloc failed");
> -   return ret;
> -diff --git a/grub-core/lib/posix_wrap/stdlib.h
> b/grub-core/lib/posix_wrap/stdlib.h
> -index 3b46f47..7a8d385 100644
> ---- a/grub-core/lib/posix_wrap/stdlib.h
> -+++ b/grub-core/lib/posix_wrap/stdlib.h
> -@@ -21,6 +21,7 @@
> -
> - #include <grub/mm.h>
> - #include <grub/misc.h>
> -+#include <grub/safemath.h>
> -
> - static inline void
> - free (void *ptr)
> -@@ -37,7 +38,12 @@ malloc (grub_size_t size)
> - static inline void *
> - calloc (grub_size_t size, grub_size_t nelem)
> - {
> --  return grub_zalloc (size * nelem);
> -+  grub_size_t sz;
> -+
> -+  if (grub_mul (size, nelem, &sz))
> -+    return NULL;
> -+
> -+  return grub_zalloc (sz);
> - }
> -
> - static inline void *
> -diff --git a/include/grub/emu/misc.h b/include/grub/emu/misc.h
> -index ce464cf..ff9c48a 100644
> ---- a/include/grub/emu/misc.h
> -+++ b/include/grub/emu/misc.h
> -@@ -47,6 +47,7 @@ grub_util_device_is_mapped (const char *dev);
> - #define GRUB_HOST_PRIuLONG_LONG "llu"
> - #define GRUB_HOST_PRIxLONG_LONG "llx"
> -
> -+void * EXPORT_FUNC(xcalloc) (grub_size_t nmemb, grub_size_t size)
> WARN_UNUSED_RESULT;
> - void * EXPORT_FUNC(xmalloc) (grub_size_t size) WARN_UNUSED_RESULT;
> - void * EXPORT_FUNC(xrealloc) (void *ptr, grub_size_t size)
> WARN_UNUSED_RESULT;
> - char * EXPORT_FUNC(xstrdup) (const char *str) WARN_UNUSED_RESULT;
> -diff --git a/include/grub/mm.h b/include/grub/mm.h
> -index 28e2e53..9c38dd3 100644
> ---- a/include/grub/mm.h
> -+++ b/include/grub/mm.h
> -@@ -29,6 +29,7 @@
> - #endif
> -
> - void grub_mm_init_region (void *addr, grub_size_t size);
> -+void *EXPORT_FUNC(grub_calloc) (grub_size_t nmemb, grub_size_t size);
> - void *EXPORT_FUNC(grub_malloc) (grub_size_t size);
> - void *EXPORT_FUNC(grub_zalloc) (grub_size_t size);
> - void EXPORT_FUNC(grub_free) (void *ptr);
> -@@ -48,6 +49,9 @@ extern int EXPORT_VAR(grub_mm_debug);
> - void grub_mm_dump_free (void);
> - void grub_mm_dump (unsigned lineno);
> -
> -+#define grub_calloc(nmemb, size)      \
> -+  grub_debug_calloc (GRUB_FILE, __LINE__, nmemb, size)
> -+
> - #define grub_malloc(size)     \
> -   grub_debug_malloc (GRUB_FILE, __LINE__, size)
> -
> -@@ -63,6 +67,8 @@ void grub_mm_dump (unsigned lineno);
> - #define grub_free(ptr)        \
> -   grub_debug_free (GRUB_FILE, __LINE__, ptr)
> -
> -+void *EXPORT_FUNC(grub_debug_calloc) (const char *file, int line,
> -+                                    grub_size_t nmemb, grub_size_t size);
> - void *EXPORT_FUNC(grub_debug_malloc) (const char *file, int line,
> -                                     grub_size_t size);
> - void *EXPORT_FUNC(grub_debug_zalloc) (const char *file, int line,
> ---
> -2.14.4
> -
> diff --git a/meta/recipes-bsp/grub/files/determinism.patch
> b/meta/recipes-bsp/grub/files/determinism.patch
> index 3c1f562c71..2828e80975 100644
> --- a/meta/recipes-bsp/grub/files/determinism.patch
> +++ b/meta/recipes-bsp/grub/files/determinism.patch
> @@ -1,6 +1,9 @@
> -The output in moddep.lst generated from syminfo.lst using genmoddep.awk is
> -not deterministic since the order of the dependencies on each line can
> vary
> -depending on how awk sorts the values in the array.
> +From b6f9b3f6fa782807c4a7ec16ee8ef868cdfbf468 Mon Sep 17 00:00:00 2001
> +From: Naveen Saini <naveen.kumar.saini@intel.com>
> +Date: Mon, 15 Mar 2021 14:56:18 +0800
> +Subject: [PATCH] The output in moddep.lst generated from syminfo.lst using
> + genmoddep.awk is not deterministic since the order of the dependencies on
> + each line can vary depending on how awk sorts the values in the array.
>
>  Be deterministic in the output by sorting the dependencies on each line.
>
> @@ -13,11 +16,29 @@ keys of the dict.
>
>  Upstream-Status: Pending
>  Richard Purdie <richard.purdie@linuxfoundation.org>
> +Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
> +---
> + gentpl.py               | 1 +
> + grub-core/genmoddep.awk | 4 +++-
> + util/import_unicode.py  | 2 +-
> + 3 files changed, 5 insertions(+), 2 deletions(-)
>
> -Index: grub-2.04/grub-core/genmoddep.awk
> -===================================================================
> ---- grub-2.04.orig/grub-core/genmoddep.awk
> -+++ grub-2.04/grub-core/genmoddep.awk
> +diff --git a/gentpl.py b/gentpl.py
> +index c86550d4f..589285192 100644
> +--- a/gentpl.py
> ++++ b/gentpl.py
> +@@ -568,6 +568,7 @@ def foreach_platform_value(defn, platform, suffix,
> closure):
> +     for group in RMAP[platform]:
> +         for value in defn.find_all(group + suffix):
> +             r.append(closure(value))
> ++    r.sort()
> +     return ''.join(r)
> +
> + def platform_conditional(platform, closure):
> +diff --git a/grub-core/genmoddep.awk b/grub-core/genmoddep.awk
> +index 04c2863e5..247436392 100644
> +--- a/grub-core/genmoddep.awk
> ++++ b/grub-core/genmoddep.awk
>  @@ -59,7 +59,9 @@ END {
>       }
>       modlist = ""
> @@ -29,22 +50,10 @@ Index: grub-2.04/grub-core/genmoddep.awk
>         modlist = modlist " " depmod;
>         inverse_dependencies[depmod] = inverse_dependencies[depmod] " " mod
>         depcount[mod]++
> -Index: grub-2.04/gentpl.py
> -===================================================================
> ---- grub-2.04.orig/gentpl.py
> -+++ grub-2.04/gentpl.py
> -@@ -568,6 +568,7 @@ def foreach_platform_value(defn, platfor
> -     for group in RMAP[platform]:
> -         for value in defn.find_all(group + suffix):
> -             r.append(closure(value))
> -+    r.sort()
> -     return ''.join(r)
> -
> - def platform_conditional(platform, closure):
> -Index: grub-2.04/util/import_unicode.py
> -===================================================================
> ---- grub-2.04.orig/util/import_unicode.py
> -+++ grub-2.04/util/import_unicode.py
> +diff --git a/util/import_unicode.py b/util/import_unicode.py
> +index 08f80591e..1f434a069 100644
> +--- a/util/import_unicode.py
> ++++ b/util/import_unicode.py
>  @@ -174,7 +174,7 @@ infile.close ()
>
>   outfile.write ("struct grub_unicode_arabic_shape
> grub_unicode_arabic_shapes[] = {\n ")
> @@ -54,3 +63,6 @@ Index: grub-2.04/util/import_unicode.py
>       try:
>           if arabicsubst[x]['join'] == "DUAL":
>               outfile.write ("{0x%x, 0x%x, 0x%x, 0x%x, 0x%x},\n " %
> (arabicsubst[x][0], arabicsubst[x][1], arabicsubst[x][2],
> arabicsubst[x][3], arabicsubst[x][4]))
> +--
> +2.17.1
> +
> diff --git
> a/meta/recipes-bsp/grub/files/lvm-Add-LVM-cache-logical-volume-handling.patch
> b/meta/recipes-bsp/grub/files/lvm-Add-LVM-cache-logical-volume-handling.patch
> deleted file mode 100644
> index 2b8157f592..0000000000
> ---
> a/meta/recipes-bsp/grub/files/lvm-Add-LVM-cache-logical-volume-handling.patch
> +++ /dev/null
> @@ -1,287 +0,0 @@
> -From 8eb02bcb5897b238b29ff762402bb0c3028f0eab Mon Sep 17 00:00:00 2001
> -From: Michael Chang <mchang@suse.com>
> -Date: Thu, 19 Mar 2020 13:56:13 +0800
> -Subject: [PATCH 3/9] lvm: Add LVM cache logical volume handling
> -
> -The LVM cache logical volume is the logical volume consisting of the
> original
> -and the cache pool logical volume. The original is usually on a larger and
> -slower storage device while the cache pool is on a smaller and faster
> one. The
> -performance of the original volume can be improved by storing the
> frequently
> -used data on the cache pool to utilize the greater performance of faster
> -device.
> -
> -The default cache mode "writethrough" ensures that any data written will
> be
> -stored both in the cache and on the origin LV, therefore grub can be
> straight
> -to read the original lv as no data loss is guarenteed.
> -
> -The second cache mode is "writeback", which delays writing from the cache
> pool
> -back to the origin LV to have increased performance. The drawback is
> potential
> -data loss if losing the associated cache device.
> -
> -During the boot time grub reads the LVM offline i.e. LVM volumes are not
> -activated and mounted, hence it should be fine to read directly from
> original
> -lv since all cached data should have been flushed back in the process of
> taking
> -it offline.
> -
> -It is also not much helpful to the situation by adding fsync calls to the
> -install code. The fsync did not force to write back dirty cache to the
> original
> -device and rather it would update associated cache metadata to complete
> the
> -write transaction with the cache device. IOW the writes to cached blocks
> still
> -go only to the cache device.
> -
> -To write back dirty cache, as LVM cache did not support dirty cache flush
> per
> -block range, there'no way to do it for file. On the other hand the
> "cleaner"
> -policy is implemented and can be used to write back "all" dirty blocks in
> a
> -cache, which effectively drain all dirty cache gradually to attain and
> last in
> -the "clean" state, which can be useful for shrinking or decommissioning a
> -cache. The result and effect is not what we are looking for here.
> -
> -In conclusion, as it seems no way to enforce file writes to the original
> -device, grub may suffer from power failure as it cannot assemble the cache
> -device and read the dirty data from it. However since the case is only
> -applicable to writeback mode which is sensitive to data lost in nature,
> I'd
> -still like to propose my (relatively simple) patch and treat reading dirty
> -cache as improvement.
> -
> -Upstream-Status: Backport [commit 0454b0445393aafc5600e92ef0c39494e333b135
> -from https://git.savannah.gnu.org/git/grub.git]
> -
> -Signed-off-by: Michael Chang <mchang@suse.com>
> -Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> -Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
> ----
> - grub-core/disk/lvm.c | 190
> +++++++++++++++++++++++++++++++++++++++++++++++++++
> - 1 file changed, 190 insertions(+)
> -
> -diff --git a/grub-core/disk/lvm.c b/grub-core/disk/lvm.c
> -index 7b265c7..dc6b83b 100644
> ---- a/grub-core/disk/lvm.c
> -+++ b/grub-core/disk/lvm.c
> -@@ -33,6 +33,14 @@
> -
> - GRUB_MOD_LICENSE ("GPLv3+");
> -
> -+struct cache_lv
> -+{
> -+  struct grub_diskfilter_lv *lv;
> -+  char *cache_pool;
> -+  char *origin;
> -+  struct cache_lv *next;
> -+};
> -+
> -
> - /* Go the string STR and return the number after STR.  *P will point
> -    at the number.  In case STR is not found, *P will be NULL and the
> -@@ -95,6 +103,34 @@ grub_lvm_check_flag (char *p, const char *str, const
> char *flag)
> -     }
> - }
> -
> -+static void
> -+grub_lvm_free_cache_lvs (struct cache_lv *cache_lvs)
> -+{
> -+  struct cache_lv *cache;
> -+
> -+  while ((cache = cache_lvs))
> -+    {
> -+      cache_lvs = cache_lvs->next;
> -+
> -+      if (cache->lv)
> -+      {
> -+        unsigned int i;
> -+
> -+        for (i = 0; i < cache->lv->segment_count; ++i)
> -+          if (cache->lv->segments)
> -+            grub_free (cache->lv->segments[i].nodes);
> -+        grub_free (cache->lv->segments);
> -+        grub_free (cache->lv->fullname);
> -+        grub_free (cache->lv->idname);
> -+        grub_free (cache->lv->name);
> -+      }
> -+      grub_free (cache->lv);
> -+      grub_free (cache->origin);
> -+      grub_free (cache->cache_pool);
> -+      grub_free (cache);
> -+    }
> -+}
> -+
> - static struct grub_diskfilter_vg *
> - grub_lvm_detect (grub_disk_t disk,
> -                struct grub_diskfilter_pv_id *id,
> -@@ -242,6 +278,8 @@ grub_lvm_detect (grub_disk_t disk,
> -
> -   if (! vg)
> -     {
> -+      struct cache_lv *cache_lvs = NULL;
> -+
> -       /* First time we see this volume group. We've to create the
> -        whole volume group structure. */
> -       vg = grub_malloc (sizeof (*vg));
> -@@ -671,6 +709,106 @@ grub_lvm_detect (grub_disk_t disk,
> -                         seg->nodes[seg->node_count - 1].name = tmp;
> -                       }
> -                   }
> -+                else if (grub_memcmp (p, "cache\"",
> -+                                 sizeof ("cache\"") - 1) == 0)
> -+                  {
> -+                    struct cache_lv *cache = NULL;
> -+
> -+                    char *p2, *p3;
> -+                    grub_size_t sz;
> -+
> -+                    cache = grub_zalloc (sizeof (*cache));
> -+                    if (!cache)
> -+                      goto cache_lv_fail;
> -+                    cache->lv = grub_zalloc (sizeof (*cache->lv));
> -+                    if (!cache->lv)
> -+                      goto cache_lv_fail;
> -+                    grub_memcpy (cache->lv, lv, sizeof (*cache->lv));
> -+
> -+                    if (lv->fullname)
> -+                      {
> -+                        cache->lv->fullname = grub_strdup (lv->fullname);
> -+                        if (!cache->lv->fullname)
> -+                          goto cache_lv_fail;
> -+                      }
> -+                    if (lv->idname)
> -+                      {
> -+                        cache->lv->idname = grub_strdup (lv->idname);
> -+                        if (!cache->lv->idname)
> -+                          goto cache_lv_fail;
> -+                      }
> -+                    if (lv->name)
> -+                      {
> -+                        cache->lv->name = grub_strdup (lv->name);
> -+                        if (!cache->lv->name)
> -+                          goto cache_lv_fail;
> -+                      }
> -+
> -+                    skip_lv = 1;
> -+
> -+                    p2 = grub_strstr (p, "cache_pool = \"");
> -+                    if (!p2)
> -+                      goto cache_lv_fail;
> -+
> -+                    p2 = grub_strchr (p2, '"');
> -+                    if (!p2)
> -+                      goto cache_lv_fail;
> -+
> -+                    p3 = ++p2;
> -+                    p3 = grub_strchr (p3, '"');
> -+                    if (!p3)
> -+                      goto cache_lv_fail;
> -+
> -+                    sz = p3 - p2;
> -+
> -+                    cache->cache_pool = grub_malloc (sz + 1);
> -+                    if (!cache->cache_pool)
> -+                      goto cache_lv_fail;
> -+                    grub_memcpy (cache->cache_pool, p2, sz);
> -+                    cache->cache_pool[sz] = '\0';
> -+
> -+                    p2 = grub_strstr (p, "origin = \"");
> -+                    if (!p2)
> -+                      goto cache_lv_fail;
> -+
> -+                    p2 = grub_strchr (p2, '"');
> -+                    if (!p2)
> -+                      goto cache_lv_fail;
> -+
> -+                    p3 = ++p2;
> -+                    p3 = grub_strchr (p3, '"');
> -+                    if (!p3)
> -+                      goto cache_lv_fail;
> -+
> -+                    sz = p3 - p2;
> -+
> -+                    cache->origin = grub_malloc (sz + 1);
> -+                    if (!cache->origin)
> -+                      goto cache_lv_fail;
> -+                    grub_memcpy (cache->origin, p2, sz);
> -+                    cache->origin[sz] = '\0';
> -+
> -+                    cache->next = cache_lvs;
> -+                    cache_lvs = cache;
> -+                    break;
> -+
> -+                  cache_lv_fail:
> -+                    if (cache)
> -+                      {
> -+                        grub_free (cache->origin);
> -+                        grub_free (cache->cache_pool);
> -+                        if (cache->lv)
> -+                          {
> -+                            grub_free (cache->lv->fullname);
> -+                            grub_free (cache->lv->idname);
> -+                            grub_free (cache->lv->name);
> -+                          }
> -+                        grub_free (cache->lv);
> -+                        grub_free (cache);
> -+                      }
> -+                    grub_lvm_free_cache_lvs (cache_lvs);
> -+                    goto fail4;
> -+                  }
> -                 else
> -                   {
> - #ifdef GRUB_UTIL
> -@@ -747,6 +885,58 @@ grub_lvm_detect (grub_disk_t disk,
> -             }
> -
> -       }
> -+
> -+      {
> -+      struct cache_lv *cache;
> -+
> -+      for (cache = cache_lvs; cache; cache = cache->next)
> -+        {
> -+          struct grub_diskfilter_lv *lv;
> -+
> -+          for (lv = vg->lvs; lv; lv = lv->next)
> -+            if (grub_strcmp (lv->name, cache->origin) == 0)
> -+              break;
> -+          if (lv)
> -+            {
> -+              cache->lv->segments = grub_malloc (lv->segment_count *
> sizeof (*lv->segments));
> -+              if (!cache->lv->segments)
> -+                {
> -+                  grub_lvm_free_cache_lvs (cache_lvs);
> -+                  goto fail4;
> -+                }
> -+              grub_memcpy (cache->lv->segments, lv->segments,
> lv->segment_count * sizeof (*lv->segments));
> -+
> -+              for (i = 0; i < lv->segment_count; ++i)
> -+                {
> -+                  struct grub_diskfilter_node *nodes =
> lv->segments[i].nodes;
> -+                  grub_size_t node_count = lv->segments[i].node_count;
> -+
> -+                  cache->lv->segments[i].nodes = grub_malloc (node_count
> * sizeof (*nodes));
> -+                  if (!cache->lv->segments[i].nodes)
> -+                    {
> -+                      for (j = 0; j < i; ++j)
> -+                        grub_free (cache->lv->segments[j].nodes);
> -+                      grub_free (cache->lv->segments);
> -+                      cache->lv->segments = NULL;
> -+                      grub_lvm_free_cache_lvs (cache_lvs);
> -+                      goto fail4;
> -+                    }
> -+                  grub_memcpy (cache->lv->segments[i].nodes, nodes,
> node_count * sizeof (*nodes));
> -+                }
> -+
> -+              if (cache->lv->segments)
> -+                {
> -+                  cache->lv->segment_count = lv->segment_count;
> -+                  cache->lv->vg = vg;
> -+                  cache->lv->next = vg->lvs;
> -+                  vg->lvs = cache->lv;
> -+                  cache->lv = NULL;
> -+                }
> -+            }
> -+        }
> -+      }
> -+
> -+      grub_lvm_free_cache_lvs (cache_lvs);
> -       if (grub_diskfilter_vg_register (vg))
> -       goto fail4;
> -     }
> ---
> -2.14.4
> -
> diff --git
> a/meta/recipes-bsp/grub/files/safemath-Add-some-arithmetic-primitives-that-check-f.patch
> b/meta/recipes-bsp/grub/files/safemath-Add-some-arithmetic-primitives-that-check-f.patch
> deleted file mode 100644
> index 29021e8d8f..0000000000
> ---
> a/meta/recipes-bsp/grub/files/safemath-Add-some-arithmetic-primitives-that-check-f.patch
> +++ /dev/null
> @@ -1,94 +0,0 @@
> -From 06c361a71c4998635493610e5d76d0d223925251 Mon Sep 17 00:00:00 2001
> -From: Peter Jones <pjones@redhat.com>
> -Date: Mon, 15 Jun 2020 10:58:42 -0400
> -Subject: [PATCH 5/9] safemath: Add some arithmetic primitives that check
> for
> - overflow
> -
> -This adds a new header, include/grub/safemath.h, that includes easy to
> -use wrappers for __builtin_{add,sub,mul}_overflow() declared like:
> -
> -  bool OP(a, b, res)
> -
> -where OP is grub_add, grub_sub or grub_mul. OP() returns true in the
> -case where the operation would overflow and res is not modified.
> -Otherwise, false is returned and the operation is executed.
> -
> -These arithmetic primitives require newer compiler versions. So, bump
> -these requirements in the INSTALL file too.
> -
> -Upstream-Status: Backport [commit 68708c4503018d61dbcce7ac11cbb511d6425f4d
> -from https://git.savannah.gnu.org/git/grub.git]
> -
> -Signed-off-by: Peter Jones <pjones@redhat.com>
> -Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> -[YL: omit the change to INSTALL from original patch]
> -Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
> ----
> - include/grub/compiler.h |  8 ++++++++
> - include/grub/safemath.h | 37 +++++++++++++++++++++++++++++++++++++
> - 2 files changed, 45 insertions(+)
> - create mode 100644 include/grub/safemath.h
> -
> -diff --git a/include/grub/compiler.h b/include/grub/compiler.h
> -index c9e1d7a..8f3be3a 100644
> ---- a/include/grub/compiler.h
> -+++ b/include/grub/compiler.h
> -@@ -48,4 +48,12 @@
> - #  define WARN_UNUSED_RESULT
> - #endif
> -
> -+#if defined(__clang__) && defined(__clang_major__) &&
> defined(__clang_minor__)
> -+#  define CLANG_PREREQ(maj,min) \
> -+          ((__clang_major__ > (maj)) || \
> -+         (__clang_major__ == (maj) && __clang_minor__ >= (min)))
> -+#else
> -+#  define CLANG_PREREQ(maj,min) 0
> -+#endif
> -+
> - #endif /* ! GRUB_COMPILER_HEADER */
> -diff --git a/include/grub/safemath.h b/include/grub/safemath.h
> -new file mode 100644
> -index 0000000..c17b89b
> ---- /dev/null
> -+++ b/include/grub/safemath.h
> -@@ -0,0 +1,37 @@
> -+/*
> -+ *  GRUB  --  GRand Unified Bootloader
> -+ *  Copyright (C) 2020  Free Software Foundation, Inc.
> -+ *
> -+ *  GRUB is free software: you can redistribute it and/or modify
> -+ *  it under the terms of the GNU General Public License as published by
> -+ *  the Free Software Foundation, either version 3 of the License, or
> -+ *  (at your option) any later version.
> -+ *
> -+ *  GRUB is distributed in the hope that it will be useful,
> -+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -+ *  GNU General Public License for more details.
> -+ *
> -+ *  You should have received a copy of the GNU General Public License
> -+ *  along with GRUB.  If not, see <http://www.gnu.org/licenses/>.
> -+ *
> -+ *  Arithmetic operations that protect against overflow.
> -+ */
> -+
> -+#ifndef GRUB_SAFEMATH_H
> -+#define GRUB_SAFEMATH_H 1
> -+
> -+#include <grub/compiler.h>
> -+
> -+/* These appear in gcc 5.1 and clang 3.8. */
> -+#if GNUC_PREREQ(5, 1) || CLANG_PREREQ(3, 8)
> -+
> -+#define grub_add(a, b, res)   __builtin_add_overflow(a, b, res)
> -+#define grub_sub(a, b, res)   __builtin_sub_overflow(a, b, res)
> -+#define grub_mul(a, b, res)   __builtin_mul_overflow(a, b, res)
> -+
> -+#else
> -+#error gcc 5.1 or newer or clang 3.8 or newer is required
> -+#endif
> -+
> -+#endif /* GRUB_SAFEMATH_H */
> ---
> -2.14.4
> -
> diff --git
> a/meta/recipes-bsp/grub/files/script-Remove-unused-fields-from-grub_script_functio.patch
> b/meta/recipes-bsp/grub/files/script-Remove-unused-fields-from-grub_script_functio.patch
> deleted file mode 100644
> index 84a80d5ffd..0000000000
> ---
> a/meta/recipes-bsp/grub/files/script-Remove-unused-fields-from-grub_script_functio.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From e219bad8cee67b2bb21712df8f055706f8da25d2 Mon Sep 17 00:00:00 2001
> -From: Chris Coulson <chris.coulson@canonical.com>
> -Date: Fri, 10 Jul 2020 11:21:14 +0100
> -Subject: [PATCH 7/9] script: Remove unused fields from
> grub_script_function
> - struct
> -
> -Upstream-Status: Backport [commit 1a8d9c9b4ab6df7669b5aa36a56477f297825b96
> -from https://git.savannah.gnu.org/git/grub.git]
> -
> -Signed-off-by: Chris Coulson <chris.coulson@canonical.com>
> -Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> -Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
> ----
> - include/grub/script_sh.h | 5 -----
> - 1 file changed, 5 deletions(-)
> -
> -diff --git a/include/grub/script_sh.h b/include/grub/script_sh.h
> -index 360c2be..b382bcf 100644
> ---- a/include/grub/script_sh.h
> -+++ b/include/grub/script_sh.h
> -@@ -359,13 +359,8 @@ struct grub_script_function
> -   /* The script function.  */
> -   struct grub_script *func;
> -
> --  /* The flags.  */
> --  unsigned flags;
> --
> -   /* The next element.  */
> -   struct grub_script_function *next;
> --
> --  int references;
> - };
> - typedef struct grub_script_function *grub_script_function_t;
> -
> ---
> -2.14.4
> -
> diff --git a/meta/recipes-bsp/grub/grub-efi_2.04.bb
> b/meta/recipes-bsp/grub/grub-efi_2.06-rc1.bb
> similarity index 98%
> rename from meta/recipes-bsp/grub/grub-efi_2.04.bb
> rename to meta/recipes-bsp/grub/grub-efi_2.06-rc1.bb
> index 287845c507..240fde7dbf 100644
> --- a/meta/recipes-bsp/grub/grub-efi_2.04.bb
> +++ b/meta/recipes-bsp/grub/grub-efi_2.06-rc1.bb
> @@ -11,8 +11,6 @@ SRC_URI += " \
>             file://cfg \
>            "
>
> -S = "${WORKDIR}/grub-${PV}"
> -
>  # Determine the target arch for the grub modules
>  python __anonymous () {
>      import re
> diff --git a/meta/recipes-bsp/grub/grub2.inc
> b/meta/recipes-bsp/grub/grub2.inc
> index f870d41f6a..9312404ed9 100644
> --- a/meta/recipes-bsp/grub/grub2.inc
> +++ b/meta/recipes-bsp/grub/grub2.inc
> @@ -13,25 +13,20 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>
>  CVE_PRODUCT = "grub2"
>
> -SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
> +SRC_URI = "git://git.savannah.gnu.org/git/grub.git;name=grub \
> +           git://
> git.sv.gnu.org/gnulib.git;destsuffix=git/grub-core/lib/gnulib;name=gnulib
> \
>
> file://0001-Disable-mfpmath-sse-as-well-when-SSE-is-disabled.patch \
>             file://autogen.sh-exclude-pc.patch \
>
> file://grub-module-explicitly-keeps-symbole-.module_license.patch \
>             file://0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch \
> -           file://CVE-2020-10713.patch \
> -
>  file://calloc-Make-sure-we-always-have-an-overflow-checking.patch \
> -           file://lvm-Add-LVM-cache-logical-volume-handling.patch \
> -           file://CVE-2020-14308-calloc-Use-calloc-at-most-places.patch \
> -
>  file://safemath-Add-some-arithmetic-primitives-that-check-f.patch \
> -
>  file://CVE-2020-14309-CVE-2020-14310-CVE-2020-14311-malloc-Use-overflow-checking-primitives-where-we-do-.patch
> \
> -
>  file://script-Remove-unused-fields-from-grub_script_functio.patch \
> -
>  file://CVE-2020-15706-script-Avoid-a-use-after-free-when-redefining-a-func.patch
> \
> -
>  file://CVE-2020-15707-linux-Fix-integer-overflows-in-initrd-size-handling.patch
> \
> -           file://6643507ce30f775008e093580f0c9499dfb2c485.patch \
>             file://determinism.patch \
>  "
> -SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
> -SRC_URI[sha256sum] =
> "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
> +
> +SRCREV_grub = "a53e530f8ad3770c3b03c208c08ae4162f68e3b1"
> +SRCREV_gnulib = "d271f868a8df9bbec29049d01e056481b7a1a263"
> +SRCREV_FORMAT = "grub_gnulib"
> +
> +S = "${WORKDIR}/git"
>
>  DEPENDS = "flex-native bison-native gettext-native"
>
> @@ -76,6 +71,7 @@ export PYTHON = "python3"
>
>  do_configure_prepend() {
>         cd ${S}
> +       ${S}/bootstrap --gnulib-srcdir=${S}/grub-core/lib/gnulib
>         FROM_BOOTSTRAP=1 ${S}/autogen.sh
>         cd ${B}
>  }
> diff --git a/meta/recipes-bsp/grub/grub_2.04.bb b/meta/recipes-bsp/grub/
> grub_2.06-rc1.bb
> similarity index 100%
> rename from meta/recipes-bsp/grub/grub_2.04.bb
> rename to meta/recipes-bsp/grub/grub_2.06-rc1.bb
> --
> 2.17.1
>
>
> 
>
>

--000000000000a6122205bda291f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>oe-core generally waits for the final releases, and d=
oes not provide alphas, betas or rcs. Is the final release coming soon?</di=
v><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Tue, 16 Mar 2021 at 04:41, Naveen Sa=
ini &lt;<a href=3D"mailto:naveen.kumar.saini@intel.com">naveen.kumar.saini@=
intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">2.06 RC1 release have a number of CVEs fixed:<br>
CVE-2020-15705<br>
CVE-2021-3418<br>
CVE-2020-27749<br>
CVE-2021-20233<br>
CVE-2021-20225<br>
CVE-2020-25647<br>
CVE-2020-25632<br>
CVE-2020-27779<br>
CVE-2020-14372<br>
CVE-2020-15707<br>
CVE-2020-15706<br>
CVE-2020-14309<br>
CVE-2020-14310<br>
CVE-2020-14311<br>
CVE-2020-14308<br>
CVE-2020-10713<br>
CVE-2014-4607<br>
<br>
Dropped backported patches.<br>
<br>
Official tar file for 2.06-rc1 is not available, so need to download gnubl=
ib<br>
module additionally in order to build from git repo.<br>
<br>
Signed-off-by: Naveen Saini &lt;<a href=3D"mailto:naveen.kumar.saini@intel=
.com" target=3D"_blank">naveen.kumar.saini@intel.com</a>&gt;<br>
---<br>
=C2=A0...507ce30f775008e093580f0c9499dfb2c485.patch |=C2=A0 =C2=A047 -<br>
=C2=A0.../grub/files/CVE-2020-10713.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A073 -<br>
=C2=A0...308-calloc-Use-calloc-at-most-places.patch | 1863 ---------------=
--<br>
=C2=A0...low-checking-primitives-where-we-do-.patch | 1330 ------------<br=
>
=C2=A0...se-after-free-when-redefining-a-func.patch |=C2=A0 117 --<br>
=C2=A0...er-overflows-in-initrd-size-handling.patch |=C2=A0 177 --<br>
=C2=A0.../grub/files/autogen.sh-exclude-pc.patch=C2=A0 =C2=A0 |=C2=A0 =C2=
=A015 +-<br>
=C2=A0...-we-always-have-an-overflow-checking.patch |=C2=A0 246 ---<br>
=C2=A0meta/recipes-bsp/grub/files/determinism.patch |=C2=A0 =C2=A058 +-<br=
>
=C2=A0...dd-LVM-cache-logical-volume-handling.patch |=C2=A0 287 ---<br>
=C2=A0...e-arithmetic-primitives-that-check-f.patch |=C2=A0 =C2=A094 -<br>
=C2=A0...used-fields-from-grub_script_functio.patch |=C2=A0 =C2=A037 -<br>
=C2=A0...{<a href=3D"http://grub-efi_2.04.bb" rel=3D"noreferrer" target=3D=
"_blank">grub-efi_2.04.bb</a> =3D&gt; <a href=3D"http://grub-efi_2.06-rc1.b=
b" rel=3D"noreferrer" target=3D"_blank">grub-efi_2.06-rc1.bb</a>} |=C2=A0 =
=C2=A0 2 -<br>
=C2=A0meta/recipes-bsp/grub/grub2.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A022 +-<br>
=C2=A0.../grub/{<a href=3D"http://grub_2.04.bb" rel=3D"noreferrer" target=
=3D"_blank">grub_2.04.bb</a> =3D&gt; <a href=3D"http://grub_2.06-rc1.bb" r=
el=3D"noreferrer" target=3D"_blank">grub_2.06-rc1.bb</a>}=C2=A0 =C2=A0|=C2=
=A0 =C2=A0 0<br>
=C2=A015 files changed, 52 insertions(+), 4316 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-bsp/grub/files/6643507ce30f775008e09=
3580f0c9499dfb2c485.patch<br>
=C2=A0delete mode 100644 meta/recipes-bsp/grub/files/CVE-2020-10713.patch<=
br>
=C2=A0delete mode 100644 meta/recipes-bsp/grub/files/CVE-2020-14308-calloc=
-Use-calloc-at-most-places.patch<br>
=C2=A0delete mode 100644 meta/recipes-bsp/grub/files/CVE-2020-14309-CVE-20=
20-14310-CVE-2020-14311-malloc-Use-overflow-checking-primitives-where-we-do=
-.patch<br>
=C2=A0delete mode 100644 meta/recipes-bsp/grub/files/CVE-2020-15706-script=
-Avoid-a-use-after-free-when-redefining-a-func.patch<br>
=C2=A0delete mode 100644 meta/recipes-bsp/grub/files/CVE-2020-15707-linux-=
Fix-integer-overflows-in-initrd-size-handling.patch<br>
=C2=A0delete mode 100644 meta/recipes-bsp/grub/files/calloc-Make-sure-we-a=
lways-have-an-overflow-checking.patch<br>
=C2=A0delete mode 100644 meta/recipes-bsp/grub/files/lvm-Add-LVM-cache-log=
ical-volume-handling.patch<br>
=C2=A0delete mode 100644 meta/recipes-bsp/grub/files/safemath-Add-some-ari=
thmetic-primitives-that-check-f.patch<br>
=C2=A0delete mode 100644 meta/recipes-bsp/grub/files/script-Remove-unused-=
fields-from-grub_script_functio.patch<br>
=C2=A0rename meta/recipes-bsp/grub/{<a href=3D"http://grub-efi_2.04.bb" re=
l=3D"noreferrer" target=3D"_blank">grub-efi_2.04.bb</a> =3D&gt; <a href=3D"=
http://grub-efi_2.06-rc1.bb" rel=3D"noreferrer" target=3D"_blank">grub-efi_=
2.06-rc1.bb</a>} (98%)<br>
=C2=A0rename meta/recipes-bsp/grub/{<a href=3D"http://grub_2.04.bb" rel=3D=
"noreferrer" target=3D"_blank">grub_2.04.bb</a> =3D&gt; <a href=3D"http://g=
rub_2.06-rc1.bb" rel=3D"noreferrer" target=3D"_blank">grub_2.06-rc1.bb</a>}=
 (100%)<br>
<br>
diff --git a/meta/recipes-bsp/grub/files/6643507ce30f775008e093580f0c9499d=
fb2c485.patch b/meta/recipes-bsp/grub/files/6643507ce30f775008e093580f0c949=
9dfb2c485.patch<br>
deleted file mode 100644<br>
index 8aa2091444..0000000000<br>
--- a/meta/recipes-bsp/grub/files/6643507ce30f775008e093580f0c9499dfb2c485=
.patch<br>
+++ /dev/null<br>
@@ -1,47 +0,0 @@<br>
-From 6643507ce30f775008e093580f0c9499dfb2c485 Mon Sep 17 00:00:00 2001<br=
>
-From: Simon Hardy &lt;<a href=3D"mailto:simon.hardy@itdev.co.uk" target=
=3D"_blank">simon.hardy@itdev.co.uk</a>&gt;<br>
-Date: Tue, 24 Mar 2020 13:29:12 +0000<br>
-Subject: build: Fix GRUB i386-pc build with Ubuntu gcc<br>
-<br>
-With recent versions of gcc on Ubuntu a very large lzma_decompress.img fi=
le is<br>
-output. (e.g. 134479600 bytes instead of 2864.) This causes grub-mkimage =
to<br>
-fail with: &quot;error: Decompressor is too big.&quot;<br>
-<br>
-This seems to be caused by a section .note.gnu.property that is placed at=
 an<br>
-offset such that objcopy needs to pad the img file with zeros.<br>
-<br>
-This issue is present on:<br>
-Ubuntu 19.10 with gcc (Ubuntu 8.3.0-26ubuntu1~19.10) 8.3.0<br>
-Ubuntu 19.10 with gcc (Ubuntu 9.2.1-9ubuntu2) 9.2.1 20191008<br>
-<br>
-This issue is not present on:<br>
-Ubuntu 19.10 with gcc (Ubuntu 7.5.0-3ubuntu1~19.10) 7.5.0<br>
-RHEL 8.0 with gcc 8.3.1 20190507 (Red Hat 8.3.1-4)<br>
-<br>
-The issue can be fixed by removing the section using objcopy as shown in<=
br>
-this patch.<br>
-<br>
-Signed-off-by: Simon Hardy &lt;<a href=3D"mailto:simon.hardy@itdev.co.uk"=
 target=3D"_blank">simon.hardy@itdev.co.uk</a>&gt;<br>
-Reviewed-by: Daniel Kiper &lt;<a href=3D"mailto:daniel.kiper@oracle.com" =
target=3D"_blank">daniel.kiper@oracle.com</a>&gt;<br>
----<br>
- gentpl.py | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-Upstream-Status: Backport<br>
-<br>
-diff --git a/gentpl.py b/gentpl.py<br>
-index 387588c05..c86550d4f 100644<br>
---- a/gentpl.py<br>
-+++ b/gentpl.py<br>
-@@ -766,7 +766,7 @@ def image(defn, platform):<br>
- if test x$(TARGET_APPLE_LINKER) =3D x1; then \<br>
-=C2=A0 =C2=A0$(MACHO2IMG) $&lt; $@; \<br>
- else \<br>
--=C2=A0 $(TARGET_OBJCOPY) $(&quot;&quot;&quot; + cname(defn) + &quot;&quo=
t;&quot;_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.b=
uild-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version=
 -R .ARM.exidx $&lt; $@; \<br>
-+=C2=A0 $(TARGET_OBJCOPY) $(&quot;&quot;&quot; + cname(defn) + &quot;&quo=
t;&quot;_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.b=
uild-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version=
 -R .note.gnu.property -R .ARM.exidx $&lt; $@; \<br>
- fi<br>
- &quot;&quot;&quot;)<br>
- <br>
--- <br>
-cgit v1.2.1<br>
-<br>
diff --git a/meta/recipes-bsp/grub/files/CVE-2020-10713.patch b/meta/recip=
es-bsp/grub/files/CVE-2020-10713.patch<br>
deleted file mode 100644<br>
index c507ed3ea8..0000000000<br>
--- a/meta/recipes-bsp/grub/files/CVE-2020-10713.patch<br>
+++ /dev/null<br>
@@ -1,73 +0,0 @@<br>
-From a4d3fbdff1e3ca8f87642af2ac8752c30c617a3e Mon Sep 17 00:00:00 2001<br=
>
-From: Peter Jones &lt;<a href=3D"mailto:pjones@redhat.com" target=3D"_bla=
nk">pjones@redhat.com</a>&gt;<br>
-Date: Wed, 15 Apr 2020 15:45:02 -0400<br>
-Subject: yylex: Make lexer fatal errors actually be fatal<br>
-<br>
-When presented with a command that can&#39;t be tokenized to anything<br>
-smaller than YYLMAX characters, the parser calls YY_FATAL_ERROR(errmsg),<=
br>
-expecting that will stop further processing, as such:<br>
-<br>
-=C2=A0 #define YY_DO_BEFORE_ACTION \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 yyg-&gt;yytext_ptr =3D yy_bp; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 yyleng =3D (int) (yy_cp - yy_bp); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 yyg-&gt;yy_hold_char =3D *yy_cp; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *yy_cp =3D &#39;\0&#39;; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( yyleng &gt;=3D YYLMAX ) \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 YY_FATAL_ERROR( &=
quot;token too large, exceeds YYLMAX&quot; ); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 yy_flex_strncpy( yytext, yyg-&gt;yytext_ptr, =
yyleng + 1 , yyscanner); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 yyg-&gt;yy_c_buf_p =3D yy_cp;<br>
-<br>
-The code flex generates expects that YY_FATAL_ERROR() will either return<=
br>
-for it or do some form of longjmp(), or handle the error in some way at<b=
r>
-least, and so the strncpy() call isn&#39;t in an &quot;else&quot; clause,=
 and thus if<br>
-YY_FATAL_ERROR() is *not* actually fatal, it does the call with the<br>
-questionable limit, and predictable results ensue.<br>
-<br>
-Unfortunately, our implementation of YY_FATAL_ERROR() is:<br>
-<br>
-=C2=A0 =C2=A0#define YY_FATAL_ERROR(msg)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
-=C2=A0 =C2=A0 =C2=A0do {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_printf (_(&quot;fatal error: %s\n&quot;),=
 _(msg));=C2=A0 =C2=A0 =C2=A0\<br>
-=C2=A0 =C2=A0 =C2=A0} while (0)<br>
-<br>
-The same pattern exists in yyless(), and similar problems exist in users<=
br>
-of YY_INPUT(), several places in the main parsing loop,<br>
-yy_get_next_buffer(), yy_load_buffer_state(), yyensure_buffer_stack,<br>
-yy_scan_buffer(), etc.<br>
-<br>
-All of these callers expect YY_FATAL_ERROR() to actually be fatal, and<br=
>
-the things they do if it returns after calling it are wildly unsafe.<br>
-<br>
-Fixes: CVE-2020-10713<br>
-<br>
-Signed-off-by: Peter Jones &lt;<a href=3D"mailto:pjones@redhat.com" targe=
t=3D"_blank">pjones@redhat.com</a>&gt;<br>
-Reviewed-by: Daniel Kiper &lt;<a href=3D"mailto:daniel.kiper@oracle.com" =
target=3D"_blank">daniel.kiper@oracle.com</a>&gt;<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://git.savannah.gnu.org/cgit/g=
rub.git/commit/?id=3Da4d3fbdff1e3ca8f87642af2ac8752c30c617a3e" rel=3D"noref=
errer" target=3D"_blank">https://git.savannah.gnu.org/cgit/grub.git/commit/=
?id=3Da4d3fbdff1e3ca8f87642af2ac8752c30c617a3e</a>]<br>
-CVE: CVE-2020-10713<br>
-Signed-off-by: Chee Yang Lee &lt;<a href=3D"mailto:chee.yang.lee@intel.co=
m" target=3D"_blank">chee.yang.lee@intel.com</a>&gt;<br>
----<br>
- grub-core/script/yylex.l | 4 ++--<br>
- 1 file changed, 2 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/grub-core/script/yylex.l b/grub-core/script/yylex.l<br>
-index 7b44c37b7..b7203c823 100644<br>
---- a/grub-core/script/yylex.l<br>
-+++ b/grub-core/script/yylex.l<br>
-@@ -37,11 +37,11 @@<br>
- <br>
- /* <br>
-=C2=A0 * As we don&#39;t have access to yyscanner, we cannot do much exce=
pt to<br>
-- * print the fatal error.<br>
-+ * print the fatal error and exit.<br>
-=C2=A0 */<br>
- #define YY_FATAL_ERROR(msg)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
-=C2=A0 =C2=A0do {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 \<br>
--=C2=A0 =C2=A0 grub_printf (_(&quot;fatal error: %s\n&quot;), _(msg));=C2=
=
=A0 =C2=A0 =C2=A0\<br>
-+=C2=A0 =C2=A0 grub_fatal (_(&quot;fatal error: %s\n&quot;), _(msg));\<br=
>
-=C2=A0 =C2=A0} while (0)<br>
- <br>
- #define COPY(str, hint)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
--- <br>
-cgit v1.2.1<br>
-<br>
diff --git a/meta/recipes-bsp/grub/files/CVE-2020-14308-calloc-Use-calloc-=
at-most-places.patch b/meta/recipes-bsp/grub/files/CVE-2020-14308-calloc-Us=
e-calloc-at-most-places.patch<br>
deleted file mode 100644<br>
index 637e368cb0..0000000000<br>
--- a/meta/recipes-bsp/grub/files/CVE-2020-14308-calloc-Use-calloc-at-most=
-places.patch<br>
+++ /dev/null<br>
@@ -1,1863 +0,0 @@<br>
-From bcdd6a55952222ec9829a59348240a4f983b0b56 Mon Sep 17 00:00:00 2001<br=
>
-From: Peter Jones &lt;<a href=3D"mailto:pjones@redhat.com" target=3D"_bla=
nk">pjones@redhat.com</a>&gt;<br>
-Date: Mon, 15 Jun 2020 12:26:01 -0400<br>
-Subject: [PATCH 4/9] calloc: Use calloc() at most places<br>
-<br>
-This modifies most of the places we do some form of:<br>
-<br>
-=C2=A0 X =3D malloc(Y * Z);<br>
-<br>
-to use calloc(Y, Z) instead.<br>
-<br>
-Among other issues, this fixes:<br>
-=C2=A0 - allocation of integer overflow in grub_png_decode_image_header()=
<br>
-=C2=A0 =C2=A0 reported by Chris Coulson,<br>
-=C2=A0 - allocation of integer overflow in luks_recover_key()<br>
-=C2=A0 =C2=A0 reported by Chris Coulson,<br>
-=C2=A0 - allocation of integer overflow in grub_lvm_detect()<br>
-=C2=A0 =C2=A0 reported by Chris Coulson.<br>
-<br>
-Fixes: CVE-2020-14308<br>
-<br>
-Signed-off-by: Peter Jones &lt;<a href=3D"mailto:pjones@redhat.com" targe=
t=3D"_blank">pjones@redhat.com</a>&gt;<br>
-Reviewed-by: Daniel Kiper &lt;<a href=3D"mailto:daniel.kiper@oracle.com" =
target=3D"_blank">daniel.kiper@oracle.com</a>&gt;<br>
-<br>
-Upstream-Status: Backport<br>
-CVE: CVE-2020-14308<br>
-<br>
-Reference to upstream patch:<br>
-<a href=3D"https://git.savannah.gnu.org/cgit/grub.git/commit/?id=3Df725fa=
7cb2ece547c5af01eeeecfe8d95802ed41" rel=3D"noreferrer" target=3D"_blank">ht=
tps://git.savannah.gnu.org/cgit/grub.git/commit/?id=3Df725fa7cb2ece547c5af0=
1eeeecfe8d95802ed41</a><br>
-<br>
-[YL: don&#39;t patch on grub-core/lib/json/json.c, which is not existing =
in grub 2.04]<br>
-Signed-off-by: Yongxin Liu &lt;<a href=3D"mailto:yongxin.liu@windriver.co=
m" target=3D"_blank">yongxin.liu@windriver.com</a>&gt;<br>
----<br>
- grub-core/bus/usb/usbhub.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 8 ++++----<br>
- grub-core/commands/efi/lsefisystab.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 ++-<b=
r>
- grub-core/commands/legacycfg.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 6 +++---<br>
- grub-core/commands/menuentry.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 2 +-<br>
- grub-core/commands/nativedisk.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 2 +-<br>
- grub-core/commands/parttool.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 12 +++++++++---<br>
- grub-core/commands/regexp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0|=C2=A0 2 +-<br>
- grub-core/commands/search_wrap.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 2 +-<br>
- grub-core/disk/diskfilter.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0|=C2=A0 4 ++--<br>
- grub-core/disk/ieee1275/ofdisk.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 2 +-<br>
- grub-core/disk/ldm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 | 14 +++++++-------<br>
- grub-core/disk/luks.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
- grub-core/disk/lvm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 | 12 ++++++------<br>
- grub-core/disk/xen/xendisk.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 2 +-<br>
- grub-core/efiemu/loadcore.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0|=C2=A0 2 +-<br>
- grub-core/efiemu/mm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +++---<br>
- grub-core/font/font.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 +--<br>
- grub-core/fs/affs.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +++---<br>
- grub-core/fs/btrfs.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 +++---<br>
- grub-core/fs/hfs.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
- grub-core/fs/hfsplus.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 +++---<br>
- grub-core/fs/iso9660.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
- grub-core/fs/ntfs.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++--<br>
- grub-core/fs/sfs.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
- grub-core/fs/tar.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
- grub-core/fs/udf.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
- grub-core/fs/zfs/zfs.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
- grub-core/gfxmenu/gui_string_util.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 =
+-<br>
- grub-core/gfxmenu/widget-box.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 4 ++--<br>
- grub-core/io/gzio.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
- grub-core/kern/efi/efi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 6 +++---<br>
- grub-core/kern/emu/hostdisk.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 2 +-<br>
- grub-core/kern/fs.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
- grub-core/kern/misc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
- grub-core/kern/parser.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
- grub-core/kern/uboot/uboot.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 2 +-<br>
- grub-core/lib/libgcrypt/cipher/ac.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 8 =
++++----<br>
- grub-core/lib/libgcrypt/cipher/primegen.c |=C2=A0 4 ++--<br>
- grub-core/lib/libgcrypt/cipher/pubkey.c=C2=A0 =C2=A0|=C2=A0 4 ++--<br>
- grub-core/lib/priority_queue.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 2 +-<br>
- grub-core/lib/reed_solomon.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 7 +++----<br>
- grub-core/lib/relocator.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 10 +++++-----<br>
- grub-core/lib/zstd/fse_decompress.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 =
+-<br>
- grub-core/loader/arm/linux.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 2 +-<br>
- grub-core/loader/efi/chainloader.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 =
+-<br>
- grub-core/loader/i386/bsdXX.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 2 +-<br>
- grub-core/loader/i386/xnu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0|=C2=A0 4 ++--<br>
- grub-core/loader/macho.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
- grub-core/loader/multiboot_elfxx.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 =
+-<br>
- grub-core/loader/xnu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
- grub-core/mmap/mmap.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++--<br>
- grub-core/net/bootp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
- grub-core/net/dns.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 +++++-----<br>
- grub-core/net/net.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++--<br>
- grub-core/normal/charset.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 10 +++++-----<br>
- grub-core/normal/cmdline.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 14 +++++++-------<br>
- grub-core/normal/menu_entry.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 14 +++++++-------<br>
- grub-core/normal/menu_text.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 4 ++--<br>
- grub-core/normal/term.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++--<br>
- grub-core/osdep/linux/getroot.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 6 +++---<br>
- grub-core/osdep/unix/config.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 2 +-<br>
- grub-core/osdep/windows/getroot.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 2 +-<br>
- grub-core/osdep/windows/hostdisk.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 =
++--<br>
- grub-core/osdep/windows/init.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 2 +-<br>
- grub-core/osdep/windows/platform.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 =
++--<br>
- grub-core/osdep/windows/relpath.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 2 +-<br>
- grub-core/partmap/gpt.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
- grub-core/partmap/msdos.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
- grub-core/script/execute.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 2 +-<br>
- grub-core/tests/fake_input.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 2 +-<br>
- grub-core/tests/video_checksum.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 6 +++---<br>
- grub-core/video/capture.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
- grub-core/video/emu/sdl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
- grub-core/video/i386/pc/vga.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 2 +-<br>
- grub-core/video/readers/png.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 2 +-<br>
- include/grub/unicode.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
- util/getroot.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
- util/grub-file.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
- util/grub-fstest.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
- util/grub-install-common.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 2 +-<br>
- util/grub-install.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++--<br>
- util/grub-mkimagexx.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 ++----<br>
- util/grub-mkrescue.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
- util/grub-mkstandalone.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
- util/grub-pe2elf.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 12 +++++-------<br>
- util/grub-probe.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++--<br>
- 86 files changed, 178 insertions(+), 177 deletions(-)<br>
-<br>
-diff --git a/grub-core/bus/usb/usbhub.c b/grub-core/bus/usb/usbhub.c<br>
-index 34a7ff1..a06cce3 100644<br>
---- a/grub-core/bus/usb/usbhub.c<br>
-+++ b/grub-core/bus/usb/usbhub.c<br>
-@@ -149,8 +149,8 @@ grub_usb_add_hub (grub_usb_device_t dev)<br>
-=C2=A0 =C2=A0grub_usb_set_configuration (dev, 1);<br>
- <br>
-=C2=A0 =C2=A0dev-&gt;nports =3D hubdesc.portcnt;<br>
--=C2=A0 dev-&gt;children =3D grub_zalloc (hubdesc.portcnt * sizeof (dev-&=
gt;children[0]));<br>
--=C2=A0 dev-&gt;ports =3D grub_zalloc (dev-&gt;nports * sizeof (dev-&gt;p=
orts[0]));<br>
-+=C2=A0 dev-&gt;children =3D grub_calloc (hubdesc.portcnt, sizeof (dev-&g=
t;children[0]));<br>
-+=C2=A0 dev-&gt;ports =3D grub_calloc (dev-&gt;nports, sizeof (dev-&gt;po=
rts[0]));<br>
-=C2=A0 =C2=A0if (!dev-&gt;children || !dev-&gt;ports)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (dev-&gt;children);<br>
-@@ -268,8 +268,8 @@ grub_usb_controller_dev_register_iter (grub_usb_contr=
oller_t controller, void *d<br>
- <br>
-=C2=A0 =C2=A0/* Query the number of ports the root Hub has.=C2=A0 */<br>
-=C2=A0 =C2=A0hub-&gt;nports =3D controller-&gt;dev-&gt;hubports (controll=
er);<br>
--=C2=A0 hub-&gt;devices =3D grub_zalloc (sizeof (hub-&gt;devices[0]) * hu=
b-&gt;nports);<br>
--=C2=A0 hub-&gt;ports =3D grub_zalloc (sizeof (hub-&gt;ports[0]) * hub-&g=
t;nports);<br>
-+=C2=A0 hub-&gt;devices =3D grub_calloc (hub-&gt;nports, sizeof (hub-&gt;=
devices[0]));<br>
-+=C2=A0 hub-&gt;ports =3D grub_calloc (hub-&gt;nports, sizeof (hub-&gt;po=
rts[0]));<br>
-=C2=A0 =C2=A0if (!hub-&gt;devices || !hub-&gt;ports)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (hub-&gt;devices);<br>
-diff --git a/grub-core/commands/efi/lsefisystab.c b/grub-core/commands/ef=
i/lsefisystab.c<br>
-index df10302..cd81507 100644<br>
---- a/grub-core/commands/efi/lsefisystab.c<br>
-+++ b/grub-core/commands/efi/lsefisystab.c<br>
-@@ -71,7 +71,8 @@ grub_cmd_lsefisystab (struct grub_command *cmd __attrib=
ute__ ((unused)),<br>
-=C2=A0 =C2=A0 =C2=A0grub_printf (&quot;Vendor: &quot;);<br>
-=C2=A0 =C2=A0 =C2=A0<br>
-=C2=A0 =C2=A0 =C2=A0for (vendor_utf16 =3D st-&gt;firmware_vendor; *vendor=
_utf16; vendor_utf16++);<br>
--=C2=A0 =C2=A0 vendor =3D grub_malloc (4 * (vendor_utf16 - st-&gt;firmwar=
e_vendor) + 1);<br>
-+=C2=A0 =C2=A0 /* Allocate extra 3 bytes to simplify math. */<br>
-+=C2=A0 =C2=A0 vendor =3D grub_calloc (4, vendor_utf16 - st-&gt;firmware_=
vendor + 1);<br>
-=C2=A0 =C2=A0 =C2=A0if (!vendor)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return grub_errno;<br>
-=C2=A0 =C2=A0 =C2=A0*grub_utf16_to_utf8 ((grub_uint8_t *) vendor, st-&gt;=
firmware_vendor,<br>
-diff --git a/grub-core/commands/legacycfg.c b/grub-core/commands/legacycf=
g.c<br>
-index db7a8f0..5e3ec0d 100644<br>
---- a/grub-core/commands/legacycfg.c<br>
-+++ b/grub-core/commands/legacycfg.c<br>
-@@ -314,7 +314,7 @@ grub_cmd_legacy_kernel (struct grub_command *mycmd __=
attribute__ ((unused)),<br>
-=C2=A0 =C2=A0if (argc &lt; 2)<br>
-=C2=A0 =C2=A0 =C2=A0return grub_error (GRUB_ERR_BAD_ARGUMENT, N_(&quot;fi=
lename expected&quot;));<br>
- <br>
--=C2=A0 cutargs =3D grub_malloc (sizeof (cutargs[0]) * (argc - 1));<br>
-+=C2=A0 cutargs =3D grub_calloc (argc - 1, sizeof (cutargs[0]));<br>
-=C2=A0 =C2=A0if (!cutargs)<br>
-=C2=A0 =C2=A0 =C2=A0return grub_errno;<br>
-=C2=A0 =C2=A0cutargc =3D argc - 1;<br>
-@@ -436,7 +436,7 @@ grub_cmd_legacy_kernel (struct grub_command *mycmd __=
attribute__ ((unused)),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char rbuf[3] =3D &quot;-r=
&quot;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bsdargc =3D cutargc + 2;<=
br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bsdargs =3D grub_malloc (sizeo=
f (bsdargs[0]) * bsdargc);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bsdargs =3D grub_calloc (bsdar=
gc, sizeof (bsdargs[0]));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!bsdargs)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D gru=
b_errno;<br>
-@@ -559,7 +559,7 @@ grub_cmd_legacy_initrdnounzip (struct grub_command *m=
ycmd __attribute__ ((unused<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return grub_error (GRUB_ERR_BAD_ARGUMENT, N_(&=
quot;can&#39;t find command `%s&#39;&quot;),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 &quot;module&quot;);<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 newargs =3D grub_malloc ((argc + 1) * sizeof (newar=
gs[0]));<br>
-+=C2=A0 =C2=A0 =C2=A0 newargs =3D grub_calloc (argc + 1, sizeof (newargs[=
0]));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!newargs)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return grub_errno;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_memcpy (newargs + 1, args, argc * sizeof =
(newargs[0]));<br>
-diff --git a/grub-core/commands/menuentry.c b/grub-core/commands/menuentr=
y.c<br>
-index 2c5363d..9164df7 100644<br>
---- a/grub-core/commands/menuentry.c<br>
-+++ b/grub-core/commands/menuentry.c<br>
-@@ -154,7 +154,7 @@ grub_normal_add_menu_entry (int argc, const char **ar=
gs,<br>
-=C2=A0 =C2=A0 =C2=A0goto fail;<br>
- <br>
-=C2=A0 =C2=A0/* Save argc, args to pass as parameters to block arg later.=
 */<br>
--=C2=A0 menu_args =3D grub_malloc (sizeof (char*) * (argc + 1));<br>
-+=C2=A0 menu_args =3D grub_calloc (argc + 1, sizeof (char *));<br>
-=C2=A0 =C2=A0if (! menu_args)<br>
-=C2=A0 =C2=A0 =C2=A0goto fail;<br>
- <br>
-diff --git a/grub-core/commands/nativedisk.c b/grub-core/commands/natived=
isk.c<br>
-index 699447d..7c8f97f 100644<br>
---- a/grub-core/commands/nativedisk.c<br>
-+++ b/grub-core/commands/nativedisk.c<br>
-@@ -195,7 +195,7 @@ grub_cmd_nativedisk (grub_command_t cmd __attribute__=
 ((unused)),<br>
-=C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0path_prefix =3D prefix;<br>
- <br>
--=C2=A0 mods =3D grub_malloc (argc * sizeof (mods[0]));<br>
-+=C2=A0 mods =3D grub_calloc (argc, sizeof (mods[0]));<br>
-=C2=A0 =C2=A0if (!mods)<br>
-=C2=A0 =C2=A0 =C2=A0return grub_errno;<br>
- <br>
-diff --git a/grub-core/commands/parttool.c b/grub-core/commands/parttool.=
c<br>
-index 22b46b1..051e313 100644<br>
---- a/grub-core/commands/parttool.c<br>
-+++ b/grub-core/commands/parttool.c<br>
-@@ -59,7 +59,13 @@ grub_parttool_register(const char *part_name,<br>
-=C2=A0 =C2=A0for (nargs =3D 0; args[nargs].name !=3D 0; nargs++);<br>
-=C2=A0 =C2=A0cur-&gt;nargs =3D nargs;<br>
-=C2=A0 =C2=A0cur-&gt;args =3D (struct grub_parttool_argdesc *)<br>
--=C2=A0 =C2=A0 grub_malloc ((nargs + 1) * sizeof (struct grub_parttool_ar=
gdesc));<br>
-+=C2=A0 =C2=A0 grub_calloc (nargs + 1, sizeof (struct grub_parttool_argde=
sc));<br>
-+=C2=A0 if (!cur-&gt;args)<br>
-+=C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 grub_free (cur);<br>
-+=C2=A0 =C2=A0 =C2=A0 curhandle--;<br>
-+=C2=A0 =C2=A0 =C2=A0 return -1;<br>
-+=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0grub_memcpy (cur-&gt;args, args,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (nargs + 1) * sizeof (st=
ruct grub_parttool_argdesc));<br>
- <br>
-@@ -257,7 +263,7 @@ grub_cmd_parttool (grub_command_t cmd __attribute__ (=
(unused)),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return err;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
--=C2=A0 parsed =3D (int *) grub_zalloc (argc * sizeof (int));<br>
-+=C2=A0 parsed =3D (int *) grub_calloc (argc, sizeof (int));<br>
- <br>
-=C2=A0 =C2=A0for (i =3D 1; i &lt; argc; i++)<br>
-=C2=A0 =C2=A0 =C2=A0if (! parsed[i])<br>
-@@ -290,7 +296,7 @@ grub_cmd_parttool (grub_command_t cmd __attribute__ (=
(unused)),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ptool =3D cur;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pargs =3D (struct grub_parttool_args *)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_zalloc (ptool-&gt;nargs * sizeof (struc=
t grub_parttool_args));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_calloc (ptool-&gt;nargs, sizeof (struct=
 grub_parttool_args));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (j =3D i; j &lt; argc; j++)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (! parsed[j])<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-diff --git a/grub-core/commands/regexp.c b/grub-core/commands/regexp.c<br=
>
-index f00b184..4019164 100644<br>
---- a/grub-core/commands/regexp.c<br>
-+++ b/grub-core/commands/regexp.c<br>
-@@ -116,7 +116,7 @@ grub_cmd_regexp (grub_extcmd_context_t ctxt, int argc=
, char **args)<br>
-=C2=A0 =C2=A0if (ret)<br>
-=C2=A0 =C2=A0 =C2=A0goto fail;<br>
- <br>
--=C2=A0 matches =3D grub_zalloc (sizeof (*matches) * (regex.re_nsub + 1))=
;<br>
-+=C2=A0 matches =3D grub_calloc (regex.re_nsub + 1, sizeof (*matches));<b=
r>
-=C2=A0 =C2=A0if (! matches)<br>
-=C2=A0 =C2=A0 =C2=A0goto fail;<br>
- <br>
-diff --git a/grub-core/commands/search_wrap.c b/grub-core/commands/search=
_wrap.c<br>
-index d7fd26b..47fc8eb 100644<br>
---- a/grub-core/commands/search_wrap.c<br>
-+++ b/grub-core/commands/search_wrap.c<br>
-@@ -122,7 +122,7 @@ grub_cmd_search (grub_extcmd_context_t ctxt, int argc=
, char **args)<br>
-=C2=A0 =C2=A0 =C2=A0for (i =3D 0; state[SEARCH_HINT_BAREMETAL].args[i]; i=
++)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0nhints++;<br>
- <br>
--=C2=A0 hints =3D grub_malloc (sizeof (hints[0]) * nhints);<br>
-+=C2=A0 hints =3D grub_calloc (nhints, sizeof (hints[0]));<br>
-=C2=A0 =C2=A0if (!hints)<br>
-=C2=A0 =C2=A0 =C2=A0return grub_errno;<br>
-=C2=A0 =C2=A0j =3D 0;<br>
-diff --git a/grub-core/disk/diskfilter.c b/grub-core/disk/diskfilter.c<br=
>
-index c3b578a..68ca9e0 100644<br>
---- a/grub-core/disk/diskfilter.c<br>
-+++ b/grub-core/disk/diskfilter.c<br>
-@@ -1134,7 +1134,7 @@ grub_diskfilter_make_raid (grub_size_t uuidlen, cha=
r *uuid, int nmemb,<br>
-=C2=A0 =C2=A0array-&gt;lvs-&gt;segments-&gt;node_count =3D nmemb;<br>
-=C2=A0 =C2=A0array-&gt;lvs-&gt;segments-&gt;raid_member_size =3D disk_siz=
e;<br>
-=C2=A0 =C2=A0array-&gt;lvs-&gt;segments-&gt;nodes<br>
--=C2=A0 =C2=A0 =3D grub_zalloc (nmemb * sizeof (array-&gt;lvs-&gt;segment=
s-&gt;nodes[0]));<br>
-+=C2=A0 =C2=A0 =3D grub_calloc (nmemb, sizeof (array-&gt;lvs-&gt;segments=
-&gt;nodes[0]));<br>
-=C2=A0 =C2=A0array-&gt;lvs-&gt;segments-&gt;stripe_size =3D stripe_size;<=
br>
-=C2=A0 =C2=A0for (i =3D 0; i &lt; nmemb; i++)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-@@ -1226,7 +1226,7 @@ insert_array (grub_disk_t disk, const struct grub_d=
iskfilter_pv_id *id,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_partition_t p;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (p =3D disk-&gt;partition; p; p =3D=
 p-&gt;parent)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s++;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 pv-&gt;partmaps =3D xmalloc (s * sizeof (pv-=
&gt;partmaps[0]));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pv-&gt;partmaps =3D xcalloc (s, sizeof (pv-&=
gt;partmaps[0]));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (p =3D disk-&gt;partition; p; p =3D=
 p-&gt;parent)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pv-&gt;partmaps[s++] =3D xstrdup=
 (p-&gt;partmap-&gt;name);<br>
-diff --git a/grub-core/disk/ieee1275/ofdisk.c b/grub-core/disk/ieee1275/o=
fdisk.c<br>
-index f73257e..03674cb 100644<br>
---- a/grub-core/disk/ieee1275/ofdisk.c<br>
-+++ b/grub-core/disk/ieee1275/ofdisk.c<br>
-@@ -297,7 +297,7 @@ dev_iterate (const struct grub_ieee1275_devalias *ali=
as)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Power machines documentation specify 672 as=
 maximum SAS disks in<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 one system. Using a slightly larger va=
lue to be safe. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0table_size =3D 768;<br>
--=C2=A0 =C2=A0 =C2=A0 table =3D grub_malloc (table_size * sizeof (grub_ui=
nt64_t));<br>
-+=C2=A0 =C2=A0 =C2=A0 table =3D grub_calloc (table_size, sizeof (grub_uin=
t64_t));<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!table)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-diff --git a/grub-core/disk/ldm.c b/grub-core/disk/ldm.c<br>
-index 2a22d2d..e632370 100644<br>
---- a/grub-core/disk/ldm.c<br>
-+++ b/grub-core/disk/ldm.c<br>
-@@ -323,8 +323,8 @@ make_vg (grub_disk_t disk,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lv-&gt;segments-&gt;type =3D GRUB_DISKF=
ILTER_MIRROR;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lv-&gt;segments-&gt;node_count =3D 0;<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lv-&gt;segments-&gt;node_alloc =3D 8;<b=
r>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 lv-&gt;segments-&gt;nodes =3D grub_zalloc (s=
izeof (*lv-&gt;segments-&gt;nodes)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* lv-&gt;segments-&gt;node_alloc);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 lv-&gt;segments-&gt;nodes =3D grub_calloc (l=
v-&gt;segments-&gt;node_alloc,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0sizeof (*lv-&gt;segments-&gt;nodes));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!lv-&gt;segments-&gt;nodes)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail2;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D vblk[i].dynamic;<br>
-@@ -543,8 +543,8 @@ make_vg (grub_disk_t disk,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0comp-&gt;segment_alloc =
=3D 8;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0comp-&gt;segment_count =
=3D 0;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 comp-&gt;segments =3D grub_mal=
loc (sizeof (*comp-&gt;segments)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 * comp-&gt;segment_alloc);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 comp-&gt;segments =3D grub_cal=
loc (comp-&gt;segment_alloc,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 sizeof (*comp-&gt;segments));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!comp-&gt;segments)<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail2;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-@@ -590,8 +590,8 @@ make_vg (grub_disk_t disk,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0comp-&gt;segments-&gt;nod=
e_count =3D read_int (ptr + 1, *ptr);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0comp-&gt;segments-&gt;nod=
e_alloc =3D comp-&gt;segments-&gt;node_count;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 comp-&gt;segments-&gt;nodes =
=3D grub_zalloc (sizeof (*comp-&gt;segments-&gt;nodes)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* comp-&gt;segments-&gt;node_alloc);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 comp-&gt;segments-&gt;nodes =
=3D grub_calloc (comp-&gt;segments-&gt;node_alloc,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof (*comp-&gt;segments-&gt;nodes));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!lv-&gt;segments-&gt;=
nodes)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail2;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-@@ -1017,7 +1017,7 @@ grub_util_ldm_embed (struct grub_disk *disk, unsign=
ed int *nsectors,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0*nsectors =3D lv-&gt;size;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (*nsectors &gt; max_nsectors)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0*nsectors =3D max_nsectors;<br>
--=C2=A0 =C2=A0 =C2=A0 *sectors =3D grub_malloc (*nsectors * sizeof (**sec=
tors));<br>
-+=C2=A0 =C2=A0 =C2=A0 *sectors =3D grub_calloc (*nsectors, sizeof (**sect=
ors));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!*sectors)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return grub_errno;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; *nsectors; i++)<br>
-diff --git a/grub-core/disk/luks.c b/grub-core/disk/luks.c<br>
-index 86c50c6..18b3a8b 100644<br>
---- a/grub-core/disk/luks.c<br>
-+++ b/grub-core/disk/luks.c<br>
-@@ -336,7 +336,7 @@ luks_recover_key (grub_disk_t source,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; grub_be_to_cpu32 (header.keyblock[i=
].stripes) &gt; max_stripes)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0max_stripes =3D grub_be_to_cpu32 (header.keybl=
ock[i].stripes);<br>
- <br>
--=C2=A0 split_key =3D grub_malloc (keysize * max_stripes);<br>
-+=C2=A0 split_key =3D grub_calloc (keysize, max_stripes);<br>
-=C2=A0 =C2=A0if (!split_key)<br>
-=C2=A0 =C2=A0 =C2=A0return grub_errno;<br>
- <br>
-diff --git a/grub-core/disk/lvm.c b/grub-core/disk/lvm.c<br>
-index dc6b83b..7b5fbbc 100644<br>
---- a/grub-core/disk/lvm.c<br>
-+++ b/grub-core/disk/lvm.c<br>
-@@ -209,7 +209,7 @@ grub_lvm_detect (grub_disk_t disk,<br>
-=C2=A0 =C2=A0 =C2=A0 first one.=C2=A0 */<br>
- <br>
-=C2=A0 =C2=A0/* Allocate buffer space for the circular worst-case scenari=
o. */<br>
--=C2=A0 metadatabuf =3D grub_malloc (2 * mda_size);<br>
-+=C2=A0 metadatabuf =3D grub_calloc (2, mda_size);<br>
-=C2=A0 =C2=A0if (! metadatabuf)<br>
-=C2=A0 =C2=A0 =C2=A0goto fail;<br>
- <br>
-@@ -464,7 +464,7 @@ grub_lvm_detect (grub_disk_t disk,<br>
- #endif<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto lvs_fa=
il;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lv-&gt;segments =3D grub_zallo=
c (sizeof (*seg) * lv-&gt;segment_count);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lv-&gt;segments =3D grub_callo=
c (lv-&gt;segment_count, sizeof (*seg));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0seg =3D lv-&gt;segments;<=
br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; lv-&=
gt;segment_count; i++)<br>
-@@ -521,8 +521,8 @@ grub_lvm_detect (grub_disk_t disk,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0if (seg-&gt;node_count !=3D 1)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0seg-&gt;stripe_size =3D grub_lvm_getvalue (&amp;p, &quot;stripe_=
size =3D &quot;);<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 se=
g-&gt;nodes =3D grub_zalloc (sizeof (*stripe)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 * seg-&gt;node_count);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 se=
g-&gt;nodes =3D grub_calloc (seg-&gt;node_count,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 sizeof (*stripe));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0stripe =3D seg-&gt;nodes;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0p =3D grub_strstr (p, &quot;stripes =3D [&quot;);<br>
-@@ -898,7 +898,7 @@ grub_lvm_detect (grub_disk_t disk,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (lv)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cache-&gt;lv-&gt;segmen=
ts =3D grub_malloc (lv-&gt;segment_count * sizeof (*lv-&gt;segments));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cache-&gt;lv-&gt;segmen=
ts =3D grub_calloc (lv-&gt;segment_count, sizeof (*lv-&gt;segments));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!cache-&gt;lv-=
&gt;segments)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub=
_lvm_free_cache_lvs (cache_lvs);<br>
-@@ -911,7 +911,7 @@ grub_lvm_detect (grub_disk_t disk,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stru=
ct grub_diskfilter_node *nodes =3D lv-&gt;segments[i].nodes;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub=
_size_t node_count =3D lv-&gt;segments[i].node_count;<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cache-&gt=
;lv-&gt;segments[i].nodes =3D grub_malloc (node_count * sizeof (*nodes));<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cache-&gt=
;lv-&gt;segments[i].nodes =3D grub_calloc (node_count, sizeof (*nodes));<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (=
!cache-&gt;lv-&gt;segments[i].nodes)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0for (j =3D 0; j &lt; i; ++j)<br>
-diff --git a/grub-core/disk/xen/xendisk.c b/grub-core/disk/xen/xendisk.c<=
br>
-index 48476cb..d6612ee 100644<br>
---- a/grub-core/disk/xen/xendisk.c<br>
-+++ b/grub-core/disk/xen/xendisk.c<br>
-@@ -426,7 +426,7 @@ grub_xendisk_init (void)<br>
-=C2=A0 =C2=A0if (!ctr)<br>
-=C2=A0 =C2=A0 =C2=A0return;<br>
- <br>
--=C2=A0 virtdisks =3D grub_malloc (ctr * sizeof (virtdisks[0]));<br>
-+=C2=A0 virtdisks =3D grub_calloc (ctr, sizeof (virtdisks[0]));<br>
-=C2=A0 =C2=A0if (!virtdisks)<br>
-=C2=A0 =C2=A0 =C2=A0return;<br>
-=C2=A0 =C2=A0if (grub_xenstore_dir (&quot;device/vbd&quot;, fill, &amp;ct=
r))<br>
-diff --git a/grub-core/efiemu/loadcore.c b/grub-core/efiemu/loadcore.c<br=
>
-index 44085ef..2b92462 100644<br>
---- a/grub-core/efiemu/loadcore.c<br>
-+++ b/grub-core/efiemu/loadcore.c<br>
-@@ -201,7 +201,7 @@ grub_efiemu_count_symbols (const Elf_Ehdr *e)<br>
- <br>
-=C2=A0 =C2=A0grub_efiemu_nelfsyms =3D (unsigned) s-&gt;sh_size / (unsigne=
d) s-&gt;sh_entsize;<br>
-=C2=A0 =C2=A0grub_efiemu_elfsyms =3D (struct grub_efiemu_elf_sym *)<br>
--=C2=A0 =C2=A0 grub_malloc (sizeof (struct grub_efiemu_elf_sym) * grub_ef=
iemu_nelfsyms);<br>
-+=C2=A0 =C2=A0 grub_calloc (grub_efiemu_nelfsyms, sizeof (struct grub_efi=
emu_elf_sym));<br>
- <br>
-=C2=A0 =C2=A0/* Relocators */<br>
-=C2=A0 =C2=A0for (i =3D 0, s =3D (Elf_Shdr *) ((char *) e + e-&gt;e_shoff=
);<br>
-diff --git a/grub-core/efiemu/mm.c b/grub-core/efiemu/mm.c<br>
-index 52a032f..9b8e0d0 100644<br>
---- a/grub-core/efiemu/mm.c<br>
-+++ b/grub-core/efiemu/mm.c<br>
-@@ -554,11 +554,11 @@ grub_efiemu_mmap_sort_and_uniq (void)<br>
-=C2=A0 =C2=A0/* Initialize variables*/<br>
-=C2=A0 =C2=A0grub_memset (present, 0, sizeof (int) * GRUB_EFI_MAX_MEMORY_=
TYPE);<br>
-=C2=A0 =C2=A0scanline_events =3D (struct grub_efiemu_mmap_scan *)<br>
--=C2=A0 =C2=A0 grub_malloc (sizeof (struct grub_efiemu_mmap_scan) * 2 * m=
map_num);<br>
-+=C2=A0 =C2=A0 grub_calloc (mmap_num, sizeof (struct grub_efiemu_mmap_sca=
n) * 2);<br>
- <br>
-=C2=A0 =C2=A0/* Number of chunks can&#39;t increase more than by factor o=
f 2 */<br>
-=C2=A0 =C2=A0result =3D (grub_efi_memory_descriptor_t *)<br>
--=C2=A0 =C2=A0 grub_malloc (sizeof (grub_efi_memory_descriptor_t) * 2 * m=
map_num);<br>
-+=C2=A0 =C2=A0 grub_calloc (mmap_num, sizeof (grub_efi_memory_descriptor_=
t) * 2);<br>
-=C2=A0 =C2=A0if (!result || !scanline_events)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (result);<br>
-@@ -660,7 +660,7 @@ grub_efiemu_mm_do_alloc (void)<br>
- <br>
-=C2=A0 =C2=A0/* Preallocate mmap */<br>
-=C2=A0 =C2=A0efiemu_mmap =3D (grub_efi_memory_descriptor_t *)<br>
--=C2=A0 =C2=A0 grub_malloc (mmap_reserved_size * sizeof (grub_efi_memory_=
descriptor_t));<br>
-+=C2=A0 =C2=A0 grub_calloc (mmap_reserved_size, sizeof (grub_efi_memory_d=
escriptor_t));<br>
-=C2=A0 =C2=A0if (!efiemu_mmap)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_efiemu_unload ();<br>
-diff --git a/grub-core/font/font.c b/grub-core/font/font.c<br>
-index 85a2925..8e118b3 100644<br>
---- a/grub-core/font/font.c<br>
-+++ b/grub-core/font/font.c<br>
-@@ -293,8 +293,7 @@ load_font_index (grub_file_t file, grub_uint32_t sect=
_length, struct<br>
-=C2=A0 =C2=A0font-&gt;num_chars =3D sect_length / FONT_CHAR_INDEX_ENTRY_S=
IZE;<br>
- <br>
-=C2=A0 =C2=A0/* Allocate the character index array.=C2=A0 */<br>
--=C2=A0 font-&gt;char_index =3D grub_malloc (font-&gt;num_chars<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * sizeof (struct char_index_entr=
y));<br>
-+=C2=A0 font-&gt;char_index =3D grub_calloc (font-&gt;num_chars, sizeof (=
struct char_index_entry));<br>
-=C2=A0 =C2=A0if (!font-&gt;char_index)<br>
-=C2=A0 =C2=A0 =C2=A0return 1;<br>
-=C2=A0 =C2=A0font-&gt;bmp_idx =3D grub_malloc (0x10000 * sizeof (grub_uin=
t16_t));<br>
-diff --git a/grub-core/fs/affs.c b/grub-core/fs/affs.c<br>
-index 6b6a2bc..220b371 100644<br>
---- a/grub-core/fs/affs.c<br>
-+++ b/grub-core/fs/affs.c<br>
-@@ -301,7 +301,7 @@ grub_affs_read_symlink (grub_fshelp_node_t node)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0latin1[symlink_size] =3D 0;<br>
--=C2=A0 utf8 =3D grub_malloc (symlink_size * GRUB_MAX_UTF8_PER_LATIN1 + 1=
);<br>
-+=C2=A0 utf8 =3D grub_calloc (GRUB_MAX_UTF8_PER_LATIN1 + 1, symlink_size)=
;<br>
-=C2=A0 =C2=A0if (!utf8)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (latin1);<br>
-@@ -422,7 +422,7 @@ grub_affs_iterate_dir (grub_fshelp_node_t dir,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
- <br>
--=C2=A0 hashtable =3D grub_zalloc (data-&gt;htsize * sizeof (*hashtable))=
;<br>
-+=C2=A0 hashtable =3D grub_calloc (data-&gt;htsize, sizeof (*hashtable));=
<br>
-=C2=A0 =C2=A0if (!hashtable)<br>
-=C2=A0 =C2=A0 =C2=A0return 1;<br>
- <br>
-@@ -628,7 +628,7 @@ grub_affs_label (grub_device_t device, char **label)<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D file.namelen;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (len &gt; sizeof (<a href=3D"http://file.na=
me" rel=3D"noreferrer" target=3D"_blank">file.name</a>))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D sizeof (<a href=3D"http://file.name" r=
el=3D"noreferrer" target=3D"_blank">file.name</a>);<br>
--=C2=A0 =C2=A0 =C2=A0 *label =3D grub_malloc (len * GRUB_MAX_UTF8_PER_LAT=
IN1 + 1);<br>
-+=C2=A0 =C2=A0 =C2=A0 *label =3D grub_calloc (GRUB_MAX_UTF8_PER_LATIN1 + =
1, len);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (*label)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0*grub_latin1_to_utf8 ((grub_uint8_t *) *label,=
 <a href=3D"http://file.name" rel=3D"noreferrer" target=3D"_blank">file.nam=
e</a>, len) =3D &#39;\0&#39;;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-diff --git a/grub-core/fs/btrfs.c b/grub-core/fs/btrfs.c<br>
-index 48bd3d0..11272ef 100644<br>
---- a/grub-core/fs/btrfs.c<br>
-+++ b/grub-core/fs/btrfs.c<br>
-@@ -413,7 +413,7 @@ lower_bound (struct grub_btrfs_data *data,<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0desc-&gt;allocated =3D 16;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0desc-&gt;depth =3D 0;<br>
--=C2=A0 =C2=A0 =C2=A0 desc-&gt;data =3D grub_malloc (sizeof (desc-&gt;dat=
a[0]) * desc-&gt;allocated);<br>
-+=C2=A0 =C2=A0 =C2=A0 desc-&gt;data =3D grub_calloc (desc-&gt;allocated, =
sizeof (desc-&gt;data[0]));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!desc-&gt;data)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return grub_errno;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-@@ -752,7 +752,7 @@ raid56_read_retry (struct grub_btrfs_data *data,<br>
-=C2=A0 =C2=A0grub_err_t ret =3D GRUB_ERR_OUT_OF_MEMORY;<br>
-=C2=A0 =C2=A0grub_uint64_t i, failed_devices;<br>
- <br>
--=C2=A0 buffers =3D grub_zalloc (sizeof(*buffers) * nstripes);<br>
-+=C2=A0 buffers =3D grub_calloc (nstripes, sizeof (*buffers));<br>
-=C2=A0 =C2=A0if (!buffers)<br>
-=C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
- <br>
-@@ -2160,7 +2160,7 @@ grub_btrfs_embed (grub_device_t device __attribute_=
_ ((unused)),<br>
-=C2=A0 =C2=A0*nsectors =3D 64 * 2 - 1;<br>
-=C2=A0 =C2=A0if (*nsectors &gt; max_nsectors)<br>
-=C2=A0 =C2=A0 =C2=A0*nsectors =3D max_nsectors;<br>
--=C2=A0 *sectors =3D grub_malloc (*nsectors * sizeof (**sectors));<br>
-+=C2=A0 *sectors =3D grub_calloc (*nsectors, sizeof (**sectors));<br>
-=C2=A0 =C2=A0if (!*sectors)<br>
-=C2=A0 =C2=A0 =C2=A0return grub_errno;<br>
-=C2=A0 =C2=A0for (i =3D 0; i &lt; *nsectors; i++)<br>
-diff --git a/grub-core/fs/hfs.c b/grub-core/fs/hfs.c<br>
-index ac0a409..3fe842b 100644<br>
---- a/grub-core/fs/hfs.c<br>
-+++ b/grub-core/fs/hfs.c<br>
-@@ -1360,7 +1360,7 @@ grub_hfs_label (grub_device_t device, char **label)=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_size_t len =3D data-&gt;sblock.volname[0]=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (len &gt; sizeof (data-&gt;sblock.volname) =
- 1)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D sizeof (data-&gt;sblock.volname) - 1;<=
br>
--=C2=A0 =C2=A0 =C2=A0 *label =3D grub_malloc (len * MAX_UTF8_PER_MAC_ROMA=
N + 1);<br>
-+=C2=A0 =C2=A0 =C2=A0 *label =3D grub_calloc (MAX_UTF8_PER_MAC_ROMAN + 1,=
 len);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (*label)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0macroman_to_utf8 (*label, data-&gt;sblock.voln=
ame + 1,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0len + 1, 0);<br>
-diff --git a/grub-core/fs/hfsplus.c b/grub-core/fs/hfsplus.c<br>
-index 54786bb..dae43be 100644<br>
---- a/grub-core/fs/hfsplus.c<br>
-+++ b/grub-core/fs/hfsplus.c<br>
-@@ -720,7 +720,7 @@ list_nodes (void *record, void *hook_arg)<br>
-=C2=A0 =C2=A0if (! filename)<br>
-=C2=A0 =C2=A0 =C2=A0return 0;<br>
- <br>
--=C2=A0 keyname =3D grub_malloc (grub_be_to_cpu16 (catkey-&gt;namelen) * =
sizeof (*keyname));<br>
-+=C2=A0 keyname =3D grub_calloc (grub_be_to_cpu16 (catkey-&gt;namelen), s=
izeof (*keyname));<br>
-=C2=A0 =C2=A0if (!keyname)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (filename);<br>
-@@ -1007,7 +1007,7 @@ grub_hfsplus_label (grub_device_t device, char **la=
bel)<br>
-=C2=A0 =C2=A0 =C2=A0grub_hfsplus_btree_recptr (&amp;data-&gt;catalog_tree=
, node, ptr);<br>
- <br>
-=C2=A0 =C2=A0label_len =3D grub_be_to_cpu16 (catkey-&gt;namelen);<br>
--=C2=A0 label_name =3D grub_malloc (label_len * sizeof (*label_name));<br=
>
-+=C2=A0 label_name =3D grub_calloc (label_len, sizeof (*label_name));<br>
-=C2=A0 =C2=A0if (!label_name)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (node);<br>
-@@ -1029,7 +1029,7 @@ grub_hfsplus_label (grub_device_t device, char **la=
bel)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
- <br>
--=C2=A0 *label =3D grub_malloc (label_len * GRUB_MAX_UTF8_PER_UTF16 + 1);=
<br>
-+=C2=A0 *label =3D grub_calloc (label_len, GRUB_MAX_UTF8_PER_UTF16 + 1);<=
br>
-=C2=A0 =C2=A0if (! *label)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (label_name);<br>
-diff --git a/grub-core/fs/iso9660.c b/grub-core/fs/iso9660.c<br>
-index 49c0c63..4f1b52a 100644<br>
---- a/grub-core/fs/iso9660.c<br>
-+++ b/grub-core/fs/iso9660.c<br>
-@@ -331,7 +331,7 @@ grub_iso9660_convert_string (grub_uint8_t *us, int le=
n)<br>
-=C2=A0 =C2=A0int i;<br>
-=C2=A0 =C2=A0grub_uint16_t t[MAX_NAMELEN / 2 + 1];<br>
- <br>
--=C2=A0 p =3D grub_malloc (len * GRUB_MAX_UTF8_PER_UTF16 + 1);<br>
-+=C2=A0 p =3D grub_calloc (len, GRUB_MAX_UTF8_PER_UTF16 + 1);<br>
-=C2=A0 =C2=A0if (! p)<br>
-=C2=A0 =C2=A0 =C2=A0return NULL;<br>
- <br>
-diff --git a/grub-core/fs/ntfs.c b/grub-core/fs/ntfs.c<br>
-index fc4e1f6..2f34f76 100644<br>
---- a/grub-core/fs/ntfs.c<br>
-+++ b/grub-core/fs/ntfs.c<br>
-@@ -556,8 +556,8 @@ get_utf8 (grub_uint8_t *in, grub_size_t len)<br>
-=C2=A0 =C2=A0grub_uint16_t *tmp;<br>
-=C2=A0 =C2=A0grub_size_t i;<br>
- <br>
--=C2=A0 buf =3D grub_malloc (len * GRUB_MAX_UTF8_PER_UTF16 + 1);<br>
--=C2=A0 tmp =3D grub_malloc (len * sizeof (tmp[0]));<br>
-+=C2=A0 buf =3D grub_calloc (len, GRUB_MAX_UTF8_PER_UTF16 + 1);<br>
-+=C2=A0 tmp =3D grub_calloc (len, sizeof (tmp[0]));<br>
-=C2=A0 =C2=A0if (!buf || !tmp)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (buf);<br>
-diff --git a/grub-core/fs/sfs.c b/grub-core/fs/sfs.c<br>
-index 50c1fe7..90f7fb3 100644<br>
---- a/grub-core/fs/sfs.c<br>
-+++ b/grub-core/fs/sfs.c<br>
-@@ -266,7 +266,7 @@ grub_sfs_read_block (grub_fshelp_node_t node, grub_di=
sk_addr_t fileblock)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0node-&gt;next_extent =3D node-&gt;block;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0node-&gt;cache_size =3D 0;<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 node-&gt;cache =3D grub_malloc (sizeof (node-&gt;ca=
che[0]) * cache_size);<br>
-+=C2=A0 =C2=A0 =C2=A0 node-&gt;cache =3D grub_calloc (cache_size, sizeof =
(node-&gt;cache[0]));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!node-&gt;cache)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_errno =3D 0;<br>
-diff --git a/grub-core/fs/tar.c b/grub-core/fs/tar.c<br>
-index 7d63e0c..c551ed6 100644<br>
---- a/grub-core/fs/tar.c<br>
-+++ b/grub-core/fs/tar.c<br>
-@@ -120,7 +120,7 @@ grub_cpio_find_file (struct grub_archelp_data *data, =
char **name,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (data-&gt;linkname_alloc &lt; linksi=
ze + 1)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *n;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 n =3D grub_malloc (2 * (linksi=
ze + 1));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 n =3D grub_calloc (2, linksize=
 + 1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!n)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return grub_errno;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (data-&gt;linkn=
ame);<br>
-diff --git a/grub-core/fs/udf.c b/grub-core/fs/udf.c<br>
-index dc8b6e2..a837616 100644<br>
---- a/grub-core/fs/udf.c<br>
-+++ b/grub-core/fs/udf.c<br>
-@@ -873,7 +873,7 @@ read_string (const grub_uint8_t *raw, grub_size_t sz,=
 char *outbuf)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned i;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0utf16len =3D sz - 1;<br>
--=C2=A0 =C2=A0 =C2=A0 utf16 =3D grub_malloc (utf16len * sizeof (utf16[0])=
);<br>
-+=C2=A0 =C2=A0 =C2=A0 utf16 =3D grub_calloc (utf16len, sizeof (utf16[0]))=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!utf16)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; utf16len; i++)<br>
-@@ -883,7 +883,7 @@ read_string (const grub_uint8_t *raw, grub_size_t sz,=
 char *outbuf)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned i;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0utf16len =3D (sz - 1) / 2;<br>
--=C2=A0 =C2=A0 =C2=A0 utf16 =3D grub_malloc (utf16len * sizeof (utf16[0])=
);<br>
-+=C2=A0 =C2=A0 =C2=A0 utf16 =3D grub_calloc (utf16len, sizeof (utf16[0]))=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!utf16)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; utf16len; i++)<br>
-diff --git a/grub-core/fs/zfs/zfs.c b/grub-core/fs/zfs/zfs.c<br>
-index 2f72e42..381dde5 100644<br>
---- a/grub-core/fs/zfs/zfs.c<br>
-+++ b/grub-core/fs/zfs/zfs.c<br>
-@@ -3325,7 +3325,7 @@ dnode_get_fullpath (const char *fullpath, struct su=
bvolume *subvol,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0subvol-&gt;nkeys =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0zap_iterate (&amp;keychain_dn, 8, count_zap_ke=
ys, &amp;ctx, data);<br>
--=C2=A0 =C2=A0 =C2=A0 subvol-&gt;keyring =3D grub_zalloc (subvol-&gt;nkey=
s * sizeof (subvol-&gt;keyring[0]));<br>
-+=C2=A0 =C2=A0 =C2=A0 subvol-&gt;keyring =3D grub_calloc (subvol-&gt;nkey=
s, sizeof (subvol-&gt;keyring[0]));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!subvol-&gt;keyring)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (fsname);<br>
-@@ -4336,7 +4336,7 @@ grub_zfs_embed (grub_device_t device __attribute__ =
((unused)),<br>
-=C2=A0 =C2=A0*nsectors =3D (VDEV_BOOT_SIZE &gt;&gt; GRUB_DISK_SECTOR_BITS=
);<br>
-=C2=A0 =C2=A0if (*nsectors &gt; max_nsectors)<br>
-=C2=A0 =C2=A0 =C2=A0*nsectors =3D max_nsectors;<br>
--=C2=A0 *sectors =3D grub_malloc (*nsectors * sizeof (**sectors));<br>
-+=C2=A0 *sectors =3D grub_calloc (*nsectors, sizeof (**sectors));<br>
-=C2=A0 =C2=A0if (!*sectors)<br>
-=C2=A0 =C2=A0 =C2=A0return grub_errno;<br>
-=C2=A0 =C2=A0for (i =3D 0; i &lt; *nsectors; i++)<br>
-diff --git a/grub-core/gfxmenu/gui_string_util.c b/grub-core/gfxmenu/gui_=
string_util.c<br>
-index a9a415e..ba1e1ea 100644<br>
---- a/grub-core/gfxmenu/gui_string_util.c<br>
-+++ b/grub-core/gfxmenu/gui_string_util.c<br>
-@@ -55,7 +55,7 @@ canonicalize_path (const char *path)<br>
-=C2=A0 =C2=A0 =C2=A0if (*p =3D=3D &#39;/&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0components++;<br>
- <br>
--=C2=A0 char **path_array =3D grub_malloc (components * sizeof (*path_arr=
ay));<br>
-+=C2=A0 char **path_array =3D grub_calloc (components, sizeof (*path_arra=
y));<br>
-=C2=A0 =C2=A0if (! path_array)<br>
-=C2=A0 =C2=A0 =C2=A0return 0;<br>
- <br>
-diff --git a/grub-core/gfxmenu/widget-box.c b/grub-core/gfxmenu/widget-bo=
x.c<br>
-index b606028..470597d 100644<br>
---- a/grub-core/gfxmenu/widget-box.c<br>
-+++ b/grub-core/gfxmenu/widget-box.c<br>
-@@ -303,10 +303,10 @@ grub_gfxmenu_create_box (const char *pixmaps_prefix=
,<br>
-=C2=A0 =C2=A0box-&gt;content_height =3D 0;<br>
-=C2=A0 =C2=A0box-&gt;raw_pixmaps =3D<br>
-=C2=A0 =C2=A0 =C2=A0(struct grub_video_bitmap **)<br>
--=C2=A0 =C2=A0 grub_malloc (BOX_NUM_PIXMAPS * sizeof (struct grub_video_b=
itmap *));<br>
-+=C2=A0 =C2=A0 grub_calloc (BOX_NUM_PIXMAPS, sizeof (struct grub_video_bi=
tmap *));<br>
-=C2=A0 =C2=A0box-&gt;scaled_pixmaps =3D<br>
-=C2=A0 =C2=A0 =C2=A0(struct grub_video_bitmap **)<br>
--=C2=A0 =C2=A0 grub_malloc (BOX_NUM_PIXMAPS * sizeof (struct grub_video_b=
itmap *));<br>
-+=C2=A0 =C2=A0 grub_calloc (BOX_NUM_PIXMAPS, sizeof (struct grub_video_bi=
tmap *));<br>
- <br>
-=C2=A0 =C2=A0/* Initialize all pixmap pointers to NULL so that proper des=
truction can<br>
-=C2=A0 =C2=A0 =C2=A0 be performed if an error is encountered partway thro=
ugh construction.=C2=A0 */<br>
-diff --git a/grub-core/io/gzio.c b/grub-core/io/gzio.c<br>
-index 6208a97..43d98a7 100644<br>
---- a/grub-core/io/gzio.c<br>
-+++ b/grub-core/io/gzio.c<br>
-@@ -554,7 +554,7 @@ huft_build (unsigned *b,=C2=A0 =C2=A0/* code lengths =
in bits (all assumed &lt;=3D BMAX) */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0z =3D 1 &lt;&lt; j;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0/* table entries for j-bit table */<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* allocate and link in n=
ew table */<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 q =3D (struct huft *) grub_zal=
loc ((z + 1) * sizeof (struct huft));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 q =3D (struct huft *) grub_cal=
loc (z + 1, sizeof (struct huft));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (! q)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (h)<br>
-diff --git a/grub-core/kern/efi/efi.c b/grub-core/kern/efi/efi.c<br>
-index 6e1ceb9..dc31caa 100644<br>
---- a/grub-core/kern/efi/efi.c<br>
-+++ b/grub-core/kern/efi/efi.c<br>
-@@ -202,7 +202,7 @@ grub_efi_set_variable(const char *var, const grub_efi=
_guid_t *guid,<br>
- <br>
-=C2=A0 =C2=A0len =3D grub_strlen (var);<br>
-=C2=A0 =C2=A0len16 =3D len * GRUB_MAX_UTF16_PER_UTF8;<br>
--=C2=A0 var16 =3D grub_malloc ((len16 + 1) * sizeof (var16[0]));<br>
-+=C2=A0 var16 =3D grub_calloc (len16 + 1, sizeof (var16[0]));<br>
-=C2=A0 =C2=A0if (!var16)<br>
-=C2=A0 =C2=A0 =C2=A0return grub_errno;<br>
-=C2=A0 =C2=A0len16 =3D grub_utf8_to_utf16 (var16, len16, (grub_uint8_t *)=
 var, len, NULL);<br>
-@@ -237,7 +237,7 @@ grub_efi_get_variable (const char *var, const grub_ef=
i_guid_t *guid,<br>
- <br>
-=C2=A0 =C2=A0len =3D grub_strlen (var);<br>
-=C2=A0 =C2=A0len16 =3D len * GRUB_MAX_UTF16_PER_UTF8;<br>
--=C2=A0 var16 =3D grub_malloc ((len16 + 1) * sizeof (var16[0]));<br>
-+=C2=A0 var16 =3D grub_calloc (len16 + 1, sizeof (var16[0]));<br>
-=C2=A0 =C2=A0if (!var16)<br>
-=C2=A0 =C2=A0 =C2=A0return NULL;<br>
-=C2=A0 =C2=A0len16 =3D grub_utf8_to_utf16 (var16, len16, (grub_uint8_t *)=
 var, len, NULL);<br>
-@@ -383,7 +383,7 @@ grub_efi_get_filename (grub_efi_device_path_t *dp0)<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while (len &gt; 0 &amp;&amp; fp-&gt;pat=
h_name[len - 1] =3D=3D 0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len--;<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 dup_name =3D grub_malloc (len * sizeof (*dup=
_name));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dup_name =3D grub_calloc (len, sizeof (*dup_=
name));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!dup_name)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (name);<br>
-diff --git a/grub-core/kern/emu/hostdisk.c b/grub-core/kern/emu/hostdisk.=
c<br>
-index e9ec680..d975265 100644<br>
---- a/grub-core/kern/emu/hostdisk.c<br>
-+++ b/grub-core/kern/emu/hostdisk.c<br>
-@@ -615,7 +615,7 @@ static char *<br>
- grub_util_path_concat_real (size_t n, int ext, va_list ap)<br>
- {<br>
-=C2=A0 =C2=A0size_t totlen =3D 0;<br>
--=C2=A0 char **l =3D xmalloc ((n + ext) * sizeof (l[0]));<br>
-+=C2=A0 char **l =3D xcalloc (n + ext, sizeof (l[0]));<br>
-=C2=A0 =C2=A0char *r, *p, *pi;<br>
-=C2=A0 =C2=A0size_t i;<br>
-=C2=A0 =C2=A0int first =3D 1;<br>
-diff --git a/grub-core/kern/fs.c b/grub-core/kern/fs.c<br>
-index 2b85f49..f90be65 100644<br>
---- a/grub-core/kern/fs.c<br>
-+++ b/grub-core/kern/fs.c<br>
-@@ -151,7 +151,7 @@ grub_fs_blocklist_open (grub_file_t file, const char =
*name)<br>
-=C2=A0 =C2=A0while (p);<br>
- <br>
-=C2=A0 =C2=A0/* Allocate a block list.=C2=A0 */<br>
--=C2=A0 blocks =3D grub_zalloc (sizeof (struct grub_fs_block) * (num + 1)=
);<br>
-+=C2=A0 blocks =3D grub_calloc (num + 1, sizeof (struct grub_fs_block));<=
br>
-=C2=A0 =C2=A0if (! blocks)<br>
-=C2=A0 =C2=A0 =C2=A0return 0;<br>
- <br>
-diff --git a/grub-core/kern/misc.c b/grub-core/kern/misc.c<br>
-index 3b633d5..a7abd36 100644<br>
---- a/grub-core/kern/misc.c<br>
-+++ b/grub-core/kern/misc.c<br>
-@@ -690,7 +690,7 @@ parse_printf_args (const char *fmt0, struct printf_ar=
gs *args,<br>
-=C2=A0 =C2=A0 =C2=A0args-&gt;ptr =3D args-&gt;prealloc;<br>
-=C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
--=C2=A0 =C2=A0 =C2=A0 args-&gt;ptr =3D grub_malloc (args-&gt;count * size=
of (args-&gt;ptr[0]));<br>
-+=C2=A0 =C2=A0 =C2=A0 args-&gt;ptr =3D grub_calloc (args-&gt;count, sizeo=
f (args-&gt;ptr[0]));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!args-&gt;ptr)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_errno =3D GRUB_ERR_NONE;<br>
-diff --git a/grub-core/kern/parser.c b/grub-core/kern/parser.c<br>
-index 78175aa..619db31 100644<br>
---- a/grub-core/kern/parser.c<br>
-+++ b/grub-core/kern/parser.c<br>
-@@ -213,7 +213,7 @@ grub_parser_split_cmdline (const char *cmdline,<br>
-=C2=A0 =C2=A0 =C2=A0return grub_errno;<br>
-=C2=A0 =C2=A0grub_memcpy (args, buffer, bp - buffer);<br>
- <br>
--=C2=A0 *argv =3D grub_malloc (sizeof (char *) * (*argc + 1));<br>
-+=C2=A0 *argv =3D grub_calloc (*argc + 1, sizeof (char *));<br>
-=C2=A0 =C2=A0if (!*argv)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (args);<br>
-diff --git a/grub-core/kern/uboot/uboot.c b/grub-core/kern/uboot/uboot.c<=
br>
-index be4816f..aac8f9a 100644<br>
---- a/grub-core/kern/uboot/uboot.c<br>
-+++ b/grub-core/kern/uboot/uboot.c<br>
-@@ -133,7 +133,7 @@ grub_uboot_dev_enum (void)<br>
-=C2=A0 =C2=A0 =C2=A0return num_devices;<br>
- <br>
-=C2=A0 =C2=A0max_devices =3D 2;<br>
--=C2=A0 enum_devices =3D grub_malloc (sizeof(struct device_info) * max_de=
vices);<br>
-+=C2=A0 enum_devices =3D grub_calloc (max_devices, sizeof(struct device_i=
nfo));<br>
-=C2=A0 =C2=A0if (!enum_devices)<br>
-=C2=A0 =C2=A0 =C2=A0return 0;<br>
- <br>
-diff --git a/grub-core/lib/libgcrypt/cipher/ac.c b/grub-core/lib/libgcryp=
t/cipher/ac.c<br>
-index f5e946a..63f6fcd 100644<br>
---- a/grub-core/lib/libgcrypt/cipher/ac.c<br>
-+++ b/grub-core/lib/libgcrypt/cipher/ac.c<br>
-@@ -185,7 +185,7 @@ ac_data_mpi_copy (gcry_ac_mpi_t *data_mpis, unsigned =
int data_mpis_n,<br>
-=C2=A0 =C2=A0gcry_mpi_t mpi;<br>
-=C2=A0 =C2=A0char *label;<br>
- <br>
--=C2=A0 data_mpis_new =3D gcry_malloc (sizeof (*data_mpis_new) * data_mpi=
s_n);<br>
-+=C2=A0 data_mpis_new =3D gcry_calloc (data_mpis_n, sizeof (*data_mpis_ne=
w));<br>
-=C2=A0 =C2=A0if (! data_mpis_new)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D gcry_error_from_errno (errno);<br>
-@@ -572,7 +572,7 @@ _gcry_ac_data_to_sexp (gcry_ac_data_t data, gcry_sexp=
_t *sexp,<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-=C2=A0 =C2=A0/* Add MPI list.=C2=A0 */<br>
--=C2=A0 arg_list =3D gcry_malloc (sizeof (*arg_list) * (data_n + 1));<br>
-+=C2=A0 arg_list =3D gcry_calloc (data_n + 1, sizeof (*arg_list));<br>
-=C2=A0 =C2=A0if (! arg_list)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D gcry_error_from_errno (errno);<br>
-@@ -1283,7 +1283,7 @@ ac_data_construct (const char *identifier, int incl=
ude_flags,<br>
-=C2=A0 =C2=A0/* We build a list of arguments to pass to<br>
-=C2=A0 =C2=A0 =C2=A0 gcry_sexp_build_array().=C2=A0 */<br>
-=C2=A0 =C2=A0data_length =3D _gcry_ac_data_length (data);<br>
--=C2=A0 arg_list =3D gcry_malloc (sizeof (*arg_list) * (data_length * 2))=
;<br>
-+=C2=A0 arg_list =3D gcry_calloc (data_length, sizeof (*arg_list) * 2);<b=
r>
-=C2=A0 =C2=A0if (! arg_list)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D gcry_error_from_errno (errno);<br>
-@@ -1593,7 +1593,7 @@ _gcry_ac_key_pair_generate (gcry_ac_handle_t handle=
, unsigned int nbits,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0arg_list_n +=3D 2;<br>
- <br>
-=C2=A0 =C2=A0/* Allocate list.=C2=A0 */<br>
--=C2=A0 arg_list =3D gcry_malloc (sizeof (*arg_list) * arg_list_n);<br>
-+=C2=A0 arg_list =3D gcry_calloc (arg_list_n, sizeof (*arg_list));<br>
-=C2=A0 =C2=A0if (! arg_list)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D gcry_error_from_errno (errno);<br>
-diff --git a/grub-core/lib/libgcrypt/cipher/primegen.c b/grub-core/lib/li=
bgcrypt/cipher/primegen.c<br>
-index 2788e34..b12e79b 100644<br>
---- a/grub-core/lib/libgcrypt/cipher/primegen.c<br>
-+++ b/grub-core/lib/libgcrypt/cipher/primegen.c<br>
-@@ -383,7 +383,7 @@ prime_generate_internal (int need_q_factor,<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-=C2=A0 =C2=A0/* Allocate an array to track pool usage. */<br>
--=C2=A0 pool_in_use =3D gcry_malloc (n * sizeof *pool_in_use);<br>
-+=C2=A0 pool_in_use =3D gcry_calloc (n, sizeof *pool_in_use);<br>
-=C2=A0 =C2=A0if (!pool_in_use)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D gpg_err_code_from_errno (errno);<br>
-@@ -765,7 +765,7 @@ gen_prime (unsigned int nbits, int secret, int random=
level,<br>
-=C2=A0 =C2=A0if (nbits &lt; 16)<br>
-=C2=A0 =C2=A0 =C2=A0log_fatal (&quot;can&#39;t generate a prime with less=
 than %d bits\n&quot;, 16);<br>
- <br>
--=C2=A0 mods =3D gcry_xmalloc( no_of_small_prime_numbers * sizeof *mods )=
;<br>
-+=C2=A0 mods =3D gcry_xcalloc( no_of_small_prime_numbers, sizeof *mods);<=
br>
-=C2=A0 =C2=A0/* Make nbits fit into gcry_mpi_t implementation. */<br>
-=C2=A0 =C2=A0val_2=C2=A0 =3D mpi_alloc_set_ui( 2 );<br>
-=C2=A0 =C2=A0val_3 =3D mpi_alloc_set_ui( 3);<br>
-diff --git a/grub-core/lib/libgcrypt/cipher/pubkey.c b/grub-core/lib/libg=
crypt/cipher/pubkey.c<br>
-index 9109821..ca087ad 100644<br>
---- a/grub-core/lib/libgcrypt/cipher/pubkey.c<br>
-+++ b/grub-core/lib/libgcrypt/cipher/pubkey.c<br>
-@@ -2941,7 +2941,7 @@ gcry_pk_encrypt (gcry_sexp_t *r_ciph, gcry_sexp_t s=
_data, gcry_sexp_t s_pkey)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * array to a format string, so we have to do =
it this way :-(.=C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* FIXME: There is now such a format specifier=
, so we can<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 change the code to be more clear. */<b=
r>
--=C2=A0 =C2=A0 =C2=A0 arg_list =3D malloc (nelem * sizeof *arg_list);<br>
-+=C2=A0 =C2=A0 =C2=A0 arg_list =3D calloc (nelem, sizeof *arg_list);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!arg_list)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D gpg_err_code_from_syserro=
r ();<br>
-@@ -3233,7 +3233,7 @@ gcry_pk_sign (gcry_sexp_t *r_sig, gcry_sexp_t s_has=
h, gcry_sexp_t s_skey)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0strcpy (p, &quot;))&quot;);<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 arg_list =3D malloc (nelem * sizeof *arg_list);<br>
-+=C2=A0 =C2=A0 =C2=A0 arg_list =3D calloc (nelem, sizeof *arg_list);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!arg_list)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D gpg_err_code_from_syserro=
r ();<br>
-diff --git a/grub-core/lib/priority_queue.c b/grub-core/lib/priority_queu=
e.c<br>
-index 659be0b..7d5e7c0 100644<br>
---- a/grub-core/lib/priority_queue.c<br>
-+++ b/grub-core/lib/priority_queue.c<br>
-@@ -92,7 +92,7 @@ grub_priority_queue_new (grub_size_t elsize,<br>
- {<br>
-=C2=A0 =C2=A0struct grub_priority_queue *ret;<br>
-=C2=A0 =C2=A0void *els;<br>
--=C2=A0 els =3D grub_malloc (elsize * 8);<br>
-+=C2=A0 els =3D grub_calloc (8, elsize);<br>
-=C2=A0 =C2=A0if (!els)<br>
-=C2=A0 =C2=A0 =C2=A0return 0;<br>
-=C2=A0 =C2=A0ret =3D (struct grub_priority_queue *) grub_malloc (sizeof (=
*ret));<br>
-diff --git a/grub-core/lib/reed_solomon.c b/grub-core/lib/reed_solomon.c<=
br>
-index ee9fa7b..467305b 100644<br>
---- a/grub-core/lib/reed_solomon.c<br>
-+++ b/grub-core/lib/reed_solomon.c<br>
-@@ -20,6 +20,7 @@<br>
- #include &lt;stdio.h&gt;<br>
- #include &lt;string.h&gt;<br>
- #include &lt;stdlib.h&gt;<br>
-+#define xcalloc calloc<br>
- #define xmalloc malloc<br>
- #define grub_memset memset<br>
- #define grub_memcpy memcpy<br>
-@@ -158,11 +159,9 @@ rs_encode (gf_single_t *data, grub_size_t s, grub_si=
ze_t rs)<br>
-=C2=A0 =C2=A0gf_single_t *rs_polynomial;<br>
-=C2=A0 =C2=A0int i, j;<br>
-=C2=A0 =C2=A0gf_single_t *m;<br>
--=C2=A0 m =3D xmalloc ((s + rs) * sizeof (gf_single_t));<br>
-+=C2=A0 m =3D xcalloc (s + rs, sizeof (gf_single_t));<br>
-=C2=A0 =C2=A0grub_memcpy (m, data, s * sizeof (gf_single_t));<br>
--=C2=A0 grub_memset (m + s, 0, rs * sizeof (gf_single_t));<br>
--=C2=A0 rs_polynomial =3D xmalloc ((rs + 1) * sizeof (gf_single_t));<br>
--=C2=A0 grub_memset (rs_polynomial, 0, (rs + 1) * sizeof (gf_single_t));<=
br>
-+=C2=A0 rs_polynomial =3D xcalloc (rs + 1, sizeof (gf_single_t));<br>
-=C2=A0 =C2=A0rs_polynomial[rs] =3D 1;<br>
-=C2=A0 =C2=A0/* Multiply with X - a^r */<br>
-=C2=A0 =C2=A0for (j =3D 0; j &lt; rs; j++)<br>
-diff --git a/grub-core/lib/relocator.c b/grub-core/lib/relocator.c<br>
-index ea3ebc7..5847aac 100644<br>
---- a/grub-core/lib/relocator.c<br>
-+++ b/grub-core/lib/relocator.c<br>
-@@ -495,9 +495,9 @@ malloc_in_range (struct grub_relocator *rel,<br>
-=C2=A0 =C2=A0}<br>
- #endif<br>
- <br>
--=C2=A0 eventt =3D grub_malloc (maxevents * sizeof (events[0]));<br>
-+=C2=A0 eventt =3D grub_calloc (maxevents, sizeof (events[0]));<br>
-=C2=A0 =C2=A0counter =3D grub_malloc ((DIGITSORT_MASK + 2) * sizeof (coun=
ter[0]));<br>
--=C2=A0 events =3D grub_malloc (maxevents * sizeof (events[0]));<br>
-+=C2=A0 events =3D grub_calloc (maxevents, sizeof (events[0]));<br>
-=C2=A0 =C2=A0if (!events || !eventt || !counter)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_dprintf (&quot;relocator&quot;, &quot;eve=
nts or counter allocation failed %d\n&quot;,<br>
-@@ -963,7 +963,7 @@ malloc_in_range (struct grub_relocator *rel,<br>
- #endif<br>
-=C2=A0 =C2=A0 =C2=A0unsigned cural =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0int oom =3D 0;<br>
--=C2=A0 =C2=A0 res-&gt;subchunks =3D grub_malloc (sizeof (res-&gt;subchun=
ks[0]) * nallocs);<br>
-+=C2=A0 =C2=A0 res-&gt;subchunks =3D grub_calloc (nallocs, sizeof (res-&g=
t;subchunks[0]));<br>
-=C2=A0 =C2=A0 =C2=A0if (!res-&gt;subchunks)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0oom =3D 1;<br>
-=C2=A0 =C2=A0 =C2=A0res-&gt;nsubchunks =3D nallocs;<br>
-@@ -1562,8 +1562,8 @@ grub_relocator_prepare_relocs (struct grub_relocato=
r *rel, grub_addr_t addr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0count[(chunk-&gt;src &amp; 0xff)=
 + 1]++;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 from =3D grub_malloc (nchunks * sizeof (sorted[0]));<br>
--=C2=A0 =C2=A0 to =3D grub_malloc (nchunks * sizeof (sorted[0]));<br>
-+=C2=A0 =C2=A0 from =3D grub_calloc (nchunks, sizeof (sorted[0]));<br>
-+=C2=A0 =C2=A0 to =3D grub_calloc (nchunks, sizeof (sorted[0]));<br>
-=C2=A0 =C2=A0 =C2=A0if (!from || !to)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (from);<br>
-diff --git a/grub-core/lib/zstd/fse_decompress.c b/grub-core/lib/zstd/fse=
_decompress.c<br>
-index 72bbead..2227b84 100644<br>
---- a/grub-core/lib/zstd/fse_decompress.c<br>
-+++ b/grub-core/lib/zstd/fse_decompress.c<br>
-@@ -82,7 +82,7 @@<br>
- FSE_DTable* FSE_createDTable (unsigned tableLog)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0if (tableLog &gt; FSE_TABLELOG_ABSOLUTE_MAX) tableLog=
 =3D FSE_TABLELOG_ABSOLUTE_MAX;<br>
--=C2=A0 =C2=A0 return (FSE_DTable*)malloc( FSE_DTABLE_SIZE_U32(tableLog) =
* sizeof (U32) );<br>
-+=C2=A0 =C2=A0 return (FSE_DTable*)calloc( FSE_DTABLE_SIZE_U32(tableLog),=
 sizeof (U32) );<br>
- }<br>
- <br>
- void FSE_freeDTable (FSE_DTable* dt)<br>
-diff --git a/grub-core/loader/arm/linux.c b/grub-core/loader/arm/linux.c<=
br>
-index 5168491..d70c174 100644<br>
---- a/grub-core/loader/arm/linux.c<br>
-+++ b/grub-core/loader/arm/linux.c<br>
-@@ -78,7 +78,7 @@ linux_prepare_atag (void *target_atag)<br>
- <br>
-=C2=A0 =C2=A0/* some place for cmdline, initrd and terminator.=C2=A0 */<b=
r>
-=C2=A0 =C2=A0tmp_size =3D get_atag_size (atag_orig) + 20 + (arg_size) / 4=
;<br>
--=C2=A0 tmp_atag =3D grub_malloc (tmp_size * sizeof (grub_uint32_t));<br>
-+=C2=A0 tmp_atag =3D grub_calloc (tmp_size, sizeof (grub_uint32_t));<br>
-=C2=A0 =C2=A0if (!tmp_atag)<br>
-=C2=A0 =C2=A0 =C2=A0return grub_errno;<br>
- <br>
-diff --git a/grub-core/loader/efi/chainloader.c b/grub-core/loader/efi/ch=
ainloader.c<br>
-index cd92ea3..daf8c6b 100644<br>
---- a/grub-core/loader/efi/chainloader.c<br>
-+++ b/grub-core/loader/efi/chainloader.c<br>
-@@ -116,7 +116,7 @@ copy_file_path (grub_efi_file_path_device_path_t *fp,=
<br>
-=C2=A0 =C2=A0fp-&gt;header.type =3D GRUB_EFI_MEDIA_DEVICE_PATH_TYPE;<br>
-=C2=A0 =C2=A0fp-&gt;header.subtype =3D GRUB_EFI_FILE_PATH_DEVICE_PATH_SUB=
TYPE;<br>
- <br>
--=C2=A0 path_name =3D grub_malloc (len * GRUB_MAX_UTF16_PER_UTF8 * sizeof=
 (*path_name));<br>
-+=C2=A0 path_name =3D grub_calloc (len, GRUB_MAX_UTF16_PER_UTF8 * sizeof =
(*path_name));<br>
-=C2=A0 =C2=A0if (!path_name)<br>
-=C2=A0 =C2=A0 =C2=A0return;<br>
- <br>
-diff --git a/grub-core/loader/i386/bsdXX.c b/grub-core/loader/i386/bsdXX.=
c<br>
-index af6741d..a8d8bf7 100644<br>
---- a/grub-core/loader/i386/bsdXX.c<br>
-+++ b/grub-core/loader/i386/bsdXX.c<br>
-@@ -48,7 +48,7 @@ read_headers (grub_file_t file, const char *filename, E=
lf_Ehdr *e, char **shdr)<br>
-=C2=A0 =C2=A0if (e-&gt;e_ident[EI_CLASS] !=3D SUFFIX (ELFCLASS))<br>
-=C2=A0 =C2=A0 =C2=A0return grub_error (GRUB_ERR_BAD_OS, N_(&quot;invalid =
arch-dependent ELF magic&quot;));<br>
- <br>
--=C2=A0 *shdr =3D grub_malloc ((grub_uint32_t) e-&gt;e_shnum * e-&gt;e_sh=
entsize);<br>
-+=C2=A0 *shdr =3D grub_calloc (e-&gt;e_shnum, e-&gt;e_shentsize);<br>
-=C2=A0 =C2=A0if (! *shdr)<br>
-=C2=A0 =C2=A0 =C2=A0return grub_errno;<br>
- <br>
-diff --git a/grub-core/loader/i386/xnu.c b/grub-core/loader/i386/xnu.c<br=
>
-index e64ed08..b7d176b 100644<br>
---- a/grub-core/loader/i386/xnu.c<br>
-+++ b/grub-core/loader/i386/xnu.c<br>
-@@ -295,7 +295,7 @@ grub_xnu_devprop_add_property_utf8 (struct grub_xnu_d=
evprop_device_descriptor *d<br>
-=C2=A0 =C2=A0 =C2=A0return grub_errno;<br>
- <br>
-=C2=A0 =C2=A0len =3D grub_strlen (name);<br>
--=C2=A0 utf16 =3D grub_malloc (sizeof (grub_uint16_t) * len);<br>
-+=C2=A0 utf16 =3D grub_calloc (len, sizeof (grub_uint16_t));<br>
-=C2=A0 =C2=A0if (!utf16)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (utf8);<br>
-@@ -331,7 +331,7 @@ grub_xnu_devprop_add_property_utf16 (struct grub_xnu_=
devprop_device_descriptor *<br>
-=C2=A0 =C2=A0grub_uint16_t *utf16;<br>
-=C2=A0 =C2=A0grub_err_t err;<br>
- <br>
--=C2=A0 utf16 =3D grub_malloc (sizeof (grub_uint16_t) * namelen);<br>
-+=C2=A0 utf16 =3D grub_calloc (namelen, sizeof (grub_uint16_t));<br>
-=C2=A0 =C2=A0if (!utf16)<br>
-=C2=A0 =C2=A0 =C2=A0return grub_errno;<br>
-=C2=A0 =C2=A0grub_memcpy (utf16, name, sizeof (grub_uint16_t) * namelen);=
<br>
-diff --git a/grub-core/loader/macho.c b/grub-core/loader/macho.c<br>
-index 085f9c6..05710c4 100644<br>
---- a/grub-core/loader/macho.c<br>
-+++ b/grub-core/loader/macho.c<br>
-@@ -97,7 +97,7 @@ grub_macho_file (grub_file_t file, const char *filename=
, int is_64bit)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (grub_file_seek (macho-&gt;file, sizeof (st=
ruct grub_macho_fat_header))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=3D (grub_off_t) -1)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
--=C2=A0 =C2=A0 =C2=A0 archs =3D grub_malloc (sizeof (struct grub_macho_fa=
t_arch) * narchs);<br>
-+=C2=A0 =C2=A0 =C2=A0 archs =3D grub_calloc (narchs, sizeof (struct grub_=
macho_fat_arch));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!archs)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (grub_file_read (macho-&gt;file, archs,<br>
-diff --git a/grub-core/loader/multiboot_elfxx.c b/grub-core/loader/multib=
oot_elfxx.c<br>
-index 70cd1db..cc68536 100644<br>
---- a/grub-core/loader/multiboot_elfxx.c<br>
-+++ b/grub-core/loader/multiboot_elfxx.c<br>
-@@ -217,7 +217,7 @@ CONCAT(grub_multiboot_load_elf, XX) (mbi_load_data_t =
*mld)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_uint8_t *shdr, *shdrptr;<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 shdr =3D grub_malloc ((grub_uint32_t) ehdr-&gt;e_sh=
num * ehdr-&gt;e_shentsize);<br>
-+=C2=A0 =C2=A0 =C2=A0 shdr =3D grub_calloc (ehdr-&gt;e_shnum, ehdr-&gt;e_=
shentsize);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!shdr)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return grub_errno;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
-diff --git a/grub-core/loader/xnu.c b/grub-core/loader/xnu.c<br>
-index 7f74d1d..77d7060 100644<br>
---- a/grub-core/loader/xnu.c<br>
-+++ b/grub-core/loader/xnu.c<br>
-@@ -800,7 +800,7 @@ grub_cmd_xnu_mkext (grub_command_t cmd __attribute__ =
((unused)),<br>
-=C2=A0 =C2=A0if (grub_be_to_cpu32 (head.magic) =3D=3D GRUB_MACHO_FAT_MAGI=
C)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0narchs =3D grub_be_to_cpu32 (head.nfat_arch);<=
br>
--=C2=A0 =C2=A0 =C2=A0 archs =3D grub_malloc (sizeof (struct grub_macho_fa=
t_arch) * narchs);<br>
-+=C2=A0 =C2=A0 =C2=A0 archs =3D grub_calloc (narchs, sizeof (struct grub_=
macho_fat_arch));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (! archs)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_file_close (file);<br>
-diff --git a/grub-core/mmap/mmap.c b/grub-core/mmap/mmap.c<br>
-index 6a31cba..57b4e9a 100644<br>
---- a/grub-core/mmap/mmap.c<br>
-+++ b/grub-core/mmap/mmap.c<br>
-@@ -143,9 +143,9 @@ grub_mmap_iterate (grub_memory_hook_t hook, void *hoo=
k_data)<br>
- <br>
-=C2=A0 =C2=A0/* Initialize variables. */<br>
-=C2=A0 =C2=A0ctx.scanline_events =3D (struct grub_mmap_scan *)<br>
--=C2=A0 =C2=A0 grub_malloc (sizeof (struct grub_mmap_scan) * 2 * mmap_num=
);<br>
-+=C2=A0 =C2=A0 grub_calloc (mmap_num, sizeof (struct grub_mmap_scan) * 2)=
;<br>
- <br>
--=C2=A0 present =3D grub_zalloc (sizeof (present[0]) * current_priority);=
<br>
-+=C2=A0 present =3D grub_calloc (current_priority, sizeof (present[0]));<=
br>
- <br>
-=C2=A0 =C2=A0if (! ctx.scanline_events || !present)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-diff --git a/grub-core/net/bootp.c b/grub-core/net/bootp.c<br>
-index 04cfbb0..6539572 100644<br>
---- a/grub-core/net/bootp.c<br>
-+++ b/grub-core/net/bootp.c<br>
-@@ -766,7 +766,7 @@ grub_cmd_bootp (struct grub_command *cmd __attribute_=
_ ((unused)),<br>
-=C2=A0 =C2=A0if (ncards =3D=3D 0)<br>
-=C2=A0 =C2=A0 =C2=A0return grub_error (GRUB_ERR_NET_NO_CARD, N_(&quot;no =
network card found&quot;));<br>
- <br>
--=C2=A0 ifaces =3D grub_zalloc (ncards * sizeof (ifaces[0]));<br>
-+=C2=A0 ifaces =3D grub_calloc (ncards, sizeof (ifaces[0]));<br>
-=C2=A0 =C2=A0if (!ifaces)<br>
-=C2=A0 =C2=A0 =C2=A0return grub_errno;<br>
- <br>
-diff --git a/grub-core/net/dns.c b/grub-core/net/dns.c<br>
-index 5d9afe0..e332d5e 100644<br>
---- a/grub-core/net/dns.c<br>
-+++ b/grub-core/net/dns.c<br>
-@@ -285,8 +285,8 @@ recv_hook (grub_net_udp_socket_t sock __attribute__ (=
(unused)),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ptr++;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ptr +=3D 4;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 *data-&gt;addresses =3D grub_malloc (sizeof ((*data-&gt;addresses=
)[0])<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* grub_be_to_cpu16 (head-&gt;anco=
unt));<br>
-+=C2=A0 *data-&gt;addresses =3D grub_calloc (grub_be_to_cpu16 (head-&gt;a=
ncount),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof ((*data-&gt;addresses)[0]=
));<br>
-=C2=A0 =C2=A0if (!*data-&gt;addresses)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_errno =3D GRUB_ERR_NONE;<br>
-@@ -406,8 +406,8 @@ recv_hook (grub_net_udp_socket_t sock __attribute__ (=
(unused)),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dns_cache[h].addresses =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dns_cache[h].name =3D grub_strdup (data-&gt;on=
ame);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dns_cache[h].naddresses =3D *data-&gt;naddress=
es;<br>
--=C2=A0 =C2=A0 =C2=A0 dns_cache[h].addresses =3D grub_malloc (*data-&gt;n=
addresses<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 * sizeof (dns_cache[h].addresses[0]));<br>
-+=C2=A0 =C2=A0 =C2=A0 dns_cache[h].addresses =3D grub_calloc (*data-&gt;n=
addresses,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 sizeof (dns_cache[h].addresses[0]));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dns_cache[h].limit_time =3D grub_get_time_ms (=
) + 1000 * ttl_all;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!dns_cache[h].addresses || !dns_cache[h].n=
ame)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-@@ -479,7 +479,7 @@ grub_net_dns_lookup (const char *name,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
- <br>
--=C2=A0 sockets =3D grub_malloc (sizeof (sockets[0]) * n_servers);<br>
-+=C2=A0 sockets =3D grub_calloc (n_servers, sizeof (sockets[0]));<br>
-=C2=A0 =C2=A0if (!sockets)<br>
-=C2=A0 =C2=A0 =C2=A0return grub_errno;<br>
- <br>
-diff --git a/grub-core/net/net.c b/grub-core/net/net.c<br>
-index d5d726a..38f19df 100644<br>
---- a/grub-core/net/net.c<br>
-+++ b/grub-core/net/net.c<br>
-@@ -333,8 +333,8 @@ grub_cmd_ipv6_autoconf (struct grub_command *cmd __at=
tribute__ ((unused)),<br>
-=C2=A0 =C2=A0 =C2=A0ncards++;<br>
-=C2=A0 =C2=A0}<br>
- <br>
--=C2=A0 ifaces =3D grub_zalloc (ncards * sizeof (ifaces[0]));<br>
--=C2=A0 slaacs =3D grub_zalloc (ncards * sizeof (slaacs[0]));<br>
-+=C2=A0 ifaces =3D grub_calloc (ncards, sizeof (ifaces[0]));<br>
-+=C2=A0 slaacs =3D grub_calloc (ncards, sizeof (slaacs[0]));<br>
-=C2=A0 =C2=A0if (!ifaces || !slaacs)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (ifaces);<br>
-diff --git a/grub-core/normal/charset.c b/grub-core/normal/charset.c<br>
-index b0ab47d..d57fb72 100644<br>
---- a/grub-core/normal/charset.c<br>
-+++ b/grub-core/normal/charset.c<br>
-@@ -203,7 +203,7 @@ grub_utf8_to_ucs4_alloc (const char *msg, grub_uint32=
_t **unicode_msg,<br>
- {<br>
-=C2=A0 =C2=A0grub_size_t msg_len =3D grub_strlen (msg);<br>
- <br>
--=C2=A0 *unicode_msg =3D grub_malloc (msg_len * sizeof (grub_uint32_t));<=
br>
-+=C2=A0 *unicode_msg =3D grub_calloc (msg_len, sizeof (grub_uint32_t));<b=
r>
-=C2=A0 <br>
-=C2=A0 =C2=A0if (!*unicode_msg)<br>
-=C2=A0 =C2=A0 =C2=A0return -1;<br>
-@@ -488,7 +488,7 @@ grub_unicode_aglomerate_comb (const grub_uint32_t *in=
, grub_size_t inlen,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 n =3D grub_malloc (sizeof (n[0=
]) * (out-&gt;ncomb + 1));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 n =3D grub_calloc (out-&gt;nco=
mb + 1, sizeof (n[0]));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!n)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_errno =
=
=3D GRUB_ERR_NONE;<br>
-@@ -842,7 +842,7 @@ grub_bidi_line_logical_to_visual (const grub_uint32_t=
 *logical,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0\<br>
-=C2=A0 =C2=A0}<br>
- <br>
--=C2=A0 visual =3D grub_malloc (sizeof (visual[0]) * logical_len);<br>
-+=C2=A0 visual =3D grub_calloc (logical_len, sizeof (visual[0]));<br>
-=C2=A0 =C2=A0if (!visual)<br>
-=C2=A0 =C2=A0 =C2=A0return -1;<br>
- <br>
-@@ -1165,8 +1165,8 @@ grub_bidi_logical_to_visual (const grub_uint32_t *l=
ogical,<br>
- {<br>
-=C2=A0 =C2=A0const grub_uint32_t *line_start =3D logical, *ptr;<br>
-=C2=A0 =C2=A0struct grub_unicode_glyph *visual_ptr;<br>
--=C2=A0 *visual_out =3D visual_ptr =3D grub_malloc (3 * sizeof (visual_pt=
r[0])<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * (l=
ogical_len + 2));<br>
-+=C2=A0 *visual_out =3D visual_ptr =3D grub_calloc (logical_len + 2,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3 * =
sizeof (visual_ptr[0]));<br>
-=C2=A0 =C2=A0if (!visual_ptr)<br>
-=C2=A0 =C2=A0 =C2=A0return -1;<br>
-=C2=A0 =C2=A0for (ptr =3D logical; ptr &lt;=3D logical + logical_len; ptr=
++)<br>
-diff --git a/grub-core/normal/cmdline.c b/grub-core/normal/cmdline.c<br>
-index c037d50..c57242e 100644<br>
---- a/grub-core/normal/cmdline.c<br>
-+++ b/grub-core/normal/cmdline.c<br>
-@@ -41,7 +41,7 @@ grub_err_t<br>
- grub_set_history (int newsize)<br>
- {<br>
-=C2=A0 =C2=A0grub_uint32_t **old_hist_lines =3D hist_lines;<br>
--=C2=A0 hist_lines =3D grub_malloc (sizeof (grub_uint32_t *) * newsize);<=
br>
-+=C2=A0 hist_lines =3D grub_calloc (newsize, sizeof (grub_uint32_t *));<b=
r>
- <br>
-=C2=A0 =C2=A0/* Copy the old lines into the new buffer.=C2=A0 */<br>
-=C2=A0 =C2=A0if (old_hist_lines)<br>
-@@ -114,7 +114,7 @@ static void<br>
- grub_history_set (int pos, grub_uint32_t *s, grub_size_t len)<br>
- {<br>
-=C2=A0 =C2=A0grub_free (hist_lines[pos]);<br>
--=C2=A0 hist_lines[pos] =3D grub_malloc ((len + 1) * sizeof (grub_uint32_=
t));<br>
-+=C2=A0 hist_lines[pos] =3D grub_calloc (len + 1, sizeof (grub_uint32_t))=
;<br>
-=C2=A0 =C2=A0if (!hist_lines[pos])<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_print_error ();<br>
-@@ -349,7 +349,7 @@ grub_cmdline_get (const char *prompt_translated)<br>
-=C2=A0 =C2=A0char *ret;<br>
-=C2=A0 =C2=A0unsigned nterms;<br>
- <br>
--=C2=A0 buf =3D grub_malloc (max_len * sizeof (grub_uint32_t));<br>
-+=C2=A0 buf =3D grub_calloc (max_len, sizeof (grub_uint32_t));<br>
-=C2=A0 =C2=A0if (!buf)<br>
-=C2=A0 =C2=A0 =C2=A0return 0;<br>
- <br>
-@@ -377,7 +377,7 @@ grub_cmdline_get (const char *prompt_translated)<br>
-=C2=A0 =C2=A0 =C2=A0FOR_ACTIVE_TERM_OUTPUTS(cur)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0nterms++;<br>
- <br>
--=C2=A0 =C2=A0 cl_terms =3D grub_malloc (sizeof (cl_terms[0]) * nterms);<=
br>
-+=C2=A0 =C2=A0 cl_terms =3D grub_calloc (nterms, sizeof (cl_terms[0]));<b=
r>
-=C2=A0 =C2=A0 =C2=A0if (!cl_terms)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (buf);<br>
-@@ -385,7 +385,7 @@ grub_cmdline_get (const char *prompt_translated)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0cl_term_cur =3D cl_terms;<br>
- <br>
--=C2=A0 =C2=A0 unicode_msg =3D grub_malloc (msg_len * sizeof (grub_uint32=
_t));<br>
-+=C2=A0 =C2=A0 unicode_msg =3D grub_calloc (msg_len, sizeof (grub_uint32_=
t));<br>
-=C2=A0 =C2=A0 =C2=A0if (!unicode_msg)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (buf);<br>
-@@ -495,7 +495,7 @@ grub_cmdline_get (const char *prompt_translated)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_uint32_t *ins=
ert;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0insertlen =3D grub=
_strlen (insertu8);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 insert =3D grub_malloc =
((insertlen + 1) * sizeof (grub_uint32_t));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 insert =3D grub_calloc =
(insertlen + 1, sizeof (grub_uint32_t));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!insert)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub=
_free (insertu8);<br>
-@@ -602,7 +602,7 @@ grub_cmdline_get (const char *prompt_translated)<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (kill_buf);<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kill_buf =3D grub_malloc ((n +=
 1) * sizeof(grub_uint32_t));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kill_buf =3D grub_calloc (n + =
1, sizeof (grub_uint32_t));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (grub_errno)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_print_=
error ();<br>
-diff --git a/grub-core/normal/menu_entry.c b/grub-core/normal/menu_entry.=
c<br>
-index cdf3590..1993995 100644<br>
---- a/grub-core/normal/menu_entry.c<br>
-+++ b/grub-core/normal/menu_entry.c<br>
-@@ -95,8 +95,8 @@ init_line (struct screen *screen, struct line *linep)<b=
r>
- {<br>
-=C2=A0 =C2=A0linep-&gt;len =3D 0;<br>
-=C2=A0 =C2=A0linep-&gt;max_len =3D 80;<br>
--=C2=A0 linep-&gt;buf =3D grub_malloc ((linep-&gt;max_len + 1) * sizeof (=
linep-&gt;buf[0]));<br>
--=C2=A0 linep-&gt;pos =3D grub_zalloc (screen-&gt;nterms * sizeof (linep-=
&gt;pos[0]));<br>
-+=C2=A0 linep-&gt;buf =3D grub_calloc (linep-&gt;max_len + 1, sizeof (lin=
ep-&gt;buf[0]));<br>
-+=C2=A0 linep-&gt;pos =3D grub_calloc (screen-&gt;nterms, sizeof (linep-&=
gt;pos[0]));<br>
-=C2=A0 =C2=A0if (! linep-&gt;buf || !linep-&gt;pos)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (linep-&gt;buf);<br>
-@@ -287,7 +287,7 @@ update_screen (struct screen *screen, struct per_term=
_screen *term_screen,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pos =3D linep-&gt;pos + (term_screen - =
screen-&gt;terms);<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!*pos)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *pos =3D grub_zalloc ((linep-&gt;len =
+ 1) * sizeof (**pos));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *pos =3D grub_calloc (linep-&gt;len +=
 1, sizeof (**pos));<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (i =3D=3D region_start || linep =3D=
=3D screen-&gt;lines + screen-&gt;line<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| (i &gt; region_start &=
amp;&amp; mode =3D=3D ALL_LINES))<br>
-@@ -471,7 +471,7 @@ insert_string (struct screen *screen, const char *s, =
int update)<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Insert the string.=C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0current_linep =3D screen-&gt;lines + sc=
reen-&gt;line;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 unicode_msg =3D grub_malloc ((p - s) * sizeo=
f (grub_uint32_t));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 unicode_msg =3D grub_calloc (p - s, sizeof (=
grub_uint32_t));<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!unicode_msg)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-@@ -1023,7 +1023,7 @@ complete (struct screen *screen, int continuous, in=
t update)<br>
-=C2=A0 =C2=A0if (completion_buffer.buf)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0buflen =3D grub_strlen (completion_buffer.buf)=
;<br>
--=C2=A0 =C2=A0 =C2=A0 ucs4 =3D grub_malloc (sizeof (grub_uint32_t) * (buf=
len + 1));<br>
-+=C2=A0 =C2=A0 =C2=A0 ucs4 =3D grub_calloc (buflen + 1, sizeof (grub_uint=
32_t));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ucs4)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-@@ -1268,7 +1268,7 @@ grub_menu_entry_run (grub_menu_entry_t entry)<br>
-=C2=A0 =C2=A0for (i =3D 0; i &lt; (unsigned) screen-&gt;num_lines; i++)<b=
r>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (screen-&gt;lines[i].pos);<br>
--=C2=A0 =C2=A0 =C2=A0 screen-&gt;lines[i].pos =3D grub_zalloc (screen-&gt=
;nterms * sizeof (screen-&gt;lines[i].pos[0]));<br>
-+=C2=A0 =C2=A0 =C2=A0 screen-&gt;lines[i].pos =3D grub_calloc (screen-&gt=
;nterms, sizeof (screen-&gt;lines[i].pos[0]));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (! screen-&gt;lines[i].pos)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_print_error ();<br>
-@@ -1278,7 +1278,7 @@ grub_menu_entry_run (grub_menu_entry_t entry)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
- <br>
--=C2=A0 screen-&gt;terms =3D grub_zalloc (screen-&gt;nterms * sizeof (scr=
een-&gt;terms[0]));<br>
-+=C2=A0 screen-&gt;terms =3D grub_calloc (screen-&gt;nterms, sizeof (scre=
en-&gt;terms[0]));<br>
-=C2=A0 =C2=A0if (!screen-&gt;terms)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_print_error ();<br>
-diff --git a/grub-core/normal/menu_text.c b/grub-core/normal/menu_text.c<=
br>
-index e22bb91..18240e7 100644<br>
---- a/grub-core/normal/menu_text.c<br>
-+++ b/grub-core/normal/menu_text.c<br>
-@@ -78,7 +78,7 @@ grub_print_message_indented_real (const char *msg, int =
margin_left,<br>
-=C2=A0 =C2=A0grub_size_t msg_len =3D grub_strlen (msg) + 2;<br>
-=C2=A0 =C2=A0int ret =3D 0;<br>
- <br>
--=C2=A0 unicode_msg =3D grub_malloc (msg_len * sizeof (grub_uint32_t));<b=
r>
-+=C2=A0 unicode_msg =3D grub_calloc (msg_len, sizeof (grub_uint32_t));<br=
>
-=C2=A0 <br>
-=C2=A0 =C2=A0if (!unicode_msg)<br>
-=C2=A0 =C2=A0 =C2=A0return 0;<br>
-@@ -211,7 +211,7 @@ print_entry (int y, int highlight, grub_menu_entry_t =
entry,<br>
- <br>
-=C2=A0 =C2=A0title =3D entry ? entry-&gt;title : &quot;&quot;;<br>
-=C2=A0 =C2=A0title_len =3D grub_strlen (title);<br>
--=C2=A0 unicode_title =3D grub_malloc (title_len * sizeof (*unicode_title=
));<br>
-+=C2=A0 unicode_title =3D grub_calloc (title_len, sizeof (*unicode_title)=
);<br>
-=C2=A0 =C2=A0if (! unicode_title)<br>
-=C2=A0 =C2=A0 =C2=A0/* XXX How to show this error?=C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0return;<br>
-diff --git a/grub-core/normal/term.c b/grub-core/normal/term.c<br>
-index a1e5c5a..cc8c173 100644<br>
---- a/grub-core/normal/term.c<br>
-+++ b/grub-core/normal/term.c<br>
-@@ -264,7 +264,7 @@ grub_term_save_pos (void)<br>
-=C2=A0 =C2=A0FOR_ACTIVE_TERM_OUTPUTS(cur)<br>
-=C2=A0 =C2=A0 =C2=A0cnt++;<br>
- <br>
--=C2=A0 ret =3D grub_malloc (cnt * sizeof (ret[0]));<br>
-+=C2=A0 ret =3D grub_calloc (cnt, sizeof (ret[0]));<br>
-=C2=A0 =C2=A0if (!ret)<br>
-=C2=A0 =C2=A0 =C2=A0return NULL;<br>
- <br>
-@@ -1013,7 +1013,7 @@ grub_xnputs (const char *str, grub_size_t msg_len)<=
br>
- <br>
-=C2=A0 =C2=A0grub_error_push ();<br>
- <br>
--=C2=A0 unicode_str =3D grub_malloc (msg_len * sizeof (grub_uint32_t));<b=
r>
-+=C2=A0 unicode_str =3D grub_calloc (msg_len, sizeof (grub_uint32_t));<br=
>
-=C2=A0 <br>
-=C2=A0 =C2=A0grub_error_pop ();<br>
- <br>
-diff --git a/grub-core/osdep/linux/getroot.c b/grub-core/osdep/linux/getr=
oot.c<br>
-index 90d92d3..5b41ad0 100644<br>
---- a/grub-core/osdep/linux/getroot.c<br>
-+++ b/grub-core/osdep/linux/getroot.c<br>
-@@ -168,7 +168,7 @@ grub_util_raid_getmembers (const char *name, int boot=
able)<br>
-=C2=A0 =C2=A0if (ret !=3D 0)<br>
-=C2=A0 =C2=A0 =C2=A0grub_util_error (_(&quot;ioctl GET_ARRAY_INFO error: =
%s&quot;), strerror (errno));<br>
- <br>
--=C2=A0 devicelist =3D xmalloc ((info.nr_disks + 1) * sizeof (char *));<b=
r>
-+=C2=A0 devicelist =3D xcalloc (info.nr_disks + 1, sizeof (char *));<br>
- <br>
-=C2=A0 =C2=A0for (i =3D 0, j =3D 0; j &lt; info.nr_disks; i++)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-@@ -241,7 +241,7 @@ grub_find_root_devices_from_btrfs (const char *dir)<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
- <br>
--=C2=A0 ret =3D xmalloc ((fsi.num_devices + 1) * sizeof (ret[0]));<br>
-+=C2=A0 ret =3D xcalloc (fsi.num_devices + 1, sizeof (ret[0]));<br>
- <br>
-=C2=A0 =C2=A0for (i =3D 1; i &lt;=3D fsi.max_id &amp;&amp; j &lt; fsi.num=
_devices; i++)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-@@ -396,7 +396,7 @@ grub_find_root_devices_from_mountinfo (const char *di=
r, char **relroot)<br>
-=C2=A0 =C2=A0if (relroot)<br>
-=C2=A0 =C2=A0 =C2=A0*relroot =3D NULL;<br>
- <br>
--=C2=A0 entries =3D xmalloc (entry_max * sizeof (*entries));<br>
-+=C2=A0 entries =3D xcalloc (entry_max, sizeof (*entries));<br>
- <br>
- again:<br>
-=C2=A0 =C2=A0fp =3D grub_util_fopen (&quot;/proc/self/mountinfo&quot;, &q=
uot;r&quot;);<br>
-diff --git a/grub-core/osdep/unix/config.c b/grub-core/osdep/unix/config.=
c<br>
-index 65effa9..7d63251 100644<br>
---- a/grub-core/osdep/unix/config.c<br>
-+++ b/grub-core/osdep/unix/config.c<br>
-@@ -89,7 +89,7 @@ grub_util_load_config (struct grub_util_config *cfg)<br=
>
-=C2=A0 =C2=A0argv[0] =3D &quot;sh&quot;;<br>
-=C2=A0 =C2=A0argv[1] =3D &quot;-c&quot;;<br>
- <br>
--=C2=A0 script =3D xmalloc (4 * strlen (cfgfile) + 300);<br>
-+=C2=A0 script =3D xcalloc (4, strlen (cfgfile) + 300);<br>
- <br>
-=C2=A0 =C2=A0ptr =3D script;<br>
-=C2=A0 =C2=A0memcpy (ptr, &quot;. &#39;&quot;, 3);<br>
-diff --git a/grub-core/osdep/windows/getroot.c b/grub-core/osdep/windows/=
getroot.c<br>
-index 661d954..eada663 100644<br>
---- a/grub-core/osdep/windows/getroot.c<br>
-+++ b/grub-core/osdep/windows/getroot.c<br>
-@@ -59,7 +59,7 @@ grub_get_mount_point (const TCHAR *path)<br>
- <br>
-=C2=A0 =C2=A0for (ptr =3D path; *ptr; ptr++);<br>
-=C2=A0 =C2=A0allocsize =3D (ptr - path + 10) * 2;<br>
--=C2=A0 out =3D xmalloc (allocsize * sizeof (out[0]));<br>
-+=C2=A0 out =3D xcalloc (allocsize, sizeof (out[0]));<br>
- <br>
-=C2=A0 =C2=A0/* When pointing to EFI system partition GetVolumePathName f=
ails<br>
-=C2=A0 =C2=A0 =C2=A0 for ESP root and returns abberant information for ev=
erything<br>
-diff --git a/grub-core/osdep/windows/hostdisk.c b/grub-core/osdep/windows=
/hostdisk.c<br>
-index 3551007..0be3273 100644<br>
---- a/grub-core/osdep/windows/hostdisk.c<br>
-+++ b/grub-core/osdep/windows/hostdisk.c<br>
-@@ -111,7 +111,7 @@ grub_util_get_windows_path_real (const char *path)<br=
>
- <br>
-=C2=A0 =C2=A0while (1)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
--=C2=A0 =C2=A0 =C2=A0 fpa =3D xmalloc (alloc * sizeof (fpa[0]));<br>
-+=C2=A0 =C2=A0 =C2=A0 fpa =3D xcalloc (alloc, sizeof (fpa[0]));<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D GetFullPathName (tpath, alloc, fpa, NU=
LL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (len &gt;=3D alloc)<br>
-@@ -399,7 +399,7 @@ grub_util_fd_opendir (const char *name)<br>
-=C2=A0 =C2=A0for (l =3D 0; name_windows[l]; l++);<br>
-=C2=A0 =C2=A0for (l--; l &gt;=3D 0 &amp;&amp; (name_windows[l] =3D=3D &#3=
9;\\&#39; || name_windows[l] =3D=3D &#39;/&#39;); l--);<br>
-=C2=A0 =C2=A0l++;<br>
--=C2=A0 pattern =3D xmalloc ((l + 3) * sizeof (pattern[0]));<br>
-+=C2=A0 pattern =3D xcalloc (l + 3, sizeof (pattern[0]));<br>
-=C2=A0 =C2=A0memcpy (pattern, name_windows, l * sizeof (pattern[0]));<br>
-=C2=A0 =C2=A0pattern[l] =3D &#39;\\&#39;;<br>
-=C2=A0 =C2=A0pattern[l + 1] =3D &#39;*&#39;;<br>
-diff --git a/grub-core/osdep/windows/init.c b/grub-core/osdep/windows/ini=
t.c<br>
-index e8ffd62..6297de6 100644<br>
---- a/grub-core/osdep/windows/init.c<br>
-+++ b/grub-core/osdep/windows/init.c<br>
-@@ -161,7 +161,7 @@ grub_util_host_init (int *argc __attribute__ ((unused=
)),<br>
-=C2=A0 =C2=A0LPWSTR *targv;<br>
- <br>
-=C2=A0 =C2=A0targv =3D CommandLineToArgvW (tcmdline, argc);<br>
--=C2=A0 *argv =3D xmalloc ((*argc + 1) * sizeof (argv[0]));<br>
-+=C2=A0 *argv =3D xcalloc (*argc + 1, sizeof (argv[0]));<br>
- <br>
-=C2=A0 =C2=A0for (i =3D 0; i &lt; *argc; i++)<br>
-=C2=A0 =C2=A0 =C2=A0(*argv)[i] =3D grub_util_tchar_to_utf8 (targv[i]); <b=
r>
-diff --git a/grub-core/osdep/windows/platform.c b/grub-core/osdep/windows=
/platform.c<br>
-index 7eb53fe..1ef86bf 100644<br>
---- a/grub-core/osdep/windows/platform.c<br>
-+++ b/grub-core/osdep/windows/platform.c<br>
-@@ -225,8 +225,8 @@ grub_install_register_efi (grub_device_t efidir_grub_=
dev,<br>
-=C2=A0 =C2=A0 =C2=A0grub_util_error (&quot;%s&quot;, _(&quot;no EFI routi=
nes are available when running in BIOS mode&quot;));<br>
- <br>
-=C2=A0 =C2=A0distrib8_len =3D grub_strlen (efi_distributor);<br>
--=C2=A0 distributor16 =3D xmalloc ((distrib8_len + 1) * GRUB_MAX_UTF16_PE=
R_UTF8<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0* sizeof (grub_uint16_t));<br>
-+=C2=A0 distributor16 =3D xcalloc (distrib8_len + 1,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0GRUB_MAX_UTF16_PER_UTF8 * sizeof (grub_uint16_t));<br>
-=C2=A0 =C2=A0distrib16_len =3D grub_utf8_to_utf16 (distributor16, distrib=
8_len * GRUB_MAX_UTF16_PER_UTF8,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(const grub_uin=
t8_t *) efi_distributor,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0distrib8_len, 0=
);<br>
-diff --git a/grub-core/osdep/windows/relpath.c b/grub-core/osdep/windows/=
relpath.c<br>
-index cb08617..478e8ef 100644<br>
---- a/grub-core/osdep/windows/relpath.c<br>
-+++ b/grub-core/osdep/windows/relpath.c<br>
-@@ -72,7 +72,7 @@ grub_make_system_path_relative_to_its_root (const char =
*path)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (dirwindows[0] &amp;&amp; dirwindows[1] =3D=
=
=3D &#39;:&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0offset =3D 2;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 ret =3D xmalloc (sizeof (ret[0]) * (flen - offset + 2));<br>
-+=C2=A0 ret =3D xcalloc (flen - offset + 2, sizeof (ret[0]));<br>
-=C2=A0 =C2=A0if (dirwindows[offset] !=3D &#39;\\&#39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; dirwindows[offset] !=3D &#39;/&#39;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; dirwindows[offset])<br>
-diff --git a/grub-core/partmap/gpt.c b/grub-core/partmap/gpt.c<br>
-index 103f679..72a2e37 100644<br>
---- a/grub-core/partmap/gpt.c<br>
-+++ b/grub-core/partmap/gpt.c<br>
-@@ -199,7 +199,7 @@ gpt_partition_map_embed (struct grub_disk *disk, unsi=
gned int *nsectors,<br>
-=C2=A0 =C2=A0*nsectors =3D ctx.len;<br>
-=C2=A0 =C2=A0if (*nsectors &gt; max_nsectors)<br>
-=C2=A0 =C2=A0 =C2=A0*nsectors =3D max_nsectors;<br>
--=C2=A0 *sectors =3D grub_malloc (*nsectors * sizeof (**sectors));<br>
-+=C2=A0 *sectors =3D grub_calloc (*nsectors, sizeof (**sectors));<br>
-=C2=A0 =C2=A0if (!*sectors)<br>
-=C2=A0 =C2=A0 =C2=A0return grub_errno;<br>
-=C2=A0 =C2=A0for (i =3D 0; i &lt; *nsectors; i++)<br>
-diff --git a/grub-core/partmap/msdos.c b/grub-core/partmap/msdos.c<br>
-index 7b8e450..ee3f249 100644<br>
---- a/grub-core/partmap/msdos.c<br>
-+++ b/grub-core/partmap/msdos.c<br>
-@@ -337,7 +337,7 @@ pc_partition_map_embed (struct grub_disk *disk, unsig=
ned int *nsectors,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0avail_nsectors =3D *nsectors;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (*nsectors &gt; max_nsectors)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0*nsectors =3D max_nsectors;<br>
--=C2=A0 =C2=A0 =C2=A0 *sectors =3D grub_malloc (*nsectors * sizeof (**sec=
tors));<br>
-+=C2=A0 =C2=A0 =C2=A0 *sectors =3D grub_calloc (*nsectors, sizeof (**sect=
ors));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!*sectors)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return grub_errno;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; *nsectors; i++)<br>
-diff --git a/grub-core/script/execute.c b/grub-core/script/execute.c<br>
-index ee299fd..c8d6806 100644<br>
---- a/grub-core/script/execute.c<br>
-+++ b/grub-core/script/execute.c<br>
-@@ -553,7 +553,7 @@ gettext_append (struct grub_script_argv *result, cons=
t char *orig_str)<br>
-=C2=A0 =C2=A0for (iptr =3D orig_str; *iptr; iptr++)<br>
-=C2=A0 =C2=A0 =C2=A0if (*iptr =3D=3D &#39;$&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dollar_cnt++;<br>
--=C2=A0 ctx.allowed_strings =3D grub_malloc (sizeof (ctx.allowed_strings[=
0]) * dollar_cnt);<br>
-+=C2=A0 ctx.allowed_strings =3D grub_calloc (dollar_cnt, sizeof (ctx.allo=
wed_strings[0]));<br>
- <br>
-=C2=A0 =C2=A0if (parse_string (orig_str, gettext_save_allow, &amp;ctx, 0)=
)<br>
-=C2=A0 =C2=A0 =C2=A0goto fail;<br>
-diff --git a/grub-core/tests/fake_input.c b/grub-core/tests/fake_input.c<=
br>
-index 2d60852..b5eb516 100644<br>
---- a/grub-core/tests/fake_input.c<br>
-+++ b/grub-core/tests/fake_input.c<br>
-@@ -49,7 +49,7 @@ grub_terminal_input_fake_sequence (int *seq_in, int nse=
q_in)<br>
-=C2=A0 =C2=A0 =C2=A0saved =3D grub_term_inputs;<br>
-=C2=A0 =C2=A0if (seq)<br>
-=C2=A0 =C2=A0 =C2=A0grub_free (seq);<br>
--=C2=A0 seq =3D grub_malloc (nseq_in * sizeof (seq[0]));<br>
-+=C2=A0 seq =3D grub_calloc (nseq_in, sizeof (seq[0]));<br>
-=C2=A0 =C2=A0if (!seq)<br>
-=C2=A0 =C2=A0 =C2=A0return;<br>
- <br>
-diff --git a/grub-core/tests/video_checksum.c b/grub-core/tests/video_che=
cksum.c<br>
-index 74d5b65..44d0810 100644<br>
---- a/grub-core/tests/video_checksum.c<br>
-+++ b/grub-core/tests/video_checksum.c<br>
-@@ -336,7 +336,7 @@ grub_video_capture_write_bmp (const char *fname,<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0case 4:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
--=C2=A0 =C2=A0 =C2=A0 grub_uint8_t *buffer =3D xmalloc (mode_info-&gt;wid=
th * 3);<br>
-+=C2=A0 =C2=A0 =C2=A0 grub_uint8_t *buffer =3D xcalloc (3, mode_info-&gt;=
width);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_uint32_t rmask =3D ((1 &lt;&lt; mode_info=
-&gt;red_mask_size) - 1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_uint32_t gmask =3D ((1 &lt;&lt; mode_info=
-&gt;green_mask_size) - 1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_uint32_t bmask =3D ((1 &lt;&lt; mode_info=
-&gt;blue_mask_size) - 1);<br>
-@@ -367,7 +367,7 @@ grub_video_capture_write_bmp (const char *fname,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0case 3:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
--=C2=A0 =C2=A0 =C2=A0 grub_uint8_t *buffer =3D xmalloc (mode_info-&gt;wid=
th * 3);<br>
-+=C2=A0 =C2=A0 =C2=A0 grub_uint8_t *buffer =3D xcalloc (3, mode_info-&gt;=
width);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_uint32_t rmask =3D ((1 &lt;&lt; mode_info=
-&gt;red_mask_size) - 1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_uint32_t gmask =3D ((1 &lt;&lt; mode_info=
-&gt;green_mask_size) - 1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_uint32_t bmask =3D ((1 &lt;&lt; mode_info=
-&gt;blue_mask_size) - 1);<br>
-@@ -407,7 +407,7 @@ grub_video_capture_write_bmp (const char *fname,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0case 2:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
--=C2=A0 =C2=A0 =C2=A0 grub_uint8_t *buffer =3D xmalloc (mode_info-&gt;wid=
th * 3);<br>
-+=C2=A0 =C2=A0 =C2=A0 grub_uint8_t *buffer =3D xcalloc (3, mode_info-&gt;=
width);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_uint16_t rmask =3D ((1 &lt;&lt; mode_info=
-&gt;red_mask_size) - 1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_uint16_t gmask =3D ((1 &lt;&lt; mode_info=
-&gt;green_mask_size) - 1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_uint16_t bmask =3D ((1 &lt;&lt; mode_info=
-&gt;blue_mask_size) - 1);<br>
-diff --git a/grub-core/video/capture.c b/grub-core/video/capture.c<br>
-index 4f83c74..4d3195e 100644<br>
---- a/grub-core/video/capture.c<br>
-+++ b/grub-core/video/capture.c<br>
-@@ -89,7 +89,7 @@ grub_video_capture_start (const struct grub_video_mode_=
info *mode_info,<br>
-=C2=A0 =C2=A0framebuffer.mode_info =3D *mode_info;<br>
-=C2=A0 =C2=A0framebuffer.mode_info.blit_format =3D grub_video_get_blit_fo=
rmat (&amp;framebuffer.mode_info);<br>
- <br>
--=C2=A0 framebuffer.ptr =3D grub_malloc (framebuffer.mode_info.height * f=
ramebuffer.mode_info.pitch);<br>
-+=C2=A0 framebuffer.ptr =3D grub_calloc (framebuffer.mode_info.height, fr=
amebuffer.mode_info.pitch);<br>
-=C2=A0 =C2=A0if (!framebuffer.ptr)<br>
-=C2=A0 =C2=A0 =C2=A0return grub_errno;<br>
-=C2=A0 =C2=A0<br>
-diff --git a/grub-core/video/emu/sdl.c b/grub-core/video/emu/sdl.c<br>
-index a2f639f..0ebab6f 100644<br>
---- a/grub-core/video/emu/sdl.c<br>
-+++ b/grub-core/video/emu/sdl.c<br>
-@@ -172,7 +172,7 @@ grub_video_sdl_set_palette (unsigned int start, unsig=
ned int count,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (start + count &gt; mode_info.number_of_col=
ors)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0count =3D mode_info.number_of_colors - start;<=
br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 tmp =3D grub_malloc (count * sizeof (tmp[0]));<br>
-+=C2=A0 =C2=A0 =C2=A0 tmp =3D grub_calloc (count, sizeof (tmp[0]));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; count; i++)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmp[i].r =3D palette_data[i].r;<br>
-diff --git a/grub-core/video/i386/pc/vga.c b/grub-core/video/i386/pc/vga.=
c<br>
-index 01f4711..b2f776c 100644<br>
---- a/grub-core/video/i386/pc/vga.c<br>
-+++ b/grub-core/video/i386/pc/vga.c<br>
-@@ -127,7 +127,7 @@ grub_video_vga_setup (unsigned int width, unsigned in=
t height,<br>
- <br>
-=C2=A0 =C2=A0vga_height =3D height ? : 480;<br>
- <br>
--=C2=A0 framebuffer.temporary_buffer =3D grub_malloc (vga_height * VGA_WI=
DTH);<br>
-+=C2=A0 framebuffer.temporary_buffer =3D grub_calloc (vga_height, VGA_WID=
TH);<br>
-=C2=A0 =C2=A0framebuffer.front_page =3D 0;<br>
-=C2=A0 =C2=A0framebuffer.back_page =3D 0;<br>
-=C2=A0 =C2=A0if (!framebuffer.temporary_buffer)<br>
-diff --git a/grub-core/video/readers/png.c b/grub-core/video/readers/png.=
c<br>
-index 777e713..61bd645 100644<br>
---- a/grub-core/video/readers/png.c<br>
-+++ b/grub-core/video/readers/png.c<br>
-@@ -309,7 +309,7 @@ grub_png_decode_image_header (struct grub_png_data *d=
ata)<br>
-=C2=A0 =C2=A0if (data-&gt;is_16bit || data-&gt;is_gray || data-&gt;is_pal=
ette)<br>
- #endif<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
--=C2=A0 =C2=A0 =C2=A0 data-&gt;image_data =3D grub_malloc (data-&gt;image=
_height * data-&gt;row_bytes);<br>
-+=C2=A0 =C2=A0 =C2=A0 data-&gt;image_data =3D grub_calloc (data-&gt;image=
_height, data-&gt;row_bytes);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (grub_errno)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return grub_errno;<br>
- <br>
-diff --git a/include/grub/unicode.h b/include/grub/unicode.h<br>
-index a0403e9..4de986a 100644<br>
---- a/include/grub/unicode.h<br>
-+++ b/include/grub/unicode.h<br>
-@@ -293,7 +293,7 @@ grub_unicode_glyph_dup (const struct grub_unicode_gly=
ph *in)<br>
-=C2=A0 =C2=A0grub_memcpy (out, in, sizeof (*in));<br>
-=C2=A0 =C2=A0if (in-&gt;ncomb &gt; ARRAY_SIZE (out-&gt;combining_inline))=
<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
--=C2=A0 =C2=A0 =C2=A0 out-&gt;combining_ptr =3D grub_malloc (in-&gt;ncomb=
 * sizeof (out-&gt;combining_ptr[0]));<br>
-+=C2=A0 =C2=A0 =C2=A0 out-&gt;combining_ptr =3D grub_calloc (in-&gt;ncomb=
, sizeof (out-&gt;combining_ptr[0]));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!out-&gt;combining_ptr)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (out);<br>
-@@ -315,7 +315,7 @@ grub_unicode_set_glyph (struct grub_unicode_glyph *ou=
t,<br>
-=C2=A0 =C2=A0grub_memcpy (out, in, sizeof (*in));<br>
-=C2=A0 =C2=A0if (in-&gt;ncomb &gt; ARRAY_SIZE (out-&gt;combining_inline))=
<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
--=C2=A0 =C2=A0 =C2=A0 out-&gt;combining_ptr =3D grub_malloc (in-&gt;ncomb=
 * sizeof (out-&gt;combining_ptr[0]));<br>
-+=C2=A0 =C2=A0 =C2=A0 out-&gt;combining_ptr =3D grub_calloc (in-&gt;ncomb=
, sizeof (out-&gt;combining_ptr[0]));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!out-&gt;combining_ptr)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_memcpy (out-&gt;combining_ptr, in-&gt;com=
bining_ptr,<br>
-diff --git a/util/getroot.c b/util/getroot.c<br>
-index 847406f..a5eaa64 100644<br>
---- a/util/getroot.c<br>
-+++ b/util/getroot.c<br>
-@@ -200,7 +200,7 @@ make_device_name (const char *drive)<br>
-=C2=A0 =C2=A0char *ret, *ptr;<br>
-=C2=A0 =C2=A0const char *iptr;<br>
- <br>
--=C2=A0 ret =3D xmalloc (strlen (drive) * 2);<br>
-+=C2=A0 ret =3D xcalloc (2, strlen (drive));<br>
-=C2=A0 =C2=A0ptr =3D ret;<br>
-=C2=A0 =C2=A0for (iptr =3D drive; *iptr; iptr++)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-diff --git a/util/grub-file.c b/util/grub-file.c<br>
-index 50c18b6..b2e7dd6 100644<br>
---- a/util/grub-file.c<br>
-+++ b/util/grub-file.c<br>
-@@ -54,7 +54,7 @@ main (int argc, char *argv[])<br>
- <br>
-=C2=A0 =C2=A0grub_util_host_init (&amp;argc, &amp;argv);<br>
- <br>
--=C2=A0 argv2 =3D xmalloc (argc * sizeof (argv2[0]));<br>
-+=C2=A0 argv2 =3D xcalloc (argc, sizeof (argv2[0]));<br>
- <br>
-=C2=A0 =C2=A0if (argc =3D=3D 2 &amp;&amp; strcmp (argv[1], &quot;--versio=
n&quot;) =3D=3D 0)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-diff --git a/util/grub-fstest.c b/util/grub-fstest.c<br>
-index f14e02d..57246af 100644<br>
---- a/util/grub-fstest.c<br>
-+++ b/util/grub-fstest.c<br>
-@@ -650,7 +650,7 @@ argp_parser (int key, char *arg, struct argp_state *s=
tate)<br>
-=C2=A0 =C2=A0if (args_count &lt; num_disks)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (args_count =3D=3D 0)<br>
--=C2=A0 =C2=A0 =C2=A0 images =3D xmalloc (num_disks * sizeof (images[0]))=
;<br>
-+=C2=A0 =C2=A0 =C2=A0 images =3D xcalloc (num_disks, sizeof (images[0]));=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0images[args_count] =3D grub_canonicalize_file_=
name (arg);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0args_count++;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-@@ -734,7 +734,7 @@ main (int argc, char *argv[])<br>
- <br>
-=C2=A0 =C2=A0grub_util_host_init (&amp;argc, &amp;argv);<br>
- <br>
--=C2=A0 args =3D xmalloc (argc * sizeof (args[0]));<br>
-+=C2=A0 args =3D xcalloc (argc, sizeof (args[0]));<br>
- <br>
-=C2=A0 =C2=A0argp_parse (&amp;argp, argc, argv, 0, 0, 0);<br>
- <br>
-diff --git a/util/grub-install-common.c b/util/grub-install-common.c<br>
-index ca0ac61..0295d40 100644<br>
---- a/util/grub-install-common.c<br>
-+++ b/util/grub-install-common.c<br>
-@@ -286,7 +286,7 @@ handle_install_list (struct install_list *il, const c=
har *val,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0il-&gt;n_entries++;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0il-&gt;n_alloc =3D il-&gt;n_entries + 1;<br>
--=C2=A0 il-&gt;entries =3D xmalloc (il-&gt;n_alloc * sizeof (il-&gt;entri=
es[0]));<br>
-+=C2=A0 il-&gt;entries =3D xcalloc (il-&gt;n_alloc, sizeof (il-&gt;entrie=
s[0]));<br>
-=C2=A0 =C2=A0ptr =3D val;<br>
-=C2=A0 =C2=A0for (ce =3D il-&gt;entries; ; ce++)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-diff --git a/util/grub-install.c b/util/grub-install.c<br>
-index 8a55ad4..a82725f 100644<br>
---- a/util/grub-install.c<br>
-+++ b/util/grub-install.c<br>
-@@ -626,7 +626,7 @@ device_map_check_duplicates (const char *dev_map)<br>
-=C2=A0 =C2=A0if (! fp)<br>
-=C2=A0 =C2=A0 =C2=A0return;<br>
- <br>
--=C2=A0 d =3D xmalloc (alloced * sizeof (d[0]));<br>
-+=C2=A0 d =3D xcalloc (alloced, sizeof (d[0]));<br>
- <br>
-=C2=A0 =C2=A0while (fgets (buf, sizeof (buf), fp))<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-@@ -1260,7 +1260,7 @@ main (int argc, char *argv[])<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ndev++;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
- <br>
--=C2=A0 grub_drives =3D xmalloc (sizeof (grub_drives[0]) * (ndev + 1)); <=
br>
-+=C2=A0 grub_drives =3D xcalloc (ndev + 1, sizeof (grub_drives[0]));<br>
- <br>
-=C2=A0 =C2=A0for (curdev =3D grub_devices, curdrive =3D grub_drives; *cur=
dev; curdev++,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 curdrive++)<br>
-diff --git a/util/grub-mkimagexx.c b/util/grub-mkimagexx.c<br>
-index bc087c2..d97d0e7 100644<br>
---- a/util/grub-mkimagexx.c<br>
-+++ b/util/grub-mkimagexx.c<br>
-@@ -2294,10 +2294,8 @@ SUFFIX (grub_mkimage_load_image) (const char *kern=
el_path,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0+ grub_host_to_target16 (e-&gt;e_shstrndx) * smd.section_entsize);<br>
-=C2=A0 =C2=A0smd.strtab =3D (char *) e + grub_host_to_target_addr (s-&gt;=
sh_offset);<br>
- <br>
--=C2=A0 smd.addrs =3D xmalloc (sizeof (*smd.addrs) * smd.num_sections);<b=
r>
--=C2=A0 memset (smd.addrs, 0, sizeof (*smd.addrs) * smd.num_sections);<br=
>
--=C2=A0 smd.vaddrs =3D xmalloc (sizeof (*smd.vaddrs) * smd.num_sections);=
<br>
--=C2=A0 memset (smd.vaddrs, 0, sizeof (*smd.vaddrs) * smd.num_sections);<=
br>
-+=C2=A0 smd.addrs =3D xcalloc (smd.num_sections, sizeof (*smd.addrs));<br=
>
-+=C2=A0 smd.vaddrs =3D xcalloc (smd.num_sections, sizeof (*smd.vaddrs));<=
br>
- <br>
-=C2=A0 =C2=A0SUFFIX (locate_sections) (e, kernel_path, &amp;smd, layout, =
image_target);<br>
- <br>
-diff --git a/util/grub-mkrescue.c b/util/grub-mkrescue.c<br>
-index ce2cbc4..5183102 100644<br>
---- a/util/grub-mkrescue.c<br>
-+++ b/util/grub-mkrescue.c<br>
-@@ -441,8 +441,8 @@ main (int argc, char *argv[])<br>
-=C2=A0 =C2=A0xorriso =3D xstrdup (&quot;xorriso&quot;);<br>
-=C2=A0 =C2=A0label_font =3D grub_util_path_concat (2, pkgdatadir, &quot;u=
nicode.pf2&quot;);<br>
- <br>
--=C2=A0 argp_argv =3D xmalloc (sizeof (argp_argv[0]) * argc);<br>
--=C2=A0 xorriso_tail_argv =3D xmalloc (sizeof (argp_argv[0]) * argc);<br>
-+=C2=A0 argp_argv =3D xcalloc (argc, sizeof (argp_argv[0]));<br>
-+=C2=A0 xorriso_tail_argv =3D xcalloc (argc, sizeof (argp_argv[0]));<br>
- <br>
-=C2=A0 =C2=A0xorriso_tail_argc =3D 0;<br>
-=C2=A0 =C2=A0/* Program name */<br>
-diff --git a/util/grub-mkstandalone.c b/util/grub-mkstandalone.c<br>
-index 4907d44..edf3097 100644<br>
---- a/util/grub-mkstandalone.c<br>
-+++ b/util/grub-mkstandalone.c<br>
-@@ -296,7 +296,7 @@ main (int argc, char *argv[])<br>
-=C2=A0 =C2=A0grub_util_host_init (&amp;argc, &amp;argv);<br>
-=C2=A0 =C2=A0grub_util_disable_fd_syncs ();<br>
- <br>
--=C2=A0 files =3D xmalloc ((argc + 1) * sizeof (files[0]));<br>
-+=C2=A0 files =3D xcalloc (argc + 1, sizeof (files[0]));<br>
- <br>
-=C2=A0 =C2=A0argp_parse (&amp;argp, argc, argv, 0, 0, 0);<br>
- <br>
-diff --git a/util/grub-pe2elf.c b/util/grub-pe2elf.c<br>
-index 0d4084a..1133129 100644<br>
---- a/util/grub-pe2elf.c<br>
-+++ b/util/grub-pe2elf.c<br>
-@@ -100,9 +100,9 @@ write_section_data (FILE* fp, const char *name, char =
*image,<br>
-=C2=A0 =C2=A0char *pe_strtab =3D (image + pe_chdr-&gt;symtab_offset<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 + p=
e_chdr-&gt;num_symbols * sizeof (struct grub_pe32_symbol));<br>
- <br>
--=C2=A0 section_map =3D xmalloc ((2 * pe_chdr-&gt;num_sections + 5) * siz=
eof (int));<br>
-+=C2=A0 section_map =3D xcalloc (2 * pe_chdr-&gt;num_sections + 5, sizeof=
 (int));<br>
-=C2=A0 =C2=A0section_map[0] =3D 0;<br>
--=C2=A0 shdr =3D xmalloc ((2 * pe_chdr-&gt;num_sections + 5) * sizeof (sh=
dr[0]));<br>
-+=C2=A0 shdr =3D xcalloc (2 * pe_chdr-&gt;num_sections + 5, sizeof (shdr[=
0]));<br>
-=C2=A0 =C2=A0idx =3D 1;<br>
-=C2=A0 =C2=A0idx_reloc =3D pe_chdr-&gt;num_sections + 1;<br>
- <br>
-@@ -233,7 +233,7 @@ write_reloc_section (FILE* fp, const char *name, char=
 *image,<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pe_sec =3D pe_shdr + shdr[i].sh_link;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pe_rel =3D (struct grub_pe32_reloc *) (image +=
 pe_sec-&gt;relocations_offset);<br>
--=C2=A0 =C2=A0 =C2=A0 rel =3D (elf_reloc_t *) xmalloc (pe_sec-&gt;num_rel=
ocations * sizeof (elf_reloc_t));<br>
-+=C2=A0 =C2=A0 =C2=A0 rel =3D (elf_reloc_t *) xcalloc (pe_sec-&gt;num_rel=
ocations, sizeof (elf_reloc_t));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0num_rels =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0modified =3D 0;<br>
- <br>
-@@ -365,12 +365,10 @@ write_symbol_table (FILE* fp, const char *name, cha=
r *image,<br>
-=C2=A0 =C2=A0pe_symtab =3D (struct grub_pe32_symbol *) (image + pe_chdr-&=
gt;symtab_offset);<br>
-=C2=A0 =C2=A0pe_strtab =3D (char *) (pe_symtab + pe_chdr-&gt;num_symbols)=
;<br>
- <br>
--=C2=A0 symtab =3D (Elf_Sym *) xmalloc ((pe_chdr-&gt;num_symbols + 1) *<b=
r>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof (Elf_Sym));<br>
--=C2=A0 memset (symtab, 0, (pe_chdr-&gt;num_symbols + 1) * sizeof (Elf_Sy=
m));<br>
-+=C2=A0 symtab =3D (Elf_Sym *) xcalloc (pe_chdr-&gt;num_symbols + 1, size=
of (Elf_Sym));<br>
-=C2=A0 =C2=A0num_syms =3D 1;<br>
- <br>
--=C2=A0 symtab_map =3D (int *) xmalloc (pe_chdr-&gt;num_symbols * sizeof =
(int));<br>
-+=C2=A0 symtab_map =3D (int *) xcalloc (pe_chdr-&gt;num_symbols, sizeof (=
int));<br>
- <br>
-=C2=A0 =C2=A0for (i =3D 0; i &lt; (int) pe_chdr-&gt;num_symbols;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 i +=3D pe_symtab-&gt;num_aux + 1, pe_symtab +=
=
=3D pe_symtab-&gt;num_aux + 1)<br>
-diff --git a/util/grub-probe.c b/util/grub-probe.c<br>
-index 81d27ee..cbe6ed9 100644<br>
---- a/util/grub-probe.c<br>
-+++ b/util/grub-probe.c<br>
-@@ -361,8 +361,8 @@ probe (const char *path, char **device_names, char de=
lim)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_util_pull_device (*curdev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ndev++;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 <br>
--=C2=A0 drives_names =3D xmalloc (sizeof (drives_names[0]) * (ndev + 1));=
 <br>
-+<br>
-+=C2=A0 drives_names =3D xcalloc (ndev + 1, sizeof (drives_names[0]));<br=
>
- <br>
-=C2=A0 =C2=A0for (curdev =3D device_names, curdrive =3D drives_names; *cu=
rdev; curdev++,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 curdrive++)<br>
--- <br>
-2.14.4<br>
-<br>
diff --git a/meta/recipes-bsp/grub/files/CVE-2020-14309-CVE-2020-14310-CVE=
-2020-14311-malloc-Use-overflow-checking-primitives-where-we-do-.patch b/me=
ta/recipes-bsp/grub/files/CVE-2020-14309-CVE-2020-14310-CVE-2020-14311-mall=
oc-Use-overflow-checking-primitives-where-we-do-.patch<br>
deleted file mode 100644<br>
index 7214ead9a7..0000000000<br>
--- a/meta/recipes-bsp/grub/files/CVE-2020-14309-CVE-2020-14310-CVE-2020-1=
4311-malloc-Use-overflow-checking-primitives-where-we-do-.patch<br>
+++ /dev/null<br>
@@ -1,1330 +0,0 @@<br>
-From eb77d1ef65e25746acff43545f62a71360b15eec Mon Sep 17 00:00:00 2001<br=
>
-From: Peter Jones &lt;<a href=3D"mailto:pjones@redhat.com" target=3D"_bla=
nk">pjones@redhat.com</a>&gt;<br>
-Date: Mon, 15 Jun 2020 12:28:27 -0400<br>
-Subject: [PATCH 6/9] malloc: Use overflow checking primitives where we do=
<br>
- complex allocations<br>
-<br>
-This attempts to fix the places where we do the following where<br>
-arithmetic_expr may include unvalidated data:<br>
-<br>
-=C2=A0 X =3D grub_malloc(arithmetic_expr);<br>
-<br>
-It accomplishes this by doing the arithmetic ahead of time using grub_add=
(),<br>
-grub_sub(), grub_mul() and testing for overflow before proceeding.<br>
-<br>
-Among other issues, this fixes:<br>
-=C2=A0 - allocation of integer overflow in grub_video_bitmap_create()<br>
-=C2=A0 =C2=A0 reported by Chris Coulson,<br>
-=C2=A0 - allocation of integer overflow in grub_png_decode_image_header()=
<br>
-=C2=A0 =C2=A0 reported by Chris Coulson,<br>
-=C2=A0 - allocation of integer overflow in grub_squash_read_symlink()<br>
-=C2=A0 =C2=A0 reported by Chris Coulson,<br>
-=C2=A0 - allocation of integer overflow in grub_ext2_read_symlink()<br>
-=C2=A0 =C2=A0 reported by Chris Coulson,<br>
-=C2=A0 - allocation of integer overflow in read_section_as_string()<br>
-=C2=A0 =C2=A0 reported by Chris Coulson.<br>
-<br>
-Fixes: CVE-2020-14309, CVE-2020-14310, CVE-2020-14311<br>
-<br>
-Signed-off-by: Peter Jones &lt;<a href=3D"mailto:pjones@redhat.com" targe=
t=3D"_blank">pjones@redhat.com</a>&gt;<br>
-Reviewed-by: Daniel Kiper &lt;<a href=3D"mailto:daniel.kiper@oracle.com" =
target=3D"_blank">daniel.kiper@oracle.com</a>&gt;<br>
-<br>
-Upstream-Status: Backport<br>
-CVE: CVE-2020-14309 CVE-2020-14310 CVE-2020-14311<br>
-<br>
-Reference to upstream patch:<br>
-<a href=3D"https://git.savannah.gnu.org/cgit/grub.git/commit/?id=3D3f05d6=
93d1274965ffbe4ba99080dc2c570944c6" rel=3D"noreferrer" target=3D"_blank">ht=
tps://git.savannah.gnu.org/cgit/grub.git/commit/?id=3D3f05d693d1274965ffbe4=
ba99080dc2c570944c6</a><br>
-<br>
-Signed-off-by: Yongxin Liu &lt;<a href=3D"mailto:yongxin.liu@windriver.co=
m" target=3D"_blank">yongxin.liu@windriver.com</a>&gt;<br>
----<br>
- grub-core/commands/legacycfg.c | 29 +++++++++++++++++++-----<br>
- grub-core/commands/wildcard.c=C2=A0 | 36 ++++++++++++++++++++++++-----<b=
r>
- grub-core/disk/ldm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 32 ++++++=
++++++++++++--------<br>
- grub-core/font/font.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 7 +++++-=
<br>
- grub-core/fs/btrfs.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 28 ++++++=
+++++++++--------<br>
- grub-core/fs/ext2.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10 ++++++=
++-<br>
- grub-core/fs/iso9660.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 51 +++++++++++=
++++++++++++++++++-------------<br>
- grub-core/fs/sfs.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 27 +=
++++++++++++++++-----<br>
- grub-core/fs/squash4.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 45 +++++++++++=
+++++++++++++++++---------<br>
- grub-core/fs/udf.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 41 +=
++++++++++++++++++++------------<br>
- grub-core/fs/xfs.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 11 +=
++++----<br>
- grub-core/fs/zfs/zfs.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 22 +++++++++++=
+------<br>
- grub-core/fs/zfs/zfscrypt.c=C2=A0 =C2=A0 |=C2=A0 7 +++++-<br>
- grub-core/lib/arg.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 20 ++++++=
+++++++++--<br>
- grub-core/loader/i386/bsd.c=C2=A0 =C2=A0 |=C2=A0 8 ++++++-<br>
- grub-core/net/dns.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 9 +=
++++++-<br>
- grub-core/normal/charset.c=C2=A0 =C2=A0 =C2=A0| 10 +++++++--<br>
- grub-core/normal/cmdline.c=C2=A0 =C2=A0 =C2=A0| 14 ++++++++++--<br>
- grub-core/normal/menu_entry.c=C2=A0 | 13 +++++++++--<br>
- grub-core/script/argv.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 16 +++++++++++--<br=
>
- grub-core/script/lexer.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 21 ++++++++++++++--=
-<br>
- grub-core/video/bitmap.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 25 +++++++++++++---=
-----<br>
- grub-core/video/readers/png.c=C2=A0 | 13 +++++++++--<br>
- 23 files changed, 382 insertions(+), 113 deletions(-)<br>
-<br>
-diff --git a/grub-core/commands/legacycfg.c b/grub-core/commands/legacycf=
g.c<br>
-index 5e3ec0d..cc5971f 100644<br>
---- a/grub-core/commands/legacycfg.c<br>
-+++ b/grub-core/commands/legacycfg.c<br>
-@@ -32,6 +32,7 @@<br>
- #include &lt;grub/auth.h&gt;<br>
- #include &lt;grub/disk.h&gt;<br>
- #include &lt;grub/partition.h&gt;<br>
-+#include &lt;grub/safemath.h&gt;<br>
- <br>
- GRUB_MOD_LICENSE (&quot;GPLv3+&quot;);<br>
- <br>
-@@ -104,13 +105,22 @@ legacy_file (const char *filename)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (newsuffix)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *t;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_size_t sz;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (grub_add (grub_strlen (suffix), g=
rub_strlen (newsuffix), &amp;sz) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_add (sz, 1, &amp;s=
z))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_errno =3D GRUB_ERR=
_OUT_OF_RANGE;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail_0;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0t =3D suffix;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 suffix =3D grub_realloc (suffix, grub=
_strlen (suffix)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+ grub_strlen (newsuffix) =
+ 1);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 suffix =3D grub_realloc (suffix, sz);=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!suffix)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (t);<br>
-+<br>
-+ fail_0:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (entrysr=
c);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (parsed)=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (newsuff=
ix);<br>
-@@ -154,13 +164,22 @@ legacy_file (const char *filename)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *t;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_size_t sz;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (grub_add (grub_strlen (ent=
rysrc), grub_strlen (parsed), &amp;sz) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_add (sz, 1,=
 &amp;sz))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_errno =3D G=
RUB_ERR_OUT_OF_RANGE;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail_1;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0t =3D entrysrc;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 entrysrc =3D grub_realloc (ent=
rysrc, grub_strlen (entrysrc)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+ grub_strle=
n (parsed) + 1);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 entrysrc =3D grub_realloc (ent=
rysrc, sz);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!entrysrc)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (=
t);<br>
-+<br>
-+ fail_1:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (=
parsed);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (=
suffix);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return grub=
_errno;<br>
-diff --git a/grub-core/commands/wildcard.c b/grub-core/commands/wildcard.=
c<br>
-index 4a106ca..cc32903 100644<br>
---- a/grub-core/commands/wildcard.c<br>
-+++ b/grub-core/commands/wildcard.c<br>
-@@ -23,6 +23,7 @@<br>
- #include &lt;grub/file.h&gt;<br>
- #include &lt;grub/device.h&gt;<br>
- #include &lt;grub/script_sh.h&gt;<br>
-+#include &lt;grub/safemath.h&gt;<br>
- <br>
- #include &lt;regex.h&gt;<br>
- <br>
-@@ -48,6 +49,7 @@ merge (char **dest, char **ps)<br>
-=C2=A0 =C2=A0int i;<br>
-=C2=A0 =C2=A0int j;<br>
-=C2=A0 =C2=A0char **p;<br>
-+=C2=A0 grub_size_t sz;<br>
- <br>
-=C2=A0 =C2=A0if (! dest)<br>
-=C2=A0 =C2=A0 =C2=A0return ps;<br>
-@@ -60,7 +62,12 @@ merge (char **dest, char **ps)<br>
-=C2=A0 =C2=A0for (j =3D 0; ps[j]; j++)<br>
-=C2=A0 =C2=A0 =C2=A0;<br>
- <br>
--=C2=A0 p =3D grub_realloc (dest, sizeof (char*) * (i + j + 1));<br>
-+=C2=A0 if (grub_add (i, j, &amp;sz) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 grub_add (sz, 1, &amp;sz) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 grub_mul (sz, sizeof (char *), &amp;sz))<br>
-+=C2=A0 =C2=A0 return dest;<br>
-+<br>
-+=C2=A0 p =3D grub_realloc (dest, sz);<br>
-=C2=A0 =C2=A0if (! p)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (dest);<br>
-@@ -115,8 +122,15 @@ make_regex (const char *start, const char *end, rege=
x_t *regexp)<br>
-=C2=A0 =C2=A0char ch;<br>
-=C2=A0 =C2=A0int i =3D 0;<br>
-=C2=A0 =C2=A0unsigned len =3D end - start;<br>
--=C2=A0 char *buffer =3D grub_malloc (len * 2 + 2 + 1); /* worst case siz=
e. */<br>
-+=C2=A0 char *buffer;<br>
-+=C2=A0 grub_size_t sz;<br>
- <br>
-+=C2=A0 /* Worst case size is (len * 2 + 2 + 1). */<br>
-+=C2=A0 if (grub_mul (len, 2, &amp;sz) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 grub_add (sz, 3, &amp;sz))<br>
-+=C2=A0 =C2=A0 return 1;<br>
-+<br>
-+=C2=A0 buffer =3D grub_malloc (sz);<br>
-=C2=A0 =C2=A0if (! buffer)<br>
-=C2=A0 =C2=A0 =C2=A0return 1;<br>
- <br>
-@@ -226,6 +240,7 @@ match_devices_iter (const char *name, void *data)<br>
-=C2=A0 =C2=A0struct match_devices_ctx *ctx =3D data;<br>
-=C2=A0 =C2=A0char **t;<br>
-=C2=A0 =C2=A0char *buffer;<br>
-+=C2=A0 grub_size_t sz;<br>
- <br>
-=C2=A0 =C2=A0/* skip partitions if asked to. */<br>
-=C2=A0 =C2=A0if (ctx-&gt;noparts &amp;&amp; grub_strchr (name, &#39;,&#39=
;))<br>
-@@ -239,11 +254,16 @@ match_devices_iter (const char *name, void *data)<b=
r>
-=C2=A0 =C2=A0if (regexec (ctx-&gt;regexp, buffer, 0, 0, 0))<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_dprintf (&quot;expand&quot;, &quot;not ma=
tched\n&quot;);<br>
-+ fail:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (buffer);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
- <br>
--=C2=A0 t =3D grub_realloc (ctx-&gt;devs, sizeof (char*) * (ctx-&gt;ndev =
+ 2));<br>
-+=C2=A0 if (grub_add (ctx-&gt;ndev, 2, &amp;sz) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 grub_mul (sz, sizeof (char *), &amp;sz))<br>
-+=C2=A0 =C2=A0 goto fail;<br>
-+<br>
-+=C2=A0 t =3D grub_realloc (ctx-&gt;devs, sz);<br>
-=C2=A0 =C2=A0if (! t)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (buffer);<br>
-@@ -300,6 +320,7 @@ match_files_iter (const char *name,<br>
-=C2=A0 =C2=A0struct match_files_ctx *ctx =3D data;<br>
-=C2=A0 =C2=A0char **t;<br>
-=C2=A0 =C2=A0char *buffer;<br>
-+=C2=A0 grub_size_t sz;<br>
- <br>
-=C2=A0 =C2=A0/* skip . and .. names */<br>
-=C2=A0 =C2=A0if (grub_strcmp(&quot;.&quot;, name) =3D=3D 0 || grub_strcmp=
(&quot;..&quot;, name) =3D=3D 0)<br>
-@@ -315,9 +336,14 @@ match_files_iter (const char *name,<br>
-=C2=A0 =C2=A0if (! buffer)<br>
-=C2=A0 =C2=A0 =C2=A0return 1;<br>
- <br>
--=C2=A0 t =3D grub_realloc (ctx-&gt;files, sizeof (char*) * (ctx-&gt;nfil=
e + 2));<br>
--=C2=A0 if (! t)<br>
-+=C2=A0 if (grub_add (ctx-&gt;nfile, 2, &amp;sz) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 grub_mul (sz, sizeof (char *), &amp;sz))<br>
-+=C2=A0 =C2=A0 goto fail;<br>
-+<br>
-+=C2=A0 t =3D grub_realloc (ctx-&gt;files, sz);<br>
-+=C2=A0 if (!t)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-+ fail:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (buffer);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-diff --git a/grub-core/disk/ldm.c b/grub-core/disk/ldm.c<br>
-index e632370..58f8a53 100644<br>
---- a/grub-core/disk/ldm.c<br>
-+++ b/grub-core/disk/ldm.c<br>
-@@ -25,6 +25,7 @@<br>
- #include &lt;grub/msdos_partition.h&gt;<br>
- #include &lt;grub/gpt_partition.h&gt;<br>
- #include &lt;grub/i18n.h&gt;<br>
-+#include &lt;grub/safemath.h&gt;<br>
- <br>
- #ifdef GRUB_UTIL<br>
- #include &lt;grub/emu/misc.h&gt;<br>
-@@ -289,6 +290,7 @@ make_vg (grub_disk_t disk,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct grub_ldm_vblk vblk[GRUB_DISK_SECTOR_SIZ=
E<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/ sizeof (struct grub_ldm_vblk)];<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned i;<br>
-+=C2=A0 =C2=A0 =C2=A0 grub_size_t sz;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D grub_disk_read (disk, cursec, 0,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0sizeof(vblk), &amp;vblk);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (err)<br>
-@@ -350,7 +352,13 @@ make_vg (grub_disk_t disk,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (lv);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail2;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 lv-&gt;name =3D grub_malloc (*ptr + 1);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (grub_add (*ptr, 1, &amp;sz))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_free (lv-&gt;internal_id)=
;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_free (lv);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail2;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 lv-&gt;name =3D grub_malloc (sz);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!lv-&gt;name)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (lv-&gt;interna=
l_id);<br>
-@@ -599,10 +607,13 @@ make_vg (grub_disk_t disk,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (lv-&gt;segments-&gt;node_alloc =3D=
=3D lv-&gt;segments-&gt;node_count)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *t;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lv-&gt;segments-&gt;node_alloc=
 *=3D 2; <br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t =3D grub_realloc (lv-&gt;seg=
ments-&gt;nodes,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof (*lv-&gt;segments-&gt;nodes)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * lv-&gt;segments-&gt;node_alloc);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_size_t sz;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (grub_mul (lv-&gt;segments-=
&gt;node_alloc, 2, &amp;lv-&gt;segments-&gt;node_alloc) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_mul (lv-&gt=
;segments-&gt;node_alloc, sizeof (*lv-&gt;segments-&gt;nodes), &amp;sz))<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail2;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t =3D grub_realloc (lv-&gt;seg=
ments-&gt;nodes, sz);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!t)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail2;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lv-&gt;segments-&gt;nodes=
 =3D t;<br>
-@@ -723,10 +734,13 @@ make_vg (grub_disk_t disk,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (comp-&gt;segment_allo=
c =3D=3D comp-&gt;segment_count)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *t;<br=
>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 comp-&gt;segment=
_alloc *=3D 2;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t =3D grub_reall=
oc (comp-&gt;segments,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 comp-&gt;segment_alloc<br=
>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * sizeof (*comp-&gt;segme=
nts));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_size_t sz;<=
br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (grub_mul (co=
mp-&gt;segment_alloc, 2, &amp;comp-&gt;segment_alloc) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gr=
ub_mul (comp-&gt;segment_alloc, sizeof (*comp-&gt;segments), &amp;sz))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail=
2;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t =3D grub_reall=
oc (comp-&gt;segments, sz);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!t)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto=
 fail2;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0comp-&gt;se=
gments =3D t;<br>
-diff --git a/grub-core/font/font.c b/grub-core/font/font.c<br>
-index 8e118b3..5edb477 100644<br>
---- a/grub-core/font/font.c<br>
-+++ b/grub-core/font/font.c<br>
-@@ -30,6 +30,7 @@<br>
- #include &lt;grub/unicode.h&gt;<br>
- #include &lt;grub/fontformat.h&gt;<br>
- #include &lt;grub/env.h&gt;<br>
-+#include &lt;grub/safemath.h&gt;<br>
- <br>
- GRUB_MOD_LICENSE (&quot;GPLv3+&quot;);<br>
- <br>
-@@ -360,9 +361,13 @@ static char *<br>
- read_section_as_string (struct font_file_section *section)<br>
- {<br>
-=C2=A0 =C2=A0char *str;<br>
-+=C2=A0 grub_size_t sz;<br>
-=C2=A0 =C2=A0grub_ssize_t ret;<br>
- <br>
--=C2=A0 str =3D grub_malloc (section-&gt;length + 1);<br>
-+=C2=A0 if (grub_add (section-&gt;length, 1, &amp;sz))<br>
-+=C2=A0 =C2=A0 return NULL;<br>
-+<br>
-+=C2=A0 str =3D grub_malloc (sz);<br>
-=C2=A0 =C2=A0if (!str)<br>
-=C2=A0 =C2=A0 =C2=A0return 0;<br>
- <br>
-diff --git a/grub-core/fs/btrfs.c b/grub-core/fs/btrfs.c<br>
-index 11272ef..2b65bd5 100644<br>
---- a/grub-core/fs/btrfs.c<br>
-+++ b/grub-core/fs/btrfs.c<br>
-@@ -40,6 +40,7 @@<br>
- #include &lt;grub/btrfs.h&gt;<br>
- #include &lt;grub/crypto.h&gt;<br>
- #include &lt;grub/diskfilter.h&gt;<br>
-+#include &lt;grub/safemath.h&gt;<br>
- <br>
- GRUB_MOD_LICENSE (&quot;GPLv3+&quot;);<br>
- <br>
-@@ -329,9 +330,13 @@ save_ref (struct grub_btrfs_leaf_descriptor *desc,<b=
r>
-=C2=A0 =C2=A0if (desc-&gt;allocated &lt; desc-&gt;depth)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0void *newdata;<br>
--=C2=A0 =C2=A0 =C2=A0 desc-&gt;allocated *=3D 2;<br>
--=C2=A0 =C2=A0 =C2=A0 newdata =3D grub_realloc (desc-&gt;data, sizeof (de=
sc-&gt;data[0])<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 * desc-&gt;allocated);<br>
-+=C2=A0 =C2=A0 =C2=A0 grub_size_t sz;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 if (grub_mul (desc-&gt;allocated, 2, &amp;desc-&gt;=
allocated) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_mul (desc-&gt;allocated, sizeof (desc-&=
gt;data[0]), &amp;sz))<br>
-+=C2=A0 =C2=A0 =C2=A0 return GRUB_ERR_OUT_OF_RANGE;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 newdata =3D grub_realloc (desc-&gt;data, sz);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!newdata)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return grub_errno;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0desc-&gt;data =3D newdata;<br>
-@@ -622,16 +627,21 @@ find_device (struct grub_btrfs_data *data, grub_uin=
t64_t id)<br>
-=C2=A0 =C2=A0if (data-&gt;n_devices_attached &gt; data-&gt;n_devices_allo=
cated)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0void *tmp;<br>
--=C2=A0 =C2=A0 =C2=A0 data-&gt;n_devices_allocated =3D 2 * data-&gt;n_dev=
ices_attached + 1;<br>
--=C2=A0 =C2=A0 =C2=A0 data-&gt;devices_attached<br>
--=C2=A0 =C2=A0 =C2=A0 =3D grub_realloc (tmp =3D data-&gt;devices_attached=
,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 data-&gt;n_devices_allocated<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 * sizeof (data-&gt;devices_attached[0]));<br>
-+=C2=A0 =C2=A0 =C2=A0 grub_size_t sz;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 if (grub_mul (data-&gt;n_devices_attached, 2, &amp;=
data-&gt;n_devices_allocated) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_add (data-&gt;n_devices_allocated, 1, &=
amp;data-&gt;n_devices_allocated) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_mul (data-&gt;n_devices_allocated, size=
of (data-&gt;devices_attached[0]), &amp;sz))<br>
-+=C2=A0 =C2=A0 =C2=A0 goto fail;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 data-&gt;devices_attached =3D grub_realloc (tmp =3D=
 data-&gt;devices_attached, sz);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!data-&gt;devices_attached)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 data-&gt;devices_attached =3D tmp;<br>
-+<br>
-+ fail:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ctx.dev_found)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_device_close (ctx.dev_found=
);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 data-&gt;devices_attached =3D tmp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-diff --git a/grub-core/fs/ext2.c b/grub-core/fs/ext2.c<br>
-index 9b38980..ac33bcd 100644<br>
---- a/grub-core/fs/ext2.c<br>
-+++ b/grub-core/fs/ext2.c<br>
-@@ -46,6 +46,7 @@<br>
- #include &lt;grub/dl.h&gt;<br>
- #include &lt;grub/types.h&gt;<br>
- #include &lt;grub/fshelp.h&gt;<br>
-+#include &lt;grub/safemath.h&gt;<br>
- <br>
- GRUB_MOD_LICENSE (&quot;GPLv3+&quot;);<br>
- <br>
-@@ -703,6 +704,7 @@ grub_ext2_read_symlink (grub_fshelp_node_t node)<br>
- {<br>
-=C2=A0 =C2=A0char *symlink;<br>
-=C2=A0 =C2=A0struct grub_fshelp_node *diro =3D node;<br>
-+=C2=A0 grub_size_t sz;<br>
- <br>
-=C2=A0 =C2=A0if (! diro-&gt;inode_read)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-@@ -717,7 +719,13 @@ grub_ext2_read_symlink (grub_fshelp_node_t node)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
- <br>
--=C2=A0 symlink =3D grub_malloc (grub_le_to_cpu32 (diro-&gt;inode.size) +=
 1);<br>
-+=C2=A0 if (grub_add (grub_le_to_cpu32 (diro-&gt;inode.size), 1, &amp;sz)=
)<br>
-+=C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 grub_error (GRUB_ERR_OUT_OF_RANGE, N_(&quot;overflo=
w is detected&quot;));<br>
-+=C2=A0 =C2=A0 =C2=A0 return NULL;<br>
-+=C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 symlink =3D grub_malloc (sz);<br>
-=C2=A0 =C2=A0if (! symlink)<br>
-=C2=A0 =C2=A0 =C2=A0return 0;<br>
- <br>
-diff --git a/grub-core/fs/iso9660.c b/grub-core/fs/iso9660.c<br>
-index 4f1b52a..7ba5b30 100644<br>
---- a/grub-core/fs/iso9660.c<br>
-+++ b/grub-core/fs/iso9660.c<br>
-@@ -28,6 +28,7 @@<br>
- #include &lt;grub/fshelp.h&gt;<br>
- #include &lt;grub/charset.h&gt;<br>
- #include &lt;grub/datetime.h&gt;<br>
-+#include &lt;grub/safemath.h&gt;<br>
- <br>
- GRUB_MOD_LICENSE (&quot;GPLv3+&quot;);<br>
- <br>
-@@ -531,8 +532,13 @@ add_part (struct iterate_dir_ctx *ctx,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int len2)<br>
- {<br>
-=C2=A0 =C2=A0int size =3D ctx-&gt;symlink ? grub_strlen (ctx-&gt;symlink)=
 : 0;<br>
-+=C2=A0 grub_size_t sz;<br>
- <br>
--=C2=A0 ctx-&gt;symlink =3D grub_realloc (ctx-&gt;symlink, size + len2 + =
1);<br>
-+=C2=A0 if (grub_add (size, len2, &amp;sz) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 grub_add (sz, 1, &amp;sz))<br>
-+=C2=A0 =C2=A0 return;<br>
-+<br>
-+=C2=A0 ctx-&gt;symlink =3D grub_realloc (ctx-&gt;symlink, sz);<br>
-=C2=A0 =C2=A0if (! ctx-&gt;symlink)<br>
-=C2=A0 =C2=A0 =C2=A0return;<br>
- <br>
-@@ -560,17 +566,24 @@ susp_iterate_dir (struct grub_iso9660_susp_entry *e=
ntry,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_size_t off =3D 0, csize =3D 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *old;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_size_t sz;<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0csize =3D entry-&gt;len - 5;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0old =3D ctx-&gt;filename;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ctx-&gt;filename_alloc)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0off =3D grub_strlen (ctx-=
&gt;filename);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;filename =3D grub_real=
loc (ctx-&gt;filename, csize + off + 1);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (grub_add (csize, off, &amp=
;sz) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_add (sz, 1,=
 &amp;sz))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return GRUB_ERR_OUT_OF_=
RANGE;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;filename =3D grub_real=
loc (ctx-&gt;filename, sz);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0off =3D 0;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;filename =3D grub_zall=
oc (csize + 1);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (grub_add (csize, 1, &amp;s=
z))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return GRUB_ERR_OUT_OF_=
RANGE;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;filename =3D grub_zall=
oc (sz);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ctx-&gt;filename)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-@@ -776,14 +789,18 @@ grub_iso9660_iterate_dir (grub_fshelp_node_t dir,<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (node-&gt;have_dirents &gt;=
=3D node-&gt;alloc_dirents)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct grub_fshelp=
_node *new_node;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 node-&gt;alloc_dirents =
*=3D 2;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new_node =3D grub_reall=
oc (node, <br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeo=
f (struct grub_fshelp_node)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+ ((n=
ode-&gt;alloc_dirents<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0- ARRAY_SIZE (node-&gt;dirents))<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 * sizeof (node-&gt;dirents[0])));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_size_t sz;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (grub_mul (node-&gt;=
alloc_dirents, 2, &amp;node-&gt;alloc_dirents) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_sub =
(node-&gt;alloc_dirents, ARRAY_SIZE (node-&gt;dirents), &amp;sz) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_mul =
(sz, sizeof (node-&gt;dirents[0]), &amp;sz) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_add =
(sz, sizeof (struct grub_fshelp_node), &amp;sz))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail_0;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new_node =3D grub_reall=
oc (node, sz);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!new_node)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-+ fail_0:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (=
ctx.filename_alloc)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0grub_free (ctx.filename);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub=
_free (node);<br>
-@@ -799,14 +816,18 @@ grub_iso9660_iterate_dir (grub_fshelp_node_t dir,<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* sizeof (node-&gt=
;dirents[0]) &lt; grub_strlen (ctx.symlink) + 1)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct grub_fshelp=
_node *new_node;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new_node =3D grub_reall=
oc (node,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeo=
f (struct grub_fshelp_node)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+ ((n=
ode-&gt;alloc_dirents<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0- ARRAY_SIZE (node-&gt;dirents))<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 * sizeof (node-&gt;dirents[0]))<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+ gru=
b_strlen (ctx.symlink) + 1);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_size_t sz;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (grub_sub (node-&gt;=
alloc_dirents, ARRAY_SIZE (node-&gt;dirents), &amp;sz) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_mul =
(sz, sizeof (node-&gt;dirents[0]), &amp;sz) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_add =
(sz, sizeof (struct grub_fshelp_node) + 1, &amp;sz) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_add =
(sz, grub_strlen (ctx.symlink), &amp;sz))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail_1;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new_node =3D grub_reall=
oc (node, sz);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!new_node)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-+ fail_1:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (=
ctx.filename_alloc)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0grub_free (ctx.filename);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub=
_free (node);<br>
-diff --git a/grub-core/fs/sfs.c b/grub-core/fs/sfs.c<br>
-index 90f7fb3..de2b107 100644<br>
---- a/grub-core/fs/sfs.c<br>
-+++ b/grub-core/fs/sfs.c<br>
-@@ -26,6 +26,7 @@<br>
- #include &lt;grub/types.h&gt;<br>
- #include &lt;grub/fshelp.h&gt;<br>
- #include &lt;grub/charset.h&gt;<br>
-+#include &lt;grub/safemath.h&gt;<br>
- <br>
- GRUB_MOD_LICENSE (&quot;GPLv3+&quot;);<br>
- <br>
-@@ -307,10 +308,15 @@ grub_sfs_read_block (grub_fshelp_node_t node, grub_=
disk_addr_t fileblock)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (node-&gt;cache &amp;&amp; node-&gt;cache_s=
ize &gt;=3D node-&gt;cache_allocated)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct cache_entry *e =3D node-&gt;cach=
e;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 e =3D grub_realloc (node-&gt;cache,node-&gt;=
cache_allocated * 2<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 * sizeof (e[0]));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_size_t sz;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (grub_mul (node-&gt;cache_allocated, 2 * =
sizeof (e[0]), &amp;sz))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 e =3D grub_realloc (node-&gt;cache, sz);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!e)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-+ fail:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_errno =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (node-&gt;cache=
);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0node-&gt;cache =3D 0;<br>
-@@ -477,10 +483,16 @@ grub_sfs_create_node (struct grub_fshelp_node **nod=
e,<br>
-=C2=A0 =C2=A0grub_size_t len =3D grub_strlen (name);<br>
-=C2=A0 =C2=A0grub_uint8_t *name_u8;<br>
-=C2=A0 =C2=A0int ret;<br>
-+=C2=A0 grub_size_t sz;<br>
-+<br>
-+=C2=A0 if (grub_mul (len, GRUB_MAX_UTF8_PER_LATIN1, &amp;sz) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 grub_add (sz, 1, &amp;sz))<br>
-+=C2=A0 =C2=A0 return 1;<br>
-+<br>
-=C2=A0 =C2=A0*node =3D grub_malloc (sizeof (**node));<br>
-=C2=A0 =C2=A0if (!*node)<br>
-=C2=A0 =C2=A0 =C2=A0return 1;<br>
--=C2=A0 name_u8 =3D grub_malloc (len * GRUB_MAX_UTF8_PER_LATIN1 + 1);<br>
-+=C2=A0 name_u8 =3D grub_malloc (sz);<br>
-=C2=A0 =C2=A0if (!name_u8)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (*node);<br>
-@@ -724,8 +736,13 @@ grub_sfs_label (grub_device_t device, char **label)<=
br>
-=C2=A0 =C2=A0data =3D grub_sfs_mount (disk);<br>
-=C2=A0 =C2=A0if (data)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
--=C2=A0 =C2=A0 =C2=A0 grub_size_t len =3D grub_strlen (data-&gt;label);<b=
r>
--=C2=A0 =C2=A0 =C2=A0 *label =3D grub_malloc (len * GRUB_MAX_UTF8_PER_LAT=
IN1 + 1);<br>
-+=C2=A0 =C2=A0 =C2=A0 grub_size_t sz, len =3D grub_strlen (data-&gt;label=
);<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 if (grub_mul (len, GRUB_MAX_UTF8_PER_LATIN1, &amp;s=
z) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_add (sz, 1, &amp;sz))<br>
-+=C2=A0 =C2=A0 =C2=A0 return GRUB_ERR_OUT_OF_RANGE;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 *label =3D grub_malloc (sz);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (*label)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0*grub_latin1_to_utf8 ((grub_uint8_t *) *label,=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(const grub_uint8_t *) data-&gt;label,<br>
-diff --git a/grub-core/fs/squash4.c b/grub-core/fs/squash4.c<br>
-index 95d5c1e..7851238 100644<br>
---- a/grub-core/fs/squash4.c<br>
-+++ b/grub-core/fs/squash4.c<br>
-@@ -26,6 +26,7 @@<br>
- #include &lt;grub/types.h&gt;<br>
- #include &lt;grub/fshelp.h&gt;<br>
- #include &lt;grub/deflate.h&gt;<br>
-+#include &lt;grub/safemath.h&gt;<br>
- #include &lt;minilzo.h&gt;<br>
- <br>
- #include &quot;xz.h&quot;<br>
-@@ -459,7 +460,17 @@ grub_squash_read_symlink (grub_fshelp_node_t node)<b=
r>
- {<br>
-=C2=A0 =C2=A0char *ret;<br>
-=C2=A0 =C2=A0grub_err_t err;<br>
--=C2=A0 ret =3D grub_malloc (grub_le_to_cpu32 (node-&gt;ino.symlink.namel=
en) + 1);<br>
-+=C2=A0 grub_size_t sz;<br>
-+<br>
-+=C2=A0 if (grub_add (grub_le_to_cpu32 (node-&gt;ino.symlink.namelen), 1,=
 &amp;sz))<br>
-+=C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 grub_error (GRUB_ERR_OUT_OF_RANGE, N_(&quot;overflo=
w is detected&quot;));<br>
-+=C2=A0 =C2=A0 =C2=A0 return NULL;<br>
-+=C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 ret =3D grub_malloc (sz);<br>
-+=C2=A0 if (!ret)<br>
-+=C2=A0 =C2=A0 return NULL;<br>
- <br>
-=C2=A0 =C2=A0err =3D read_chunk (node-&gt;data, ret,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub=
_le_to_cpu32 (node-&gt;ino.symlink.namelen),<br>
-@@ -506,11 +517,16 @@ grub_squash_iterate_dir (grub_fshelp_node_t dir,<br=
>
- <br>
-=C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0grub_fshelp_node_t node;<br>
--=C2=A0 =C2=A0 node =3D grub_malloc (sizeof (*node) + dir-&gt;stsize * si=
zeof (dir-&gt;stack[0]));<br>
-+=C2=A0 =C2=A0 grub_size_t sz;<br>
-+<br>
-+=C2=A0 =C2=A0 if (grub_mul (dir-&gt;stsize, sizeof (dir-&gt;stack[0]), &=
amp;sz) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 grub_add (sz, sizeof (*node), &amp;sz))<br>
-+=C2=A0 =C2=A0 =C2=A0 return 0;<br>
-+<br>
-+=C2=A0 =C2=A0 node =3D grub_malloc (sz);<br>
-=C2=A0 =C2=A0 =C2=A0if (!node)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
--=C2=A0 =C2=A0 grub_memcpy (node, dir,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof (*node) + =
dir-&gt;stsize * sizeof (dir-&gt;stack[0]));<br>
-+=C2=A0 =C2=A0 grub_memcpy (node, dir, sz);<br>
-=C2=A0 =C2=A0 =C2=A0if (hook (&quot;.&quot;, GRUB_FSHELP_DIR, node, hook_=
data))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
- <br>
-@@ -518,12 +534,15 @@ grub_squash_iterate_dir (grub_fshelp_node_t dir,<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_err_t err;<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 node =3D grub_malloc (sizeof (*node) + dir-&gt;stsi=
ze * sizeof (dir-&gt;stack[0]));<br>
-+=C2=A0 =C2=A0 =C2=A0 if (grub_mul (dir-&gt;stsize, sizeof (dir-&gt;stack=
[0]), &amp;sz) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_add (sz, sizeof (*node), &amp;sz=
))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 node =3D grub_malloc (sz);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!node)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 grub_memcpy (node, dir,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0siz=
eof (*node) + dir-&gt;stsize * sizeof (dir-&gt;stack[0]));<br>
-+=C2=A0 =C2=A0 =C2=A0 grub_memcpy (node, dir, sz);<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0node-&gt;stsize--;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D read_chunk (dir-&gt;data, &amp;node-&g=
t;ino, sizeof (node-&gt;ino),<br>
-@@ -557,6 +576,7 @@ grub_squash_iterate_dir (grub_fshelp_node_t dir,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enum grub_fshelp_filetype filetype =3D =
GRUB_FSHELP_REG;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct grub_squash_dirent di;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct grub_squash_inode ino;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_size_t sz;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D read_chunk (dir-&gt;data, &amp;=
di, sizeof (di),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0grub_le_to_cpu64 (dir-&gt;data-&gt;sb.diroffset)<b=
r>
-@@ -589,13 +609,16 @@ grub_squash_iterate_dir (grub_fshelp_node_t dir,<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (grub_le_to_cpu16 (di.type) =3D=3D S=
QUASH_TYPE_SYMLINK)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0filetype =3D GRUB_FSHELP_SYMLINK=
;<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 node =3D grub_malloc (sizeof (*node)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 + (dir-&gt;stsize + 1) * sizeof (dir-&gt;stack=
[0]));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (grub_add (dir-&gt;stsize, 1, &amp;sz) ||=
<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_mul (sz, sizeof (dir-&gt;=
stack[0]), &amp;sz) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_add (sz, sizeof (*node), =
&amp;sz))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 node =3D grub_malloc (sz);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (! node)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_memcpy (node, dir,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0sizeof (*node) + dir-&gt;stsize * sizeof (dir-&gt;stack[0]));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_memcpy (node, dir, sz - sizeof(dir-&gt;=
stack[0]));<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0node-&gt;ino =3D ino;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0node-&gt;stack[node-&gt;stsize].ino_chu=
nk =3D grub_le_to_cpu32 (dh.ino_chunk);<br>
-diff --git a/grub-core/fs/udf.c b/grub-core/fs/udf.c<br>
-index a837616..21ac7f4 100644<br>
---- a/grub-core/fs/udf.c<br>
-+++ b/grub-core/fs/udf.c<br>
-@@ -28,6 +28,7 @@<br>
- #include &lt;grub/charset.h&gt;<br>
- #include &lt;grub/datetime.h&gt;<br>
- #include &lt;grub/udf.h&gt;<br>
-+#include &lt;grub/safemath.h&gt;<br>
- <br>
- GRUB_MOD_LICENSE (&quot;GPLv3+&quot;);<br>
- <br>
-@@ -890,9 +891,19 @@ read_string (const grub_uint8_t *raw, grub_size_t sz=
, char *outbuf)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0utf16[i] =3D (raw[2 * i + 1] &lt;&lt; 8) | raw=
[2*i + 2];<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0if (!outbuf)<br>
--=C2=A0 =C2=A0 outbuf =3D grub_malloc (utf16len * GRUB_MAX_UTF8_PER_UTF16=
 + 1);<br>
-+=C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 grub_size_t size;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 if (grub_mul (utf16len, GRUB_MAX_UTF8_PER_UTF16, &a=
mp;size) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_add (size, 1, &amp;size))<br>
-+=C2=A0 =C2=A0 =C2=A0 goto fail;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 outbuf =3D grub_malloc (size);<br>
-+=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0if (outbuf)<br>
-=C2=A0 =C2=A0 =C2=A0*grub_utf16_to_utf8 ((grub_uint8_t *) outbuf, utf16, =
utf16len) =3D &#39;\0&#39;;<br>
-+<br>
-+ fail:<br>
-=C2=A0 =C2=A0grub_free (utf16);<br>
-=C2=A0 =C2=A0return outbuf;<br>
- }<br>
-@@ -1005,7 +1016,7 @@ grub_udf_read_symlink (grub_fshelp_node_t node)<br>
-=C2=A0 =C2=A0grub_size_t sz =3D U64 (node-&gt;block.fe.file_size);<br>
-=C2=A0 =C2=A0grub_uint8_t *raw;<br>
-=C2=A0 =C2=A0const grub_uint8_t *ptr;<br>
--=C2=A0 char *out, *optr;<br>
-+=C2=A0 char *out =3D NULL, *optr;<br>
- <br>
-=C2=A0 =C2=A0if (sz &lt; 4)<br>
-=C2=A0 =C2=A0 =C2=A0return NULL;<br>
-@@ -1013,14 +1024,16 @@ grub_udf_read_symlink (grub_fshelp_node_t node)<b=
r>
-=C2=A0 =C2=A0if (!raw)<br>
-=C2=A0 =C2=A0 =C2=A0return NULL;<br>
-=C2=A0 =C2=A0if (grub_udf_read_file (node, NULL, NULL, 0, sz, (char *) ra=
w) &lt; 0)<br>
--=C2=A0 =C2=A0 {<br>
--=C2=A0 =C2=A0 =C2=A0 grub_free (raw);<br>
--=C2=A0 =C2=A0 =C2=A0 return NULL;<br>
--=C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 goto fail_1;<br>
- <br>
--=C2=A0 out =3D grub_malloc (sz * 2 + 1);<br>
-+=C2=A0 if (grub_mul (sz, 2, &amp;sz) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 grub_add (sz, 1, &amp;sz))<br>
-+=C2=A0 =C2=A0 goto fail_0;<br>
-+<br>
-+=C2=A0 out =3D grub_malloc (sz);<br>
-=C2=A0 =C2=A0if (!out)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-+ fail_0:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (raw);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-@@ -1031,17 +1044,17 @@ grub_udf_read_symlink (grub_fshelp_node_t node)<b=
r>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_size_t s;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((grub_size_t) (ptr - raw + 4) &gt; sz)<br>
--=C2=A0 =C2=A0 =C2=A0 goto fail;<br>
-+=C2=A0 =C2=A0 =C2=A0 goto fail_1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(ptr[2] =3D=3D 0 &amp;&amp; ptr[3] =3D=3D=
 0))<br>
--=C2=A0 =C2=A0 =C2=A0 goto fail;<br>
-+=C2=A0 =C2=A0 =C2=A0 goto fail_1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0s =3D 4 + ptr[1];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((grub_size_t) (ptr - raw + s) &gt; sz)<br>
--=C2=A0 =C2=A0 =C2=A0 goto fail;<br>
-+=C2=A0 =C2=A0 =C2=A0 goto fail_1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (*ptr)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case 1:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ptr[1])<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail_1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Fallthrough.=C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case 2:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* in 4 bytes. out: 1 byte.=C2=A0 */<br=
>
-@@ -1066,11 +1079,11 @@ grub_udf_read_symlink (grub_fshelp_node_t node)<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (optr !=3D out)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*optr++ =3D &#39;/&#39;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!read_string (ptr + 4, s - 4, optr)=
)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail_1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0optr +=3D grub_strlen (optr);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail_1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ptr +=3D s;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-@@ -1078,7 +1091,7 @@ grub_udf_read_symlink (grub_fshelp_node_t node)<br>
-=C2=A0 =C2=A0grub_free (raw);<br>
-=C2=A0 =C2=A0return out;<br>
- <br>
-- fail:<br>
-+ fail_1:<br>
-=C2=A0 =C2=A0grub_free (raw);<br>
-=C2=A0 =C2=A0grub_free (out);<br>
-=C2=A0 =C2=A0grub_error (GRUB_ERR_BAD_FS, &quot;invalid symlink&quot;);<b=
r>
-diff --git a/grub-core/fs/xfs.c b/grub-core/fs/xfs.c<br>
-index 96ffecb..ea65902 100644<br>
---- a/grub-core/fs/xfs.c<br>
-+++ b/grub-core/fs/xfs.c<br>
-@@ -25,6 +25,7 @@<br>
- #include &lt;grub/dl.h&gt;<br>
- #include &lt;grub/types.h&gt;<br>
- #include &lt;grub/fshelp.h&gt;<br>
-+#include &lt;grub/safemath.h&gt;<br>
- <br>
- GRUB_MOD_LICENSE (&quot;GPLv3+&quot;);<br>
- <br>
-@@ -899,6 +900,7 @@ static struct grub_xfs_data *<br>
- grub_xfs_mount (grub_disk_t disk)<br>
- {<br>
-=C2=A0 =C2=A0struct grub_xfs_data *data =3D 0;<br>
-+=C2=A0 grub_size_t sz;<br>
- <br>
-=C2=A0 =C2=A0data =3D grub_zalloc (sizeof (struct grub_xfs_data));<br>
-=C2=A0 =C2=A0if (!data)<br>
-@@ -913,10 +915,11 @@ grub_xfs_mount (grub_disk_t disk)<br>
-=C2=A0 =C2=A0if (!grub_xfs_sb_valid(data))<br>
-=C2=A0 =C2=A0 =C2=A0goto fail;<br>
- <br>
--=C2=A0 data =3D grub_realloc (data,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0sizeof (struct grub_xfs_data)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0- sizeof (struct grub_xfs_inode)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0+ grub_xfs_inode_size(data) + 1);<br>
-+=C2=A0 if (grub_add (grub_xfs_inode_size (data),<br>
-+=C2=A0 =C2=A0 =C2=A0 sizeof (struct grub_xfs_data) - sizeof (struct grub=
_xfs_inode) + 1, &amp;sz))<br>
-+=C2=A0 =C2=A0 goto fail;<br>
-+<br>
-+=C2=A0 data =3D grub_realloc (data, sz);<br>
- <br>
-=C2=A0 =C2=A0if (! data)<br>
-=C2=A0 =C2=A0 =C2=A0goto fail;<br>
-diff --git a/grub-core/fs/zfs/zfs.c b/grub-core/fs/zfs/zfs.c<br>
-index 381dde5..36d0373 100644<br>
---- a/grub-core/fs/zfs/zfs.c<br>
-+++ b/grub-core/fs/zfs/zfs.c<br>
-@@ -55,6 +55,7 @@<br>
- #include &lt;grub/deflate.h&gt;<br>
- #include &lt;grub/crypto.h&gt;<br>
- #include &lt;grub/i18n.h&gt;<br>
-+#include &lt;grub/safemath.h&gt;<br>
- <br>
- GRUB_MOD_LICENSE (&quot;GPLv3+&quot;);<br>
- <br>
-@@ -773,11 +774,14 @@ fill_vdev_info (struct grub_zfs_data *data,<br>
-=C2=A0 =C2=A0if (data-&gt;n_devices_attached &gt; data-&gt;n_devices_allo=
cated)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0void *tmp;<br>
--=C2=A0 =C2=A0 =C2=A0 data-&gt;n_devices_allocated =3D 2 * data-&gt;n_dev=
ices_attached + 1;<br>
--=C2=A0 =C2=A0 =C2=A0 data-&gt;devices_attached<br>
--=C2=A0 =C2=A0 =C2=A0 =3D grub_realloc (tmp =3D data-&gt;devices_attached=
,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 data-&gt;n_devices_allocated<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 * sizeof (data-&gt;devices_attached[0]));<br>
-+=C2=A0 =C2=A0 =C2=A0 grub_size_t sz;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 if (grub_mul (data-&gt;n_devices_attached, 2, &amp;=
data-&gt;n_devices_allocated) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_add (data-&gt;n_devices_allocated, 1, &=
amp;data-&gt;n_devices_allocated) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_mul (data-&gt;n_devices_allocated, size=
of (data-&gt;devices_attached[0]), &amp;sz))<br>
-+=C2=A0 =C2=A0 =C2=A0 return GRUB_ERR_OUT_OF_RANGE;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 data-&gt;devices_attached =3D grub_realloc (tmp =3D=
 data-&gt;devices_attached, sz);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!data-&gt;devices_attached)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data-&gt;devices_attached =3D tmp;<br>
-@@ -3468,14 +3472,18 @@ grub_zfs_nvlist_lookup_nvlist (const char *nvlist=
, const char *name)<br>
- {<br>
-=C2=A0 =C2=A0char *nvpair;<br>
-=C2=A0 =C2=A0char *ret;<br>
--=C2=A0 grub_size_t size;<br>
-+=C2=A0 grub_size_t size, sz;<br>
-=C2=A0 =C2=A0int found;<br>
- <br>
-=C2=A0 =C2=A0found =3D nvlist_find_value (nvlist, name, DATA_TYPE_NVLIST,=
 &amp;nvpair,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 &amp;size, 0);<br>
-=C2=A0 =C2=A0if (!found)<br>
-=C2=A0 =C2=A0 =C2=A0return 0;<br>
--=C2=A0 ret =3D grub_zalloc (size + 3 * sizeof (grub_uint32_t));<br>
-+<br>
-+=C2=A0 if (grub_add (size, 3 * sizeof (grub_uint32_t), &amp;sz))<br>
-+=C2=A0 =C2=A0 =C2=A0 return 0;<br>
-+<br>
-+=C2=A0 ret =3D grub_zalloc (sz);<br>
-=C2=A0 =C2=A0if (!ret)<br>
-=C2=A0 =C2=A0 =C2=A0return 0;<br>
-=C2=A0 =C2=A0grub_memcpy (ret, nvlist, sizeof (grub_uint32_t));<br>
-diff --git a/grub-core/fs/zfs/zfscrypt.c b/grub-core/fs/zfs/zfscrypt.c<br=
>
-index 1402e0b..de3b015 100644<br>
---- a/grub-core/fs/zfs/zfscrypt.c<br>
-+++ b/grub-core/fs/zfs/zfscrypt.c<br>
-@@ -22,6 +22,7 @@<br>
- #include &lt;grub/misc.h&gt;<br>
- #include &lt;grub/disk.h&gt;<br>
- #include &lt;grub/partition.h&gt;<br>
-+#include &lt;grub/safemath.h&gt;<br>
- #include &lt;grub/dl.h&gt;<br>
- #include &lt;grub/types.h&gt;<br>
- #include &lt;grub/zfs/zfs.h&gt;<br>
-@@ -82,9 +83,13 @@ grub_zfs_add_key (grub_uint8_t *key_in,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int passphr=
ase)<br>
- {<br>
-=C2=A0 =C2=A0struct grub_zfs_wrap_key *key;<br>
-+=C2=A0 grub_size_t sz;<br>
-+<br>
-=C2=A0 =C2=A0if (!passphrase &amp;&amp; keylen &gt; 32)<br>
-=C2=A0 =C2=A0 =C2=A0keylen =3D 32;<br>
--=C2=A0 key =3D grub_malloc (sizeof (*key) + keylen);<br>
-+=C2=A0 if (grub_add (sizeof (*key), keylen, &amp;sz))<br>
-+=C2=A0 =C2=A0 return GRUB_ERR_OUT_OF_RANGE;<br>
-+=C2=A0 key =3D grub_malloc (sz);<br>
-=C2=A0 =C2=A0if (!key)<br>
-=C2=A0 =C2=A0 =C2=A0return grub_errno;<br>
-=C2=A0 =C2=A0key-&gt;is_passphrase =3D passphrase;<br>
-diff --git a/grub-core/lib/arg.c b/grub-core/lib/arg.c<br>
-index fd7744a..3288609 100644<br>
---- a/grub-core/lib/arg.c<br>
-+++ b/grub-core/lib/arg.c<br>
-@@ -23,6 +23,7 @@<br>
- #include &lt;grub/term.h&gt;<br>
- #include &lt;grub/extcmd.h&gt;<br>
- #include &lt;grub/i18n.h&gt;<br>
-+#include &lt;grub/safemath.h&gt;<br>
- <br>
- /* Built-in parser for default options.=C2=A0 */<br>
- static const struct grub_arg_option help_options[] =3D<br>
-@@ -216,7 +217,13 @@ static inline grub_err_t<br>
- add_arg (char ***argl, int *num, char *s)<br>
- {<br>
-=C2=A0 =C2=A0char **p =3D *argl;<br>
--=C2=A0 *argl =3D grub_realloc (*argl, (++(*num) + 1) * sizeof (char *));=
<br>
-+=C2=A0 grub_size_t sz;<br>
-+<br>
-+=C2=A0 if (grub_add (++(*num), 1, &amp;sz) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 grub_mul (sz, sizeof (char *), &amp;sz))<br>
-+=C2=A0 =C2=A0 return grub_error (GRUB_ERR_OUT_OF_RANGE, N_(&quot;overflo=
w is detected&quot;));<br>
-+<br>
-+=C2=A0 *argl =3D grub_realloc (*argl, sz);<br>
-=C2=A0 =C2=A0if (! *argl)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (p);<br>
-@@ -431,6 +438,7 @@ grub_arg_list_alloc(grub_extcmd_t extcmd, int argc,<b=
r>
-=C2=A0 =C2=A0grub_size_t argcnt;<br>
-=C2=A0 =C2=A0struct grub_arg_list *list;<br>
-=C2=A0 =C2=A0const struct grub_arg_option *options;<br>
-+=C2=A0 grub_size_t sz0, sz1;<br>
- <br>
-=C2=A0 =C2=A0options =3D extcmd-&gt;options;<br>
-=C2=A0 =C2=A0if (! options)<br>
-@@ -443,7 +451,15 @@ grub_arg_list_alloc(grub_extcmd_t extcmd, int argc,<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0argcnt +=3D ((grub_size_t) argc + 1) / 2 + 1; =
/* max possible for any option */<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
- <br>
--=C2=A0 list =3D grub_zalloc (sizeof (*list) * i + sizeof (char*) * argcn=
t);<br>
-+=C2=A0 if (grub_mul (sizeof (*list), i, &amp;sz0) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 grub_mul (sizeof (char *), argcnt, &amp;sz1) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 grub_add (sz0, sz1, &amp;sz0))<br>
-+=C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 grub_error (GRUB_ERR_OUT_OF_RANGE, N_(&quot;overflo=
w is detected&quot;));<br>
-+=C2=A0 =C2=A0 =C2=A0 return 0;<br>
-+=C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 list =3D grub_zalloc (sz0);<br>
-=C2=A0 =C2=A0if (! list)<br>
-=C2=A0 =C2=A0 =C2=A0return 0;<br>
- <br>
-diff --git a/grub-core/loader/i386/bsd.c b/grub-core/loader/i386/bsd.c<br=
>
-index 3730ed3..b92cbe9 100644<br>
---- a/grub-core/loader/i386/bsd.c<br>
-+++ b/grub-core/loader/i386/bsd.c<br>
-@@ -35,6 +35,7 @@<br>
- #include &lt;grub/ns8250.h&gt;<br>
- #include &lt;grub/bsdlabel.h&gt;<br>
- #include &lt;grub/crypto.h&gt;<br>
-+#include &lt;grub/safemath.h&gt;<br>
- #include &lt;grub/verify.h&gt;<br>
- #ifdef GRUB_MACHINE_PCBIOS<br>
- #include &lt;grub/machine/int.h&gt;<br>
-@@ -1012,11 +1013,16 @@ grub_netbsd_add_modules (void)<br>
-=C2=A0 =C2=A0struct grub_netbsd_btinfo_modules *mods;<br>
-=C2=A0 =C2=A0unsigned i;<br>
-=C2=A0 =C2=A0grub_err_t err;<br>
-+=C2=A0 grub_size_t sz;<br>
- <br>
-=C2=A0 =C2=A0for (mod =3D netbsd_mods; mod; mod =3D mod-&gt;next)<br>
-=C2=A0 =C2=A0 =C2=A0modcnt++;<br>
- <br>
--=C2=A0 mods =3D grub_malloc (sizeof (*mods) + sizeof (mods-&gt;mods[0]) =
* modcnt);<br>
-+=C2=A0 if (grub_mul (modcnt, sizeof (mods-&gt;mods[0]), &amp;sz) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 grub_add (sz, sizeof (*mods), &amp;sz))<br>
-+=C2=A0 =C2=A0 return GRUB_ERR_OUT_OF_RANGE;<br>
-+<br>
-+=C2=A0 mods =3D grub_malloc (sz);<br>
-=C2=A0 =C2=A0if (!mods)<br>
-=C2=A0 =C2=A0 =C2=A0return grub_errno;<br>
- <br>
-diff --git a/grub-core/net/dns.c b/grub-core/net/dns.c<br>
-index e332d5e..906ec7d 100644<br>
---- a/grub-core/net/dns.c<br>
-+++ b/grub-core/net/dns.c<br>
-@@ -22,6 +22,7 @@<br>
- #include &lt;grub/i18n.h&gt;<br>
- #include &lt;grub/err.h&gt;<br>
- #include &lt;grub/time.h&gt;<br>
-+#include &lt;grub/safemath.h&gt;<br>
- <br>
- struct dns_cache_element<br>
- {<br>
-@@ -51,9 +52,15 @@ grub_net_add_dns_server (const struct grub_net_network=
_level_address *s)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int na =3D dns_servers_alloc * 2;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct grub_net_network_level_address *ns;<br>
-+=C2=A0 =C2=A0 =C2=A0 grub_size_t sz;<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (na &lt; 8)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0na =3D 8;<br>
--=C2=A0 =C2=A0 =C2=A0 ns =3D grub_realloc (dns_servers, na * sizeof (ns[0=
]));<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 if (grub_mul (na, sizeof (ns[0]), &amp;sz))<br>
-+=C2=A0 =C2=A0 =C2=A0 return GRUB_ERR_OUT_OF_RANGE;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 ns =3D grub_realloc (dns_servers, sz);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ns)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return grub_errno;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dns_servers_alloc =3D na;<br>
-diff --git a/grub-core/normal/charset.c b/grub-core/normal/charset.c<br>
-index d57fb72..4dfcc31 100644<br>
---- a/grub-core/normal/charset.c<br>
-+++ b/grub-core/normal/charset.c<br>
-@@ -48,6 +48,7 @@<br>
- #include &lt;grub/unicode.h&gt;<br>
- #include &lt;grub/term.h&gt;<br>
- #include &lt;grub/normal.h&gt;<br>
-+#include &lt;grub/safemath.h&gt;<br>
- <br>
- #if HAVE_FONT_SOURCE<br>
- #include &quot;widthspec.h&quot;<br>
-@@ -464,6 +465,7 @@ grub_unicode_aglomerate_comb (const grub_uint32_t *in=
, grub_size_t inlen,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct grub_unicode_combining *n;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned j;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_size_t sz;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!haveout)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
-@@ -477,10 +479,14 @@ grub_unicode_aglomerate_comb (const grub_uint32_t *=
in, grub_size_t inlen,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0n =3D out-&gt;combining_inline;<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else if (out-&gt;ncomb &gt; (int) ARRAY=
_SIZE (out-&gt;combining_inline))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 n =3D grub_realloc (out-&gt;co=
mbining_ptr,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof (n[0]) * (out-&gt;ncomb + 1));<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (grub_add (out-&gt;ncomb, 1=
, &amp;sz) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_mul (sz, si=
zeof (n[0]), &amp;sz))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 n =3D grub_realloc (out-&gt;co=
mbining_ptr, sz);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!n)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-+ fail:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_errno =
=
=3D GRUB_ERR_NONE;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-diff --git a/grub-core/normal/cmdline.c b/grub-core/normal/cmdline.c<br>
-index c57242e..de03fe6 100644<br>
---- a/grub-core/normal/cmdline.c<br>
-+++ b/grub-core/normal/cmdline.c<br>
-@@ -28,6 +28,7 @@<br>
- #include &lt;grub/env.h&gt;<br>
- #include &lt;grub/i18n.h&gt;<br>
- #include &lt;grub/charset.h&gt;<br>
-+#include &lt;grub/safemath.h&gt;<br>
- <br>
- static grub_uint32_t *kill_buf;<br>
- <br>
-@@ -307,12 +308,21 @@ cl_insert (struct cmdline_term *cl_terms, unsigned =
nterms,<br>
-=C2=A0 =C2=A0if (len + (*llen) &gt;=3D (*max_len))<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_uint32_t *nbuf;<br>
--=C2=A0 =C2=A0 =C2=A0 (*max_len) *=3D 2;<br>
--=C2=A0 =C2=A0 =C2=A0 nbuf =3D grub_realloc ((*buf), sizeof (grub_uint32_=
t) * (*max_len));<br>
-+=C2=A0 =C2=A0 =C2=A0 grub_size_t sz;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 if (grub_mul (*max_len, 2, max_len) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_mul (*max_len, sizeof (grub_uint32_t), =
&amp;sz))<br>
-+=C2=A0 =C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_errno =3D GRUB_ERR_OUT_OF_RANGE;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 nbuf =3D grub_realloc ((*buf), sz);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (nbuf)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0(*buf) =3D nbuf;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-+ fail:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_print_error ();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_errno =3D GRUB_ERR_NONE;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(*max_len) /=3D 2;<br>
-diff --git a/grub-core/normal/menu_entry.c b/grub-core/normal/menu_entry.=
c<br>
-index 1993995..50eef91 100644<br>
---- a/grub-core/normal/menu_entry.c<br>
-+++ b/grub-core/normal/menu_entry.c<br>
-@@ -27,6 +27,7 @@<br>
- #include &lt;grub/auth.h&gt;<br>
- #include &lt;grub/i18n.h&gt;<br>
- #include &lt;grub/charset.h&gt;<br>
-+#include &lt;grub/safemath.h&gt;<br>
- <br>
- enum update_mode<br>
-=C2=A0 =C2=A0{<br>
-@@ -113,10 +114,18 @@ ensure_space (struct line *linep, int extra)<br>
- {<br>
-=C2=A0 =C2=A0if (linep-&gt;max_len &lt; linep-&gt;len + extra)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
--=C2=A0 =C2=A0 =C2=A0 linep-&gt;max_len =3D 2 * (linep-&gt;len + extra);<=
br>
--=C2=A0 =C2=A0 =C2=A0 linep-&gt;buf =3D grub_realloc (linep-&gt;buf, (lin=
ep-&gt;max_len + 1) * sizeof (linep-&gt;buf[0]));<br>
-+=C2=A0 =C2=A0 =C2=A0 grub_size_t sz0, sz1;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 if (grub_add (linep-&gt;len, extra, &amp;sz0) ||<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_mul (sz0, 2, &amp;sz0) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_add (sz0, 1, &amp;sz1) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_mul (sz1, sizeof (linep-&gt;buf[0]), &a=
mp;sz1))<br>
-+=C2=A0 =C2=A0 =C2=A0 return 0;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 linep-&gt;buf =3D grub_realloc (linep-&gt;buf, sz1)=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (! linep-&gt;buf)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-+=C2=A0 =C2=A0 =C2=A0 linep-&gt;max_len =3D sz0;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-=C2=A0 =C2=A0return 1;<br>
-diff --git a/grub-core/script/argv.c b/grub-core/script/argv.c<br>
-index 217ec5d..5751fdd 100644<br>
---- a/grub-core/script/argv.c<br>
-+++ b/grub-core/script/argv.c<br>
-@@ -20,6 +20,7 @@<br>
- #include &lt;grub/mm.h&gt;<br>
- #include &lt;grub/misc.h&gt;<br>
- #include &lt;grub/script_sh.h&gt;<br>
-+#include &lt;grub/safemath.h&gt;<br>
- <br>
- /* Return nearest power of two that is &gt;=3D v.=C2=A0 */<br>
- static unsigned<br>
-@@ -81,11 +82,16 @@ int<br>
- grub_script_argv_next (struct grub_script_argv *argv)<br>
- {<br>
-=C2=A0 =C2=A0char **p =3D argv-&gt;args;<br>
-+=C2=A0 grub_size_t sz;<br>
- <br>
-=C2=A0 =C2=A0if (argv-&gt;args &amp;&amp; argv-&gt;argc &amp;&amp; argv-&=
gt;args[argv-&gt;argc - 1] =3D=3D 0)<br>
-=C2=A0 =C2=A0 =C2=A0return 0;<br>
- <br>
--=C2=A0 p =3D grub_realloc (p, round_up_exp ((argv-&gt;argc + 2) * sizeof=
 (char *)));<br>
-+=C2=A0 if (grub_add (argv-&gt;argc, 2, &amp;sz) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 grub_mul (sz, sizeof (char *), &amp;sz))<br>
-+=C2=A0 =C2=A0 return 1;<br>
-+<br>
-+=C2=A0 p =3D grub_realloc (p, round_up_exp (sz));<br>
-=C2=A0 =C2=A0if (! p)<br>
-=C2=A0 =C2=A0 =C2=A0return 1;<br>
- <br>
-@@ -105,13 +111,19 @@ grub_script_argv_append (struct grub_script_argv *a=
rgv, const char *s,<br>
- {<br>
-=C2=A0 =C2=A0grub_size_t a;<br>
-=C2=A0 =C2=A0char *p =3D argv-&gt;args[argv-&gt;argc - 1];<br>
-+=C2=A0 grub_size_t sz;<br>
- <br>
-=C2=A0 =C2=A0if (! s)<br>
-=C2=A0 =C2=A0 =C2=A0return 0;<br>
- <br>
-=C2=A0 =C2=A0a =3D p ? grub_strlen (p) : 0;<br>
- <br>
--=C2=A0 p =3D grub_realloc (p, round_up_exp ((a + slen + 1) * sizeof (cha=
r)));<br>
-+=C2=A0 if (grub_add (a, slen, &amp;sz) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 grub_add (sz, 1, &amp;sz) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 grub_mul (sz, sizeof (char), &amp;sz))<br>
-+=C2=A0 =C2=A0 return 1;<br>
-+<br>
-+=C2=A0 p =3D grub_realloc (p, round_up_exp (sz));<br>
-=C2=A0 =C2=A0if (! p)<br>
-=C2=A0 =C2=A0 =C2=A0return 1;<br>
- <br>
-diff --git a/grub-core/script/lexer.c b/grub-core/script/lexer.c<br>
-index c6bd317..5fb0cbd 100644<br>
---- a/grub-core/script/lexer.c<br>
-+++ b/grub-core/script/lexer.c<br>
-@@ -24,6 +24,7 @@<br>
- #include &lt;grub/mm.h&gt;<br>
- #include &lt;grub/script_sh.h&gt;<br>
- #include &lt;grub/i18n.h&gt;<br>
-+#include &lt;grub/safemath.h&gt;<br>
- <br>
- #define yytext_ptr char *<br>
- #include &quot;grub_script.tab.h&quot;<br>
-@@ -110,10 +111,14 @@ grub_script_lexer_record (struct grub_parser_param =
*parser, char *str)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0old =3D lexer-&gt;recording;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (lexer-&gt;recordlen &lt; len)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0lexer-&gt;recordlen =3D len;<br>
--=C2=A0 =C2=A0 =C2=A0 lexer-&gt;recordlen *=3D 2;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 if (grub_mul (lexer-&gt;recordlen, 2, &amp;lexer-&g=
t;recordlen))<br>
-+=C2=A0 =C2=A0 =C2=A0 goto fail;<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0lexer-&gt;recording =3D grub_realloc (lexer-&g=
t;recording, lexer-&gt;recordlen);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!lexer-&gt;recording)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-+ fail:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (old);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lexer-&gt;recordpos =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lexer-&gt;recordlen =3D 0;<br>
-@@ -130,7 +135,7 @@ int<br>
- grub_script_lexer_yywrap (struct grub_parser_param *parserstate,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0const char *input)<br>
- {<br>
--=C2=A0 grub_size_t len =3D 0;<br>
-+=C2=A0 grub_size_t len =3D 0, sz;<br>
-=C2=A0 =C2=A0char *p =3D 0;<br>
-=C2=A0 =C2=A0char *line =3D 0;<br>
-=C2=A0 =C2=A0YY_BUFFER_STATE buffer;<br>
-@@ -168,12 +173,22 @@ grub_script_lexer_yywrap (struct grub_parser_param =
*parserstate,<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0else if (len &amp;&amp; line[len - 1] !=3D &#39;\n&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
--=C2=A0 =C2=A0 =C2=A0 p =3D grub_realloc (line, len + 2);<br>
-+=C2=A0 =C2=A0 =C2=A0 if (grub_add (len, 2, &amp;sz))<br>
-+=C2=A0 =C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_free (line);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_script_yyerror (parserstate, N_(&quot;o=
verflow is detected&quot;));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 p =3D grub_realloc (line, sz);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (p)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p[len++] =3D &#39;\n&#39;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p[len] =3D &#39;\0&#39;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-+=C2=A0 =C2=A0 =C2=A0 else<br>
-+=C2=A0 =C2=A0 =C2=A0 grub_free (line);<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0line =3D p;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-diff --git a/grub-core/video/bitmap.c b/grub-core/video/bitmap.c<br>
-index b2e0315..6256e20 100644<br>
---- a/grub-core/video/bitmap.c<br>
-+++ b/grub-core/video/bitmap.c<br>
-@@ -23,6 +23,7 @@<br>
- #include &lt;grub/mm.h&gt;<br>
- #include &lt;grub/misc.h&gt;<br>
- #include &lt;grub/i18n.h&gt;<br>
-+#include &lt;grub/safemath.h&gt;<br>
- <br>
- GRUB_MOD_LICENSE (&quot;GPLv3+&quot;);<br>
- <br>
-@@ -58,7 +59,7 @@ grub_video_bitmap_create (struct grub_video_bitmap **bi=
tmap,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0enum grub_video_blit_format blit_format)<br>
- {<br>
-=C2=A0 =C2=A0struct grub_video_mode_info *mode_info;<br>
--=C2=A0 unsigned int size;<br>
-+=C2=A0 grub_size_t size;<br>
- <br>
-=C2=A0 =C2=A0if (!bitmap)<br>
-=C2=A0 =C2=A0 =C2=A0return grub_error (GRUB_ERR_BUG, &quot;invalid argume=
nt&quot;);<br>
-@@ -137,19 +138,25 @@ grub_video_bitmap_create (struct grub_video_bitmap =
**bitmap,<br>
- <br>
-=C2=A0 =C2=A0mode_info-&gt;pitch =3D width * mode_info-&gt;bytes_per_pixe=
l;<br>
- <br>
--=C2=A0 /* Calculate size needed for the data.=C2=A0 */<br>
--=C2=A0 size =3D (width * mode_info-&gt;bytes_per_pixel) * height;<br>
-+=C2=A0 /* Calculate size needed for the data. */<br>
-+=C2=A0 if (grub_mul (width, mode_info-&gt;bytes_per_pixel, &amp;size) ||=
<br>
-+=C2=A0 =C2=A0 =C2=A0 grub_mul (size, height, &amp;size))<br>
-+=C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 grub_error (GRUB_ERR_OUT_OF_RANGE, N_(&quot;overflo=
w is detected&quot;));<br>
-+=C2=A0 =C2=A0 =C2=A0 goto fail;<br>
-+=C2=A0 =C2=A0 }<br>
- <br>
-=C2=A0 =C2=A0(*bitmap)-&gt;data =3D grub_zalloc (size);<br>
-=C2=A0 =C2=A0if (! (*bitmap)-&gt;data)<br>
--=C2=A0 =C2=A0 {<br>
--=C2=A0 =C2=A0 =C2=A0 grub_free (*bitmap);<br>
--=C2=A0 =C2=A0 =C2=A0 *bitmap =3D 0;<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 return grub_errno;<br>
--=C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 goto fail;<br>
- <br>
-=C2=A0 =C2=A0return GRUB_ERR_NONE;<br>
-+<br>
-+ fail:<br>
-+=C2=A0 grub_free (*bitmap);<br>
-+=C2=A0 *bitmap =3D NULL;<br>
-+<br>
-+=C2=A0 return grub_errno;<br>
- }<br>
- <br>
- /* Frees all resources allocated by bitmap.=C2=A0 */<br>
-diff --git a/grub-core/video/readers/png.c b/grub-core/video/readers/png.=
c<br>
-index 61bd645..0157ff7 100644<br>
---- a/grub-core/video/readers/png.c<br>
-+++ b/grub-core/video/readers/png.c<br>
-@@ -23,6 +23,7 @@<br>
- #include &lt;grub/mm.h&gt;<br>
- #include &lt;grub/misc.h&gt;<br>
- #include &lt;grub/bufio.h&gt;<br>
-+#include &lt;grub/safemath.h&gt;<br>
- <br>
- GRUB_MOD_LICENSE (&quot;GPLv3+&quot;);<br>
- <br>
-@@ -301,9 +302,17 @@ grub_png_decode_image_header (struct grub_png_data *=
data)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0data-&gt;bpp &lt;&lt;=3D 1;<br>
- <br>
-=C2=A0 =C2=A0data-&gt;color_bits =3D color_bits;<br>
--=C2=A0 data-&gt;row_bytes =3D data-&gt;image_width * data-&gt;bpp;<br>
-+<br>
-+=C2=A0 if (grub_mul (data-&gt;image_width, data-&gt;bpp, &amp;data-&gt;r=
ow_bytes))<br>
-+=C2=A0 =C2=A0 return grub_error (GRUB_ERR_OUT_OF_RANGE, N_(&quot;overflo=
w is detected&quot;));<br>
-+<br>
-=C2=A0 =C2=A0if (data-&gt;color_bits &lt;=3D 4)<br>
--=C2=A0 =C2=A0 data-&gt;row_bytes =3D (data-&gt;image_width * data-&gt;co=
lor_bits + 7) / 8;<br>
-+=C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 if (grub_mul (data-&gt;image_width, data-&gt;color_=
bits + 7, &amp;data-&gt;row_bytes))<br>
-+=C2=A0 =C2=A0 =C2=A0 return grub_error (GRUB_ERR_OUT_OF_RANGE, N_(&quot;=
overflow is detected&quot;));<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 data-&gt;row_bytes &gt;&gt;=3D 3;<br>
-+=C2=A0 =C2=A0 }<br>
- <br>
- #ifndef GRUB_CPU_WORDS_BIGENDIAN<br>
-=C2=A0 =C2=A0if (data-&gt;is_16bit || data-&gt;is_gray || data-&gt;is_pal=
ette)<br>
--- <br>
-2.14.4<br>
-<br>
diff --git a/meta/recipes-bsp/grub/files/CVE-2020-15706-script-Avoid-a-use=
-after-free-when-redefining-a-func.patch b/meta/recipes-bsp/grub/files/CVE-=
2020-15706-script-Avoid-a-use-after-free-when-redefining-a-func.patch<br>
deleted file mode 100644<br>
index 329e554a68..0000000000<br>
--- a/meta/recipes-bsp/grub/files/CVE-2020-15706-script-Avoid-a-use-after-=
free-when-redefining-a-func.patch<br>
+++ /dev/null<br>
@@ -1,117 +0,0 @@<br>
-From c65fc7e75b7b7e880d90766057040011701e97f4 Mon Sep 17 00:00:00 2001<br=
>
-From: Chris Coulson &lt;<a href=3D"mailto:chris.coulson@canonical.com" ta=
rget=3D"_blank">chris.coulson@canonical.com</a>&gt;<br>
-Date: Fri, 10 Jul 2020 14:41:45 +0100<br>
-Subject: [PATCH 8/9] script: Avoid a use-after-free when redefining a fun=
ction<br>
- during execution<br>
-<br>
-Defining a new function with the same name as a previously defined<br>
-function causes the grub_script and associated resources for the<br>
-previous function to be freed. If the previous function is currently<br>
-executing when a function with the same name is defined, this results<br>
-in use-after-frees when processing subsequent commands in the original<br=
>
-function.<br>
-<br>
-Instead, reject a new function definition if it has the same name as<br>
-a previously defined function, and that function is currently being<br>
-executed. Although a behavioural change, this should be backwards<br>
-compatible with existing configurations because they can&#39;t be<br>
-dependent on the current behaviour without being broken.<br>
-<br>
-Fixes: CVE-2020-15706<br>
-<br>
-Signed-off-by: Chris Coulson &lt;<a href=3D"mailto:chris.coulson@canonica=
l.com" target=3D"_blank">chris.coulson@canonical.com</a>&gt;<br>
-Reviewed-by: Daniel Kiper &lt;<a href=3D"mailto:daniel.kiper@oracle.com" =
target=3D"_blank">daniel.kiper@oracle.com</a>&gt;<br>
-<br>
-Upstream-Status: Backport<br>
-CVE: CVE-2020-15706<br>
-<br>
-Reference to upstream patch:<br>
-<a href=3D"https://git.savannah.gnu.org/cgit/grub.git/commit/?id=3D426f57=
383d647406ae9c628c472059c27cd6e040" rel=3D"noreferrer" target=3D"_blank">ht=
tps://git.savannah.gnu.org/cgit/grub.git/commit/?id=3D426f57383d647406ae9c6=
28c472059c27cd6e040</a><br>
-<br>
-Signed-off-by: Yongxin Liu &lt;<a href=3D"mailto:yongxin.liu@windriver.co=
m" target=3D"_blank">yongxin.liu@windriver.com</a>&gt;<br>
----<br>
- grub-core/script/execute.c=C2=A0 |=C2=A0 2 ++<br>
- grub-core/script/function.c | 16 +++++++++++++---<br>
- grub-core/script/parser.y=C2=A0 =C2=A0|=C2=A0 3 ++-<br>
- include/grub/script_sh.h=C2=A0 =C2=A0 |=C2=A0 2 ++<br>
- 4 files changed, 19 insertions(+), 4 deletions(-)<br>
-<br>
-diff --git a/grub-core/script/execute.c b/grub-core/script/execute.c<br>
-index c8d6806..7e028e1 100644<br>
---- a/grub-core/script/execute.c<br>
-+++ b/grub-core/script/execute.c<br>
-@@ -838,7 +838,9 @@ grub_script_function_call (grub_script_function_t fun=
c, int argc, char **args)<br>
-=C2=A0 =C2=A0old_scope =3D scope;<br>
-=C2=A0 =C2=A0scope =3D &amp;new_scope;<br>
- <br>
-+=C2=A0 func-&gt;executing++;<br>
-=C2=A0 =C2=A0ret =3D grub_script_execute (func-&gt;func);<br>
-+=C2=A0 func-&gt;executing--;<br>
- <br>
-=C2=A0 =C2=A0function_return =3D 0;<br>
-=C2=A0 =C2=A0active_loops =3D loops;<br>
-diff --git a/grub-core/script/function.c b/grub-core/script/function.c<br=
>
-index d36655e..3aad04b 100644<br>
---- a/grub-core/script/function.c<br>
-+++ b/grub-core/script/function.c<br>
-@@ -34,6 +34,7 @@ grub_script_function_create (struct grub_script_arg *fu=
nctionname_arg,<br>
-=C2=A0 =C2=A0func =3D (grub_script_function_t) grub_malloc (sizeof (*func=
));<br>
-=C2=A0 =C2=A0if (! func)<br>
-=C2=A0 =C2=A0 =C2=A0return 0;<br>
-+=C2=A0 func-&gt;executing =3D 0;<br>
- <br>
-=C2=A0 =C2=A0func-&gt;name =3D grub_strdup (functionname_arg-&gt;str);<br=
>
-=C2=A0 =C2=A0if (! func-&gt;name)<br>
-@@ -60,10 +61,19 @@ grub_script_function_create (struct grub_script_arg *=
functionname_arg,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_script_function_t q;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0q =3D *p;<br>
--=C2=A0 =C2=A0 =C2=A0 grub_script_free (q-&gt;func);<br>
--=C2=A0 =C2=A0 =C2=A0 q-&gt;func =3D cmd;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0grub_free (func);<br>
--=C2=A0 =C2=A0 =C2=A0 func =3D q;<br>
-+=C2=A0 =C2=A0 =C2=A0 if (q-&gt;executing &gt; 0)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_error (GRUB_ERR_BAD_ARGUMENT,<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 N_=
(&quot;attempt to redefine a function being executed&quot;));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 func =3D NULL;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 else<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_script_free (q-&gt;func);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 q-&gt;func =3D cmd;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 func =3D q;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-diff --git a/grub-core/script/parser.y b/grub-core/script/parser.y<br>
-index 4f0ab83..f80b86b 100644<br>
---- a/grub-core/script/parser.y<br>
-+++ b/grub-core/script/parser.y<br>
-@@ -289,7 +289,8 @@ function: &quot;function&quot; &quot;name&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_script_mem_free (sta=
te-&gt;func_mem);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0script-&gt;children =3D s=
tate-&gt;scripts;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_script_function_create ($=
2, script);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!grub_script_function_crea=
te ($2, script))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_script_free (scrip=
t);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0state-&gt;scripts =3D $&lt;scrip=
ts&gt;3;<br>
-diff --git a/include/grub/script_sh.h b/include/grub/script_sh.h<br>
-index b382bcf..6c48e07 100644<br>
---- a/include/grub/script_sh.h<br>
-+++ b/include/grub/script_sh.h<br>
-@@ -361,6 +361,8 @@ struct grub_script_function<br>
- <br>
-=C2=A0 =C2=A0/* The next element.=C2=A0 */<br>
-=C2=A0 =C2=A0struct grub_script_function *next;<br>
-+<br>
-+=C2=A0 unsigned executing;<br>
- };<br>
- typedef struct grub_script_function *grub_script_function_t;<br>
- <br>
--- <br>
-2.14.4<br>
-<br>
diff --git a/meta/recipes-bsp/grub/files/CVE-2020-15707-linux-Fix-integer-=
overflows-in-initrd-size-handling.patch b/meta/recipes-bsp/grub/files/CVE-2=
020-15707-linux-Fix-integer-overflows-in-initrd-size-handling.patch<br>
deleted file mode 100644<br>
index d4f9300c0a..0000000000<br>
--- a/meta/recipes-bsp/grub/files/CVE-2020-15707-linux-Fix-integer-overflo=
ws-in-initrd-size-handling.patch<br>
+++ /dev/null<br>
@@ -1,177 +0,0 @@<br>
-From 68a09a74f6d726d79709847f3671c0a08e4fb5a0 Mon Sep 17 00:00:00 2001<br=
>
-From: Colin Watson &lt;<a href=3D"mailto:cjwatson@debian.org" target=3D"_=
blank">cjwatson@debian.org</a>&gt;<br>
-Date: Sat, 25 Jul 2020 12:15:37 +0100<br>
-Subject: [PATCH 9/9] linux: Fix integer overflows in initrd size handling=
<br>
-<br>
-These could be triggered by a crafted filesystem with very large files.<b=
r>
-<br>
-Fixes: CVE-2020-15707<br>
-<br>
-Signed-off-by: Colin Watson &lt;<a href=3D"mailto:cjwatson@debian.org" ta=
rget=3D"_blank">cjwatson@debian.org</a>&gt;<br>
-Reviewed-by: Jan Setje-Eilers &lt;<a href=3D"mailto:jan.setjeeilers@oracl=
e.com" target=3D"_blank">jan.setjeeilers@oracle.com</a>&gt;<br>
-Reviewed-by: Daniel Kiper &lt;<a href=3D"mailto:daniel.kiper@oracle.com" =
target=3D"_blank">daniel.kiper@oracle.com</a>&gt;<br>
-<br>
-Upstream-Status: Backport<br>
-CVE: CVE-2020-15707<br>
-<br>
-Reference to upstream patch:<br>
-<a href=3D"https://git.savannah.gnu.org/cgit/grub.git/commit/?id=3De7b885=
6f8be3292afdb38d2e8c70ad8d62a61e10" rel=3D"noreferrer" target=3D"_blank">ht=
tps://git.savannah.gnu.org/cgit/grub.git/commit/?id=3De7b8856f8be3292afdb38=
d2e8c70ad8d62a61e10</a><br>
-<br>
-Signed-off-by: Yongxin Liu &lt;<a href=3D"mailto:yongxin.liu@windriver.co=
m" target=3D"_blank">yongxin.liu@windriver.com</a>&gt;<br>
----<br>
- grub-core/loader/linux.c | 74 +++++++++++++++++++++++++++++++++++-------=
------<br>
- 1 file changed, 54 insertions(+), 20 deletions(-)<br>
-<br>
-diff --git a/grub-core/loader/linux.c b/grub-core/loader/linux.c<br>
-index 471b214..8c8565a 100644<br>
---- a/grub-core/loader/linux.c<br>
-+++ b/grub-core/loader/linux.c<br>
-@@ -4,6 +4,7 @@<br>
- #include &lt;grub/misc.h&gt;<br>
- #include &lt;grub/file.h&gt;<br>
- #include &lt;grub/mm.h&gt;<br>
-+#include &lt;grub/safemath.h&gt;<br>
- <br>
- struct newc_head<br>
- {<br>
-@@ -98,13 +99,13 @@ free_dir (struct dir *root)<br>
-=C2=A0 =C2=A0grub_free (root);<br>
- }<br>
- <br>
--static grub_size_t<br>
-+static grub_err_t<br>
- insert_dir (const char *name, struct dir **root,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_uint8_t *ptr)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_uint8_t *ptr, grub_size_t *size)=
<br>
- {<br>
-=C2=A0 =C2=A0struct dir *cur, **head =3D root;<br>
-=C2=A0 =C2=A0const char *cb, *ce =3D name;<br>
--=C2=A0 grub_size_t size =3D 0;<br>
-+=C2=A0 *size =3D 0;<br>
-=C2=A0 =C2=A0while (1)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (cb =3D ce; *cb =3D=3D &#39;/&#39;; cb++);=
<br>
-@@ -130,14 +131,22 @@ insert_dir (const char *name, struct dir **root,<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D make_header (ptr,=
 name, ce - name,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 040777, 0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 size +=3D ALIGN_UP ((ce - (char *) name)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 + sizeof (struct newc_head), 4);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (grub_add (*size,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ALIGN_UP ((ce - (char *) name)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 + sizeof (struct newc_head), 4),=
<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 size))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_error (GRUB_ERR_OUT_OF_RA=
NGE, N_(&quot;overflow is detected&quot;));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_free (n-&gt;name);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_free (n);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return grub_errno;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*head =3D n;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cur =3D n;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0root =3D &amp;cur-&gt;next;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 return size;<br>
-+=C2=A0 return GRUB_ERR_NONE;<br>
- }<br>
- <br>
- grub_err_t<br>
-@@ -173,26 +182,33 @@ grub_initrd_init (int argc, char *argv[],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0eptr =3D grub_strchr (ptr, &#39;:&#39;)=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (eptr)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_size_t dir_size, name_len=
;<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0initrd_ctx-&gt;components=
[i].newc_name =3D grub_strndup (ptr, eptr - ptr);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!initrd_ctx-&gt;components=
[i].newc_name)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!initrd_ctx-&gt;components=
[i].newc_name ||<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 insert_dir (init=
rd_ctx-&gt;components[i].newc_name, &amp;root, 0,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;dir_size))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_initrd=
_close (initrd_ctx);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return grub=
_errno;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 initrd_ctx-&gt;size<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D ALIGN_UP (sizeof (=
struct newc_head)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 + grub_strlen (initrd_ctx-&gt;components[i].newc_name=
),<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A04);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 initrd_ctx-&gt;size +=3D inser=
t_dir (initrd_ctx-&gt;components[i].newc_name,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &amp;root, 0);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name_len =3D grub_strlen (init=
rd_ctx-&gt;components[i].newc_name);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (grub_add (initrd_ctx-&gt;s=
ize,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ALIGN_UP (sizeof (struct newc_head) + name_len, 4),<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &amp;initrd_ctx-&gt;size) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_add (initrd=
_ctx-&gt;size, dir_size, &amp;initrd_ctx-&gt;size))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto overflow;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0newc =3D 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fname =3D eptr + 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (newc)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 initrd_ctx-&gt;size +=3D ALIGN_UP (sizeof (s=
truct newc_head)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 + sizeof (&=
quot;TRAILER!!!&quot;) - 1, 4);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (grub_add (initrd_ctx-&gt;size,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ALIGN_UP (sizeof (struct newc_head)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 + sizeof (&quot;TRAILER!!!&quot;=
) - 1, 4),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &amp;initrd_ctx-&gt;size))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto overflow;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free_dir (root);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0root =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0newc =3D 0;<br>
-@@ -208,19 +224,29 @@ grub_initrd_init (int argc, char *argv[],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0initrd_ctx-&gt;nfiles++;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0initrd_ctx-&gt;components[i].size<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D grub_file_size (initrd_ctx-&gt;components[=
i].file);<br>
--=C2=A0 =C2=A0 =C2=A0 initrd_ctx-&gt;size +=3D initrd_ctx-&gt;components[=
i].size;<br>
-+=C2=A0 =C2=A0 =C2=A0 if (grub_add (initrd_ctx-&gt;size, initrd_ctx-&gt;c=
omponents[i].size,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;init=
rd_ctx-&gt;size))<br>
-+=C2=A0 =C2=A0 =C2=A0 goto overflow;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-=C2=A0 =C2=A0if (newc)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0initrd_ctx-&gt;size =3D ALIGN_UP (initrd_ctx-&=
gt;size, 4);<br>
--=C2=A0 =C2=A0 =C2=A0 initrd_ctx-&gt;size +=3D ALIGN_UP (sizeof (struct n=
ewc_head)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 + sizeof (&quot;TRAILER!!=
!&quot;) - 1, 4);<br>
-+=C2=A0 =C2=A0 =C2=A0 if (grub_add (initrd_ctx-&gt;size,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ALIGN_UP =
(sizeof (struct newc_head)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 + sizeof (&quot;TRAILER!!!&quot;) - 1, 4),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;init=
rd_ctx-&gt;size))<br>
-+=C2=A0 =C2=A0 =C2=A0 goto overflow;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0free_dir (root);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0root =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0<br>
-=C2=A0 =C2=A0return GRUB_ERR_NONE;<br>
-+<br>
-+ overflow:<br>
-+=C2=A0 free_dir (root);<br>
-+=C2=A0 grub_initrd_close (initrd_ctx);<br>
-+=C2=A0 return grub_error (GRUB_ERR_OUT_OF_RANGE, N_(&quot;overflow is de=
tected&quot;));<br>
- }<br>
- <br>
- grub_size_t<br>
-@@ -261,8 +287,16 @@ grub_initrd_load (struct grub_linux_initrd_context *=
initrd_ctx,<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (initrd_ctx-&gt;components[i].newc_name)<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 ptr +=3D insert_dir (initrd_ctx-&gt;componen=
ts[i].newc_name,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;root, ptr);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_size_t dir_size;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (insert_dir (initrd_ctx-&gt;components[i]=
.newc_name, &amp;root, ptr,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &amp;dir_size))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 free_dir (root);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_initrd_close (initrd_ctx)=
;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return grub_errno;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ptr +=3D dir_size;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D make_header (ptr, initrd_ctx-&g=
t;components[i].newc_name,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 grub_strlen (initrd_ctx-&gt;components[i].newc_na=
me),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 0100777,<br>
--- <br>
-2.14.4<br>
-<br>
diff --git a/meta/recipes-bsp/grub/files/autogen.sh-exclude-pc.patch b/met=
a/recipes-bsp/grub/files/autogen.sh-exclude-pc.patch<br>
index faa7fde232..1323a54a59 100644<br>
--- a/meta/recipes-bsp/grub/files/autogen.sh-exclude-pc.patch<br>
+++ b/meta/recipes-bsp/grub/files/autogen.sh-exclude-pc.patch<br>
@@ -1,6 +1,6 @@<br>
-From 72c30928d3d461e0e2d20c5ff33bd96b6991d585 Mon Sep 17 00:00:00 2001<br=
>
-From: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com" target=
=
=3D"_blank">liezhi.yang@windriver.com</a>&gt;<br>
-Date: Sat, 25 Jan 2014 23:49:44 -0500<br>
+From 8790aa8bea736f52341a0430ff3e317d3be0f99b Mon Sep 17 00:00:00 2001<br=
>
+From: Naveen Saini &lt;<a href=3D"mailto:naveen.kumar.saini@intel.com" ta=
rget=3D"_blank">naveen.kumar.saini@intel.com</a>&gt;<br>
+Date: Mon, 15 Mar 2021 14:44:15 +0800<br>
=C2=A0Subject: [PATCH] autogen.sh: exclude .pc from po/POTFILES.in<br>
<br>
=C2=A0Exclude the .pc from po/POTFILES.in since quilt uses &quot;patch --b=
ackup&quot;,<br>
@@ -13,23 +13,24 @@ Upstream-Status: Inappropriate [OE specific]<br>
<br>
=C2=A0Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriv=
er.com" target=3D"_blank">liezhi.yang@windriver.com</a>&gt;<br>
=C2=A0Signed-off-by: Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.c=
om" target=3D"_blank">anuj.mittal@intel.com</a>&gt;<br>
+Signed-off-by: Naveen Saini &lt;<a href=3D"mailto:naveen.kumar.saini@inte=
l.com" target=3D"_blank">naveen.kumar.saini@intel.com</a>&gt;<br>
=C2=A0---<br>
=C2=A0 autogen.sh | 2 +-<br>
=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
=C2=A0diff --git a/autogen.sh b/autogen.sh<br>
-index ef43270..a7067a7 100755<br>
+index 31b0ced7e..c63ae766c 100755<br>
=C2=A0--- a/autogen.sh<br>
=C2=A0+++ b/autogen.sh<br>
=C2=A0@@ -13,7 +13,7 @@ fi<br>
=C2=A0 export LC_COLLATE=3DC<br>
=C2=A0 unset LC_ALL<br>
<br>
--find . -iname &#39;*.[ch]&#39; ! -ipath &#39;./grub-core/lib/libgcrypt-g=
rub/*&#39; ! -ipath &#39;./build-aux/*&#39; ! -ipath &#39;./grub-core/lib/l=
ibgcrypt/src/misc.c&#39; ! -ipath &#39;./grub-core/lib/libgcrypt/src/global=
.c&#39; ! -ipath &#39;./grub-core/lib/libgcrypt/src/secmem.c&#39;=C2=A0 ! -=
ipath &#39;./util/grub-gen-widthspec.c&#39; ! -ipath &#39;./util/grub-gen-a=
sciih.c&#39; ! -ipath &#39;./gnulib/*&#39; ! -iname &#39;./grub-core/lib/gn=
ulib/*&#39; |sort &gt; po/POTFILES.in<br>
-+find . -iname &#39;*.[ch]&#39; ! -ipath &#39;./grub-core/lib/libgcrypt-g=
rub/*&#39; ! -ipath &#39;./build-aux/*&#39; ! -ipath &#39;./grub-core/lib/l=
ibgcrypt/src/misc.c&#39; ! -ipath &#39;./grub-core/lib/libgcrypt/src/global=
.c&#39; ! -ipath &#39;./grub-core/lib/libgcrypt/src/secmem.c&#39;=C2=A0 ! -=
ipath &#39;./util/grub-gen-widthspec.c&#39; ! -ipath &#39;./util/grub-gen-a=
sciih.c&#39; ! -ipath &#39;./gnulib/*&#39; ! -iname &#39;./grub-core/lib/gn=
ulib/*&#39; ! -path &#39;./.pc/*&#39; |sort &gt; po/POTFILES.in<br>
+-find . -iname &#39;*.[ch]&#39; ! -ipath &#39;./grub-core/lib/libgcrypt-g=
rub/*&#39; ! -ipath &#39;./build-aux/*&#39; ! -ipath &#39;./grub-core/lib/l=
ibgcrypt/src/misc.c&#39; ! -ipath &#39;./grub-core/lib/libgcrypt/src/global=
.c&#39; ! -ipath &#39;./grub-core/lib/libgcrypt/src/secmem.c&#39;=C2=A0 ! -=
ipath &#39;./util/grub-gen-widthspec.c&#39; ! -ipath &#39;./util/grub-gen-a=
sciih.c&#39; ! -ipath &#39;./gnulib/*&#39; ! -ipath &#39;./grub-core/lib/gn=
ulib/*&#39; |sort &gt; po/POTFILES.in<br>
++find . -iname &#39;*.[ch]&#39; ! -ipath &#39;./grub-core/lib/libgcrypt-g=
rub/*&#39; ! -ipath &#39;./build-aux/*&#39; ! -ipath &#39;./grub-core/lib/l=
ibgcrypt/src/misc.c&#39; ! -ipath &#39;./grub-core/lib/libgcrypt/src/global=
.c&#39; ! -ipath &#39;./grub-core/lib/libgcrypt/src/secmem.c&#39;=C2=A0 ! -=
ipath &#39;./util/grub-gen-widthspec.c&#39; ! -ipath &#39;./util/grub-gen-a=
sciih.c&#39; ! -ipath &#39;./gnulib/*&#39; ! -ipath &#39;./grub-core/lib/gn=
ulib/*&#39; ! -path &#39;./.pc/*&#39; |sort &gt; po/POTFILES.in<br>
=C2=A0 find util -iname &#39;*.in&#39; ! -name Makefile.in=C2=A0 |sort &gt=
; po/POTFILES-shell.in<br>
<br>
=C2=A0 echo &quot;Importing unicode...&quot;<br>
=C2=A0-- <br>
-2.7.4<br>
+2.17.1<br>
<br>
diff --git a/meta/recipes-bsp/grub/files/calloc-Make-sure-we-always-have-a=
n-overflow-checking.patch b/meta/recipes-bsp/grub/files/calloc-Make-sure-we=
-always-have-an-overflow-checking.patch<br>
deleted file mode 100644<br>
index c9536e68ef..0000000000<br>
--- a/meta/recipes-bsp/grub/files/calloc-Make-sure-we-always-have-an-overf=
low-checking.patch<br>
+++ /dev/null<br>
@@ -1,246 +0,0 @@<br>
-From c005f62f5c4b26a77b916c8f76a852324439ecb3 Mon Sep 17 00:00:00 2001<br=
>
-From: Peter Jones &lt;<a href=3D"mailto:pjones@redhat.com" target=3D"_bla=
nk">pjones@redhat.com</a>&gt;<br>
-Date: Mon, 15 Jun 2020 12:15:29 -0400<br>
-Subject: [PATCH 2/9] calloc: Make sure we always have an overflow-checkin=
g<br>
- calloc() available<br>
-<br>
-This tries to make sure that everywhere in this source tree, we always ha=
ve<br>
-an appropriate version of calloc() (i.e. grub_calloc(), xcalloc(), etc.)<=
br>
-available, and that they all safely check for overflow and return NULL wh=
en<br>
-it would occur.<br>
-<br>
-Upstream-Status: Backport [commit 64e26162ebfe68317c143ca5ec996c892019f8f=
8<br>
-from <a href=3D"https://git.savannah.gnu.org/git/grub.git" rel=3D"norefer=
rer" target=3D"_blank">https://git.savannah.gnu.org/git/grub.git</a>]<br>
-<br>
-Signed-off-by: Peter Jones &lt;<a href=3D"mailto:pjones@redhat.com" targe=
t=3D"_blank">pjones@redhat.com</a>&gt;<br>
-Reviewed-by: Daniel Kiper &lt;<a href=3D"mailto:daniel.kiper@oracle.com" =
target=3D"_blank">daniel.kiper@oracle.com</a>&gt;<br>
-Signed-off-by: Yongxin Liu &lt;<a href=3D"mailto:yongxin.liu@windriver.co=
m" target=3D"_blank">yongxin.liu@windriver.com</a>&gt;<br>
----<br>
- grub-core/kern/emu/misc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 12 +++++++=
+++++<br>
- grub-core/kern/emu/mm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10 ++=
++++++++<br>
- grub-core/kern/mm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 40 ++++++++++++++++++++++++++++++++++++++<br>
- grub-core/lib/libgcrypt_wrap/mem.c | 11 +++++++++--<br>
- grub-core/lib/posix_wrap/stdlib.h=C2=A0 |=C2=A0 8 +++++++-<br>
- include/grub/emu/misc.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 1 +<br>
- include/grub/mm.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 6 ++++++<br>
- 7 files changed, 85 insertions(+), 3 deletions(-)<br>
-<br>
-diff --git a/grub-core/kern/emu/misc.c b/grub-core/kern/emu/misc.c<br>
-index 65db79b..dfd8a8e 100644<br>
---- a/grub-core/kern/emu/misc.c<br>
-+++ b/grub-core/kern/emu/misc.c<br>
-@@ -85,6 +85,18 @@ grub_util_error (const char *fmt, ...)<br>
-=C2=A0 =C2=A0exit (1);<br>
- }<br>
- <br>
-+void *<br>
-+xcalloc (grub_size_t nmemb, grub_size_t size)<br>
-+{<br>
-+=C2=A0 void *p;<br>
-+<br>
-+=C2=A0 p =3D calloc (nmemb, size);<br>
-+=C2=A0 if (!p)<br>
-+=C2=A0 =C2=A0 grub_util_error (&quot;%s&quot;, _(&quot;out of memory&quo=
t;));<br>
-+<br>
-+=C2=A0 return p;<br>
-+}<br>
-+<br>
- void *<br>
- xmalloc (grub_size_t size)<br>
- {<br>
-diff --git a/grub-core/kern/emu/mm.c b/grub-core/kern/emu/mm.c<br>
-index f262e95..145b01d 100644<br>
---- a/grub-core/kern/emu/mm.c<br>
-+++ b/grub-core/kern/emu/mm.c<br>
-@@ -25,6 +25,16 @@<br>
- #include &lt;string.h&gt;<br>
- #include &lt;grub/i18n.h&gt;<br>
- <br>
-+void *<br>
-+grub_calloc (grub_size_t nmemb, grub_size_t size)<br>
-+{<br>
-+=C2=A0 void *ret;<br>
-+=C2=A0 ret =3D calloc (nmemb, size);<br>
-+=C2=A0 if (!ret)<br>
-+=C2=A0 =C2=A0 grub_error (GRUB_ERR_OUT_OF_MEMORY, N_(&quot;out of memory=
&quot;));<br>
-+=C2=A0 return ret;<br>
-+}<br>
-+<br>
- void *<br>
- grub_malloc (grub_size_t size)<br>
- {<br>
-diff --git a/grub-core/kern/mm.c b/grub-core/kern/mm.c<br>
-index ee88ff6..f2822a8 100644<br>
---- a/grub-core/kern/mm.c<br>
-+++ b/grub-core/kern/mm.c<br>
-@@ -67,8 +67,10 @@<br>
- #include &lt;grub/dl.h&gt;<br>
- #include &lt;grub/i18n.h&gt;<br>
- #include &lt;grub/mm_private.h&gt;<br>
-+#include &lt;grub/safemath.h&gt;<br>
- <br>
- #ifdef MM_DEBUG<br>
-+# undef grub_calloc<br>
- # undef grub_malloc<br>
- # undef grub_zalloc<br>
- # undef grub_realloc<br>
-@@ -375,6 +377,30 @@ grub_memalign (grub_size_t align, grub_size_t size)<=
br>
-=C2=A0 =C2=A0return 0;<br>
- }<br>
- <br>
-+/*<br>
-+ * Allocate NMEMB instances of SIZE bytes and return the pointer, or err=
or on<br>
-+ * integer overflow.<br>
-+ */<br>
-+void *<br>
-+grub_calloc (grub_size_t nmemb, grub_size_t size)<br>
-+{<br>
-+=C2=A0 void *ret;<br>
-+=C2=A0 grub_size_t sz =3D 0;<br>
-+<br>
-+=C2=A0 if (grub_mul (nmemb, size, &amp;sz))<br>
-+=C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 grub_error (GRUB_ERR_OUT_OF_RANGE, N_(&quot;overflo=
w is detected&quot;));<br>
-+=C2=A0 =C2=A0 =C2=A0 return NULL;<br>
-+=C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 ret =3D grub_memalign (0, sz);<br>
-+=C2=A0 if (!ret)<br>
-+=C2=A0 =C2=A0 return NULL;<br>
-+<br>
-+=C2=A0 grub_memset (ret, 0, sz);<br>
-+=C2=A0 return ret;<br>
-+}<br>
-+<br>
- /* Allocate SIZE bytes and return the pointer.=C2=A0 */<br>
- void *<br>
- grub_malloc (grub_size_t size)<br>
-@@ -561,6 +587,20 @@ grub_mm_dump (unsigned lineno)<br>
-=C2=A0 =C2=A0grub_printf (&quot;\n&quot;);<br>
- }<br>
- <br>
-+void *<br>
-+grub_debug_calloc (const char *file, int line, grub_size_t nmemb, grub_s=
ize_t size)<br>
-+{<br>
-+=C2=A0 void *ptr;<br>
-+<br>
-+=C2=A0 if (grub_mm_debug)<br>
-+=C2=A0 =C2=A0 grub_printf (&quot;%s:%d: calloc (0x%&quot; PRIxGRUB_SIZE =
&quot;, 0x%&quot; PRIxGRUB_SIZE &quot;) =3D &quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file, line, size)=
;<br>
-+=C2=A0 ptr =3D grub_calloc (nmemb, size);<br>
-+=C2=A0 if (grub_mm_debug)<br>
-+=C2=A0 =C2=A0 grub_printf (&quot;%p\n&quot;, ptr);<br>
-+=C2=A0 return ptr;<br>
-+}<br>
-+<br>
- void *<br>
- grub_debug_malloc (const char *file, int line, grub_size_t size)<br>
- {<br>
-diff --git a/grub-core/lib/libgcrypt_wrap/mem.c b/grub-core/lib/libgcrypt=
_wrap/mem.c<br>
-index beeb661..74c6eaf 100644<br>
---- a/grub-core/lib/libgcrypt_wrap/mem.c<br>
-+++ b/grub-core/lib/libgcrypt_wrap/mem.c<br>
-@@ -4,6 +4,7 @@<br>
- #include &lt;grub/crypto.h&gt;<br>
- #include &lt;grub/dl.h&gt;<br>
- #include &lt;grub/env.h&gt;<br>
-+#include &lt;grub/safemath.h&gt;<br>
- <br>
- GRUB_MOD_LICENSE (&quot;GPLv3+&quot;);<br>
- <br>
-@@ -36,7 +37,10 @@ void *<br>
- gcry_xcalloc (size_t n, size_t m)<br>
- {<br>
-=C2=A0 =C2=A0void *ret;<br>
--=C2=A0 ret =3D grub_zalloc (n * m);<br>
-+=C2=A0 size_t sz;<br>
-+=C2=A0 if (grub_mul (n, m, &amp;sz))<br>
-+=C2=A0 =C2=A0 grub_fatal (&quot;gcry_xcalloc would overflow&quot;);<br>
-+=C2=A0 ret =3D grub_zalloc (sz);<br>
-=C2=A0 =C2=A0if (!ret)<br>
-=C2=A0 =C2=A0 =C2=A0grub_fatal (&quot;gcry_xcalloc failed&quot;);<br>
-=C2=A0 =C2=A0return ret;<br>
-@@ -56,7 +60,10 @@ void *<br>
- gcry_xcalloc_secure (size_t n, size_t m)<br>
- {<br>
-=C2=A0 =C2=A0void *ret;<br>
--=C2=A0 ret =3D grub_zalloc (n * m);<br>
-+=C2=A0 size_t sz;<br>
-+=C2=A0 if (grub_mul (n, m, &amp;sz))<br>
-+=C2=A0 =C2=A0 grub_fatal (&quot;gcry_xcalloc would overflow&quot;);<br>
-+=C2=A0 ret =3D grub_zalloc (sz);<br>
-=C2=A0 =C2=A0if (!ret)<br>
-=C2=A0 =C2=A0 =C2=A0grub_fatal (&quot;gcry_xcalloc failed&quot;);<br>
-=C2=A0 =C2=A0return ret;<br>
-diff --git a/grub-core/lib/posix_wrap/stdlib.h b/grub-core/lib/posix_wrap=
/stdlib.h<br>
-index 3b46f47..7a8d385 100644<br>
---- a/grub-core/lib/posix_wrap/stdlib.h<br>
-+++ b/grub-core/lib/posix_wrap/stdlib.h<br>
-@@ -21,6 +21,7 @@<br>
- <br>
- #include &lt;grub/mm.h&gt;<br>
- #include &lt;grub/misc.h&gt;<br>
-+#include &lt;grub/safemath.h&gt;<br>
- <br>
- static inline void <br>
- free (void *ptr)<br>
-@@ -37,7 +38,12 @@ malloc (grub_size_t size)<br>
- static inline void *<br>
- calloc (grub_size_t size, grub_size_t nelem)<br>
- {<br>
--=C2=A0 return grub_zalloc (size * nelem);<br>
-+=C2=A0 grub_size_t sz;<br>
-+<br>
-+=C2=A0 if (grub_mul (size, nelem, &amp;sz))<br>
-+=C2=A0 =C2=A0 return NULL;<br>
-+<br>
-+=C2=A0 return grub_zalloc (sz);<br>
- }<br>
- <br>
- static inline void *<br>
-diff --git a/include/grub/emu/misc.h b/include/grub/emu/misc.h<br>
-index ce464cf..ff9c48a 100644<br>
---- a/include/grub/emu/misc.h<br>
-+++ b/include/grub/emu/misc.h<br>
-@@ -47,6 +47,7 @@ grub_util_device_is_mapped (const char *dev);<br>
- #define GRUB_HOST_PRIuLONG_LONG &quot;llu&quot;<br>
- #define GRUB_HOST_PRIxLONG_LONG &quot;llx&quot;<br>
- <br>
-+void * EXPORT_FUNC(xcalloc) (grub_size_t nmemb, grub_size_t size) WARN_U=
NUSED_RESULT;<br>
- void * EXPORT_FUNC(xmalloc) (grub_size_t size) WARN_UNUSED_RESULT;<br>
- void * EXPORT_FUNC(xrealloc) (void *ptr, grub_size_t size) WARN_UNUSED_R=
ESULT;<br>
- char * EXPORT_FUNC(xstrdup) (const char *str) WARN_UNUSED_RESULT;<br>
-diff --git a/include/grub/mm.h b/include/grub/mm.h<br>
-index 28e2e53..9c38dd3 100644<br>
---- a/include/grub/mm.h<br>
-+++ b/include/grub/mm.h<br>
-@@ -29,6 +29,7 @@<br>
- #endif<br>
- <br>
- void grub_mm_init_region (void *addr, grub_size_t size);<br>
-+void *EXPORT_FUNC(grub_calloc) (grub_size_t nmemb, grub_size_t size);<br=
>
- void *EXPORT_FUNC(grub_malloc) (grub_size_t size);<br>
- void *EXPORT_FUNC(grub_zalloc) (grub_size_t size);<br>
- void EXPORT_FUNC(grub_free) (void *ptr);<br>
-@@ -48,6 +49,9 @@ extern int EXPORT_VAR(grub_mm_debug);<br>
- void grub_mm_dump_free (void);<br>
- void grub_mm_dump (unsigned lineno);<br>
- <br>
-+#define grub_calloc(nmemb, size)=C2=A0 =C2=A0 =C2=A0 \<br>
-+=C2=A0 grub_debug_calloc (GRUB_FILE, __LINE__, nmemb, size)<br>
-+<br>
- #define grub_malloc(size)=C2=A0 =C2=A0 =C2=A0\<br>
-=C2=A0 =C2=A0grub_debug_malloc (GRUB_FILE, __LINE__, size)<br>
- <br>
-@@ -63,6 +67,8 @@ void grub_mm_dump (unsigned lineno);<br>
- #define grub_free(ptr)=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-=C2=A0 =C2=A0grub_debug_free (GRUB_FILE, __LINE__, ptr)<br>
- <br>
-+void *EXPORT_FUNC(grub_debug_calloc) (const char *file, int line,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_size_t nmemb,=
 grub_size_t size);<br>
- void *EXPORT_FUNC(grub_debug_malloc) (const char *file, int line,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_size_t siz=
e);<br>
- void *EXPORT_FUNC(grub_debug_zalloc) (const char *file, int line,<br>
--- <br>
-2.14.4<br>
-<br>
diff --git a/meta/recipes-bsp/grub/files/determinism.patch b/meta/recipes-=
bsp/grub/files/determinism.patch<br>
index 3c1f562c71..2828e80975 100644<br>
--- a/meta/recipes-bsp/grub/files/determinism.patch<br>
+++ b/meta/recipes-bsp/grub/files/determinism.patch<br>
@@ -1,6 +1,9 @@<br>
-The output in moddep.lst generated from syminfo.lst using genmoddep.awk i=
s<br>
-not deterministic since the order of the dependencies on each line can va=
ry<br>
-depending on how awk sorts the values in the array.<br>
+From b6f9b3f6fa782807c4a7ec16ee8ef868cdfbf468 Mon Sep 17 00:00:00 2001<br=
>
+From: Naveen Saini &lt;<a href=3D"mailto:naveen.kumar.saini@intel.com" ta=
rget=3D"_blank">naveen.kumar.saini@intel.com</a>&gt;<br>
+Date: Mon, 15 Mar 2021 14:56:18 +0800<br>
+Subject: [PATCH] The output in moddep.lst generated from syminfo.lst usin=
g<br>
+ genmoddep.awk is not deterministic since the order of the dependencies o=
n<br>
+ each line can vary depending on how awk sorts the values in the array.<b=
r>
<br>
=C2=A0Be deterministic in the output by sorting the dependencies on each l=
ine.<br>
<br>
@@ -13,11 +16,29 @@ keys of the dict.<br>
<br>
=C2=A0Upstream-Status: Pending<br>
=C2=A0Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.=
org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<br>
+Signed-off-by: Naveen Saini &lt;<a href=3D"mailto:naveen.kumar.saini@inte=
l.com" target=3D"_blank">naveen.kumar.saini@intel.com</a>&gt;<br>
+---<br>
+ gentpl.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br=
>
+ grub-core/genmoddep.awk | 4 +++-<br>
+ util/import_unicode.py=C2=A0 | 2 +-<br>
+ 3 files changed, 5 insertions(+), 2 deletions(-)<br>
<br>
-Index: grub-2.04/grub-core/genmoddep.awk<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- grub-2.04.orig/grub-core/genmoddep.awk<br>
-+++ grub-2.04/grub-core/genmoddep.awk<br>
+diff --git a/gentpl.py b/gentpl.py<br>
+index c86550d4f..589285192 100644<br>
+--- a/gentpl.py<br>
++++ b/gentpl.py<br>
+@@ -568,6 +568,7 @@ def foreach_platform_value(defn, platform, suffix, cl=
osure):<br>
+=C2=A0 =C2=A0 =C2=A0for group in RMAP[platform]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for value in defn.find_all(group + suff=
ix):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r.append(closure(value))<=
br>
++=C2=A0 =C2=A0 r.sort()<br>
+=C2=A0 =C2=A0 =C2=A0return &#39;&#39;.join(r)<br>
+ <br>
+ def platform_conditional(platform, closure):<br>
+diff --git a/grub-core/genmoddep.awk b/grub-core/genmoddep.awk<br>
+index 04c2863e5..247436392 100644<br>
+--- a/grub-core/genmoddep.awk<br>
++++ b/grub-core/genmoddep.awk<br>
=C2=A0@@ -59,7 +59,9 @@ END {<br>
=C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 modlist =3D &quot;&quot;<br>
@@ -29,22 +50,10 @@ Index: grub-2.04/grub-core/genmoddep.awk<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 modlist =3D modlist &quot; &quot; depmod;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 inverse_dependencies[depmod] =3D inverse_depen=
dencies[depmod] &quot; &quot; mod<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depcount[mod]++<br>
-Index: grub-2.04/gentpl.py<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- grub-2.04.orig/gentpl.py<br>
-+++ grub-2.04/gentpl.py<br>
-@@ -568,6 +568,7 @@ def foreach_platform_value(defn, platfor<br>
-=C2=A0 =C2=A0 =C2=A0for group in RMAP[platform]:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for value in defn.find_all(group + suff=
ix):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r.append(closure(value))<=
br>
-+=C2=A0 =C2=A0 r.sort()<br>
-=C2=A0 =C2=A0 =C2=A0return &#39;&#39;.join(r)<br>
- <br>
- def platform_conditional(platform, closure):<br>
-Index: grub-2.04/util/import_unicode.py<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- grub-2.04.orig/util/import_unicode.py<br>
-+++ grub-2.04/util/import_unicode.py<br>
+diff --git a/util/import_unicode.py b/util/import_unicode.py<br>
+index 08f80591e..1f434a069 100644<br>
+--- a/util/import_unicode.py<br>
++++ b/util/import_unicode.py<br>
=C2=A0@@ -174,7 +174,7 @@ infile.close ()<br>
<br>
=C2=A0 outfile.write (&quot;struct grub_unicode_arabic_shape grub_unicode_=
arabic_shapes[] =3D {\n &quot;)<br>
@@ -54,3 +63,6 @@ Index: grub-2.04/util/import_unicode.py<br>
=C2=A0 =C2=A0 =C2=A0 try:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if arabicsubst[x][&#39;join&#39;] =3D=
=3D &quot;DUAL&quot;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 outfile.write (&quot;{0x%=
x, 0x%x, 0x%x, 0x%x, 0x%x},\n &quot; % (arabicsubst[x][0], arabicsubst[x][1=
], arabicsubst[x][2], arabicsubst[x][3], arabicsubst[x][4]))<br>
+-- <br>
+2.17.1<br>
+<br>
diff --git a/meta/recipes-bsp/grub/files/lvm-Add-LVM-cache-logical-volume-=
handling.patch b/meta/recipes-bsp/grub/files/lvm-Add-LVM-cache-logical-volu=
me-handling.patch<br>
deleted file mode 100644<br>
index 2b8157f592..0000000000<br>
--- a/meta/recipes-bsp/grub/files/lvm-Add-LVM-cache-logical-volume-handlin=
g.patch<br>
+++ /dev/null<br>
@@ -1,287 +0,0 @@<br>
-From 8eb02bcb5897b238b29ff762402bb0c3028f0eab Mon Sep 17 00:00:00 2001<br=
>
-From: Michael Chang &lt;<a href=3D"mailto:mchang@suse.com" target=3D"_bla=
nk">mchang@suse.com</a>&gt;<br>
-Date: Thu, 19 Mar 2020 13:56:13 +0800<br>
-Subject: [PATCH 3/9] lvm: Add LVM cache logical volume handling<br>
-<br>
-The LVM cache logical volume is the logical volume consisting of the orig=
inal<br>
-and the cache pool logical volume. The original is usually on a larger an=
d<br>
-slower storage device while the cache pool is on a smaller and faster one=
. The<br>
-performance of the original volume can be improved by storing the frequen=
tly<br>
-used data on the cache pool to utilize the greater performance of faster<=
br>
-device.<br>
-<br>
-The default cache mode &quot;writethrough&quot; ensures that any data wri=
tten will be<br>
-stored both in the cache and on the origin LV, therefore grub can be stra=
ight<br>
-to read the original lv as no data loss is guarenteed.<br>
-<br>
-The second cache mode is &quot;writeback&quot;, which delays writing from=
 the cache pool<br>
-back to the origin LV to have increased performance. The drawback is pote=
ntial<br>
-data loss if losing the associated cache device.<br>
-<br>
-During the boot time grub reads the LVM offline i.e. LVM volumes are not<=
br>
-activated and mounted, hence it should be fine to read directly from orig=
inal<br>
-lv since all cached data should have been flushed back in the process of =
taking<br>
-it offline.<br>
-<br>
-It is also not much helpful to the situation by adding fsync calls to the=
<br>
-install code. The fsync did not force to write back dirty cache to the or=
iginal<br>
-device and rather it would update associated cache metadata to complete t=
he<br>
-write transaction with the cache device. IOW the writes to cached blocks =
still<br>
-go only to the cache device.<br>
-<br>
-To write back dirty cache, as LVM cache did not support dirty cache flush=
 per<br>
-block range, there&#39;no way to do it for file. On the other hand the &q=
uot;cleaner&quot;<br>
-policy is implemented and can be used to write back &quot;all&quot; dirty=
 blocks in a<br>
-cache, which effectively drain all dirty cache gradually to attain and la=
st in<br>
-the &quot;clean&quot; state, which can be useful for shrinking or decommi=
ssioning a<br>
-cache. The result and effect is not what we are looking for here.<br>
-<br>
-In conclusion, as it seems no way to enforce file writes to the original<=
br>
-device, grub may suffer from power failure as it cannot assemble the cach=
e<br>
-device and read the dirty data from it. However since the case is only<br=
>
-applicable to writeback mode which is sensitive to data lost in nature, I=
&#39;d<br>
-still like to propose my (relatively simple) patch and treat reading dirt=
y<br>
-cache as improvement.<br>
-<br>
-Upstream-Status: Backport [commit 0454b0445393aafc5600e92ef0c39494e333b13=
5<br>
-from <a href=3D"https://git.savannah.gnu.org/git/grub.git" rel=3D"norefer=
rer" target=3D"_blank">https://git.savannah.gnu.org/git/grub.git</a>]<br>
-<br>
-Signed-off-by: Michael Chang &lt;<a href=3D"mailto:mchang@suse.com" targe=
t=3D"_blank">mchang@suse.com</a>&gt;<br>
-Reviewed-by: Daniel Kiper &lt;<a href=3D"mailto:daniel.kiper@oracle.com" =
target=3D"_blank">daniel.kiper@oracle.com</a>&gt;<br>
-Signed-off-by: Yongxin Liu &lt;<a href=3D"mailto:yongxin.liu@windriver.co=
m" target=3D"_blank">yongxin.liu@windriver.com</a>&gt;<br>
----<br>
- grub-core/disk/lvm.c | 190 +++++++++++++++++++++++++++++++++++++++++++++=
++++++<br>
- 1 file changed, 190 insertions(+)<br>
-<br>
-diff --git a/grub-core/disk/lvm.c b/grub-core/disk/lvm.c<br>
-index 7b265c7..dc6b83b 100644<br>
---- a/grub-core/disk/lvm.c<br>
-+++ b/grub-core/disk/lvm.c<br>
-@@ -33,6 +33,14 @@<br>
- <br>
- GRUB_MOD_LICENSE (&quot;GPLv3+&quot;);<br>
- <br>
-+struct cache_lv<br>
-+{<br>
-+=C2=A0 struct grub_diskfilter_lv *lv;<br>
-+=C2=A0 char *cache_pool;<br>
-+=C2=A0 char *origin;<br>
-+=C2=A0 struct cache_lv *next;<br>
-+};<br>
-+<br>
- <br>
- /* Go the string STR and return the number after STR.=C2=A0 *P will poin=
t<br>
-=C2=A0 =C2=A0 at the number.=C2=A0 In case STR is not found, *P will be N=
ULL and the<br>
-@@ -95,6 +103,34 @@ grub_lvm_check_flag (char *p, const char *str, const =
char *flag)<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
- }<br>
- <br>
-+static void<br>
-+grub_lvm_free_cache_lvs (struct cache_lv *cache_lvs)<br>
-+{<br>
-+=C2=A0 struct cache_lv *cache;<br>
-+<br>
-+=C2=A0 while ((cache =3D cache_lvs))<br>
-+=C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 cache_lvs =3D cache_lvs-&gt;next;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 if (cache-&gt;lv)<br>
-+=C2=A0 =C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int i;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; cache-&gt;lv-&gt;segmen=
t_count; ++i)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cache-&gt;lv-&gt;segments)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_free (cache-&gt;lv-&gt;se=
gments[i].nodes);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_free (cache-&gt;lv-&gt;segments);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_free (cache-&gt;lv-&gt;fullname);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_free (cache-&gt;lv-&gt;idname);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_free (cache-&gt;lv-&gt;name);<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 grub_free (cache-&gt;lv);<br>
-+=C2=A0 =C2=A0 =C2=A0 grub_free (cache-&gt;origin);<br>
-+=C2=A0 =C2=A0 =C2=A0 grub_free (cache-&gt;cache_pool);<br>
-+=C2=A0 =C2=A0 =C2=A0 grub_free (cache);<br>
-+=C2=A0 =C2=A0 }<br>
-+}<br>
-+<br>
- static struct grub_diskfilter_vg * <br>
- grub_lvm_detect (grub_disk_t disk,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct grub_diskf=
ilter_pv_id *id,<br>
-@@ -242,6 +278,8 @@ grub_lvm_detect (grub_disk_t disk,<br>
- <br>
-=C2=A0 =C2=A0if (! vg)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-+=C2=A0 =C2=A0 =C2=A0 struct cache_lv *cache_lvs =3D NULL;<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* First time we see this volume group. We&#39=
;ve to create the<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 whole volume group structure. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vg =3D grub_malloc (sizeof (*vg));<br>
-@@ -671,6 +709,106 @@ grub_lvm_detect (grub_disk_t disk,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0seg-&gt;nodes[seg-&gt;node_count - 1].name =3D tmp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (grub_me=
mcmp (p, &quot;cache\&quot;&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof (&quot;cache\&quot;=
&quot;) - 1) =3D=3D 0)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 st=
ruct cache_lv *cache =3D NULL;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ch=
ar *p2, *p3;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gr=
ub_size_t sz;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ca=
che =3D grub_zalloc (sizeof (*cache));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if=
 (!cache)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 goto cache_lv_fail;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ca=
che-&gt;lv =3D grub_zalloc (sizeof (*cache-&gt;lv));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if=
 (!cache-&gt;lv)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 goto cache_lv_fail;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gr=
ub_memcpy (cache-&gt;lv, lv, sizeof (*cache-&gt;lv));<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if=
 (lv-&gt;fullname)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 cache-&gt;lv-&gt;fullname =3D grub_strdup (lv-&gt;fullname);=
<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 if (!cache-&gt;lv-&gt;fullname)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 goto cache_lv_fail;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if=
 (lv-&gt;idname)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 cache-&gt;lv-&gt;idname =3D grub_strdup (lv-&gt;idname);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 if (!cache-&gt;lv-&gt;idname)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 goto cache_lv_fail;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if=
 (lv-&gt;name)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 cache-&gt;lv-&gt;name =3D grub_strdup (lv-&gt;name);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 if (!cache-&gt;lv-&gt;name)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 goto cache_lv_fail;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sk=
ip_lv =3D 1;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p2=
 =3D grub_strstr (p, &quot;cache_pool =3D \&quot;&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if=
 (!p2)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 goto cache_lv_fail;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p2=
 =3D grub_strchr (p2, &#39;&quot;&#39;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if=
 (!p2)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 goto cache_lv_fail;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p3=
 =3D ++p2;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p3=
 =3D grub_strchr (p3, &#39;&quot;&#39;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if=
 (!p3)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 goto cache_lv_fail;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sz=
 =3D p3 - p2;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ca=
che-&gt;cache_pool =3D grub_malloc (sz + 1);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if=
 (!cache-&gt;cache_pool)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 goto cache_lv_fail;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gr=
ub_memcpy (cache-&gt;cache_pool, p2, sz);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ca=
che-&gt;cache_pool[sz] =3D &#39;\0&#39;;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p2=
 =3D grub_strstr (p, &quot;origin =3D \&quot;&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if=
 (!p2)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 goto cache_lv_fail;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p2=
 =3D grub_strchr (p2, &#39;&quot;&#39;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if=
 (!p2)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 goto cache_lv_fail;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p3=
 =3D ++p2;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p3=
 =3D grub_strchr (p3, &#39;&quot;&#39;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if=
 (!p3)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 goto cache_lv_fail;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sz=
 =3D p3 - p2;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ca=
che-&gt;origin =3D grub_malloc (sz + 1);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if=
 (!cache-&gt;origin)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 goto cache_lv_fail;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gr=
ub_memcpy (cache-&gt;origin, p2, sz);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ca=
che-&gt;origin[sz] =3D &#39;\0&#39;;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ca=
che-&gt;next =3D cache_lvs;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ca=
che_lvs =3D cache;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 br=
eak;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cache_lv_=
fail:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if=
 (cache)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 grub_free (cache-&gt;origin);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 grub_free (cache-&gt;cache_pool);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 if (cache-&gt;lv)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_free (cache-&gt;lv-&gt;fullname);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_free (cache-&gt;lv-&gt;idname);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_free (cache-&gt;lv-&gt;name);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 grub_free (cache-&gt;lv);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 grub_free (cache);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gr=
ub_lvm_free_cache_lvs (cache_lvs);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 go=
to fail4;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br=
>
- #ifdef GRUB_UTIL<br>
-@@ -747,6 +885,58 @@ grub_lvm_detect (grub_disk_t disk,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 struct cache_lv *cache;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 for (cache =3D cache_lvs; cache; cache =3D cache-&g=
t;next)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct grub_diskfilter_lv *lv;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (lv =3D vg-&gt;lvs; lv; lv =3D lv=
-&gt;next)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (grub_strcmp (lv-&gt;name, =
cache-&gt;origin) =3D=3D 0)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (lv)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cache-&gt;lv-&gt;segmen=
ts =3D grub_malloc (lv-&gt;segment_count * sizeof (*lv-&gt;segments));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!cache-&gt;lv-&gt;s=
egments)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_lvm_=
free_cache_lvs (cache_lvs);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail=
4;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_memcpy (cache-&gt;=
lv-&gt;segments, lv-&gt;segments, lv-&gt;segment_count * sizeof (*lv-&gt;se=
gments));<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; lv=
-&gt;segment_count; ++i)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct gr=
ub_diskfilter_node *nodes =3D lv-&gt;segments[i].nodes;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_size=
_t node_count =3D lv-&gt;segments[i].node_count;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cache-&gt=
;lv-&gt;segments[i].nodes =3D grub_malloc (node_count * sizeof (*nodes));<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!cach=
e-&gt;lv-&gt;segments[i].nodes)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<=
br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 for (j =3D 0; j &lt; i; ++j)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 grub_free (cache-&gt;lv-&gt;segments[j].nodes);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 grub_free (cache-&gt;lv-&gt;segments);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 cache-&gt;lv-&gt;segments =3D NULL;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 grub_lvm_free_cache_lvs (cache_lvs);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 goto fail4;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<=
br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_memc=
py (cache-&gt;lv-&gt;segments[i].nodes, nodes, node_count * sizeof (*nodes)=
);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cache-&gt;lv-&gt;se=
gments)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cache-&gt=
;lv-&gt;segment_count =3D lv-&gt;segment_count;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cache-&gt=
;lv-&gt;vg =3D vg;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cache-&gt=
;lv-&gt;next =3D vg-&gt;lvs;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vg-&gt;lv=
s =3D cache-&gt;lv;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cache-&gt=
;lv =3D NULL;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 grub_lvm_free_cache_lvs (cache_lvs);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (grub_diskfilter_vg_register (vg))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail4;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
--- <br>
-2.14.4<br>
-<br>
diff --git a/meta/recipes-bsp/grub/files/safemath-Add-some-arithmetic-prim=
itives-that-check-f.patch b/meta/recipes-bsp/grub/files/safemath-Add-some-a=
rithmetic-primitives-that-check-f.patch<br>
deleted file mode 100644<br>
index 29021e8d8f..0000000000<br>
--- a/meta/recipes-bsp/grub/files/safemath-Add-some-arithmetic-primitives-=
that-check-f.patch<br>
+++ /dev/null<br>
@@ -1,94 +0,0 @@<br>
-From 06c361a71c4998635493610e5d76d0d223925251 Mon Sep 17 00:00:00 2001<br=
>
-From: Peter Jones &lt;<a href=3D"mailto:pjones@redhat.com" target=3D"_bla=
nk">pjones@redhat.com</a>&gt;<br>
-Date: Mon, 15 Jun 2020 10:58:42 -0400<br>
-Subject: [PATCH 5/9] safemath: Add some arithmetic primitives that check =
for<br>
- overflow<br>
-<br>
-This adds a new header, include/grub/safemath.h, that includes easy to<br=
>
-use wrappers for __builtin_{add,sub,mul}_overflow() declared like:<br>
-<br>
-=C2=A0 bool OP(a, b, res)<br>
-<br>
-where OP is grub_add, grub_sub or grub_mul. OP() returns true in the<br>
-case where the operation would overflow and res is not modified.<br>
-Otherwise, false is returned and the operation is executed.<br>
-<br>
-These arithmetic primitives require newer compiler versions. So, bump<br>
-these requirements in the INSTALL file too.<br>
-<br>
-Upstream-Status: Backport [commit 68708c4503018d61dbcce7ac11cbb511d6425f4=
d<br>
-from <a href=3D"https://git.savannah.gnu.org/git/grub.git" rel=3D"norefer=
rer" target=3D"_blank">https://git.savannah.gnu.org/git/grub.git</a>]<br>
-<br>
-Signed-off-by: Peter Jones &lt;<a href=3D"mailto:pjones@redhat.com" targe=
t=3D"_blank">pjones@redhat.com</a>&gt;<br>
-Reviewed-by: Daniel Kiper &lt;<a href=3D"mailto:daniel.kiper@oracle.com" =
target=3D"_blank">daniel.kiper@oracle.com</a>&gt;<br>
-[YL: omit the change to INSTALL from original patch]<br>
-Signed-off-by: Yongxin Liu &lt;<a href=3D"mailto:yongxin.liu@windriver.co=
m" target=3D"_blank">yongxin.liu@windriver.com</a>&gt;<br>
----<br>
- include/grub/compiler.h |=C2=A0 8 ++++++++<br>
- include/grub/safemath.h | 37 +++++++++++++++++++++++++++++++++++++<br>
- 2 files changed, 45 insertions(+)<br>
- create mode 100644 include/grub/safemath.h<br>
-<br>
-diff --git a/include/grub/compiler.h b/include/grub/compiler.h<br>
-index c9e1d7a..8f3be3a 100644<br>
---- a/include/grub/compiler.h<br>
-+++ b/include/grub/compiler.h<br>
-@@ -48,4 +48,12 @@<br>
- #=C2=A0 define WARN_UNUSED_RESULT<br>
- #endif<br>
- <br>
-+#if defined(__clang__) &amp;&amp; defined(__clang_major__) &amp;&amp; de=
fined(__clang_minor__)<br>
-+#=C2=A0 define CLANG_PREREQ(maj,min) \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((__clang_major__ &gt; (maj)) || \<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(__clang_major__ =3D=3D (maj) &amp;&am=
p; __clang_minor__ &gt;=3D (min)))<br>
-+#else<br>
-+#=C2=A0 define CLANG_PREREQ(maj,min) 0<br>
-+#endif<br>
-+<br>
- #endif /* ! GRUB_COMPILER_HEADER */<br>
-diff --git a/include/grub/safemath.h b/include/grub/safemath.h<br>
-new file mode 100644<br>
-index 0000000..c17b89b<br>
---- /dev/null<br>
-+++ b/include/grub/safemath.h<br>
-@@ -0,0 +1,37 @@<br>
-+/*<br>
-+ *=C2=A0 GRUB=C2=A0 --=C2=A0 GRand Unified Bootloader<br>
-+ *=C2=A0 Copyright (C) 2020=C2=A0 Free Software Foundation, Inc.<br>
-+ *<br>
-+ *=C2=A0 GRUB is free software: you can redistribute it and/or modify<br=
>
-+ *=C2=A0 it under the terms of the GNU General Public License as publish=
ed by<br>
-+ *=C2=A0 the Free Software Foundation, either version 3 of the License, =
or<br>
-+ *=C2=A0 (at your option) any later version.<br>
-+ *<br>
-+ *=C2=A0 GRUB is distributed in the hope that it will be useful,<br>
-+ *=C2=A0 but WITHOUT ANY WARRANTY; without even the implied warranty of<=
br>
-+ *=C2=A0 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See =
the<br>
-+ *=C2=A0 GNU General Public License for more details.<br>
-+ *<br>
-+ *=C2=A0 You should have received a copy of the GNU General Public Licen=
se<br>
-+ *=C2=A0 along with GRUB.=C2=A0 If not, see &lt;<a href=3D"http://www.gn=
u.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/li=
censes/</a>&gt;.<br>
-+ *<br>
-+ *=C2=A0 Arithmetic operations that protect against overflow.<br>
-+ */<br>
-+<br>
-+#ifndef GRUB_SAFEMATH_H<br>
-+#define GRUB_SAFEMATH_H 1<br>
-+<br>
-+#include &lt;grub/compiler.h&gt;<br>
-+<br>
-+/* These appear in gcc 5.1 and clang 3.8. */<br>
-+#if GNUC_PREREQ(5, 1) || CLANG_PREREQ(3, 8)<br>
-+<br>
-+#define grub_add(a, b, res)=C2=A0 =C2=A0__builtin_add_overflow(a, b, res=
)<br>
-+#define grub_sub(a, b, res)=C2=A0 =C2=A0__builtin_sub_overflow(a, b, res=
)<br>
-+#define grub_mul(a, b, res)=C2=A0 =C2=A0__builtin_mul_overflow(a, b, res=
)<br>
-+<br>
-+#else<br>
-+#error gcc 5.1 or newer or clang 3.8 or newer is required<br>
-+#endif<br>
-+<br>
-+#endif /* GRUB_SAFEMATH_H */<br>
--- <br>
-2.14.4<br>
-<br>
diff --git a/meta/recipes-bsp/grub/files/script-Remove-unused-fields-from-=
grub_script_functio.patch b/meta/recipes-bsp/grub/files/script-Remove-unuse=
d-fields-from-grub_script_functio.patch<br>
deleted file mode 100644<br>
index 84a80d5ffd..0000000000<br>
--- a/meta/recipes-bsp/grub/files/script-Remove-unused-fields-from-grub_sc=
ript_functio.patch<br>
+++ /dev/null<br>
@@ -1,37 +0,0 @@<br>
-From e219bad8cee67b2bb21712df8f055706f8da25d2 Mon Sep 17 00:00:00 2001<br=
>
-From: Chris Coulson &lt;<a href=3D"mailto:chris.coulson@canonical.com" ta=
rget=3D"_blank">chris.coulson@canonical.com</a>&gt;<br>
-Date: Fri, 10 Jul 2020 11:21:14 +0100<br>
-Subject: [PATCH 7/9] script: Remove unused fields from grub_script_functi=
on<br>
- struct<br>
-<br>
-Upstream-Status: Backport [commit 1a8d9c9b4ab6df7669b5aa36a56477f297825b9=
6<br>
-from <a href=3D"https://git.savannah.gnu.org/git/grub.git" rel=3D"norefer=
rer" target=3D"_blank">https://git.savannah.gnu.org/git/grub.git</a>]<br>
-<br>
-Signed-off-by: Chris Coulson &lt;<a href=3D"mailto:chris.coulson@canonica=
l.com" target=3D"_blank">chris.coulson@canonical.com</a>&gt;<br>
-Reviewed-by: Daniel Kiper &lt;<a href=3D"mailto:daniel.kiper@oracle.com" =
target=3D"_blank">daniel.kiper@oracle.com</a>&gt;<br>
-Signed-off-by: Yongxin Liu &lt;<a href=3D"mailto:yongxin.liu@windriver.co=
m" target=3D"_blank">yongxin.liu@windriver.com</a>&gt;<br>
----<br>
- include/grub/script_sh.h | 5 -----<br>
- 1 file changed, 5 deletions(-)<br>
-<br>
-diff --git a/include/grub/script_sh.h b/include/grub/script_sh.h<br>
-index 360c2be..b382bcf 100644<br>
---- a/include/grub/script_sh.h<br>
-+++ b/include/grub/script_sh.h<br>
-@@ -359,13 +359,8 @@ struct grub_script_function<br>
-=C2=A0 =C2=A0/* The script function.=C2=A0 */<br>
-=C2=A0 =C2=A0struct grub_script *func;<br>
- <br>
--=C2=A0 /* The flags.=C2=A0 */<br>
--=C2=A0 unsigned flags;<br>
--<br>
-=C2=A0 =C2=A0/* The next element.=C2=A0 */<br>
-=C2=A0 =C2=A0struct grub_script_function *next;<br>
--<br>
--=C2=A0 int references;<br>
- };<br>
- typedef struct grub_script_function *grub_script_function_t;<br>
- <br>
--- <br>
-2.14.4<br>
-<br>
diff --git a/meta/recipes-bsp/grub/<a href=3D"http://grub-efi_2.04.bb" rel=
=
=3D"noreferrer" target=3D"_blank">grub-efi_2.04.bb</a> b/meta/recipes-bsp/=
grub/<a href=3D"http://grub-efi_2.06-rc1.bb" rel=3D"noreferrer" target=3D"_=
blank">grub-efi_2.06-rc1.bb</a><br>
similarity index 98%<br>
rename from meta/recipes-bsp/grub/<a href=3D"http://grub-efi_2.04.bb" rel=
=3D"noreferrer" target=3D"_blank">grub-efi_2.04.bb</a><br>
rename to meta/recipes-bsp/grub/<a href=3D"http://grub-efi_2.06-rc1.bb" re=
l=3D"noreferrer" target=3D"_blank">grub-efi_2.06-rc1.bb</a><br>
index 287845c507..240fde7dbf 100644<br>
--- a/meta/recipes-bsp/grub/<a href=3D"http://grub-efi_2.04.bb" rel=3D"nor=
eferrer" target=3D"_blank">grub-efi_2.04.bb</a><br>
+++ b/meta/recipes-bsp/grub/<a href=3D"http://grub-efi_2.06-rc1.bb" rel=3D=
"noreferrer" target=3D"_blank">grub-efi_2.06-rc1.bb</a><br>
@@ -11,8 +11,6 @@ SRC_URI +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://cfg \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-S =3D &quot;${WORKDIR}/grub-${PV}&quot;<br>
-<br>
=C2=A0# Determine the target arch for the grub modules<br>
=C2=A0python __anonymous () {<br>
=C2=A0 =C2=A0 =C2=A0import re<br>
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2=
.inc<br>
index f870d41f6a..9312404ed9 100644<br>
--- a/meta/recipes-bsp/grub/grub2.inc<br>
+++ b/meta/recipes-bsp/grub/grub2.inc<br>
@@ -13,25 +13,20 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dd32239=
bcb673463ab874e80d47fae504&quot;<br>
<br>
=C2=A0CVE_PRODUCT =3D &quot;grub2&quot;<br>
<br>
-SRC_URI =3D &quot;${GNU_MIRROR}/grub/grub-${PV}.tar.gz \<br>
+SRC_URI =3D &quot;git://<a href=3D"http://git.savannah.gnu.org/git/grub.g=
it;name=3Dgrub" rel=3D"noreferrer" target=3D"_blank">git.savannah.gnu.org/g=
it/grub.git;name=3Dgrub</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://git.sv.g=
nu.org/gnulib.git;destsuffix=3Dgit/grub-core/lib/gnulib;name=3Dgnulib" rel=
=3D"noreferrer" target=3D"_blank">git.sv.gnu.org/gnulib.git;destsuffix=3Dg=
it/grub-core/lib/gnulib;name=3Dgnulib</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Disable-mfpmath-sse-=
as-well-when-SSE-is-disabled.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://autogen.sh-exclude-pc.pat=
ch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://grub-module-explicitly-ke=
eps-symbole-.module_license.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-grub.d-10_linux.in-a=
dd-oe-s-kernel-name.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2020-10713.patch \<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://calloc-Make-sure-we-alway=
s-have-an-overflow-checking.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://lvm-Add-LVM-cache-logical=
-volume-handling.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2020-14308-calloc-Use=
-calloc-at-most-places.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://safemath-Add-some-arithme=
tic-primitives-that-check-f.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2020-14309-CVE-2020-1=
4310-CVE-2020-14311-malloc-Use-overflow-checking-primitives-where-we-do-.pa=
tch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://script-Remove-unused-fiel=
ds-from-grub_script_functio.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2020-15706-script-Avo=
id-a-use-after-free-when-redefining-a-func.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2020-15707-linux-Fix-=
integer-overflows-in-initrd-size-handling.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://6643507ce30f775008e093580=
f0c9499dfb2c485.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://determinism.patch \<br>
=C2=A0&quot;<br>
-SRC_URI[md5sum] =3D &quot;5ce674ca6b2612d8939b9e6abed32934&quot;<br>
-SRC_URI[sha256sum] =3D &quot;f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c=
2cb49b7e5031658ba6ea&quot;<br>
+<br>
+SRCREV_grub =3D &quot;a53e530f8ad3770c3b03c208c08ae4162f68e3b1&quot;<br>
+SRCREV_gnulib =3D &quot;d271f868a8df9bbec29049d01e056481b7a1a263&quot;<br=
>
+SRCREV_FORMAT =3D &quot;grub_gnulib&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;flex-native bison-native gettext-native&quot;<br>
<br>
@@ -76,6 +71,7 @@ export PYTHON =3D &quot;python3&quot;<br>
<br>
=C2=A0do_configure_prepend() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${S}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${S}/bootstrap --gnulib-srcdir=3D${S}/grub-cor=
e/lib/gnulib<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 FROM_BOOTSTRAP=3D1 ${S}/autogen.sh<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${B}<br>
=C2=A0}<br>
diff --git a/meta/recipes-bsp/grub/<a href=3D"http://grub_2.04.bb" rel=3D"=
noreferrer" target=3D"_blank">grub_2.04.bb</a> b/meta/recipes-bsp/grub/<a h=
ref=3D"http://grub_2.06-rc1.bb" rel=3D"noreferrer" target=3D"_blank">grub_2=
.06-rc1.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-bsp/grub/<a href=3D"http://grub_2.04.bb" rel=3D"n=
oreferrer" target=3D"_blank">grub_2.04.bb</a><br>
rename to meta/recipes-bsp/grub/<a href=3D"http://grub_2.06-rc1.bb" rel=3D=
"noreferrer" target=3D"_blank">grub_2.06-rc1.bb</a><br>
-- <br>
2.17.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000a6122205bda291f0--
