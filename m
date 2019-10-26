Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 3F3A57FA9A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2019 06:50:04 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id r1so4652048wrs.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 23:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ey/K8W1+fWYH0YsYkXfa69Zs+rReuhOq4oK+QMnM+2c=;
	b=qccfOTN5xNySBmBf2pOF6b9kYckKBNGCFkOxanVASDlHIr1huiQX0wg2jOZoPC8sC1
	4GbntERC/g0ygJYDm6u79rg0aplySTz83UIzQB7irvxcSOm2OBgId+Yfss+ewCQMDR4R
	Ier3Vvfl0mlaij2P/fXmYQmQ174MZbcv5Gfp+BYK5RV4PHXTjwTNMjHW+T5R3hRO/Hjq
	L4lhe0ZBVGn8xBUVb6MeK2dzPysfnEdQpeeYhI9Lx/hk8yz0snLgYnoXXNXfvn9Kzm9L
	f9zHw9Gw0htLwOhbZvyxCaX+c0RhpCgHp5AYwVctiMyBTE0sqfkb6dKXfnO5KCcpJbj7
	E6gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ey/K8W1+fWYH0YsYkXfa69Zs+rReuhOq4oK+QMnM+2c=;
	b=IVx0m3tMlPJjeK+XrRiW94h1mB9mYJ3KWDUZGlJFbfY6evAdoW2YKZLQAn0OIGSmFX
	2hW4C9loyMWLW80KWOQ9zVWOYUQpOKhn+BfGX2yTyTx1bnbpGw9MAZZqtDimWCtlL5MN
	UvbTV43mbvjNiarhJsQGCSJaCNtxScrtGDTLD8MZZr5EAepSy63jlDo+EVWpIk1XcrCJ
	J81puNgqWuGuS59UPmv6mGUsjxXOgouwS7GkdeNRddxSwZ8jeHbMYW1l5NHyW1vqgn1C
	rRJrBayb5EnhaP1CGSM99oi4f2EK9AZID7bqH4+Ij91FyIk950zD5D/peyZsyqFcU2D9
	w6TQ==
X-Gm-Message-State: APjAAAWvcr0sLzvOl0DQD42jX5MEETudrak8GRZzhtZu87XThcdANhRb
	EOuvWerAkvuRurnNtsiCUvLqkFXOXMk=
X-Google-Smtp-Source: APXvYqxRRgGlIBtO7Yp8NJge8JGvKrCmpMpG9TSm6i1nUdGJ1ZrunX9DEtAJ5oJZ73D0S79LG1yQsQ==
X-Received: by 2002:adf:f592:: with SMTP id f18mr6566157wro.33.1572072604660; 
	Fri, 25 Oct 2019 23:50:04 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.controleur.wifipass.org ([178.18.58.186])
	by smtp.gmail.com with ESMTPSA id v6sm4807911wru.72.2019.10.25.23.50.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Oct 2019 23:50:03 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Oct 2019 23:49:32 -0700
Message-Id: <cover.1572072421.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [zeus 00/28] Patch review
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
X-List-Received-Date: Sat, 26 Oct 2019 06:50:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is what has been backported from master or patches.

Comments by Monday.

