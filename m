Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id CF0CB73C0D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 16:41:11 +0000 (UTC)
Received: by patj18 with SMTP id j18so16041006pat.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 09:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=kehzpVgXxjNxsfI4g3fu+scSw86MvmjXcM9Kl3qacCo=;
	b=CaEyzZS2f2VtLPTjMlg/8vA6PYHMi309MvOtLV2py73TvgEC2qv0pOZ+jeAy4gCzzk
	tyiOMI/0TQN7nXt5aJi0TypuLtnzO+j2sCN175JejwBJNwIdW7lnDb4x7lJZ63159lA3
	X1BumMkd446ESPL7y+y3I+ZiKwDIuVqUlaHLfdlXv4/e4UglA78R2C2G37ctbY8kwmmb
	lbhUbEjN7x8t2ZSxvxEUnYkyTQ8GcaZr9fnUuSOUiYQvGefoYJawsx+t/ihWvNs1pMxy
	6b4cdDe5K+epfY4g+/VwoFZaqo2lljU5qvcVK/tuEyBkrV5uCpKCtXSDFs4Zdn35LD+7
	d3vw==
X-Received: by 10.70.64.138 with SMTP id o10mr12480489pds.104.1427733672142;
	Mon, 30 Mar 2015 09:41:12 -0700 (PDT)
Received: from Pahoa2.hsd1.ca.comcast.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id b9sm5199393pas.40.2015.03.30.09.41.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 30 Mar 2015 09:41:11 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Mar 2015 09:41:05 -0700
Message-Id: <cover.1427729801.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 00/17] meta-core Dizzy next
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
X-List-Received-Date: Mon, 30 Mar 2015 16:41:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

please consider these changes for Dizzy next

The following changes since commit ec75238f6cc2d2d8d40e0268f6d2acc070cbe9a4:

  Revert "file: Update CVE patch to ensure file gets built correctly" (2015-03-28 10:56:50 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akuster/dizzy-next
  http://git.yoctoproject.org/cgit.cgi//log/?h=akuster/dizzy-next

Aníbal Limón (1):
  files/toolchain-shar-template.sh: fix replace target_sdk_dir twice in
    environment setup file

Bian Naimeng (1):
  gcc-4.9: fix bug of 0056-top-level-reorder_gcc-bug-61144.patch

Bruce Ashfield (3):
  linux-yocto/3.10: update to v3.10.65
  linux-yocto/3.14: update to 3.14.29
  linux-yocto/3.17: update to v3.17.8

Chen Qi (1):
  package_manager.py: fix rootfs failure with multilib enabled

Enrico Scholz (1):
  serf: fix 'ccache' builds

Martin Jansa (2):
  xorg-driver: add x11 to required DISTRO_FEATURES
  piglit: add x11 to required DISTRO_FEATURES

Patrick Ohly (2):
  binconfig-disabled: try harder to prevent usage of config scripts
  binconfig-disabled: install config scripts in sysroot

Richard Purdie (1):
  gcc-target: Don't install target gcc libdir files

Robert Yang (2):
  dpkg: add perl to RDEPENDS
  which 2.18: fix SRC_URI

Ross Burton (2):
  bitbake: tests/data: add test for incorrect remove behaviour
  bitbake: data_smart: split expanded removal values when handling
    _remove

Saul Wold (1):
  linux-yocto-tiny_3.17: Update to actually use 3.17 git repo

 bitbake/lib/bb/data_smart.py                       |  3 +-
 bitbake/lib/bb/tests/data.py                       |  7 ++++
 meta/classes/binconfig-disabled.bbclass            | 13 +++++++
 meta/files/toolchain-shar-template.sh              |  1 +
 meta/lib/oe/package_manager.py                     |  5 ++-
 meta/recipes-devtools/dpkg/dpkg.inc                |  2 +-
 .../0056-top-level-reorder_gcc-bug-61144.patch     | 42 ++++++++++------------
 meta/recipes-devtools/gcc/gcc-target.inc           |  9 +++++
 meta/recipes-extended/which/which_2.18.bb          |  2 +-
 meta/recipes-graphics/piglit/piglit_git.bb         |  4 ++-
 .../xorg-driver/xorg-driver-common.inc             |  4 ++-
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |  8 ++---
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  8 ++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |  6 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  6 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb |  8 ++---
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 18 +++++-----
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 18 +++++-----
 meta/recipes-kernel/linux/linux-yocto_3.17.bb      | 18 +++++-----
 meta/recipes-support/serf/serf/env.patch           | 28 +++++++++++++++
 meta/recipes-support/serf/serf_1.3.7.bb            |  8 ++---
 21 files changed, 139 insertions(+), 79 deletions(-)
 create mode 100644 meta/recipes-support/serf/serf/env.patch

-- 
1.9.1


