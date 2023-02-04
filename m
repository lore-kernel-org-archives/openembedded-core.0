Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68A76C636CC
	for <webhook@archiver.kernel.org>; Sat,  4 Feb 2023 14:29:31 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.7193.1675520962754801070
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Feb 2023 06:29:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=cNYmmwA1;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id u9so3698016plf.3
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Feb 2023 06:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=6ZReV2tT2jcvy1CzS5TMhUROrI6S7iLurX3k0FqVgms=;
        b=cNYmmwA1JPoRyz+jRdEQGI4+E66YP3ULvYT99oNNCrDw2+6etjnEv/j/Sn20xx5PdP
         DWrNUSxDTRYuievDNjl6j01vOWgbng3J+GrcqSocVMml0lww3HFCPLTFYIZcz69/lx5J
         x7lc+iGQBrY2doJYokFsY95ebRUmzg0Xv68ESfRc0GGwkNGYQ1d48/CwJjuRWLGGqj7Q
         SqTulj23odZB/6NFmM+PETYiJxYbCBeg2ieB+Mw8Vi8c0lpZrousp5/wR5oH+EODhF5m
         d9iiSOo8bxAob99PPqANuqE65LTLe+gK60QgXv/NgvMoROIfuuN8qhShgNLqLqDdfNrb
         ILsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6ZReV2tT2jcvy1CzS5TMhUROrI6S7iLurX3k0FqVgms=;
        b=QWGOCRavsRLqx7wiV48YolvYjwRxzpUPkMwH75Yvz4YEG0gpYbjOJFOnm7+ysokE6j
         qWHNdZNJSrAcpQK1cH3KpieMswS9V+Vpme5JJr0H6pwocTyr/5ACroiTr8puVzaQZiAt
         tubCcoZ/6Oh6BrCHkrNHChDZujRO+jpi7502gB6tCdnUBQVN4g9XODCZ+CRalpBtVrqa
         4B6LRZjvAvOMH0V7/BnqjFVvhh1YMzJfLm2rHYY82pSs6H+p3af1LqTsFn+gYcu4uMTk
         oPCKIMvlxU1xdVhRrL5W1sNq0KSUhlirLhxiHkr+mKnoIcw9dcdtkwiGyLn4JGWLc81l
         PLew==
X-Gm-Message-State: AO0yUKUZnaLKTIAUJlxpNBrqKfvJcKXLn4CZHYE20Amzk/O3uFHrI87z
	tm4uWtK8KK+TkSgZNWUBYMPLELkJ2pbi2CB6RFs=
X-Google-Smtp-Source: AK7set8in5JcJ1+gu3HXbQqcrILtPv22pS3IGjo/BXvFYCr0nahuq9sIqsSh6eCLzDsjO8Nd8Mfr1A==
X-Received: by 2002:a05:6a20:2d0a:b0:bf:ae32:5ed0 with SMTP id g10-20020a056a202d0a00b000bfae325ed0mr9275035pzl.13.1675520961422;
        Sat, 04 Feb 2023 06:29:21 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id l6-20020a639846000000b004768b74f208sm3396026pgo.4.2023.02.04.06.29.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Feb 2023 06:29:20 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 00/17] Pull request (cover letter only)
Date: Sat,  4 Feb 2023 04:29:15 -1000
Message-Id: <cover.1675520886.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Feb 2023 14:29:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176763

The following changes since commit cfd9f549a0d5dd44f4c71bd077b5fd17d3683550:

  selftest/virgl: use pkg-config from the host (2023-01-19 16:28:32 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/langdale-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/langdale-next

Armin Kuster (1):
  lttng-modules: Fix for 5.10.163 kernel version

Bruce Ashfield (1):
  linux-yocto/5.15: update to v5.15.87

He Zhe (1):
  lttng-modules: update 2.13.7 -> 2.13.8

Khem Raj (4):
  createrepo-c: Include missing rpm/rpmstring.h
  libtirpc: Check if file exists before operating on it
  libusb1: Link with latomic only if compiler has no atomic builtins
  libusb1: Strip trailing whitespaces

Niko Mauno (1):
  Fix missing leading whitespace with ':append'

Peter Kjellerstedt (1):
  librsvg: Only enable the Vala bindings if GObject Introspection is
    enabled

Richard Purdie (1):
  native: Drop special variable handling

Ross Burton (4):
  ppp: backport fix for CVE-2022-4603
  quilt: fix intermittent failure in faildiff.test
  spirv-headers/spirv-tools: set correct branch name
  quilt: use upstreamed faildiff.test fix

Thomas Roos (1):
  devtool: fix devtool finish when gitmodules file is empty

Vivek Kumbhar (1):
  openssl: fix CVE-2022-3996 double locking leads to denial of service

Xiangyu Chen (1):
  numactl: skip test case when target platform doesn't have 2 CPU node

 meta/classes-recipe/core-image.bbclass        |  2 +-
 meta/classes-recipe/native.bbclass            |  2 +-
 meta/classes-recipe/populate_sdk_ext.bbclass  |  2 +-
 meta/classes/externalsrc.bbclass              |  2 +-
 .../distro/include/ptest-packagelists.inc     |  2 +-
 .../openssl/openssl/CVE-2022-3996.patch       | 43 +++++++++++++
 .../openssl/openssl_3.0.7.bb                  |  1 +
 .../ppp/ppp/CVE-2022-4603.patch               | 48 +++++++++++++++
 meta/recipes-connectivity/ppp/ppp_2.4.9.bb    |  1 +
 .../0001-include-rpm-rpmstring.h.patch        | 27 ++++++++
 .../createrepo-c/createrepo-c_0.20.1.bb       |  1 +
 meta/recipes-devtools/quilt/quilt.inc         |  1 +
 .../quilt/quilt/faildiff-order.patch          | 41 +++++++++++++
 .../libtirpc/libtirpc_1.3.3.bb                |  2 +-
 meta/recipes-gnome/librsvg/librsvg_2.54.5.bb  |  4 +-
 .../spir/spirv-headers_1.3.216.0.bb           |  2 +-
 .../spir/spirv-tools_1.3.216.0.bb             |  2 +-
 .../linux/linux-yocto-rt_5.15.bb              |  6 +-
 .../linux/linux-yocto-tiny_5.15.bb            |  6 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 ++++----
 .../fix-jbd2-upper-bound-for-v5.10.163.patch  | 52 ++++++++++++++++
 ...e-the-correct-print-format-v5.10.163.patch | 61 +++++++++++++++++++
 ...ules_2.13.7.bb => lttng-modules_2.13.8.bb} |  4 +-
 ...k-with-latomic-only-if-no-atomic-bui.patch | 46 ++++++++++++++
 meta/recipes-support/libusb/libusb1_1.0.26.bb | 13 ++--
 .../numactl/Fix-the-test-output-format.patch  |  3 +-
 .../recipes-support/numactl/numactl/run-ptest |  6 +-
 27 files changed, 368 insertions(+), 38 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2022-3996.patch
 create mode 100644 meta/recipes-connectivity/ppp/ppp/CVE-2022-4603.patch
 create mode 100644 meta/recipes-devtools/createrepo-c/createrepo-c/0001-include-rpm-rpmstring.h.patch
 create mode 100644 meta/recipes-devtools/quilt/quilt/faildiff-order.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-upper-bound-for-v5.10.163.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-use-the-correct-print-format-v5.10.163.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.7.bb => lttng-modules_2.13.8.bb} (87%)
 create mode 100644 meta/recipes-support/libusb/libusb1/0001-configure.ac-Link-with-latomic-only-if-no-atomic-bui.patch

-- 
2.25.1


