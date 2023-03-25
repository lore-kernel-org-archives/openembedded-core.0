Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42980C6FD1C
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 15:58:33 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.24690.1679759907263372105
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Mar 2023 08:58:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=YkVBFOR+;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id le6so4444952plb.12
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Mar 2023 08:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679759906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/6pvNxZyk+eWQR+P+9ybQaGmQhIq9jlpkIV5DbN3oJI=;
        b=YkVBFOR+S7z1bY7D2I6nyvHBL/y6GxIbUdNBBrV9usZ2aLb3+jAEmKZjWMyI5+iznn
         Y6Z4RJ0AqYFmgZkt7LZz1AJU8toe4UYdwlSJgA5rI53FVc77ySdcaFdvHVGomKHud30o
         a0P5goP6C+ILJCEfnALRUBdjs+evS9GdRw7nRMEdR7irNVvYc0wjKfowNuRQlXApG6b9
         tchQj9ipZx5KPmtAsBs3M3ojNmJjfV3lYXUAEySSXCVUPKeTO25bjVLthWBS+WLUdAuq
         wyT1ujEnHXrX5YxeAdy8DHr4LV+phsvIdnqu6HqxBG7pB9UQ39D372HBWyxR0D6tA7oN
         fPhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679759906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/6pvNxZyk+eWQR+P+9ybQaGmQhIq9jlpkIV5DbN3oJI=;
        b=IqpL6uA/ODpzS8jAUbBYMbYreIQNaDDDeruCBi56M4MY0/aoi09mb6WXdUGSf/JVb7
         XO+KKK4BztI96jN00+NQcv9uusqCMUJZFdFm2hJslbxjyQz2xEfYfxvQDgnXPnEp6Ude
         dn4IY76AxW7eRm8nAdJKW89MkQcFKhfs+pZpajV/KzBrZrc04n7q+Kq7zQKW1o0zH3UA
         IGWFfw6+2q/GeVk5nM3uxdtwZ+TsmwNe1vUb3XAazb6E7Z8IDV3Det27CS5EdtVx26qE
         s4mEn/YKzRn5nbNgX2yuve66ABGkmr/4EYJTotxQcDGMZwHd0SbnVS6WGyg5S6BH1CbZ
         XWjw==
X-Gm-Message-State: AO0yUKWYM5UB92b3hvgH7GpaBXMfFtvxLO1o/AmBlwFlU5sIg66hsD6P
	mCDR2UbtpdRvMtoD4m2qIuL3gA1YheuOZ092o5U=
X-Google-Smtp-Source: AK7set8OAB5HOKohsxccp/C3GDXJaYo8KyXctm3hnCNIYHuDKSFkRfoe7DNO1IVWHplH4qm26sMFvQ==
X-Received: by 2002:a05:6a20:3b19:b0:d6:91f5:2b10 with SMTP id c25-20020a056a203b1900b000d691f52b10mr6160524pzh.58.1679759906091;
        Sat, 25 Mar 2023 08:58:26 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id f31-20020a63101f000000b00502f017657dsm15140394pgl.83.2023.03.25.08.58.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 08:58:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 00/21] Pull request (cover letter only)
Date: Sat, 25 Mar 2023 05:58:19 -1000
Message-Id: <cover.1679759775.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Mar 2023 15:58:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179099

