Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B72BC636CC
	for <webhook@archiver.kernel.org>; Sat,  4 Feb 2023 14:33:11 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.7240.1675521187292199692
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Feb 2023 06:33:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=UA4/wKvc;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id v3so5481104pgh.4
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Feb 2023 06:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hce7gSSb8hJual9qjWkNxWv1ZxNKHg48FWByhRM95z8=;
        b=UA4/wKvcbbiq046vayjBzAfOu67gkjEePQ6YY+DSsU3p/h15ioSOJW+Csq39zTiF5j
         SkdFjD5dxAD6Doq+yJapc02/eXuht4G30sh4D/0WDJEyjz8i9URG6ZDpgyEWKa+04GYw
         eoA1ksF0nlEGFKsMci55VYbm9GdTqqkCciRObVP324k5TEjqDnHdWpybDq7TYvU7I3+V
         6cpJQ2nq0Mj4iuNTd8Ekv5CagftMg5TuxmaDPYOFlztiP5E5PL4QUntg/righWN/njiQ
         7pIgmhoT4OO3yjIkXAbCfSR+JM96vkXuI9HN0Fa4P+njJYgOoR/QtpO4NIz3LjSnq1Ce
         L1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hce7gSSb8hJual9qjWkNxWv1ZxNKHg48FWByhRM95z8=;
        b=oVfjzWl6bOSETkcAZs+n1aDUePW1d3ABkAdQ0KYdRlPUNm6rwhGcswny8sCUk1jkTz
         7s+CudGm3TZRb6Wh+7HEVMDXncfwOXifNh7tvgN1EOlqgT9JI6iSCrzgnADyXC+dyWB4
         4I8hk1/WdN3CJ9+N1vsj9tWPgAy0K/7AZVuKQaEZx/qUppJRVTRY1ZG8VP32yfpjUPEP
         /yegcTPDhQrGQ45ji+cG/ct+upvpFjYnzQc6gARCsRIa+RiNEulb+TcOLBvWS1/DACIw
         7hbsls0P+Ogqk9xyOdJBul3KyiJsn6zknxb1mbBygjxOgFssdRENb6Go9ECF6+jRStep
         tSqA==
X-Gm-Message-State: AO0yUKV3TinyjLJcyHh2PfTzKISSHW0WXCheGK0MEpMIo72nmz0Qjuy9
	3nLlPvbsULRylcpha4bgzK7uJYOcoeB+xpxM6a0=
X-Google-Smtp-Source: AK7set9SD9E55ZqWV01VOormvjnNAM0P2/FEVhklBZnMPU5CNmxRGk0kOV3SVAPfRZOSo1hKfJkwdA==
X-Received: by 2002:aa7:88d1:0:b0:593:b49:16a2 with SMTP id k17-20020aa788d1000000b005930b4916a2mr15616075pff.12.1675521186251;
        Sat, 04 Feb 2023 06:33:06 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id y5-20020a62b505000000b00588fb6fafe0sm3741508pfe.188.2023.02.04.06.33.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Feb 2023 06:33:05 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/13] Pull request (cover letter only)
Date: Sat,  4 Feb 2023 04:32:56 -1000
Message-Id: <cover.1675521082.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Feb 2023 14:33:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176764

The following changes since commit a8c82902384f7430519a31732a4bb631f21693ac:

  build-appliance-image: Update to kirkstone head revision (2023-01-26 23:40:27 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-next

Armin Kuster (1):
  lttng-modules: Fix for 5.10.163 kernel version

Bruce Ashfield (1):
  linux-yocto/5.15: update to v5.15.87

Khem Raj (3):
  libtirpc: Check if file exists before operating on it
  libusb1: Link with latomic only if compiler has no atomic builtins
  libusb1: Strip trailing whitespaces

Niko Mauno (1):
  Fix missing leading whitespace with ':append'

Richard Purdie (1):
  native: Drop special variable handling

Ross Burton (4):
  ppp: backport fix for CVE-2022-4603
  quilt: fix intermittent failure in faildiff.test
  spirv-headers: set correct branch name
  quilt: use upstreamed faildiff.test fix

Thomas Roos (1):
  devtool: fix devtool finish when gitmodules file is empty

Xiangyu Chen (1):
  numactl: skip test case when target platform doesn't have 2 CPU node

 meta/classes/core-image.bbclass               |  2 +-
 meta/classes/externalsrc.bbclass              |  2 +-
 meta/classes/native.bbclass                   |  2 +-
 meta/classes/populate_sdk_ext.bbclass         |  2 +-
 .../distro/include/ptest-packagelists.inc     |  2 +-
 .../ppp/ppp/CVE-2022-4603.patch               | 48 +++++++++++++++
 meta/recipes-connectivity/ppp/ppp_2.4.9.bb    |  1 +
 meta/recipes-devtools/quilt/quilt.inc         |  1 +
 .../quilt/quilt/faildiff-order.patch          | 41 +++++++++++++
 .../libtirpc/libtirpc_1.3.2.bb                |  2 +-
 .../spir/spirv-headers_1.3.204.1.bb           |  2 +-
 .../linux/linux-yocto-rt_5.15.bb              |  6 +-
 .../linux/linux-yocto-tiny_5.15.bb            |  6 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 ++++----
 .../fix-jbd2-upper-bound-for-v5.10.163.patch  | 52 ++++++++++++++++
 ...e-the-correct-print-format-v5.10.163.patch | 61 +++++++++++++++++++
 .../lttng/lttng-modules_2.13.8.bb             |  2 +
 ...k-with-latomic-only-if-no-atomic-bui.patch | 46 ++++++++++++++
 meta/recipes-support/libusb/libusb1_1.0.26.bb | 13 ++--
 .../numactl/Fix-the-test-output-format.patch  |  3 +-
 .../recipes-support/numactl/numactl/run-ptest |  6 +-
 21 files changed, 292 insertions(+), 34 deletions(-)
 create mode 100644 meta/recipes-connectivity/ppp/ppp/CVE-2022-4603.patch
 create mode 100644 meta/recipes-devtools/quilt/quilt/faildiff-order.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-upper-bound-for-v5.10.163.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-use-the-correct-print-format-v5.10.163.patch
 create mode 100644 meta/recipes-support/libusb/libusb1/0001-configure.ac-Link-with-latomic-only-if-no-atomic-bui.patch

-- 
2.25.1


