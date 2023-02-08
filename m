Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A6E4C636CC
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 14:26:27 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.9685.1675866382253287655
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Feb 2023 06:26:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=H6rqrm6k;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id e10-20020a17090a630a00b0022bedd66e6dso2667693pjj.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 06:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=69Xebbbv9lSuJ8JGkq+3qbavR6hMU3giCe8xyaNAfF0=;
        b=H6rqrm6kyxvbJ4Yue8eTPnTD1dmOb/NU2h53JB380DjvjSii5XHaBprsiWIIoGXZmZ
         OYEHDYTJety7HD0EyKOz2+nJjUTkNeoseDFqZShAm0x+fQSeqkIhdWKH3TWu1Q2SWlPt
         JZ1Z/0bmWdWt9ORjSlFKEumSJCVqVBobuXIwUQ5JfqepnLfYlkX7u5e3g35KBolBT0M0
         UXyqKxr0fps/JYgTSQ6lfaEn8L+J+z6Hi/JS+nAE1FRyR/BfDxzwP04auhQw1O+QmfTF
         tVuuUajlLyqIzaU2PgvTiHBMS7L2QgQu3G+JA/UfdcWjz4utcQwaoLmcAbh4ytfoj2D2
         okpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=69Xebbbv9lSuJ8JGkq+3qbavR6hMU3giCe8xyaNAfF0=;
        b=nJWEVro5dvjCtdztsVmBBjxatb15hkjdUdODo4GCzY1cRdbeXpgSV14cVUUU2RaZ+n
         1jNr6q1mGAriIw6oxKGrAZf8XTKbur/wRssxKQJcxcYmhk0YO98kqsXcpEirsItPeyHK
         JzqjbVAHj2PT+BeUKyCQmWPbKshnUtSgIiMMaO+bK2uR8Vz86cNnZyhQSI16rATgubcT
         jxVCN0oHR+wPf/ViVlEfxQ31sPdF3p6Y//MpMP/ZZ6meIFeolKnil+cvQ0D0vcRIAZfE
         TLpTQ2HpHmoyYh3ePzGR0wY04UD3R9PktLPSmyJ0wt5OYN+Na7osj01tmKvSe8I1AnB6
         vdnw==
X-Gm-Message-State: AO0yUKUI9/cXj01Ceq4s3aOnHB5m04MCU2gYVmPb4RIK/qJqkM4M1016
	XOhZljqWJi+s02hmOq78Gjbw9ryL3qQMMz3iuLI=
X-Google-Smtp-Source: AK7set8EeI9FGBSQ3gdOdscRLgaz2OnZfbRRN9lqsvZyxN9NdCoduN3lA9WBDh1pZRqes2dZr66crw==
X-Received: by 2002:a17:902:cec9:b0:199:fc6:9aad with SMTP id d9-20020a170902cec900b001990fc69aadmr2357962plg.66.1675866380655;
        Wed, 08 Feb 2023 06:26:20 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id p1-20020a1709027ec100b001960cccc318sm10974613plb.121.2023.02.08.06.26.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 06:26:20 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/27] Pull request (cover letter only)
Date: Wed,  8 Feb 2023 04:26:15 -1000
Message-Id: <cover.1675866311.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 14:26:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176907

