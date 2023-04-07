Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DF5FC6FD1D
	for <webhook@archiver.kernel.org>; Fri,  7 Apr 2023 14:08:55 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.8887.1680876531270898561
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Apr 2023 07:08:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=nn0pAawf;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id l7so39834950pjg.5
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Apr 2023 07:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680876530; x=1683468530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=eHVXgQ08G7baUiZ6HM1gKAywfsg7QoGFXHtr8xls5SY=;
        b=nn0pAawfxaGS+UwSYl4uaLX37eIDt3PNArctLSjLMaUdJuP7XvvaYBAZsTRnZGvfcE
         gtWIu0hiMba1x53PD5q/bwxE78fqrmQbOdixS6ch7geyZQcQe1DtPI41zH15azQvA0Un
         Gtcmvpg/pjw0HvuIIBOfsIV84nvIy010bFxWtxxdUjLTC6zunKx6E5zDxNefETToRYxG
         LK886J8hCJRnxfGAp8d66Ze1k8gza4xOmdp5Ur2AHGWvbspy9mkGvSPYcd7vsJBSySeK
         GaIwQGbN1GreSYk68q0h/8rgNZtJXlShXhvKtJL7m3LlZCXYhfnqtCND8kPnw3LNk6Z5
         L7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680876530; x=1683468530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eHVXgQ08G7baUiZ6HM1gKAywfsg7QoGFXHtr8xls5SY=;
        b=t14iPMBmfyjbvBF1RN5qY0ObLV0Ci8QXrZ6TdNKCaCWgbgp/cgMzAji9mT2rZ8qY2m
         x4LCBt3glNBEpMd8U/vLhftXGz9u8lP+MghHK8WZpOOyqBHraWjxYVBo1zPs8rmXNNCi
         Tln7LXCu8+D4ocW3P4oB202VSkpSwlF1L30O4O7iWG2Lt+OdhcVJn8HNpIAGUcpmRCDT
         e6E4bvcbtx/5UZ60ZyYH+OQz8ajQ0C+2mY+nXrOZqi9Xunkgxz8b+hya9outM/J8CL7R
         imv99UJzCLIl7P3S5gYephpSEG64cep2i6iiJNl69VYf8UsmM0b9QCyvefX/G7672N8K
         Pjiw==
X-Gm-Message-State: AAQBX9dKuPhthog+lNu61y5mtr6NUMxBd12vTuyXsJqjYSTwRxJhE9Dn
	Ym7ooBEpdV/KJwS0lc2kgDcyMhoGpk5jrQ1A27I=
X-Google-Smtp-Source: AKy350aLoHxUrTf+bH7QvgigkP5dRexU2ZhFadT/h74rHFeGNWDAsanYbyE9IrK72BjYcRkIB+Vxkw==
X-Received: by 2002:a17:902:e491:b0:1a4:f1cd:c286 with SMTP id i17-20020a170902e49100b001a4f1cdc286mr2453278ple.9.1680876530021;
        Fri, 07 Apr 2023 07:08:50 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id j10-20020a17090276ca00b001a21b871824sm2985333plt.119.2023.04.07.07.08.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 07:08:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/27] Pull request (cover letter only)
Date: Fri,  7 Apr 2023 04:08:40 -1000
Message-Id: <cover.1680876441.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Apr 2023 14:08:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179820

This is the final pull request for the 4.0.9 release build.

