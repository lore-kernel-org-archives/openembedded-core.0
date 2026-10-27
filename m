Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16182.1793097726025923542
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 03:42:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=IFBtGmIK;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so27052995e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 03:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793097724; x=1793702524; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sh/OUZlOc/qYjmftauN2nO+RACdIHG3Y88lNEUIdHlY=;
        b=IFBtGmIKNgV4+C3p046emOkIy29cTS2PdI0MKIApu9hztkpNM9BCzXsKcHJ7VSkInj
         ejL3P1HCIeA2hjC4/aGvf34B13jZuT8aXOMbZme+tPGItUYonYjYFtinpeTbwjT9RbmQ
         otrJJV7JUTq/3LDfuGlVUEauGIIawhgHmT9GB708Pvtt3hNf9OED9H08KAK+jTC4Bm9y
         k6vGVFf+2VZK3luUvly1mRX+c2rCNu/FhhrcIfHEysM58xHES4ca93ngIXEkT/2Lpt4Z
         FhSRrX+oO+4DcYWWuH9Zk2ERETqKT1+5jlZNwhjRkkJDtKqZ4dajVVGRMYMn0J7Jv1h8
         Dh4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793097724; x=1793702524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sh/OUZlOc/qYjmftauN2nO+RACdIHG3Y88lNEUIdHlY=;
        b=iH3LT6/YU+mvK57oYTwVjhFjkE1vYJes6arQMZpNKv3Z+bUBsHwAwSmkD1LjF/isud
         KdwxCcQAt9cagq+AKq4INncy4dLb0Rcya4ixSvuzlEJFeWmtNQ18GNMmYYk+dq7UKUPO
         fw0bbXUGdnLxymlmBoIdl5bpnYqtZAlqjsDYkMNpsHLvV3ZsdivLHrdF1b1WVsE2W/v5
         LXXRNurSZOU/sNHEirZcYO88XKQam2goEQ2j5hvO8fWfobWmTkmzVkt+fIIfL6jwa+Uk
         Xr3QvHNDyPlTaCKpUNsWLpl7sLoTgzUfdoDMSVCfbQadOARfh/URe5DGn2Hs7qw9Khwe
         aBKw==
X-Gm-Message-State: AFq9FYK39USmltZ4kr7IMaKt4iOpKYEmRGHfXE77iDJz3i3nvpvzwdX9
	BASEmjNBFBCfZhKsTfh3Tr5xJmjOpJm2Oag0rclQdw9Iaz0qf1pfx3uH+hngOvFU2478NifGRmJ
	M4+8U1R7YGQ==
X-Gm-Gg: AYBFou26QiSBbVmHeZN8sLruiAy75xmUrrM0+FWeaOxXjbMVT+T6ERJOif0yGSwN1CP
	r/RQZg2/YKS0zsG2qaW95vyPsWOeb7zuECiPD8kBpB2DkDsmoLi4FbDkU838tp2IC7ChuuquDe4
	ng6zfAerypAYasWrxWit3YFVdAm08jxJ+w8GKAx0RZADzti2vHX4DTdAj3YzGJJRK6fkdjMAAqF
	qjDhQNMz/kcfvPStgbkZ1454PU3A163SF0hD8nkV5ChCCkyRV10xwcnXDIXIex/H2S0cii4vCrm
	bBakyH8/LRRODRDdcWi3a5eaCkn9K9PcEEN/HUTh6qjrIT0og34x+jTGzUihTfppZRmzaAbmZXT
	Z5408/BhjGaIt2H/6FhvMCCqalMpi1FCYIigpNysqOtTLbEzS4lP2xwat1tPooFlemHlOBtXOgb
	kgQmK+3qS8vaU76aOIVCAL8xT7QkzZAirTr72uH7G+iFeieqx0CUNasPWrHjfUmmweqZxRCooNv
	+lOt9/4mlleUIkYEoTSiwr7qRHzXlhbTcRseLK1eg/dev7TdyLE7e5AbK+buwHcrszffdrhiSr4
	Q9XCVr7ssfnVU1weL6ZdA8NpqBCKRZx4X1+fdj/4Osxw01Rc0ZYnlFfOnAsYimbLPIfpeLwWD71
	9
X-Received: by 2002:a05:600c:8b09:b0:4a1:7e76:d02f with SMTP id 5b1f17b1804b1-4a35aca4a0cmr175542785e9.14.1793097723966;
        Tue, 27 Oct 2026 03:42:03 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0aa097sm285219585e9.3.2026.10.27.03.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:42:03 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][wrynose 00/25] Pull request (cover letter only)
