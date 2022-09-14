Return-Path: <sakoman@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9952EECAAD3
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 15:15:29 +0000 (UTC)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com
 [209.85.217.49])
 by mx.groups.io with SMTP id smtpd.web08.627.1663168522375472941
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 08:15:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RJplzthS;
 spf=pass (domain: gmail.com, ip: 209.85.217.49, mailfrom: sakoman@gmail.com)
Received: by mail-vs1-f49.google.com with SMTP id 67so16246200vsv.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 08:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=vBKI4/DCSKin3XrJvMgoLBqHqeNrHtpDoJ3/nxkKrlg=;
        b=RJplzthSrEwxrW73STBK+uTgi8OQ9oGdlndo9PbBTY/Apn7slrSKWq2bcUWB2CaoMs
         YXU6yyMIX72ORTWsIsQ9k7Tis/Ed3XR6rtte0+FnTlO36ALglJuF/aQGBy4WdIxrf5sd
         2/Rc4dLT2iC01dKtD2P3A7xQSE/gccCxLcj4XuucIKbnX6YIXxy0d/J6FYHSKjBM/EJg
         ztfOOQkauVJC8qH/f71R+W1YaL5rVedRr8peVgvQhOxDXKka0V2NlIOQbb6obUUrRCtT
         AcbkuKQKGaiujjWT/oSOuXP+qPY7OLOgbVKNueofkNLSD+d6gZ2qp0h+AnDCa5yaqNE7
         x+Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=vBKI4/DCSKin3XrJvMgoLBqHqeNrHtpDoJ3/nxkKrlg=;
        b=GIHzeK+TWnhF9UjmdqlVewvbyl4v9TsXsBlFeQOHS1CJjtHjobAPtoLZ8GBsry5YPl
         CAdB1hvwbjN77PURs59KJvrmO9QOZw5IeXovs++CyPGXQl1v3Bg8UkMAwvKsXpMSXnCf
         tOGs5nPA8HfbeU0xAhuGh//sPD0EGyez58nFUublZKeuVeITVVMjmmzkNjDKmxsKfMV7
         jOYGaNtK97OIIBKU5K+evdB8mF58u6PAj5v5dsedZfUnHfihS693nC3Oqr5FJU4P2zb/
         gZFsTBBTCdTvW0+0Eg+TgGpK8z2AS9PDC2DTKZGWSpEHnyXc+zSUaRpygeGHWaN5l9i4
         fwdQ==
X-Gm-Message-State: ACgBeo2H17ATTs/K93IuJj1TLSfDb030HgQDYVbwNUWPZ51GQ2FgcQLy
	RtmPaj7AB2el9YC4tQMpkBarpE9WZkJ5EQJNeLaXOORE
X-Google-Smtp-Source: 
 AA6agR7n4i63FHFRv++pkmIIR6Uo6v8VWnha3vL9FTTR7CIX1asY5IwDm7iUu4xIb/EsHg+MIL7PGMkYIWcnxSodwfo=
X-Received: by 2002:a67:7001:0:b0:398:95a7:c113 with SMTP id
 l1-20020a677001000000b0039895a7c113mr4479236vsc.73.1663168521208; Wed, 14 Sep
 2022 08:15:21 -0700 (PDT)
MIME-Version: 1.0
References: <17149C4A25D72AE1.21543@lists.openembedded.org>
 <20220914072059.3509603-1-mingli.yu@windriver.com>
 <29755fd3-a605-6c2a-a703-a68a7b928d86@windriver.com>
In-Reply-To: <29755fd3-a605-6c2a-a703-a68a7b928d86@windriver.com>
From: Steve Sakoman <sakoman@gmail.com>
Date: Wed, 14 Sep 2022 05:15:10 -1000
Message-ID: 
 <CAGDS+nmea461vEQsNep9axJEUKgXUJK_vhBEyjNYAGNSiGYwcg@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH v2] busybox: add devmem 128-bit
 support
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: "Yu, Mingli" <mingli.yu@windriver.com>,
 openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 15:15:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170662

On Wed, Sep 14, 2022 at 4:08 AM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> On 2022-09-14 03:20, Yu, Mingli wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Add devmem 128-bit support [1].
>
> We should merge to master as well but I don't think we need to enable devmem, especially in kirkstone.
> If a user wants to do that, that's fine.

IIf this is also suitable for master, then the patch should be
resubmitted for master and I can then cherry-pick to kirkstone.

Steve