The following changes since commit 08ab1f02da65ee9815115e6a1cdb51ffed10a2dc:

  systemd: fix wrong nobody-group assignment (2023-03-23 06:42:22 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-next

Alexander Kanavin (1):
  patchelf: replace a rejected patch with an equivalent
    uninative.bbclass tweak

Bruce Ashfield (10):
  linux-yocto/5.10: update to v5.10.162
  linux-yocto/5.10: update to v5.10.164
  linux-yocto/5.10: update to v5.10.166
  linux-yocto/5.10: update to v5.10.168
  linux-yocto/5.10: update to v5.10.170
  linux-yocto/5.10: update to v5.10.172
  linux-yocto/5.10: update to v5.10.175
  lttng-modules: update to v2.13.9
  linux-yocto/5.15: update to v5.15.98
  linux-yocto/5.15: update to v5.15.103

Geoffrey GIRY (1):
  cve-check: Fix false negative version issue

Khem Raj (2):
  rsync: Add missing prototypes to function declarations
  rsync: Turn on -pedantic-errors at the end of 'configure'

Martin Jansa (2):
  selftest: devtool: set BB_HASHSERVE_UPSTREAM when setting
    SSTATE_MIRROR
  bmap-tools: switch to main branch

Michael Halstead (2):
  uninative: Upgrade to 3.8.1 to include libgcc
  uninative: Upgrade to 3.9 to include glibc 2.37

Peter Marko (1):
  gcc-shared-source: do not use ${S}/.. in deploy_source_date_epoch

Randy MacLeod (1):
  vim: upgrade 9.0.1403 -> 9.0.1429

Ross Burton (1):
  scripts/lib/buildstats: handle top-level build_stats not being
    complete

Sakib Sajal (1):
  go: fix CVE-2022-2879 and CVE-2022-41720

Shubham Kulkarni (1):
  go-runtime: Security fix for CVE-2022-41723

Siddharth Doshi (1):
  openssl: Security fix for CVE-2023-0464, CVE-2023-0465, CVE-2023-0466

Simone Weiss (1):
  json-c: Add ptest for json-c

pawan (2):
  Revert "qemu: fix CVE-2021-3507"
  curl: Add fix for CVE-2023-23916

 meta/classes/cve-check.bbclass                |   5 +-
 meta/classes/uninative.bbclass                |   2 +
 .../distro/include/ptest-packagelists.inc     |   1 +
 meta/conf/distro/include/yocto-uninative.inc  |  10 +-
 meta/lib/oe/cve_check.py                      |  39 ++
 meta/lib/oeqa/selftest/cases/cve_check.py     |  19 +
 meta/lib/oeqa/selftest/cases/devtool.py       |   1 +
 .../openssl/openssl/CVE-2023-0464.patch       | 225 ++++++++
 .../openssl/openssl/CVE-2023-0465.patch       |  56 ++
 .../openssl/openssl/CVE-2023-0466.patch       |  50 ++
 .../openssl/openssl_3.0.8.bb                  |   3 +
 .../gcc/gcc-shared-source.inc                 |   4 +-
 meta/recipes-devtools/go/go-1.17.13.inc       |   3 +
 .../go/go-1.18/CVE-2022-2879.patch            | 177 ++++++
 .../go/go-1.18/CVE-2022-41720.patch           | 514 ++++++++++++++++++
 .../go/go-1.18/CVE-2022-41723.patch           | 156 ++++++
 meta/recipes-devtools/json-c/json-c/run-ptest |  20 +
 meta/recipes-devtools/json-c/json-c_0.15.bb   |  16 +-
 .../patchelf/handle-read-only-files.patch     |  65 ---
 .../patchelf/patchelf_0.14.5.bb               |   1 -
 meta/recipes-devtools/qemu/qemu.inc           |   2 -
 .../qemu/qemu/CVE-2021-3507_1.patch           |  92 ----
 .../qemu/qemu/CVE-2021-3507_2.patch           | 115 ----
 ...-prototypes-to-function-declarations.patch | 173 ++++++
 ...antic-errors-at-the-end-of-configure.patch |  68 +++
 meta/recipes-devtools/rsync/rsync_3.2.5.bb    |   2 +
 .../linux/linux-yocto-rt_5.10.bb              |   6 +-
 .../linux/linux-yocto-rt_5.15.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |   8 +-
 .../linux/linux-yocto-tiny_5.15.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |  24 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 +-
 ...ccessor-helpers-into-accessors.h-v6..patch |  45 --
 .../fix-jbd2-upper-bound-for-v5.10.163.patch  |  52 --
 ...e-the-correct-print-format-v5.10.163.patch |  61 ---
 ...ules_2.13.8.bb => lttng-modules_2.13.9.bb} |   5 +-
 .../bmap-tools/bmap-tools_git.bb              |   2 +-
 .../curl/curl/CVE-2023-23916.patch            | 219 ++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |   1 +
 meta/recipes-support/vim/vim.inc              |   4 +-
 scripts/lib/buildstats.py                     |   1 +
 41 files changed, 1797 insertions(+), 488 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-0464.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-0465.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-0466.patch
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2022-2879.patch
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2022-41720.patch
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2022-41723.patch
 create mode 100644 meta/recipes-devtools/json-c/json-c/run-ptest
 delete mode 100644 meta/recipes-devtools/patchelf/patchelf/handle-read-only-files.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3507_1.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3507_2.patch
 create mode 100644 meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
 create mode 100644 meta/recipes-devtools/rsync/files/0001-Turn-on-pedantic-errors-at-the-end-of-configure.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-btrfs-move-accessor-helpers-into-accessors.h-v6..patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-upper-bound-for-v5.10.163.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-use-the-correct-print-format-v5.10.163.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.8.bb => lttng-modules_2.13.9.bb} (83%)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-23916.patch

-- 
2.34.1


