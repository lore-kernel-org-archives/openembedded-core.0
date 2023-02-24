Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CDF4C64ED6
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 02:59:06 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.9194.1677207541126312061
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Feb 2023 18:59:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=aE0e2wG8;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id e9so10298316plh.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 18:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=yl2Fi/P4ZPcjz/SMDi8hcNxPQKkPlA08znzg1KpZnRU=;
        b=aE0e2wG8Maw8Qoxij0mSYzLi+CRVMXVveGB7RLlrXcgVqLqTEgJHev4FBFVbWAUEbZ
         u56TlDf6bofKw50TqwS7/gzU9X6UyGwe2blJeyMqV0hiNZiJwwglFvBjRdkISDX9Lcix
         GwWLEIcUoMUVOB0TCxlppywlxpPJI7/W/Mzj8rcrSW1a+ALAnKbwdyTCvTYhfceuPVM2
         p5Ofg4AqPdF+38YcihMbDo2wWzSbUwF6+DDcnTGwylhF2FSQ45B0hDyW1gAtzSjvY1nG
         ga+OEnBBYSx+GTHxYpLT5qrGc90wR0O+OQv/VcIlOIDoDorf/Gsm6rDI+YzX52rKsHki
         I0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yl2Fi/P4ZPcjz/SMDi8hcNxPQKkPlA08znzg1KpZnRU=;
        b=0YU65YknPaA75EiMEB2pTqH4dtT7nvRMtOjGOyhgo1yDKLUhP7gA8s01lNNxTSVvG6
         YjZYORWy1zKGXUZ8bCQsOT2RIjoxvBnztnQU4sUm29E9nIchOnJTDnMucHAy2y1/ohUJ
         wBoBfpv+XMOJUCfYPyWLtIIQktuKOytbMdIqG0B5gh0wE7K+Mq4VqvPm/x5eCg11ZLpD
         dzAVaQ8WPNwfUNQyFBt9KzCxbJhjB8r6zLH1o9ZbpT9TPBBg///2dYWrfFzuDnaSiC15
         RVtGS9NzemwYBLxg1riV2SrRFJ5hOpi4WmFGc1tx2l7IYCuN+wtPTQDry5yn1lcsTfPo
         dv/Q==
X-Gm-Message-State: AO0yUKV5YiL0mP4jiQ2xNBx+p0L3Us/liZshZ7tXXmmxIeCfglBKpB1q
	TVUatPDBcQGwaOdyVKrekIubV/ZKld+fEMOXDpU=
X-Google-Smtp-Source: AK7set9JblfZvmZ3/WZn+tDUZOg7fssBESf66tMhgtGv89Udj8WhyR03uS8KagtxAWjdFSRiiW9lRA==
X-Received: by 2002:a17:90b:384d:b0:234:31f3:e00f with SMTP id nl13-20020a17090b384d00b0023431f3e00fmr15837188pjb.43.1677207539775;
        Thu, 23 Feb 2023 18:58:59 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id k8-20020a637b48000000b004ecd14297f2sm6530633pgn.10.2023.02.23.18.58.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 18:58:59 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/23] Pull request (cover letter only)
Date: Thu, 23 Feb 2023 16:58:52 -1000
Message-Id: <cover.1677207345.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 02:59:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177653

This is the final pull request for the upcoming 4.0.8 release.