>
> My notes:
>
> I think that back-porting this commit is low risk since it only adds a new, non-default ability in a compatible manner and
> more importantly 'devmem' is NOT built by default. Therefore, other users are not affected by including this patch.
>
> devmem is a small program that reads and writes from physical memory using /dev/mem.
>
> Usage is:
>
> $ busybox devmem --help
> ...
> Usage: devmem ADDRESS [WIDTH [VALUE]]
> Read/write from physical address
>     ADDRESS    Address to act upon
>     WIDTH    Width (8/16/...)
>     VALUE    Data to be written
>
>
>
> This commit adds 128 bit as a supported WIDTH.
>
> The patch cherry-picks back to 1.35.0 cleanly and doesn't require pulling in any other commits.
> It does add new functionality but the patch is written such that if _SIZEOF_INT128_ isn't define, the code is practically unchanged.
>
>
> There hasn't been a release of busybox since Dec 2021 so we should backport this patch to oe-core/master and oe-core/kirkstone.
>
>
>
> [1] https://git.busybox.net/busybox/commit/?id=d432049f288c9acdc4a7caa729c68ceba3c5dca1
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  .../0001-devmem-add-128-bit-width.patch       | 128 ++++++++++++++++++
>  meta/recipes-core/busybox/busybox/defconfig   |   2 +-
>  meta/recipes-core/busybox/busybox_1.35.0.bb   |   1 +
>  3 files changed, 130 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-core/busybox/busybox/0001-devmem-add-128-bit-width.patch
>
> diff --git a/meta/recipes-core/busybox/busybox/0001-devmem-add-128-bit-width.patch b/meta/recipes-core/busybox/busybox/0001-devmem-add-128-bit-width.patch
> new file mode 100644
> index 0000000000..985e2bf1d9
> --- /dev/null
> +++ b/meta/recipes-core/busybox/busybox/0001-devmem-add-128-bit-width.patch
> @@ -0,0 +1,128 @@
> +From d432049f288c9acdc4a7caa729c68ceba3c5dca1 Mon Sep 17 00:00:00 2001
> +From: Aaro Koskinen <aaro.koskinen@nokia.com>
> +Date: Thu, 25 Aug 2022 18:47:02 +0300
> +Subject: [PATCH] devmem: add 128-bit width
> +
> +Add 128-bit width if the compiler provides the needed type.
> +
> +function                                             old     new   delta
> +devmem_main                                          405     464     +59
> +.rodata                                           109025  109043     +18
> +------------------------------------------------------------------------------
> +(add/remove: 0/0 grow/shrink: 2/0 up/down: 77/0)               Total: 77 bytes
> +
> +Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=d432049f288c9acdc4a7caa729c68ceba3c5dca1]
> +
> +Signed-off-by: Aaro Koskinen <aaro.koskinen@nokia.com>
> +Signed-off-by: Aaro Koskinen <aaro.koskinen@iki.fi>
> +Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + miscutils/devmem.c | 68 ++++++++++++++++++++++++++++++----------------
> + 1 file changed, 44 insertions(+), 24 deletions(-)
> +
> +diff --git a/miscutils/devmem.c b/miscutils/devmem.c
> +index f9f0276bc..f21621bd6 100644
> +--- a/miscutils/devmem.c
> ++++ b/miscutils/devmem.c
> +@@ -29,7 +29,6 @@ int devmem_main(int argc UNUSED_PARAM, char **argv)
> + {
> + void *map_base, *virt_addr;
> + uint64_t read_result;
> +- uint64_t writeval = writeval; /* for compiler */
> + off_t target;
> + unsigned page_size, mapped_size, offset_in_page;
> + int fd;
> +@@ -64,9 +63,6 @@ int devmem_main(int argc UNUSED_PARAM, char **argv)
> + width = strchrnul(bhwl, (argv[2][0] | 0x20)) - bhwl;
> + width = sizes[width];
> + }
> +- /* VALUE */
> +- if (argv[3])
> +- writeval = bb_strtoull(argv[3], NULL, 0);
> + } else { /* argv[2] == NULL */
> + /* make argv[3] to be a valid thing to fetch */
> + argv--;
> +@@ -96,28 +92,46 @@ int devmem_main(int argc UNUSED_PARAM, char **argv)
> + virt_addr = (char*)map_base + offset_in_page;
> +
> + if (!argv[3]) {
> +- switch (width) {
> +- case 8:
> +- read_result = *(volatile uint8_t*)virt_addr;
> +- break;
> +- case 16:
> +- read_result = *(volatile uint16_t*)virt_addr;
> +- break;
> +- case 32:
> +- read_result = *(volatile uint32_t*)virt_addr;
> +- break;
> +- case 64:
> +- read_result = *(volatile uint64_t*)virt_addr;
> +- break;
> +- default:
> +- bb_simple_error_msg_and_die("bad width");
> ++#ifdef __SIZEOF_INT128__
> ++ if (width == 128) {
> ++ unsigned __int128 rd =
> ++ *(volatile unsigned __int128 *)virt_addr;
> ++ printf("0x%016llX%016llX\n",
> ++ (unsigned long long)(uint64_t)(rd >> 64),
> ++ (unsigned long long)(uint64_t)rd
> ++ );
> ++ } else
> ++#endif
> ++ {
> ++ switch (width) {
> ++ case 8:
> ++ read_result = *(volatile uint8_t*)virt_addr;
> ++ break;
> ++ case 16:
> ++ read_result = *(volatile uint16_t*)virt_addr;
> ++ break;
> ++ case 32:
> ++ read_result = *(volatile uint32_t*)virt_addr;
> ++ break;
> ++ case 64:
> ++ read_result = *(volatile uint64_t*)virt_addr;
> ++ break;
> ++ default:
> ++ bb_simple_error_msg_and_die("bad width");
> ++ }
> ++// printf("Value at address 0x%"OFF_FMT"X (%p): 0x%llX\n",
> ++// target, virt_addr,
> ++// (unsigned long long)read_result);
> ++ /* Zero-padded output shows the width of access just done */
> ++ printf("0x%0*llX\n", (width >> 2), (unsigned long long)read_result);
> + }
> +-// printf("Value at address 0x%"OFF_FMT"X (%p): 0x%llX\n",
> +-// target, virt_addr,
> +-// (unsigned long long)read_result);
> +- /* Zero-padded output shows the width of access just done */
> +- printf("0x%0*llX\n", (width >> 2), (unsigned long long)read_result);
> + } else {
> ++ /* parse VALUE */
> ++#ifdef __SIZEOF_INT128__
> ++ unsigned __int128 writeval = strtoumax(argv[3], NULL, 0);
> ++#else
> ++ uint64_t writeval = bb_strtoull(argv[3], NULL, 0);
> ++#endif
> + switch (width) {
> + case 8:
> + *(volatile uint8_t*)virt_addr = writeval;
> +@@ -135,6 +149,12 @@ int devmem_main(int argc UNUSED_PARAM, char **argv)
> + *(volatile uint64_t*)virt_addr = writeval;
> + // read_result = *(volatile uint64_t*)virt_addr;
> + break;
> ++#ifdef __SIZEOF_INT128__
> ++ case 128:
> ++ *(volatile unsigned __int128 *)virt_addr = writeval;
> ++// read_result = *(volatile uint64_t*)virt_addr;
> ++ break;
> ++#endif
> + default:
> + bb_simple_error_msg_and_die("bad width");
> + }
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
> index 5e1e1f5638..58d393ad87 100644
> --- a/meta/recipes-core/busybox/busybox/defconfig
> +++ b/meta/recipes-core/busybox/busybox/defconfig
> @@ -782,7 +782,7 @@ CONFIG_FEATURE_CROND_DIR=""
>  # CONFIG_DEVFSD_FG_NP is not set
>  # CONFIG_DEVFSD_VERBOSE is not set
>  # CONFIG_FEATURE_DEVFS is not set
> -# CONFIG_DEVMEM is not set
> +CONFIG_DEVMEM=y
>
> As mentioned above, I don't think we need to enable DEVMEM but only
>
> carry this small patch.
>
> Thanks,
>
> ../Randy
>
>
>  # CONFIG_FBSPLASH is not set
>  # CONFIG_FLASH_ERASEALL is not set
>  # CONFIG_FLASH_LOCK is not set
> diff --git a/meta/recipes-core/busybox/busybox_1.35.0.bb b/meta/recipes-core/busybox/busybox_1.35.0.bb
> index edf896485e..e9ca6fdb1a 100644
> --- a/meta/recipes-core/busybox/busybox_1.35.0.bb
> +++ b/meta/recipes-core/busybox/busybox_1.35.0.bb
> @@ -50,6 +50,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
>             file://0001-libbb-sockaddr2str-ensure-only-printable-characters-.patch \
>             file://0002-nslookup-sanitize-all-printed-strings-with-printable.patch \
>             file://CVE-2022-30065.patch \
> +           file://0001-devmem-add-128-bit-width.patch \
>             "
>  SRC_URI:append:libc-musl = " file://musl.cfg "
>
>
>
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170658): https://lists.openembedded.org/g/openembedded-core/message/170658
> Mute This Topic: https://lists.openembedded.org/mt/93673250/3617601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [sakoman@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

