Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4760.1792538574387506440
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 16:22:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20251104.gappssmtp.com header.s=20251104 header.b=SfkFH3aA;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so1205295e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 16:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20251104.gappssmtp.com; s=20251104; t=1792538572; x=1793143372; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YtxYp9Q/ZNu4fC+RCyRRxqEceY+3VstKfwO00Q+mAnQ=;
        b=SfkFH3aAecdWLJtPJs0b0BUmBa/h1OY+hdTJvvvmiVuOpQhvr1ftW+b809+OuX63S0
         4e54y1HNPn3n+gVekR5I5yeZu7sLaibNcqL7A5Lw9oegpUS3lplYMBWENUsWTMi4wDb+
         HpgQ+k6VPg6L+JkSoDEZZrYCilIShWOZ+hs3pqT4k48ujlpBAz5UwWZhXHPf3k1UhHpX
         KZ1tCTFGMFwBXkrnYWQCO9+5PVj7zX8LQ0FSV1BdVeSs9Ef5ZROgS7d+BoMkwTmh/Cf3
         BeJZ4mBveaPPkL+4mREUOibItCbfmyfbUz+ZK+sdVQcEOPoaQq+sxEj8AUlfiqdrYsa/
         i/NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792538572; x=1793143372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YtxYp9Q/ZNu4fC+RCyRRxqEceY+3VstKfwO00Q+mAnQ=;
        b=Mo38s6FU8FFjvsfXUAE0k8pcw38ERsLCs3s01QA89HZne7E7ml1janedLqFp1nB0v4
         7GefYCHWn0j6hmwOyEeB2VeeZeS6HWQwGoTBp68AGJb22DMCsTsvcTh+Y4F6STDS3JCW
         9nZHWp1QZrcSfRhRU6zFLwfXO9e5qp80cvTGlLLPRUGiZUzPn9z2ZooWuN176Mlwlihg
         QlU2O6t53cRnMK901ajv1a0MiiVcc2vOahjGMuzB+vims0MugE1RAwdenh3UQaV+L5sx
         WtigIibK14cABA1VYKVQ7yhyck753tI6apDtREHARw54LRSvIPVhBW5Y/uB5zXM934WD
         +VHw==
X-Gm-Message-State: AFq9FYLFybnovw73OY7b5Oef97KmBVrah46oj6EokMgT+lgmk5PuCkse
	5H5aY6qWegfwqG1Mg6aiRNCmuOoHLk47UpJCF4ooCJJlyv6tgjQY9HcWldiYJAFoqjuhnlBLV9/
	zAYw4o7g=
X-Gm-Gg: AYBFou0+40fOHd2DzbUioRHuRIQq5PZOIQSTn7tGuEdbS9QQXENKAHMWyenc9tY3lEB
	zXFaAur5Is/KM8qw03qwn3A/QOB1rb1zGFOcbDi9jCc7loA4lclS+bJHEMBy5nYVvd8p8qKZpHV
	dQVRYjZcQc8fu+882AsSZd0XPF2S8PdMLhQtvdMfu/mkAAjMZ2E+y4GTp/jBXIDAaYXlZCvJZKX
	Ks9maeltYseWYlU8Bdr+/zzlNGXUjuBq1Jdqdy5cMNYCCY6G3Mm2rDNLEh89kYxLCN76LPJyJr8
	wr27ofj7bCwzXPHPI7feWL7Qv5Mg31Gqg/vjU5p3Zda+GnPWpCRJW42745x3Z9WC0hTse2uUC/s
	gR6x1I4iHlAedjaQB90coiiDKDu1ajjA8/BHjcO1RJSbvpsA6WWzUxIgpnd/8XaxIW7U9g8Ie36
	++SZ9lwBpghbnUk8JhK1iqZl6Br8nwm/MXrKPyoUQXC06k+k76mL5ge5A7z5JM5rn8Cu6w+l90m
	yfVhlixlbyxxcW8ewN+owhBJiJEUW93vGU1S0OrjgjPzA0PTJa43Mvd2DbSNgRsS8U9azr2WpFz
	9PlGVdP4CBcZ9cOlnTvOEBwMwpZuPEHi2z+8omMB+XdA3X6F6/Jswr4B0AsZlFd61TmXermr7jg
	+
X-Received: by 2002:a05:600c:4ecb:b0:4a1:a475:d885 with SMTP id 5b1f17b1804b1-4a1fdd24cf6mr3848105e9.34.1792538571744;
        Tue, 20 Oct 2026 16:22:51 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583523asm1436615f8f.37.2026.10.20.16.22.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 16:22:51 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 00/25] Patch review
Date: Wed, 21 Oct 2026 01:22:10 +0200
Message-ID: <cover.1792537664.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 23:22:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248320
Content-Type: text/plain; charset="utf-8"

Please review this set of changes for wrynose and have comments back by
end of day Friday, October 23.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/4961

The following changes since commit 636e5d3b12d54951c13d57346648bc29a0e6b24e:

  wget: fix CVE-2026-15146 (2026-10-12 17:35:35 +0200)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/wrynose-review
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/wrynose-review

for you to fetch changes up to eeaf910479454922fb8d555b3e49be31abf671d8:

  glib-2.0: upgrade 2.88.3 -> 2.88.4 (2026-10-20 16:30:09 +0200)

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