The following changes since commit 61f268be804795fadafbc918b465561819b592ec:

  base-files: Drop localhost.localdomain from hosts file (2023-03-16 04:35:11 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/langdale-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/langdale-next

Alexander Kanavin (1):
  devtool/upgrade: do not delete the workspace/recipes directory

Chee Yang Lee (3):
  git: ignore CVE-2023-22743
  tiff: Fix CVE-2023-0795 CVE-2023-0796 CVE-2023-0797 CVE-2023-0798
    CVE-2023-0799
  go: upgrade to 1.19.7

Frederic Martinsons (1):
  cargo.bbclass: use offline mode for building

Khem Raj (1):
  systemd.bbclass: Add /usr/lib/systemd to searchpaths as well

Martin Jansa (3):
  timezone: use 'tz' subdir instead of ${WORKDIR} directly
  tzdata: use separate B instead of WORKDIR for zic output
  tzcode-native: fix build with gcc-13 on host

Mikko Rapeli (1):
  oeqa rtc.py: skip if read-only-rootfs

Mingli Yu (3):
  mdadm: Fix testcase 06wrmostly
  mdadm: fix tests/02lineargrow
  mdadm: Fix raid0 tests

Piotr Łobacz (1):
  systemd: fix wrong nobody-group assignment

Richard Purdie (2):
  pybootchartui: Fix python syntax issue
  pybootchart: Fix extents handling to account for cpu/io/mem pressure
    changes

Romuald JEANNE (1):
  image_types: fix vname var init in multiubi_mkfs() function

Romuald Jeanne (1):
  image_types: fix multiubi var init

Ross Burton (1):
  lib/resulttool: fix typo breaking resulttool log --ptest

Sudip Mukherjee (1):
  libgit2: update license information

Tim Orling (1):
  cracklib: update github branch to 'main'

 meta/classes-recipe/cargo.bbclass             |   2 +-
 meta/classes-recipe/image_types.bbclass       |  16 +-
 meta/classes-recipe/systemd.bbclass           |   1 +
 meta/lib/oeqa/runtime/cases/rtc.py            |   8 +-
 meta/recipes-core/systemd/systemd_251.8.bb    |   2 +-
 meta/recipes-devtools/git/git_2.37.6.bb       |   2 +
 .../go/{go-1.19.4.inc => go-1.19.7.inc}       |   2 +-
 ...e_1.19.4.bb => go-binary-native_1.19.7.bb} |   4 +-
 ..._1.19.4.bb => go-cross-canadian_1.19.7.bb} |   0
 ...{go-cross_1.19.4.bb => go-cross_1.19.7.bb} |   0
 ...osssdk_1.19.4.bb => go-crosssdk_1.19.7.bb} |   0
 ...o-native_1.19.4.bb => go-native_1.19.7.bb} |   0
 ...runtime_1.19.4.bb => go-runtime_1.19.7.bb} |   0
 .../go/{go_1.19.4.bb => go_1.19.7.bb}         |   0
 .../cracklib/cracklib_2.9.8.bb                |   2 +-
 ...-Fix-optional-write-behind-parameter.patch |  45 +++
 ...d-a-test-that-validates-raid0-with-l.patch |  41 +++
 ...-Run-udevadm-settle-before-setting-r.patch |  39 +++
 ...ow-clear-the-superblock-at-every-ite.patch |  33 ++
 ...metadata-avoid-passing-chunk-size-to.patch |  41 +++
 ...ts-fix-raid0-tests-for-0.90-metadata.patch | 102 ++++++
 meta/recipes-extended/mdadm/mdadm_4.2.bb      |   6 +
 meta/recipes-extended/timezone/timezone.inc   |   6 +-
 .../timezone/tzcode-native.bb                 |   3 +-
 ...0001-Fix-C23-related-conformance-bug.patch | 301 ++++++++++++++++++
 meta/recipes-extended/timezone/tzdata.bb      |  16 +-
 .../CVE-2023-0795_0796_0797_0798_0799.patch   | 154 +++++++++
 meta/recipes-multimedia/libtiff/tiff_4.4.0.bb |   1 +
 meta/recipes-support/libgit2/libgit2_1.5.1.bb |   2 +-
 scripts/lib/devtool/upgrade.py                |   3 -
 scripts/lib/resulttool/resultutils.py         |   2 +-
 scripts/pybootchartgui/pybootchartgui/draw.py |   6 +
 .../pybootchartgui/pybootchartgui/parsing.py  |   2 +-
 33 files changed, 810 insertions(+), 32 deletions(-)
 rename meta/recipes-devtools/go/{go-1.19.4.inc => go-1.19.7.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.19.4.bb => go-binary-native_1.19.7.bb} (84%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.19.4.bb => go-cross-canadian_1.19.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.19.4.bb => go-cross_1.19.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.19.4.bb => go-crosssdk_1.19.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.19.4.bb => go-native_1.19.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.19.4.bb => go-runtime_1.19.7.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.19.4.bb => go_1.19.7.bb} (100%)
 create mode 100644 meta/recipes-extended/mdadm/files/0001-mdadm-Fix-optional-write-behind-parameter.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0001-tests-00raid0-add-a-test-that-validates-raid0-with-l.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0001-tests-00readonly-Run-udevadm-settle-before-setting-r.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0001-tests-02lineargrow-clear-the-superblock-at-every-ite.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0001-tests-04update-metadata-avoid-passing-chunk-size-to.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0001-tests-fix-raid0-tests-for-0.90-metadata.patch
 create mode 100644 meta/recipes-extended/timezone/tzcode/0001-Fix-C23-related-conformance-bug.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-0795_0796_0797_0798_0799.patch

-- 
2.34.1


