Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.6463.1601503919491793303
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 15:11:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=z6ZPUNux;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id d13so2111656pgl.6
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 15:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=fpC0RKBhFUl39ktpk/4jS5Dvc8fF0+vIm1SEDGiIlY4=;
        b=z6ZPUNuxqhOmj6jNEbPxNxk2G/Pc9gIMfVcQHTTJXWLupfwforjFHmMuZUpUcIqCZK
         OfhoPia7zs3KencYXsj5zOaEiiD6pnIMt2D1VbWI7nDHvxcd0POlBTSLADhopfUfR866
         3A/phgCdbZu984tXs3Q5uyqcBWSxCHHpKERsnoDgRbgaMGNwGajEYLuHrHbZvjWOIrRW
         a/yzHjxM1DbmTYu0tkWBb3l2/llx4A7PRQOdz+eIeDOhkJJyOXFAlD1qruuoYMUGzmuU
         SaWMKvvyiRxRrZoWJ6pj8wrCe8Y60er91ufazFgU2yOHT4ilvetYUtL1vfDMywPz5M/e
         aVgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=fpC0RKBhFUl39ktpk/4jS5Dvc8fF0+vIm1SEDGiIlY4=;
        b=P6B/7IcnzgRj33E4qB64EEBctwgK+Y2RqgJenvnefl9VQg8578Yb0loGPUGe/MEoGW
         aSdwZupqlgMUMeCn6RFFGABywJpqeNEWZ9l/8GFcejnlIooAVogucTnq02iUalK+nhNR
         ED452HdvDYOmz+ICHKMksIQUmCgglcrn/o1AlZTTgcjnmFG52dSBcjJcXnQAz0VUq8qn
         oxSIKag7XLGwqLzmwEdicga0vZxSBOCa+H/isYJzHCZjlTuDSMbT0hBQ3T4Z7QM84hoS
         ICBFBkz/C4TH+1j6UL4I0iekRTLR7SpXZytxsSezjdSOt/fqOX/igxLxcQgO6RpJUD/7
         CfVg==
X-Gm-Message-State: AOAM533fBK/Xn/fnO9ann7RFphnz6Oa2044ZPhxWZYvzu9QVkx8LFIwH
	0O4FGmSj8Zv1DYRFu1LhdsTfXCRa0gyaELyzRQ0=
X-Google-Smtp-Source: ABdhPJxrQfjtQJiphIsFt9EB4Txa510nV2fy2WyY+g1TNNl6NM1NhoNktPeQFoGJFOUuWYMtfCacnw==
X-Received: by 2002:a17:902:ee83:b029:d1:f38b:713b with SMTP id a3-20020a170902ee83b02900d1f38b713bmr4404947pld.44.1601503918105;
        Wed, 30 Sep 2020 15:11:58 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k6sm3488799pfh.92.2020.09.30.15.11.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 15:11:57 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/41] Patch review
Date: Wed, 30 Sep 2020 12:11:02 -1000
Message-Id: <cover.1601502610.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

Please review this next set of patches for dunfell and have comments
back by end of day Friday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1440

