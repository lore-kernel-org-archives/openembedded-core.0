Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id 289D76B076
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 18:30:07 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id az9so7289763plb.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 10:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=U6hHJn/u1tNenVv1J2gApbpzWkXye4TuNYd7jDzwKJ0=;
	b=apbhuXzJJZau2Qzz4tePF5LuvjcBLjQvYq5haDdUqx/2/enGEVAOV5mZObwqzja6jc
	eBKFEj8gvg/5AFoc4lk7U89BnPpUXu3F59lNzLxrII2g8/rBPAI09Pq2/jcvaD3JBmy3
	rB0QnGd+45aRgMZ2PbC0SdHo6EbCArxv7iyXHW5p+2URO9Dn5Fv8IgBkkOUN+3QPHPA6
	xFKwrfsMEDBwVzJiK+G9r5rDnkXT/bBNFVZFFENmYPTBGjhn3SJ2AHBmYA60Q2PSmjxG
	QhW+Dy29vGBf96zp+Rh/kYMxC3TwkyyKRZ9JvT3WaYhwiCRSetQL34PmwoIqN6Ry3u7t
	lpVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=U6hHJn/u1tNenVv1J2gApbpzWkXye4TuNYd7jDzwKJ0=;
	b=lrW33/jYsbb5HppxbWCjyIVtTjaCODB9KpEKVKkKf+iCi+iuD3xP4vfgTeQ25uzs4Q
	0Jl2VCS5jIWELn2omBNzbfgC/7DURipXpxJd4khL2ET/LzS6KWl37sdewZEdE1kUjomi
	1P1GzEEyUDi5w6xBBk4Y42ie08x6bneKGOtCFxqMOEOFUu2mOwW5nQnj4cv/8Fs+DnvM
	I9JPE0j5DrCZyLmwTD/vzpLGYAP4mV77ZueVOTqa2sqNzVogHEtFyveuv3UHno+GxBn7
	gxphTVi4jsJsAlbNpfz+Slt+vTz2hD1OJyQqdbVAeptWh1tbM6CsHVrMJJuk4HpAAUSp
	fffA==
X-Gm-Message-State: APjAAAWvbtnZRrENMq/yvyEE192COstx+buKTdDaUsVWkKlWAZdA3lo6
	PsKlfIS1wuIxeG40VuGDLLCjfeLf
X-Google-Smtp-Source: APXvYqwQn5HFiYQTmOxKPwgykIqmxaJZ0r1QdBDzK1cMtyqEf7n3xSOUF/Lu5Rb9InMJYolN78NyZQ==
X-Received: by 2002:a17:902:144:: with SMTP id
	62mr13736619plb.197.1573497008875; 
	Mon, 11 Nov 2019 10:30:08 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:604a:b703:29ca:5c7d])
	by smtp.gmail.com with ESMTPSA id
	l62sm17731698pgl.24.2019.11.11.10.30.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Nov 2019 10:30:07 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2019 10:29:42 -0800
Message-Id: <cover.1573496794.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [zeus 00/21] Zeus patch review
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
X-List-Received-Date: Mon, 11 Nov 2019 18:30:08 -0000

Other then "pseudo: Drop static linking to sqlite3" outstanding question,
here are the next series to be reviewed for Zeus.

Note: pass a-full

Comments back by Wednesday

The following changes since commit 4e3e8d8270f318e6384c3d9bb5f6c7503f41d736:

  libsdl2: fix race when building in parallel (2019-11-10 13:54:34 -0800)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/zeus-nmut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/zeus-nmut

Alexander Kanavin (1):
  selftest: skip virgl test on centos 7 entirely

Bruce Ashfield (2):
  linux-yocto/4.19: update to v4.19.78
  linux-yocto/5.2: update to v5.2.20

Changqing Li (1):
  mdadm: fix do_package failed when changed local.conf but not cleaned

Ferry Toth (1):
  sudo: Fix fetching sources

Haris Okanovic (1):
  initscripts/sysfs.sh: Mount /sys/firmware/efi/efivars when possible

He Zhe (1):
  ltp: Fix overcommit_memory failure

Jacob Kroon (1):
  rm_work: Promote do_image_qa stamps to setscene versions

Richard Purdie (2):
  pseudo: Drop static linking to sqlite3
  pseudo: Add statx support to fix fedora30 issues

Ross Burton (9):
  file: fix CVE-2019-18218
  file: run test suite when building natively
  cve-check: ensure all known CVEs are in the report
  qemu-helper-native: add missing option to getopt() call
  qemu-helper-native: showing help shouldn't be an error
  qemu-helper-native: pass compiler flags
  cve-check: failure to parse versions should be more visible
  recipeutils-test: use a small dependency in the dummy recipe
  patch: the CVE-2019-13638 fix also handles CVE-2018-20969

Samuli Piippo (1):
  linux-firmware: update packaging for brcm files

Zhixiong Chi (1):
  libtirpc: create the symbol link for rpc header files

 meta-selftest/lib/oeqa/runtime/cases/virgl.py      |   5 -
 .../recipeutils/recipeutils-test_1.2.bb            |   2 +-
 meta/classes/cve-check.bbclass                     |  13 ++-
 meta/classes/rm_work.bbclass                       |   9 ++
 meta/conf/distro/include/no-static-libs.inc        |   4 -
 meta/lib/oeqa/selftest/cases/runtime_test.py       |   2 +
 .../initscripts/initscripts-1.0/sysfs.sh           |   4 +
 .../file/file/CVE-2019-18218.patch                 |  55 +++++++++++
 meta/recipes-devtools/file/file_5.37.bb            |   7 +-
 ...ke-ed-directly-instead-of-using-the-shell.patch |   4 +-
 .../pseudo/files/0001-Add-statx.patch              | 106 +++++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo.inc            |  17 +---
 meta/recipes-devtools/pseudo/pseudo_git.bb         |   1 +
 .../qemu/qemu-helper-native_1.0.bb                 |   2 +-
 meta/recipes-devtools/qemu/qemu-helper/tunctl.c    |  16 ++--
 meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb   |  14 +++
 ...memory-update-for-mm-fix-false-positive-O.patch |  57 +++++++++++
 meta/recipes-extended/ltp/ltp_20190517.bb          |   1 +
 meta/recipes-extended/mdadm/mdadm_4.1.bb           |   5 +-
 meta/recipes-extended/sudo/sudo_1.8.27.bb          |   2 +-
 .../linux-firmware/linux-firmware_20190815.bb      |  18 ++--
 meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb   |   6 +-
 meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb    |   6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb |   8 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb  |   8 +-
 meta/recipes-kernel/linux/linux-yocto_4.19.bb      |  20 ++--
 meta/recipes-kernel/linux/linux-yocto_5.2.bb       |  22 ++---
 27 files changed, 328 insertions(+), 86 deletions(-)
 create mode 100644 meta/recipes-devtools/file/file/CVE-2019-18218.patch
 create mode 100644 meta/recipes-devtools/pseudo/files/0001-Add-statx.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-overcommit_memory-update-for-mm-fix-false-positive-O.patch

-- 
2.7.4


