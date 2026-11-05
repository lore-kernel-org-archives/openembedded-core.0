Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29797.1793868219333148036
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:43:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=fq5P2/BS;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so1864645e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868217; x=1794473017; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MQgut/RlLq8zhjJ5OZYuJXkDgvbsyPHInFMb7VV9FO0=;
        b=fq5P2/BSZtMZQYk/egjnbtXJE3kNFLDC+exWHcW+bkc4yPxiCopg/Vsa1WpEbdHjGw
         82xfc1CeKimiu/7Yud7qN9Ut5Kue47fRMlayMEt8u3eSHTOo9ahjFF7/m493yX5aSYyV
         pcTmVGBy5QD7QxhSI7p8jx/FRpBaOhqyHTzT284BYGIJq35h8/6YqWsvMlVROoW7CIAi
         imukno5F+EF5C5T0MM3eT4s2/GVCo9PgLr71BvYfs6RVXqouQRwU/Qa7hTiNOQtnb0tE
         q1BeTEm8QXk5BrMXPnUkNRJhEXe1RzchfqQcK64h2h5TD9doDF/IGSDo46kf7iTXxfcx
         aGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868217; x=1794473017;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MQgut/RlLq8zhjJ5OZYuJXkDgvbsyPHInFMb7VV9FO0=;
        b=nE3pMCVmUFeXDkR0treSRfpD6UjzLK0+Fda7tBq4fagxlNf1AJEURw4EYFc3MV/dG4
         9+MNY9kjIdPxyabIYVjYmzaanaSZxWlGSPBk+IVL0erX6XOyZcWn41V4Fek4+F4V9xrG
         F30PpeTaMAioLt2WVEJIgk9W7n37IA5hVD8CvUxmtYyNyaEsrbR8kwoXKNsTghvDq+1u
         2nrpWEG+4Kyzo50flLqsTjVf++yrz6ZJYZpvs3bfbjVbuwpw9XAEaNRs5L4gr3agQxQH
         ybcMcguM3v6Oh5iP8+Xx4hAX6okAVAGZqodZA2lti9b1iVzh5PqoNM3ngJSpeEZUFCkP
         l5yA==
X-Gm-Message-State: APuU4Z9iR1O28SJmoHPiM+dSdZk0QcHUVDWqXHLqrb5vWR7+CFcyah4/
	u+ReRp5Wpv5CcJa24V5xZrDfChyHRUKN1YmK1Zg3IpIryLJOz6rOd5Yic5AEjiDvJbGUvTUMH+s
	yiiKOZqI=
X-Gm-Gg: AYBFou0lRcL7p1V005OZ6CHQwhkd/p7FFhKRe8BwnWho8cPNZ3zp79pmgNbkLVWqYxu
	dfxg1gGfp/eNw1MuBDWyfNl+OkmdpOA8w5DuhbGnmOIqIzvP1Fh5/Xw/XRlz5Czv2hO8wi/fbTc
	t5jtwqBsvORYX+CkpXIPLrI/pDZFIHQI9aRMQSrcs9fVur2WtbfASGYOF0cpQGXPPYOGQkL5WMQ
	tzRbrscIM6g5v4SojxTpzbGoFIYPGaYGohI0CkhNTKf4tQbXiiHqT5H1Z6uf7x8Lu+I3UoWIGSB
	NJSJThHQKS4lev02/QeYzk6NZ8ZGfoVuXncLTOaGg9szm9eHD3+8V8X6rGPswOo3oj/7l10X3PQ
	18CIahH7J9hwouQD4+ryK6UyyK4+cL559YyhHa9Xn+nfT6i1peKrZ2DgXVNnW2peR2nNk3U+wo1
	53OAMBx2TFv3scz6DKIUqpkoA7nDyqkQ3yznpxY/xn1XIqZi4XXR0J/Szz3DkvucmEfJ0ZtiHLP
	ZxSeTP38grYraLrjIeFo/Z7c8PbTRvzHqdGWS3U8ysOt+NiR9Htvx4FJA5zCmlXQpM9PFdi1KH8
	cB0u8pU+D3dt//syn1/n/PzAPejp2KHymTCK/zUoovlmjM6x5qmYsXwO9HQiqwy/AfCvpmlMHD9
	yU7XGcg1PeeJek916ayG05z1hj/0U
X-Received: by 2002:a05:600c:c112:b0:4a1:dbdf:6d31 with SMTP id 5b1f17b1804b1-4b56163dc58mr27716705e9.19.1793868217119;
        Thu, 05 Nov 2026 00:43:37 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.43.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:43:36 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 00/60] Patch review
Date: Thu,  5 Nov 2026 09:42:19 +0100
Message-ID: <cover.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:43:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249459
Content-Type: text/plain; charset="utf-8"

