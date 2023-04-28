Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04913C77B60
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 19:31:11 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.30223.1682710264466810231
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Apr 2023 12:31:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=H7IRyIoa;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-2fddb442d47so102412f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 12:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682710263; x=1685302263;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fKvssd6OiD7XlhEtcheiB0/kdeWCTtejeaCaccpnEB0=;
        b=H7IRyIoa6E1dDX8cufTpJt+dDprKFRXlEc4hiWMVtRn+YTjR2TovGymM6P8rAD+hsP
         kt+kygmOA3Nyr48H6ocZ1SR7ido+WRtjrrLcQQ1wUO/op4HMNnfJVzaFLbbzhumnJHH2
         o8A/jHHL51Ec8ZKdn59YmkO3pV3wgOlMuieUPHGa1vxAtr+s1GXRFjdoAFJHMgZH0S7+
         V1KiRBJjCj+V5baKncMSk4G72P51QjoQN66rysfBoNgRQnRmIwRIxy5/YIYaz235d/YH
         AXZK3GqqQUYY+R3PVCUrm4dL2++RYqCEEcwP8cFm3NZJRjZvyM9j/xZaVVlyO2qdknZQ
         Bl4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682710263; x=1685302263;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fKvssd6OiD7XlhEtcheiB0/kdeWCTtejeaCaccpnEB0=;
        b=T/IiikMMmFEmdJ552Ief91USxu0NpV7U+732CWhbx+7lA+E15Gwee6uKAUbVGQw8Rg
         1NILdvkgUd9Kd6LtqaG98FAK/zb4en74rZt+OJFPACZx5kR2gRhHVowQz823KBjEzz88
         JrS5JyI2KHYefzlkOTLVG4Ag8TWG4+rGhrsAj14H8IxX7U14dbdnSrlpAK+Mw9D2tb+s
         YJvGwolG+I7lfFe6cRmfaErv+ABI1ac9QGaCVJ1NzSzF7quUWSw7GyXGKg33P4RXvsqw
         EnkmShbeSN6lPH6lqxIS8SLS7+6HSsVREizqeDeNPAJ10A5j6bmQZIw5fCaiuyCsg/kA
         LfIg==
X-Gm-Message-State: AC+VfDzDc3LqU4GCL2I5QhRc5Lfn5r5ydoJgwAg1bkM7up8uU1stiUeq
	4aEa66O/E53YyCM1uB1OaPM3qx6bP/FpdoDaY/E=
X-Google-Smtp-Source: ACHHUZ54yK2r1p0P3GEGvldnwtlZo/BQx/7vXEF2t7f3v6wY/gj17fI2wb8xs4/TDTz76up4b+zExcmG65hdDl+meZc=
X-Received: by 2002:a5d:6a45:0:b0:2fe:fd61:6426 with SMTP id
 t5-20020a5d6a45000000b002fefd616426mr4744372wrw.11.1682710262361; Fri, 28 Apr
 2023 12:31:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230427082057.1370025-1-raj.khem@gmail.com>
In-Reply-To: <20230427082057.1370025-1-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 28 Apr 2023 21:30:51 +0200
Message-ID: <CA+chaQcmo-xWVRPMA5q0nOns3gvWoi+RCNKfgwCCQiix9tyv6g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4] binutils: stable 2.40 branch updates
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Deepthi Hemraj <deepadeepthi98@gmail.com>, Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
Content-Type: multipart/alternative; boundary="00000000000072b19005fa6a8345"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 19:31:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180534

--00000000000072b19005fa6a8345
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm seeing:

ERROR: binutils-2.40-r0 do_package: QA Issue: binutils: Files/directories
were installed but not shipped in any package:
        /usr/lib/gprofng/libgp-collectorAPI.a

with this update, not sure why it doesn't show up on AB, but will send a
fix for this.

Regards,

On Thu, Apr 27, 2023 at 10:21=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrot=
e:

> From: Deepthi Hemraj <deepadeepthi98@gmail.com>
>
> - Rebase existing patches
> - Drop 0014-configure-remove-dependencies-on-gmp-and-mpfr-when-g.patch
>   which is already in
> - Correct packaging path to libgprofng.so
> - Correct packaging
> - Below commits on binutils-2.40 stable branch are updated.
>
> 4671be001eb Updated Hungarian translation for the gprof directory
> ded035f913e lto: Don't add indirect symbols for versioned aliases in IR
> 74cb2ddeabc gas: arm: Change warning message to not reference specific
> A-class architecture revision
> 570b9c09bbf gas: arm: Fix a further IT-predicated vcvt issue in the
> presense of MVE vcvtn
> bddd62e188c libctf: get the offsets of fields of unnamed structs/unions
> right
> 7aa47eafcce libctf: fix assertion failure with no system qsort_r
> 165accf0752 coff_get_normalized_symtab bfd_release
> af35798e957 PR30217, dynamic relocations using local dynamic symbols
> 18bb604f1e1 PR30198, Assertion and segfault when linking x86_64 elf and
> coff
> 34a2b4a0e21 PR30155, ld segfault in _bfd_nearby_section
> 3d0046f39aa PR30046, power cmpi leads to unknown architecture
> 5c87fb1d59b ppc32 and "LOAD segment with RWX permissions"
> 11f5c1ebf14 Updated Serbian translations for gold, gprof and opcodes
> sub-directories
> 38e455b1d9a Updated translations for the bfd and gprof directories.
> b2bc62b7b4e gas: correct symbol name comparison in .startof./.sizeof.
> handling
> 17294931e3e configure: remove dependencies on gmp and mpfr when gdb is
> disabled
> 1fc096a4c59 Regen config files
> e1815414077 Pass $JANSSON_LIBS and $ZSTD_LIBS to ld-bootstrap/bootrap.exp
> 3e888977f16 bpf: fix error conversion from long unsigned int to unsigned
> int [-Werror=3Doverflow]
> 65dbb942145 Updated Swedish translation for the binutils sub-directory
> 27f59ec47a1 RISC-V: make C-extension JAL available again for (32-bit)
> assembly
> edd36b26f35 gprofng: PR30043 libgprofng.so.* are installed to a wrong
> location
> c6e269febbc gprofng: PR29521 [docs] man pages are not in the release
> tarball
> bcea253f5fa toplevel: Makefile.def: add install-strip dependency on
> libsframe
>
> Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Rebase existing patches to apply on top
> v3: Drop upstreamed patch
> v4: Fix packaging libgprofng.so
>
>  .../binutils/binutils-2.40.inc                |   1 -
>  ...s-crosssdk-Generate-relocatable-SDKs.patch |   2 +-
>  ...o-not-generate-linker-script-directo.patch |   2 +-
>  ...dk-Search-for-alternative-ld.so.conf.patch |   8 +-
>  ...004-Point-scripts-location-to-libdir.patch |   6 +-
>  ...stro-compiler-point-to-the-wrong-ins.patch |   2 +-
>  ...-system-directories-when-cross-linki.patch |   8 +-
>  ...ect-assembling-for-ppc-wait-mnemonic.patch |   2 +-
>  .../binutils/0008-Use-libtool-2.4.patch       | 252 +++++++++---------
>  ...h-in-libtool-when-sysroot-is-enabled.patch |   2 +-
>  .../0010-sync-with-OE-libtool-changes.patch   |   2 +-
>  ...or-clang-before-checking-gcc-version.patch |   6 +-
>  ...-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch |   2 +-
>  ...sing-_Alignof-when-using-C11-or-newe.patch |   2 +-
>  ...-dependencies-on-gmp-and-mpfr-when-g.patch |  56 ----
>  .../binutils/binutils_2.40.bb                 |   2 +-
>  16 files changed, 149 insertions(+), 206 deletions(-)
>  delete mode 100644
> meta/recipes-devtools/binutils/binutils/0014-configure-remove-dependencie=
s-on-gmp-and-mpfr-when-g.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.40.inc
> b/meta/recipes-devtools/binutils/binutils-2.40.inc
> index 924cc95669..e925a182ad 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.40.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.40.inc
> @@ -32,7 +32,6 @@ SRC_URI =3D "\
>       file://0011-Check-for-clang-before-checking-gcc-version.patch \
>
> file://0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch \
>
> file://0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
> -
>  file://0014-configure-remove-dependencies-on-gmp-and-mpfr-when-g.patch \
>
> file://0015-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch \
>       file://0016-CVE-2023-25586.patch \
>       file://fix-time64.patch \
> diff --git
> a/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate=
-relocatable-SDKs.patch
> b/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate=
-relocatable-SDKs.patch
> index 7fffa81724..ca249834ea 100644
> ---
> a/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate=
-relocatable-SDKs.patch
> +++
> b/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate=
-relocatable-SDKs.patch
> @@ -1,4 +1,4 @@
> -From 25e715730ddcca37021fa4876aed4fa91d5dea25 Mon Sep 17 00:00:00 2001
> +From 4bdab425bdd7dc52c95bfd62e035c1b9abe9595e Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 2 Mar 2015 01:58:54 +0000
>  Subject: [PATCH] binutils-crosssdk: Generate relocatable SDKs
> diff --git
> a/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-gene=
rate-linker-script-directo.patch
> b/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-gene=
rate-linker-script-directo.patch
> index 87a19c9ec3..663dc4af7d 100644
> ---
> a/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-gene=
rate-linker-script-directo.patch
> +++
> b/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-gene=
rate-linker-script-directo.patch
> @@ -1,4 +1,4 @@
> -From 080a8eafc5961f78222d84aaa816d0933441b7ab Mon Sep 17 00:00:00 2001
> +From c79005d4d9991593557766ad569f48c26482399f Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 6 Mar 2017 23:37:05 -0800
>  Subject: [PATCH] binutils-cross: Do not generate linker script directori=
es
> diff --git
> a/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-=
for-alternative-ld.so.conf.patch
> b/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-=
for-alternative-ld.so.conf.patch
> index 54967b9362..f46116f1af 100644
> ---
> a/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-=
for-alternative-ld.so.conf.patch
> +++
> b/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-=
for-alternative-ld.so.conf.patch
> @@ -1,4 +1,4 @@
> -From 90d1bb804033a74b54f64cd5d3127c004c266af8 Mon Sep 17 00:00:00 2001
> +From 70da8b91026c5381d430194910fc15e3b6c5ec7f Mon Sep 17 00:00:00 2001
>  From: Richard Purdie <richard.purdie@linuxfoundation.org>
>  Date: Wed, 19 Feb 2020 09:51:16 -0800
>  Subject: [PATCH] binutils-nativesdk: Search for alternative ld.so.conf i=
n
> SDK
> @@ -29,7 +29,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   5 files changed, 7 insertions(+), 3 deletions(-)
>
>  diff --git a/ld/Makefile.am b/ld/Makefile.am
> -index 12b2c3c453f..0590b7055d0 100644
> +index b3195b4be68..fc6460317a7 100644
>  --- a/ld/Makefile.am
>  +++ b/ld/Makefile.am
>  @@ -42,7 +42,8 @@ ZLIBINC =3D @zlibinc@
> @@ -43,7 +43,7 @@ index 12b2c3c453f..0590b7055d0 100644
>   NO_WERROR =3D @NO_WERROR@
>   AM_CFLAGS =3D $(WARN_CFLAGS) $(ELF_CLFAGS) $(JANSSON_CFLAGS) $(ZSTD_CFL=
AGS)
>  diff --git a/ld/Makefile.in b/ld/Makefile.in
> -index 3d5685d6bae..70643b1ce46 100644
> +index fe422569228..4a4c851b44a 100644
>  --- a/ld/Makefile.in
>  +++ b/ld/Makefile.in
>  @@ -566,7 +566,8 @@ ZLIB =3D @zlibdir@ -lz
> @@ -65,7 +65,7 @@ index eff6693e052..95787012b89 100644
>         info.path =3D NULL;
>         info.len =3D info.alloc =3D 0;
>  -      tmppath =3D concat (ld_sysroot, prefix, "/etc/ld.so.conf",
> -+      tmppath =3D concat (ld_sysconfdir, "/ld.so.conf",
> ++      tmppath =3D concat (ld_sysconfdir, "/etc/ld.so.conf",
>                         (const char *) NULL);
>         if (!ldelf_parse_ld_so_conf (&info, tmppath))
>         {
> diff --git
> a/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-=
libdir.patch
> b/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-=
libdir.patch
> index 90abd50498..e7d2593c49 100644
> ---
> a/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-=
libdir.patch
> +++
> b/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-=
libdir.patch
> @@ -1,4 +1,4 @@
> -From a7c988d60f11c8279453c2d9edeede001cce7c9e Mon Sep 17 00:00:00 2001
> +From fa477bb947fa17543f4550bc0e7e715c8355649c Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 2 Mar 2015 01:09:58 +0000
>  Subject: [PATCH] Point scripts location to libdir
> @@ -12,7 +12,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/ld/Makefile.am b/ld/Makefile.am
> -index 0590b7055d0..c30db94ee3c 100644
> +index fc6460317a7..1b875904b8d 100644
>  --- a/ld/Makefile.am
>  +++ b/ld/Makefile.am
>  @@ -51,7 +51,7 @@ AM_CFLAGS =3D $(WARN_CFLAGS) $(ELF_CLFAGS)
> $(JANSSON_CFLAGS) $(ZSTD_CFLAGS)
> @@ -25,7 +25,7 @@ index 0590b7055d0..c30db94ee3c 100644
>   EMUL =3D @EMUL@
>   EMULATION_OFILES =3D @EMULATION_OFILES@
>  diff --git a/ld/Makefile.in b/ld/Makefile.in
> -index 70643b1ce46..0405028e02f 100644
> +index 4a4c851b44a..08dcd7b75fc 100644
>  --- a/ld/Makefile.in
>  +++ b/ld/Makefile.in
>  @@ -574,7 +574,7 @@ AM_CFLAGS =3D $(WARN_CFLAGS) $(ELF_CLFAGS)
> $(JANSSON_CFLAGS) $(ZSTD_CFLAGS)
> diff --git
> a/meta/recipes-devtools/binutils/binutils/0005-don-t-let-the-distro-compi=
ler-point-to-the-wrong-ins.patch
> b/meta/recipes-devtools/binutils/binutils/0005-don-t-let-the-distro-compi=
ler-point-to-the-wrong-ins.patch
> index 9557e871db..7242f48795 100644
> ---
> a/meta/recipes-devtools/binutils/binutils/0005-don-t-let-the-distro-compi=
ler-point-to-the-wrong-ins.patch
> +++
> b/meta/recipes-devtools/binutils/binutils/0005-don-t-let-the-distro-compi=
ler-point-to-the-wrong-ins.patch
> @@ -1,4 +1,4 @@
> -From fc39b9c332a346910695817274d55d0c20dc717a Mon Sep 17 00:00:00 2001
> +From 7912f5a918e612950feb04d845934f26160e85da Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 2 Mar 2015 01:39:01 +0000
>  Subject: [PATCH] don't let the distro compiler point to the wrong
> installation
> diff --git
> a/meta/recipes-devtools/binutils/binutils/0006-warn-for-uses-of-system-di=
rectories-when-cross-linki.patch
> b/meta/recipes-devtools/binutils/binutils/0006-warn-for-uses-of-system-di=
rectories-when-cross-linki.patch
> index 0ca55d4095..87bbe9fb1b 100644
> ---
> a/meta/recipes-devtools/binutils/binutils/0006-warn-for-uses-of-system-di=
rectories-when-cross-linki.patch
> +++
> b/meta/recipes-devtools/binutils/binutils/0006-warn-for-uses-of-system-di=
rectories-when-cross-linki.patch
> @@ -1,4 +1,4 @@
> -From b9af05e87ac8eb4fa18a75939edb661056246c30 Mon Sep 17 00:00:00 2001
> +From 725ca09ee1041f64589f26ba815ef11da687c608 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Fri, 15 Jan 2016 06:31:09 +0000
>  Subject: [PATCH] warn for uses of system directories when cross linking
> @@ -77,7 +77,7 @@ index ad0dc6a106c..d21edaddce7 100644
>   #undef EXTRA_SHLIB_EXTENSION
>
>  diff --git a/ld/configure b/ld/configure
> -index 49936a0cb2a..5f5dad6d67c 100755
> +index 995708089fd..6406a42c442 100755
>  --- a/ld/configure
>  +++ b/ld/configure
>  @@ -839,6 +839,7 @@ with_lib_path
> @@ -253,7 +253,7 @@ index ceaca2d85d0..62e7b4e5341 100644
>       {
>         if (error_count < MAX_ERRORS_IN_A_ROW)
>  diff --git a/ld/lexsup.c b/ld/lexsup.c
> -index c5960385572..eb54627fb71 100644
> +index a1c6140100d..d47ba4f977d 100644
>  --- a/ld/lexsup.c
>  +++ b/ld/lexsup.c
>  @@ -613,6 +613,14 @@ static const struct ld_option ld_options[] =3D
> @@ -271,7 +271,7 @@ index c5960385572..eb54627fb71 100644
>   };
>
>   #define OPTION_COUNT ARRAY_SIZE (ld_options)
> -@@ -1735,6 +1743,14 @@ parse_args (unsigned argc, char **argv)
> +@@ -1737,6 +1745,14 @@ parse_args (unsigned argc, char **argv)
>           config.print_map_discarded =3D true;
>           break;
>
> diff --git
> a/meta/recipes-devtools/binutils/binutils/0007-fix-the-incorrect-assembli=
ng-for-ppc-wait-mnemonic.patch
> b/meta/recipes-devtools/binutils/binutils/0007-fix-the-incorrect-assembli=
ng-for-ppc-wait-mnemonic.patch
> index 502ce82928..fdd1f7756f 100644
> ---
> a/meta/recipes-devtools/binutils/binutils/0007-fix-the-incorrect-assembli=
ng-for-ppc-wait-mnemonic.patch
> +++
> b/meta/recipes-devtools/binutils/binutils/0007-fix-the-incorrect-assembli=
ng-for-ppc-wait-mnemonic.patch
> @@ -1,4 +1,4 @@
> -From ef9aa69324a209e546956a2f674462717ec5af0f Mon Sep 17 00:00:00 2001
> +From 4e9d4ace8a340399aeaa8332e2cfbfcc7d2d14d7 Mon Sep 17 00:00:00 2001
>  From: Zhenhua Luo <zhenhua.luo@nxp.com>
>  Date: Sat, 11 Jun 2016 22:08:29 -0500
>  Subject: [PATCH] fix the incorrect assembling for ppc wait mnemonic
> diff --git
> a/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.patch
> b/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.patch
> index 7e7c2579b3..0be871f5cf 100644
> --- a/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.patch
> @@ -1,4 +1,4 @@
> -From 0ad92af822bb6f58de3f3889d0adc0b2ef9d477f Mon Sep 17 00:00:00 2001
> +From a66b1806350a9bed7b188c7d115991f6cdee51a9 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Sun, 14 Feb 2016 17:04:07 +0000
>  Subject: [PATCH] Use libtool 2.4
> @@ -76,7 +76,7 @@ index 80aed657643..106ec256a79 100644
>   ac_ct_DUMPBIN =3D @ac_ct_DUMPBIN@
>   all_backends =3D @all_backends@
>  diff --git a/bfd/configure b/bfd/configure
> -index e5d464378f8..ee8ea251479 100755
> +index 60ea6becab2..84dcdf167ba 100755
>  --- a/bfd/configure
>  +++ b/bfd/configure
>  @@ -706,6 +706,9 @@ OTOOL
> @@ -2038,7 +2038,7 @@ index 27315addc0f..5ddd5a42a7d 100644
>   ac_ct_DUMPBIN =3D @ac_ct_DUMPBIN@
>   am__include =3D @am__include@
>  diff --git a/binutils/configure b/binutils/configure
> -index 3cb797c2b8d..5578150c1d9 100755
> +index c7bd42049c3..06285371350 100755
>  --- a/binutils/configure
>  +++ b/binutils/configure
>  @@ -700,8 +700,11 @@ OTOOL
> @@ -3977,7 +3977,7 @@ index 8319181b472..3425e414c1c 100644
>   ac_ct_DUMPBIN =3D @ac_ct_DUMPBIN@
>   am__include =3D @am__include@
>  diff --git a/gas/configure b/gas/configure
> -index 684e68e0ea2..ba35172965e 100755
> +index 3c0c3e27d3b..11baafb9db6 100755
>  --- a/gas/configure
>  +++ b/gas/configure
>  @@ -686,8 +686,11 @@ OTOOL
> @@ -5916,7 +5916,7 @@ index c9914e46d7d..1857eb8b5a8 100644
>   ac_ct_DUMPBIN =3D @ac_ct_DUMPBIN@
>   am__include =3D @am__include@
>  diff --git a/gprof/configure b/gprof/configure
> -index 3e8edd112cb..5b320c60f50 100755
> +index c5a081c88aa..a1b06379df4 100755
>  --- a/gprof/configure
>  +++ b/gprof/configure
>  @@ -663,8 +663,11 @@ OTOOL
> @@ -7830,7 +7830,7 @@ index 3e8edd112cb..5b320c60f50 100755
>     chmod +x "$ofile"
>
>  diff --git a/gprofng/Makefile.in b/gprofng/Makefile.in
> -index 01f7dca3f2a..3db326271c9 100644
> +index a2854950e34..4d307543d81 100644
>  --- a/gprofng/Makefile.in
>  +++ b/gprofng/Makefile.in
>  @@ -253,6 +253,7 @@ CXXFLAGS =3D @CXXFLAGS@
> @@ -7850,10 +7850,10 @@ index 01f7dca3f2a..3db326271c9 100644
>   NM =3D @NM@
>   NMEDIT =3D @NMEDIT@
>  diff --git a/gprofng/configure b/gprofng/configure
> -index 2afc9a381a6..1e57b41ffa4 100755
> +index 3ad87139280..e4593cbb838 100755
>  --- a/gprofng/configure
>  +++ b/gprofng/configure
> -@@ -672,6 +672,8 @@ OTOOL
> +@@ -674,6 +674,8 @@ OTOOL
>   LIPO
>   NMEDIT
>   DSYMUTIL
> @@ -7862,7 +7862,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>   OBJDUMP
>   LN_S
>   NM
> -@@ -802,6 +804,7 @@ enable_static
> +@@ -804,6 +806,7 @@ enable_static
>   with_pic
>   enable_fast_install
>   with_gnu_ld
> @@ -7870,7 +7870,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>   enable_libtool_lock
>   enable_werror_always
>   enable_gprofng_tools
> -@@ -1465,6 +1468,8 @@ Optional Packages:
> +@@ -1467,6 +1470,8 @@ Optional Packages:
>     --with-pic              try to use only PIC/non-PIC objects
> [default=3Duse
>                             both]
>     --with-gnu-ld           assume the C compiler uses GNU ld [default=3D=
no]
> @@ -7879,7 +7879,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>     --with-jdk=3DPATH         specify prefix directory for installed JDK.
>     --with-system-zlib      use installed libz
>
> -@@ -6156,8 +6161,8 @@ esac
> +@@ -6158,8 +6163,8 @@ esac
>
>
>
> @@ -7890,7 +7890,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>
>
>
> -@@ -6197,7 +6202,7 @@ ECHO=3D$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> +@@ -6199,7 +6204,7 @@ ECHO=3D$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings"
> >&5
>   $as_echo_n "checking how to print strings... " >&6; }
>   # Test print first, because it will be a builtin if present.
> @@ -7899,7 +7899,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>      test "X`print -r -- $ECHO 2>/dev/null`" =3D "X$ECHO"; then
>     ECHO=3D'print -r --'
>   elif test "X`printf %s $ECHO 2>/dev/null`" =3D "X$ECHO"; then
> -@@ -6890,8 +6895,8 @@ $as_echo_n "checking whether the shell understands
> some XSI constructs... " >&6;
> +@@ -6892,8 +6897,8 @@ $as_echo_n "checking whether the shell understands
> some XSI constructs... " >&6;
>   # Try some XSI features
>   xsi_shell=3Dno
>   ( _lt_dummy=3D"a/b/c"
> @@ -7910,7 +7910,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>       && eval 'test $(( 1 + 1 )) -eq 2 \
>       && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
>     && xsi_shell=3Dyes
> -@@ -6940,6 +6945,80 @@ esac
> +@@ -6942,6 +6947,80 @@ esac
>
>
>
> @@ -7991,7 +7991,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to
> reload object files" >&5
>   $as_echo_n "checking for $LD option to reload object files... " >&6; }
>   if ${lt_cv_ld_reload_flag+:} false; then :
> -@@ -6956,6 +7035,11 @@ case $reload_flag in
> +@@ -6958,6 +7037,11 @@ case $reload_flag in
>   esac
>   reload_cmds=3D'$LD$reload_flag -o $output$reload_objs'
>   case $host_os in
> @@ -8003,7 +8003,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>     darwin*)
>       if test "$GCC" =3D yes; then
>         reload_cmds=3D'$LTCC $LTCFLAGS -nostdlib ${wl}-r -o
> $output$reload_objs'
> -@@ -7124,7 +7208,8 @@ mingw* | pw32*)
> +@@ -7126,7 +7210,8 @@ mingw* | pw32*)
>       lt_cv_deplibs_check_method=3D'file_magic ^x86 archive import|^x86 D=
LL'
>       lt_cv_file_magic_cmd=3D'func_win32_libid'
>     else
> @@ -8013,7 +8013,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>       lt_cv_file_magic_cmd=3D'$OBJDUMP -f'
>     fi
>     ;;
> -@@ -7278,6 +7363,21 @@ esac
> +@@ -7280,6 +7365,21 @@ esac
>   fi
>   { $as_echo "$as_me:${as_lineno-$LINENO}: result:
> $lt_cv_deplibs_check_method" >&5
>   $as_echo "$lt_cv_deplibs_check_method" >&6; }
> @@ -8035,7 +8035,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>   file_magic_cmd=3D$lt_cv_file_magic_cmd
>   deplibs_check_method=3D$lt_cv_deplibs_check_method
>   test -z "$deplibs_check_method" && deplibs_check_method=3Dunknown
> -@@ -7293,6 +7393,157 @@ test -z "$deplibs_check_method" &&
> deplibs_check_method=3Dunknown
> +@@ -7295,6 +7395,157 @@ test -z "$deplibs_check_method" &&
> deplibs_check_method=3Dunknown
>
>
>
> @@ -8193,7 +8193,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>   plugin_option=3D
>   plugin_names=3D"liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dl=
l"
>   for plugin in $plugin_names; do
> -@@ -7307,8 +7558,10 @@ for plugin in $plugin_names; do
> +@@ -7309,8 +7560,10 @@ for plugin in $plugin_names; do
>   done
>
>   if test -n "$ac_tool_prefix"; then
> @@ -8206,7 +8206,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_AR+:} false; then :
> -@@ -7324,7 +7577,7 @@ do
> +@@ -7326,7 +7579,7 @@ do
>     test -z "$as_dir" && as_dir=3D.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -8215,7 +8215,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found
> $as_dir/$ac_word$ac_exec_ext" >&5
>       break 2
>     fi
> -@@ -7344,11 +7597,15 @@ $as_echo "no" >&6; }
> +@@ -7346,11 +7599,15 @@ $as_echo "no" >&6; }
>   fi
>
>
> @@ -8234,7 +8234,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_ac_ct_AR+:} false; then :
> -@@ -7364,7 +7621,7 @@ do
> +@@ -7366,7 +7623,7 @@ do
>     test -z "$as_dir" && as_dir=3D.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -8243,7 +8243,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found
> $as_dir/$ac_word$ac_exec_ext" >&5
>       break 2
>     fi
> -@@ -7383,6 +7640,10 @@ else
> +@@ -7385,6 +7642,10 @@ else
>   $as_echo "no" >&6; }
>   fi
>
> @@ -8254,7 +8254,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>     if test "x$ac_ct_AR" =3D x; then
>       AR=3D"false"
>     else
> -@@ -7394,29 +7655,81 @@ ac_tool_warned=3Dyes ;;
> +@@ -7396,29 +7657,81 @@ ac_tool_warned=3Dyes ;;
>   esac
>       AR=3D$ac_ct_AR
>     fi
> @@ -8351,7 +8351,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>
>
>
> -@@ -7763,8 +8076,8 @@ esac
> +@@ -7765,8 +8078,8 @@ esac
>   lt_cv_sys_global_symbol_to_cdecl=3D"sed -n -e 's/^T .* \(.*\)$/extern i=
nt
> \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
>
>   # Transform an extracted symbol line into symbol name and symbol addres=
s
> @@ -8362,7 +8362,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>
>   # Handle CRLF in mingw tool chain
>   opt_cr=3D
> -@@ -7800,6 +8113,7 @@ for ac_symprfx in "" "_"; do
> +@@ -7802,6 +8115,7 @@ for ac_symprfx in "" "_"; do
>     else
>       lt_cv_sys_global_symbol_pipe=3D"sed -n -e 's/^.*[
> ]\($symcode$symcode*\)[         ][
> ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
>     fi
> @@ -8370,7 +8370,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>
>     # Check to see that the pipe works correctly.
>     pipe_works=3Dno
> -@@ -7841,6 +8155,18 @@ _LT_EOF
> +@@ -7843,6 +8157,18 @@ _LT_EOF
>         if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
>         if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
>           cat <<_LT_EOF > conftest.$ac_ext
> @@ -8389,7 +8389,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>   #ifdef __cplusplus
>   extern "C" {
>   #endif
> -@@ -7852,7 +8178,7 @@ _LT_EOF
> +@@ -7854,7 +8180,7 @@ _LT_EOF
>           cat <<_LT_EOF >> conftest.$ac_ext
>
>   /* The mapping between symbol names and symbols.  */
> @@ -8398,7 +8398,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>     const char *name;
>     void       *address;
>   }
> -@@ -7878,8 +8204,8 @@ static const void *lt_preloaded_setup() {
> +@@ -7880,8 +8206,8 @@ static const void *lt_preloaded_setup() {
>   _LT_EOF
>           # Now try linking the two files.
>           mv conftest.$ac_objext conftstm.$ac_objext
> @@ -8409,7 +8409,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>           LIBS=3D"conftstm.$ac_objext"
>           CFLAGS=3D"$CFLAGS$lt_prog_compiler_no_builtin_flag"
>           if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}:
> \"$ac_link\""; } >&5
> -@@ -7889,8 +8215,8 @@ _LT_EOF
> +@@ -7891,8 +8217,8 @@ _LT_EOF
>     test $ac_status =3D 0; } && test -s conftest${ac_exeext}; then
>             pipe_works=3Dyes
>           fi
> @@ -8420,7 +8420,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>         else
>           echo "cannot find nm_test_func in $nlist" >&5
>         fi
> -@@ -7927,6 +8253,13 @@ else
> +@@ -7929,6 +8255,13 @@ else
>   $as_echo "ok" >&6; }
>   fi
>
> @@ -8434,7 +8434,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>
>
>
> -@@ -7946,6 +8279,48 @@ fi
> +@@ -7948,6 +8281,48 @@ fi
>
>
>
> @@ -8483,7 +8483,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>
>
>   # Check whether --enable-libtool-lock was given.
> -@@ -8154,6 +8529,123 @@ esac
> +@@ -8156,6 +8531,123 @@ esac
>
>   need_locks=3D"$enable_libtool_lock"
>
> @@ -8607,7 +8607,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>
>     case $host_os in
>       rhapsody* | darwin*)
> -@@ -8717,6 +9209,8 @@ _LT_EOF
> +@@ -8719,6 +9211,8 @@ _LT_EOF
>         $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
>         echo "$AR cru libconftest.a conftest.o" >&5
>         $AR cru libconftest.a conftest.o 2>&5
> @@ -8616,7 +8616,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>         cat > conftest.c << _LT_EOF
>   int main() { return 0;}
>   _LT_EOF
> -@@ -8785,6 +9279,16 @@ done
> +@@ -8787,6 +9281,16 @@ done
>
>
>
> @@ -8633,7 +8633,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>
>
>   # Set options
> -@@ -9270,8 +9774,6 @@ fi
> +@@ -9272,8 +9776,6 @@ fi
>   lt_prog_compiler_pic=3D
>   lt_prog_compiler_static=3D
>
> @@ -8642,7 +8642,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>
>     if test "$GCC" =3D yes; then
>       lt_prog_compiler_wl=3D'-Wl,'
> -@@ -9437,6 +9939,12 @@ $as_echo_n "checking for $compiler option to
> produce PIC... " >&6; }
> +@@ -9439,6 +9941,12 @@ $as_echo_n "checking for $compiler option to
> produce PIC... " >&6; }
>         lt_prog_compiler_pic=3D'--shared'
>         lt_prog_compiler_static=3D'--static'
>         ;;
> @@ -8655,7 +8655,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>         pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
>           # Portland Group compilers (*not* the Pentium gcc compiler,
>         # which looks to be a dead project)
> -@@ -9499,7 +10007,7 @@ $as_echo_n "checking for $compiler option to
> produce PIC... " >&6; }
> +@@ -9501,7 +10009,7 @@ $as_echo_n "checking for $compiler option to
> produce PIC... " >&6; }
>         lt_prog_compiler_pic=3D'-KPIC'
>         lt_prog_compiler_static=3D'-Bstatic'
>         case $cc_basename in
> @@ -8664,7 +8664,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>         lt_prog_compiler_wl=3D'-Qoption ld ';;
>         *)
>         lt_prog_compiler_wl=3D'-Wl,';;
> -@@ -9556,13 +10064,17 @@ case $host_os in
> +@@ -9558,13 +10066,17 @@ case $host_os in
>       lt_prog_compiler_pic=3D"$lt_prog_compiler_pic -DPIC"
>       ;;
>   esac
> @@ -8688,7 +8688,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>
>   #
>   # Check to make sure the PIC flag actually works.
> -@@ -9623,6 +10135,11 @@ fi
> +@@ -9625,6 +10137,11 @@ fi
>
>
>
> @@ -8700,7 +8700,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>   #
>   # Check to make sure the static flag actually works.
>   #
> -@@ -9973,7 +10490,8 @@ _LT_EOF
> +@@ -9975,7 +10492,8 @@ _LT_EOF
>         allow_undefined_flag=3Dunsupported
>         always_export_symbols=3Dno
>         enable_shared_with_static_runtimes=3Dyes
> @@ -8710,7 +8710,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>
>         if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
>           archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags -=
o
> $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-impli=
b
> -Xlinker $lib'
> -@@ -10072,12 +10590,12 @@ _LT_EOF
> +@@ -10074,12 +10592,12 @@ _LT_EOF
>           whole_archive_flag_spec=3D'--whole-archive$convenience
> --no-whole-archive'
>           hardcode_libdir_flag_spec=3D
>           hardcode_libdir_flag_spec_ld=3D'-rpath $libdir'
> @@ -8725,7 +8725,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>           fi
>           ;;
>         esac
> -@@ -10091,8 +10609,8 @@ _LT_EOF
> +@@ -10093,8 +10611,8 @@ _LT_EOF
>         archive_cmds=3D'$LD -Bshareable $libobjs $deplibs $linker_flags -=
o
> $lib'
>         wlarc=3D
>         else
> @@ -8736,7 +8736,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>         fi
>         ;;
>
> -@@ -10110,8 +10628,8 @@ _LT_EOF
> +@@ -10112,8 +10630,8 @@ _LT_EOF
>
>   _LT_EOF
>         elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' >
> /dev/null; then
> @@ -8747,7 +8747,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>         else
>         ld_shlibs=3Dno
>         fi
> -@@ -10157,8 +10675,8 @@ _LT_EOF
> +@@ -10159,8 +10677,8 @@ _LT_EOF
>
>       *)
>         if $LD --help 2>&1 | $GREP ': supported targets:.* elf' >
> /dev/null; then
> @@ -8758,7 +8758,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>         else
>         ld_shlibs=3Dno
>         fi
> -@@ -10288,7 +10806,13 @@ _LT_EOF
> +@@ -10290,7 +10808,13 @@ _LT_EOF
>         allow_undefined_flag=3D'-berok'
>           # Determine the default libpath from the value encoded in an
>           # empty executable.
> @@ -8773,7 +8773,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>   /* end confdefs.h.  */
>
>   int
> -@@ -10301,22 +10825,29 @@ main ()
> +@@ -10303,22 +10827,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>
> @@ -8816,7 +8816,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>
>           hardcode_libdir_flag_spec=3D'${wl}-blibpath:$libdir:'"$aix_libp=
ath"
>           archive_expsym_cmds=3D'$CC -o $output_objdir/$soname $libobjs
> $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test
> "x${allow_undefined_flag}" !=3D "x"; then func_echo_all
> "${wl}${allow_undefined_flag}"; else :; fi`
> '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> -@@ -10328,7 +10859,13 @@ if test -z "$aix_libpath"; then
> aix_libpath=3D"/usr/lib:/lib"; fi
> +@@ -10330,7 +10861,13 @@ if test -z "$aix_libpath"; then
> aix_libpath=3D"/usr/lib:/lib"; fi
>         else
>          # Determine the default libpath from the value encoded in an
>          # empty executable.
> @@ -8831,7 +8831,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>   /* end confdefs.h.  */
>
>   int
> -@@ -10341,22 +10878,29 @@ main ()
> +@@ -10343,22 +10880,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>
> @@ -8874,7 +8874,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>
>          hardcode_libdir_flag_spec=3D'${wl}-blibpath:$libdir:'"$aix_libpa=
th"
>           # Warning - without using the other run time loading flags,
> -@@ -10401,20 +10945,63 @@ if test -z "$aix_libpath"; then
> aix_libpath=3D"/usr/lib:/lib"; fi
> +@@ -10403,20 +10947,63 @@ if test -z "$aix_libpath"; then
> aix_libpath=3D"/usr/lib:/lib"; fi
>         # Microsoft Visual C++.
>         # hardcode_libdir_flag_spec is actually meaningless, as there is
>         # no search path for DLLs.
> @@ -8952,7 +8952,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>         ;;
>
>       darwin* | rhapsody*)
> -@@ -10475,7 +11062,7 @@ if test -z "$aix_libpath"; then
> aix_libpath=3D"/usr/lib:/lib"; fi
> +@@ -10477,7 +11064,7 @@ if test -z "$aix_libpath"; then
> aix_libpath=3D"/usr/lib:/lib"; fi
>
>       # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
>       freebsd* | dragonfly*)
> @@ -8961,7 +8961,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>         hardcode_libdir_flag_spec=3D'-R$libdir'
>         hardcode_direct=3Dyes
>         hardcode_shlibpath_var=3Dno
> -@@ -10483,7 +11070,7 @@ if test -z "$aix_libpath"; then
> aix_libpath=3D"/usr/lib:/lib"; fi
> +@@ -10485,7 +11072,7 @@ if test -z "$aix_libpath"; then
> aix_libpath=3D"/usr/lib:/lib"; fi
>
>       hpux9*)
>         if test "$GCC" =3D yes; then
> @@ -8970,7 +8970,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>         else
>         archive_cmds=3D'$RM $output_objdir/$soname~$LD -b +b $install_lib=
dir
> -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test
> $output_objdir/$soname =3D $lib || mv $output_objdir/$soname $lib'
>         fi
> -@@ -10499,7 +11086,7 @@ if test -z "$aix_libpath"; then
> aix_libpath=3D"/usr/lib:/lib"; fi
> +@@ -10501,7 +11088,7 @@ if test -z "$aix_libpath"; then
> aix_libpath=3D"/usr/lib:/lib"; fi
>
>       hpux10*)
>         if test "$GCC" =3D yes && test "$with_gnu_ld" =3D no; then
> @@ -8979,7 +8979,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>         else
>         archive_cmds=3D'$LD -b +h $soname +b $install_libdir -o $lib
> $libobjs $deplibs $linker_flags'
>         fi
> -@@ -10523,10 +11110,10 @@ if test -z "$aix_libpath"; then
> aix_libpath=3D"/usr/lib:/lib"; fi
> +@@ -10525,10 +11112,10 @@ if test -z "$aix_libpath"; then
> aix_libpath=3D"/usr/lib:/lib"; fi
>           archive_cmds=3D'$CC -shared ${wl}+h ${wl}$soname -o $lib $libob=
js
> $deplibs $compiler_flags'
>           ;;
>         ia64*)
> @@ -8992,7 +8992,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>           ;;
>         esac
>         else
> -@@ -10605,23 +11192,36 @@ fi
> +@@ -10607,23 +11194,36 @@ fi
>
>       irix5* | irix6* | nonstopux*)
>         if test "$GCC" =3D yes; then
> @@ -9037,7 +9037,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>         else
>         archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags
> -soname $soname `test -n "$verstring" && func_echo_all "-set_version
> $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
>         archive_expsym_cmds=3D'$CC -shared $libobjs $deplibs $compiler_fl=
ags
> -soname $soname `test -n "$verstring" && func_echo_all "-set_version
> $verstring"` -update_registry ${output_objdir}/so_locations -exports_file
> $export_symbols -o $lib'
> -@@ -10706,7 +11306,7 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -10708,7 +11308,7 @@ rm -f core conftest.err conftest.$ac_objext \
>       osf4* | osf5*)    # as osf3* with the addition of -msym flag
>         if test "$GCC" =3D yes; then
>         allow_undefined_flag=3D' ${wl}-expect_unresolved ${wl}\*'
> @@ -9046,7 +9046,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>         hardcode_libdir_flag_spec=3D'${wl}-rpath ${wl}$libdir'
>         else
>         allow_undefined_flag=3D' -expect_unresolved \*'
> -@@ -10725,9 +11325,9 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -10727,9 +11327,9 @@ rm -f core conftest.err conftest.$ac_objext \
>         no_undefined_flag=3D' -z defs'
>         if test "$GCC" =3D yes; then
>         wlarc=3D'${wl}'
> @@ -9058,7 +9058,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>         else
>         case `$CC -V 2>&1` in
>         *"Compilers 5.0"*)
> -@@ -11303,8 +11903,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -11305,8 +11905,9 @@ cygwin* | mingw* | pw32* | cegcc*)
>     need_version=3Dno
>     need_lib_prefix=3Dno
>
> @@ -9070,7 +9070,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>       library_names_spec=3D'$libname.dll.a'
>       # DLL is installed to $(libdir)/../bin by postinstall_cmds
>       postinstall_cmds=3D'base_file=3D`basename \${file}`~
> -@@ -11337,13 +11938,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -11339,13 +11940,71 @@ cygwin* | mingw* | pw32* | cegcc*)
>         library_names_spec=3D'`echo ${libname} | sed -e 's/^lib/pw/'``ech=
o
> ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
>         ;;
>       esac
> @@ -9143,16 +9143,16 @@ index 2afc9a381a6..1e57b41ffa4 100755
>     # FIXME: first we should search . and the directory the executable is
> in
>     shlibpath_var=3DPATH
>     ;;
> -@@ -12221,7 +12880,7 @@ else
> +@@ -12223,7 +12882,7 @@ else
>     lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
>     lt_status=3D$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 12224 "configure"
> +-#line 12226 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>
>   #if HAVE_DLFCN_H
> -@@ -12265,10 +12924,10 @@ else
> +@@ -12267,10 +12926,10 @@ else
>   /* When -fvisbility=3Dhidden is used, assume the code has been annotate=
d
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ =3D=3D 3) && (__GNUC_MINOR__ >=3D =
3)) ||
> (__GNUC__ > 3))
> @@ -9165,16 +9165,16 @@ index 2afc9a381a6..1e57b41ffa4 100755
>   int main ()
>   {
>     void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -12327,7 +12986,7 @@ else
> +@@ -12329,7 +12988,7 @@ else
>     lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
>     lt_status=3D$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 12330 "configure"
> +-#line 12332 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>
>   #if HAVE_DLFCN_H
> -@@ -12371,10 +13030,10 @@ else
> +@@ -12373,10 +13032,10 @@ else
>   /* When -fvisbility=3Dhidden is used, assume the code has been annotate=
d
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ =3D=3D 3) && (__GNUC_MINOR__ >=3D =
3)) ||
> (__GNUC__ > 3))
> @@ -9187,7 +9187,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>   int main ()
>   {
>     void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -12766,6 +13425,7 @@ $RM -r conftest*
> +@@ -12768,6 +13427,7 @@ $RM -r conftest*
>
>     # Allow CC to be a program name with arguments.
>     lt_save_CC=3D$CC
> @@ -9195,7 +9195,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>     lt_save_LD=3D$LD
>     lt_save_GCC=3D$GCC
>     GCC=3D$GXX
> -@@ -12783,6 +13443,7 @@ $RM -r conftest*
> +@@ -12785,6 +13445,7 @@ $RM -r conftest*
>     fi
>     test -z "${LDCXX+set}" || LD=3D$LDCXX
>     CC=3D${CXX-"c++"}
> @@ -9203,7 +9203,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>     compiler=3D$CC
>     compiler_CXX=3D$CC
>     for cc_temp in $compiler""; do
> -@@ -13065,7 +13726,13 @@ $as_echo_n "checking whether the $compiler
> linker ($LD) supports shared librarie
> +@@ -13067,7 +13728,13 @@ $as_echo_n "checking whether the $compiler
> linker ($LD) supports shared librarie
>             allow_undefined_flag_CXX=3D'-berok'
>             # Determine the default libpath from the value encoded in an
> empty
>             # executable.
> @@ -9218,7 +9218,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>   /* end confdefs.h.  */
>
>   int
> -@@ -13078,22 +13745,29 @@ main ()
> +@@ -13080,22 +13747,29 @@ main ()
>   _ACEOF
>   if ac_fn_cxx_try_link "$LINENO"; then :
>
> @@ -9261,7 +9261,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>
>
> hardcode_libdir_flag_spec_CXX=3D'${wl}-blibpath:$libdir:'"$aix_libpath"
>
> -@@ -13106,7 +13780,13 @@ if test -z "$aix_libpath"; then
> aix_libpath=3D"/usr/lib:/lib"; fi
> +@@ -13108,7 +13782,13 @@ if test -z "$aix_libpath"; then
> aix_libpath=3D"/usr/lib:/lib"; fi
>             else
>             # Determine the default libpath from the value encoded in an
>             # empty executable.
> @@ -9276,7 +9276,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>   /* end confdefs.h.  */
>
>   int
> -@@ -13119,22 +13799,29 @@ main ()
> +@@ -13121,22 +13801,29 @@ main ()
>   _ACEOF
>   if ac_fn_cxx_try_link "$LINENO"; then :
>
> @@ -9319,7 +9319,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>
>
> hardcode_libdir_flag_spec_CXX=3D'${wl}-blibpath:$libdir:'"$aix_libpath"
>             # Warning - without using the other run time loading flags,
> -@@ -13177,29 +13864,75 @@ if test -z "$aix_libpath"; then
> aix_libpath=3D"/usr/lib:/lib"; fi
> +@@ -13179,29 +13866,75 @@ if test -z "$aix_libpath"; then
> aix_libpath=3D"/usr/lib:/lib"; fi
>           ;;
>
>         cygwin* | mingw* | pw32* | cegcc*)
> @@ -9418,7 +9418,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>         darwin* | rhapsody*)
>
>
> -@@ -13305,7 +14038,7 @@ if test -z "$aix_libpath"; then
> aix_libpath=3D"/usr/lib:/lib"; fi
> +@@ -13307,7 +14040,7 @@ if test -z "$aix_libpath"; then
> aix_libpath=3D"/usr/lib:/lib"; fi
>               ;;
>             *)
>               if test "$GXX" =3D yes; then
> @@ -9427,7 +9427,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>               else
>                 # FIXME: insert proper C++ library support
>                 ld_shlibs_CXX=3Dno
> -@@ -13376,10 +14109,10 @@ if test -z "$aix_libpath"; then
> aix_libpath=3D"/usr/lib:/lib"; fi
> +@@ -13378,10 +14111,10 @@ if test -z "$aix_libpath"; then
> aix_libpath=3D"/usr/lib:/lib"; fi
>                     archive_cmds_CXX=3D'$CC -shared -nostdlib -fPIC ${wl}=
+h
> ${wl}$soname -o $lib $predep_objects $libobjs $deplibs $postdep_objects
> $compiler_flags'
>                     ;;
>                   ia64*)
> @@ -9440,7 +9440,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>                     ;;
>                 esac
>               fi
> -@@ -13420,9 +14153,9 @@ if test -z "$aix_libpath"; then
> aix_libpath=3D"/usr/lib:/lib"; fi
> +@@ -13422,9 +14155,9 @@ if test -z "$aix_libpath"; then
> aix_libpath=3D"/usr/lib:/lib"; fi
>             *)
>             if test "$GXX" =3D yes; then
>               if test "$with_gnu_ld" =3D no; then
> @@ -9452,7 +9452,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>               fi
>             fi
>             link_all_deplibs_CXX=3Dyes
> -@@ -13492,20 +14225,20 @@ if test -z "$aix_libpath"; then
> aix_libpath=3D"/usr/lib:/lib"; fi
> +@@ -13494,20 +14227,20 @@ if test -z "$aix_libpath"; then
> aix_libpath=3D"/usr/lib:/lib"; fi
>               prelink_cmds_CXX=3D'tpldir=3DTemplate.dir~
>                 rm -rf $tpldir~
>                 $CC --prelink_objects --instantiation_dir $tpldir $objs
> $libobjs $compile_deplibs~
> @@ -9477,7 +9477,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>               ;;
>             *) # Version 6 and above use weak symbols
>               archive_cmds_CXX=3D'$CC -shared $pic_flag $predep_objects
> $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname
> ${wl}$soname -o $lib'
> -@@ -13700,7 +14433,7 @@ if test -z "$aix_libpath"; then
> aix_libpath=3D"/usr/lib:/lib"; fi
> +@@ -13702,7 +14435,7 @@ if test -z "$aix_libpath"; then
> aix_libpath=3D"/usr/lib:/lib"; fi
>                   archive_cmds_CXX=3D'$CC -shared -nostdlib
> ${allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_object=
s
> $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" &&
> func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry
> ${wl}${output_objdir}/so_locations -o $lib'
>                   ;;
>                 *)
> @@ -9486,7 +9486,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>                   ;;
>               esac
>
> -@@ -13746,7 +14479,7 @@ if test -z "$aix_libpath"; then
> aix_libpath=3D"/usr/lib:/lib"; fi
> +@@ -13748,7 +14481,7 @@ if test -z "$aix_libpath"; then
> aix_libpath=3D"/usr/lib:/lib"; fi
>
>         solaris*)
>           case $cc_basename in
> @@ -9495,7 +9495,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>             # Sun C++ 4.2, 5.x and Centerline C++
>               archive_cmds_need_lc_CXX=3Dyes
>             no_undefined_flag_CXX=3D' -zdefs'
> -@@ -13787,9 +14520,9 @@ if test -z "$aix_libpath"; then
> aix_libpath=3D"/usr/lib:/lib"; fi
> +@@ -13789,9 +14522,9 @@ if test -z "$aix_libpath"; then
> aix_libpath=3D"/usr/lib:/lib"; fi
>             if test "$GXX" =3D yes && test "$with_gnu_ld" =3D no; then
>               no_undefined_flag_CXX=3D' ${wl}-z ${wl}defs'
>               if $CC --version | $GREP -v '^2\.7' > /dev/null; then
> @@ -9507,7 +9507,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>
>                 # Commands to make compiler produce verbose output that
> lists
>                 # what "hidden" libraries, object files and flags are use=
d
> when
> -@@ -13924,6 +14657,13 @@ private:
> +@@ -13926,6 +14659,13 @@ private:
>   };
>   _LT_EOF
>
> @@ -9521,7 +9521,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>   if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; }
> >&5
>     (eval $ac_compile) 2>&5
>     ac_status=3D$?
> -@@ -13937,7 +14677,7 @@ if { { eval echo
> "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
> +@@ -13939,7 +14679,7 @@ if { { eval echo
> "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
>     pre_test_object_deps_done=3Dno
>
>     for p in `eval "$output_verbose_link_cmd"`; do
> @@ -9530,7 +9530,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>
>       -L* | -R* | -l*)
>          # Some compilers place space between "-{L,R}" and the path.
> -@@ -13946,13 +14686,22 @@ if { { eval echo
> "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
> +@@ -13948,13 +14688,22 @@ if { { eval echo
> "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
>             test $p =3D "-R"; then
>          prev=3D$p
>          continue
> @@ -9557,7 +9557,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>            # Internal compiler library paths should come after those
>            # provided the user.  The postdeps already come after the
>            # user supplied libs so there is no need to process them.
> -@@ -13972,8 +14721,10 @@ if { { eval echo
> "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
> +@@ -13974,8 +14723,10 @@ if { { eval echo
> "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
>            postdeps_CXX=3D"${postdeps_CXX} ${prev}${p}"
>          fi
>          fi
> @@ -9568,7 +9568,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>       *.$objext)
>          # This assumes that the test object file only shows up
>          # once in the compiler output.
> -@@ -14009,6 +14760,7 @@ else
> +@@ -14011,6 +14762,7 @@ else
>   fi
>
>   $RM -f confest.$objext
> @@ -9576,7 +9576,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>
>   # PORTME: override above test on systems where it is broken
>   case $host_os in
> -@@ -14044,7 +14796,7 @@ linux*)
> +@@ -14046,7 +14798,7 @@ linux*)
>
>   solaris*)
>     case $cc_basename in
> @@ -9585,7 +9585,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>       # The more standards-conforming stlport4 library is
>       # incompatible with the Cstd library. Avoid specifying
>       # it if it's in CXXFLAGS. Ignore libCrun as
> -@@ -14109,8 +14861,6 @@ fi
> +@@ -14111,8 +14863,6 @@ fi
>   lt_prog_compiler_pic_CXX=3D
>   lt_prog_compiler_static_CXX=3D
>
> @@ -9594,7 +9594,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>
>     # C++ specific cases for pic, static, wl, etc.
>     if test "$GXX" =3D yes; then
> -@@ -14215,6 +14965,11 @@ $as_echo_n "checking for $compiler option to
> produce PIC... " >&6; }
> +@@ -14217,6 +14967,11 @@ $as_echo_n "checking for $compiler option to
> produce PIC... " >&6; }
>           ;;
>         esac
>         ;;
> @@ -9606,7 +9606,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>         dgux*)
>         case $cc_basename in
>           ec++*)
> -@@ -14367,7 +15122,7 @@ $as_echo_n "checking for $compiler option to
> produce PIC... " >&6; }
> +@@ -14369,7 +15124,7 @@ $as_echo_n "checking for $compiler option to
> produce PIC... " >&6; }
>         ;;
>         solaris*)
>         case $cc_basename in
> @@ -9615,7 +9615,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>             # Sun C++ 4.2, 5.x and Centerline C++
>             lt_prog_compiler_pic_CXX=3D'-KPIC'
>             lt_prog_compiler_static_CXX=3D'-Bstatic'
> -@@ -14432,10 +15187,17 @@ case $host_os in
> +@@ -14434,10 +15189,17 @@ case $host_os in
>       lt_prog_compiler_pic_CXX=3D"$lt_prog_compiler_pic_CXX -DPIC"
>       ;;
>   esac
> @@ -9636,7 +9636,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>
>   #
>   # Check to make sure the PIC flag actually works.
> -@@ -14493,6 +15255,8 @@ fi
> +@@ -14495,6 +15257,8 @@ fi
>
>
>
> @@ -9645,7 +9645,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>   #
>   # Check to make sure the static flag actually works.
>   #
> -@@ -14670,6 +15434,7 @@ fi
> +@@ -14672,6 +15436,7 @@ fi
>   $as_echo_n "checking whether the $compiler linker ($LD) supports shared
> libraries... " >&6; }
>
>     export_symbols_cmds_CXX=3D'$NM $libobjs $convenience |
> $global_symbol_pipe | $SED '\''s/.* //'\'' | sort | uniq > $export_symbol=
s'
> @@ -9653,7 +9653,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>     case $host_os in
>     aix[4-9]*)
>       # If we're using GNU nm, then we don't want the "-C" option.
> -@@ -14684,15 +15449,20 @@ $as_echo_n "checking whether the $compiler
> linker ($LD) supports shared librarie
> +@@ -14686,15 +15451,20 @@ $as_echo_n "checking whether the $compiler
> linker ($LD) supports shared librarie
>       ;;
>     pw32*)
>       export_symbols_cmds_CXX=3D"$ltdll_cmds"
> @@ -9679,7 +9679,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>
>   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ld_shlibs_CXX" >&5
>   $as_echo "$ld_shlibs_CXX" >&6; }
> -@@ -14955,8 +15725,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -14957,8 +15727,9 @@ cygwin* | mingw* | pw32* | cegcc*)
>     need_version=3Dno
>     need_lib_prefix=3Dno
>
> @@ -9691,7 +9691,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>       library_names_spec=3D'$libname.dll.a'
>       # DLL is installed to $(libdir)/../bin by postinstall_cmds
>       postinstall_cmds=3D'base_file=3D`basename \${file}`~
> -@@ -14988,13 +15759,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -14990,13 +15761,71 @@ cygwin* | mingw* | pw32* | cegcc*)
>         library_names_spec=3D'`echo ${libname} | sed -e 's/^lib/pw/'``ech=
o
> ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
>         ;;
>       esac
> @@ -9764,7 +9764,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>     # FIXME: first we should search . and the directory the executable is
> in
>     shlibpath_var=3DPATH
>     ;;
> -@@ -15534,6 +16363,7 @@ fi
> +@@ -15536,6 +16365,7 @@ fi
>     fi # test -n "$compiler"
>
>     CC=3D$lt_save_CC
> @@ -9772,7 +9772,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>     LDCXX=3D$LD
>     LD=3D$lt_save_LD
>     GCC=3D$lt_save_GCC
> -@@ -17690,13 +18520,20 @@ exeext=3D'`$ECHO "$exeext" | $SED
> "$delay_single_quote_subst"`'
> +@@ -17751,13 +18581,20 @@ exeext=3D'`$ECHO "$exeext" | $SED
> "$delay_single_quote_subst"`'
>   lt_unset=3D'`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
>   lt_SP2NL=3D'`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
>   lt_NL2SP=3D'`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> @@ -9793,7 +9793,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>   STRIP=3D'`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
>   RANLIB=3D'`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
>   old_postinstall_cmds=3D'`$ECHO "$old_postinstall_cmds" | $SED
> "$delay_single_quote_subst"`'
> -@@ -17711,14 +18548,17 @@ lt_cv_sys_global_symbol_pipe=3D'`$ECHO
> "$lt_cv_sys_global_symbol_pipe" | $SED "$de
> +@@ -17772,14 +18609,17 @@ lt_cv_sys_global_symbol_pipe=3D'`$ECHO
> "$lt_cv_sys_global_symbol_pipe" | $SED "$de
>   lt_cv_sys_global_symbol_to_cdecl=3D'`$ECHO
> "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address=3D'`$ECHO
> "$lt_cv_sys_global_symbol_to_c_name_address" | $SED
> "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix=3D'`$ECHO
> "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED
> "$delay_single_quote_subst"`'
> @@ -9812,7 +9812,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>   DSYMUTIL=3D'`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
>   NMEDIT=3D'`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
>   LIPO=3D'`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> -@@ -17751,12 +18591,12 @@ hardcode_shlibpath_var=3D'`$ECHO
> "$hardcode_shlibpath_var" | $SED "$delay_single_q
> +@@ -17812,12 +18652,12 @@ hardcode_shlibpath_var=3D'`$ECHO
> "$hardcode_shlibpath_var" | $SED "$delay_single_q
>   hardcode_automatic=3D'`$ECHO "$hardcode_automatic" | $SED
> "$delay_single_quote_subst"`'
>   inherit_rpath=3D'`$ECHO "$inherit_rpath" | $SED
> "$delay_single_quote_subst"`'
>   link_all_deplibs=3D'`$ECHO "$link_all_deplibs" | $SED
> "$delay_single_quote_subst"`'
> @@ -9826,7 +9826,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>   file_list_spec=3D'`$ECHO "$file_list_spec" | $SED
> "$delay_single_quote_subst"`'
>   variables_saved_for_relink=3D'`$ECHO "$variables_saved_for_relink" | $S=
ED
> "$delay_single_quote_subst"`'
>   need_lib_prefix=3D'`$ECHO "$need_lib_prefix" | $SED
> "$delay_single_quote_subst"`'
> -@@ -17795,8 +18635,8 @@ old_archive_cmds_CXX=3D'`$ECHO
> "$old_archive_cmds_CXX" | $SED "$delay_single_quote
> +@@ -17856,8 +18696,8 @@ old_archive_cmds_CXX=3D'`$ECHO
> "$old_archive_cmds_CXX" | $SED "$delay_single_quote
>   compiler_CXX=3D'`$ECHO "$compiler_CXX" | $SED "$delay_single_quote_subs=
t"`'
>   GCC_CXX=3D'`$ECHO "$GCC_CXX" | $SED "$delay_single_quote_subst"`'
>   lt_prog_compiler_no_builtin_flag_CXX=3D'`$ECHO
> "$lt_prog_compiler_no_builtin_flag_CXX" | $SED "$delay_single_quote_subst=
"`'
> @@ -9836,7 +9836,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>   lt_prog_compiler_static_CXX=3D'`$ECHO "$lt_prog_compiler_static_CXX" |
> $SED "$delay_single_quote_subst"`'
>   lt_cv_prog_compiler_c_o_CXX=3D'`$ECHO "$lt_cv_prog_compiler_c_o_CXX" |
> $SED "$delay_single_quote_subst"`'
>   archive_cmds_need_lc_CXX=3D'`$ECHO "$archive_cmds_need_lc_CXX" | $SED
> "$delay_single_quote_subst"`'
> -@@ -17823,12 +18663,12 @@ hardcode_shlibpath_var_CXX=3D'`$ECHO
> "$hardcode_shlibpath_var_CXX" | $SED "$delay_
> +@@ -17884,12 +18724,12 @@ hardcode_shlibpath_var_CXX=3D'`$ECHO
> "$hardcode_shlibpath_var_CXX" | $SED "$delay_
>   hardcode_automatic_CXX=3D'`$ECHO "$hardcode_automatic_CXX" | $SED
> "$delay_single_quote_subst"`'
>   inherit_rpath_CXX=3D'`$ECHO "$inherit_rpath_CXX" | $SED
> "$delay_single_quote_subst"`'
>   link_all_deplibs_CXX=3D'`$ECHO "$link_all_deplibs_CXX" | $SED
> "$delay_single_quote_subst"`'
> @@ -9850,7 +9850,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>   file_list_spec_CXX=3D'`$ECHO "$file_list_spec_CXX" | $SED
> "$delay_single_quote_subst"`'
>   hardcode_action_CXX=3D'`$ECHO "$hardcode_action_CXX" | $SED
> "$delay_single_quote_subst"`'
>   compiler_lib_search_dirs_CXX=3D'`$ECHO "$compiler_lib_search_dirs_CXX" =
|
> $SED "$delay_single_quote_subst"`'
> -@@ -17866,8 +18706,13 @@ reload_flag \
> +@@ -17927,8 +18767,13 @@ reload_flag \
>   OBJDUMP \
>   deplibs_check_method \
>   file_magic_cmd \
> @@ -9864,7 +9864,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>   STRIP \
>   RANLIB \
>   CC \
> -@@ -17877,12 +18722,14 @@ lt_cv_sys_global_symbol_pipe \
> +@@ -17938,12 +18783,14 @@ lt_cv_sys_global_symbol_pipe \
>   lt_cv_sys_global_symbol_to_cdecl \
>   lt_cv_sys_global_symbol_to_c_name_address \
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> @@ -9880,7 +9880,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>   DSYMUTIL \
>   NMEDIT \
>   LIPO \
> -@@ -17898,7 +18745,6 @@ no_undefined_flag \
> +@@ -17959,7 +18806,6 @@ no_undefined_flag \
>   hardcode_libdir_flag_spec \
>   hardcode_libdir_flag_spec_ld \
>   hardcode_libdir_separator \
> @@ -9888,7 +9888,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>   exclude_expsyms \
>   include_expsyms \
>   file_list_spec \
> -@@ -17920,8 +18766,8 @@ LD_CXX \
> +@@ -17981,8 +18827,8 @@ LD_CXX \
>   reload_flag_CXX \
>   compiler_CXX \
>   lt_prog_compiler_no_builtin_flag_CXX \
> @@ -9898,7 +9898,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>   lt_prog_compiler_static_CXX \
>   lt_cv_prog_compiler_c_o_CXX \
>   export_dynamic_flag_spec_CXX \
> -@@ -17933,7 +18779,6 @@ no_undefined_flag_CXX \
> +@@ -17994,7 +18840,6 @@ no_undefined_flag_CXX \
>   hardcode_libdir_flag_spec_CXX \
>   hardcode_libdir_flag_spec_ld_CXX \
>   hardcode_libdir_separator_CXX \
> @@ -9906,7 +9906,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>   exclude_expsyms_CXX \
>   include_expsyms_CXX \
>   file_list_spec_CXX \
> -@@ -17967,6 +18812,7 @@ module_cmds \
> +@@ -18028,6 +18873,7 @@ module_cmds \
>   module_expsym_cmds \
>   export_symbols_cmds \
>   prelink_cmds \
> @@ -9914,7 +9914,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>   postinstall_cmds \
>   postuninstall_cmds \
>   finish_cmds \
> -@@ -17981,7 +18827,8 @@ archive_expsym_cmds_CXX \
> +@@ -18042,7 +18888,8 @@ archive_expsym_cmds_CXX \
>   module_cmds_CXX \
>   module_expsym_cmds_CXX \
>   export_symbols_cmds_CXX \
> @@ -9924,7 +9924,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>       case \`eval \\\\\$ECHO \\\\""\\\\\$\$var"\\\\"\` in
>       *[\\\\\\\`\\"\\\$]*)
>         eval "lt_\$var=3D\\\\\\"\\\`\\\$ECHO \\"\\\$\$var\\" | \\\$SED -e
> \\"\\\$double_quote_subst\\" -e \\"\\\$sed_quote_subst\\" -e
> \\"\\\$delay_variable_subst\\"\\\`\\\\\\""
> -@@ -18738,7 +19585,8 @@ $as_echo X"$file" |
> +@@ -18799,7 +19646,8 @@ $as_echo X"$file" |
>   # NOTE: Changes made to this file will be lost: look at ltmain.sh.
>   #
>   #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
> @@ -9934,7 +9934,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>   #   Written by Gordon Matzigkeit, 1996
>   #
>   #   This file is part of GNU Libtool.
> -@@ -18841,19 +19689,42 @@ SP2NL=3D$lt_lt_SP2NL
> +@@ -18902,19 +19750,42 @@ SP2NL=3D$lt_lt_SP2NL
>   # turn newlines into spaces.
>   NL2SP=3D$lt_lt_NL2SP
>
> @@ -9978,7 +9978,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>   # A symbol stripping program.
>   STRIP=3D$lt_STRIP
>
> -@@ -18883,6 +19754,12 @@
> global_symbol_to_c_name_address=3D$lt_lt_cv_sys_global_symbol_to_c_name_a=
ddress
> +@@ -18944,6 +19815,12 @@
> global_symbol_to_c_name_address=3D$lt_lt_cv_sys_global_symbol_to_c_name_a=
ddress
>   # Transform the output of nm in a C name address pair when lib prefix i=
s
> needed.
>
> global_symbol_to_c_name_address_lib_prefix=3D$lt_lt_cv_sys_global_symbol_=
to_c_name_address_lib_prefix
>
> @@ -9991,7 +9991,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>   # The name of the directory that contains temporary libtool files.
>   objdir=3D$objdir
>
> -@@ -18892,6 +19769,9 @@ MAGIC_CMD=3D$MAGIC_CMD
> +@@ -18953,6 +19830,9 @@ MAGIC_CMD=3D$MAGIC_CMD
>   # Must we lock files when doing compilation?
>   need_locks=3D$lt_need_locks
>
> @@ -10001,7 +10001,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>   # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
>   DSYMUTIL=3D$lt_DSYMUTIL
>
> -@@ -19006,12 +19886,12 @@ with_gcc=3D$GCC
> +@@ -19067,12 +19947,12 @@ with_gcc=3D$GCC
>   # Compiler flag to turn off builtin functions.
>   no_builtin_flag=3D$lt_lt_prog_compiler_no_builtin_flag
>
> @@ -10017,7 +10017,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>   # Compiler flag to prevent dynamic linking.
>   link_static_flag=3D$lt_lt_prog_compiler_static
>
> -@@ -19098,9 +19978,6 @@ inherit_rpath=3D$inherit_rpath
> +@@ -19159,9 +20039,6 @@ inherit_rpath=3D$inherit_rpath
>   # Whether libtool must link a program against all its dependency
> libraries.
>   link_all_deplibs=3D$link_all_deplibs
>
> @@ -10027,7 +10027,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>   # Set to "yes" if exported symbols are required.
>   always_export_symbols=3D$always_export_symbols
>
> -@@ -19116,6 +19993,9 @@ include_expsyms=3D$lt_include_expsyms
> +@@ -19177,6 +20054,9 @@ include_expsyms=3D$lt_include_expsyms
>   # Commands necessary for linking programs (against libraries) with
> templates.
>   prelink_cmds=3D$lt_prelink_cmds
>
> @@ -10037,7 +10037,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>   # Specify filename containing input files.
>   file_list_spec=3D$lt_file_list_spec
>
> -@@ -19162,210 +20042,169 @@ ltmain=3D"$ac_aux_dir/ltmain.sh"
> +@@ -19223,210 +20103,169 @@ ltmain=3D"$ac_aux_dir/ltmain.sh"
>     # if finds mixed CR/LF and LF-only lines.  Since sed operates in
>     # text mode, it properly converts lines to CR/LF.  This bash problem
>     # is reportedly fixed, but why not run on old versions too?
> @@ -10411,7 +10411,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>       (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
>     chmod +x "$ofile"
>
> -@@ -19393,12 +20232,12 @@ with_gcc=3D$GCC_CXX
> +@@ -19454,12 +20293,12 @@ with_gcc=3D$GCC_CXX
>   # Compiler flag to turn off builtin functions.
>   no_builtin_flag=3D$lt_lt_prog_compiler_no_builtin_flag_CXX
>
> @@ -10427,7 +10427,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>   # Compiler flag to prevent dynamic linking.
>   link_static_flag=3D$lt_lt_prog_compiler_static_CXX
>
> -@@ -19485,9 +20324,6 @@ inherit_rpath=3D$inherit_rpath_CXX
> +@@ -19546,9 +20385,6 @@ inherit_rpath=3D$inherit_rpath_CXX
>   # Whether libtool must link a program against all its dependency
> libraries.
>   link_all_deplibs=3D$link_all_deplibs_CXX
>
> @@ -10437,7 +10437,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
>   # Set to "yes" if exported symbols are required.
>   always_export_symbols=3D$always_export_symbols_CXX
>
> -@@ -19503,6 +20339,9 @@ include_expsyms=3D$lt_include_expsyms_CXX
> +@@ -19564,6 +20400,9 @@ include_expsyms=3D$lt_include_expsyms_CXX
>   # Commands necessary for linking programs (against libraries) with
> templates.
>   prelink_cmds=3D$lt_prelink_cmds_CXX
>
> @@ -10448,10 +10448,10 @@ index 2afc9a381a6..1e57b41ffa4 100755
>   file_list_spec=3D$lt_file_list_spec_CXX
>
>  diff --git a/gprofng/doc/Makefile.in b/gprofng/doc/Makefile.in
> -index a45018334e8..4c30941c6b6 100644
> +index 3cd2068cbf6..c5d431236aa 100644
>  --- a/gprofng/doc/Makefile.in
>  +++ b/gprofng/doc/Makefile.in
> -@@ -237,6 +237,7 @@ CXXFLAGS =3D @CXXFLAGS@
> +@@ -240,6 +240,7 @@ CXXFLAGS =3D @CXXFLAGS@
>   CYGPATH_W =3D @CYGPATH_W@
>   DEFS =3D @DEFS@
>   DEPDIR =3D @DEPDIR@
> @@ -10459,7 +10459,7 @@ index a45018334e8..4c30941c6b6 100644
>   DSYMUTIL =3D @DSYMUTIL@
>   DUMPBIN =3D @DUMPBIN@
>   ECHO_C =3D @ECHO_C@
> -@@ -272,6 +273,7 @@ LN_S =3D @LN_S@
> +@@ -275,6 +276,7 @@ LN_S =3D @LN_S@
>   LTLIBOBJS =3D @LTLIBOBJS@
>   MAINT =3D @MAINT@
>   MAKEINFO =3D @MAKEINFO@
> @@ -10508,7 +10508,7 @@ index eef61ba85f7..0eb1521b704 100644
>   NM =3D @NM@
>   NMEDIT =3D @NMEDIT@
>  diff --git a/gprofng/libcollector/configure
> b/gprofng/libcollector/configure
> -index e92fbfc2242..09e93f878ae 100755
> +index 079a0b71ec3..a28289cfe9d 100755
>  --- a/gprofng/libcollector/configure
>  +++ b/gprofng/libcollector/configure
>  @@ -641,6 +641,8 @@ OTOOL
> @@ -13108,7 +13108,7 @@ index e92fbfc2242..09e93f878ae 100755
>   file_list_spec=3D$lt_file_list_spec_CXX
>
>  diff --git a/gprofng/src/Makefile.in b/gprofng/src/Makefile.in
> -index 4274762334e..74ab09d7661 100644
> +index 605fa4f6fd4..313c4ceb4ca 100644
>  --- a/gprofng/src/Makefile.in
>  +++ b/gprofng/src/Makefile.in
>  @@ -324,6 +324,7 @@ CXXFLAGS =3D @CXXFLAGS@
> @@ -13128,7 +13128,7 @@ index 4274762334e..74ab09d7661 100644
>   NM =3D @NM@
>   NMEDIT =3D @NMEDIT@
>  diff --git a/ld/Makefile.in b/ld/Makefile.in
> -index 0405028e02f..bd18a0a9e55 100644
> +index 08dcd7b75fc..17c58dd2fd0 100644
>  --- a/ld/Makefile.in
>  +++ b/ld/Makefile.in
>  @@ -384,6 +384,7 @@ CYGPATH_W =3D @CYGPATH_W@
> @@ -13156,7 +13156,7 @@ index 0405028e02f..bd18a0a9e55 100644
>   ac_ct_CXX =3D @ac_ct_CXX@
>   ac_ct_DUMPBIN =3D @ac_ct_DUMPBIN@
>  diff --git a/ld/configure b/ld/configure
> -index 5f5dad6d67c..18150633570 100755
> +index 6406a42c442..21ab5b06709 100755
>  --- a/ld/configure
>  +++ b/ld/configure
>  @@ -700,8 +700,11 @@ OTOOL
> @@ -29906,7 +29906,7 @@ index c1eca5a42ed..7cab295b26d 100644
>   ac_ct_DUMPBIN =3D @ac_ct_DUMPBIN@
>   am__include =3D @am__include@
>  diff --git a/opcodes/configure b/opcodes/configure
> -index 483ae4f7a9c..907807594f9 100755
> +index d2364991ee8..f9a46eec7a3 100755
>  --- a/opcodes/configure
>  +++ b/opcodes/configure
>  @@ -682,6 +682,9 @@ OTOOL
> diff --git
> a/meta/recipes-devtools/binutils/binutils/0009-Fix-rpath-in-libtool-when-=
sysroot-is-enabled.patch
> b/meta/recipes-devtools/binutils/binutils/0009-Fix-rpath-in-libtool-when-=
sysroot-is-enabled.patch
> index ce795b7522..afd694db4d 100644
> ---
> a/meta/recipes-devtools/binutils/binutils/0009-Fix-rpath-in-libtool-when-=
sysroot-is-enabled.patch
> +++
> b/meta/recipes-devtools/binutils/binutils/0009-Fix-rpath-in-libtool-when-=
sysroot-is-enabled.patch
> @@ -1,4 +1,4 @@
> -From d6f4f62fda4fde10b805b06d5e61792ee821449c Mon Sep 17 00:00:00 2001
> +From ff2754e302d06df51f8dd8ef877afb65eb30fcab Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 2 Mar 2015 01:42:38 +0000
>  Subject: [PATCH] Fix rpath in libtool when sysroot is enabled
> diff --git
> a/meta/recipes-devtools/binutils/binutils/0010-sync-with-OE-libtool-chang=
es.patch
> b/meta/recipes-devtools/binutils/binutils/0010-sync-with-OE-libtool-chang=
es.patch
> index 910bd38694..cc0fb551b2 100644
> ---
> a/meta/recipes-devtools/binutils/binutils/0010-sync-with-OE-libtool-chang=
es.patch
> +++
> b/meta/recipes-devtools/binutils/binutils/0010-sync-with-OE-libtool-chang=
es.patch
> @@ -1,4 +1,4 @@
> -From 654b4ea9e28aad037e788672ca0d9ba450b3285e Mon Sep 17 00:00:00 2001
> +From 039b4afd7d3b5a599aebee97410809276a622ccd Mon Sep 17 00:00:00 2001
>  From: Ross Burton <ross.burton@intel.com>
>  Date: Mon, 6 Mar 2017 23:33:27 -0800
>  Subject: [PATCH] sync with OE libtool changes
> diff --git
> a/meta/recipes-devtools/binutils/binutils/0011-Check-for-clang-before-che=
cking-gcc-version.patch
> b/meta/recipes-devtools/binutils/binutils/0011-Check-for-clang-before-che=
cking-gcc-version.patch
> index a825f9c842..b921dd1218 100644
> ---
> a/meta/recipes-devtools/binutils/binutils/0011-Check-for-clang-before-che=
cking-gcc-version.patch
> +++
> b/meta/recipes-devtools/binutils/binutils/0011-Check-for-clang-before-che=
cking-gcc-version.patch
> @@ -1,4 +1,4 @@
> -From 9d35ab04de550f1db5d2e74d37fdeab4ca436148 Mon Sep 17 00:00:00 2001
> +From 4eb24605fb2012c0f02883d1f560d5d852c0705e Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 15 Apr 2020 14:17:20 -0700
>  Subject: [PATCH] Check for clang before checking gcc version
> @@ -18,7 +18,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/configure b/configure
> -index 417fc5a970c..bdc3583215f 100755
> +index 9cb953a197e..b63b5cd3de0 100755
>  --- a/configure
>  +++ b/configure
>  @@ -5460,7 +5460,7 @@ ac_compiler_gnu=3D$ac_cv_cxx_compiler_gnu
> @@ -31,7 +31,7 @@ index 417fc5a970c..bdc3583215f 100755
>   #endif
>   int main() {}
>  diff --git a/configure.ac b/configure.ac
> -index 3a1eb0357e5..1c00b9aec42 100644
> +index e95a9ed116e..2df870b86af 100644
>  --- a/configure.ac
>  +++ b/configure.ac
>  @@ -1444,7 +1444,7 @@ if test "$GCC" =3D yes; then
> diff --git
> a/meta/recipes-devtools/binutils/binutils/0012-Only-generate-an-RPATH-ent=
ry-if-LD_RUN_PATH-is-not-e.patch
> b/meta/recipes-devtools/binutils/binutils/0012-Only-generate-an-RPATH-ent=
ry-if-LD_RUN_PATH-is-not-e.patch
> index 1871fbc799..f69071ae96 100644
> ---
> a/meta/recipes-devtools/binutils/binutils/0012-Only-generate-an-RPATH-ent=
ry-if-LD_RUN_PATH-is-not-e.patch
> +++
> b/meta/recipes-devtools/binutils/binutils/0012-Only-generate-an-RPATH-ent=
ry-if-LD_RUN_PATH-is-not-e.patch
> @@ -1,4 +1,4 @@
> -From 9a296e537708296d32c07c1dc681f59de3d1acf9 Mon Sep 17 00:00:00 2001
> +From 9613e47bfdea18d2764eec130676e3e0b40c676f Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Thu, 10 Mar 2022 21:21:33 -0800
>  Subject: [PATCH] Only generate an RPATH entry if LD_RUN_PATH is not empt=
y
> diff --git
> a/meta/recipes-devtools/binutils/binutils/0013-Define-alignof-using-_Alig=
nof-when-using-C11-or-newe.patch
> b/meta/recipes-devtools/binutils/binutils/0013-Define-alignof-using-_Alig=
nof-when-using-C11-or-newe.patch
> index 91ac606f78..9cdc7e219d 100644
> ---
> a/meta/recipes-devtools/binutils/binutils/0013-Define-alignof-using-_Alig=
nof-when-using-C11-or-newe.patch
> +++
> b/meta/recipes-devtools/binutils/binutils/0013-Define-alignof-using-_Alig=
nof-when-using-C11-or-newe.patch
> @@ -1,4 +1,4 @@
> -From 5fb47367d885a4a32625f09138b306d36ec3769f Mon Sep 17 00:00:00 2001
> +From 8af01d85c4e5a5558d770291b7df86acfd59827c Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Sun, 15 Jan 2023 00:16:25 -0800
>  Subject: [PATCH] Define alignof using _Alignof when using C11 or newer
> diff --git
> a/meta/recipes-devtools/binutils/binutils/0014-configure-remove-dependenc=
ies-on-gmp-and-mpfr-when-g.patch
> b/meta/recipes-devtools/binutils/binutils/0014-configure-remove-dependenc=
ies-on-gmp-and-mpfr-when-g.patch
> deleted file mode 100644
> index 04c1310cbe..0000000000
> ---
> a/meta/recipes-devtools/binutils/binutils/0014-configure-remove-dependenc=
ies-on-gmp-and-mpfr-when-g.patch
> +++ /dev/null
> @@ -1,56 +0,0 @@
> -From 518c167116ab7aa6bb84a97200aeda2c4289e064 Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Cl=3DC3=3DA9ment=3D20Chigot?=3D <chigot@adacore.com>
> -Date: Tue, 3 Jan 2023 14:24:43 +0100
> -Subject: [PATCH] configure: remove dependencies on gmp and mpfr when gdb
> is
> - disabled
> -
> -Since 991180627851801f1999d1ebbc0e569a17e47c74, the configure checks
> -about GMP and MPFR for gdb builds have been moved to the toplevel
> -configure.
> -However, it doesn't take into account the --disable-gdb option. Meaning
> -that a build without gdb will require these libraries even if not
> -needed.
> -
> -ChangeLog:
> -
> -       * configure.ac: Skip GMP and MPFR when --disable-gdb is
> -       provided.
> -       * configure: Regenerate.
> -
> -Upstream-Status: Backport [
> https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommitdiff;h=3D5fb0e=
308577143ceb313fde5538dc9ecb038f29f
> ]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - configure    | 4 +++-
> - configure.ac | 4 +++-
> - 2 files changed, 6 insertions(+), 2 deletions(-)
> -
> -diff --git a/configure b/configure
> -index bdc3583215f..b63b5cd3de0 100755
> ---- a/configure
> -+++ b/configure
> -@@ -8032,7 +8032,9 @@ if test -d ${srcdir}/gcc ; then
> -   require_mpc=3Dyes
> - fi
> - if test -d ${srcdir}/gdb ; then
> --  require_gmp=3Dyes
> -+  if test "x$enable_gdb" !=3D xno; then
> -+   require_gmp=3Dyes
> -+  fi
> - fi
> -
> - gmplibs=3D"-lmpfr -lgmp"
> -diff --git a/configure.ac b/configure.ac
> -index 1c00b9aec42..2df870b86af 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -1585,7 +1585,9 @@ if test -d ${srcdir}/gcc ; then
> -   require_mpc=3Dyes
> - fi
> - if test -d ${srcdir}/gdb ; then
> --  require_gmp=3Dyes
> -+  if test "x$enable_gdb" !=3D xno; then
> -+   require_gmp=3Dyes
> -+  fi
> - fi
> -
> - gmplibs=3D"-lmpfr -lgmp"
> diff --git a/meta/recipes-devtools/binutils/binutils_2.40.bb
> b/meta/recipes-devtools/binutils/binutils_2.40.bb
> index 9087af87c5..4ce1b4bec2 100644
> --- a/meta/recipes-devtools/binutils/binutils_2.40.bb
> +++ b/meta/recipes-devtools/binutils/binutils_2.40.bb
> @@ -66,7 +66,7 @@ PACKAGE_BEFORE_PN +=3D "libbfd libopcodes gprofng"
>  FILES:libbfd =3D "${libdir}/libbfd-*.so.* ${libdir}/libbfd-*.so"
>  FILES:libopcodes =3D "${libdir}/libopcodes-*.so.* ${libdir}/libopcodes-*=
.so"
>  FILES:gprofng =3D "${sysconfdir}/gprofng.rc ${libdir}/gprofng/libgp-*.so
> ${libdir}/gprofng/libgprofng.so.* ${bindir}/gp-* ${bindir}/gprofng"
> -FILES:${PN}-dev +=3D "${libdir}/gprofng/libgprofng.so
> ${libdir}/libsframe.so"
> +FILES:${PN}-dev +=3D "${libdir}/libgprofng.so ${libdir}/libsframe.so"
>  SRC_URI:append:class-nativesdk =3D  "
> file://0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch "
>
>  USE_ALTERNATIVES_FOR:class-nativesdk =3D ""
> --
> 2.40.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180485):
> https://lists.openembedded.org/g/openembedded-core/message/180485
> Mute This Topic: https://lists.openembedded.org/mt/98532810/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000072b19005fa6a8345
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m seeing:<div><br></div><div>ERROR: binutils-2.40-r0=
 do_package: QA Issue: binutils: Files/directories were installed but not s=
hipped in any package:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/lib/gprofng/libg=
p-collectorAPI.a<br></div><div><br></div><div>with this update, not sure wh=
y it doesn&#39;t show up on AB, but will send a fix for this.</div><div><br=
></div><div>Regards,</div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Thu, Apr 27, 2023 at 10:21=E2=80=AFAM Khem Raj=
 &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Deepthi =
Hemraj &lt;<a href=3D"mailto:deepadeepthi98@gmail.com" target=3D"_blank">de=
epadeepthi98@gmail.com</a>&gt;<br>
<br>
- Rebase existing patches<br>
- Drop 0014-configure-remove-dependencies-on-gmp-and-mpfr-when-g.patch<br>
=C2=A0 which is already in<br>
- Correct packaging path to libgprofng.so<br>
- Correct packaging<br>
- Below commits on binutils-2.40 stable branch are updated.<br>
<br>
4671be001eb Updated Hungarian translation for the gprof directory<br>
ded035f913e lto: Don&#39;t add indirect symbols for versioned aliases in IR=
<br>
74cb2ddeabc gas: arm: Change warning message to not reference specific A-cl=
ass architecture revision<br>
570b9c09bbf gas: arm: Fix a further IT-predicated vcvt issue in the presens=
e of MVE vcvtn<br>
bddd62e188c libctf: get the offsets of fields of unnamed structs/unions rig=
ht<br>
7aa47eafcce libctf: fix assertion failure with no system qsort_r<br>
165accf0752 coff_get_normalized_symtab bfd_release<br>
af35798e957 PR30217, dynamic relocations using local dynamic symbols<br>
18bb604f1e1 PR30198, Assertion and segfault when linking x86_64 elf and cof=
f<br>
34a2b4a0e21 PR30155, ld segfault in _bfd_nearby_section<br>
3d0046f39aa PR30046, power cmpi leads to unknown architecture<br>
5c87fb1d59b ppc32 and &quot;LOAD segment with RWX permissions&quot;<br>
11f5c1ebf14 Updated Serbian translations for gold, gprof and opcodes sub-di=
rectories<br>
38e455b1d9a Updated translations for the bfd and gprof directories.<br>
b2bc62b7b4e gas: correct symbol name comparison in .startof./.sizeof. handl=
ing<br>
17294931e3e configure: remove dependencies on gmp and mpfr when gdb is disa=
bled<br>
1fc096a4c59 Regen config files<br>
e1815414077 Pass $JANSSON_LIBS and $ZSTD_LIBS to ld-bootstrap/bootrap.exp<b=
r>
3e888977f16 bpf: fix error conversion from long unsigned int to unsigned in=
t [-Werror=3Doverflow]<br>
65dbb942145 Updated Swedish translation for the binutils sub-directory<br>
27f59ec47a1 RISC-V: make C-extension JAL available again for (32-bit) assem=
bly<br>
edd36b26f35 gprofng: PR30043 libgprofng.so.* are installed to a wrong locat=
ion<br>
c6e269febbc gprofng: PR29521 [docs] man pages are not in the release tarbal=
l<br>
bcea253f5fa toplevel: Makefile.def: add install-strip dependency on libsfra=
me<br>
<br>
Signed-off-by: Deepthi Hemraj &lt;<a href=3D"mailto:Deepthi.Hemraj@windrive=
r.com" target=3D"_blank">Deepthi.Hemraj@windriver.com</a>&gt;<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
v2: Rebase existing patches to apply on top<br>
v3: Drop upstreamed patch<br>
v4: Fix packaging libgprofng.so<br>
<br>
=C2=A0.../binutils/binutils-2.40.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 -<br>
=C2=A0...s-crosssdk-Generate-relocatable-SDKs.patch |=C2=A0 =C2=A02 +-<br>
=C2=A0...o-not-generate-linker-script-directo.patch |=C2=A0 =C2=A02 +-<br>
=C2=A0...dk-Search-for-alternative-ld.so.conf.patch |=C2=A0 =C2=A08 +-<br>
=C2=A0...004-Point-scripts-location-to-libdir.patch |=C2=A0 =C2=A06 +-<br>
=C2=A0...stro-compiler-point-to-the-wrong-ins.patch |=C2=A0 =C2=A02 +-<br>
=C2=A0...-system-directories-when-cross-linki.patch |=C2=A0 =C2=A08 +-<br>
=C2=A0...ect-assembling-for-ppc-wait-mnemonic.patch |=C2=A0 =C2=A02 +-<br>
=C2=A0.../binutils/0008-Use-libtool-2.4.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2=
52 +++++++++---------<br>
=C2=A0...h-in-libtool-when-sysroot-is-enabled.patch |=C2=A0 =C2=A02 +-<br>
=C2=A0.../0010-sync-with-OE-libtool-changes.patch=C2=A0 =C2=A0|=C2=A0 =C2=
=A02 +-<br>
=C2=A0...or-clang-before-checking-gcc-version.patch |=C2=A0 =C2=A06 +-<br>
=C2=A0...-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch |=C2=A0 =C2=A02 +-<br>
=C2=A0...sing-_Alignof-when-using-C11-or-newe.patch |=C2=A0 =C2=A02 +-<br>
=C2=A0...-dependencies-on-gmp-and-mpfr-when-g.patch |=C2=A0 56 ----<br>
=C2=A0.../binutils/<a href=3D"http://binutils_2.40.bb" rel=3D"noreferrer" t=
arget=3D"_blank">binutils_2.40.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A016 files changed, 149 insertions(+), 206 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-devtools/binutils/binutils/0014-confi=
gure-remove-dependencies-on-gmp-and-mpfr-when-g.patch<br>
<br>
diff --git a/meta/recipes-devtools/binutils/binutils-2.40.inc b/meta/recipe=
s-devtools/binutils/binutils-2.40.inc<br>
index 924cc95669..e925a182ad 100644<br>
--- a/meta/recipes-devtools/binutils/binutils-2.40.inc<br>
+++ b/meta/recipes-devtools/binutils/binutils-2.40.inc<br>
@@ -32,7 +32,6 @@ SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 file://0011-Check-for-clang-before-checking-gcc-versio=
n.patch \<br>
=C2=A0 =C2=A0 =C2=A0 file://0012-Only-generate-an-RPATH-entry-if-LD_RUN_PAT=
H-is-not-e.patch \<br>
=C2=A0 =C2=A0 =C2=A0 file://0013-Define-alignof-using-_Alignof-when-using-C=
11-or-newe.patch \<br>
-=C2=A0 =C2=A0 =C2=A0file://0014-configure-remove-dependencies-on-gmp-and-m=
pfr-when-g.patch \<br>
=C2=A0 =C2=A0 =C2=A0 file://0015-Remove-duplicate-pe-dll.o-entry-deom-targ_=
extra_ofil.patch \<br>
=C2=A0 =C2=A0 =C2=A0 file://0016-CVE-2023-25586.patch \<br>
=C2=A0 =C2=A0 =C2=A0 file://fix-time64.patch \<br>
diff --git a/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk=
-Generate-relocatable-SDKs.patch b/meta/recipes-devtools/binutils/binutils/=
0001-binutils-crosssdk-Generate-relocatable-SDKs.patch<br>
index 7fffa81724..ca249834ea 100644<br>
--- a/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Genera=
te-relocatable-SDKs.patch<br>
+++ b/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Genera=
te-relocatable-SDKs.patch<br>
@@ -1,4 +1,4 @@<br>
-From 25e715730ddcca37021fa4876aed4fa91d5dea25 Mon Sep 17 00:00:00 2001<br>
+From 4bdab425bdd7dc52c95bfd62e035c1b9abe9595e Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0Date: Mon, 2 Mar 2015 01:58:54 +0000<br>
=C2=A0Subject: [PATCH] binutils-crosssdk: Generate relocatable SDKs<br>
diff --git a/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do=
-not-generate-linker-script-directo.patch b/meta/recipes-devtools/binutils/=
binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch<br=
>
index 87a19c9ec3..663dc4af7d 100644<br>
--- a/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-ge=
nerate-linker-script-directo.patch<br>
+++ b/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-ge=
nerate-linker-script-directo.patch<br>
@@ -1,4 +1,4 @@<br>
-From 080a8eafc5961f78222d84aaa816d0933441b7ab Mon Sep 17 00:00:00 2001<br>
+From c79005d4d9991593557766ad569f48c26482399f Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0Date: Mon, 6 Mar 2017 23:37:05 -0800<br>
=C2=A0Subject: [PATCH] binutils-cross: Do not generate linker script direct=
ories<br>
diff --git a/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesd=
k-Search-for-alternative-ld.so.conf.patch b/meta/recipes-devtools/binutils/=
binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch<br=
>
index 54967b9362..f46116f1af 100644<br>
--- a/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Searc=
h-for-alternative-ld.so.conf.patch<br>
+++ b/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Searc=
h-for-alternative-ld.so.conf.patch<br>
@@ -1,4 +1,4 @@<br>
-From 90d1bb804033a74b54f64cd5d3127c004c266af8 Mon Sep 17 00:00:00 2001<br>
+From 70da8b91026c5381d430194910fc15e3b6c5ec7f Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfounda=
tion.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<br>
=C2=A0Date: Wed, 19 Feb 2020 09:51:16 -0800<br>
=C2=A0Subject: [PATCH] binutils-nativesdk: Search for alternative ld.so.con=
f in SDK<br>
@@ -29,7 +29,7 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 5 files changed, 7 insertions(+), 3 deletions(-)<br>
<br>
=C2=A0diff --git a/ld/Makefile.am b/ld/Makefile.am<br>
-index 12b2c3c453f..0590b7055d0 100644<br>
+index b3195b4be68..fc6460317a7 100644<br>
=C2=A0--- a/ld/Makefile.am<br>
=C2=A0+++ b/ld/Makefile.am<br>
=C2=A0@@ -42,7 +42,8 @@ ZLIBINC =3D @zlibinc@<br>
@@ -43,7 +43,7 @@ index 12b2c3c453f..0590b7055d0 100644<br>
=C2=A0 NO_WERROR =3D @NO_WERROR@<br>
=C2=A0 AM_CFLAGS =3D $(WARN_CFLAGS) $(ELF_CLFAGS) $(JANSSON_CFLAGS) $(ZSTD_=
CFLAGS)<br>
=C2=A0diff --git a/ld/Makefile.in b/ld/Makefile.in<br>
-index 3d5685d6bae..70643b1ce46 100644<br>
+index fe422569228..4a4c851b44a 100644<br>
=C2=A0--- a/ld/Makefile.in<br>
=C2=A0+++ b/ld/Makefile.in<br>
=C2=A0@@ -566,7 +566,8 @@ ZLIB =3D @zlibdir@ -lz<br>
@@ -65,7 +65,7 @@ index eff6693e052..95787012b89 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 info.path =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 info.len =3D info.alloc =3D 0;<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 tmppath =3D concat (ld_sysroot, prefix, &quot;/=
etc/ld.so.conf&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 tmppath =3D concat (ld_sysconfdir, &quot;/ld.so.conf=
&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 tmppath =3D concat (ld_sysconfdir, &quot;/etc/ld.so.=
conf&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (const char *) NULL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!ldelf_parse_ld_so_conf (&amp;info, tmppath=
))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
diff --git a/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-loc=
ation-to-libdir.patch b/meta/recipes-devtools/binutils/binutils/0004-Point-=
scripts-location-to-libdir.patch<br>
index 90abd50498..e7d2593c49 100644<br>
--- a/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-t=
o-libdir.patch<br>
+++ b/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-t=
o-libdir.patch<br>
@@ -1,4 +1,4 @@<br>
-From a7c988d60f11c8279453c2d9edeede001cce7c9e Mon Sep 17 00:00:00 2001<br>
+From fa477bb947fa17543f4550bc0e7e715c8355649c Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0Date: Mon, 2 Mar 2015 01:09:58 +0000<br>
=C2=A0Subject: [PATCH] Point scripts location to libdir<br>
@@ -12,7 +12,7 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 2 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
=C2=A0diff --git a/ld/Makefile.am b/ld/Makefile.am<br>
-index 0590b7055d0..c30db94ee3c 100644<br>
+index fc6460317a7..1b875904b8d 100644<br>
=C2=A0--- a/ld/Makefile.am<br>
=C2=A0+++ b/ld/Makefile.am<br>
=C2=A0@@ -51,7 +51,7 @@ AM_CFLAGS =3D $(WARN_CFLAGS) $(ELF_CLFAGS) $(JANSSO=
N_CFLAGS) $(ZSTD_CFLAGS)<br>
@@ -25,7 +25,7 @@ index 0590b7055d0..c30db94ee3c 100644<br>
=C2=A0 EMUL =3D @EMUL@<br>
=C2=A0 EMULATION_OFILES =3D @EMULATION_OFILES@<br>
=C2=A0diff --git a/ld/Makefile.in b/ld/Makefile.in<br>
-index 70643b1ce46..0405028e02f 100644<br>
+index 4a4c851b44a..08dcd7b75fc 100644<br>
=C2=A0--- a/ld/Makefile.in<br>
=C2=A0+++ b/ld/Makefile.in<br>
=C2=A0@@ -574,7 +574,7 @@ AM_CFLAGS =3D $(WARN_CFLAGS) $(ELF_CLFAGS) $(JANS=
SON_CFLAGS) $(ZSTD_CFLAGS)<br>
diff --git a/meta/recipes-devtools/binutils/binutils/0005-don-t-let-the-dis=
tro-compiler-point-to-the-wrong-ins.patch b/meta/recipes-devtools/binutils/=
binutils/0005-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch<br=
>
index 9557e871db..7242f48795 100644<br>
--- a/meta/recipes-devtools/binutils/binutils/0005-don-t-let-the-distro-com=
piler-point-to-the-wrong-ins.patch<br>
+++ b/meta/recipes-devtools/binutils/binutils/0005-don-t-let-the-distro-com=
piler-point-to-the-wrong-ins.patch<br>
@@ -1,4 +1,4 @@<br>
-From fc39b9c332a346910695817274d55d0c20dc717a Mon Sep 17 00:00:00 2001<br>
+From 7912f5a918e612950feb04d845934f26160e85da Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0Date: Mon, 2 Mar 2015 01:39:01 +0000<br>
=C2=A0Subject: [PATCH] don&#39;t let the distro compiler point to the wrong=
 installation<br>
diff --git a/meta/recipes-devtools/binutils/binutils/0006-warn-for-uses-of-=
system-directories-when-cross-linki.patch b/meta/recipes-devtools/binutils/=
binutils/0006-warn-for-uses-of-system-directories-when-cross-linki.patch<br=
>
index 0ca55d4095..87bbe9fb1b 100644<br>
--- a/meta/recipes-devtools/binutils/binutils/0006-warn-for-uses-of-system-=
directories-when-cross-linki.patch<br>
+++ b/meta/recipes-devtools/binutils/binutils/0006-warn-for-uses-of-system-=
directories-when-cross-linki.patch<br>
@@ -1,4 +1,4 @@<br>
-From b9af05e87ac8eb4fa18a75939edb661056246c30 Mon Sep 17 00:00:00 2001<br>
+From 725ca09ee1041f64589f26ba815ef11da687c608 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0Date: Fri, 15 Jan 2016 06:31:09 +0000<br>
=C2=A0Subject: [PATCH] warn for uses of system directories when cross linki=
ng<br>
@@ -77,7 +77,7 @@ index ad0dc6a106c..d21edaddce7 100644<br>
=C2=A0 #undef EXTRA_SHLIB_EXTENSION<br>
<br>
=C2=A0diff --git a/ld/configure b/ld/configure<br>
-index 49936a0cb2a..5f5dad6d67c 100755<br>
+index 995708089fd..6406a42c442 100755<br>
=C2=A0--- a/ld/configure<br>
=C2=A0+++ b/ld/configure<br>
=C2=A0@@ -839,6 +839,7 @@ with_lib_path<br>
@@ -253,7 +253,7 @@ index ceaca2d85d0..62e7b4e5341 100644<br>
=C2=A0 =C2=A0 =C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (error_count &lt; MAX_ERRORS_IN_A_ROW)<br>
=C2=A0diff --git a/ld/lexsup.c b/ld/lexsup.c<br>
-index c5960385572..eb54627fb71 100644<br>
+index a1c6140100d..d47ba4f977d 100644<br>
=C2=A0--- a/ld/lexsup.c<br>
=C2=A0+++ b/ld/lexsup.c<br>
=C2=A0@@ -613,6 +613,14 @@ static const struct ld_option ld_options[] =3D<b=
r>
@@ -271,7 +271,7 @@ index c5960385572..eb54627fb71 100644<br>
=C2=A0 };<br>
<br>
=C2=A0 #define OPTION_COUNT ARRAY_SIZE (ld_options)<br>
-@@ -1735,6 +1743,14 @@ parse_args (unsigned argc, char **argv)<br>
+@@ -1737,6 +1745,14 @@ parse_args (unsigned argc, char **argv)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 config.print_map_discarded =3D true;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
<br>
diff --git a/meta/recipes-devtools/binutils/binutils/0007-fix-the-incorrect=
-assembling-for-ppc-wait-mnemonic.patch b/meta/recipes-devtools/binutils/bi=
nutils/0007-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch<br>
index 502ce82928..fdd1f7756f 100644<br>
--- a/meta/recipes-devtools/binutils/binutils/0007-fix-the-incorrect-assemb=
ling-for-ppc-wait-mnemonic.patch<br>
+++ b/meta/recipes-devtools/binutils/binutils/0007-fix-the-incorrect-assemb=
ling-for-ppc-wait-mnemonic.patch<br>
@@ -1,4 +1,4 @@<br>
-From ef9aa69324a209e546956a2f674462717ec5af0f Mon Sep 17 00:00:00 2001<br>
+From 4e9d4ace8a340399aeaa8332e2cfbfcc7d2d14d7 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Zhenhua Luo &lt;<a href=3D"mailto:zhenhua.luo@nxp.com" target=
=3D"_blank">zhenhua.luo@nxp.com</a>&gt;<br>
=C2=A0Date: Sat, 11 Jun 2016 22:08:29 -0500<br>
=C2=A0Subject: [PATCH] fix the incorrect assembling for ppc wait mnemonic<b=
r>
diff --git a/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.p=
atch b/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.patch<b=
r>
index 7e7c2579b3..0be871f5cf 100644<br>
--- a/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.patch<br=
>
+++ b/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.patch<br=
>
@@ -1,4 +1,4 @@<br>
-From 0ad92af822bb6f58de3f3889d0adc0b2ef9d477f Mon Sep 17 00:00:00 2001<br>
+From a66b1806350a9bed7b188c7d115991f6cdee51a9 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0Date: Sun, 14 Feb 2016 17:04:07 +0000<br>
=C2=A0Subject: [PATCH] Use libtool 2.4<br>
@@ -76,7 +76,7 @@ index 80aed657643..106ec256a79 100644<br>
=C2=A0 ac_ct_DUMPBIN =3D @ac_ct_DUMPBIN@<br>
=C2=A0 all_backends =3D @all_backends@<br>
=C2=A0diff --git a/bfd/configure b/bfd/configure<br>
-index e5d464378f8..ee8ea251479 100755<br>
+index 60ea6becab2..84dcdf167ba 100755<br>
=C2=A0--- a/bfd/configure<br>
=C2=A0+++ b/bfd/configure<br>
=C2=A0@@ -706,6 +706,9 @@ OTOOL<br>
@@ -2038,7 +2038,7 @@ index 27315addc0f..5ddd5a42a7d 100644<br>
=C2=A0 ac_ct_DUMPBIN =3D @ac_ct_DUMPBIN@<br>
=C2=A0 am__include =3D @am__include@<br>
=C2=A0diff --git a/binutils/configure b/binutils/configure<br>
-index 3cb797c2b8d..5578150c1d9 100755<br>
+index c7bd42049c3..06285371350 100755<br>
=C2=A0--- a/binutils/configure<br>
=C2=A0+++ b/binutils/configure<br>
=C2=A0@@ -700,8 +700,11 @@ OTOOL<br>
@@ -3977,7 +3977,7 @@ index 8319181b472..3425e414c1c 100644<br>
=C2=A0 ac_ct_DUMPBIN =3D @ac_ct_DUMPBIN@<br>
=C2=A0 am__include =3D @am__include@<br>
=C2=A0diff --git a/gas/configure b/gas/configure<br>
-index 684e68e0ea2..ba35172965e 100755<br>
+index 3c0c3e27d3b..11baafb9db6 100755<br>
=C2=A0--- a/gas/configure<br>
=C2=A0+++ b/gas/configure<br>
=C2=A0@@ -686,8 +686,11 @@ OTOOL<br>
@@ -5916,7 +5916,7 @@ index c9914e46d7d..1857eb8b5a8 100644<br>
=C2=A0 ac_ct_DUMPBIN =3D @ac_ct_DUMPBIN@<br>
=C2=A0 am__include =3D @am__include@<br>
=C2=A0diff --git a/gprof/configure b/gprof/configure<br>
-index 3e8edd112cb..5b320c60f50 100755<br>
+index c5a081c88aa..a1b06379df4 100755<br>
=C2=A0--- a/gprof/configure<br>
=C2=A0+++ b/gprof/configure<br>
=C2=A0@@ -663,8 +663,11 @@ OTOOL<br>
@@ -7830,7 +7830,7 @@ index 3e8edd112cb..5b320c60f50 100755<br>
=C2=A0 =C2=A0 chmod +x &quot;$ofile&quot;<br>
<br>
=C2=A0diff --git a/gprofng/Makefile.in b/gprofng/Makefile.in<br>
-index 01f7dca3f2a..3db326271c9 100644<br>
+index a2854950e34..4d307543d81 100644<br>
=C2=A0--- a/gprofng/Makefile.in<br>
=C2=A0+++ b/gprofng/Makefile.in<br>
=C2=A0@@ -253,6 +253,7 @@ CXXFLAGS =3D @CXXFLAGS@<br>
@@ -7850,10 +7850,10 @@ index 01f7dca3f2a..3db326271c9 100644<br>
=C2=A0 NM =3D @NM@<br>
=C2=A0 NMEDIT =3D @NMEDIT@<br>
=C2=A0diff --git a/gprofng/configure b/gprofng/configure<br>
-index 2afc9a381a6..1e57b41ffa4 100755<br>
+index 3ad87139280..e4593cbb838 100755<br>
=C2=A0--- a/gprofng/configure<br>
=C2=A0+++ b/gprofng/configure<br>
-@@ -672,6 +672,8 @@ OTOOL<br>
+@@ -674,6 +674,8 @@ OTOOL<br>
=C2=A0 LIPO<br>
=C2=A0 NMEDIT<br>
=C2=A0 DSYMUTIL<br>
@@ -7862,7 +7862,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 OBJDUMP<br>
=C2=A0 LN_S<br>
=C2=A0 NM<br>
-@@ -802,6 +804,7 @@ enable_static<br>
+@@ -804,6 +806,7 @@ enable_static<br>
=C2=A0 with_pic<br>
=C2=A0 enable_fast_install<br>
=C2=A0 with_gnu_ld<br>
@@ -7870,7 +7870,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 enable_libtool_lock<br>
=C2=A0 enable_werror_always<br>
=C2=A0 enable_gprofng_tools<br>
-@@ -1465,6 +1468,8 @@ Optional Packages:<br>
+@@ -1467,6 +1470,8 @@ Optional Packages:<br>
=C2=A0 =C2=A0 --with-pic=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tr=
y to use only PIC/non-PIC objects [default=3Duse<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 both]<br>
=C2=A0 =C2=A0 --with-gnu-ld=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assume =
the C compiler uses GNU ld [default=3Dno]<br>
@@ -7879,7 +7879,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 =C2=A0 --with-jdk=3DPATH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0specify pr=
efix directory for installed JDK.<br>
=C2=A0 =C2=A0 --with-system-zlib=C2=A0 =C2=A0 =C2=A0 use installed libz<br>
<br>
-@@ -6156,8 +6161,8 @@ esac<br>
+@@ -6158,8 +6163,8 @@ esac<br>
<br>
<br>
<br>
@@ -7890,7 +7890,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
<br>
<br>
<br>
-@@ -6197,7 +6202,7 @@ ECHO=3D$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO<br>
+@@ -6199,7 +6204,7 @@ ECHO=3D$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO<br>
=C2=A0 { $as_echo &quot;$as_me:${as_lineno-$LINENO}: checking how to print =
strings&quot; &gt;&amp;5<br>
=C2=A0 $as_echo_n &quot;checking how to print strings... &quot; &gt;&amp;6;=
 }<br>
=C2=A0 # Test print first, because it will be a builtin if present.<br>
@@ -7899,7 +7899,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 =C2=A0 =C2=A0test &quot;X`print -r -- $ECHO 2&gt;/dev/null`&quot; =
=3D &quot;X$ECHO&quot;; then<br>
=C2=A0 =C2=A0 ECHO=3D&#39;print -r --&#39;<br>
=C2=A0 elif test &quot;X`printf %s $ECHO 2&gt;/dev/null`&quot; =3D &quot;X$=
ECHO&quot;; then<br>
-@@ -6890,8 +6895,8 @@ $as_echo_n &quot;checking whether the shell understa=
nds some XSI constructs... &quot; &gt;&amp;6;<br>
+@@ -6892,8 +6897,8 @@ $as_echo_n &quot;checking whether the shell understa=
nds some XSI constructs... &quot; &gt;&amp;6;<br>
=C2=A0 # Try some XSI features<br>
=C2=A0 xsi_shell=3Dno<br>
=C2=A0 ( _lt_dummy=3D&quot;a/b/c&quot;<br>
@@ -7910,7 +7910,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 =C2=A0 =C2=A0 &amp;&amp; eval &#39;test $(( 1 + 1 )) -eq 2 \<br>
=C2=A0 =C2=A0 =C2=A0 &amp;&amp; test &quot;${#_lt_dummy}&quot; -eq 5&#39; )=
 &gt;/dev/null 2&gt;&amp;1 \<br>
=C2=A0 =C2=A0 &amp;&amp; xsi_shell=3Dyes<br>
-@@ -6940,6 +6945,80 @@ esac<br>
+@@ -6942,6 +6947,80 @@ esac<br>
<br>
<br>
<br>
@@ -7991,7 +7991,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 { $as_echo &quot;$as_me:${as_lineno-$LINENO}: checking for $LD optio=
n to reload object files&quot; &gt;&amp;5<br>
=C2=A0 $as_echo_n &quot;checking for $LD option to reload object files... &=
quot; &gt;&amp;6; }<br>
=C2=A0 if ${lt_cv_ld_reload_flag+:} false; then :<br>
-@@ -6956,6 +7035,11 @@ case $reload_flag in<br>
+@@ -6958,6 +7037,11 @@ case $reload_flag in<br>
=C2=A0 esac<br>
=C2=A0 reload_cmds=3D&#39;$LD$reload_flag -o $output$reload_objs&#39;<br>
=C2=A0 case $host_os in<br>
@@ -8003,7 +8003,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 =C2=A0 darwin*)<br>
=C2=A0 =C2=A0 =C2=A0 if test &quot;$GCC&quot; =3D yes; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 reload_cmds=3D&#39;$LTCC $LTCFLAGS -nostdlib ${=
wl}-r -o $output$reload_objs&#39;<br>
-@@ -7124,7 +7208,8 @@ mingw* | pw32*)<br>
+@@ -7126,7 +7210,8 @@ mingw* | pw32*)<br>
=C2=A0 =C2=A0 =C2=A0 lt_cv_deplibs_check_method=3D&#39;file_magic ^x86 arch=
ive import|^x86 DLL&#39;<br>
=C2=A0 =C2=A0 =C2=A0 lt_cv_file_magic_cmd=3D&#39;func_win32_libid&#39;<br>
=C2=A0 =C2=A0 else<br>
@@ -8013,7 +8013,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 =C2=A0 =C2=A0 lt_cv_file_magic_cmd=3D&#39;$OBJDUMP -f&#39;<br>
=C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 ;;<br>
-@@ -7278,6 +7363,21 @@ esac<br>
+@@ -7280,6 +7365,21 @@ esac<br>
=C2=A0 fi<br>
=C2=A0 { $as_echo &quot;$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs=
_check_method&quot; &gt;&amp;5<br>
=C2=A0 $as_echo &quot;$lt_cv_deplibs_check_method&quot; &gt;&amp;6; }<br>
@@ -8035,7 +8035,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 file_magic_cmd=3D$lt_cv_file_magic_cmd<br>
=C2=A0 deplibs_check_method=3D$lt_cv_deplibs_check_method<br>
=C2=A0 test -z &quot;$deplibs_check_method&quot; &amp;&amp; deplibs_check_m=
ethod=3Dunknown<br>
-@@ -7293,6 +7393,157 @@ test -z &quot;$deplibs_check_method&quot; &amp;&am=
p; deplibs_check_method=3Dunknown<br>
+@@ -7295,6 +7395,157 @@ test -z &quot;$deplibs_check_method&quot; &amp;&am=
p; deplibs_check_method=3Dunknown<br>
<br>
<br>
<br>
@@ -8193,7 +8193,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 plugin_option=3D<br>
=C2=A0 plugin_names=3D&quot;liblto_plugin.so liblto_plugin-0.dll cyglto_plu=
gin-0.dll&quot;<br>
=C2=A0 for plugin in $plugin_names; do<br>
-@@ -7307,8 +7558,10 @@ for plugin in $plugin_names; do<br>
+@@ -7309,8 +7560,10 @@ for plugin in $plugin_names; do<br>
=C2=A0 done<br>
<br>
=C2=A0 if test -n &quot;$ac_tool_prefix&quot;; then<br>
@@ -8206,7 +8206,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 { $as_echo &quot;$as_me:${as_lineno-$LINENO}: checking for $ac_word&=
quot; &gt;&amp;5<br>
=C2=A0 $as_echo_n &quot;checking for $ac_word... &quot; &gt;&amp;6; }<br>
=C2=A0 if ${ac_cv_prog_AR+:} false; then :<br>
-@@ -7324,7 +7577,7 @@ do<br>
+@@ -7326,7 +7579,7 @@ do<br>
=C2=A0 =C2=A0 test -z &quot;$as_dir&quot; &amp;&amp; as_dir=3D.<br>
=C2=A0 =C2=A0 =C2=A0 for ac_exec_ext in &#39;&#39; $ac_executable_extension=
s; do<br>
=C2=A0 =C2=A0 if as_fn_executable_p &quot;$as_dir/$ac_word$ac_exec_ext&quot=
;; then<br>
@@ -8215,7 +8215,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 =C2=A0 =C2=A0 $as_echo &quot;$as_me:${as_lineno-$LINENO}: found $as_=
dir/$ac_word$ac_exec_ext&quot; &gt;&amp;5<br>
=C2=A0 =C2=A0 =C2=A0 break 2<br>
=C2=A0 =C2=A0 fi<br>
-@@ -7344,11 +7597,15 @@ $as_echo &quot;no&quot; &gt;&amp;6; }<br>
+@@ -7346,11 +7599,15 @@ $as_echo &quot;no&quot; &gt;&amp;6; }<br>
=C2=A0 fi<br>
<br>
<br>
@@ -8234,7 +8234,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 { $as_echo &quot;$as_me:${as_lineno-$LINENO}: checking for $ac_word&=
quot; &gt;&amp;5<br>
=C2=A0 $as_echo_n &quot;checking for $ac_word... &quot; &gt;&amp;6; }<br>
=C2=A0 if ${ac_cv_prog_ac_ct_AR+:} false; then :<br>
-@@ -7364,7 +7621,7 @@ do<br>
+@@ -7366,7 +7623,7 @@ do<br>
=C2=A0 =C2=A0 test -z &quot;$as_dir&quot; &amp;&amp; as_dir=3D.<br>
=C2=A0 =C2=A0 =C2=A0 for ac_exec_ext in &#39;&#39; $ac_executable_extension=
s; do<br>
=C2=A0 =C2=A0 if as_fn_executable_p &quot;$as_dir/$ac_word$ac_exec_ext&quot=
;; then<br>
@@ -8243,7 +8243,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 =C2=A0 =C2=A0 $as_echo &quot;$as_me:${as_lineno-$LINENO}: found $as_=
dir/$ac_word$ac_exec_ext&quot; &gt;&amp;5<br>
=C2=A0 =C2=A0 =C2=A0 break 2<br>
=C2=A0 =C2=A0 fi<br>
-@@ -7383,6 +7640,10 @@ else<br>
+@@ -7385,6 +7642,10 @@ else<br>
=C2=A0 $as_echo &quot;no&quot; &gt;&amp;6; }<br>
=C2=A0 fi<br>
<br>
@@ -8254,7 +8254,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 =C2=A0 if test &quot;x$ac_ct_AR&quot; =3D x; then<br>
=C2=A0 =C2=A0 =C2=A0 AR=3D&quot;false&quot;<br>
=C2=A0 =C2=A0 else<br>
-@@ -7394,29 +7655,81 @@ ac_tool_warned=3Dyes ;;<br>
+@@ -7396,29 +7657,81 @@ ac_tool_warned=3Dyes ;;<br>
=C2=A0 esac<br>
=C2=A0 =C2=A0 =C2=A0 AR=3D$ac_ct_AR<br>
=C2=A0 =C2=A0 fi<br>
@@ -8351,7 +8351,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
<br>
<br>
<br>
-@@ -7763,8 +8076,8 @@ esac<br>
+@@ -7765,8 +8078,8 @@ esac<br>
=C2=A0 lt_cv_sys_global_symbol_to_cdecl=3D&quot;sed -n -e &#39;s/^T .* \(.*=
\)$/extern int \1();/p&#39; -e &#39;s/^$symcode* .* \(.*\)$/extern char \1;=
/p&#39;&quot;<br>
<br>
=C2=A0 # Transform an extracted symbol line into symbol name and symbol add=
ress<br>
@@ -8362,7 +8362,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
<br>
=C2=A0 # Handle CRLF in mingw tool chain<br>
=C2=A0 opt_cr=3D<br>
-@@ -7800,6 +8113,7 @@ for ac_symprfx in &quot;&quot; &quot;_&quot;; do<br>
+@@ -7802,6 +8115,7 @@ for ac_symprfx in &quot;&quot; &quot;_&quot;; do<br>
=C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 =C2=A0 lt_cv_sys_global_symbol_pipe=3D&quot;sed -n -e &#39;s/=
^.*[=C2=A0 =C2=A0 ]\($symcode$symcode*\)[=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
][=C2=A0 =C2=A0 =C2=A0 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p&#39;&quot;<b=
r>
=C2=A0 =C2=A0 fi<br>
@@ -8370,7 +8370,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
<br>
=C2=A0 =C2=A0 # Check to see that the pipe works correctly.<br>
=C2=A0 =C2=A0 pipe_works=3Dno<br>
-@@ -7841,6 +8155,18 @@ _LT_EOF<br>
+@@ -7843,6 +8157,18 @@ _LT_EOF<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if $GREP &#39; nm_test_var$&#39; &quot;$nlist&q=
uot; &gt;/dev/null; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if $GREP &#39; nm_test_func$&#39; &quot;$nlist&=
quot; &gt;/dev/null; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cat &lt;&lt;_LT_EOF &gt; conftest.$ac_ex=
t<br>
@@ -8389,7 +8389,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 #ifdef __cplusplus<br>
=C2=A0 extern &quot;C&quot; {<br>
=C2=A0 #endif<br>
-@@ -7852,7 +8178,7 @@ _LT_EOF<br>
+@@ -7854,7 +8180,7 @@ _LT_EOF<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cat &lt;&lt;_LT_EOF &gt;&gt; conftest.$a=
c_ext<br>
<br>
=C2=A0 /* The mapping between symbol names and symbols.=C2=A0 */<br>
@@ -8398,7 +8398,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 =C2=A0 const char *name;<br>
=C2=A0 =C2=A0 void=C2=A0 =C2=A0 =C2=A0 =C2=A0*address;<br>
=C2=A0 }<br>
-@@ -7878,8 +8204,8 @@ static const void *lt_preloaded_setup() {<br>
+@@ -7880,8 +8206,8 @@ static const void *lt_preloaded_setup() {<br>
=C2=A0 _LT_EOF<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Now try linking the two files.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mv conftest.$ac_objext conftstm.$ac_obje=
xt<br>
@@ -8409,7 +8409,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LIBS=3D&quot;conftstm.$ac_objext&quot;<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CFLAGS=3D&quot;$CFLAGS$lt_prog_compiler_=
no_builtin_flag&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if { { eval echo &quot;\&quot;\$as_me\&q=
uot;:${as_lineno-$LINENO}: \&quot;$ac_link\&quot;&quot;; } &gt;&amp;5<br>
-@@ -7889,8 +8215,8 @@ _LT_EOF<br>
+@@ -7891,8 +8217,8 @@ _LT_EOF<br>
=C2=A0 =C2=A0 test $ac_status =3D 0; } &amp;&amp; test -s conftest${ac_exee=
xt}; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pipe_works=3Dyes<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
@@ -8420,7 +8420,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;cannot find nm_test_func in $=
nlist&quot; &gt;&amp;5<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-@@ -7927,6 +8253,13 @@ else<br>
+@@ -7929,6 +8255,13 @@ else<br>
=C2=A0 $as_echo &quot;ok&quot; &gt;&amp;6; }<br>
=C2=A0 fi<br>
<br>
@@ -8434,7 +8434,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
<br>
<br>
<br>
-@@ -7946,6 +8279,48 @@ fi<br>
+@@ -7948,6 +8281,48 @@ fi<br>
<br>
<br>
<br>
@@ -8483,7 +8483,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
<br>
<br>
=C2=A0 # Check whether --enable-libtool-lock was given.<br>
-@@ -8154,6 +8529,123 @@ esac<br>
+@@ -8156,6 +8531,123 @@ esac<br>
<br>
=C2=A0 need_locks=3D&quot;$enable_libtool_lock&quot;<br>
<br>
@@ -8607,7 +8607,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
<br>
=C2=A0 =C2=A0 case $host_os in<br>
=C2=A0 =C2=A0 =C2=A0 rhapsody* | darwin*)<br>
-@@ -8717,6 +9209,8 @@ _LT_EOF<br>
+@@ -8719,6 +9211,8 @@ _LT_EOF<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2&g=
t;&amp;5<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;$AR cru libconftest.a conftest.o&quo=
t; &gt;&amp;5<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $AR cru libconftest.a conftest.o 2&gt;&amp;5<br=
>
@@ -8616,7 +8616,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cat &gt; conftest.c &lt;&lt; _LT_EOF<br>
=C2=A0 int main() { return 0;}<br>
=C2=A0 _LT_EOF<br>
-@@ -8785,6 +9279,16 @@ done<br>
+@@ -8787,6 +9281,16 @@ done<br>
<br>
<br>
<br>
@@ -8633,7 +8633,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
<br>
<br>
=C2=A0 # Set options<br>
-@@ -9270,8 +9774,6 @@ fi<br>
+@@ -9272,8 +9776,6 @@ fi<br>
=C2=A0 lt_prog_compiler_pic=3D<br>
=C2=A0 lt_prog_compiler_static=3D<br>
<br>
@@ -8642,7 +8642,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
<br>
=C2=A0 =C2=A0 if test &quot;$GCC&quot; =3D yes; then<br>
=C2=A0 =C2=A0 =C2=A0 lt_prog_compiler_wl=3D&#39;-Wl,&#39;<br>
-@@ -9437,6 +9939,12 @@ $as_echo_n &quot;checking for $compiler option to p=
roduce PIC... &quot; &gt;&amp;6; }<br>
+@@ -9439,6 +9941,12 @@ $as_echo_n &quot;checking for $compiler option to p=
roduce PIC... &quot; &gt;&amp;6; }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 lt_prog_compiler_pic=3D&#39;--shared&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 lt_prog_compiler_static=3D&#39;--static&#39;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
@@ -8655,7 +8655,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Portland Group compilers (*not* the Pe=
ntium gcc compiler,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # which looks to be a dead project)<br>
-@@ -9499,7 +10007,7 @@ $as_echo_n &quot;checking for $compiler option to p=
roduce PIC... &quot; &gt;&amp;6; }<br>
+@@ -9501,7 +10009,7 @@ $as_echo_n &quot;checking for $compiler option to p=
roduce PIC... &quot; &gt;&amp;6; }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 lt_prog_compiler_pic=3D&#39;-KPIC&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 lt_prog_compiler_static=3D&#39;-Bstatic&#39;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case $cc_basename in<br>
@@ -8664,7 +8664,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 lt_prog_compiler_wl=3D&#39;-Qoption ld &#39;;;<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 *)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 lt_prog_compiler_wl=3D&#39;-Wl,&#39;;;<br>
-@@ -9556,13 +10064,17 @@ case $host_os in<br>
+@@ -9558,13 +10066,17 @@ case $host_os in<br>
=C2=A0 =C2=A0 =C2=A0 lt_prog_compiler_pic=3D&quot;$lt_prog_compiler_pic -DP=
IC&quot;<br>
=C2=A0 =C2=A0 =C2=A0 ;;<br>
=C2=A0 esac<br>
@@ -8688,7 +8688,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
<br>
=C2=A0 #<br>
=C2=A0 # Check to make sure the PIC flag actually works.<br>
-@@ -9623,6 +10135,11 @@ fi<br>
+@@ -9625,6 +10137,11 @@ fi<br>
<br>
<br>
<br>
@@ -8700,7 +8700,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 #<br>
=C2=A0 # Check to make sure the static flag actually works.<br>
=C2=A0 #<br>
-@@ -9973,7 +10490,8 @@ _LT_EOF<br>
+@@ -9975,7 +10492,8 @@ _LT_EOF<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 allow_undefined_flag=3Dunsupported<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 always_export_symbols=3Dno<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 enable_shared_with_static_runtimes=3Dyes<br>
@@ -8710,7 +8710,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if $LD --help 2&gt;&amp;1 | $GREP &#39;auto-imp=
ort&#39; &gt; /dev/null; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 archive_cmds=3D&#39;$CC -shared $libobjs=
 $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-imag=
e-base -Xlinker --out-implib -Xlinker $lib&#39;<br>
-@@ -10072,12 +10590,12 @@ _LT_EOF<br>
+@@ -10074,12 +10592,12 @@ _LT_EOF<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 whole_archive_flag_spec=3D&#39;--whole-a=
rchive$convenience --no-whole-archive&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hardcode_libdir_flag_spec=3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hardcode_libdir_flag_spec_ld=3D&#39;-rpa=
th $libdir&#39;<br>
@@ -8725,7 +8725,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 esac<br>
-@@ -10091,8 +10609,8 @@ _LT_EOF<br>
+@@ -10093,8 +10611,8 @@ _LT_EOF<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 archive_cmds=3D&#39;$LD -Bshareable $libobjs $d=
eplibs $linker_flags -o $lib&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 wlarc=3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
@@ -8736,7 +8736,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
<br>
-@@ -10110,8 +10628,8 @@ _LT_EOF<br>
+@@ -10112,8 +10630,8 @@ _LT_EOF<br>
<br>
=C2=A0 _LT_EOF<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif $LD --help 2&gt;&amp;1 | $GREP &#39;: supp=
orted targets:.* elf&#39; &gt; /dev/null; then<br>
@@ -8747,7 +8747,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ld_shlibs=3Dno<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-@@ -10157,8 +10675,8 @@ _LT_EOF<br>
+@@ -10159,8 +10677,8 @@ _LT_EOF<br>
<br>
=C2=A0 =C2=A0 =C2=A0 *)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if $LD --help 2&gt;&amp;1 | $GREP &#39;: suppor=
ted targets:.* elf&#39; &gt; /dev/null; then<br>
@@ -8758,7 +8758,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ld_shlibs=3Dno<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-@@ -10288,7 +10806,13 @@ _LT_EOF<br>
+@@ -10290,7 +10808,13 @@ _LT_EOF<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 allow_undefined_flag=3D&#39;-berok&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Determine the default libpath from the=
 value encoded in an<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # empty executable.<br>
@@ -8773,7 +8773,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 /* end confdefs.h.=C2=A0 */<br>
<br>
=C2=A0 int<br>
-@@ -10301,22 +10825,29 @@ main ()<br>
+@@ -10303,22 +10827,29 @@ main ()<br>
=C2=A0 _ACEOF<br>
=C2=A0 if ac_fn_c_try_link &quot;$LINENO&quot;; then :<br>
<br>
@@ -8816,7 +8816,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hardcode_libdir_flag_spec=3D&#39;${wl}-b=
libpath:$libdir:&#39;&quot;$aix_libpath&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 archive_expsym_cmds=3D&#39;$CC -o $outpu=
t_objdir/$soname $libobjs $deplibs &#39;&quot;\${wl}$no_entry_flag&quot;&#3=
9; $compiler_flags `if test &quot;x${allow_undefined_flag}&quot; !=3D &quot=
;x&quot;; then func_echo_all &quot;${wl}${allow_undefined_flag}&quot;; else=
 :; fi` &#39;&quot;\${wl}$exp_sym_flag:\$export_symbols $shared_flag&quot;<=
br>
-@@ -10328,7 +10859,13 @@ if test -z &quot;$aix_libpath&quot;; then aix_lib=
path=3D&quot;/usr/lib:/lib&quot;; fi<br>
+@@ -10330,7 +10861,13 @@ if test -z &quot;$aix_libpath&quot;; then aix_lib=
path=3D&quot;/usr/lib:/lib&quot;; fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Determine the default libpath from the =
value encoded in an<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# empty executable.<br>
@@ -8831,7 +8831,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 /* end confdefs.h.=C2=A0 */<br>
<br>
=C2=A0 int<br>
-@@ -10341,22 +10878,29 @@ main ()<br>
+@@ -10343,22 +10880,29 @@ main ()<br>
=C2=A0 _ACEOF<br>
=C2=A0 if ac_fn_c_try_link &quot;$LINENO&quot;; then :<br>
<br>
@@ -8874,7 +8874,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hardcode_libdir_flag_spec=3D&#39;${wl}-bl=
ibpath:$libdir:&#39;&quot;$aix_libpath&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Warning - without using the other run =
time loading flags,<br>
-@@ -10401,20 +10945,63 @@ if test -z &quot;$aix_libpath&quot;; then aix_li=
bpath=3D&quot;/usr/lib:/lib&quot;; fi<br>
+@@ -10403,20 +10947,63 @@ if test -z &quot;$aix_libpath&quot;; then aix_li=
bpath=3D&quot;/usr/lib:/lib&quot;; fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Microsoft Visual C++.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # hardcode_libdir_flag_spec is actually meaning=
less, as there is<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # no search path for DLLs.<br>
@@ -8952,7 +8952,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 darwin* | rhapsody*)<br>
-@@ -10475,7 +11062,7 @@ if test -z &quot;$aix_libpath&quot;; then aix_libp=
ath=3D&quot;/usr/lib:/lib&quot;; fi<br>
+@@ -10477,7 +11064,7 @@ if test -z &quot;$aix_libpath&quot;; then aix_libp=
ath=3D&quot;/usr/lib:/lib&quot;; fi<br>
<br>
=C2=A0 =C2=A0 =C2=A0 # FreeBSD 3 and greater uses gcc -shared to do shared =
libraries.<br>
=C2=A0 =C2=A0 =C2=A0 freebsd* | dragonfly*)<br>
@@ -8961,7 +8961,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 hardcode_libdir_flag_spec=3D&#39;-R$libdir&#39;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 hardcode_direct=3Dyes<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 hardcode_shlibpath_var=3Dno<br>
-@@ -10483,7 +11070,7 @@ if test -z &quot;$aix_libpath&quot;; then aix_libp=
ath=3D&quot;/usr/lib:/lib&quot;; fi<br>
+@@ -10485,7 +11072,7 @@ if test -z &quot;$aix_libpath&quot;; then aix_libp=
ath=3D&quot;/usr/lib:/lib&quot;; fi<br>
<br>
=C2=A0 =C2=A0 =C2=A0 hpux9*)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$GCC&quot; =3D yes; then<br>
@@ -8970,7 +8970,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 archive_cmds=3D&#39;$RM $output_objdir/$soname~=
$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $link=
er_flags~test $output_objdir/$soname =3D $lib || mv $output_objdir/$soname =
$lib&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-@@ -10499,7 +11086,7 @@ if test -z &quot;$aix_libpath&quot;; then aix_libp=
ath=3D&quot;/usr/lib:/lib&quot;; fi<br>
+@@ -10501,7 +11088,7 @@ if test -z &quot;$aix_libpath&quot;; then aix_libp=
ath=3D&quot;/usr/lib:/lib&quot;; fi<br>
<br>
=C2=A0 =C2=A0 =C2=A0 hpux10*)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$GCC&quot; =3D yes &amp;&amp; tes=
t &quot;$with_gnu_ld&quot; =3D no; then<br>
@@ -8979,7 +8979,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 archive_cmds=3D&#39;$LD -b +h $soname +b $insta=
ll_libdir -o $lib $libobjs $deplibs $linker_flags&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-@@ -10523,10 +11110,10 @@ if test -z &quot;$aix_libpath&quot;; then aix_li=
bpath=3D&quot;/usr/lib:/lib&quot;; fi<br>
+@@ -10525,10 +11112,10 @@ if test -z &quot;$aix_libpath&quot;; then aix_li=
bpath=3D&quot;/usr/lib:/lib&quot;; fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 archive_cmds=3D&#39;$CC -shared ${wl}+h =
${wl}$soname -o $lib $libobjs $deplibs $compiler_flags&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ia64*)<br>
@@ -8992,7 +8992,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 esac<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
-@@ -10605,23 +11192,36 @@ fi<br>
+@@ -10607,23 +11194,36 @@ fi<br>
<br>
=C2=A0 =C2=A0 =C2=A0 irix5* | irix6* | nonstopux*)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$GCC&quot; =3D yes; then<br>
@@ -9037,7 +9037,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 archive_cmds=3D&#39;$CC -shared $libobjs $depli=
bs $compiler_flags -soname $soname `test -n &quot;$verstring&quot; &amp;&am=
p; func_echo_all &quot;-set_version $verstring&quot;` -update_registry ${ou=
tput_objdir}/so_locations -o $lib&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 archive_expsym_cmds=3D&#39;$CC -shared $libobjs=
 $deplibs $compiler_flags -soname $soname `test -n &quot;$verstring&quot; &=
