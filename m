Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D04E8C0015E
	for <webhook@archiver.kernel.org>; Sat, 22 Jul 2023 18:57:09 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.11574.1690052224985969541
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Jul 2023 11:57:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=xzBmIE9k;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-668711086f4so1973733b3a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Jul 2023 11:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690052224; x=1690657024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=SfXIyRCzpH0FSIMMjAqohrUtioSn+k24Jl+2/UjaO1c=;
        b=xzBmIE9k37WBdFP9lu3Ueu1an0vBzfj3U1qjcmPWvp2muPrXVoliA9km+X+j+hTWy6
         kSYMKJ9zcnGXBadfPJb2kuPmTZDGSR/1H8lRt0xbARyx1aCsmIcMzL2/shB7LHAUFrGH
         p78zpkUM/FAijefNtBiATJJG9B1D1fzQQEhVR/SsLQD+OftIh+FMWUmohvA6sPPekCjJ
         WvC0cAaHtxVFGj4Ru+spbhqbZmhjRJGRtQozH6/ho8DGS1JEpaDW/pI2GrotatYy4dDE
         86ug9FhDCphyzr+sbWndoBG6NX3VoOc4qdkm5yjrocqwQDCBHbDozgtrD2uUW+5tXWgo
         Gdcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690052224; x=1690657024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SfXIyRCzpH0FSIMMjAqohrUtioSn+k24Jl+2/UjaO1c=;
        b=lo0pOcmmoBibzPAr75lrZNr+X51u8sJ4Her6Su2gOvrOtSwIlIgTpihxaYvs5HbWVB
         y9JFKSTeZ43TMyMSpLqa0yOHlXO2nmHIeyKAmKbAmNA0Nstb2G7d/vfo8C8aU8fjYuBl
         Nu4t+UEsw6IgSElsF1Zkoe3E5M1ponaI/oE6vLAXKHMVJ1PDi9+QDpFYddA/i1U1LFIj
         7oQQAYsI70BMHxjPk0WFPwQLcbvXH99GBc4jaTEooTTrofgMawe/cTAANXe5d2WypH8M
         mONqQ+BKuzbuOEAuWWj12/bQEs5ytg808nhMLl7sEVfRRjYtiFTZs2SbXg03DLPfS6NA
         FfsQ==
X-Gm-Message-State: ABy/qLbbN4If2IFjdYISY7iWlGi0ycriqFLE8y0P2aSlV5lnGsj4teo0
	ZHMyxOLikZ6OZvxmtnNzkomVst5b+SaVJnTJ0VE=
X-Google-Smtp-Source: APBJJlG+D4tI3bZ5PLVVc9pyp+XjMWWM58zRQ5Ghb7t/8Z9nEPbrNqORWNdoQD9HXGblh30G+dey7w==
X-Received: by 2002:a05:6a21:6d85:b0:12e:3394:e2b6 with SMTP id wl5-20020a056a216d8500b0012e3394e2b6mr8064899pzb.8.1690052223880;
        Sat, 22 Jul 2023 11:57:03 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g28-20020a63375c000000b00553ad4ae5e5sm5400572pgn.22.2023.07.22.11.57.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jul 2023 11:57:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 00/11] Patch review
Date: Sat, 22 Jul 2023 08:56:44 -1000
Message-Id: <cover.1690052101.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Jul 2023 18:57:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184723

Please review this set of patches for mickledore and have comments back by
end of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5637

The following changes since commit 8d1bc34cffdd9f054e51db4e880747c79bf834fe:

  testimage/oeqa: Drop testimage_dump_host functionality (2023-07-14 06:06:00 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/mickledore-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/mickledore-nut

Archana Polampalli (1):
  qemu: fix CVE-2023-0330

Bruce Ashfield (2):
  linux-yocto/5.15: update to v5.15.119
  linux-yocto/5.15: update to v5.15.120

Kai Kang (1):
  webkitgtk: 2.38.5 -> 2.38.6

Mingli Yu (1):
  acpica: Update SRC_URI

Richard Purdie (1):
  gcc-testsuite: Fix ppc cpu specification

Ross Burton (3):
  tiff: upgrade to 4.5.1
  gcc: don't pass --enable-standard-branch-protection
  machine/arch-arm64: add -mbranch-protection=standard

Sakib Sajal (1):
  go: fix CVE-2023-24531

Trevor Gamblin (1):
  vim: upgrade 9.0.1527 -> 9.0.1592

 meta/conf/machine/include/arm/arch-arm64.inc  |   5 +
 .../gcc/gcc-configure-common.inc              |   1 -
 meta/recipes-devtools/gcc/gcc-testsuite.inc   |   5 +-
 meta/recipes-devtools/go/go-1.20.5.inc        |   2 +
 .../go/go/CVE-2023-24531_1.patch              | 266 ++++++++++++++++++
 .../go/go/CVE-2023-24531_2.patch              |  47 ++++
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2023-0330.patch             |  75 +++++
 .../acpica/acpica_20220331.bb                 |   2 +-
 .../linux/linux-yocto-rt_5.15.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.15.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 +-
 .../libtiff/files/CVE-2022-48281.patch        |  29 --
 .../libtiff/files/CVE-2023-25434.patch        | 159 -----------
 .../libtiff/files/CVE-2023-26965.patch        |  99 -------
 .../libtiff/files/CVE-2023-2731.patch         |  39 ---
 .../libtiff/{tiff_4.5.0.bb => tiff_4.5.1.bb}  |  14 +-
 ...ebkitgtk_2.38.5.bb => webkitgtk_2.38.6.bb} |   2 +-
 meta/recipes-support/vim/vim.inc              |   4 +-
 19 files changed, 424 insertions(+), 364 deletions(-)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2023-24531_1.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2023-24531_2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-0330.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-48281.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-25434.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-26965.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-2731.patch
 rename meta/recipes-multimedia/libtiff/{tiff_4.5.0.bb => tiff_4.5.1.bb} (81%)
 rename meta/recipes-sato/webkit/{webkitgtk_2.38.5.bb => webkitgtk_2.38.6.bb} (98%)

-- 
2.34.1


