Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web10.8103.1620830935410900332
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 07:48:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=QVgYBaJD;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.176, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f176.google.com with SMTP id z3so21253896oib.5
        for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 07:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AmpHGxYqPkrWMLa09B7gIGhBDiUXy3BMUw+Ak/+Pmug=;
        b=QVgYBaJDzo1Pxm1uwiwtgnhqXnENesWG0dkAbvvSRJ+aNWH5aeHya3ZMMvuXUyhJlf
         pd+I3tnuej0Q4lF7hLATjGZ0icf2wAHQ9z/a8Y+vwy4TaxnpWqiDvWmvce7hDeAwLLdP
         mRCIL0BJhzu0XWV1IenLoRCNns4Sd4dF4LiILznB3lbbVV2hzf6+2FCxrBK04BeRoDKt
         3C1+Qhw1tpj6a2JVKOsPjkH2CP5hejy37lq/EOSHtwMy+7ruAkOQbcsDDh6M/eUJYdOD
         gt2qoPfvlCoPEhQzdvCUvfi30jXpEv/8KEax6ujWZXmKJZ/SfWJp1XyTcnjZMv9WLJYp
         XgvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AmpHGxYqPkrWMLa09B7gIGhBDiUXy3BMUw+Ak/+Pmug=;
        b=eAcuwN4AqEgFwZ7d5vH5664tsCiSXh9bquSoqynddNw7veizBM23/1tD72vJLCfR45
         xaLx574jOxcvnAieW+5N01zhCNY6RWJcCV89odXYXS9GLs79B/lQukUK2iAeWVqXmOcC
         l4aaRwwPCfzi+mbfOy8q/HbHhxtbwmcqyH5m6xxOe5lvDJ/QZLSZqRQZBfKrgZbUb6Nd
         Kksis9MP1+2CUVfAAeehPas+1eNmFI1PGhKV15p4iI4/gg/K1kJXNG9iPRyNOnE/RVR9
         YjdRyaiG02AbOOKzN5mIKmBH7D38euLHOR4/fKyG+ZQwrv5hIIeMxlzLtfA09ho9YEFl
         bS2A==
X-Gm-Message-State: AOAM533UoeVD7gaaxrDiOU1txbU0WPIX/CJSu4Fpphnnm6hlyAsfCkpw
	ryIfiejPF88c/aiGeT06x/9TaOEZJEzmhlzKlzg=
X-Google-Smtp-Source: ABdhPJyAXoLtebe+26mfEADDZ4xOZoygnP7QE9enfQLXgCzptCQzwEUws5JgDW7LYjJTceFNe9GmTw==
X-Received: by 2002:a05:6808:4c6:: with SMTP id a6mr23554576oie.162.1620830934139;
        Wed, 12 May 2021 07:48:54 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id q1sm4621203otc.21.2021.05.12.07.48.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 07:48:53 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/25] Pull request (cover letter only)