Please review this set of changes for blacksail and have comments back by
end of day Monday, November 9.
This series includes cherry-picks I chose up to master 8ef4d31a295
(uki.bbclass: drop stray f-string prefix in kernel-not-found error,
2026-10-29). If you think an older commit should have been cherry-picked
as well ping me or send a backport.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/5060

The following changes since commit d3494922ad3e10a8880fa349366eb22e1f9f24ca:

  python3-certifi: upgrade 2026.7.22 -> 2026.10.19 (2026-10-22 11:33:09 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/blacksail-review
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/blacksail-review

for you to fetch changes up to 31745aa71547d4559dad9bf41c96a143d15fa4cc:

  insane: fix unimplemented-ptest error handling (2026-11-04 22:21:43 +0100)

----------------------------------------------------------------

Adarsh Jagadish Kamini (2):
  curl: fix CVE-2026-92388
  curl: fix CVE-2026-92389

Adrian Freihofer (4):
  oe-selftest: devtool: retry lldb batch on handshake timeout
  kernel-fit-image: add FIT_LOADABLE_* variables to do_compile vardeps
  devtool: ide-sdk: honor XDG_DATA_HOME for the CMake kits
  oe-selftest: devtool: do not add ide-sdk test kits to the user's CMake
    kits

Bruce Ashfield (7):
  linux-yocto/6.18: aufs: refresh to upstream aufs6.18
  linux-yocto/7.2: aufs: refresh to upstream aufs7.2
  linux-yocto/6.18: update to v6.18.57
  linux-yocto/7.2: update to v7.2.11
  linux-yocto/6.18: update to v6.18.59
  linux-yocto/7.2: update to v7.2.13
  linux-yocto/7.2: yaffs2: backport upstream fixes and restore remount
    handling

Daniel Turull (1):
  oe/reproducible: exclude __CACHED_SOURCE_DATE_EPOCH from task hash

Francesco Valla (1):
  spdx_common: fix source inclusion with externalsrc

Jaipaul Cheernam (2):
  bind: upgrade 9.20.29 -> 9.20.30
  cups: upgrade 2.4.19 -> 2.4.20

Khem Raj (10):
  packagegroup-core-tools-testapps: Ignore gst-examples for rv32
  python3-sphinx: Add python3-compile to RDEPENDS
  python3-babel: Add python3-zoneinfo to RDEPENDS
  python3-sphinxcontrib-applehelp: Add missing runtime dependencies
  libfyaml: Link with libatomic on targets lacking 64-bit atomics
  libfyaml: Detect the need for libatomic at configure time
  opensbi: Fix build with clang 23
  piglit: Fix build with glibc 2.43+ and clang
  rust-common: Use 64-bit time_t libc layouts for riscv32 musl
  python3targetconfig: Do not add the current directory to PYTHONPATH

Luca Boccassi (1):
  systemd: create the clock group for udev

Martin Hundebøll (1):
  systemd: merge group members from /etc/group and nss-systemd

Maxin John (2):
  archiver.bbclass: fix format string argument mismatch in fatal message
  insane: fix unimplemented-ptest error handling

OOHehir (2):
  tcl, tcl8: set override-specific ptest skips in SKIPPED_TESTS
  tcl, tcl8: skip binary-40.3 on RISC-V

Owen O'Hehir (3):
  strace: skip qual_fault-syscall.test on riscv64
  lttng-tools: skip kernel cases when kernel tests are disabled
  python3-numpy: call libm for ceil/floor/trunc on riscv64

Paul Barker (1):
  b4-config: add send-prefixes for blacksail

Peter Kjellerstedt (1):
  stress-ng: Inherit pkgconfig

Peter Marko (4):
  go: upgrade 1.27.2 -> 1.27.3
  boost: patch CVE-2023-34399
  python3: upgrade 3.14.9 -> 3.14.10
  systemd: add iproute2-devlink runtime dependency to udev

Pratik Farkase (1):
  python3: ptest: skip flaky test_shutdown_no_wait_max_tasks_gh119592

Ricardo Salveti (1):
  sstatesig: write locked-sigs.inc atomically

Richard Purdie (3):
  erofs-utils: Make reproducible for different BUILD_ARCH
  python3: Fix build arch reproducibility issues
  populate_sdk_ext: Fix locale error handling in SDK

Ross Burton (6):
  python3-pip: upgrade 26.2.1 -> 26.2.2
  python3: upgrade 3.14.7 -> 3.14.9
  libical: uprade 4.0.5 -> 4.0.6
  libical: upgrade 4.0.6 -> 4.0.7
  piglit: fix build with Python 3.14.9
  python3: skip test.test_readline.TestHistoryManipulation on musl

Roy Cohen (1):
  oe.patch: fix Git note identity in commitIgnored

Shantanu Majumdar (1):
  gstreamer1.0-plugins-bad: use gtk+3 dependency name

Theo Gaige (Schneider Electric) (1):
  python3-pyelftools: add missing runtime dependencies

Yoann Congal (3):
  pseudo: Upgrade 1.9.11 -> 1.9.12+git
  scripts/install-buildtools: Update default to 6.1
  README: Add blacksail subject-prefix to git-send-email suggestion

Yogita Urade (1):
  bison: Fix CVE-2026-56390

 .b4-config                                    |   1 +
 README.md                                     |   2 +-
 meta/classes-global/insane.bbclass            |   2 +-
 meta/classes-recipe/kernel-fit-image.bbclass  |  14 +-
 meta/classes-recipe/populate_sdk_ext.bbclass  |   2 +-
 .../python3targetconfig.bbclass               |   2 +-
 meta/classes-recipe/rust-common.bbclass       |   3 +
 meta/classes/archiver.bbclass                 |   2 +-
 meta/lib/oe/patch.py                          |   2 +-
 meta/lib/oe/reproducible.py                   |   3 +
 meta/lib/oe/spdx_common.py                    |  11 +-
 meta/lib/oe/sstatesig.py                      |   4 +-
 meta/lib/oeqa/selftest/cases/devtool.py       |  38 ++-
 meta/lib/oeqa/selftest/cases/oelib/patch.py   |  46 ++++
 ...-Remove-unused-baudrate-frequency-gl.patch |  67 +++++
 meta/recipes-bsp/opensbi/opensbi_1.9.bb       |   1 +
 ...1-avoid-start-failure-with-bind-user.patch |   2 +-
 ...kport-ax_prog_cc_for_build.m4-macros.patch |   2 +-
 ...d-V-and-start-log-hide-build-options.patch |   4 +-
 ...ching-for-json-headers-searches-sysr.patch |   4 +-
 .../recipes-connectivity/bind/bind/conf.patch |   2 +-
 ...t.d-add-support-for-read-only-rootfs.patch |   2 +-
 .../bind/make-etc-initd-bind-stop-work.patch  |   2 +-
 .../bind/{bind_9.20.29.bb => bind_9.20.30.bb} |   2 +-
 .../packagegroup-core-tools-testapps.bb       |   1 +
 meta/recipes-core/systemd/systemd_261.3.bb    |   6 +-
 .../bison/bison/CVE-2026-56390.patch          | 236 ++++++++++++++++++
 meta/recipes-devtools/bison/bison_3.8.2.bb    |   1 +
 .../erofs-utils/erofs-utils_1.9.4.bb          |   5 +
 .../go/{go-1.27.2.inc => go-1.27.3.inc}       |   2 +-
 ...e_1.27.2.bb => go-binary-native_1.27.3.bb} |   6 +-
 ..._1.27.2.bb => go-cross-canadian_1.27.3.bb} |   0
 ...{go-cross_1.27.2.bb => go-cross_1.27.3.bb} |   0
 ...osssdk_1.27.2.bb => go-crosssdk_1.27.3.bb} |   0
 ...runtime_1.27.2.bb => go-runtime_1.27.3.bb} |   0
 .../go/{go_1.27.2.bb => go_1.27.3.bb}         |   0
 meta/recipes-devtools/pseudo/pseudo_git.bb    |   6 +-
 .../python/python3-babel_2.18.0.bb            |   1 +
 .../python/python3-numpy_2.5.3.bb             |   5 +
 .../python3-pip/no_shebang_mangling.patch     |   8 +-
 ...n3-pip_26.2.1.bb => python3-pip_26.2.2.bb} |   2 +-
 .../python/python3-pyelftools_0.33.bb         |   8 +-
 .../python/python3-sphinx_9.1.0.bb            |   1 +
 .../python3-sphinxcontrib-applehelp_2.0.0.bb  |   5 +
 ...shebang-overflow-on-python-config.py.patch |   2 +-
 ...-use-prefix-value-from-build-configu.patch |   2 +-
 ...-qemu-wrapper-when-gathering-profile.patch |   2 +-
 ...est_sysconfig-for-posix_user-purelib.patch |   2 +-
 ...146207-Add-support-for-OpenSSL-4.0.0.patch |  29 +--
 ...Update-_ssl._SSLSocket-for-OpenSSL-4.patch |  10 +-
 ...utdown-test-in-test_ssl.test_got_eof.patch |   2 +-
 .../python/python3/makerace.patch             |   2 +-
 .../{python3_3.14.7.bb => python3_3.14.10.bb} |  29 ++-
 meta/recipes-devtools/strace/strace_7.2.bb    |  12 +
 meta/recipes-devtools/tcltk/tcl_9.0.4.bb      |  15 +-
 meta/recipes-devtools/tcltk8/tcl8_8.6.18.bb   |  15 +-
 .../cups/0001-use-echo-only-in-init.patch     |   2 +-
 ...-don-t-try-to-run-generated-binaries.patch |   2 +-
 ...-fix-multilib-install-file-conflicts.patch |   2 +-
 .../cups/cups/libexecdir.patch                |   2 +-
 .../cups/{cups_2.4.19.bb => cups_2.4.20.bb}   |   2 +-
 .../stress-ng/stress-ng_0.22.00.bb            |   2 +-
 ...ader_runner-Keep-strchr-result-const.patch |  31 +++
 ...-reproducible_mtime-should-be-an-int.patch |  33 +++
 meta/recipes-graphics/piglit/piglit_git.bb    |   2 +
 .../linux/linux-yocto-rt_6.18.bb              |   6 +-
 .../linux/linux-yocto-rt_7.2.bb               |   6 +-
 .../linux/linux-yocto-tiny_6.18.bb            |   6 +-
 .../linux/linux-yocto-tiny_7.2.bb             |   6 +-
 meta/recipes-kernel/linux/linux-yocto_6.18.bb |  24 +-
 meta/recipes-kernel/linux/linux-yocto_7.2.bb  |  24 +-
 ...our-LTTNG_TOOLS_DISABLE_KERNEL_TESTS.patch | 108 ++++++++
 .../lttng/lttng-tools_2.16.0.bb               |   1 +
 .../gstreamer1.0-plugins-bad_1.28.7.bb        |   2 +-
 .../boost/boost/CVE-2023-34399.patch          |  35 +++
 meta/recipes-support/boost/boost_1.92.0.bb    |   1 +
 .../curl/curl/CVE-2026-92388-1.patch          | 133 ++++++++++
 .../curl/curl/CVE-2026-92388-2.patch          |  31 +++
 .../curl/curl/CVE-2026-92389.patch            |  53 ++++
 meta/recipes-support/curl/curl_8.22.0.bb      |   3 +
 ...e-platforms-need-latomic-for-atomics.patch |  95 +++++++
 .../libfyaml/libfyaml_0.9.6.bb                |   1 +
 ...001-Mark-ICU-as-private-linkage-1366.patch |  76 ------
 .../{libical_4.0.5.bb => libical_4.0.7.bb}    |   6 +-
 scripts/install-buildtools                    |   4 +-
 scripts/lib/devtool/ide_plugins/ide_code.py   |   7 +-
 86 files changed, 1129 insertions(+), 212 deletions(-)
 create mode 100644 meta/recipes-bsp/opensbi/files/0002-lib-utils-serial-Remove-unused-baudrate-frequency-gl.patch
 rename meta/recipes-connectivity/bind/{bind_9.20.29.bb => bind_9.20.30.bb} (97%)
 create mode 100644 meta/recipes-devtools/bison/bison/CVE-2026-56390.patch
 rename meta/recipes-devtools/go/{go-1.27.2.inc => go-1.27.3.inc} (91%)
 rename meta/recipes-devtools/go/{go-binary-native_1.27.2.bb => go-binary-native_1.27.3.bb} (80%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.27.2.bb => go-cross-canadian_1.27.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.27.2.bb => go-cross_1.27.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.27.2.bb => go-crosssdk_1.27.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.27.2.bb => go-runtime_1.27.3.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.27.2.bb => go_1.27.3.bb} (100%)
 rename meta/recipes-devtools/python/{python3-pip_26.2.1.bb => python3-pip_26.2.2.bb} (97%)
 rename meta/recipes-devtools/python/{python3_3.14.7.bb => python3_3.14.10.bb} (94%)
 rename meta/recipes-extended/cups/{cups_2.4.19.bb => cups_2.4.20.bb} (51%)
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-shader_runner-Keep-strchr-result-const.patch
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-tests-serializer-reproducible_mtime-should-be-an-int.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-tests-honour-LTTNG_TOOLS_DISABLE_KERNEL_TESTS.patch
 create mode 100644 meta/recipes-support/boost/boost/CVE-2023-34399.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92388-1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92388-2.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92389.patch
 create mode 100644 meta/recipes-support/libfyaml/libfyaml/0003-autoconf-Some-platforms-need-latomic-for-atomics.patch
 delete mode 100644 meta/recipes-support/libical/libical/0001-Mark-ICU-as-private-linkage-1366.patch
 rename meta/recipes-support/libical/{libical_4.0.5.bb => libical_4.0.7.bb} (91%)

