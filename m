Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id E9DBD73A73
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 14:50:14 +0000 (UTC)
Received: by pdbfp1 with SMTP id fp1so2692220pdb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 07:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=Wj1vTLir+BoPgvMuEv776NbIZEJ9RXWpXFQWhyJIlfs=;
	b=tooEi/yonXo0QPqqaHOHDXEYhZTwSSnGnkVh2JiwvDRifyxIG/2Lz7PkRDh/upSE5b
	r+FkJkzRRSlx/FHBOammjrSzrec6vmUtD35sTqCM4yQcZWZZHiT/sehBsnBhbeS5Snfp
	Y0mwplqzmLH7VT7H2vWI1usIg7XFo816PX1DkHo4ivw880gBbsLC55vor9vxEUrgLfyF
	pEa2qSCZANnirkmV9UhkoKFf2uT3kQjgj/UVIYFSp2fq/GEtDWuM+v6np+LBeYFAAtTR
	nv+X4NjLm8y5Iz4HaJV28AAtDGFEaKzE1PlBkVq0hKEPduWTu3JBem5hx8ORvlQjt2dE
	vwFQ==
X-Received: by 10.70.48.39 with SMTP id i7mr14354610pdn.116.1425999015087;
	Tue, 10 Mar 2015 07:50:15 -0700 (PDT)
Received: from Pahoa2.hsd1.ca.comcast.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id rd7sm1317543pdb.85.2015.03.10.07.50.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Mar 2015 07:50:12 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Mar 2015 07:50:08 -0700
Message-Id: <cover.1425995488.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 00/17] [Dizzy] Next
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
X-List-Received-Date: Tue, 10 Mar 2015 14:50:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please conzider these changes for the next Dizzy release

The following changes since commit 93e3df91aaebd48b9c4af946247f3488681d32b6:

  documenation: Updates to release month for rev history tables. (2015-03-10 11:07:55 +0000)

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


