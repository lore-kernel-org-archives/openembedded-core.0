Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D6F0C41513
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 14:20:43 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.9672.1718288440410399291
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jun 2024 07:20:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2zO6W6UG;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-6e41550ae5bso798360a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 07:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718288439; x=1718893239; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=93Tg9OAyoxZJXj3+Z3V5sjTzsU+/axQ6i41XofBI4Q0=;
        b=2zO6W6UGrOULZxBJ+SyZ/Vvu0lTAzUBCRXKOWbDcI8PBDnsZ5WN34x3WJII4soJnLr
         jmF96rag1BXFccrBlnjr2L+csN1aq6IrxnW5CpH8PiItsZQ8FpzrFMrJDBEDmjRnVhtj
         O8FLscpiV32mpiZG5FEcmHhAAJnjoSfnAyNrJ1Cxhhx14AYi4447vJpd7Ww3I0APKFW0
         JNqNYHWsvfL3R38/Qe64uEYYlJa/rOGhigNaOSLGg4FyA7A9kPpEi8wS4i4HxLAqanOG
         9U2/g0DLSZ4DwGWaO4z+vyPBe/hPqpX/hLgqcQWNuE4s1E4dNzci8nGG/RAxnGgwVD0X
         4E9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718288439; x=1718893239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=93Tg9OAyoxZJXj3+Z3V5sjTzsU+/axQ6i41XofBI4Q0=;
        b=NgL3iDwkvEUnEwc7mYgp0h4Dupec4PfyIUOEw14KNfj+QxKGJ7UnPUJOwB+TWmPtqb
         uY/LxKb6mUwRwuZAgWYeMADVA5ExMiHm/DvTqZXnYxbeBDKkqh0dbNxFY+IeTwWptbvG
         fa3WdBBz91rB70UrFkBTHcgDU1kOzKvULEe3v3uWCKP0MCB1FJo1aH4ArzA1Di+83CLx
         wfIqn3uVd8kuurmQSmQb7xy7IP8AESF4yKchaP90uHUZLO3azfGDMzkWhIhxozDmXv3D
         SklJWZqmYbXQZftouF6SMi36JygtzbBE10Ex/hMjlw/i2v2xYx7aavXHiydQpzqQBIac
         l4IQ==
X-Gm-Message-State: AOJu0YyiBw+urSTHsUfYCepDjBmLXAhxs9w+gyrn72zpEb/1vBPqVH6F
	H85Ags/Zw8sVuS4HI8dQPyWGoRz4TnK4mv4Lto0EIF+Cd9U6JOSieVsBfGyhBci7liLNm7vzaJ/
	X
X-Google-Smtp-Source: AGHT+IEDvId+b4T4faUcV9v2xUfSX7tUHLjo7zD3UoIiRVAiOkjDTMppMqywitLgghuMJtT+T4OLOg==
X-Received: by 2002:a17:902:dac7:b0:1f7:2c0c:4218 with SMTP id d9443c01a7336-1f83b7e575bmr50537665ad.62.1718288439210;
        Thu, 13 Jun 2024 07:20:39 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e5b0dfsm14414665ad.29.2024.06.13.07.20.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 07:20:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/29] Patch review
Date: Thu, 13 Jun 2024 07:20:05 -0700
Message-Id: <cover.1718288230.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 14:20:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200603

Please review this set of changes for scarthgap and have comments back by
end of day Monday, June 17

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7034

