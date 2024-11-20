Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 397CBD6393D
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 13:57:14 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.13825.1732111032490291940
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 05:57:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zFqGQkVh;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21271dc4084so5198955ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 05:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732111032; x=1732715832; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vDrsBc+64ctmMXFYvIk2rdcKMqK5LQfzy6Cxqtsl/Fc=;
        b=zFqGQkVhxrvwfl2hnGs+10yEib193ffDOn4emVKRsa+Xja6e2diROylkTkGQxKlmHL
         31YQuOvMdKrWmduuJpLfVQcmgjx3kgUtCYDB7b89vtkD1xzqQMJyMtGbf/CXVsRBD0rW
         NIPkqB9uanAeVOCIs6ng3ZXVw6TsEItvRxT8BJZbF5KCXTk6vLYxRuXETVGa6Ygf7Ciw
         y+4twiZNnMKyXYIAnTlx5MsJUgNgF5ItkzwwRLMAQJepzEFU5O92fqI/SnzCwGacmOeu
         8/V9aL5jkDQl2lfyLkRnz6FWwBcHAL0LZh2pAB8WOcvvuCzePqN2NFQD3DIZeRWHcMGq
         Dg1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732111032; x=1732715832;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vDrsBc+64ctmMXFYvIk2rdcKMqK5LQfzy6Cxqtsl/Fc=;
        b=Q33lY6aP7QPyp23BBzKzn0PDvyN6tM0CrckdKPFlzRv6Z3mzoPnozmsm021LoDnRg1
         K7cDUOI3vDmqK5iXkj0UmdmPgzF4RXlUikkn/sc6g5lr4+nbeZSq8FzB2JzwpUi4h6+Z
         ZxOzq+xIH5xCaitMDFy57Is7p8d25hP4UHdz2azZIkP5JBUW63DbFGSIY5qnRuvkct1V
         dVyCkQSE6OoreFU0xt1ZXkgHiaR5mP9D8ad6JpGUhbrbsBa354lmKYu30dVNcLVHI1xU
         zh39xew6DOUL5ic4FdrdYr6VMC9QsjM67OLDLQINGTr4lHUSu088p9BtEmY2Zvc3O510
         IUng==
X-Gm-Message-State: AOJu0Yy4s+taG6nyB8agJ7s+cdDfu2Kh8GRHlOzNq3KiBF8WMX8ocPIp
	T0yxekmf03ynPqnKMorVf9vcpIy60xYd8wKlY4yZDktCxc6FL5OYVyHnSOr60c9izg/GK+Cfc9y
	v
X-Google-Smtp-Source: AGHT+IFI1JeuufbajLYEKRzSbcajPiKDiQn4vM1AgCURJxX1o+WrYOxiOE8smvGa54Svanp+OBsHJw==
X-Received: by 2002:a17:902:f64e:b0:20c:a19b:8ddd with SMTP id d9443c01a7336-2126cb3c32emr26103185ad.51.1732111031465;
        Wed, 20 Nov 2024 05:57:11 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2127a4db5b3sm4658175ad.233.2024.11.20.05.57.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 05:57:11 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 00/31] Patch review
Date: Wed, 20 Nov 2024 05:56:32 -0800
Message-Id: <cover.1732110892.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 13:57:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207424

Please review this set of changes for styhead and have comments back by
end of day Friday, November 22

Passed a-full on autobuilder:

https://valkyrie.yoctoproject.org/#/builders/29/builds/464