amp;&amp; func_echo_all &quot;-set_version $verstring&quot;` -update_regist=
ry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib&#39;=
<br>
-@@ -10706,7 +11306,7 @@ rm -f core conftest.err conftest.$ac_objext \<br>
+@@ -10708,7 +11308,7 @@ rm -f core conftest.err conftest.$ac_objext \<br>
=C2=A0 =C2=A0 =C2=A0 osf4* | osf5*)=C2=A0 =C2=A0 # as osf3* with the additi=
on of -msym flag<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$GCC&quot; =3D yes; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 allow_undefined_flag=3D&#39; ${wl}-expect_unres=
olved ${wl}\*&#39;<br>
@@ -9046,7 +9046,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 hardcode_libdir_flag_spec=3D&#39;${wl}-rpath ${=
wl}$libdir&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 allow_undefined_flag=3D&#39; -expect_unresolved=
 \*&#39;<br>
-@@ -10725,9 +11325,9 @@ rm -f core conftest.err conftest.$ac_objext \<br>
+@@ -10727,9 +11327,9 @@ rm -f core conftest.err conftest.$ac_objext \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 no_undefined_flag=3D&#39; -z defs&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$GCC&quot; =3D yes; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 wlarc=3D&#39;${wl}&#39;<br>
@@ -9058,7 +9058,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case `$CC -V 2&gt;&amp;1` in<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 *&quot;Compilers 5.0&quot;*)<br>
-@@ -11303,8 +11903,9 @@ cygwin* | mingw* | pw32* | cegcc*)<br>
+@@ -11305,8 +11905,9 @@ cygwin* | mingw* | pw32* | cegcc*)<br>
=C2=A0 =C2=A0 need_version=3Dno<br>
=C2=A0 =C2=A0 need_lib_prefix=3Dno<br>
<br>
@@ -9070,7 +9070,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 =C2=A0 =C2=A0 library_names_spec=3D&#39;$libname.dll.a&#39;<br>
=C2=A0 =C2=A0 =C2=A0 # DLL is installed to $(libdir)/../bin by postinstall_=
cmds<br>
=C2=A0 =C2=A0 =C2=A0 postinstall_cmds=3D&#39;base_file=3D`basename \${file}=
`~<br>
-@@ -11337,13 +11938,71 @@ cygwin* | mingw* | pw32* | cegcc*)<br>
+@@ -11339,13 +11940,71 @@ cygwin* | mingw* | pw32* | cegcc*)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 library_names_spec=3D&#39;`echo ${libname} | se=
d -e &#39;s/^lib/pw/&#39;``echo ${release} | $SED -e &#39;s/[.]/-/g&#39;`${=
versuffix}${shared_ext}&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
=C2=A0 =C2=A0 =C2=A0 esac<br>
@@ -9143,16 +9143,16 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 =C2=A0 # FIXME: first we should search . and the directory the execu=
table is in<br>
=C2=A0 =C2=A0 shlibpath_var=3DPATH<br>
=C2=A0 =C2=A0 ;;<br>
-@@ -12221,7 +12880,7 @@ else<br>
+@@ -12223,7 +12882,7 @@ else<br>
=C2=A0 =C2=A0 lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2<br=
>
=C2=A0 =C2=A0 lt_status=3D$lt_dlunknown<br>
=C2=A0 =C2=A0 cat &gt; conftest.$ac_ext &lt;&lt;_LT_EOF<br>
--#line 12224 &quot;configure&quot;<br>
+-#line 12226 &quot;configure&quot;<br>
=C2=A0+#line $LINENO &quot;configure&quot;<br>
=C2=A0 #include &quot;confdefs.h&quot;<br>
<br>
=C2=A0 #if HAVE_DLFCN_H<br>
-@@ -12265,10 +12924,10 @@ else<br>
+@@ -12267,10 +12926,10 @@ else<br>
=C2=A0 /* When -fvisbility=3Dhidden is used, assume the code has been annot=
ated<br>
=C2=A0 =C2=A0 =C2=A0correspondingly for the symbols needed.=C2=A0 */<br>
=C2=A0 #if defined(__GNUC__) &amp;&amp; (((__GNUC__ =3D=3D 3) &amp;&amp; (_=
_GNUC_MINOR__ &gt;=3D 3)) || (__GNUC__ &gt; 3))<br>
@@ -9165,16 +9165,16 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 int main ()<br>
=C2=A0 {<br>
=C2=A0 =C2=A0 void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);<br>
-@@ -12327,7 +12986,7 @@ else<br>
+@@ -12329,7 +12988,7 @@ else<br>
=C2=A0 =C2=A0 lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2<br=
>
=C2=A0 =C2=A0 lt_status=3D$lt_dlunknown<br>
=C2=A0 =C2=A0 cat &gt; conftest.$ac_ext &lt;&lt;_LT_EOF<br>
--#line 12330 &quot;configure&quot;<br>
+-#line 12332 &quot;configure&quot;<br>
=C2=A0+#line $LINENO &quot;configure&quot;<br>
=C2=A0 #include &quot;confdefs.h&quot;<br>
<br>
=C2=A0 #if HAVE_DLFCN_H<br>
-@@ -12371,10 +13030,10 @@ else<br>
+@@ -12373,10 +13032,10 @@ else<br>
=C2=A0 /* When -fvisbility=3Dhidden is used, assume the code has been annot=
ated<br>
=C2=A0 =C2=A0 =C2=A0correspondingly for the symbols needed.=C2=A0 */<br>
=C2=A0 #if defined(__GNUC__) &amp;&amp; (((__GNUC__ =3D=3D 3) &amp;&amp; (_=
_GNUC_MINOR__ &gt;=3D 3)) || (__GNUC__ &gt; 3))<br>
@@ -9187,7 +9187,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 int main ()<br>
=C2=A0 {<br>
=C2=A0 =C2=A0 void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);<br>
-@@ -12766,6 +13425,7 @@ $RM -r conftest*<br>
+@@ -12768,6 +13427,7 @@ $RM -r conftest*<br>
<br>
=C2=A0 =C2=A0 # Allow CC to be a program name with arguments.<br>
=C2=A0 =C2=A0 lt_save_CC=3D$CC<br>
@@ -9195,7 +9195,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 =C2=A0 lt_save_LD=3D$LD<br>
=C2=A0 =C2=A0 lt_save_GCC=3D$GCC<br>
=C2=A0 =C2=A0 GCC=3D$GXX<br>
-@@ -12783,6 +13443,7 @@ $RM -r conftest*<br>
+@@ -12785,6 +13445,7 @@ $RM -r conftest*<br>
=C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 test -z &quot;${LDCXX+set}&quot; || LD=3D$LDCXX<br>
=C2=A0 =C2=A0 CC=3D${CXX-&quot;c++&quot;}<br>
@@ -9203,7 +9203,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 =C2=A0 compiler=3D$CC<br>
=C2=A0 =C2=A0 compiler_CXX=3D$CC<br>
=C2=A0 =C2=A0 for cc_temp in $compiler&quot;&quot;; do<br>
-@@ -13065,7 +13726,13 @@ $as_echo_n &quot;checking whether the $compiler l=
inker ($LD) supports shared librarie<br>
+@@ -13067,7 +13728,13 @@ $as_echo_n &quot;checking whether the $compiler l=
inker ($LD) supports shared librarie<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 allow_undefined_flag_CXX=3D&#39;-=
berok&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Determine the default libpath f=
rom the value encoded in an empty<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # executable.<br>
@@ -9218,7 +9218,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 /* end confdefs.h.=C2=A0 */<br>
<br>
=C2=A0 int<br>
-@@ -13078,22 +13745,29 @@ main ()<br>
+@@ -13080,22 +13747,29 @@ main ()<br>
=C2=A0 _ACEOF<br>
=C2=A0 if ac_fn_cxx_try_link &quot;$LINENO&quot;; then :<br>
<br>
@@ -9261,7 +9261,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hardcode_libdir_flag_spec_CXX=3D&=
#39;${wl}-blibpath:$libdir:&#39;&quot;$aix_libpath&quot;<br>
<br>
-@@ -13106,7 +13780,13 @@ if test -z &quot;$aix_libpath&quot;; then aix_lib=
path=3D&quot;/usr/lib:/lib&quot;; fi<br>
+@@ -13108,7 +13782,13 @@ if test -z &quot;$aix_libpath&quot;; then aix_lib=
path=3D&quot;/usr/lib:/lib&quot;; fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Determine the default libpath f=
rom the value encoded in an<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # empty executable.<br>
@@ -9276,7 +9276,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 /* end confdefs.h.=C2=A0 */<br>
<br>
=C2=A0 int<br>
-@@ -13119,22 +13799,29 @@ main ()<br>
+@@ -13121,22 +13801,29 @@ main ()<br>
=C2=A0 _ACEOF<br>
=C2=A0 if ac_fn_cxx_try_link &quot;$LINENO&quot;; then :<br>
<br>
@@ -9319,7 +9319,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hardcode_libdir_flag_spec_CXX=3D&=
#39;${wl}-blibpath:$libdir:&#39;&quot;$aix_libpath&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Warning - without using the oth=
er run time loading flags,<br>
-@@ -13177,29 +13864,75 @@ if test -z &quot;$aix_libpath&quot;; then aix_li=
bpath=3D&quot;/usr/lib:/lib&quot;; fi<br>
+@@ -13179,29 +13866,75 @@ if test -z &quot;$aix_libpath&quot;; then aix_li=
bpath=3D&quot;/usr/lib:/lib&quot;; fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cygwin* | mingw* | pw32* | cegcc*)<br>
@@ -9418,7 +9418,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 darwin* | rhapsody*)<br>
<br>
<br>
-@@ -13305,7 +14038,7 @@ if test -z &quot;$aix_libpath&quot;; then aix_libp=
ath=3D&quot;/usr/lib:/lib&quot;; fi<br>
+@@ -13307,7 +14040,7 @@ if test -z &quot;$aix_libpath&quot;; then aix_libp=
ath=3D&quot;/usr/lib:/lib&quot;; fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$GXX&quot; =
=3D yes; then<br>
@@ -9427,7 +9427,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # FIXME: insert pro=
per C++ library support<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ld_shlibs_CXX=3Dno<=
br>
-@@ -13376,10 +14109,10 @@ if test -z &quot;$aix_libpath&quot;; then aix_li=
bpath=3D&quot;/usr/lib:/lib&quot;; fi<br>
+@@ -13378,10 +14111,10 @@ if test -z &quot;$aix_libpath&quot;; then aix_li=
bpath=3D&quot;/usr/lib:/lib&quot;; fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 archi=
ve_cmds_CXX=3D&#39;$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname -o $lib=
 $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags&#39;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ia64*)<br>
