Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 48BB57C861
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 01:43:20 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id v80so8154496pfa.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 18:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=4WNm7WvVJhSiWZ92wF47FcRF+HYzrF/CT72SxrHcdvU=;
	b=ebAGy1hC74Q4OWNg0AdWy7s59eVaumIx3wM6ErgpZfWuxj2cSat9LDDkjs0/zt6f03
	FG/6eXMmEfuHXG2rH4BtTOsFC2IGBifwznBWSoVBQXnQijF8r8534w23PLLOIPw2fPIU
	heS+vpIOuN80BNYLDay1ImbSiSbiDk6P1P0Kg29JXijKlRly0t7eHcCxI9wXzwsSUMhU
	F5gGJcWwJtPcmoRiWHCBcjyPS9JF4DCQjNk5mlAwqIKvDUN5SyBctYGHa2fjqfd+KZEh
	ImH8+d7/+yK/he3zlmv71wHwn2rMSH8g0oFnj+nfyzh3C7fzF/tFlLQHn1ZH1d2hndMl
	41xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=4WNm7WvVJhSiWZ92wF47FcRF+HYzrF/CT72SxrHcdvU=;
	b=i3Lms4Kc9N9Yd4U6YU+J3+1B7w55nreUYlAmddL+4hCzLuFwnpD3nqQ/gGqZvqs1Oj
	R2SekJOmietqMaDYX0urbozzZ9ahXbpyPDYJl5eQ6TLCJff4M9OwSognjHFfTGb2L80t
	+T0nz99gCcbh+e+Eq6bcaq8ltwtzr0/KTWjr0xob3pLEVwz5mpQsA2cbiGH2gwpfd/Ik
	Q7hIxKOSdrhJd7R80GeoqxdTyzbq3fuVvsxn6e+FrBwUSmUvgG+c/tGlyfMdLIV9vy3o
	KeEqnX+lU+5nhKOkbZOLf8YlcdxD4Dxi1MB5v5HSfO+afxtipUVf6ZkMbVqqRaaVR6Od
	KzBA==
X-Gm-Message-State: APjAAAWJidU+VVZaeECHyliILC6/Y3Aaj37hgBb2ofm0VxM2ETIYeYz6
	AigR0yLo9DmKOChKSNbH3BOTFi8o
X-Google-Smtp-Source: APXvYqwLCAcJOVwnDX3M/ljAuXoTLjmF0tGjtV4hBZbK0tw8vLFSKv/vzacRYSyQhhcq0pedZWoUvg==
X-Received: by 2002:a65:56cb:: with SMTP id w11mr59076076pgs.236.1558403001157;
	Mon, 20 May 2019 18:43:21 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:503:adbf:6ea3:61d2])
	by smtp.gmail.com with ESMTPSA id
	q5sm23079547pfb.51.2019.05.20.18.43.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 May 2019 18:43:20 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 18:43:02 -0700
Message-Id: <cover.1558402534.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 00/15] Warrior review request
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 May 2019 01:43:20 -0000

Here is the next small batch for the next warrior.
This includes " oeqa/target/ssh: Replace suggogatepass with ignoring errors" which was just merged.
( take it up with the owner)

This series was tested on the AB.

The following changes since commit 21079473e0cbd0e43682dc0d15a651e7e64db747:

  oeqa/core/runner: Handle unexpectedSucesses (2019-05-11 08:44:16 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/warrior-next
  http://cgit.openembedded.org//log/?h=stable/warrior-next

Alejandro Enedino Hernandez Samaniego (1):
  run-postinsts: Fix full execution of scripts at first boot

Alex Kiernan (1):
  shadow: Backport last change reproducibility

Chee Yang Lee (1):
  wic/bootimg-efi: replace hardcoded volume name with label

Hongxu Jia (1):
  oeqa/targetcontrol.py: fix qemuparams not work in runqemu with
    launch_cmd

Kai Kang (1):
  bitbake.conf: set NO_RECOMMENDATIONS with weak assignment

Martin Jansa (2):
  glib-networking: add PACKAGECONFIG for openssl
  perf: make sure that the tools/include/uapi/asm-generic directory
    exists

Mikko Rapeli (2):
  openssh: recommend rng-tools with sshd
  oeqa/sdk: use bash to execute SDK test commands

Ming Liu (1):
  kernel.bbclass: adjust a condition checking

Paul Barker (1):
  gdb: Fix aarch64 build with musl

Richard Purdie (4):
  oeqa/runner: Fix subunit setupClass/setupModule failure handling
  oeqa/concurrenttest: Patch subunit module to handle classSetup
    failures
  oeqa/target/ssh: Replace suggogatepass with ignoring errors
  core-image-sato-sdk-ptest: Tweak size to stay within 4GB limit

 meta/classes/kernel.bbclass                        |  3 +-
 meta/conf/bitbake.conf                             |  2 +-
 meta/lib/oeqa/core/runner.py                       |  4 +-
 meta/lib/oeqa/core/target/ssh.py                   |  4 +-
 meta/lib/oeqa/core/utils/concurrencytest.py        | 27 ++++++-
 meta/lib/oeqa/sdk/case.py                          |  2 +-
 meta/lib/oeqa/sdk/utils/sdkbuildproject.py         |  3 +-
 meta/lib/oeqa/targetcontrol.py                     |  2 +-
 meta/recipes-connectivity/openssh/openssh_7.9p1.bb |  1 +
 .../glib-networking/glib-networking_2.60.1.bb      |  1 +
 meta/recipes-devtools/gdb/gdb-8.2.1.inc            |  1 +
 ...-AArch64-Fix-the-gdb-build-with-musl-libc.patch | 52 +++++++++++++
 .../run-postinsts/run-postinsts/run-postinsts      |  2 +-
 ...p_lstchg-shadow-field-reproducible-re.-71.patch | 89 ++++++++++++++++++++++
 ...002-gettime-Use-secure_getenv-over-getenv.patch | 71 +++++++++++++++++
 meta/recipes-extended/shadow/shadow.inc            |  2 +
 meta/recipes-kernel/perf/perf.bb                   |  2 +-
 .../images/core-image-sato-sdk-ptest.bb            |  4 +-
 scripts/lib/wic/plugins/source/bootimg-efi.py      |  6 +-
 19 files changed, 259 insertions(+), 19 deletions(-)
 create mode 100644 meta/recipes-devtools/gdb/gdb/0012-AArch64-Fix-the-gdb-build-with-musl-libc.patch
 create mode 100644 meta/recipes-extended/shadow/files/0001-Make-the-sp_lstchg-shadow-field-reproducible-re.-71.patch
 create mode 100644 meta/recipes-extended/shadow/files/0002-gettime-Use-secure_getenv-over-getenv.patch

-- 
2.7.4