The following changes since commit b39bda4cc62db12c0edfbe489d5a7f5988ede6a9:

  build-appliance-image: Update to dunfell head revision (2020-09-23 12:48:03 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Andrey Zhizhikin (1):
  insane: check for missing update-alternatives inherit

Bruce Ashfield (5):
  kernel-yocto: add KBUILD_DEFCONFIG search location to failure message
  linux-yocto/config: netfilter: Enable nat for ipv4 and ipv6
  linux-yocto/5.4: update to v5.4.64
  linux-yocto/5.4: update to v5.4.65
  lttng-modules: backport writeback.h changes from 2.12.x to fix kernel
    5.4.62+

Chee Yang Lee (4):
  qemu : fix CVE-2020-16092
  bash : inlcude patch 17 & 18
  xserver-xorg: fix CVE-2020-14346/14361/14362
  libx11: fix CVE-2020-14363

Chris Laplante (3):
  cve-update-db-native: be less magical about checking whether the
    cve-check class is enabled
  cve-update-db-native: move -journal checking into do_fetch
  cve-update-db-native: remove unused variable

Christian Eggers (1):
  packagegroup: rrecommend perf also for musl on ARM

De Huo (1):
  bash: fix CVE-2019-18276

Jacob Kroon (1):
  insane: Check for feature check variables not being used

Joshua Watt (4):
  wic: Add --offset argument for partitions
  wic: Fix --extra-space argument handling
  wic: Fix error message when reporting invalid offset
  wic: Add 512 Byte alignment to --offset

Khem Raj (2):
  site: Make sys_siglist default to no
  packagegroups: remove strace and lttng-tools for rv32/musl

Konrad Weihmann (1):
  testexport: rename create_tarball method

Michael Gloff (1):
  sysvinit rc: Use PSPLASH_FIFO_DIR for progress fifo

Norman Stetter (1):
  sstate.bbclass: Check file ownership before doing 'touch -a'

Otavio Salvador (1):
  openssh: Allow enable/disable of rng-tools recommendation on sshd

Randy MacLeod (1):
  curl: Change SRC_URI from http to https

Richard Purdie (10):
  python3-markupsafe: Import from meta-oe/meta-python
  python3-jinja2: Import from meta-oe/meta-python
  buildtools-tarball: Add python3-jinja2
  dropbear/openssh: Lower priority of key generation
  buildtools: Handle generic environment setup injection
  buildtools-tarball: Fix conflicts with oe-selftest and other tooling
  oeqa/qemurunner: Increase serial timeout
  oeqa/selftest/incompatible_lib: Fix append usage
  oeqa/selftest/containerimage: Update to match assumptions in
    configuration
  ssh-pregen-hostkeys: Add a recipe with pregenerated ssh host keys

Ross Burton (3):
  alsa-plugins: improve .la removal
  sato-screenshot: improve .la removal
  meta: add/fix invalid Upstream-Status tags

Steve Sakoman (1):
  xinput-calibrator: change SRC_URI to branch with libinput support

 meta/classes/insane.bbclass                   |  21 +-
 meta/classes/kernel-yocto.bbclass             |   2 +-
 meta/classes/sstate.bbclass                   |   2 +-
 meta/classes/testexport.bbclass               |   8 +-
 meta/conf/distro/include/maintainers.inc      |   3 +
 .../lib/oeqa/selftest/cases/containerimage.py |   3 +
 .../oeqa/selftest/cases/incompatible_lic.py   |   2 +-
 meta/lib/oeqa/selftest/cases/wic.py           | 157 +++++--
 meta/lib/oeqa/utils/qemurunner.py             |   2 +-
 .../openssh/openssh/sshdgenkeys.service       |   1 +
 .../openssh/openssh_8.2p1.bb                  |  10 +-
 .../ssh-pregen-hostkeys/dropbear_rsa_host_key | Bin 0 -> 805 bytes
 .../openssh/ssh_host_ecdsa_key                |   9 +
 .../openssh/ssh_host_ecdsa_key.pub            |   1 +
 .../openssh/ssh_host_ed25519_key              |   7 +
 .../openssh/ssh_host_ed25519_key.pub          |   1 +
 .../openssh/ssh_host_rsa_key                  |  38 ++
 .../openssh/ssh_host_rsa_key.pub              |   1 +
 .../ssh-pregen-hostkeys_1.0.bb                |  19 +
 .../dropbear/dropbear/dropbearkey.service     |   1 +
 meta/recipes-core/meta/buildtools-tarball.bb  |  23 +-
 .../recipes-core/meta/cve-update-db-native.bb |  18 +-
 .../packagegroup-core-tools-debug.bb          |   5 +-
 .../packagegroup-core-tools-profile.bb        |   2 +
 meta/recipes-core/sysvinit/sysvinit/rc        |   9 +-
 .../python/python3-jinja2/run-ptest           |   3 +
 .../python/python3-jinja2_2.11.2.bb           |  45 ++
 .../python/python3-markupsafe/run-ptest       |   3 +
 .../python/python3-markupsafe_1.1.1.bb        |  28 ++
 ...ssing-libraries-to-Extension-for-mul.patch |   2 +-
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 ...mu-Do-not-include-file-if-not-exists.patch |   2 +-
 .../qemu/qemu/CVE-2020-16092.patch            |  45 ++
 .../bash/bash/bash-CVE-2019-18276.patch       | 386 ++++++++++++++++++
 meta/recipes-extended/bash/bash_5.0.bb        |   8 +
 .../0004-guard-mallocopt-with-__GLIBC__.patch |   2 +-
 .../xinput-calibrator_git.bb                  |   4 +-
 .../xorg-lib/libx11/CVE-2020-14363.patch      |  36 ++
 .../recipes-graphics/xorg-lib/libx11_1.6.9.bb |   1 +
 .../xserver-xorg/CVE-2020-14346.patch         |  36 ++
 .../xserver-xorg/CVE-2020-14361.patch         |  36 ++
 .../xserver-xorg/CVE-2020-14362.patch         |  70 ++++
 .../xorg-xserver/xserver-xorg_1.20.8.bb       |   3 +
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
 ...ckport-writeback.h-changes-from-2.12.patch | 128 ++++++
 .../lttng/lttng-modules_2.11.2.bb             |   7 +-
 .../alsa/alsa-plugins_1.2.1.bb                |   2 +-
 .../sato-screenshot/sato-screenshot_0.3.bb    |   2 +-
 meta/recipes-support/curl/curl_7.69.1.bb      |   2 +-
 meta/site/common                              |   7 +
 meta/site/common-glibc                        |   3 -
 meta/site/common-musl                         |   5 -
 scripts/lib/wic/ksparser.py                   |  56 ++-
 scripts/lib/wic/partition.py                  |   1 +
 scripts/lib/wic/plugins/imager/direct.py      |  15 +
 57 files changed, 1202 insertions(+), 118 deletions(-)
 create mode 100644 meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys/dropbear_rsa_host_key
 create mode 100644 meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys/openssh/ssh_host_ecdsa_key
 create mode 100644 meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys/openssh/ssh_host_ecdsa_key.pub
 create mode 100644 meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys/openssh/ssh_host_ed25519_key
 create mode 100644 meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys/openssh/ssh_host_ed25519_key.pub
 create mode 100644 meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys/openssh/ssh_host_rsa_key
 create mode 100644 meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys/openssh/ssh_host_rsa_key.pub
 create mode 100644 meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys_1.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-jinja2/run-ptest
 create mode 100644 meta/recipes-devtools/python/python3-jinja2_2.11.2.bb
 create mode 100644 meta/recipes-devtools/python/python3-markupsafe/run-ptest
 create mode 100644 meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-16092.patch
 create mode 100644 meta/recipes-extended/bash/bash/bash-CVE-2019-18276.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/CVE-2020-14363.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14346.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14361.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14362.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-lttng-modules-backport-writeback.h-changes-from-2.12.patch

-- 
2.17.1

