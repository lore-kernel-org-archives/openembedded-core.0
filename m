Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id A00F17231D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Nov 2014 16:22:15 +0000 (UTC)
Received: by mail-pd0-f170.google.com with SMTP id fp1so3096068pdb.29
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Nov 2014 08:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=Xat1+zbLU9G09dV1+HVwt2oX5rL8+8W5qUmAq0o6opA=;
	b=toT7X7ZlYBwGEYzDaFJ8SkRie6lhNBSKeSvXPp3IM5WuFq9GgbnkwCYF2CEic6FzUc
	aehdsRfJN3t8ROq/tsZnC1ZIUX5blJ5RUEm6NOz1pIHuBedRxESLt+OKUGoDonJ3/6X3
	/qewEwFz37vndcZuARLeitViAyFSYvfOdSHkkZ7i49VkMIVhK0RZxzk5YsA/IAsB0pKH
	fNHO9Dzu8hjmGHHI95gh2yTZtw1Qt6U6dVEoZlqmmcBG+GHQhvG7f8UMHNdoru42WhQj
	UumdlQ1b+5dbkDal9X4wusN6dP1h2TlgbdeaFSYpBKEyPUFy3NXyUdpYz8RXY9+RDM1L
	JAHw==
X-Received: by 10.70.131.44 with SMTP id oj12mr31178912pdb.112.1417018935732; 
	Wed, 26 Nov 2014 08:22:15 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id d8sm4749258pdm.27.2014.11.26.08.22.13
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 26 Nov 2014 08:22:14 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Nov 2014 08:22:05 -0800
Message-Id: <cover.1417018567.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>,
	Javier Viguera <javier.viguera@digi.com>,
	Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: [PATCH 00/11] Dizzy next #2
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
X-List-Received-Date: Wed, 26 Nov 2014 16:22:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please consider these changes for the next Dizzy.

The following changes since commit 85b8abe50482deaa1af62f265e82f53a54bbcd77:

  nss: define MP_USE_UINT_DIGIT when compile mpi_x86.s (2014-11-24 16:38:18 -0800)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akuster/dizzy-next
  http://git.yoctoproject.org/cgit.cgi//log/?h=akuster/dizzy-next

Andrei Gherzan (1):
  xkeyboard-config: Inherit gettext

Aníbal Limón (1):
  package_manager: DpkgPM fix populate_sdk

Javier Viguera (1):
  shadow-securetty: add ttyAM[0-3] serial ports

Robert Yang (1):
  qemu: disable the build for mips

Saul Wold (1):
  babeltrace: Backport fix for unaligned integer

Tom Zanussi (5):
  wic: Don't allow mkfs to fail silently in partition command
  wic: Update the help text to include -D (--debug)
  Revert "wic: set bootimg_dir when using image-name artifacts"
  wic: Remove special-case bootimg_dir
  wic: Update bootimg-partition to use bootimg_dir

Wenzong Fan (1):
  python: Fix CVE-2014-7185

 meta/lib/oe/package_manager.py                     |   2 +-
 .../python/python/python-2.7.3-CVE-2014-7185.patch |  75 ++++++
 meta/recipes-devtools/python/python_2.7.3.bb       |   1 +
 meta/recipes-devtools/qemu/qemu_2.1.0.bb           |   1 +
 meta/recipes-devtools/qemu/qemu_git.bb             |   1 +
 meta/recipes-extended/shadow/files/securetty       |   4 +
 .../xorg-lib/xkeyboard-config_2.12.bb              |   2 +-
 ...n-t-perform-unaligned-integer-read-writes.patch | 252 +++++++++++++++++++++
 meta/recipes-kernel/lttng/babeltrace_1.2.1.bb      |   1 +
 scripts/lib/image/engine.py                        |  42 +---
 scripts/lib/image/help.py                          |  23 +-
 scripts/lib/wic/imager/direct.py                   |   5 +-
 .../lib/wic/kickstart/custom_commands/partition.py |  22 +-
 scripts/lib/wic/plugins/imager/direct_plugin.py    |  20 +-
 scripts/lib/wic/plugins/source/bootimg-efi.py      |   5 +-
 .../lib/wic/plugins/source/bootimg-partition.py    |   9 +-
 scripts/lib/wic/plugins/source/bootimg-pcbios.py   |   3 +-
 scripts/wic                                        |  13 +-
 18 files changed, 402 insertions(+), 79 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python/python-2.7.3-CVE-2014-7185.patch
 create mode 100644 meta/recipes-kernel/lttng/babeltrace/0001-Fix-don-t-perform-unaligned-integer-read-writes.patch

-- 
1.9.1


