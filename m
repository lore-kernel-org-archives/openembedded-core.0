Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1A3BC433EF
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 21:46:57 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.253.1655848008715219852
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 14:46:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=LDVX99Hy;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id 184so14277218pga.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 14:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jyGBv7ycCSC5FvLzw3wktGb61CAoVw4ccbh/iDnak0o=;
        b=LDVX99HyZx9piTXspqx71PxPPcF1mrEZSDOKiOG6CZXUEqUL+PPhEsQuflp1GT7L/l
         HBF9u2h7sLBWKZxSdZ334w02c2nh5hxCxSMqTiU3gk3H5kufLivNs3hXhwwnHg8k/HZ7
         d4a4S1TO5O/XsVUSljgNJvXcBJjM26ugXFh/ztX45s6gZ3c9gGouR/mlZJygpU6fSrcA
         Wb+4XoXusxJiy22pKRPu+kSvdNgrWyWf7npgRbX36kqLYfRw7zVPGZIaIs0bw+ujYsnX
         C2zbN3KdT9nkyf1QfkLTjmZ7vYnPyO6AvIgh/phUbUAHwotFZ4UUe/mUvZC2a5ieHoLe
         YzIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jyGBv7ycCSC5FvLzw3wktGb61CAoVw4ccbh/iDnak0o=;
        b=KNERbSGzMxVoECTufNWlVwJ07rTSxaKT7qJqZo5pZoBrdDktSxDphSTWXbuQY2rS43
         Gmcp7xBKajbHTrxAyJZ4NRPVOqBaEw1ERDw32H9hCZi/e5h7Mf6v5Z2+3Pj4DdceHUmq
         6l4yPYyuUs8r0CLH6Z57aUy4c/WY0YxbkTAUhUZrLDQtsP2cMYGTyzcdj50y5vRItJjG
         bVHl/jgl3m35LkZWXFZVXx7JMQzV6eIL/0zeApU1qaXnp/L3TRwHPNVUF4zL8BBUwAF+
         wqkHFAfp2TriJAG459dO3VatvZXy2zSnzZi7UonQeYm5oa8K77puDWX2kvXLqCCsQe7L
         9edw==
X-Gm-Message-State: AJIora8Pa+menW8p+9BMi+FqeEbhiY3IVGcDhh7PtTlKvMuUFXO0+zvI
	CDhr0BcKV3mu7qFsZ2ODflfhFJl0dkcNy/sK
X-Google-Smtp-Source: 
 AGRyM1vVqcIRA4uJZELVvkz+7i9mHQ+RqeuHARGoeSQ9hdvH6Vboeiqpv1tD4nTGgKAcgZNoogekuw==
X-Received: by 2002:a05:6a00:996:b0:50b:76b8:3bb1 with SMTP id
 u22-20020a056a00099600b0050b76b83bb1mr31983673pfg.9.1655848007641;
        Tue, 21 Jun 2022 14:46:47 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x82-20020a627c55000000b0052089e1b88esm5432460pfc.192.2022.06.21.14.46.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 14:46:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/15] Pull request (cover letter only)
Date: Tue, 21 Jun 2022 11:46:30 -1000
Message-Id: <cover.1655847917.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 21:46:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167189

The following changes since commit 0f7a8359ba370c7f5d5153453ed699e9566f5b1d:

  rootfs.py: close kernel_abi_ver_file (2022-06-10 05:13:53 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/kirkstone-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-next

Jack Mitchell (1):
  meson.bbclass: add cython binary to cross/native toolchain config

Jose Quaresma (2):
  archiver: use bb.note instead of echo
  archiver: don't use machine variables in shared recipes

Kai Kang (1):
  xxhash: fix build with gcc 12

Mingli Yu (1):
  oescripts: change compare logic in OEListPackageconfigTests

Pavel Zhukov (1):
  systemd: update 0008-add-missing-FTW_-macros-for-musl.patch

Rasmus Villemoes (1):
  e2fsprogs: add alternatives handling of lsattr as well

Richard Purdie (5):
  vim: Upgrade 8.2.5034 -> 8.2.5083
  uboot-sign: Fix potential index error issues
  selftest/multiconfig: Test that multiconfigs in separate layers works
  gcc-source: Fix incorrect task dependencies from ${B}
  liberror-perl: Update sstate/equiv versions to clean cache

Xiaobing Luo (1):
  devtool: Fix _copy_file() TypeError

Yi Zhao (2):
  popt: fix override syntax in RDEPENDS
  git: fix override syntax in RDEPENDS

 meta-selftest/conf/multiconfig/muslmc.conf          |  2 ++
 meta/classes/archiver.bbclass                       | 11 ++++++++---
 meta/classes/meson.bbclass                          |  2 ++
 meta/classes/uboot-sign.bbclass                     |  2 ++
 meta/lib/oeqa/selftest/cases/multiconfig.py         | 13 +++++++++++++
 meta/lib/oeqa/selftest/cases/oescripts.py           |  3 ++-
 .../0008-add-missing-FTW_-macros-for-musl.patch     |  8 ++++----
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb |  5 ++++-
 meta/recipes-devtools/gcc/gcc-common.inc            |  2 +-
 meta/recipes-devtools/gcc/gcc-source.inc            |  1 +
 meta/recipes-devtools/git/git_2.35.3.bb             |  2 +-
 meta/recipes-devtools/perl/liberror-perl_0.17029.bb |  4 ++++
 meta/recipes-support/popt/popt_1.18.bb              |  2 +-
 meta/recipes-support/vim/vim.inc                    |  4 ++--
 meta/recipes-support/xxhash/xxhash_0.8.1.bb         |  2 ++
 scripts/lib/devtool/standard.py                     |  2 +-
 16 files changed, 50 insertions(+), 15 deletions(-)
 create mode 100644 meta-selftest/conf/multiconfig/muslmc.conf

-- 
2.25.1