Date: Wed, 12 May 2021 04:47:29 -1000
Message-Id: <cover.1620830796.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 834a8e357bc999a0163e7c5bafbcc1a8816448d4:

  license_image.bbclass: Fix symlink to generic license files (2021-05-03 04:56:23 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Alexander Kanavin (5):
  diffoscope: add native libraries to LD_LIBRARY_PATH
  Revert "oeqa: Set LD_LIBRARY_PATH when executing native commands"
  ovmf: update to 202002
  ovmf: update to 202005
  ovmf: update edk2-stable202005 -> edk2-stable202008

Anatol Belski (1):
  tar: Fix CVE-2021-20193

Bruce Ashfield (4):
  linux-yocto/5.4: update to v5.4.114
  linux-yocto/5.4: update to v5.4.116
  perf: fix python-audit RDEPENDS
  make-mod-scripts: add HOSTCXX definitions and gmp-native dependency

Christophe Chapuis (1):
  rootfs.py: find .ko.gz and .ko.xz kernel modules as well

Jose Quaresma (1):
  ptest-runner: libgcc must be installed for pthread_cancel to work

Joshua Watt (1):
  classes/image: Use xargs to set file timestamps

Kai Uwe Broulik (1):
  gstreamer1.0-plugins-good: on wayland qt5 needs qtwayland

Khem Raj (1):
  cml1.bbclass: Return sorted list of cfg files

Lee Chee Yang (1):
  binutils: fix CVE-2021-3487

Mark Hatle (1):
  kernel.bbclass: Remove do_install[prefunc] no longer needed

Michael Opdenacker (1):
  sanity.bbclass: mention CONNECTIVITY_CHECK_URIS in network failure
    message

Richard Purdie (3):
  yocto-uninative: Update to 3.1 which includes a patchelf fix
  pybootchart/draw: Avoid divide by zero error
  oeqa/qemurunner: Improve logging thread exit handling for qemu
    shutdown test

Steve Sakoman (2):
  lib/package_manager: Use shutil.copy instead of bb.utils.copyfile for
    intercepts
  reproducible.py: add quilt-ptest and valgrind-ptest

Yi Fan Yu (1):
  libevent: Increase ptest timing tolerance 50 ms -> 100 ms

zhengruoqin (1):
  wireless-regdb: upgrade 2020.11.20 -> 2021.04.21

 meta/classes/cml1.bbclass                     |   2 +-
 meta/classes/image.bbclass                    |   2 +-
 meta/classes/kernel.bbclass                   |   1 -
 meta/classes/sanity.bbclass                   |   9 +-
 meta/conf/distro/include/yocto-uninative.inc  |   8 +-
 meta/lib/oe/package_manager.py                |   2 +-
 meta/lib/oe/rootfs.py                         |   2 +-
 meta/lib/oeqa/selftest/cases/reproducible.py  |   2 +
 meta/lib/oeqa/selftest/cases/runqemu.py       |   9 +-
 meta/lib/oeqa/utils/commands.py               |   3 -
 meta/lib/oeqa/utils/qemurunner.py             |  12 +-
 ...ovmf-update-path-to-native-BaseTools.patch |   6 +-
 ...ile-adjust-to-build-in-under-bitbake.patch |  32 +++--
 .../0003-ovmf-enable-long-path-file.patch     |   6 +-
 .../ovmf/0004-ovmf-Update-to-latest.patch     |  20 +--
 meta/recipes-core/ovmf/ovmf_git.bb            |   6 +-
 .../binutils/binutils-2.34.inc                |   1 +
 .../binutils/binutils/CVE-2021-3487.patch     |  83 +++++++++++
 .../tar/tar/CVE-2021-20193.patch              | 133 ++++++++++++++++++
 meta/recipes-extended/tar/tar_1.32.bb         |   1 +
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +--
 .../make-mod-scripts/make-mod-scripts_1.0.bb  |   2 +
 meta/recipes-kernel/perf/perf.bb              |   2 +-
 ....11.20.bb => wireless-regdb_2021.04.21.bb} |   2 +-
 .../gstreamer1.0-plugins-good_1.16.3.bb       |   4 +-
 .../diffoscope/diffoscope_172.bb              |   1 +
 ...ncrease-default-timeval-tolerance-50.patch |  33 +++++
 .../libevent/libevent_2.1.11.bb               |   1 +
 .../ptest-runner/ptest-runner_2.4.0.bb        |   2 +
 scripts/pybootchartgui/pybootchartgui/draw.py |   2 +-
 32 files changed, 355 insertions(+), 70 deletions(-)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2021-3487.patch
 create mode 100644 meta/recipes-extended/tar/tar/CVE-2021-20193.patch
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2020.11.20.bb => wireless-regdb_2021.04.21.bb} (94%)
 create mode 100644 meta/recipes-support/libevent/libevent/0002-test-regress.h-Increase-default-timeval-tolerance-50.patch

-- 
2.25.1

