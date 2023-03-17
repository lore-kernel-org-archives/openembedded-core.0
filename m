Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBEF0C6FD1D
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 22:12:51 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.83.1679091166014111080
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Mar 2023 15:12:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=BFBKrY2z;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id qe8-20020a17090b4f8800b0023f07253a2cso6712384pjb.3
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 15:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679091165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=v5f6GPlKoaFOQHY6T4P1QDjBNevoxs+ub+vLHxYsur8=;
        b=BFBKrY2zGXxhZnhyi7lJOOdPkDEyQTKAylhav5zw7VVpSu+3XaCLj58v1qECzN3tZf
         MtruDr5p9IBhQeS4+FlzqwgXzGti7PxmUhshmJXJclptAEDYVscNZHkXh3EozGfvxLB5
         JsjBW7UUKQc/P6HHljCdrY1Of2t15aM9C9oDUEYhu7E1Syxg+yqNlqgp7xtu79LYTH6E
         0xHPMKbLTSoYYGfZkP5ReKzxqR48f9DTUtm2uluWJwVhHNvE0vbtpJOsEFPRxta/fN0T
         jiWQ84BAYZovCGh5YWFrb6wYz3pBQQwG8iYKgAqefCwUxgjr9shQUtB7Y2IQohPJHU+M
         vZBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679091165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v5f6GPlKoaFOQHY6T4P1QDjBNevoxs+ub+vLHxYsur8=;
        b=iKp6mdMzboSpgohbkhEVCiB0B1Qqxj7uupGeGrne/fPO2UovmfB1WCiAFhf/huusgW
         TYWUOICE9Dolp4XxDLo6DNdjNHujuUFoeTFQL2kF4Eqoh9xv81k8ICnE5Ca8K6V5g9lT
         J3Vvz0C+fHWlz4NDNYwKcTyQuIlxTLTM0F8/YKxxGFi4NMUSc3+hJyMnDYidJqVE36jS
         DnhvD+iCjnvV3ULH4/Yblhcq4KcYD5V2MrvFeHAViFsgCdp39Jd2nAN6xqpyJKuQvSvX
         QxUayp8z+cUD+elf2c2GRpR+bxkrDJ/PZEyH+lPdUPRD/kqGsXNXfl/mJIKLcnTn4/sb
         ykTg==
X-Gm-Message-State: AO0yUKVEEe9lmjLPHE9UP+RicWkyChxO4ZJ8dF4DE9bvGH1v+DDrwwcQ
	6TCCtsqMJbZGXP0c5WWkQv2qsx4zTKJO/w/FKEE=
X-Google-Smtp-Source: AK7set/CFYUxKVJOnMTnr4RHvmQgmzOyy3Kq2rORlnwYvSqIwoPuAxHXLFfhzidudh1uzGlrRn0QOA==
X-Received: by 2002:a17:90b:4d0e:b0:23f:635e:51e9 with SMTP id mw14-20020a17090b4d0e00b0023f635e51e9mr3029645pjb.8.1679091164593;
        Fri, 17 Mar 2023 15:12:44 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id gk12-20020a17090b118c00b002369d3b282csm1847520pjb.40.2023.03.17.15.12.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 15:12:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/22] Pull request (cover letter only)
Date: Fri, 17 Mar 2023 12:12:38 -1000
Message-Id: <cover.1679091104.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 22:12:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178760

