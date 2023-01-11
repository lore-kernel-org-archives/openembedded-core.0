Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72915C46467
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 19:34:32 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web11.34212.1673465666558784666
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 11:34:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=D5gz3/nk;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id cc13-20020a05683061cd00b00684b8cf2f4dso1181476otb.12
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 11:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rmVKiD1sMMkmNqwdMso3ZF9gQnuOu9kxWiwcmS/wP2c=;
        b=D5gz3/nkUj1yIhb+j/KRk/Oztq/ila3xPNkz4E31cWOlRz5Bq1He2DCfgYEVvHCGYG
         IZE9py5SDO2fVHltEeEJKr696WEumH1xC7Beo7Rt2L0KAnKUlE9DxviGj9L2sj4UyFsN
         XyEiNpgrceDmxRSXtBx4sLrfCHWg5wOlDhK9DKoQ7fI2NZgkw+1uRr1CCVktVa4hEzH3
         JrYBhdNeE1uGl6S23gjQdtTvr0q6+2ltCKADuBMVApetMYLL6Bf87M98Qtl54WfvXCuv
         zvBTX6pycMBmrsDOKPXj7MrUEGjDcZ+PsK8PgUZvI/ijAKuBGgsq4r4Eerj6YBXQ4Zhy
         9oHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rmVKiD1sMMkmNqwdMso3ZF9gQnuOu9kxWiwcmS/wP2c=;
        b=eHNrfAmUsIHIBhLG+8g69GK/p+GlyMsD4P9RoNfzekatTDCodu+82umm7W5SaibapM
         iL5/imYnxRG2NCHRGySCGml4qOB6Z+3u7xk8ZMDQdd74OXnzR8g3ha24jdafLH3b6CVY
         0mcS4mpA1+WGwPMBvP6BKk48l1dlnWObEActXUcEvnYpWk2xQqVBV15FUgBXJoiOJ/Ae
         4yNq/kKl6pn0sA8dwKu0dv+bDm8M/NYwvBBNN+GUXKdGt0kXECQDIHp0KvVVfApq81Oh
         dF6Lvyq1yjdoQVIWp43T3/dHtHK08BLQmPu6RuSHu2UdGG/mtrKR1BdWdUBTG9ktORVW
         j5Sw==
X-Gm-Message-State: AFqh2kqVg+Eg3VnWlzMSSqc+rBWCDObao1MvDE+eqfMeZeqf4g8r1OwY
	gtTkWRNCEwag8M+c94z/m33eBVvFDBJqv52Jd+o=
X-Google-Smtp-Source: AMrXdXvxNRwnShrxcjZpQlHvU2ZIQGVtoPjkTHrEB/qGG1IOLNmH3rUpunQgug1NSc6DOY+Hn3MI5iBMk/Cr0Q/hwuA=
X-Received: by 2002:a9d:1984:0:b0:670:9d62:667f with SMTP id
 k4-20020a9d1984000000b006709d62667fmr4528889otk.111.1673465665567; Wed, 11
 Jan 2023 11:34:25 -0800 (PST)
MIME-Version: 1.0
References: <20230106110505.443726-1-andrej.valek@siemens.com> <Y76VSuZevS+O23sv@mail.local>
In-Reply-To: <Y76VSuZevS+O23sv@mail.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Jan 2023 11:33:59 -0800
Message-ID: <CAMKF1soGRsyZ2gK6Rj6mA4PR40X3bvOqDW4Lihk1Yb_ZM0+xTw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] busybox: 1.35.0 -> 1.36.0
To: alexandre.belloni@bootlin.com
Cc: Andrej Valek <andrej.valek@siemens.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 19:34:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175772

On Wed, Jan 11, 2023 at 2:54 AM Alexandre Belloni via
lists.openembedded.org
<alexandre.belloni=bootlin.com@lists.openembedded.org> wrote:
>
> This generates a warning:
>
> WARNING: busybox-1.36.0-r0 do_package_qa: QA Issue: busybox: ELF binary /bin/busybox.nosuid has relocations in .text [textrel]
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/6507/steps/11/logs/stdio

hmmm yes. I think texrels is the fundamental problem originally. I
will take a look and see if this one is harmless

