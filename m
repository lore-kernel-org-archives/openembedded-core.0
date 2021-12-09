Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFABAC433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 17:28:36 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web08.14640.1639070916117302259
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 09:28:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YadSGw5k;
 spf=pass (domain: gmail.com, ip: 209.85.222.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id m186so5519494qkb.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 09:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZeJwMI6N3p3PVrvtB3uPvMEjj4Bn9HUQUGWkhbp/9Ac=;
        b=YadSGw5kPMYrMKQUUy0Sg66gPMnJzGb8TfN9nfDiX2LzA/8PWWCLV3scuSDPAMEvxl
         ze4fSAlsbLGztgEFfFNRsbM0mVgAOb+yTc8uTi9eo38pMSKBWpvrtkn8wzZpv2LmuZHe
         VSAzuYcpC55eUaGQoOM/SrOjJP+eqqVKC5j4H/OhcQ5sC5hs2K7gBOVFBZRkCLfAdbUD
         UKD70vwDQ5OKi1SexUsTJWdyh838nUGFoPKgn3bJ2nFoCz2IvRnQw/AlBSrSkigSpKVE
         e2FjPfrjf2Goz4gotbiUEyuvDew4fBXBSECu6ESciBHONDQ8yI73Kh/03CUg5GqAMoSN
         ppYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZeJwMI6N3p3PVrvtB3uPvMEjj4Bn9HUQUGWkhbp/9Ac=;
        b=n9Z4SziTP+HILc5H/MUZ4OSd7pED7J0pSR0QQFM3Kqqw8WL6zD8KH6+rfuDje0eQeW
         LAZPvkwFA95Tz44hD00MMKMY8YZTiCTXRaCn3BWN0gaA/9dvxS7Xc/eEw0Hagz33NZxk
         XHMcoL/z4JTn1p9i3NxqavlGQJXhDMuIw+Xg62s7BWCr1bEvKNjMDjvMvDICsmXq7q3Y
         /G/fFKsH2J977+eTiPMP0hMeqXLA9e7hi0OA6HugPhQ+8tBzMB8sokiklCh9GZ2PSjd3
         xiGTtBRcKPFi48+RiMiJRUZkt7jaPfvVMAAI8vlRAxWDR7DjnwLGc3zdvXppNhU8zQI9
         0JZA==
X-Gm-Message-State: AOAM533gNpD1KgfQIyfhe3z/1qkmEGPLKt/TkA37cvDmWgdRAvb1QaQH
	1xI2VoV8FFsx6BgUWQoJD8Cf7b0C06W/smtBglw=
X-Google-Smtp-Source: 
 ABdhPJwKstS9UWGCqi6JdJOGtyvcV9xBr+pfZaRneXToTTRrQptY3R6kxUERKiyh/j7fZ0IiYMSkDG6jUzAPGta0mpQ=
X-Received: by 2002:a05:620a:461f:: with SMTP id
 br31mr15196076qkb.72.1639070915161;
 Thu, 09 Dec 2021 09:28:35 -0800 (PST)
MIME-Version: 1.0
References: <20211209172537.641755-1-richard.purdie@linuxfoundation.org>
 <20211209172537.641755-3-richard.purdie@linuxfoundation.org>
In-Reply-To: <20211209172537.641755-3-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 9 Dec 2021 09:28:09 -0800
Message-ID: 
 <CAMKF1sr1XsSrsHTMt7Z-w=QMnWBfB9=VfGn-5icwjxNCxPvBYA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/4] binutils: Drop mips default target patch
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 17:28:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159469

On Thu, Dec 9, 2021 at 9:25 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Similarly to the recent gcc change, we make gcc default to the 64 bit target
> through configuration now so we don't need to patch this.
>