The following changes since commit 3b070fc3963d04ce8c13b5b78c3b7ae95e26c435:

  binutils: Fix aarch64 disassembly abort (2024-06-10 05:31:10 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Alexander Kanavin (9):
  libtraceevent: submit meson.patch upstream
  serf: mark patch as inappropriate for upstream submission
  kea: remove unnecessary reproducibility patch
  expect: mark patches as Inactive-Upstream
  apr: submit 0001-Add-option-to-disable-timed-dependant-tests.patch
    upstream
  busybox: submit CVE-2022-28391 patches upstream
  xinput-calibrator: mark upstream as inactive in a patch
  bash: mark build-tests.patch as Inappropriate
  icu: add upstream submission links for fix-install-manx.patch

Alexandre Truong (2):
  oeqa/selftest/devtool: fix _test_devtool_add_git_url
  Revert "oeqa/selftest/devtool: fix test_devtool_add_git_style2"

Anton Almqvist (1):
  devtool: modify: Catch git submodule error for go code

Felix Nilsson (1):
  base-files: profile: fix error sh: 1: unknown operand

Heiko (1):
  kernel.bbclass: check, if directory exists before removing empty
    module directory

Julien Stephan (1):
  oeqa: selftest: context: run tests serially if testtools/subunit
    modules are not found

Khem Raj (1):
  oeqa/postactions: Do not use -l option with df

Marc Ferland (1):
  libinput: fix building with debug-gui option

Maxin B. John (1):
  iproute2: drop obsolete patch

Ola x Nilsson (1):
  oeqa/selftest/devtool: add test for modifying recipes using go.bbclass

Poonam Jadhav (1):
  ppp: Add RSA-MD in LICENSE

Ross Burton (1):
  procps: fix build with new glibc but old kernel headers

Vincent Kriek (1):
  devtool: sync: Fix Execution error

Wang Mingyu (4):
  cronie: upgrade 1.7.1 -> 1.7.2
  lttng-ust: upgrade 2.13.7 -> 2.13.8
  taglib: upgrade 2.0 -> 2.0.1
  mesa: upgrade 24.0.3 -> 24.0.5

Xiangyu Chen (2):
  iputils: splitting the ping6 as a package
  ltp: add iputils-ping6 to RDEPENDS

Zoltan Boszormenyi (1):
  cracklib: Modify patch to compile with GCC 14

 meta/classes-recipe/kernel.bbclass            |  2 +-
 meta/lib/oeqa/selftest/cases/devtool.py       | 31 ++++++++--
 meta/lib/oeqa/selftest/context.py             | 17 ++++-
 meta/lib/oeqa/utils/postactions.py            |  2 +-
 ...01-libc-compat.h-add-musl-workaround.patch | 39 ------------
 .../iproute2/iproute2_6.7.0.bb                |  4 +-
 ...1-kea-fix-reproducible-build-failure.patch | 62 -------------------
 meta/recipes-connectivity/kea/kea_2.4.1.bb    |  3 +-
 meta/recipes-connectivity/ppp/ppp_2.5.0.bb    |  2 +-
 .../base-files/base-files/profile             |  2 +-
 ...tr-ensure-only-printable-characters-.patch |  2 +-
 ...e-all-printed-strings-with-printable.patch |  2 +-
 ...001-Resolve-string-formatting-issues.patch |  2 +-
 .../expect/expect/0001-configure.in.patch     |  2 +-
 ...exp_main_sub.c-Use-PATH_MAX-for-path.patch |  2 +-
 ...ults-if-Tcl-is-built-with-stubs-and-.patch |  2 +-
 .../expect/expect/0002-tcl.m4.patch           |  2 +-
 .../bash/bash/build-tests.patch               |  2 +-
 ...port-dictionary-byte-order-dependent.patch |  2 +-
 .../{cronie_1.7.1.bb => cronie_1.7.2.bb}      |  2 +-
 .../iputils/iputils_20240117.bb               | 13 +++-
 meta/recipes-extended/ltp/ltp_20240129.bb     |  1 +
 .../procps/procps/pidfd.patch                 | 42 +++++++++++++
 meta/recipes-extended/procps/procps_4.0.4.bb  |  1 +
 .../{mesa-gl_24.0.3.bb => mesa-gl_24.0.5.bb}  |  0
 meta/recipes-graphics/mesa/mesa.inc           |  2 +-
 .../mesa/{mesa_24.0.3.bb => mesa_24.0.5.bb}   |  0
 .../wayland/libinput_1.25.0.bb                |  2 +-
 ...ibrator_pointercal.sh-to-be-run-as-n.patch |  2 +-
 .../libtraceevent/libtraceevent/meson.patch   |  2 +-
 ...ttng-ust_2.13.7.bb => lttng-ust_2.13.8.bb} |  2 +-
 ...ion-to-disable-timed-dependant-tests.patch |  2 +-
 .../icu/icu/fix-install-manx.patch            |  4 +-
 ...ories.without.sandbox-install.prefix.patch |  2 +-
 .../taglib/{taglib_2.0.bb => taglib_2.0.1.bb} |  2 +-
 scripts/lib/devtool/standard.py               | 18 +++++-
 36 files changed, 142 insertions(+), 137 deletions(-)
 delete mode 100644 meta/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch
 delete mode 100644 meta/recipes-connectivity/kea/files/0001-kea-fix-reproducible-build-failure.patch
 rename meta/recipes-extended/cronie/{cronie_1.7.1.bb => cronie_1.7.2.bb} (97%)
 create mode 100644 meta/recipes-extended/procps/procps/pidfd.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_24.0.3.bb => mesa-gl_24.0.5.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_24.0.3.bb => mesa_24.0.5.bb} (100%)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.13.7.bb => lttng-ust_2.13.8.bb} (95%)
 rename meta/recipes-support/taglib/{taglib_2.0.bb => taglib_2.0.1.bb} (95%)

-- 
2.34.1