The following changes since commit 9e8cbf46fe6e4e257b76b228de56d4a891199896:

  nghttp2: never build python bindings (2023-03-06 04:10:00 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-next

Bruce Ashfield (3):
  linux-yocto/5.15: update to v5.15.94
  linux-yocto/5.15: update to v5.15.96
  linux-yocto-rt/5.15: update to -rt59

Chee Yang Lee (1):
  tiff: fix multiple CVEs

Ming Liu (1):
  linux: inherit pkgconfig in kernel.bbclass

Narpat Mali (1):
  libmicrohttpd: upgrade 0.9.75 -> 0.9.76

Peter Marko (1):
  systemd: add group sgx to udev package

Poonam (1):
  python3-setuptools-rust-native: Add direct dependency of native
    python3 modules

Richard Purdie (2):
  binutils: Fix nativesdk ld.so search
  oeqa/selftest/prservice: Improve debug output for failure

Ross Burton (2):
  shadow: ignore CVE-2016-15024
  vim: add missing pkgconfig inherit

Shubham Kulkarni (1):
  glibc: Security fix for CVE-2023-0687

Siddharth Doshi (2):
  epiphany: Security fix for CVE-2023-26081
  harfbuzz: Security fix for CVE-2023-25193

Tom Hochstein (2):
  meson: Fix wrapper handling of implicit setup command
  oeqa/sdk: Improve Meson test

Vivek Kumbhar (1):
  gnutls: fix CVE-2023-0361 timing side-channel in the TLS RSA key
    exchange code

Wang Mingyu (3):
  iso-codes: upgrade 4.12.0 -> 4.13.0
  lua: Fix install conflict when enable multilib.
  vala: Fix install conflict when enable multilib.

Xiangyu Chen (1):
  sudo: update 1.9.12p2 -> 1.9.13p3

 meta-selftest/files/static-group              |   1 +
 meta/classes/kernel.bbclass                   |   2 +-
 meta/lib/oeqa/sdk/cases/buildepoxy.py         |   2 +-
 meta/lib/oeqa/selftest/cases/prservice.py     |   2 +-
 .../glibc/glibc/CVE-2023-0687.patch           |  82 ++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |   1 +
 meta/recipes-core/systemd/systemd_250.5.bb    |   2 +-
 ...dk-Search-for-alternative-ld.so.conf.patch |   2 +-
 meta/recipes-devtools/lua/lua_5.4.4.bb        |   3 +
 .../meson/meson/meson-wrapper                 |  17 +-
 .../python3-setuptools-rust-native_1.1.2.bb   |   4 +-
 meta/recipes-devtools/vala/vala.inc           |   5 +-
 meta/recipes-extended/shadow/shadow_4.11.1.bb |   3 +
 ...o.conf.in-fix-conflict-with-multilib.patch |  21 +-
 meta/recipes-extended/sudo/sudo.inc           |   2 +-
 .../{sudo_1.9.12p2.bb => sudo_1.9.13p3.bb}    |   2 +-
 meta/recipes-gnome/epiphany/epiphany_42.4.bb  |   1 +
 .../epiphany/files/CVE-2023-26081.patch       |  90 +++++++++
 .../harfbuzz/CVE-2023-25193-pre1.patch        | 135 +++++++++++++
 .../harfbuzz/harfbuzz/CVE-2023-25193.patch    | 185 ++++++++++++++++++
 .../harfbuzz/harfbuzz_4.0.1.bb                |   4 +-
 meta/recipes-kernel/linux/linux-yocto-dev.bb  |   2 -
 .../linux/linux-yocto-rt_5.15.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.15.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto.inc     |   1 -
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 +--
 .../libtiff/tiff/CVE-2022-48281.patch         |  26 +++
 .../CVE-2023-0800_0801_0802_0803_0804.patch   | 128 ++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |   2 +
 .../gnutls/gnutls/CVE-2023-0361.patch         |  85 ++++++++
 meta/recipes-support/gnutls/gnutls_3.7.4.bb   |   1 +
 ...so-codes_4.12.0.bb => iso-codes_4.13.0.bb} |   2 +-
 ...ttpd_0.9.75.bb => libmicrohttpd_0.9.76.bb} |   2 +-
 meta/recipes-support/vim/vim.inc              |   2 +-
 34 files changed, 799 insertions(+), 56 deletions(-)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2023-0687.patch
 rename meta/recipes-extended/sudo/{sudo_1.9.12p2.bb => sudo_1.9.13p3.bb} (96%)
 create mode 100644 meta/recipes-gnome/epiphany/files/CVE-2023-26081.patch
 create mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193-pre1.patch
 create mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2022-48281.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-0800_0801_0802_0803_0804.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2023-0361.patch
 rename meta/recipes-support/iso-codes/{iso-codes_4.12.0.bb => iso-codes_4.13.0.bb} (94%)
 rename meta/recipes-support/libmicrohttpd/{libmicrohttpd_0.9.75.bb => libmicrohttpd_0.9.76.bb} (91%)

-- 
2.34.1


