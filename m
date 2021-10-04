Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D02DC433EF
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 14:20:55 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.10072.1633357254478389207
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 07:20:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=m9nC/euY;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id w11so11188740plz.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 07:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d27TqSaoM70yjR/1y4nlU0bGDcPh1Bs7CJK/ANBo5+Y=;
        b=m9nC/euYU1QV2PLQNZojgHyisSYLyw0I/4vjTqbRXfM03+uPhT/roR6gjo2Cn7J2/s
         eaKY+kWHxua1e29WM0mD0IHBzZqSbT5cHqbaEpPRaXo7/E6gOg+xVyQjmpwdjoran4Gk
         UY+J08FoJkO+zAx84U2mviqe8b/F2q680FlPJqq/8J3haaMwAg0l7jjn/Wbz4yOlVw0g
         5a+MoGnTgVW8hhcs2nGgXtp8mU8+KKRKR5+39K7VpDnjTs9EVF+byXH6SESUZRfjo/Ca
         hn+ri29hIaiNnIJ+rnYGT9CdAWImIlkIUrO/oLJHPyNVmGCIBAs2qfslU4lKf83euUIV
         V5yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d27TqSaoM70yjR/1y4nlU0bGDcPh1Bs7CJK/ANBo5+Y=;
        b=uT8t25qCvdN4zgakOKQLTX1LD2yf98z6VykA/t72UcBFtuILxu7sqaL7ELJ+6HT+nU
         CG1AKNvp8NZl0G8khUQtHUeQIgXU9k/InzsX5A2onUql/CswkbdhdE2XNF9qLR/IjxAZ
         r+pyeM552OQf1CAiCtWPzUSTCCDUXMutLqcD89opWR/hjxxyVs9nymdzeO0xLkKRswIa
         Xs1n4myIBdoSrcVE431LiMVrY6CWv6kITszdObELckB92ysaOicAz/hNBNARNwlDP3/8
         VXZJfQj11NckLbnJvEezlY563bkhT40pIorERKI7Rvx9vYUi4Py8V0gyNBtaTC27rwSv
         v6Xg==
X-Gm-Message-State: AOAM533JXBeps+fuFnxfMdZ+UtXXAChjfqQgso2kH5GXK+PiNVYcHdsT
	IyQmH1EqVrSK17vhKwbrwM752njkj9edSbCWt/0=
X-Google-Smtp-Source: 
 ABdhPJy4CB/8qC1jJm4siD7/9uWptFdwSCeTGhWoJVgSP/4wWc0+I4sdfIfMPPxx8p2mAWN8k2OSog==
X-Received: by 2002:a17:902:ab43:b0:13e:6f69:d34d with SMTP id
 ij3-20020a170902ab4300b0013e6f69d34dmr21522394plb.33.1633357253208;
        Mon, 04 Oct 2021 07:20:53 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 t4sm8313066pfj.13.2021.10.04.07.20.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 07:20:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/15] Patch review
Date: Mon,  4 Oct 2021 04:18:28 -1000
Message-Id: <cover.1633356813.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Oct 2021 14:20:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156593

Please review this next set of patches for dunfell and have comments back by end
of day Wednesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2677

The following changes since commit 8e7c8e43260682efafabc50c757b9c2daff98f13:

  connman: add CVE_PRODUCT (2021-09-24 04:27:46 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Minjae Kim (1):
  vim: fix CVE-2021-3778

Ranjitsinh Rathod (1):
  systemd: Add fix for systemd-networkd crash during free

Richard Purdie (7):
  mtd-utils: upgrade 2.1.1 -> 2.1.2
  pybootchart: Avoid divide by zero
  oeqa/qemurunner: Use oe._exit(), not sys.exit()
  libc_package/buildstats: Fix python regex quoting warnings
  oeqa/selftest/gotoolchain: Fix temp file cleanup
  oeqa/buildproject: Ensure temp directories are cleaned up
  glew: Stop polluting /tmp during builds

Robert P. J. Day (1):
  common-licenses: add "Unlicense" license file

Stefano Babic (1):
  mtd-utils: upgrade 2.1.2 -> 2.1.3

Tom Pollard (2):
  bzip2: Update soname for libbz2 1.0.8
  libsamplerate0: Set correct soname for 0.1.9

William A. Kennington III (1):
  rm_work.bbclass: Fix for files starting with -

sana kazi (1):
  openssh: Fix CVE-2021-28041

 meta/classes/libc-package.bbclass             |   2 +-
 meta/classes/rm_work.bbclass                  |   8 +-
 meta/files/common-licenses/Unlicense          |  24 ++
 meta/lib/buildstats.py                        |   4 +-
 meta/lib/oeqa/selftest/cases/gotoolchain.py   |   6 +
 meta/lib/oeqa/utils/buildproject.py           |   3 +
 meta/lib/oeqa/utils/qemurunner.py             |   2 +-
 meta/lib/oeqa/utils/targetbuild.py            |   4 +-
 .../openssh/openssh/CVE-2021-28041.patch      |  20 ++
 .../openssh/openssh_8.2p1.bb                  |   1 +
 ...-info-for-ordered-set-new-and-introd.patch |  78 +++++
 ...dered_set_clear-free-with-destructor.patch |  35 +++
 ...etwork-add-skeleton-of-request-queue.patch | 285 ++++++++++++++++++
 ...quests-when-link-enters-linger-state.patch |  50 +++
 ...ork-fix-Link-reference-counter-issue.patch | 278 +++++++++++++++++
 ...nk_drop-and-link_detach_from_manager.patch |  67 ++++
 meta/recipes-core/systemd/systemd_244.5.bb    |   6 +
 ...-utils-Fix-return-value-of-ubiformat.patch |  62 ----
 meta/recipes-devtools/mtd/mtd-utils_git.bb    |   9 +-
 meta/recipes-extended/bzip2/bzip2/Makefile.am |   2 +-
 .../glew/glew/notempdir.patch                 |  19 ++
 meta/recipes-graphics/glew/glew_2.2.0.bb      |   1 +
 .../libsamplerate0/shared_version_info.patch  |  13 +
 .../libsamplerate/libsamplerate0_0.1.9.bb     |   1 +
 .../vim/files/CVE-2021-3778.patch             |  49 +++
 meta/recipes-support/vim/vim.inc              |   1 +
 scripts/pybootchartgui/pybootchartgui/draw.py |   5 +-
 27 files changed, 956 insertions(+), 79 deletions(-)
 create mode 100644 meta/files/common-licenses/Unlicense
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2021-28041.patch
 create mode 100644 meta/recipes-core/systemd/systemd/basic-pass-allocation-info-for-ordered-set-new-and-introd.patch
 create mode 100644 meta/recipes-core/systemd/systemd/introduce-ordered_set_clear-free-with-destructor.patch
 create mode 100644 meta/recipes-core/systemd/systemd/network-add-skeleton-of-request-queue.patch
 create mode 100644 meta/recipes-core/systemd/systemd/network-also-drop-requests-when-link-enters-linger-state.patch
 create mode 100644 meta/recipes-core/systemd/systemd/network-fix-Link-reference-counter-issue.patch
 create mode 100644 meta/recipes-core/systemd/systemd/network-merge-link_drop-and-link_detach_from_manager.patch
 delete mode 100644 meta/recipes-devtools/mtd/mtd-utils/0001-mtd-utils-Fix-return-value-of-ubiformat.patch
 create mode 100644 meta/recipes-graphics/glew/glew/notempdir.patch
 create mode 100644 meta/recipes-multimedia/libsamplerate/libsamplerate0/shared_version_info.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2021-3778.patch

-- 
2.25.1


