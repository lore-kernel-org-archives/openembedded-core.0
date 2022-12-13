Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B78FC4332F
	for <webhook@archiver.kernel.org>; Tue, 13 Dec 2022 02:32:04 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.63740.1670898714846003904
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Dec 2022 18:31:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ZNiYAOac;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id u15-20020a17090a3fcf00b002191825cf02so2062417pjm.2
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Dec 2022 18:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=pvdhuloHabs/h/53gchUoe7T7b56KTARraEZODr66AU=;
        b=ZNiYAOacNtjYTJZyaUQfixbt+Lrse1j4YQmPEDAceQY5Lc7OGkee9DwYKgUsj9lxor
         rTxR9zVXyrNnWrp2b3ARDlPdYAOCeg03rlZBn1ghYVz1iqzCIw1Q+X5crunCEUvz+Q82
         TOZ5uSsaCxmNaQSoiZe5Mgit1Z56rmFd5RpaS/V9mFhpdbgZF+WxWH/a7vdR5ApqLzr3
         yjJM3H6hTwLEMinHne5CRvCJt4pyJe7RHicqtB+eWHHQxx4tTXRAcfS30UWRsw+lW6R/
         muOtvC0cUsZYxA1d0s1yFQ03oWqYxiJdd52XljdhM78P3r7nUM9Ruh7jJoTyZ8S1I+r9
         OMZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pvdhuloHabs/h/53gchUoe7T7b56KTARraEZODr66AU=;
        b=4N1qubLrDVs4zdzxDD0CpqmU/IYgbQWoLAWjo7iBK8/9Ubv6X/GeDOcvHcHXKUV3OG
         8haeaQZT2cycj/Bg3Z9zF3LtRH+TK6LEZBvlSoZixPvQJ3ekpx+4DT+tbqRi0XyoNKLY
         umgPVtljUuGet1TjxhJ3dvP6CTLlO3RDJutGu6gwKS+s23DhdL4eHMRe0d0Lf/O1Nd79
         95monyNpdzKm5j44GoxG6nMh5rw1SawvGUHYZuhUypC6Q5WEKlKLZyHs6ofv3cDnB/Yi
         XQ4EPWxNR8u+7GJdg4TQxntf1y3/vi7Tdm/2WvGI5TND86WWEhcjI89hwAoRYmE9V7JM
         bVoQ==
X-Gm-Message-State: ANoB5pk+Cng0CK9M427pN4C4Z4//H0KR3wug/V0T0lB/Pa4MuZc/YrmQ
	L3M4Z7srKfVhpL01palWN3nKloi2fwt61EHr5Ly+/A==
X-Google-Smtp-Source: AA0mqf5Qf92z4jTT8AgQ9khMpKeII/1QDxjYNXyX/twrryoh0fWhP2YtHDoMjrrIiXkWtJEQ+zoU5w==
X-Received: by 2002:a17:90b:378c:b0:21e:1282:af42 with SMTP id mz12-20020a17090b378c00b0021e1282af42mr15822578pjb.40.1670898713264;
        Mon, 12 Dec 2022 18:31:53 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id 8-20020a17090a0e8800b00218998eb828sm5991049pjx.45.2022.12.12.18.31.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 18:31:52 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/12] Pull request (cover letter only)
Date: Mon, 12 Dec 2022 16:31:48 -1000
Message-Id: <cover.1670898623.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 02:32:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174505

This is the final pull request for the 4.0.6 release build.

The following changes since commit c0f3da88a9646fc5e6d549b1a2327c0823c0e5a1:

  mirrors.bbclass: update CPAN_MIRROR (2022-11-30 05:51:07 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-next

Alexey Smirnov (1):
  classes: make TOOLCHAIN more permissive for kernel

Chen Qi (1):
  psplash: consider the situation of psplash not exist for systemd

Harald Seiler (1):
  opkg: Set correct info_dir and status_file in opkg.conf

Hitendra Prajapati (1):
  libarchive: CVE-2022-36227 NULL pointer dereference in archive_write.c

Joe Slater (1):
  python3: advance to version 3.10.8

Joshua Watt (1):
  scripts: convert-overrides: Allow command-line customizations

Qiu, Zheng (2):
  vim: upgrade 9.0.0820 -> 9.0.0947
  valgrind: remove most hidden tests for arm64

Richard Purdie (1):
  oeqa/selftest/tinfoil: Add test for separate config_data with
    recipe_parse_file()

Ross Burton (1):
  xserver-xorg: backport fixes for CVE-2022-3550 and CVE-2022-3551

Xiangyu Chen (2):
  sysstat: fix CVE-2022-39377
  grub: backport patches to fix CVE-2022-28736

 meta/classes/kernel-arch.bbclass              |   2 +-
 meta/lib/oeqa/selftest/cases/tinfoil.py       |  14 ++
 ...i-chainloader-Use-grub_loader_set_ex.patch |  86 +++++++
 ...ot-Add-API-to-pass-context-to-loader.patch | 168 +++++++++++++
 ...hainloader-Simplify-the-loader-state.patch | 129 ++++++++++
 meta/recipes-bsp/grub/grub2.inc               |   3 +
 .../psplash/files/psplash-start.service       |   1 +
 .../psplash/files/psplash-systemd.service     |   1 +
 meta/recipes-devtools/opkg/opkg_0.5.0.bb      |   4 +-
 .../python/python3/cve-2022-37454.patch       | 108 +++++++++
 .../{python3_3.10.7.bb => python3_3.10.8.bb}  |   4 +-
 .../valgrind/valgrind/remove-for-aarch64      | 227 +-----------------
 .../libarchive/CVE-2022-36227.patch           |  42 ++++
 .../libarchive/libarchive_3.6.1.bb            |   4 +-
 .../sysstat/sysstat/CVE-2022-39377.patch      |  93 +++++++
 .../sysstat/sysstat_12.4.5.bb                 |   3 +-
 ...possible-memleaks-in-XkbGetKbdByName.patch |  63 +++++
 ...ntedString-against-request-length-at.patch |  38 +++
 .../xorg-xserver/xserver-xorg_21.1.4.bb       |   2 +
 meta/recipes-support/vim/vim.inc              |   4 +-
 scripts/contrib/convert-overrides.py          | 103 ++++----
 21 files changed, 821 insertions(+), 278 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2022-28736-loader-efi-chainloader-Use-grub_loader_set_ex.patch
 create mode 100644 meta/recipes-bsp/grub/files/commands-boot-Add-API-to-pass-context-to-loader.patch
 create mode 100644 meta/recipes-bsp/grub/files/loader-efi-chainloader-Simplify-the-loader-state.patch
 create mode 100644 meta/recipes-devtools/python/python3/cve-2022-37454.patch
 rename meta/recipes-devtools/python/{python3_3.10.7.bb => python3_3.10.8.bb} (99%)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2022-36227.patch
 create mode 100644 meta/recipes-extended/sysstat/sysstat/CVE-2022-39377.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-fix-some-possible-memleaks-in-XkbGetKbdByName.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-proof-GetCountedString-against-request-length-at.patch

-- 
2.25.1