@@ -9440,7 +9440,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 esac<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-@@ -13420,9 +14153,9 @@ if test -z &quot;$aix_libpath&quot;; then aix_libp=
ath=3D&quot;/usr/lib:/lib&quot;; fi<br>
+@@ -13422,9 +14155,9 @@ if test -z &quot;$aix_libpath&quot;; then aix_libp=
ath=3D&quot;/usr/lib:/lib&quot;; fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$GXX&quot; =3D yes;=
 then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$with_gnu_ld=
&quot; =3D no; then<br>
@@ -9452,7 +9452,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 link_all_deplibs_CXX=3Dyes<br>
-@@ -13492,20 +14225,20 @@ if test -z &quot;$aix_libpath&quot;; then aix_li=
bpath=3D&quot;/usr/lib:/lib&quot;; fi<br>
+@@ -13494,20 +14227,20 @@ if test -z &quot;$aix_libpath&quot;; then aix_li=
bpath=3D&quot;/usr/lib:/lib&quot;; fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prelink_cmds_CXX=3D&#39;tp=
ldir=3DTemplate.dir~<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf $tpldir~<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $CC --prelink_objec=
ts --instantiation_dir $tpldir $objs $libobjs $compile_deplibs~<br>
@@ -9477,7 +9477,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *) # Version 6 and above use weak=
 symbols<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 archive_cmds_CXX=3D&#39;$C=