The following changes since commit 59938780e7e776d87146002ea939b185f8704408:

  build-appliance-image: Update to master head revision (2019-10-09 22:28:44 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/zeus-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/zeus-next

Alexander Kanavin (1):
  runqemu: unset another environment variable for 'egl-headless'

André Draszik (1):
  connman: mark connman-wait-online as SYSTEMD_PACKAGE

Changqing Li (3):
  qemu: Fix CVE-2019-12068
  python: Fix CVE-2019-10160
  sudo: fix CVE-2019-14287

Chee Yang Lee (1):
  wic/engine: use 'linux-swap' for swap file system

Chen Qi (3):
  python: CVE-2019-16056
  python3: CVE-2019-16056
  go: fix CVE-2019-16276

Douglas Royds via Openembedded-core (1):
  icecc: Export ICECC_CC and friends via wrapper-script

Eugene Smirnov (1):
  wic/rawcopy: Support files in sub-directories

George McCollister (1):
  openssl: make OPENSSL_ENGINES match install path

Hongxu Jia (1):
  openssh: fix CVE-2019-16905

Joerg Vehlow (1):
  runqemu: Remove disabling of high resolution timer

Liwei Song (1):
  util-linux: fix PKNAME name is NULL when use lsblk [LIN1019-2963]

Michael Ho (1):
  cmake.bbclass: add HOSTTOOLS_DIR to CMAKE_FIND_ROOT_PATH

Qi.Chen@windriver.com (1):
  sqlite3: fix CVE-2019-16168

Ricardo Ribalda Delgado (1):
  i2c-tools: Add missing RDEPEND

Ross Burton (3):
  sanity: check the format of SDK_VENDOR
  file: explicitly disable seccomp
  python3: -dev should depend on distutils

Stefan Agner (1):
  uninative: check .done file instead of tarball

Tom Benn (1):
  dbus: update dbus-1.init to reflect new PID file

Trevor Gamblin (2):
  aspell: fix CVE-2019-17544
  ncurses: fix CVE-2019-17594, CVE-2019-17595

Wenlin Kang (1):
  sysstat: fix CVE-2019-16167

Yi Zhao (2):
  libsdl2: fix CVE-2019-13616
  libgcrypt: fix CVE-2019-12904

 meta/classes/cmake.bbclass                         |   3 +-
 meta/classes/icecc.bbclass                         |  32 +-
 meta/classes/sanity.bbclass                        |   5 +
 meta/classes/uninative.bbclass                     |   2 +-
 meta/recipes-connectivity/connman/connman.inc      |   2 +-
 ...x-integer-overflow-in-XMSS-private-key-pa.patch |  40 +++
 meta/recipes-connectivity/openssh/openssh_8.0p1.bb |   1 +
 .../recipes-connectivity/openssl/openssl_1.1.1d.bb |   2 +-
 meta/recipes-core/dbus/dbus/dbus-1.init            |   4 +-
 ...rses-selective-backport-of-20191012-patch.patch | 169 +++++++++++
 meta/recipes-core/ncurses/ncurses_6.1+20190803.bb  |   1 +
 ...lsblk-force-to-print-PKNAME-for-partition.patch |  36 +++
 meta/recipes-core/util-linux/util-linux_2.34.bb    |   1 +
 meta/recipes-devtools/file/file_5.37.bb            |   2 +
 meta/recipes-devtools/go/go-1.12.inc               |   1 +
 ...nch.go1.12-security-net-textproto-don-t-n.patch | 163 ++++++++++
 meta/recipes-devtools/i2c-tools/i2c-tools_4.1.bb   |   1 +
 ...55-Dont-parse-domains-containing-GH-13079.patch |  90 ++++++
 .../python/python/bpo-36742-cve-2019-10160.patch   |  81 +++++
 ...55-Dont-parse-domains-containing-GH-13079.patch | 132 ++++++++
 .../python/python3/python3-manifest.json           |   3 +-
 meta/recipes-devtools/python/python3_3.7.4.bb      |   1 +
 meta/recipes-devtools/python/python_2.7.16.bb      |   2 +
 meta/recipes-devtools/qemu/qemu.inc                |   1 +
 .../qemu/qemu/CVE-2019-12068.patch                 | 108 +++++++
 .../sudo/sudo/CVE-2019-14287-1.patch               | 178 +++++++++++
 .../sudo/sudo/CVE-2019-14287-2.patch               | 112 +++++++
 meta/recipes-extended/sudo/sudo_1.8.27.bb          |   2 +
 ...ory-corruption-bug-due-to-Integer-Overflo.patch |  46 +++
 meta/recipes-extended/sysstat/sysstat_12.1.6.bb    |   4 +-
 ...538-validate-image-size-when-loading-BMP-.patch |  34 +++
 meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb    |   1 +
 .../0001-Fix-various-bugs-found-by-OSS-Fuze.patch  |  56 ++++
 meta/recipes-support/aspell/aspell_0.60.7.bb       |   4 +-
 .../files/0001-Prefetch-GCM-look-up-tables.patch   |  90 ++++++
 ...ok-up-tables-to-.data-section-and-unshare.patch | 332 +++++++++++++++++++++
 ...ok-up-table-to-.data-section-and-unshare-.patch | 178 +++++++++++
 meta/recipes-support/libgcrypt/libgcrypt_1.8.4.bb  |   3 +
 .../sqlite/files/0001-Fix-CVE-2019-16168.patch     |  40 +++
 meta/recipes-support/sqlite/sqlite3_3.29.0.bb      |   3 +-
 scripts/lib/wic/engine.py                          |   2 +-
 scripts/lib/wic/plugins/source/rawcopy.py          |   3 +
 scripts/runqemu                                    |   5 +-
 43 files changed, 1951 insertions(+), 25 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/0001-upstream-fix-integer-overflow-in-XMSS-private-key-pa.patch
 create mode 100644 meta/recipes-core/ncurses/files/0001-ncurses-selective-backport-of-20191012-patch.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-lsblk-force-to-print-PKNAME-for-partition.patch
 create mode 100644 meta/recipes-devtools/go/go-1.12/0001-release-branch.go1.12-security-net-textproto-don-t-n.patch
 create mode 100644 meta/recipes-devtools/python/python/0001-2.7-bpo-34155-Dont-parse-domains-containing-GH-13079.patch
 create mode 100644 meta/recipes-devtools/python/python/bpo-36742-cve-2019-10160.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-bpo-34155-Dont-parse-domains-containing-GH-13079.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2019-12068.patch
 create mode 100644 meta/recipes-extended/sudo/sudo/CVE-2019-14287-1.patch
 create mode 100644 meta/recipes-extended/sudo/sudo/CVE-2019-14287-2.patch
 create mode 100644 meta/recipes-extended/sysstat/sysstat/0001-Fix-232-Memory-corruption-bug-due-to-Integer-Overflo.patch
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0001-Fixed-bug-4538-validate-image-size-when-loading-BMP-.patch
 create mode 100644 meta/recipes-support/aspell/aspell/0001-Fix-various-bugs-found-by-OSS-Fuze.patch
 create mode 100644 meta/recipes-support/libgcrypt/files/0001-Prefetch-GCM-look-up-tables.patch
 create mode 100644 meta/recipes-support/libgcrypt/files/0002-AES-move-look-up-tables-to-.data-section-and-unshare.patch
 create mode 100644 meta/recipes-support/libgcrypt/files/0003-GCM-move-look-up-table-to-.data-section-and-unshare-.patch
 create mode 100644 meta/recipes-support/sqlite/files/0001-Fix-CVE-2019-16168.patch

-- 
2.7.4


