Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EB65C433F5
	for <webhook@archiver.kernel.org>; Sat, 14 May 2022 14:22:42 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.6323.1652538154728358321
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 May 2022 07:22:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=LwS7rWdd;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id h186so7408518pgc.3
        for <openembedded-core@lists.openembedded.org>;
 Sat, 14 May 2022 07:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sBwzMICbuw6A5QawPjIraiJiJNFAuctock7EyNQk20g=;
        b=LwS7rWddmUOjiq8kMACZIfumN4M3NA8bHXp8qb7PIElE5XElFaASoMoW2RZSjmTmmo
         yne0zmqfkpjXhLYC1NsHdGyLdB/2emGZVIfUd3oj6rZDaInIYeuTxlif9VgI5ifNi2NP
         sb5vM47xZkXDCzlrTS+ATDkyTcYqkI/BIF7ukEkFlNonis1QiBqduBykd661HRc1TxH+
         OaqIpn73Oy15dqcASqO2vlPJusIvUGyhX59lATYLYGT3mayVw1ZM7oMH1Sfo19h3qHHX
         gUhJzdmRDaeYcvGN+b30oBRNlZ3qo2FwYaSpsA93oyHj+NuhjG95mVZEePoKREyvxGY4
         XSmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sBwzMICbuw6A5QawPjIraiJiJNFAuctock7EyNQk20g=;
        b=KG1H+PEJJcjIYLFka3kfGGn4UnKMj+62H8ou3SWBwq9tVdeOQWb2WHAMptPOJhvyCS
         EWLhvv4RyVaCv7YU/A4Vw3uH47o3fjsG1rbo86xPcFORAliHfgrCpBt4DttcGnoNnWbk
         4W4S/3cQajyTPBy4zJ2rhuHntM2A9wuKRWX0MCxU+ZcHYNXub2OPzmzXNEVknak0Vdmg
         V3nVy+s6dAogY42bTz58EkLd/HIW/r2Abx0bUhd10Gsrr0gGiy0P3hbldHdGbYP2eJG6
         LK6oGLEa9TkTKA8g/yDILLFqRfQHtImhK9puJfT7ZwnN23BBB3CmdfcGt63Ug1zPtySX
         NVNA==
X-Gm-Message-State: AOAM532lAtK/9Lr+HuADAwOpRPjvM+dYoe83+GSYqMdHsbhxRvoGZlMN
	K1uw6XnGa4usmeOXGzc89SngsiMLYxcruakU
X-Google-Smtp-Source: 
 ABdhPJxcDykCXtaHDr//V3TvGcnMKEygGq0kyrmQ494nqd4Bs7GkHfC+JvltqNgOFVJL1Wu3wNGmvw==
X-Received: by 2002:a65:6e8b:0:b0:3ab:a3fb:e95a with SMTP id
 bm11-20020a656e8b000000b003aba3fbe95amr8075432pgb.433.1652538153204;
        Sat, 14 May 2022 07:22:33 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a10-20020a631a0a000000b003c6ab6ba06csm3465856pga.79.2022.05.14.07.22.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 May 2022 07:22:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/14] Pull request (cover letter only)
Date: Sat, 14 May 2022 04:22:21 -1000
Message-Id: <cover.1652538050.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 May 2022 14:22:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165591

The following changes since commit 7c0345ab1058a7e29d37f110923ecd368e102ed7:

  uninative: Upgrade to 3.6 with gcc 12 support (2022-05-09 11:51:55 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Bruce Ashfield (1):
  linux-yocto/5.4: update to v5.4.192

Davide Gardenal (3):
  cve-check: add JSON format to summary output
  cve-check: fix symlinks where link and output path are equal
  rootfs-postcommands: fix symlinks where link and output path are equal

Marta Rybczynska (2):
  cve-update-db-native: update the CVE database once a day only
  cve-update-db-native: let the user to drive the update interval

Pawan Badganchi (2):
  fribidi: Add fix for CVE-2022-25308, CVE-2022-25309 and CVE-2022-25310
  libinput: Add fix for CVE-2022-1215

Portia (1):
  volatile-binds: Change DefaultDependencies from false to no

Richard Purdie (3):
  base: Avoid circular references to our own scripts
  scripts: Make git intercept global
  scripts/git: Ensure we don't have circular references

Ross Burton (1):
  cve-check: no need to depend on the fetch task

Steve Sakoman (1):
  busybox: fix CVE-2022-28391

 meta/classes/base.bbclass                     |   4 +
 meta/classes/cve-check.bbclass                |  72 ++--
 meta/classes/rootfs-postcommands.bbclass      |  14 +-
 ...tr-ensure-only-printable-characters-.patch |  38 ++
 ...e-all-printed-strings-with-printable.patch |  64 ++++
 meta/recipes-core/busybox/busybox_1.31.1.bb   |   2 +
 .../recipes-core/meta/cve-update-db-native.bb |  13 +-
 .../files/volatile-binds.service.in           |   2 +-
 .../wayland/libinput/CVE-2022-1215.patch      | 360 ++++++++++++++++++
 .../wayland/libinput_1.15.2.bb                |   1 +
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
 .../fribidi/fribidi/CVE-2022-25308.patch      |  50 +++
 .../fribidi/fribidi/CVE-2022-25309.patch      |  31 ++
 .../fribidi/fribidi/CVE-2022-25310.patch      |  30 ++
 meta/recipes-support/fribidi/fribidi_1.0.9.bb |   3 +
 scripts/{git-intercept => }/git               |   9 +-
 18 files changed, 674 insertions(+), 55 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-libbb-sockaddr2str-ensure-only-printable-characters-.patch
 create mode 100644 meta/recipes-core/busybox/busybox/0002-nslookup-sanitize-all-printed-strings-with-printable.patch
 create mode 100644 meta/recipes-graphics/wayland/libinput/CVE-2022-1215.patch
 create mode 100644 meta/recipes-support/fribidi/fribidi/CVE-2022-25308.patch
 create mode 100644 meta/recipes-support/fribidi/fribidi/CVE-2022-25309.patch
 create mode 100644 meta/recipes-support/fribidi/fribidi/CVE-2022-25310.patch
 rename scripts/{git-intercept => }/git (52%)

-- 
2.25.1