C -shared $pic_flag $predep_objects $libobjs $deplibs $postdep_objects $com=
piler_flags ${wl}-soname ${wl}$soname -o $lib&#39;<br>
-@@ -13700,7 +14433,7 @@ if test -z &quot;$aix_libpath&quot;; then aix_libp=
ath=3D&quot;/usr/lib:/lib&quot;; fi<br>
+@@ -13702,7 +14435,7 @@ if test -z &quot;$aix_libpath&quot;; then aix_libp=
ath=3D&quot;/usr/lib:/lib&quot;; fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 archive_cmds=
_CXX=3D&#39;$CC -shared -nostdlib ${allow_undefined_flag} $predep_objects $=
libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname=
 `test -n &quot;$verstring&quot; &amp;&amp; func_echo_all &quot;${wl}-set_v=
ersion ${wl}$verstring&quot;` ${wl}-update_registry ${wl}${output_objdir}/s=
o_locations -o $lib&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *)<br>
@@ -9486,7 +9486,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 esac<br>
<br>
-@@ -13746,7 +14479,7 @@ if test -z &quot;$aix_libpath&quot;; then aix_libp=
ath=3D&quot;/usr/lib:/lib&quot;; fi<br>
+@@ -13748,7 +14481,7 @@ if test -z &quot;$aix_libpath&quot;; then aix_libp=
ath=3D&quot;/usr/lib:/lib&quot;; fi<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 solaris*)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case $cc_basename in<br>
@@ -9495,7 +9495,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Sun C++ 4.2, 5.x and Centerline=
 C++<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 archive_cmds_need_lc_CXX=
