Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C4CCC433F5
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 00:17:38 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web12.5401.1636417056635639758
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Nov 2021 16:17:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ODVC3fag;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id 127so17674688pfu.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Nov 2021 16:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1bHvQJEL8GftU5a50BhUykquQ/j0kBJ8zJ9hPOX/8G4=;
        b=ODVC3fag5MmMwRm7rzU7ANlANNNBA0Ze2EIWjva8ZFXmuyYfzhYOO953031H5ORslw
         uwil1VZI6yoMr/Rc17bYNj/6CSjnvCTn5N01XZSMXf73H7YJeWAlmv5MJQrlYimuSHkz
         Tz5gkgUYjJTB5KphY81bCGWoMABt9/LOie2NLWLt5BzWT6bzqVvSYwiAns2t+FSRcbok
         dnqoexvTYZgmnREBnNZLkrSw4FwpwVY9oLWii7O3iiF227UfoVCIQrYFKrZ1+1/mZDeZ
         ZjDvuP0dRknj2T3U0I53/JnYXqvaqCajqDfOMPc7GWb9sdtgd9gu+9fWNpVYX5i30acb
         16jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1bHvQJEL8GftU5a50BhUykquQ/j0kBJ8zJ9hPOX/8G4=;
        b=F7UVzz1vD358sonXxtmObgC7t60/eWGuy0P+df3PVwu5i9iKxpOLdJrq+XS2WuD5EA
         uU6LA2/nyjvrO3z9MKO/S4tSz6Lu3qo7mDW1AqFD4T+4RSU0/UzvEJqHBEwrGiqVmt2V
         cYlbrdVB2DQqdOW+r2WGt121Ox31xXjXOCir+DCTWkBBtB3vz634MX4X2hoI8nTK76DL
         Nh8AgDfJBog3edsay87gVu+7KUmTnxsoXNOp2fMib5Xy2MtYFWfcrTVWdye9rlZToor8
         uG5k6dTw/oXlW2k86cgZGldS7sGyqwGnRqY/66i0Z1WJw0JTYy26q87QvaroqNmUUupP
         SsFQ==
X-Gm-Message-State: AOAM530vWAPzDSK/BOAOtcWZQOx/cEQtIuqG5RL2q/W1rfv4aNQbMNq0
	A29oqMpu/xK4iw6ttbq98hrhJGLFG4WltddP9qU=
X-Google-Smtp-Source: 
 ABdhPJyRe/mDLFS8vFwBzp+cNV5QYK2tfY5xyv+wqym0wk23vDRUxSKOUfkHhd0yYmxtDqUOJOqemA==
X-Received: by 2002:a05:6a00:16c6:b029:32d:e190:9dd0 with SMTP id
 l6-20020a056a0016c6b029032de1909dd0mr85973294pfc.70.1636417055559;
        Mon, 08 Nov 2021 16:17:35 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 d10sm713373pgu.40.2021.11.08.16.17.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 16:17:34 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/3] Pull request (cover letter only)
Date: Mon,  8 Nov 2021 14:17:26 -1000
Message-Id: <cover.1636416971.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Nov 2021 00:17:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157996

