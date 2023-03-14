Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82F22C6FD1C
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 15:29:22 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.11884.1678807758197436771
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Mar 2023 08:29:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ltxLoMdT;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id p6so17034423plf.0
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 08:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678807757;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=BC1I6G1I5Ynz5shAG2AgAxELSWblPqoql2N5cB6Fb5Y=;
        b=ltxLoMdTWBO7KUxmlw1pkYbpglRaCwF/Zm3r97igxlmAHLLfYIDxJynWKiyQJzVaZ2
         IMDwjEngBXyU1WgwwQlqgv4clJUAbOMPWyBLWBeChai/aO8kZgEhf97QWhypeeYozkce
         taozIZXT3DhBycffecw6ZRZmKwvp/kmOm5oaS0wzJyGxLWLqZNspxqfZyKs05+qUPyMd
         PqZo8g488dmAcxry2o4qdMAB025Ctndfb8gjUJUOvMEVELt017bVJwMuB1PBiaD5seXm
         SDsvECQG8gq68UCTAlAjWbmzEDVZ/QQS3DbsXtkBurxiEgjq5lrWckFUpXghV+ChrEWI
         v3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678807757;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BC1I6G1I5Ynz5shAG2AgAxELSWblPqoql2N5cB6Fb5Y=;
        b=uPhjUh0lf4L5RAtUTUvvCuq6InY7x/yxMruZ+jJWfIOTji3Rm8DuPr1mO1Mj5lApsT
         5MP5F/sb+54hWf/faF4YTuhD0IggNoDPWNYwMJzosFzXRuAFmqaJ9vge46fFLlKlyaYn
         bSqeJsHlBLejpk3k1ktMsTC8nLi0Rn+QZ486xljr2DJC0LGrg4bgVFBZfHnJgZmdcNiI
         nEFSZBQWShDCcPgCEoqYFPmcC+gu28M6PwERb7hFaBdLJbHDnl590Q8c7iONXaYH+JYH
         cZLdv+5QNTZaAsxl+C4FYDNpjCxpwPh895OSGEVduYYN32Z+S7G+r1mRhEjs09vEJCy2
         YgVw==
X-Gm-Message-State: AO0yUKVoR+XvglVfxqE7VdcTl8Gr8zHlY6Y33dwVbNAUlu/1yyeh5AFR
	bst3gyS5gtT1h87A9XHTU9hLiDFCwnsgstTyfOo=
X-Google-Smtp-Source: AK7set+TrR+DKYhR5wystJnbVHLyKT8RvaMKBxtK+AUB64HFYxQMt65PVjugXOQvQBdGGilV+qtnsA==
X-Received: by 2002:a05:6a20:1455:b0:d0:45c1:831 with SMTP id a21-20020a056a20145500b000d045c10831mr27804497pzi.60.1678807757192;
        Tue, 14 Mar 2023 08:29:17 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id z19-20020a634c13000000b00502f017657dsm1709736pga.83.2023.03.14.08.29.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 08:29:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 00/24] Pull request (cover letter only)
Date: Tue, 14 Mar 2023 05:29:10 -1000
Message-Id: <cover.1678807671.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 15:29:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178509