=3Dyes<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 no_undefined_flag_CXX=3D&#39; -zd=
efs&#39;<br>
-@@ -13787,9 +14520,9 @@ if test -z &quot;$aix_libpath&quot;; then aix_libp=
ath=3D&quot;/usr/lib:/lib&quot;; fi<br>
+@@ -13789,9 +14522,9 @@ if test -z &quot;$aix_libpath&quot;; then aix_libp=
ath=3D&quot;/usr/lib:/lib&quot;; fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$GXX&quot; =3D yes =
&amp;&amp; test &quot;$with_gnu_ld&quot; =3D no; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 no_undefined_flag_CXX=3D&#=
39; ${wl}-z ${wl}defs&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if $CC --version | $GREP -=
v &#39;^2\.7&#39; &gt; /dev/null; then<br>
@@ -9507,7 +9507,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Commands to make =
compiler produce verbose output that lists<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # what &quot;hidden=
&quot; libraries, object files and flags are used when<br>
-@@ -13924,6 +14657,13 @@ private:<br>
+@@ -13926,6 +14659,13 @@ private:<br>
=C2=A0 };<br>
=C2=A0 _LT_EOF<br>
<br>
@@ -9521,7 +9521,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 if { { eval echo &quot;\&quot;\$as_me\&quot;:${as_lineno-$LINENO}: \=
&quot;$ac_compile\&quot;&quot;; } &gt;&amp;5<br>
=C2=A0 =C2=A0 (eval $ac_compile) 2&gt;&amp;5<br>
=C2=A0 =C2=A0 ac_status=3D$?<br>
-@@ -13937,7 +14677,7 @@ if { { eval echo &quot;\&quot;\$as_me\&quot;:${as_=
lineno-$LINENO}: \&quot;$ac_compile\&quot;&quot;; } &gt;&amp;5<br>
+@@ -13939,7 +14679,7 @@ if { { eval echo &quot;\&quot;\$as_me\&quot;:${as_=
lineno-$LINENO}: \&quot;$ac_compile\&quot;&quot;; } &gt;&amp;5<br>
=C2=A0 =C2=A0 pre_test_object_deps_done=3Dno<br>
<br>
=C2=A0 =C2=A0 for p in `eval &quot;$output_verbose_link_cmd&quot;`; do<br>
@@ -9530,7 +9530,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
<br>
=C2=A0 =C2=A0 =C2=A0 -L* | -R* | -l*)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Some compilers place space between &quo=
t;-{L,R}&quot; and the path.<br>
-@@ -13946,13 +14686,22 @@ if { { eval echo &quot;\&quot;\$as_me\&quot;:${a=
s_lineno-$LINENO}: \&quot;$ac_compile\&quot;&quot;; } &gt;&amp;5<br>
+@@ -13948,13 +14688,22 @@ if { { eval echo &quot;\&quot;\$as_me\&quot;:${a=
s_lineno-$LINENO}: \&quot;$ac_compile\&quot;&quot;; } &gt;&amp;5<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test $p =3D &quot;-R&quot;; then<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prev=3D$p<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue<br>
@@ -9557,7 +9557,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Internal compiler library paths =
should come after those<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# provided the user.=C2=A0 The pos=
tdeps already come after the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# user supplied libs so there is n=
o need to process them.<br>
-@@ -13972,8 +14721,10 @@ if { { eval echo &quot;\&quot;\$as_me\&quot;:${as=
_lineno-$LINENO}: \&quot;$ac_compile\&quot;&quot;; } &gt;&amp;5<br>
+@@ -13974,8 +14723,10 @@ if { { eval echo &quot;\&quot;\$as_me\&quot;:${as=
_lineno-$LINENO}: \&quot;$ac_compile\&quot;&quot;; } &gt;&amp;5<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0postdeps_CXX=3D&quot;${postdeps_CX=
X} ${prev}${p}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
@@ -9568,7 +9568,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 =C2=A0 =C2=A0 *.$objext)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# This assumes that the test object file =
only shows up<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# once in the compiler output.<br>
-@@ -14009,6 +14760,7 @@ else<br>
+@@ -14011,6 +14762,7 @@ else<br>
=C2=A0 fi<br>
<br>
=C2=A0 $RM -f confest.$objext<br>
@@ -9576,7 +9576,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
<br>
=C2=A0 # PORTME: override above test on systems where it is broken<br>
=C2=A0 case $host_os in<br>
-@@ -14044,7 +14796,7 @@ linux*)<br>
+@@ -14046,7 +14798,7 @@ linux*)<br>
<br>
=C2=A0 solaris*)<br>
=C2=A0 =C2=A0 case $cc_basename in<br>
@@ -9585,7 +9585,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 =C2=A0 =C2=A0 # The more standards-conforming stlport4 library is<br=
>
=C2=A0 =C2=A0 =C2=A0 # incompatible with the Cstd library. Avoid specifying=
<br>
=C2=A0 =C2=A0 =C2=A0 # it if it&#39;s in CXXFLAGS. Ignore libCrun as<br>
-@@ -14109,8 +14861,6 @@ fi<br>
+@@ -14111,8 +14863,6 @@ fi<br>
=C2=A0 lt_prog_compiler_pic_CXX=3D<br>
=C2=A0 lt_prog_compiler_static_CXX=3D<br>
<br>
@@ -9594,7 +9594,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
<br>
=C2=A0 =C2=A0 # C++ specific cases for pic, static, wl, etc.<br>
=C2=A0 =C2=A0 if test &quot;$GXX&quot; =3D yes; then<br>
-@@ -14215,6 +14965,11 @@ $as_echo_n &quot;checking for $compiler option to=
 produce PIC... &quot; &gt;&amp;6; }<br>
+@@ -14217,6 +14967,11 @@ $as_echo_n &quot;checking for $compiler option to=
 produce PIC... &quot; &gt;&amp;6; }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 esac<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