The following changes since commit 6cd21ddc6f998eec4d9be05f080e32072fddd2bd:

  tzdata: update 2021d -> 2021e (2021-11-03 11:17:55 +0000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Richard Purdie (2):
  scripts/convert-srcuri: Backport SRC_URI conversion script from master
    branch
  meta/scripts: Manual git url branch additions

Steve Sakoman (1):
  meta: Add explict branch to git SRC_URIs, handle github url changes

 .../devtool/devtool-upgrade-test2_git.bb      |  2 +-
 .../devtool-upgrade-test2_git.bb.upgraded     |  2 +-
 meta/classes/devupstream.bbclass              |  2 +-
 .../distro/include/default-distrovars.inc     |  2 +-
 meta/lib/oeqa/selftest/cases/devtool.py       |  4 +-
 meta/lib/oeqa/selftest/cases/recipetool.py    |  6 +-
 meta/lib/oeqa/selftest/cases/sstatetests.py   |  2 +-
 meta/recipes-bsp/efibootmgr/efibootmgr_17.bb  |  2 +-
 meta/recipes-bsp/efivar/efivar_37.bb          |  2 +-
 meta/recipes-bsp/opensbi/opensbi_0.6.bb       |  2 +-
 meta/recipes-bsp/u-boot/libubootenv_0.3.1.bb  |  2 +-
 meta/recipes-bsp/u-boot/u-boot-common.inc     |  2 +-
 .../connman/connman-gnome_0.7.bb              |  2 +-
 .../libnss-mdns/libnss-mdns_0.14.1.bb         |  2 +-
 .../mobile-broadband-provider-info_git.bb     |  2 +-
 .../resolvconf/resolvconf_1.82.bb             |  2 +-
 meta/recipes-core/dbus-wait/dbus-wait_git.bb  |  2 +-
 meta/recipes-core/expat/expat_2.2.9.bb        |  2 +-
 meta/recipes-core/fts/fts_1.2.7.bb            |  2 +-
 .../glibc/cross-localedef-native_2.31.bb      |  2 +-
 meta/recipes-core/glibc/glibc-version.inc     |  2 +-
 meta/recipes-core/ifupdown/ifupdown_0.8.35.bb |  2 +-
 meta/recipes-core/libxcrypt/libxcrypt.inc     |  2 +-
 meta/recipes-core/musl/libucontext_git.bb     |  2 +-
 meta/recipes-core/musl/musl-obstack.bb        |  2 +-
 meta/recipes-core/musl/musl-utils.bb          |  2 +-
 meta/recipes-core/musl/musl_git.bb            |  2 +-
 meta/recipes-core/ncurses/ncurses.inc         |  2 +-
 meta/recipes-core/psplash/psplash_git.bb      |  2 +-
 meta/recipes-core/systemd/systemd.inc         |  2 +-
 .../update-rc.d/update-rc.d_0.8.bb            |  2 +-
 .../bootchart2/bootchart2_0.14.9.bb           |  2 +-
 .../btrfs-tools/btrfs-tools_5.4.1.bb          |  2 +-
 .../build-compare/build-compare_git.bb        |  2 +-
 .../createrepo-c/createrepo-c_0.15.7.bb       |  2 +-
 meta/recipes-devtools/distcc/distcc_3.3.3.bb  |  2 +-
 meta/recipes-devtools/dnf/dnf_4.2.2.bb        |  2 +-
 meta/recipes-devtools/e2fsprogs/e2fsprogs.inc |  2 +-
 meta/recipes-devtools/file/file_5.38.bb       |  2 +-
 meta/recipes-devtools/glide/glide_0.13.3.bb   |  2 +-
 .../gnu-config/gnu-config_git.bb              |  2 +-
 meta/recipes-devtools/go/go-dep_0.5.4.bb      |  2 +-
 .../libcomps/libcomps_0.1.15.bb               |  2 +-
 meta/recipes-devtools/libdnf/libdnf_0.28.1.bb |  2 +-
 .../librepo/librepo_1.11.2.bb                 |  2 +-
 meta/recipes-devtools/llvm/llvm_git.bb        |  2 +-
 meta/recipes-devtools/mtd/mtd-utils_git.bb    |  2 +-
 meta/recipes-devtools/ninja/ninja_1.10.0.bb   |  2 +-
 .../patchelf/patchelf_0.10.bb                 |  2 +-
 meta/recipes-devtools/rpm/rpm_4.14.2.1.bb     |  2 +-
 .../squashfs-tools/squashfs-tools_git.bb      |  2 +-
 .../systemd-bootchart_233.bb                  |  2 +-
 .../tcf-agent/tcf-agent_git.bb                |  2 +-
 meta/recipes-devtools/unfs3/unfs3_git.bb      |  2 +-
 .../go-examples/go-helloworld_0.1.bb          |  2 +-
 .../iputils/iputils_s20190709.bb              |  2 +-
 .../recipes-extended/libaio/libaio_0.3.111.bb |  2 +-
 meta/recipes-extended/libnsl/libnsl2_git.bb   |  2 +-
 .../recipes-extended/libnss-nis/libnss-nis.bb |  2 +-
 .../libsolv/libsolv_0.7.10.bb                 |  2 +-
 meta/recipes-extended/ltp/ltp_20200120.bb     |  2 +-
 meta/recipes-extended/procps/procps_3.3.16.bb |  2 +-
 meta/recipes-extended/psmisc/psmisc_23.3.bb   |  2 +-
 .../rpcsvc-proto/rpcsvc-proto.bb              |  2 +-
 .../stress-ng/stress-ng_0.11.17.bb            |  2 +-
 meta/recipes-extended/sysklogd/sysklogd.inc   |  2 +-
 meta/recipes-extended/xinetd/xinetd_2.3.15.bb |  2 +-
 .../libfakekey/libfakekey_git.bb              |  2 +-
 .../libmatchbox/libmatchbox_1.12.bb           |  2 +-
 .../libva/libva-utils_2.6.0.bb                |  2 +-
 .../matchbox-wm/matchbox-wm_1.2.2.bb          |  2 +-
 meta/recipes-graphics/mx/mx-1.0_1.4.7.bb      |  2 +-
 meta/recipes-graphics/piglit/piglit_git.bb    |  2 +-
 .../virglrenderer/virglrenderer_0.8.2.bb      |  2 +-
 meta/recipes-graphics/vulkan/assimp_5.0.1.bb  |  2 +-
 .../vulkan/vulkan-demos_git.bb                |  6 +-
 .../vulkan/vulkan-headers_1.1.126.0.bb        |  2 +-
 .../vulkan/vulkan-loader_1.1.126.0.bb         |  2 +-
 .../vulkan/vulkan-tools_1.1.126.0.bb          |  2 +-
 .../xinput-calibrator_git.bb                  |  2 +-
 .../xorg-driver/xf86-video-intel_git.bb       |  2 +-
 meta/recipes-kernel/blktrace/blktrace_git.bb  |  2 +-
 meta/recipes-kernel/cryptodev/cryptodev.inc   |  2 +-
 meta/recipes-kernel/dtc/dtc.inc               |  2 +-
 .../kern-tools/kern-tools-native_git.bb       |  2 +-
 meta/recipes-kernel/kmod/kmod.inc             |  2 +-
 meta/recipes-kernel/powertop/powertop_2.10.bb |  2 +-
 .../systemtap/systemtap_git.inc               |  2 +-
 .../gstreamer/gst-examples_1.16.0.bb          |  2 +-
 meta/recipes-multimedia/x264/x264_git.bb      |  2 +-
 meta/recipes-sato/l3afpad/l3afpad_git.bb      |  2 +-
 .../matchbox-config-gtk_0.2.bb                |  2 +-
 .../matchbox-desktop/matchbox-desktop_2.2.bb  |  2 +-
 .../matchbox-panel-2/matchbox-panel-2_2.11.bb |  2 +-
 .../matchbox-terminal_0.2.bb                  |  2 +-
 .../matchbox-theme-sato_0.2.bb                |  2 +-
 meta/recipes-sato/puzzles/puzzles_git.bb      |  2 +-
 .../sato-screenshot/sato-screenshot_0.3.bb    |  2 +-
 .../settings-daemon/settings-daemon_0.0.2.bb  |  2 +-
 .../bmap-tools/bmap-tools_3.5.bb              |  2 +-
 .../ca-certificates_20211016.bb               |  2 +-
 .../dos2unix/dos2unix_7.4.1.bb                |  2 +-
 .../gnome-desktop-testing_2018.1.bb           |  2 +-
 .../libjitterentropy_2.2.0.bb                 |  2 +-
 meta/recipes-support/lz4/lz4_1.9.2.bb         |  2 +-
 .../p11-kit/p11-kit_0.23.22.bb                |  2 +-
 .../ptest-runner/ptest-runner_2.4.0.bb        |  2 +-
 .../rng-tools/rng-tools_6.9.bb                |  2 +-
 .../shared-mime-info/shared-mime-info_git.bb  |  2 +-
 meta/recipes-support/vim/vim.inc              |  2 +-
 scripts/contrib/convert-srcuri.py             | 77 +++++++++++++++++++
 scripts/lib/recipetool/create.py              |  3 +
 112 files changed, 195 insertions(+), 115 deletions(-)
 create mode 100755 scripts/contrib/convert-srcuri.py

-- 
2.25.1