>
> On 06/01/2023 12:05:05+0100, Andrej Valek wrote:
> > - update to next (un)stable version 1.36.0
> > - refresh defconfig
> >  - disable new applets (tree, tsort, seedrng)
> >  - use hw-accel for sha1/256 sums when available
> > - remove and refresh already merged patches
> >
> > Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> > ---
> >  ...ab_1.35.0.bb => busybox-inittab_1.36.0.bb} |   0
> >  .../0001-devmem-add-128-bit-width.patch       | 128 ------------------
> >  .../busybox/busybox/CVE-2022-30065.patch      |  29 ----
> >  meta/recipes-core/busybox/busybox/defconfig   |  10 +-
> >  .../busybox/busybox/recognize_connmand.patch  |  10 +-
> >  meta/recipes-core/busybox/busybox/sha1sum.cfg |   2 +
> >  .../busybox/busybox/sha256sum.cfg             |   1 +
> >  .../{busybox_1.35.0.bb => busybox_1.36.0.bb}  |   4 +-
> >  8 files changed, 17 insertions(+), 167 deletions(-)
> >  rename meta/recipes-core/busybox/{busybox-inittab_1.35.0.bb => busybox-inittab_1.36.0.bb} (100%)
> >  delete mode 100644 meta/recipes-core/busybox/busybox/0001-devmem-add-128-bit-width.patch
> >  delete mode 100644 meta/recipes-core/busybox/busybox/CVE-2022-30065.patch
> >  rename meta/recipes-core/busybox/{busybox_1.35.0.bb => busybox_1.36.0.bb} (92%)
> >
> > diff --git a/meta/recipes-core/busybox/busybox-inittab_1.35.0.bb b/meta/recipes-core/busybox/busybox-inittab_1.36.0.bb
> > similarity index 100%
> > rename from meta/recipes-core/busybox/busybox-inittab_1.35.0.bb
> > rename to meta/recipes-core/busybox/busybox-inittab_1.36.0.bb
> > diff --git a/meta/recipes-core/busybox/busybox/0001-devmem-add-128-bit-width.patch b/meta/recipes-core/busybox/busybox/0001-devmem-add-128-bit-width.patch
> > deleted file mode 100644
> > index 985e2bf1d9..0000000000
> > --- a/meta/recipes-core/busybox/busybox/0001-devmem-add-128-bit-width.patch
> > +++ /dev/null
> > @@ -1,128 +0,0 @@
> > -From d432049f288c9acdc4a7caa729c68ceba3c5dca1 Mon Sep 17 00:00:00 2001
> > -From: Aaro Koskinen <aaro.koskinen@nokia.com>
> > -Date: Thu, 25 Aug 2022 18:47:02 +0300
> > -Subject: [PATCH] devmem: add 128-bit width
> > -
> > -Add 128-bit width if the compiler provides the needed type.
> > -
> > -function                                             old     new   delta
> > -devmem_main                                          405     464     +59
> > -.rodata                                           109025  109043     +18
> > -------------------------------------------------------------------------------
> > -(add/remove: 0/0 grow/shrink: 2/0 up/down: 77/0)               Total: 77 bytes
> > -
> > -Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=d432049f288c9acdc4a7caa729c68ceba3c5dca1]
> > -
> > -Signed-off-by: Aaro Koskinen <aaro.koskinen@nokia.com>
> > -Signed-off-by: Aaro Koskinen <aaro.koskinen@iki.fi>
> > -Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
> > -Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> > ----
> > - miscutils/devmem.c | 68 ++++++++++++++++++++++++++++++----------------
> > - 1 file changed, 44 insertions(+), 24 deletions(-)
> > -
> > -diff --git a/miscutils/devmem.c b/miscutils/devmem.c
> > -index f9f0276bc..f21621bd6 100644
> > ---- a/miscutils/devmem.c
> > -+++ b/miscutils/devmem.c
> > -@@ -29,7 +29,6 @@ int devmem_main(int argc UNUSED_PARAM, char **argv)
> > - {
> > -     void *map_base, *virt_addr;
> > -     uint64_t read_result;
> > --    uint64_t writeval = writeval; /* for compiler */
> > -     off_t target;
> > -     unsigned page_size, mapped_size, offset_in_page;
> > -     int fd;
> > -@@ -64,9 +63,6 @@ int devmem_main(int argc UNUSED_PARAM, char **argv)
> > -                     width = strchrnul(bhwl, (argv[2][0] | 0x20)) - bhwl;
> > -                     width = sizes[width];
> > -             }
> > --            /* VALUE */
> > --            if (argv[3])
> > --                    writeval = bb_strtoull(argv[3], NULL, 0);
> > -     } else { /* argv[2] == NULL */
> > -             /* make argv[3] to be a valid thing to fetch */
> > -             argv--;
> > -@@ -96,28 +92,46 @@ int devmem_main(int argc UNUSED_PARAM, char **argv)
> > -     virt_addr = (char*)map_base + offset_in_page;
> > -
> > -     if (!argv[3]) {
> > --            switch (width) {
> > --            case 8:
> > --                    read_result = *(volatile uint8_t*)virt_addr;
> > --                    break;
> > --            case 16:
> > --                    read_result = *(volatile uint16_t*)virt_addr;
> > --                    break;
> > --            case 32:
> > --                    read_result = *(volatile uint32_t*)virt_addr;
> > --                    break;
> > --            case 64:
> > --                    read_result = *(volatile uint64_t*)virt_addr;
> > --                    break;
> > --            default:
> > --                    bb_simple_error_msg_and_die("bad width");
> > -+#ifdef __SIZEOF_INT128__
> > -+            if (width == 128) {
> > -+                    unsigned __int128 rd =
> > -+                            *(volatile unsigned __int128 *)virt_addr;
> > -+                    printf("0x%016llX%016llX\n",
> > -+                            (unsigned long long)(uint64_t)(rd >> 64),
> > -+                            (unsigned long long)(uint64_t)rd
> > -+                    );
> > -+            } else
> > -+#endif
> > -+            {
> > -+                    switch (width) {
> > -+                    case 8:
> > -+                            read_result = *(volatile uint8_t*)virt_addr;
> > -+                            break;
> > -+                    case 16:
> > -+                            read_result = *(volatile uint16_t*)virt_addr;
> > -+                            break;
> > -+                    case 32:
> > -+                            read_result = *(volatile uint32_t*)virt_addr;
> > -+                            break;
> > -+                    case 64:
> > -+                            read_result = *(volatile uint64_t*)virt_addr;
> > -+                            break;
> > -+                    default:
> > -+                            bb_simple_error_msg_and_die("bad width");
> > -+                    }
> > -+//                  printf("Value at address 0x%"OFF_FMT"X (%p): 0x%llX\n",
> > -+//                          target, virt_addr,
> > -+//                          (unsigned long long)read_result);
> > -+                    /* Zero-padded output shows the width of access just done */
> > -+                    printf("0x%0*llX\n", (width >> 2), (unsigned long long)read_result);
> > -             }
> > --//          printf("Value at address 0x%"OFF_FMT"X (%p): 0x%llX\n",
> > --//                  target, virt_addr,
> > --//                  (unsigned long long)read_result);
> > --            /* Zero-padded output shows the width of access just done */
> > --            printf("0x%0*llX\n", (width >> 2), (unsigned long long)read_result);
> > -     } else {
> > -+            /* parse VALUE */
> > -+#ifdef __SIZEOF_INT128__
> > -+            unsigned __int128 writeval = strtoumax(argv[3], NULL, 0);
> > -+#else
> > -+            uint64_t writeval = bb_strtoull(argv[3], NULL, 0);
> > -+#endif
> > -             switch (width) {
> > -             case 8:
> > -                     *(volatile uint8_t*)virt_addr = writeval;
> > -@@ -135,6 +149,12 @@ int devmem_main(int argc UNUSED_PARAM, char **argv)
> > -                     *(volatile uint64_t*)virt_addr = writeval;
> > - //                  read_result = *(volatile uint64_t*)virt_addr;
> > -                     break;
> > -+#ifdef __SIZEOF_INT128__
> > -+            case 128:
> > -+                    *(volatile unsigned __int128 *)virt_addr = writeval;
> > -+//                  read_result = *(volatile uint64_t*)virt_addr;
> > -+                    break;
> > -+#endif
> > -             default:
> > -                     bb_simple_error_msg_and_die("bad width");
> > -             }
> > ---
> > -2.25.1
> > -
> > diff --git a/meta/recipes-core/busybox/busybox/CVE-2022-30065.patch b/meta/recipes-core/busybox/busybox/CVE-2022-30065.patch
> > deleted file mode 100644
> > index 25ad653b25..0000000000
> > --- a/meta/recipes-core/busybox/busybox/CVE-2022-30065.patch
> > +++ /dev/null
> > @@ -1,29 +0,0 @@
> > -Fix use-after-free in awk.
> > -
> > -CVE: CVE-2022-30065
> > -Upstream-Status: Submitted [http://lists.busybox.net/pipermail/busybox/2022-June/089768.html]
> > -Signed-off-by: Ross Burton <ross.burton@arm.com>
> > -
> > -fixes https://bugs.busybox.net/show_bug.cgi?id=14781
> > -
> > -Signed-off-by: Natanael Copa <ncopa at alpinelinux.org>
> > ----
> > - editors/awk.c | 3 +++
> > - 1 file changed, 3 insertions(+)
> > -
> > -diff --git a/editors/awk.c b/editors/awk.c
> > -index 079d0bde5..728ee8685 100644
> > ---- a/editors/awk.c
> > -+++ b/editors/awk.c
> > -@@ -3128,6 +3128,9 @@ static var *evaluate(node *op, var *res)
> > -
> > -             case XC( OC_MOVE ):
> > -                     debug_printf_eval("MOVE\n");
> > -+                    /* make sure that we never return a temp var */
> > -+                    if (L.v == TMPVAR0)
> > -+                            L.v = res;
> > -                     /* if source is a temporary string, jusk relink it to dest */
> > -                     if (R.v == TMPVAR1
> > -                      && !(R.v->type & VF_NUMBER)
> > ---
> > -2.36.1
> > diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
> > index 5e1e1f5638..3d36447c63 100644
> > --- a/meta/recipes-core/busybox/busybox/defconfig
> > +++ b/meta/recipes-core/busybox/busybox/defconfig
> > @@ -1,7 +1,7 @@
> >  #
> >  # Automatically generated make config: don't edit
> > -# Busybox version: 1.35.0
> > -# Sun Dec 26 16:55:55 2021
> > +# Busybox version: 1.36.0
> > +# Tue Jan  3 14:17:01 2023
> >  #
> >  CONFIG_HAVE_DOT_CONFIG=y
> >
> > @@ -123,6 +123,9 @@ CONFIG_UNICODE_WIDE_WCHARS=y
> >  # CONFIG_UNICODE_BIDI_SUPPORT is not set
> >  # CONFIG_UNICODE_NEUTRAL_TABLE is not set
> >  # CONFIG_UNICODE_PRESERVE_BROKEN is not set
> > +# CONFIG_LOOP_CONFIGURE is not set
> > +# CONFIG_NO_LOOP_CONFIGURE is not set
> > +CONFIG_TRY_LOOP_CONFIGURE=y
> >
> >  #
> >  # Applets
> > @@ -338,6 +341,7 @@ CONFIG_FEATURE_TR_CLASSES=y
> >  # CONFIG_FEATURE_TR_EQUIV is not set
> >  CONFIG_TRUE=y
> >  # CONFIG_TRUNCATE is not set
> > +# CONFIG_TSORT is not set
> >  CONFIG_TTY=y
> >  CONFIG_UNAME=y
> >  CONFIG_UNAME_OSNAME="GNU/Linux"
> > @@ -831,10 +835,12 @@ CONFIG_MICROCOM=y
> >  CONFIG_RFKILL=y
> >  # CONFIG_RUNLEVEL is not set
> >  # CONFIG_RX is not set
> > +# CONFIG_SEEDRNG is not set
> >  # CONFIG_SETFATTR is not set
> >  # CONFIG_SETSERIAL is not set
> >  CONFIG_STRINGS=y
> >  CONFIG_TIME=y
> > +# CONFIG_TREE is not set
> >  CONFIG_TS=y
> >  # CONFIG_TTYSIZE is not set
> >  # CONFIG_UBIATTACH is not set
> > diff --git a/meta/recipes-core/busybox/busybox/recognize_connmand.patch b/meta/recipes-core/busybox/busybox/recognize_connmand.patch
> > index f42c74caad..4f28beb556 100644
> > --- a/meta/recipes-core/busybox/busybox/recognize_connmand.patch
> > +++ b/meta/recipes-core/busybox/busybox/recognize_connmand.patch
> > @@ -4,14 +4,14 @@ Upstream-Status: Inappropriate [OE-Core]
> >
> >  Signed-off-by: Saul Wold <sgw@linux.intel.com>
> >
> > -Index: busybox-1.22.1/networking/ifupdown.c
> > +Index: busybox-1.36.0/networking/ifupdown.c
> >  ===================================================================
> > ---- busybox-1.22.1.orig/networking/ifupdown.c
> > -+++ busybox-1.22.1/networking/ifupdown.c
> > -@@ -521,6 +521,10 @@ struct dhcp_client_t {
> > +--- busybox-1.36.0.orig/networking/ifupdown.c
> > ++++ busybox-1.36.0/networking/ifupdown.c
> > +@@ -628,6 +628,10 @@ struct dhcp_client_t {
> >   };
> >
> > - static const struct dhcp_client_t ext_dhcp_clients[] = {
> > + static const struct dhcp_client_t ext_dhcp_clients[] ALIGN_PTR = {
> >  +    { "connmand",
> >  +            "true",
> >  +            "true",
> > diff --git a/meta/recipes-core/busybox/busybox/sha1sum.cfg b/meta/recipes-core/busybox/busybox/sha1sum.cfg
> > index 20e72d9263..01137a2486 100644
> > --- a/meta/recipes-core/busybox/busybox/sha1sum.cfg
> > +++ b/meta/recipes-core/busybox/busybox/sha1sum.cfg
> > @@ -1 +1,3 @@
> >  CONFIG_SHA1SUM=y
> > +CONFIG_SHA1_SMALL=3
> > +CONFIG_SHA1_HWACCEL=y
> > diff --git a/meta/recipes-core/busybox/busybox/sha256sum.cfg b/meta/recipes-core/busybox/busybox/sha256sum.cfg
> > index ce652ae4c6..a5b0ab22d1 100644
> > --- a/meta/recipes-core/busybox/busybox/sha256sum.cfg
> > +++ b/meta/recipes-core/busybox/busybox/sha256sum.cfg
> > @@ -1 +1,2 @@
> >  CONFIG_SHA256SUM=y
> > +CONFIG_SHA256_HWACCEL=y
> > diff --git a/meta/recipes-core/busybox/busybox_1.35.0.bb b/meta/recipes-core/busybox/busybox_1.36.0.bb
> > similarity index 92%
> > rename from meta/recipes-core/busybox/busybox_1.35.0.bb
> > rename to meta/recipes-core/busybox/busybox_1.36.0.bb
> > index e9ca6fdb1a..e46d43e681 100644
> > --- a/meta/recipes-core/busybox/busybox_1.35.0.bb
> > +++ b/meta/recipes-core/busybox/busybox_1.36.0.bb
> > @@ -49,9 +49,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
> >             file://0001-sysctl-ignore-EIO-of-stable_secret-below-proc-sys-ne.patch \
> >             file://0001-libbb-sockaddr2str-ensure-only-printable-characters-.patch \
> >             file://0002-nslookup-sanitize-all-printed-strings-with-printable.patch \
> > -           file://CVE-2022-30065.patch \
> > -           file://0001-devmem-add-128-bit-width.patch \
> >             "
> >  SRC_URI:append:libc-musl = " file://musl.cfg "
> >
> > -SRC_URI[tarball.sha256sum] = "faeeb244c35a348a334f4a59e44626ee870fb07b6884d68c10ae8bc19f83a694"
> > +SRC_URI[tarball.sha256sum] = "542750c8af7cb2630e201780b4f99f3dcceeb06f505b479ec68241c1e6af61a5"
> > --
> > 2.34.3
> >
>
> >
> >
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175728): https://lists.openembedded.org/g/openembedded-core/message/175728
> Mute This Topic: https://lists.openembedded.org/mt/96091213/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

