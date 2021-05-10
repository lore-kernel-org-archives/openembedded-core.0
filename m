Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web11.32402.1620656972700676902
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 07:29:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=bw2Rqa/Y;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.172, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f172.google.com with SMTP id w22so2076105oiw.9
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 07:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EGTgdB9eU3hmYJ4hmJNIYfHbSdHshSct0lTH9pMzFIM=;
        b=bw2Rqa/YxEjilo+ZUeyHlmUVlWB6gbL9Ge0SnGKdStKgBz98lOyh2z+NsfwM7ZfCPe
         UOTCV7UXgAgBKNkeccRJxI1YHqGOYFM77pDmu4F93j/G3eAu69f9vo8/0wCr+FCQafn7
         KQ9TnQc2XBsGlT8XAAXbvcxNxCqbfYMAqh42ziNubCiptadU4iRfEcnQ0Sndrg6Q6OO3
         yQrKJN/W0BJ0Ma8em2fl8TV5cuiJnsNlOXMffkFriNjyIzJ5pbo/BG7u9fKplOxTn6/2
         03T8t4SRuUfqpHGAZV8BvzmcnTjPYGExbd3X15mWrDq1eqALBrTKSjZE3aDuSQHugERm
         u15Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EGTgdB9eU3hmYJ4hmJNIYfHbSdHshSct0lTH9pMzFIM=;
        b=d24bpChqydQGPlJvSl/QbaE+poo7YTi/vkZLzOCXDF4iD0jsdoi/cf93aUMT0oteNq
         +dz2X8AtG4Um5kxsOjQD5YRTSKw40Gy+P8lK/ERkTwJ00o5JbdzA6m4Z7RgPbwAB2K+B
         hxZPJmoebxvS8tXmoY1DmQKnCS3MkXAt3XicqeIb0BdpoH9itjYRDm2464A8++QB/P8j
         QgsixV3gCKQLzOcomyMkc0T4GzDlZJsLQ/kmsitljZUNmuxrkVrr2h379sniRmaDpOUb
         wEUTDTdxMP8gKvCgAoklBRP/+l1DrwYcnaTemWmyzCIKo0wfre2Ums9jizHhR+ILc8SB
         w+Kg==
X-Gm-Message-State: AOAM530UQxC61dNDvurveNz9v7T4Yu6RFAuxOSlZc8QWH1OgqcvVrRtk
	1eg/InYL9GloQPnGz4VUB/QeW3LDdZMuJ9MD3D0=
X-Google-Smtp-Source: ABdhPJzw5b+EYaY523ZDZBaKCfE6HQWArrN+XnTx1OExZN6N6m7SL07i2mcNM/9auaYgnZVs6hRc1Q==
X-Received: by 2002:aca:bac2:: with SMTP id k185mr17860393oif.2.1620656971513;
        Mon, 10 May 2021 07:29:31 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id g16sm2661309oof.43.2021.05.10.07.29.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 07:29:31 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/25] Patch review
Date: Mon, 10 May 2021 04:28:42 -1000
Message-Id: <cover.1620656333.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please review this next set of patches for dunfell and have comments back by
end of day Wednesday.

Of particular note this week are the last four patches in the series:

26f7657698 ovmf: update to 202002
28f6c91b8b ovmf: update to 202005
aaeb10db2a ovmf: update edk2-stable202005 -> edk2-stable202008
5b2ad70cd8 reproducible.py: add quilt-ptest and valgrind-ptest

These patches allow us to add Fedora 33 as a supported distribution. I've
included them in my testing over the past few weeks and have encountered
no issues  with a-full and meta-oe tests (other than the intermittent
reproducibility failures outlined in the final patch).

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2130

The following changes since commit 834a8e357bc999a0163e7c5bafbcc1a8816448d4:

  license_image.bbclass: Fix symlink to generic license files (2021-05-03 04:56:23 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

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