The following changes since commit b995ea45773211bd7bdd60eabcc9bbffda6beb5c:

  build-appliance-image: Update to langdale head revision (2023-03-06 15:17:13 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/langdale-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/langdale-next

Bhabu Bindu (1):
  qemu: Fix CVE-2022-4144

Bruce Ashfield (3):
  linux-yocto/5.15: update to v5.15.94
  linux-yocto/5.15: update to v5.15.96
  linux-yocto-rt/5.15: update to -rt59

Carlos Alberto Lopez Perez (1):
  mesa-demos: packageconfig weston should have a dependency on
    wayland-protocols

Chee Yang Lee (1):
  tiff: fix multiple CVEs

Dmitry Baryshkov (1):
  ffmpeg: fix build failure when vulkan is enabled

Hitendra Prajapati (1):
  libxml2: Fix CVE-2022-40303 && CVE-2022-40304

Khem Raj (2):
  libcomps: Fix callback function prototype for PyCOMPS_hash
  rpm: Fix hdr_hash function prototype

Ming Liu (1):
  linux: inherit pkgconfig in kernel.bbclass

Pavel Zhukov (1):
  u-boot: Map arm64 into map for u-boot dts installation

Peter Marko (1):
  systemd: add group sgx to udev package

Richard Purdie (2):
  binutils: Fix nativesdk ld.so search
  oeqa/selftest/prservice: Improve debug output for failure

Ross Burton (2):
  shadow: ignore CVE-2016-15024
  vim: add missing pkgconfig inherit

Siddharth Doshi (1):
  epiphany: Security fix for CVE-2023-26081

Tom Hochstein (2):
  meson: Fix wrapper handling of implicit setup command
  oeqa/sdk: Improve Meson test

Wang Mingyu (4):
  iso-codes: upgrade 4.12.0 -> 4.13.0
  libmicrohttpd: upgrade 0.9.75 -> 0.9.76
  lua: Fix install conflict when enable multilib.
  vala: Fix install conflict when enable multilib.

 meta-selftest/files/static-group              |   1 +
 meta/classes-recipe/kernel.bbclass            |   2 +-
 meta/lib/oeqa/sdk/cases/buildepoxy.py         |   2 +-
 meta/lib/oeqa/selftest/cases/prservice.py     |   2 +-
 meta/recipes-bsp/u-boot/u-boot.inc            |   4 +-
 .../libxml/libxml2/CVE-2022-40303.patch       | 624 ++++++++++++++++++
 .../libxml/libxml2/CVE-2022-40304.patch       | 106 +++
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |   2 +
 meta/recipes-core/systemd/systemd_251.8.bb    |   2 +-
 ...dk-Search-for-alternative-ld.so.conf.patch |   2 +-
 ...hash_t-instead-of-long-in-PyCOMPS_ha.patch |  66 ++
 .../libcomps/libcomps_0.1.19.bb               |   1 +
 meta/recipes-devtools/lua/lua_5.4.4.bb        |   3 +
 .../meson/meson/meson-wrapper                 |  17 +-
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2022-4144.patch             |  99 +++
 ...y_hash_t-instead-of-long-in-hdr_hash.patch |  35 +
 meta/recipes-devtools/rpm/rpm_4.18.0.bb       |   1 +
 meta/recipes-devtools/vala/vala.inc           |   5 +-
 meta/recipes-extended/shadow/shadow_4.12.3.bb |   3 +
 meta/recipes-gnome/epiphany/epiphany_42.4.bb  |   1 +
 .../epiphany/files/CVE-2023-26081.patch       |  90 +++
 .../recipes-graphics/mesa/mesa-demos_8.5.0.bb |   2 +-
 meta/recipes-kernel/linux/linux-yocto-dev.bb  |   2 -
 .../linux/linux-yocto-rt_5.15.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.15.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto.inc     |   1 -
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 +-
 .../ffmpeg/ffmpeg/ffmpeg-fix-vulkan.patch     |  34 +
 .../recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb |   1 +
 .../libtiff/files/CVE-2022-48281.patch        |  26 +
 .../CVE-2023-0800_0801_0802_0803_0804.patch   | 128 ++++
 meta/recipes-multimedia/libtiff/tiff_4.4.0.bb |   2 +
 ...so-codes_4.12.0.bb => iso-codes_4.13.0.bb} |   2 +-
 ...ttpd_0.9.75.bb => libmicrohttpd_0.9.76.bb} |   2 +-
 meta/recipes-support/vim/vim.inc              |   2 +-
 36 files changed, 1266 insertions(+), 43 deletions(-)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2022-40303.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2022-40304.patch
 create mode 100644 meta/recipes-devtools/libcomps/libcomps/0001-libcomps-Use-Py_hash_t-instead-of-long-in-PyCOMPS_ha.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-4144.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-python-Use-Py_hash_t-instead-of-long-in-hdr_hash.patch
 create mode 100644 meta/recipes-gnome/epiphany/files/CVE-2023-26081.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/ffmpeg-fix-vulkan.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-48281.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-0800_0801_0802_0803_0804.patch
 rename meta/recipes-support/iso-codes/{iso-codes_4.12.0.bb => iso-codes_4.13.0.bb} (94%)
 rename meta/recipes-support/libmicrohttpd/{libmicrohttpd_0.9.75.bb => libmicrohttpd_0.9.76.bb} (90%)

-- 
2.34.1