The following changes since commit db81e3c7e7f1d4d9eba52ac35ac97627d0240b63:

  build-appliance-image: Update to dunfell head revision (2023-01-13 18:11:40 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Alexander Kanavin (2):
  linux-firmware: upgrade 20221109 -> 20221214
  selftest/virgl: use pkg-config from the host

Benoît Mauduit (1):
  lib/oe/reproducible: Use git log without gpg signature

Bhabu Bindu (1):
  ffmpeg: Fix CVE-2022-3109

Bruce Ashfield (2):
  linux-yocto/5.4: update to v5.4.229
  linux-yocto/5.4: update to v5.4.230

Hitendra Prajapati (1):
  xserver-xorg: Fix Multiple CVEs

Jan Kircher (1):
  toolchain-scripts: compatibility with unbound variable protection

Jermain Horsman (1):
  cve-check: write the cve manifest to IMGDEPLOYDIR

Khem Raj (1):
  libtirpc: Check if file exists before operating on it

Marta Rybczynska (1):
  cve-update-db-native: avoid incomplete updates

Niko Mauno (2):
  systemd: Consider PACKAGECONFIG in RRECOMMENDS
  Fix missing leading whitespace with ':append'

Quentin Schulz (1):
  cairo: fix CVE patches assigned wrong CVE number

Randy MacLeod (1):
  vim: upgrade 9.0.0947 -> 9.0.1211

Ranjitsinh Rathod (1):
  libsdl2: Add fix for CVE-2022-4743

Ross Burton (2):
  cve-update-db-native: add more logging when fetching
  cve-update-db-native: show IP on failure

Steve Sakoman (5):
  python3: fix packaging of Windows distutils installer stubs
  lttng-modules: update 2.11.6 -> 2.11.7
  lttng-modules: update 2.11.7 -> 2.11.8
  lttng-modules: update 2.11.8 -> 2.11.9
  lttng-modules: fix build with 5.4.229 kernel

Thomas Roos (1):
  devtool: fix devtool finish when gitmodules file is empty

Vivek Kumbhar (1):
  go: fix CVE-2022-1962 go/parser stack exhaustion in all Parse*
    functions

Xiaobing Luo (1):
  devtool: Fix _copy_file() TypeError

jan (1):
  cve-update-db-native: Allow to overrule the URL in a bbappend.

 meta/classes/cve-check.bbclass                |   6 +-
 meta/classes/externalsrc.bbclass              |   2 +-
 meta/classes/populate_sdk_ext.bbclass         |   2 +-
 meta/classes/toolchain-scripts.bbclass        |   2 +-
 meta/lib/oe/reproducible.py                   |   3 +-
 meta/lib/oeqa/selftest/cases/runtime_test.py  |   2 +-
 .../recipes-core/meta/cve-update-db-native.bb |  97 +++--
 meta/recipes-core/systemd/systemd_244.5.bb    |   4 +-
 meta/recipes-devtools/go/go-1.14.inc          |   1 +
 .../go/go-1.14/CVE-2022-1962.patch            | 357 ++++++++++++++++++
 .../python/python3/python3-manifest.json      |   4 +-
 .../libtirpc/libtirpc_1.2.6.bb                |   2 +-
 .../cairo/cairo/CVE-2019-6461.patch           |  46 +--
 .../cairo/cairo/CVE-2019-6462.patch           |  46 ++-
 .../libsdl2/libsdl2/CVE-2022-4743.patch       |  38 ++
 .../libsdl2/libsdl2_2.0.12.bb                 |   1 +
 .../xserver-xorg/CVE-2022-4283.patch          |  39 ++
 .../xserver-xorg/CVE-2022-46340.patch         |  55 +++
 .../xserver-xorg/CVE-2022-46341.patch         |  86 +++++
 .../xserver-xorg/CVE-2022-46342.patch         |  78 ++++
 .../xserver-xorg/CVE-2022-46343.patch         |  51 +++
 .../xserver-xorg/CVE-2022-46344.patch         |  75 ++++
 .../xorg-xserver/xserver-xorg_1.20.14.bb      |   8 +-
 ...20221109.bb => linux-firmware_20221214.bb} |   4 +-
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
 ...ncpy-equals-destination-size-warning.patch |  42 ---
 ...jtool-Rename-frame.h-objtool.h-v5.10.patch |  88 -----
 ...oints-output-proper-root-owner-for-t.patch | 316 ----------------
 ...rdered-extent-tracepoint-take-btrfs_.patch | 179 ---------
 ...ext4-fast-commit-recovery-path-v5.10.patch |  91 -----
 ...intr-vectoring-info-and-error-code-t.patch | 124 ------
 ...x86-mmu-Add-TDP-MMU-PF-handler-v5.10.patch |  82 ----
 ...Return-unique-RET_PF_-values-if-the-.patch |  71 ----
 ...int-Optimize-using-static_call-v5.10.patch | 155 --------
 ...-fix-include-order-for-older-kernels.patch |  31 --
 .../0011-Add-release-maintainer-script.patch  |  59 ---
 .../0012-Improve-the-release-script.patch     | 173 ---------
 ...fix-ext4-fast-commit-recovery-path-v.patch |  32 --
 ...-fix-include-order-for-older-kernels.patch |  32 --
 ...fix-tracepoint-Optimize-using-static.patch |  46 ---
 ...ion-range-for-trace_find_free_extent.patch |  30 --
 ...ix-jbd2-use-the-correct-print-format.patch | 147 ++++++++
 ...ules_2.11.6.bb => lttng-modules_2.11.9.bb} |  21 +-
 .../ffmpeg/ffmpeg/CVE-2022-3109.patch         |  41 ++
 .../recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb |   1 +
 meta/recipes-support/vim/vim.inc              |   4 +-
 scripts/lib/devtool/standard.py               |   2 +-
 49 files changed, 1135 insertions(+), 1677 deletions(-)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-1962.patch
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/CVE-2022-4743.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-4283.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46340.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46341.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46342.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46343.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46344.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20221109.bb => linux-firmware_20221214.bb} (99%)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-strncpy-equals-destination-size-warning.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-fix-objtool-Rename-frame.h-objtool.h-v5.10.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-fix-btrfs-tracepoints-output-proper-root-owner-for-t.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0004-fix-btrfs-make-ordered-extent-tracepoint-take-btrfs_.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0005-fix-ext4-fast-commit-recovery-path-v5.10.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0006-fix-KVM-x86-Add-intr-vectoring-info-and-error-code-t.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0007-fix-kvm-x86-mmu-Add-TDP-MMU-PF-handler-v5.10.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0008-fix-KVM-x86-mmu-Return-unique-RET_PF_-values-if-the-.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0009-fix-tracepoint-Optimize-using-static_call-v5.10.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0010-fix-include-order-for-older-kernels.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0011-Add-release-maintainer-script.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0012-Improve-the-release-script.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0013-fix-backport-of-fix-ext4-fast-commit-recovery-path-v.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0014-Revert-fix-include-order-for-older-kernels.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0015-fix-backport-of-fix-tracepoint-Optimize-using-static.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0016-fix-adjust-version-range-for-trace_find_free_extent.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-use-the-correct-print-format.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.11.6.bb => lttng-modules_2.11.9.bb} (59%)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2022-3109.patch

-- 
2.25.1