The following changes since commit 54c30e509074073b99a7a8890482ba1af2abbab9:

  oeqa context.py: fix --target-ip comment to include ssh port number (2023-02-11 04:06:51 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-next

Alexander Kanavin (8):
  diffutils: update 3.8 -> 3.9
  lttng-tools: update 2.13.8 -> 2.13.9
  apr: update 1.7.0 -> 1.7.2
  apr-util: update 1.6.1 -> 1.6.3
  bind: upgrade 9.18.10 -> 9.18.11
  libjpeg-turbo: upgrade 2.1.4 -> 2.1.5
  linux-firmware: upgrade 20221214 -> 20230117
  sudo: upgrade 1.9.12p1 -> 1.9.12p2

Alexandre Belloni (1):
  oeqa/selftest/bbtests: Update message lookup for
    test_git_unpack_nonetwork_fail

Kai Kang (1):
  qemu: fix compile error

Mauro Queiros (1):
  image.bbclass: print all QA functions exceptions

Mikko Rapeli (6):
  oeqa ssh.py: move output prints to new line
  oeqa ssh.py: add connection keep alive options to ssh client
  oeqa dump.py: add error counter and stop after 5 failures
  oeqa qemurunner: read more data at a time from serial
  oeqa qemurunner.py: add timeout to QMP calls
  oeqa qemurunner.py: try to avoid reading one character at a time

Peter Kjellerstedt (1):
  devshell: Do not add scripts/git-intercept to PATH

Rodolfo Quesada Zumbado (1):
  tar: CVE-2022-48303

Sakib Sajal (1):
  git: upgrade 2.35.6 -> 2.35.7

Steve Sakoman (2):
  libgit2: uprade 1.4.3 -> 1.4.4
  libgit2: upgrade 1.4.4 -> 1.4.5

Ulrich Ölmann (1):
  update-alternatives: fix typos

 meta/classes/devshell.bbclass                 |   2 -
 meta/classes/image.bbclass                    |   2 +-
 meta/classes/update-alternatives.bbclass      |   6 +-
 meta/lib/oeqa/core/target/ssh.py              |   8 +-
 meta/lib/oeqa/selftest/cases/bbtests.py       |   2 +-
 meta/lib/oeqa/utils/dump.py                   |  23 +-
 meta/lib/oeqa/utils/qemurunner.py             |   9 +-
 ...1-avoid-start-failure-with-bind-user.patch |   0
 ...d-V-and-start-log-hide-build-options.patch |   0
 ...ching-for-json-headers-searches-sysr.patch |   0
 .../bind/{bind-9.18.10 => bind-9.18.11}/bind9 |   0
 .../{bind-9.18.10 => bind-9.18.11}/conf.patch |   0
 .../generate-rndc-key.sh                      |   0
 ...t.d-add-support-for-read-only-rootfs.patch |   0
 .../make-etc-initd-bind-stop-work.patch       |   0
 .../named.service                             |   0
 .../bind/{bind_9.18.10.bb => bind_9.18.11.bb} |   4 +-
 .../git/{git_2.35.6.bb => git_2.35.7.bb}      |   2 +-
 meta/recipes-devtools/qemu/qemu.inc           |   2 +
 ...ave-qxl_log_command-Return-early-if-.patch |  57 +++++
 ...ass-requested-buffer-size-to-qxl_phy.patch | 217 ++++++++++++++++++
 ...001-Skip-strip-trailing-cr-test-case.patch |  11 +-
 ...a-standard-layout-so-glibc-and-musl-.patch |  33 ---
 .../{diffutils_3.8.bb => diffutils_3.9.bb}    |   3 +-
 .../{sudo_1.9.12p1.bb => sudo_1.9.12p2.bb}    |   2 +-
 .../tar/tar/CVE-2022-48303.patch              |  43 ++++
 meta/recipes-extended/tar/tar_1.34.bb         |   4 +-
 ...-turbo_2.1.4.bb => libjpeg-turbo_2.1.5.bb} |   2 +-
 ...20221214.bb => linux-firmware_20230117.bb} |   6 +-
 .../lttng/lttng-tools/determinism.patch       |  64 ------
 ...-tools_2.13.8.bb => lttng-tools_2.13.9.bb} |   3 +-
 .../0001-Fix-error-handling-in-gdbm.patch     | 134 -----------
 .../{apr-util_1.6.1.bb => apr-util_1.6.3.bb}  |   6 +-
 ...ion-to-disable-timed-dependant-tests.patch |  20 +-
 ...CHE_CHECK-for-strerror_r-return-type.patch |  52 -----
 ...-runtime-test-for-mmap-that-can-map-.patch |  26 +--
 ...ir-path-references-from-installed-ap.patch |  25 +-
 ...configure.in-support-cross-compiling.patch |  63 -----
 ...ze-doesn-t-match-in-glibc-when-cross.patch |  76 ------
 .../apr/apr/CVE-2021-35940.patch              |  58 -----
 .../recipes-support/apr/apr/autoconf270.patch |  22 --
 .../apr/apr/libtoolize_check.patch            |  21 +-
 .../apr/{apr_1.7.0.bb => apr_1.7.2.bb}        |   8 +-
 .../{libgit2_1.4.3.bb => libgit2_1.4.5.bb}    |   2 +-
 44 files changed, 430 insertions(+), 588 deletions(-)
 rename meta/recipes-connectivity/bind/{bind-9.18.10 => bind-9.18.11}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.10 => bind-9.18.11}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.10 => bind-9.18.11}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.10 => bind-9.18.11}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.10 => bind-9.18.11}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.10 => bind-9.18.11}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.10 => bind-9.18.11}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.10 => bind-9.18.11}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.10 => bind-9.18.11}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.10.bb => bind_9.18.11.bb} (96%)
 rename meta/recipes-devtools/git/{git_2.35.6.bb => git_2.35.7.bb} (98%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-Have-qxl_log_command-Return-early-if-.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-Pass-requested-buffer-size-to-qxl_phy.patch
 delete mode 100644 meta/recipes-extended/diffutils/diffutils/0001-mcontext-is-not-a-standard-layout-so-glibc-and-musl-.patch
 rename meta/recipes-extended/diffutils/{diffutils_3.8.bb => diffutils_3.9.bb} (88%)
 rename meta/recipes-extended/sudo/{sudo_1.9.12p1.bb => sudo_1.9.12p2.bb} (96%)
 create mode 100644 meta/recipes-extended/tar/tar/CVE-2022-48303.patch
 rename meta/recipes-graphics/jpeg/{libjpeg-turbo_2.1.4.bb => libjpeg-turbo_2.1.5.bb} (97%)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20221214.bb => linux-firmware_20230117.bb} (99%)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/determinism.patch
 rename meta/recipes-kernel/lttng/{lttng-tools_2.13.8.bb => lttng-tools_2.13.9.bb} (98%)
 delete mode 100644 meta/recipes-support/apr/apr-util/0001-Fix-error-handling-in-gdbm.patch
 rename meta/recipes-support/apr/{apr-util_1.6.1.bb => apr-util_1.6.3.bb} (94%)
 delete mode 100644 meta/recipes-support/apr/apr/0001-add-AC_CACHE_CHECK-for-strerror_r-return-type.patch
 delete mode 100644 meta/recipes-support/apr/apr/0003-Makefile.in-configure.in-support-cross-compiling.patch
 delete mode 100644 meta/recipes-support/apr/apr/0006-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch
 delete mode 100644 meta/recipes-support/apr/apr/CVE-2021-35940.patch
 delete mode 100644 meta/recipes-support/apr/apr/autoconf270.patch
 rename meta/recipes-support/apr/{apr_1.7.0.bb => apr_1.7.2.bb} (91%)
 rename meta/recipes-support/libgit2/{libgit2_1.4.3.bb => libgit2_1.4.5.bb} (91%)

-- 
2.34.1