Date: Tue, 27 Oct 2026 11:41:44 +0100
Message-ID: <cover.1793096856.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 10:42:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248725
Content-Type: text/plain; charset="utf-8"

Those are the patches from the last patch review:
https://lore.kernel.org/all/cover.1792537664.git.yoann.congal@smile.fr/
(No review, no change, only answer was a false positive from patchtest)

Note: the branch was rebased on top of Paul's ca-certs patches merged
recently.

Passed a-full on autobuilder (before rebase):
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/4961

The following changes since commit 884a91e689d545238cfabd7926c93663950ca286:

  python3-certifi: upgrade 2026.7.22 -> 2026.10.19 (2026-10-22 11:54:10 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/wrynose-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/wrynose-next

for you to fetch changes up to ae5a301091f5b0574ea7444aab40b309b6d9f3f2:

  glib-2.0: upgrade 2.88.3 -> 2.88.4 (2026-10-27 08:03:41 +0100)

----------------------------------------------------------------

Ankur Tyagi (1):
  tzdata/tzcode-native: upgrade 2026d -> 2026e

Bruce Ashfield (1):
  linux-yocto/6.18: update to v6.18.54

Daniel Turull (6):
  xz: upgrade 5.8.2 -> 5.8.4
  lttng-modules: upgrade 2.14.4 -> 2.14.7
  lttng-tools: upgrade 2.14.1 -> 2.14.3
  lttng-ust: upgrade 2.14.0 -> 2.14.3
  libgcrypt: upgrade 1.12.1 -> 1.12.4
  glib-2.0: upgrade 2.88.3 -> 2.88.4

Hemanth Kumar M D (1):
  gcc: Fix for CVE-2026-102010

Hetvi Thakar (1):
  python3-cryptography: fix CVE-2026-69247

Jaipaul Cheernam (2):
  curl: fix CVE-2026-80230
  python3-urllib3: Fix CVE-2026-97689

Jakub Szczudlo (Nokia) (1):
  libarchive: fix CVE-2026-15028

Kris Gavvala (2):
  nasm: fix CVE-2026-6067
  nasm: fix CVE-2026-6068

Lucas Stach (1):
  barebox: inherit upstream-stable-release-point

Peter Marko (7):
  libpng: upgrade 1.6.58 -> 1.6.59
  popt: patch CVE-2026-18743
  popt: patch CVE-2026-18739
  expat: patch CVE-2026-102633
  expat: patch CVE-2026-77214
  glib-2.0: upgrade 2.88.2 -> 2.88.3
  libpcre2: update to latest release branch hash c084f99ae0

Roopa Kalmath (1):
  u-boot: fix CVE-2026-29009

Sergio Prado (1):
  kernel-fit-image: reference the boot script as "script"

 meta/lib/oe/fitimage.py                       |   4 +-
 meta/lib/oeqa/selftest/cases/fitimage.py      |   2 +-
 meta/recipes-bsp/barebox/barebox.bb           |   2 +-
 .../u-boot/files/CVE-2026-29009.patch         |  53 +++
 meta/recipes-bsp/u-boot/u-boot_2026.01.bb     |   4 +-
 .../expat/expat/CVE-2026-102633.patch         |  68 +++
 .../expat/expat/CVE-2026-77214.patch          | 106 +++++
 meta/recipes-core/expat/expat_2.8.3.bb        |   2 +
 ...t-write-bindir-into-pkg-config-files.patch |   6 +-
 ...0001-Fix-DATADIRNAME-on-uclibc-Linux.patch |   2 +-
 ...-gio-querymodules-as-libexec_PROGRAM.patch |  21 +-
 ...ng-about-deprecated-paths-in-schemas.patch |   2 +-
 ...ces.c-comment-out-a-build-host-only-.patch |   2 +-
 ...on-Run-atomics-test-on-clang-as-well.patch |   4 +-
 ...ot-enable-pidfd-features-on-native-g.patch |   4 +-
 ...dcode-python-path-into-various-tools.patch |   4 +-
 .../glib-2.0/files/CVE-2026-58016-1.patch     |  14 +-
 .../glib-2.0/files/CVE-2026-58016-2.patch     |  10 +-
 .../glib-2.0/files/relocate-modules.patch     |   4 +-
 .../glib-2.0/files/skip-timeout.patch         |   2 +-
 ...l_2.88.2.bb => glib-2.0-initial_2.88.4.bb} |   0
 ...{glib-2.0_2.88.2.bb => glib-2.0_2.88.4.bb} |   0
 meta/recipes-core/glib-2.0/glib.inc           |   2 +-
 meta/recipes-devtools/gcc/gcc-15.3.inc        |   1 +
 .../gcc/gcc/0029-CVE-2026-102010.patch        |  73 +++
 .../nasm/nasm/CVE-2026-6067.patch             |  36 ++
 .../nasm/nasm/CVE-2026-6068-1.patch           |  98 ++++
 .../nasm/nasm/CVE-2026-6068-2.patch           |  80 ++++
 .../nasm/nasm/CVE-2026-6068-3.patch           |  51 ++
 meta/recipes-devtools/nasm/nasm_3.01.bb       |   4 +
 .../python/python3-cryptography.bb            |   1 +
 .../python3-cryptography/CVE-2026-69247.patch | 435 ++++++++++++++++++
 .../python3-urllib3/CVE-2026-97689.patch      | 251 ++++++++++
 .../python/python3-urllib3_2.6.3.bb           |   6 +-
 .../libarchive/CVE-2026-15028.patch           |  41 ++
 .../libarchive/libarchive_3.8.7.bb            |   1 +
 meta/recipes-extended/timezone/timezone.inc   |   6 +-
 ...buffer-overflow-in-lzma_index_append.patch |  66 ---
 .../xz/{xz_5.8.2.bb => xz_5.8.4.bb}           |   3 +-
 .../linux/linux-yocto-rt_6.18.bb              |   6 +-
 .../linux/linux-yocto-tiny_6.18.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto_6.18.bb |  24 +-
 ...st-range-in-btrfs-probe-for-v6.18.14.patch |  36 --
 ...ce-trace-noise-in-hrtimer_start-v7.1.patch | 103 -----
 ...ules_2.14.4.bb => lttng-modules_2.14.7.bb} |   4 +-
 .../lttng/lttng-tools/disable-tests.patch     |  11 +-
 ...-tools_2.14.1.bb => lttng-tools_2.14.3.bb} |   2 +-
 ...ttng-ust_2.14.0.bb => lttng-ust_2.14.3.bb} |   2 +-
 .../{libpng_1.6.58.bb => libpng_1.6.59.bb}    |   2 +-
 .../curl/curl/CVE-2026-80230.patch            |  68 +++
 meta/recipes-support/curl/curl_8.19.0.bb      |  62 +--
 ...s-Fix-link-errors-for-t-thread-local.patch |  13 +-
 .../libgcrypt/files/CVE-2026-41989.patch      |  42 --
 .../libgcrypt/files/CVE-2026-41990.patch      | 316 -------------
 ...ibgcrypt_1.12.1.bb => libgcrypt_1.12.4.bb} |   6 +-
 .../recipes-support/libpcre/libpcre2_10.47.bb |  18 +-
 .../popt/popt/CVE-2026-18739.patch            |  92 ++++
 .../popt/popt/CVE-2026-18743.patch            |  97 ++++
 meta/recipes-support/popt/popt_1.19.bb        |   4 +-
 59 files changed, 1688 insertions(+), 697 deletions(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2026-29009.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-102633.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-77214.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.88.2.bb => glib-2.0-initial_2.88.4.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.88.2.bb => glib-2.0_2.88.4.bb} (100%)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0029-CVE-2026-102010.patch
 create mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2026-6067.patch
 create mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2026-6068-1.patch
 create mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2026-6068-2.patch
 create mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2026-6068-3.patch
 create mode 100644 meta/recipes-devtools/python/python3-cryptography/CVE-2026-69247.patch
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2026-97689.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2026-15028.patch
 delete mode 100644 meta/recipes-extended/xz/xz/0001-liblzma-Fix-a-buffer-overflow-in-lzma_index_append.patch
 rename meta/recipes-extended/xz/{xz_5.8.2.bb => xz_5.8.4.bb} (95%)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-adjust-range-in-btrfs-probe-for-v6.18.14.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-hrtimer-Reduce-trace-noise-in-hrtimer_start-v7.1.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.14.4.bb => lttng-modules_2.14.7.bb} (87%)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.14.1.bb => lttng-tools_2.14.3.bb} (99%)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.14.0.bb => lttng-ust_2.14.3.bb} (96%)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.58.bb => libpng_1.6.59.bb} (97%)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-80230.patch
 delete mode 100644 meta/recipes-support/libgcrypt/files/CVE-2026-41989.patch
 delete mode 100644 meta/recipes-support/libgcrypt/files/CVE-2026-41990.patch
 rename meta/recipes-support/libgcrypt/{libgcrypt_1.12.1.bb => libgcrypt_1.12.4.bb} (89%)
 create mode 100644 meta/recipes-support/popt/popt/CVE-2026-18739.patch
 create mode 100644 meta/recipes-support/popt/popt/CVE-2026-18743.patch