@@ -9606,7 +9606,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dgux*)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case $cc_basename in<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ec++*)<br>
-@@ -14367,7 +15122,7 @@ $as_echo_n &quot;checking for $compiler option to =
produce PIC... &quot; &gt;&amp;6; }<br>
+@@ -14369,7 +15124,7 @@ $as_echo_n &quot;checking for $compiler option to =
produce PIC... &quot; &gt;&amp;6; }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 solaris*)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case $cc_basename in<br>
@@ -9615,7 +9615,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Sun C++ 4.2, 5.x and Centerline=
 C++<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lt_prog_compiler_pic_CXX=3D&#39;-=
KPIC&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lt_prog_compiler_static_CXX=3D&#3=
9;-Bstatic&#39;<br>
-@@ -14432,10 +15187,17 @@ case $host_os in<br>
+@@ -14434,10 +15189,17 @@ case $host_os in<br>
=C2=A0 =C2=A0 =C2=A0 lt_prog_compiler_pic_CXX=3D&quot;$lt_prog_compiler_pic=
_CXX -DPIC&quot;<br>
=C2=A0 =C2=A0 =C2=A0 ;;<br>
=C2=A0 esac<br>
@@ -9636,7 +9636,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
<br>
=C2=A0 #<br>
=C2=A0 # Check to make sure the PIC flag actually works.<br>
-@@ -14493,6 +15255,8 @@ fi<br>
+@@ -14495,6 +15257,8 @@ fi<br>
<br>
<br>
<br>
@@ -9645,7 +9645,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 #<br>
=C2=A0 # Check to make sure the static flag actually works.<br>
=C2=A0 #<br>
-@@ -14670,6 +15434,7 @@ fi<br>
+@@ -14672,6 +15436,7 @@ fi<br>
=C2=A0 $as_echo_n &quot;checking whether the $compiler linker ($LD) support=
s shared libraries... &quot; &gt;&amp;6; }<br>
<br>
=C2=A0 =C2=A0 export_symbols_cmds_CXX=3D&#39;$NM $libobjs $convenience | $g=
lobal_symbol_pipe | $SED &#39;\&#39;&#39;s/.* //&#39;\&#39;&#39; | sort | u=
niq &gt; $export_symbols&#39;<br>
@@ -9653,7 +9653,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 =C2=A0 case $host_os in<br>
=C2=A0 =C2=A0 aix[4-9]*)<br>
=C2=A0 =C2=A0 =C2=A0 # If we&#39;re using GNU nm, then we don&#39;t want th=
e &quot;-C&quot; option.<br>
-@@ -14684,15 +15449,20 @@ $as_echo_n &quot;checking whether the $compiler =
linker ($LD) supports shared librarie<br>
+@@ -14686,15 +15451,20 @@ $as_echo_n &quot;checking whether the $compiler =
linker ($LD) supports shared librarie<br>
=C2=A0 =C2=A0 =C2=A0 ;;<br>
=C2=A0 =C2=A0 pw32*)<br>
=C2=A0 =C2=A0 =C2=A0 export_symbols_cmds_CXX=3D&quot;$ltdll_cmds&quot;<br>
@@ -9679,7 +9679,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
<br>
=C2=A0 { $as_echo &quot;$as_me:${as_lineno-$LINENO}: result: $ld_shlibs_CXX=
&quot; &gt;&amp;5<br>
=C2=A0 $as_echo &quot;$ld_shlibs_CXX&quot; &gt;&amp;6; }<br>
-@@ -14955,8 +15725,9 @@ cygwin* | mingw* | pw32* | cegcc*)<br>
+@@ -14957,8 +15727,9 @@ cygwin* | mingw* | pw32* | cegcc*)<br>
=C2=A0 =C2=A0 need_version=3Dno<br>
=C2=A0 =C2=A0 need_lib_prefix=3Dno<br>
<br>
@@ -9691,7 +9691,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 =C2=A0 =C2=A0 library_names_spec=3D&#39;$libname.dll.a&#39;<br>
=C2=A0 =C2=A0 =C2=A0 # DLL is installed to $(libdir)/../bin by postinstall_=
cmds<br>
=C2=A0 =C2=A0 =C2=A0 postinstall_cmds=3D&#39;base_file=3D`basename \${file}=
`~<br>
-@@ -14988,13 +15759,71 @@ cygwin* | mingw* | pw32* | cegcc*)<br>
+@@ -14990,13 +15761,71 @@ cygwin* | mingw* | pw32* | cegcc*)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 library_names_spec=3D&#39;`echo ${libname} | se=
d -e &#39;s/^lib/pw/&#39;``echo ${release} | $SED -e &#39;s/[.]/-/g&#39;`${=
versuffix}${shared_ext}&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
=C2=A0 =C2=A0 =C2=A0 esac<br>
@@ -9764,7 +9764,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 =C2=A0 # FIXME: first we should search . and the directory the execu=
table is in<br>
=C2=A0 =C2=A0 shlibpath_var=3DPATH<br>
=C2=A0 =C2=A0 ;;<br>
-@@ -15534,6 +16363,7 @@ fi<br>
+@@ -15536,6 +16365,7 @@ fi<br>
=C2=A0 =C2=A0 fi # test -n &quot;$compiler&quot;<br>
<br>
=C2=A0 =C2=A0 CC=3D$lt_save_CC<br>
@@ -9772,7 +9772,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 =C2=A0 LDCXX=3D$LD<br>
=C2=A0 =C2=A0 LD=3D$lt_save_LD<br>
=C2=A0 =C2=A0 GCC=3D$lt_save_GCC<br>
-@@ -17690,13 +18520,20 @@ exeext=3D&#39;`$ECHO &quot;$exeext&quot; | $SED =
&quot;$delay_single_quote_subst&quot;`&#39;<br>
+@@ -17751,13 +18581,20 @@ exeext=3D&#39;`$ECHO &quot;$exeext&quot; | $SED =
&quot;$delay_single_quote_subst&quot;`&#39;<br>
=C2=A0 lt_unset=3D&#39;`$ECHO &quot;$lt_unset&quot; | $SED &quot;$delay_sin=
gle_quote_subst&quot;`&#39;<br>
=C2=A0 lt_SP2NL=3D&#39;`$ECHO &quot;$lt_SP2NL&quot; | $SED &quot;$delay_sin=
gle_quote_subst&quot;`&#39;<br>
=C2=A0 lt_NL2SP=3D&#39;`$ECHO &quot;$lt_NL2SP&quot; | $SED &quot;$delay_sin=
gle_quote_subst&quot;`&#39;<br>
@@ -9793,7 +9793,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 STRIP=3D&#39;`$ECHO &quot;$STRIP&quot; | $SED &quot;$delay_single_qu=
ote_subst&quot;`&#39;<br>
=C2=A0 RANLIB=3D&#39;`$ECHO &quot;$RANLIB&quot; | $SED &quot;$delay_single_=
quote_subst&quot;`&#39;<br>
=C2=A0 old_postinstall_cmds=3D&#39;`$ECHO &quot;$old_postinstall_cmds&quot;=
 | $SED &quot;$delay_single_quote_subst&quot;`&#39;<br>
-@@ -17711,14 +18548,17 @@ lt_cv_sys_global_symbol_pipe=3D&#39;`$ECHO &quot=
;$lt_cv_sys_global_symbol_pipe&quot; | $SED &quot;$de<br>
+@@ -17772,14 +18609,17 @@ lt_cv_sys_global_symbol_pipe=3D&#39;`$ECHO &quot=
;$lt_cv_sys_global_symbol_pipe&quot; | $SED &quot;$de<br>
=C2=A0 lt_cv_sys_global_symbol_to_cdecl=3D&#39;`$ECHO &quot;$lt_cv_sys_glob=
al_symbol_to_cdecl&quot; | $SED &quot;$delay_single_quote_subst&quot;`&#39;=
<br>
=C2=A0 lt_cv_sys_global_symbol_to_c_name_address=3D&#39;`$ECHO &quot;$lt_cv=
_sys_global_symbol_to_c_name_address&quot; | $SED &quot;$delay_single_quote=
_subst&quot;`&#39;<br>
=C2=A0 lt_cv_sys_global_symbol_to_c_name_address_lib_prefix=3D&#39;`$ECHO &=
quot;$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix&quot; | $SED &qu=
ot;$delay_single_quote_subst&quot;`&#39;<br>
@@ -9812,7 +9812,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 DSYMUTIL=3D&#39;`$ECHO &quot;$DSYMUTIL&quot; | $SED &quot;$delay_sin=
gle_quote_subst&quot;`&#39;<br>
=C2=A0 NMEDIT=3D&#39;`$ECHO &quot;$NMEDIT&quot; | $SED &quot;$delay_single_=
quote_subst&quot;`&#39;<br>
=C2=A0 LIPO=3D&#39;`$ECHO &quot;$LIPO&quot; | $SED &quot;$delay_single_quot=
e_subst&quot;`&#39;<br>
-@@ -17751,12 +18591,12 @@ hardcode_shlibpath_var=3D&#39;`$ECHO &quot;$hard=
code_shlibpath_var&quot; | $SED &quot;$delay_single_q<br>
+@@ -17812,12 +18652,12 @@ hardcode_shlibpath_var=3D&#39;`$ECHO &quot;$hard=
code_shlibpath_var&quot; | $SED &quot;$delay_single_q<br>
=C2=A0 hardcode_automatic=3D&#39;`$ECHO &quot;$hardcode_automatic&quot; | $=
SED &quot;$delay_single_quote_subst&quot;`&#39;<br>
=C2=A0 inherit_rpath=3D&#39;`$ECHO &quot;$inherit_rpath&quot; | $SED &quot;=
$delay_single_quote_subst&quot;`&#39;<br>
=C2=A0 link_all_deplibs=3D&#39;`$ECHO &quot;$link_all_deplibs&quot; | $SED =
&quot;$delay_single_quote_subst&quot;`&#39;<br>
@@ -9826,7 +9826,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 file_list_spec=3D&#39;`$ECHO &quot;$file_list_spec&quot; | $SED &quo=
t;$delay_single_quote_subst&quot;`&#39;<br>
=C2=A0 variables_saved_for_relink=3D&#39;`$ECHO &quot;$variables_saved_for_=
relink&quot; | $SED &quot;$delay_single_quote_subst&quot;`&#39;<br>
=C2=A0 need_lib_prefix=3D&#39;`$ECHO &quot;$need_lib_prefix&quot; | $SED &q=
uot;$delay_single_quote_subst&quot;`&#39;<br>
-@@ -17795,8 +18635,8 @@ old_archive_cmds_CXX=3D&#39;`$ECHO &quot;$old_arch=
ive_cmds_CXX&quot; | $SED &quot;$delay_single_quote<br>
+@@ -17856,8 +18696,8 @@ old_archive_cmds_CXX=3D&#39;`$ECHO &quot;$old_arch=
ive_cmds_CXX&quot; | $SED &quot;$delay_single_quote<br>
=C2=A0 compiler_CXX=3D&#39;`$ECHO &quot;$compiler_CXX&quot; | $SED &quot;$d=
elay_single_quote_subst&quot;`&#39;<br>
=C2=A0 GCC_CXX=3D&#39;`$ECHO &quot;$GCC_CXX&quot; | $SED &quot;$delay_singl=
e_quote_subst&quot;`&#39;<br>
=C2=A0 lt_prog_compiler_no_builtin_flag_CXX=3D&#39;`$ECHO &quot;$lt_prog_co=
mpiler_no_builtin_flag_CXX&quot; | $SED &quot;$delay_single_quote_subst&quo=
t;`&#39;<br>
@@ -9836,7 +9836,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 lt_prog_compiler_static_CXX=3D&#39;`$ECHO &quot;$lt_prog_compiler_st=
atic_CXX&quot; | $SED &quot;$delay_single_quote_subst&quot;`&#39;<br>
=C2=A0 lt_cv_prog_compiler_c_o_CXX=3D&#39;`$ECHO &quot;$lt_cv_prog_compiler=
_c_o_CXX&quot; | $SED &quot;$delay_single_quote_subst&quot;`&#39;<br>
=C2=A0 archive_cmds_need_lc_CXX=3D&#39;`$ECHO &quot;$archive_cmds_need_lc_C=
XX&quot; | $SED &quot;$delay_single_quote_subst&quot;`&#39;<br>
-@@ -17823,12 +18663,12 @@ hardcode_shlibpath_var_CXX=3D&#39;`$ECHO &quot;$=
hardcode_shlibpath_var_CXX&quot; | $SED &quot;$delay_<br>
+@@ -17884,12 +18724,12 @@ hardcode_shlibpath_var_CXX=3D&#39;`$ECHO &quot;$=
hardcode_shlibpath_var_CXX&quot; | $SED &quot;$delay_<br>
=C2=A0 hardcode_automatic_CXX=3D&#39;`$ECHO &quot;$hardcode_automatic_CXX&q=
uot; | $SED &quot;$delay_single_quote_subst&quot;`&#39;<br>
=C2=A0 inherit_rpath_CXX=3D&#39;`$ECHO &quot;$inherit_rpath_CXX&quot; | $SE=
D &quot;$delay_single_quote_subst&quot;`&#39;<br>
=C2=A0 link_all_deplibs_CXX=3D&#39;`$ECHO &quot;$link_all_deplibs_CXX&quot;=
 | $SED &quot;$delay_single_quote_subst&quot;`&#39;<br>
@@ -9850,7 +9850,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 file_list_spec_CXX=3D&#39;`$ECHO &quot;$file_list_spec_CXX&quot; | $=
SED &quot;$delay_single_quote_subst&quot;`&#39;<br>
=C2=A0 hardcode_action_CXX=3D&#39;`$ECHO &quot;$hardcode_action_CXX&quot; |=
 $SED &quot;$delay_single_quote_subst&quot;`&#39;<br>
=C2=A0 compiler_lib_search_dirs_CXX=3D&#39;`$ECHO &quot;$compiler_lib_searc=
h_dirs_CXX&quot; | $SED &quot;$delay_single_quote_subst&quot;`&#39;<br>
-@@ -17866,8 +18706,13 @@ reload_flag \<br>
+@@ -17927,8 +18767,13 @@ reload_flag \<br>
=C2=A0 OBJDUMP \<br>
=C2=A0 deplibs_check_method \<br>
=C2=A0 file_magic_cmd \<br>
@@ -9864,7 +9864,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 STRIP \<br>
=C2=A0 RANLIB \<br>
=C2=A0 CC \<br>
-@@ -17877,12 +18722,14 @@ lt_cv_sys_global_symbol_pipe \<br>
+@@ -17938,12 +18783,14 @@ lt_cv_sys_global_symbol_pipe \<br>
=C2=A0 lt_cv_sys_global_symbol_to_cdecl \<br>
=C2=A0 lt_cv_sys_global_symbol_to_c_name_address \<br>
=C2=A0 lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \<br>
@@ -9880,7 +9880,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 DSYMUTIL \<br>
=C2=A0 NMEDIT \<br>
=C2=A0 LIPO \<br>
-@@ -17898,7 +18745,6 @@ no_undefined_flag \<br>
+@@ -17959,7 +18806,6 @@ no_undefined_flag \<br>
=C2=A0 hardcode_libdir_flag_spec \<br>
=C2=A0 hardcode_libdir_flag_spec_ld \<br>
=C2=A0 hardcode_libdir_separator \<br>
@@ -9888,7 +9888,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 exclude_expsyms \<br>
=C2=A0 include_expsyms \<br>
=C2=A0 file_list_spec \<br>
-@@ -17920,8 +18766,8 @@ LD_CXX \<br>
+@@ -17981,8 +18827,8 @@ LD_CXX \<br>
=C2=A0 reload_flag_CXX \<br>
=C2=A0 compiler_CXX \<br>
=C2=A0 lt_prog_compiler_no_builtin_flag_CXX \<br>
@@ -9898,7 +9898,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 lt_prog_compiler_static_CXX \<br>
=C2=A0 lt_cv_prog_compiler_c_o_CXX \<br>
=C2=A0 export_dynamic_flag_spec_CXX \<br>
-@@ -17933,7 +18779,6 @@ no_undefined_flag_CXX \<br>
+@@ -17994,7 +18840,6 @@ no_undefined_flag_CXX \<br>
=C2=A0 hardcode_libdir_flag_spec_CXX \<br>
=C2=A0 hardcode_libdir_flag_spec_ld_CXX \<br>
=C2=A0 hardcode_libdir_separator_CXX \<br>
@@ -9906,7 +9906,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 exclude_expsyms_CXX \<br>
=C2=A0 include_expsyms_CXX \<br>
=C2=A0 file_list_spec_CXX \<br>
-@@ -17967,6 +18812,7 @@ module_cmds \<br>
+@@ -18028,6 +18873,7 @@ module_cmds \<br>
=C2=A0 module_expsym_cmds \<br>
=C2=A0 export_symbols_cmds \<br>
=C2=A0 prelink_cmds \<br>
@@ -9914,7 +9914,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 postinstall_cmds \<br>
=C2=A0 postuninstall_cmds \<br>
=C2=A0 finish_cmds \<br>
-@@ -17981,7 +18827,8 @@ archive_expsym_cmds_CXX \<br>
+@@ -18042,7 +18888,8 @@ archive_expsym_cmds_CXX \<br>
=C2=A0 module_cmds_CXX \<br>
=C2=A0 module_expsym_cmds_CXX \<br>
=C2=A0 export_symbols_cmds_CXX \<br>
@@ -9924,7 +9924,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 =C2=A0 =C2=A0 case \`eval \\\\\$ECHO \\\\&quot;&quot;\\\\\$\$var&quo=
t;\\\\&quot;\` in<br>
=C2=A0 =C2=A0 =C2=A0 *[\\\\\\\`\\&quot;\\\$]*)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 eval &quot;lt_\$var=3D\\\\\\&quot;\\\`\\\$ECHO =
\\&quot;\\\$\$var\\&quot; | \\\$SED -e \\&quot;\\\$double_quote_subst\\&quo=
t; -e \\&quot;\\\$sed_quote_subst\\&quot; -e \\&quot;\\\$delay_variable_sub=
st\\&quot;\\\`\\\\\\&quot;&quot;<br>
-@@ -18738,7 +19585,8 @@ $as_echo X&quot;$file&quot; |<br>
+@@ -18799,7 +19646,8 @@ $as_echo X&quot;$file&quot; |<br>
=C2=A0 # NOTE: Changes made to this file will be lost: look at ltmain.sh.<b=
r>
=C2=A0 #<br>
=C2=A0 #=C2=A0 =C2=A0Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003=
, 2004, 2005,<br>
@@ -9934,7 +9934,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 #=C2=A0 =C2=A0Written by Gordon Matzigkeit, 1996<br>
=C2=A0 #<br>
=C2=A0 #=C2=A0 =C2=A0This file is part of GNU Libtool.<br>
-@@ -18841,19 +19689,42 @@ SP2NL=3D$lt_lt_SP2NL<br>
+@@ -18902,19 +19750,42 @@ SP2NL=3D$lt_lt_SP2NL<br>
=C2=A0 # turn newlines into spaces.<br>
=C2=A0 NL2SP=3D$lt_lt_NL2SP<br>
<br>
@@ -9978,7 +9978,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 # A symbol stripping program.<br>
=C2=A0 STRIP=3D$lt_STRIP<br>
<br>
-@@ -18883,6 +19754,12 @@ global_symbol_to_c_name_address=3D$lt_lt_cv_sys_g=
lobal_symbol_to_c_name_address<br>
+@@ -18944,6 +19815,12 @@ global_symbol_to_c_name_address=3D$lt_lt_cv_sys_g=
lobal_symbol_to_c_name_address<br>
=C2=A0 # Transform the output of nm in a C name address pair when lib prefi=
x is needed.<br>
=C2=A0 global_symbol_to_c_name_address_lib_prefix=3D$lt_lt_cv_sys_global_sy=
mbol_to_c_name_address_lib_prefix<br>
<br>
@@ -9991,7 +9991,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 # The name of the directory that contains temporary libtool files.<b=
r>
=C2=A0 objdir=3D$objdir<br>
<br>
-@@ -18892,6 +19769,9 @@ MAGIC_CMD=3D$MAGIC_CMD<br>
+@@ -18953,6 +19830,9 @@ MAGIC_CMD=3D$MAGIC_CMD<br>
=C2=A0 # Must we lock files when doing compilation?<br>
=C2=A0 need_locks=3D$lt_need_locks<br>
<br>
@@ -10001,7 +10001,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 # Tool to manipulate archived DWARF debug symbol files on Mac OS X.<=
br>
=C2=A0 DSYMUTIL=3D$lt_DSYMUTIL<br>
<br>
-@@ -19006,12 +19886,12 @@ with_gcc=3D$GCC<br>
+@@ -19067,12 +19947,12 @@ with_gcc=3D$GCC<br>
=C2=A0 # Compiler flag to turn off builtin functions.<br>
=C2=A0 no_builtin_flag=3D$lt_lt_prog_compiler_no_builtin_flag<br>
<br>
@@ -10017,7 +10017,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 # Compiler flag to prevent dynamic linking.<br>
=C2=A0 link_static_flag=3D$lt_lt_prog_compiler_static<br>
<br>
-@@ -19098,9 +19978,6 @@ inherit_rpath=3D$inherit_rpath<br>
+@@ -19159,9 +20039,6 @@ inherit_rpath=3D$inherit_rpath<br>
=C2=A0 # Whether libtool must link a program against all its dependency lib=
raries.<br>
=C2=A0 link_all_deplibs=3D$link_all_deplibs<br>
<br>
@@ -10027,7 +10027,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 # Set to &quot;yes&quot; if exported symbols are required.<br>
=C2=A0 always_export_symbols=3D$always_export_symbols<br>
<br>
-@@ -19116,6 +19993,9 @@ include_expsyms=3D$lt_include_expsyms<br>
+@@ -19177,6 +20054,9 @@ include_expsyms=3D$lt_include_expsyms<br>
=C2=A0 # Commands necessary for linking programs (against libraries) with t=
emplates.<br>
=C2=A0 prelink_cmds=3D$lt_prelink_cmds<br>
<br>
@@ -10037,7 +10037,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 # Specify filename containing input files.<br>
=C2=A0 file_list_spec=3D$lt_file_list_spec<br>
<br>
-@@ -19162,210 +20042,169 @@ ltmain=3D&quot;$ac_aux_dir/ltmain.sh&quot;<br>
+@@ -19223,210 +20103,169 @@ ltmain=3D&quot;$ac_aux_dir/ltmain.sh&quot;<br>
=C2=A0 =C2=A0 # if finds mixed CR/LF and LF-only lines.=C2=A0 Since sed ope=
rates in<br>
=C2=A0 =C2=A0 # text mode, it properly converts lines to CR/LF.=C2=A0 This =
bash problem<br>
=C2=A0 =C2=A0 # is reportedly fixed, but why not run on old versions too?<b=
r>
@@ -10411,7 +10411,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 =C2=A0 =C2=A0 (rm -f &quot;$ofile&quot; &amp;&amp; cp &quot;$cfgfile=
&quot; &quot;$ofile&quot; &amp;&amp; rm -f &quot;$cfgfile&quot;)<br>
=C2=A0 =C2=A0 chmod +x &quot;$ofile&quot;<br>
<br>
-@@ -19393,12 +20232,12 @@ with_gcc=3D$GCC_CXX<br>
+@@ -19454,12 +20293,12 @@ with_gcc=3D$GCC_CXX<br>
=C2=A0 # Compiler flag to turn off builtin functions.<br>
=C2=A0 no_builtin_flag=3D$lt_lt_prog_compiler_no_builtin_flag_CXX<br>
<br>
@@ -10427,7 +10427,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 # Compiler flag to prevent dynamic linking.<br>
=C2=A0 link_static_flag=3D$lt_lt_prog_compiler_static_CXX<br>
<br>
-@@ -19485,9 +20324,6 @@ inherit_rpath=3D$inherit_rpath_CXX<br>
+@@ -19546,9 +20385,6 @@ inherit_rpath=3D$inherit_rpath_CXX<br>
=C2=A0 # Whether libtool must link a program against all its dependency lib=
raries.<br>
=C2=A0 link_all_deplibs=3D$link_all_deplibs_CXX<br>
<br>
@@ -10437,7 +10437,7 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 # Set to &quot;yes&quot; if exported symbols are required.<br>
=C2=A0 always_export_symbols=3D$always_export_symbols_CXX<br>
<br>
-@@ -19503,6 +20339,9 @@ include_expsyms=3D$lt_include_expsyms_CXX<br>
+@@ -19564,6 +20400,9 @@ include_expsyms=3D$lt_include_expsyms_CXX<br>
=C2=A0 # Commands necessary for linking programs (against libraries) with t=
emplates.<br>
=C2=A0 prelink_cmds=3D$lt_prelink_cmds_CXX<br>
<br>
@@ -10448,10 +10448,10 @@ index 2afc9a381a6..1e57b41ffa4 100755<br>
=C2=A0 file_list_spec=3D$lt_file_list_spec_CXX<br>
<br>
=C2=A0diff --git a/gprofng/doc/Makefile.in b/gprofng/doc/Makefile.in<br>
-index a45018334e8..4c30941c6b6 100644<br>
+index 3cd2068cbf6..c5d431236aa 100644<br>
=C2=A0--- a/gprofng/doc/Makefile.in<br>
=C2=A0+++ b/gprofng/doc/Makefile.in<br>
-@@ -237,6 +237,7 @@ CXXFLAGS =3D @CXXFLAGS@<br>
+@@ -240,6 +240,7 @@ CXXFLAGS =3D @CXXFLAGS@<br>
=C2=A0 CYGPATH_W =3D @CYGPATH_W@<br>
=C2=A0 DEFS =3D @DEFS@<br>
=C2=A0 DEPDIR =3D @DEPDIR@<br>
@@ -10459,7 +10459,7 @@ index a45018334e8..4c30941c6b6 100644<br>
=C2=A0 DSYMUTIL =3D @DSYMUTIL@<br>
=C2=A0 DUMPBIN =3D @DUMPBIN@<br>
=C2=A0 ECHO_C =3D @ECHO_C@<br>
-@@ -272,6 +273,7 @@ LN_S =3D @LN_S@<br>
+@@ -275,6 +276,7 @@ LN_S =3D @LN_S@<br>
=C2=A0 LTLIBOBJS =3D @LTLIBOBJS@<br>
=C2=A0 MAINT =3D @MAINT@<br>
=C2=A0 MAKEINFO =3D @MAKEINFO@<br>
@@ -10508,7 +10508,7 @@ index eef61ba85f7..0eb1521b704 100644<br>
=C2=A0 NM =3D @NM@<br>
=C2=A0 NMEDIT =3D @NMEDIT@<br>
=C2=A0diff --git a/gprofng/libcollector/configure b/gprofng/libcollector/co=
nfigure<br>
-index e92fbfc2242..09e93f878ae 100755<br>
+index 079a0b71ec3..a28289cfe9d 100755<br>
=C2=A0--- a/gprofng/libcollector/configure<br>
=C2=A0+++ b/gprofng/libcollector/configure<br>
=C2=A0@@ -641,6 +641,8 @@ OTOOL<br>
@@ -13108,7 +13108,7 @@ index e92fbfc2242..09e93f878ae 100755<br>
=C2=A0 file_list_spec=3D$lt_file_list_spec_CXX<br>
<br>
=C2=A0diff --git a/gprofng/src/Makefile.in b/gprofng/src/Makefile.in<br>
-index 4274762334e..74ab09d7661 100644<br>
+index 605fa4f6fd4..313c4ceb4ca 100644<br>
=C2=A0--- a/gprofng/src/Makefile.in<br>
=C2=A0+++ b/gprofng/src/Makefile.in<br>
=C2=A0@@ -324,6 +324,7 @@ CXXFLAGS =3D @CXXFLAGS@<br>
@@ -13128,7 +13128,7 @@ index 4274762334e..74ab09d7661 100644<br>
=C2=A0 NM =3D @NM@<br>
=C2=A0 NMEDIT =3D @NMEDIT@<br>
=C2=A0diff --git a/ld/Makefile.in b/ld/Makefile.in<br>
-index 0405028e02f..bd18a0a9e55 100644<br>
+index 08dcd7b75fc..17c58dd2fd0 100644<br>
=C2=A0--- a/ld/Makefile.in<br>
=C2=A0+++ b/ld/Makefile.in<br>
=C2=A0@@ -384,6 +384,7 @@ CYGPATH_W =3D @CYGPATH_W@<br>
@@ -13156,7 +13156,7 @@ index 0405028e02f..bd18a0a9e55 100644<br>
=C2=A0 ac_ct_CXX =3D @ac_ct_CXX@<br>
=C2=A0 ac_ct_DUMPBIN =3D @ac_ct_DUMPBIN@<br>
=C2=A0diff --git a/ld/configure b/ld/configure<br>
-index 5f5dad6d67c..18150633570 100755<br>
+index 6406a42c442..21ab5b06709 100755<br>
=C2=A0--- a/ld/configure<br>
=C2=A0+++ b/ld/configure<br>
=C2=A0@@ -700,8 +700,11 @@ OTOOL<br>
@@ -29906,7 +29906,7 @@ index c1eca5a42ed..7cab295b26d 100644<br>
=C2=A0 ac_ct_DUMPBIN =3D @ac_ct_DUMPBIN@<br>
=C2=A0 am__include =3D @am__include@<br>
=C2=A0diff --git a/opcodes/configure b/opcodes/configure<br>
-index 483ae4f7a9c..907807594f9 100755<br>
+index d2364991ee8..f9a46eec7a3 100755<br>
=C2=A0--- a/opcodes/configure<br>
=C2=A0+++ b/opcodes/configure<br>
=C2=A0@@ -682,6 +682,9 @@ OTOOL<br>
diff --git a/meta/recipes-devtools/binutils/binutils/0009-Fix-rpath-in-libt=
ool-when-sysroot-is-enabled.patch b/meta/recipes-devtools/binutils/binutils=
/0009-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch<br>
index ce795b7522..afd694db4d 100644<br>
--- a/meta/recipes-devtools/binutils/binutils/0009-Fix-rpath-in-libtool-whe=
n-sysroot-is-enabled.patch<br>
+++ b/meta/recipes-devtools/binutils/binutils/0009-Fix-rpath-in-libtool-whe=
n-sysroot-is-enabled.patch<br>
@@ -1,4 +1,4 @@<br>
-From d6f4f62fda4fde10b805b06d5e61792ee821449c Mon Sep 17 00:00:00 2001<br>
+From ff2754e302d06df51f8dd8ef877afb65eb30fcab Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0Date: Mon, 2 Mar 2015 01:42:38 +0000<br>
=C2=A0Subject: [PATCH] Fix rpath in libtool when sysroot is enabled<br>
diff --git a/meta/recipes-devtools/binutils/binutils/0010-sync-with-OE-libt=
ool-changes.patch b/meta/recipes-devtools/binutils/binutils/0010-sync-with-=
OE-libtool-changes.patch<br>
index 910bd38694..cc0fb551b2 100644<br>
--- a/meta/recipes-devtools/binutils/binutils/0010-sync-with-OE-libtool-cha=
nges.patch<br>
+++ b/meta/recipes-devtools/binutils/binutils/0010-sync-with-OE-libtool-cha=
nges.patch<br>
@@ -1,4 +1,4 @@<br>
-From 654b4ea9e28aad037e788672ca0d9ba450b3285e Mon Sep 17 00:00:00 2001<br>
+From 039b4afd7d3b5a599aebee97410809276a622ccd Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" target=
=3D"_blank">ross.burton@intel.com</a>&gt;<br>
=C2=A0Date: Mon, 6 Mar 2017 23:33:27 -0800<br>
=C2=A0Subject: [PATCH] sync with OE libtool changes<br>
diff --git a/meta/recipes-devtools/binutils/binutils/0011-Check-for-clang-b=
efore-checking-gcc-version.patch b/meta/recipes-devtools/binutils/binutils/=
0011-Check-for-clang-before-checking-gcc-version.patch<br>
index a825f9c842..b921dd1218 100644<br>
--- a/meta/recipes-devtools/binutils/binutils/0011-Check-for-clang-before-c=
hecking-gcc-version.patch<br>
+++ b/meta/recipes-devtools/binutils/binutils/0011-Check-for-clang-before-c=
hecking-gcc-version.patch<br>
@@ -1,4 +1,4 @@<br>
-From 9d35ab04de550f1db5d2e74d37fdeab4ca436148 Mon Sep 17 00:00:00 2001<br>
+From 4eb24605fb2012c0f02883d1f560d5d852c0705e Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0Date: Wed, 15 Apr 2020 14:17:20 -0700<br>
=C2=A0Subject: [PATCH] Check for clang before checking gcc version<br>
@@ -18,7 +18,7 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 2 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
=C2=A0diff --git a/configure b/configure<br>
-index 417fc5a970c..bdc3583215f 100755<br>
+index 9cb953a197e..b63b5cd3de0 100755<br>
=C2=A0--- a/configure<br>
=C2=A0+++ b/configure<br>
=C2=A0@@ -5460,7 +5460,7 @@ ac_compiler_gnu=3D$ac_cv_cxx_compiler_gnu<br>
@@ -31,7 +31,7 @@ index 417fc5a970c..bdc3583215f 100755<br>
=C2=A0 #endif<br>
=C2=A0 int main() {}<br>
=C2=A0diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nore=
ferrer" target=3D"_blank">configure.ac</a><br>
-index 3a1eb0357e5..1c00b9aec42 100644<br>
+index e95a9ed116e..2df870b86af 100644<br>
=C2=A0--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
=C2=A0+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
=C2=A0@@ -1444,7 +1444,7 @@ if test &quot;$GCC&quot; =3D yes; then<br>
diff --git a/meta/recipes-devtools/binutils/binutils/0012-Only-generate-an-=
RPATH-entry-if-LD_RUN_PATH-is-not-e.patch b/meta/recipes-devtools/binutils/=
binutils/0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch<br=
>
index 1871fbc799..f69071ae96 100644<br>
--- a/meta/recipes-devtools/binutils/binutils/0012-Only-generate-an-RPATH-e=
ntry-if-LD_RUN_PATH-is-not-e.patch<br>
+++ b/meta/recipes-devtools/binutils/binutils/0012-Only-generate-an-RPATH-e=
ntry-if-LD_RUN_PATH-is-not-e.patch<br>
@@ -1,4 +1,4 @@<br>
-From 9a296e537708296d32c07c1dc681f59de3d1acf9 Mon Sep 17 00:00:00 2001<br>
+From 9613e47bfdea18d2764eec130676e3e0b40c676f Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0Date: Thu, 10 Mar 2022 21:21:33 -0800<br>
=C2=A0Subject: [PATCH] Only generate an RPATH entry if LD_RUN_PATH is not e=
mpty<br>
diff --git a/meta/recipes-devtools/binutils/binutils/0013-Define-alignof-us=
ing-_Alignof-when-using-C11-or-newe.patch b/meta/recipes-devtools/binutils/=
binutils/0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch<br=
>
index 91ac606f78..9cdc7e219d 100644<br>
--- a/meta/recipes-devtools/binutils/binutils/0013-Define-alignof-using-_Al=
ignof-when-using-C11-or-newe.patch<br>
+++ b/meta/recipes-devtools/binutils/binutils/0013-Define-alignof-using-_Al=
ignof-when-using-C11-or-newe.patch<br>
@@ -1,4 +1,4 @@<br>
-From 5fb47367d885a4a32625f09138b306d36ec3769f Mon Sep 17 00:00:00 2001<br>
+From 8af01d85c4e5a5558d770291b7df86acfd59827c Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0Date: Sun, 15 Jan 2023 00:16:25 -0800<br>
=C2=A0Subject: [PATCH] Define alignof using _Alignof when using C11 or newe=
r<br>
diff --git a/meta/recipes-devtools/binutils/binutils/0014-configure-remove-=
dependencies-on-gmp-and-mpfr-when-g.patch b/meta/recipes-devtools/binutils/=
binutils/0014-configure-remove-dependencies-on-gmp-and-mpfr-when-g.patch<br=
>
deleted file mode 100644<br>
index 04c1310cbe..0000000000<br>
--- a/meta/recipes-devtools/binutils/binutils/0014-configure-remove-depende=
ncies-on-gmp-and-mpfr-when-g.patch<br>
+++ /dev/null<br>
@@ -1,56 +0,0 @@<br>
-From 518c167116ab7aa6bb84a97200aeda2c4289e064 Mon Sep 17 00:00:00 2001<br>
-From: =3D?UTF-8?q?Cl=3DC3=3DA9ment=3D20Chigot?=3D &lt;<a href=3D"mailto:ch=
igot@adacore.com" target=3D"_blank">chigot@adacore.com</a>&gt;<br>
-Date: Tue, 3 Jan 2023 14:24:43 +0100<br>
-Subject: [PATCH] configure: remove dependencies on gmp and mpfr when gdb i=
s<br>
- disabled<br>
-<br>
-Since 991180627851801f1999d1ebbc0e569a17e47c74, the configure checks<br>
-about GMP and MPFR for gdb builds have been moved to the toplevel<br>
-configure.<br>
-However, it doesn&#39;t take into account the --disable-gdb option. Meanin=
g<br>
-that a build without gdb will require these libraries even if not<br>
-needed.<br>
-<br>
-ChangeLog:<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0* <a href=3D"http://configure.ac" rel=3D"norefe=
rrer" target=3D"_blank">configure.ac</a>: Skip GMP and MPFR when --disable-=
gdb is<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0provided.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0* configure: Regenerate.<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://sourceware.org/git/?p=3Dbinu=
tils-gdb.git;a=3Dcommitdiff;h=3D5fb0e308577143ceb313fde5538dc9ecb038f29f" r=
el=3D"noreferrer" target=3D"_blank">https://sourceware.org/git/?p=3Dbinutil=
s-gdb.git;a=3Dcommitdiff;h=3D5fb0e308577143ceb313fde5538dc9ecb038f29f</a>]<=
br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
----<br>
- configure=C2=A0 =C2=A0 | 4 +++-<br>
- <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a> | 4 +++-<br>
- 2 files changed, 6 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/configure b/configure<br>
-index bdc3583215f..b63b5cd3de0 100755<br>
---- a/configure<br>
-+++ b/configure<br>
-@@ -8032,7 +8032,9 @@ if test -d ${srcdir}/gcc ; then<br>
-=C2=A0 =C2=A0require_mpc=3Dyes<br>
- fi<br>
- if test -d ${srcdir}/gdb ; then<br>
--=C2=A0 require_gmp=3Dyes<br>
-+=C2=A0 if test &quot;x$enable_gdb&quot; !=3D xno; then<br>
-+=C2=A0 =C2=A0require_gmp=3Dyes<br>
-+=C2=A0 fi<br>
- fi<br>
- <br>
- gmplibs=3D&quot;-lmpfr -lgmp&quot;<br>
-diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
-index 1c00b9aec42..2df870b86af 100644<br>
---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-@@ -1585,7 +1585,9 @@ if test -d ${srcdir}/gcc ; then<br>
-=C2=A0 =C2=A0require_mpc=3Dyes<br>
- fi<br>
- if test -d ${srcdir}/gdb ; then<br>
--=C2=A0 require_gmp=3Dyes<br>
-+=C2=A0 if test &quot;x$enable_gdb&quot; !=3D xno; then<br>
-+=C2=A0 =C2=A0require_gmp=3Dyes<br>
-+=C2=A0 fi<br>
- fi<br>
- <br>
- gmplibs=3D&quot;-lmpfr -lgmp&quot;<br>
diff --git a/meta/recipes-devtools/binutils/<a href=3D"http://binutils_2.40=
.bb" rel=3D"noreferrer" target=3D"_blank">binutils_2.40.bb</a> b/meta/recip=
es-devtools/binutils/<a href=3D"http://binutils_2.40.bb" rel=3D"noreferrer"=
 target=3D"_blank">binutils_2.40.bb</a><br>
index 9087af87c5..4ce1b4bec2 100644<br>
--- a/meta/recipes-devtools/binutils/<a href=3D"http://binutils_2.40.bb" re=
l=3D"noreferrer" target=3D"_blank">binutils_2.40.bb</a><br>
+++ b/meta/recipes-devtools/binutils/<a href=3D"http://binutils_2.40.bb" re=
l=3D"noreferrer" target=3D"_blank">binutils_2.40.bb</a><br>
@@ -66,7 +66,7 @@ PACKAGE_BEFORE_PN +=3D &quot;libbfd libopcodes gprofng&qu=
ot;<br>
=C2=A0FILES:libbfd =3D &quot;${libdir}/libbfd-*.so.* ${libdir}/libbfd-*.so&=
quot;<br>
=C2=A0FILES:libopcodes =3D &quot;${libdir}/libopcodes-*.so.* ${libdir}/libo=
pcodes-*.so&quot;<br>
=C2=A0FILES:gprofng =3D &quot;${sysconfdir}/gprofng.rc ${libdir}/gprofng/li=
bgp-*.so ${libdir}/gprofng/libgprofng.so.* ${bindir}/gp-* ${bindir}/gprofng=
&quot;<br>
-FILES:${PN}-dev +=3D &quot;${libdir}/gprofng/libgprofng.so ${libdir}/libsf=
rame.so&quot;<br>
+FILES:${PN}-dev +=3D &quot;${libdir}/libgprofng.so ${libdir}/libsframe.so&=
quot;<br>
=C2=A0SRC_URI:append:class-nativesdk =3D=C2=A0 &quot; file://0003-binutils-=
nativesdk-Search-for-alternative-ld.so.conf.patch &quot;<br>
<br>
=C2=A0USE_ALTERNATIVES_FOR:class-nativesdk =3D &quot;&quot;<br>
-- <br>
2.40.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#180485): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/180485" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/180485</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98532810/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/98532810/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000072b19005fa6a8345--