LGTM

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../binutils/binutils-2.37.inc                |  1 -
>  ...e-default-emulation-for-mips64-linux.patch | 57 -------------------
>  2 files changed, 58 deletions(-)
>  delete mode 100644 meta/recipes-devtools/binutils/binutils/0009-Change-default-emulation-for-mips64-linux.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.37.inc b/meta/recipes-devtools/binutils/binutils-2.37.inc
> index a3e0fbc769d..8c6e659e73d 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.37.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.37.inc
> @@ -26,7 +26,6 @@ SRC_URI = "\
>       file://0006-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch \
>       file://0007-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch \
>       file://0008-warn-for-uses-of-system-directories-when-cross-linki.patch \
> -     file://0009-Change-default-emulation-for-mips64-linux.patch \
>       file://0010-Add-support-for-Netlogic-XLP.patch \
>       file://0011-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch \
>       file://0013-Use-libtool-2.4.patch \
> diff --git a/meta/recipes-devtools/binutils/binutils/0009-Change-default-emulation-for-mips64-linux.patch b/meta/recipes-devtools/binutils/binutils/0009-Change-default-emulation-for-mips64-linux.patch
> deleted file mode 100644
> index fab92d52e68..00000000000
> --- a/meta/recipes-devtools/binutils/binutils/0009-Change-default-emulation-for-mips64-linux.patch
> +++ /dev/null
> @@ -1,57 +0,0 @@
> -From fb6d52dda9c230baf869ed5f981581a7b5094b70 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Mon, 2 Mar 2015 01:44:14 +0000
> -Subject: [PATCH] Change default emulation for mips64*-*-linux
> -
> -we change the default emulations to be N64 instead of N32
> -
> -Upstream-Status: Inappropriate [ OE configuration Specific]
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - bfd/config.bfd   | 8 ++++----
> - ld/configure.tgt | 8 ++++----
> - 2 files changed, 8 insertions(+), 8 deletions(-)
> -
> -diff --git a/bfd/config.bfd b/bfd/config.bfd
> -index 30087e3b8f8..1896e11790c 100644
> ---- a/bfd/config.bfd
> -+++ b/bfd/config.bfd
> -@@ -891,12 +891,12 @@ case "${targ}" in
> -     targ_selvecs="mips_elf32_le_vec mips_elf64_be_vec mips_elf64_le_vec mips_ecoff_be_vec mips_ecoff_le_vec"
> -     ;;
> -   mips64*el-*-linux*)
> --    targ_defvec=mips_elf32_ntrad_le_vec
> --    targ_selvecs="mips_elf32_ntrad_be_vec mips_elf32_trad_le_vec mips_elf32_trad_be_vec mips_elf64_trad_le_vec mips_elf64_trad_be_vec"
> -+    targ_defvec=mips_elf64_trad_le_vec
> -+    targ_selvecs="mips_elf32_ntrad_be_vec mips_elf32_ntrad_le_vec mips_elf32_trad_le_vec mips_elf32_trad_be_vec mips_elf64_trad_be_vec"
> -     ;;
> -   mips64*-*-linux*)
> --    targ_defvec=mips_elf32_ntrad_be_vec
> --    targ_selvecs="mips_elf32_ntrad_le_vec mips_elf32_trad_be_vec mips_elf32_trad_le_vec mips_elf64_trad_be_vec mips_elf64_trad_le_vec"
> -+    targ_defvec=mips_elf64_trad_be_vec
> -+    targ_selvecs="mips_elf32_ntrad_be_vec mips_elf32_ntrad_be_vec mips_elf32_trad_be_vec mips_elf32_trad_le_vec mips_elf64_trad_le_vec"
> -     ;;
> -   mips*el-*-linux*)
> -     targ_defvec=mips_elf32_trad_le_vec
> -diff --git a/ld/configure.tgt b/ld/configure.tgt
> -index 6205d7c9872..c08533658e5 100644
> ---- a/ld/configure.tgt
> -+++ b/ld/configure.tgt
> -@@ -530,12 +530,12 @@ mips*-*-vxworks*)        targ_emul=elf32ebmipvxworks
> -                       ;;
> - mips*-*-windiss)      targ_emul=elf32mipswindiss
> -                       ;;
> --mips64*el-*-linux-*)  targ_emul=elf32ltsmipn32
> --                      targ_extra_emuls="elf32btsmipn32 elf32ltsmip elf32btsmip elf64ltsmip elf64btsmip"
> -+mips64*el-*-linux-*)  targ_emul=elf64ltsmip
> -+                      targ_extra_emuls="elf32btsmipn32 elf32ltsmipn32 elf32ltsmip elf32btsmip elf64btsmip"
> -                       targ_extra_libpath=$targ_extra_emuls
> -                       ;;
> --mips64*-*-linux-*)    targ_emul=elf32btsmipn32
> --                      targ_extra_emuls="elf32ltsmipn32 elf32btsmip elf32ltsmip elf64btsmip elf64ltsmip"
> -+mips64*-*-linux-*)    targ_emul=elf64btsmip
> -+                      targ_extra_emuls="elf32btsmipn32 elf32ltsmipn32 elf32btsmip elf32ltsmip elf64ltsmip"
> -                       targ_extra_libpath=$targ_extra_emuls
> -                       ;;
> - mips*el-*-linux-*)    targ_emul=elf32ltsmip
> --
> 2.32.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159465): https://lists.openembedded.org/g/openembedded-core/message/159465
> Mute This Topic: https://lists.openembedded.org/mt/87616748/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