The following changes since commit 92cc48d51c763249b2eb8b4181bc20056fc72264:

  glibc: Fix missing randomness in __gen_tempname (2024-11-02 06:21:52 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/styhead-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/styhead-nut

Aditya Tayade (1):
  e2fsprogs: removed 'sed -u' option

Alban Bedel (1):
  util-linux: Add `findmnt` to the bash completion RDEPENDS

Chen Qi (2):
  toolchain-shar-extract.sh: exit when post-relocate-setup.sh fails
  libgfortran: fix buildpath QA issue

Claus Stovgaard (1):
  lib/oe/package-manager: skip processing installed-pkgs with empty
    globs

Clayton Casciato (1):
  uboot-sign: fix concat_dtb arguments

Hiago De Franco (1):
  weston: backport patch to allow neatvnc < v0.9.0

Hongxu Jia (1):
  gcc-source: Fix racing on building gcc-source-14.2.0 and
    lib32-gcc-source-14.2.0

Jagadeesh Krishnanjanappa (1):
  tune-cortexa32: set tune feature as armv8a

Jinfeng Wang (2):
  tzdata/tzcode-native: upgrade 2024a -> 2024b
  glib-2.0: fix glib-2.0 ptest failure when upgrading tzdata2024b

Katawann (1):
  cve-check: add field "modified" to JSON report

Mikko Rapeli (1):
  ovmf-native: remove .pyc files from install

Pavel Zhukov (1):
  package_rpm: Check if file exists before open()

Peter Marko (3):
  cve-check: add support for cvss v4.0
  go: upgrade 1.22.6 -> 1.22.7
  go: upgrade 1.22.7 -> 1.22.8

Purushottam Choudhary (1):
  virglrenderer: Add patch to fix -int-conversion build issue

Regis Dargent (1):
  udev-extraconf: fix network.sh script did not configure hotplugged
    interfaces

Richard Purdie (4):
  pseudo: Fix envp bug and add posix_spawn wrapper
  oeqa/runtime/ssh: Rework ssh timeout
  oeqa/runtime/ssh: Fix incorrect timeout fix
  qemurunner: Clean up serial_lock handling

Robert Yang (1):
  cml1.bbclass: do_diffconfig: Don't override .config with .config.orig

Ross Burton (3):
  strace: download release tarballs from GitHub
  tcl: skip io-13.6 test case
  groff: fix rare build race in hdtbl

Tom Hochstein (1):
  weston: Add missing runtime dependency on freerdp

Vijay Anusuri (1):
  xserver-xorg: upgrade 21.1.13 -> 21.1.14

Wang Mingyu (1):
  wireless-regdb: upgrade 2024.07.04 -> 2024.10.07

Yoann Congal (1):
  python3-maturin: sort external libs in wheel files

 meta/classes-global/package_rpm.bbclass       | 16 +++-
 meta/classes-recipe/cml1.bbclass              |  3 +-
 meta/classes-recipe/uboot-sign.bbclass        |  2 +-
 meta/classes/cve-check.bbclass                | 11 ++-
 meta/classes/vex.bbclass                      |  1 +
 .../include/arm/armv8a/tune-cortexa32.inc     |  2 +-
 meta/conf/multilib.conf                       |  2 +-
 meta/files/toolchain-shar-extract.sh          |  4 +
 meta/lib/oe/package_manager/__init__.py       | 76 +++++++++----------
 meta/lib/oeqa/runtime/cases/ssh.py            |  4 +-
 meta/lib/oeqa/utils/qemurunner.py             | 11 +--
 .../files/gdatetime-test-fail-0001.patch      | 72 ++++++++++++++++++
 .../files/gdatetime-test-fail-0002.patch      | 65 ++++++++++++++++
 .../files/gdatetime-test-fail-0003.patch      | 63 +++++++++++++++
 meta/recipes-core/glib-2.0/glib.inc           |  3 +
 .../meta/cve-update-nvd2-native.bb            | 14 +++-
 meta/recipes-core/ovmf/ovmf_git.bb            |  1 +
 .../udev/udev-extraconf/network.sh            | 32 --------
 .../util-linux/util-linux_2.40.2.bb           |  2 +-
 .../e2fsprogs/e2fsprogs/run-ptest             |  3 +-
 meta/recipes-devtools/gcc/gcc-source_14.2.bb  |  1 +
 meta/recipes-devtools/gcc/libgfortran.inc     |  2 +-
 .../go/{go-1.22.6.inc => go-1.22.8.inc}       |  2 +-
 ...e_1.22.6.bb => go-binary-native_1.22.8.bb} |  6 +-
 ..._1.22.6.bb => go-cross-canadian_1.22.8.bb} |  0
 ...{go-cross_1.22.6.bb => go-cross_1.22.8.bb} |  0
 ...osssdk_1.22.6.bb => go-crosssdk_1.22.8.bb} |  0
 ...runtime_1.22.6.bb => go-runtime_1.22.8.bb} |  0
 .../go/{go_1.22.6.bb => go_1.22.8.bb}         |  0
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  2 +-
 ...prove-wheel-reproducibility-by-sorti.patch | 55 ++++++++++++++
 .../python/python3-maturin_1.7.1.bb           |  1 +
 meta/recipes-devtools/strace/strace_6.10.bb   |  4 +-
 meta/recipes-devtools/tcltk/tcl/run-ptest     |  2 +
 ...l-Fix-Savannah-66316-missing-grn-dep.patch | 38 ++++++++++
 meta/recipes-extended/groff/groff_1.23.0.bb   |  1 +
 meta/recipes-extended/timezone/timezone.inc   |  6 +-
 ...nversion-fatal-build-error-with-GCC-.patch | 41 ++++++++++
 .../virglrenderer/virglrenderer_1.0.1.bb      |  1 +
 ...1-vnc-Allow-neatvnc-in-version-0.8.0.patch | 27 +++++++
 .../recipes-graphics/wayland/weston_13.0.3.bb |  3 +-
 ...org_21.1.13.bb => xserver-xorg_21.1.14.bb} |  2 +-
 ....07.04.bb => wireless-regdb_2024.10.07.bb} |  2 +-
 scripts/cve-json-to-text.py                   |  2 +
 44 files changed, 474 insertions(+), 111 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0001.patch
 create mode 100644 meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0002.patch
 create mode 100644 meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0003.patch
 rename meta/recipes-devtools/go/{go-1.22.6.inc => go-1.22.8.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.22.6.bb => go-binary-native_1.22.8.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.22.6.bb => go-cross-canadian_1.22.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.22.6.bb => go-cross_1.22.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.22.6.bb => go-crosssdk_1.22.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.22.6.bb => go-runtime_1.22.8.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.22.6.bb => go_1.22.8.bb} (100%)
 create mode 100644 meta/recipes-devtools/python/python3-maturin/0001-build_context-improve-wheel-reproducibility-by-sorti.patch
 create mode 100644 meta/recipes-extended/groff/files/0001-hdtbl-Fix-Savannah-66316-missing-grn-dep.patch
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/0001-vrend-Fix-int-conversion-fatal-build-error-with-GCC-.patch
 create mode 100644 meta/recipes-graphics/wayland/weston/0001-vnc-Allow-neatvnc-in-version-0.8.0.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.13.bb => xserver-xorg_21.1.14.bb} (92%)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2024.07.04.bb => wireless-regdb_2024.10.07.bb} (94%)

-- 
2.34.1


