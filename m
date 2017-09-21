Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 1789677E76
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 14:31:31 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id p87so3291152pfj.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 07:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=dFp056pb9bPJJqGBAMyijGqFJe1Ilr5MtXeWNrNCVe8=;
	b=pQbujMFpI51P12v1R4lJJIan9YZKLnOg0tesOGwtvY8e370zs3bFo9Fi1NoJ4k6UdX
	hSQHVhuL5UZFdyBOGwpiB4C/BiLvllNoUeva49O/lj4kH6566+p0lGtB2nsRanh3DL8R
	6ICybNTMQKxduLV8fpFUSlG98SM/fjb2OF4y2/k6JIcuZSpFocsPXZDTiKCxyUbME8yY
	TH3bGmzZQA1r/Idddsg/bA5QZQ1oy7HDQh490dmmwixO54db5NKd6Ps6X+28RzycAM4+
	DpSXq0NSOkwBes/Sa+feADXbiMgGan6J7ejQoA3KPM1mNUm5Iq+DN02cJgxUVmit1PwJ
	rjVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=dFp056pb9bPJJqGBAMyijGqFJe1Ilr5MtXeWNrNCVe8=;
	b=D9B/X2wL6HY8i6fwjXHOf98H7ulipNMR9RsCVLUaKFSS2D0zG7m7DhJ0BnBrmvliv4
	3oqgUhRcm6dDrLccJqzhfGHk8VNZzYIcQ1da8sPlnj+XlkeOjF4Y6nWIn/2e41RmDu/x
	IGhEi6OCUISxTCcPBCQ+SscGKvttap46ct7BhWoR0QgXA4m6Be8nrU0Tt0xuamRbJtK/
	OYaI9ed8FTZ0OdmuVHcFRH2BWejzw0rHlOD1OLYzd/NcjlFLYelbVCOVOeG9w0Kj41Dw
	nLZygsErg7EmvfBLMu6/pTyXJWkbU30CyiZ5jb18njxkFb22n6qJ1q+/QDs/BMObjTWD
	RRqA==
X-Gm-Message-State: AHPjjUhxQT9xJzkd3J3U+xr3pX1FZEfXIX67uorQKguVawfgLR5SkdaA
	TOtvkQj1g3HUsx3Y0HK7l28=
X-Google-Smtp-Source: AOwi7QAEEq+2+gDoQc8i48W/VQvDIAVNNpQU//CoT7ICAEzIVJ3JI63yW4Ch+4y5X4UZE0AkacHNMg==
X-Received: by 10.98.218.18 with SMTP id c18mr5837838pfh.256.1506004292322;
	Thu, 21 Sep 2017 07:31:32 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4001:9ea0:6413:eafd:1152:fa5c])
	by smtp.gmail.com with ESMTPSA id 89sm3438723pfn.75.2017.09.21.07.31.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Sep 2017 07:31:31 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Thu, 21 Sep 2017 07:30:36 -0700
Message-Id: <cover.1506003791.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 00/52] Pyro-next pull request
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
X-List-Received-Date: Thu, 21 Sep 2017 14:31:32 -0000

Please consider this for pyro. Have clean AB build.
Contains kernel security fixes, bsp kernel updates and build fixes

The following changes since commit 072430b9b3a78b318b66371c36e2986d2ed5cba4:

  bitbake.conf: add bzr to HOSTTOOLS_NONFATAL (2017-09-13 22:13:00 +0100)

are available in the git repository at:

  http://git.yoctoproject.org/git/poky-contrib akuster/pyro-next
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akuster/pyro-next

Alejandro Hernandez (17):
  linux-yocto: Update genericx86* SRCREVs for linux-yocto 4.1
  linux-yocto: Update genericx86* SRCREVs for linux-yocto 4.4
  linux-yocto: Update genericx86* SRCREVs for linux-yocto 4.9
  linux-yocto: Update genericx86* SRCREVs for linux-yocto 4.10
  linux-yocto: Update genericx86* SRCREVs for linux-yocto 4.4
  linux-yocto: Update genericx86* SRCREVs for linux-yocto 4.9
  linux-yocto: Update genericx86* SRCREVs for linux-yocto 4.10
  linux-yocto: Update genericx86* SRCREVs for linux-yocto 4.1
  linux-yocto: Update genericx86* SRCREVs for linux-yocto 4.4
  linux-yocto: Update genericx86* SRCREVs for linux-yocto 4.9
  linux-yocto: Update genericx86* SRCREVs for linux-yocto 4.4
  linux-yocto: Update genericx86* SRCREVs for linux-yocto 4.9
  linux-yocto: Update genericx86* SRCREVs for linux-yocto 4.10
  linux-yocto: Update genericx86* SRCREVs for linux-yocto 4.4
  linux-yocto: Update genericx86* SRCREVs for linux-yocto 4.10
  linux-yocto: Update genericx86* SRCREVs for linux-yocto 4.9
  linux-yocto: Update genericx86* SRCREVs for linux-yocto 4.1

Alexander Kanavin (2):
  package_rpm.bbclass: use multithreaded xz compression
  package_rpm.bbclass: disable generation of .build-id links

Armin Kuster (3):
  linuux-yocto/4.1: update to 4.1.43 plus bluetooth CVE-2017-1000251
  meta-yocto-bsp: bump 4.1 to latest linux stable kernel for the non-x86
    BSPs
  linux-yocto/4.1: generix86* bsp fix perf issue with gcc >=7

Awais Belal (1):
  bitbake: toaster: Order column in Tasks selectable

Bruce Ashfield (5):
  linux-yocto/4.4: update to v4.4.87
  linux-yocto/4.9: update to v4.9.49
  linux-yocto/4.10: bluetooth: CVE-2017-1000251
  linux-yocto/4.4: bluetooth: CVE-2017-1000251
  linux-yocto/4.9: bluetooth: CVE-2017-1000251

David Reyna (3):
  bitbake: toaster: display error when the fstype select is empty
  bitbake: toaster: edit column list not sorted
  bitbake: toaster: recipe links broken for default layers

Jose Alarcon (2):
  rootfs-postcommands: remove empty line
  rootfs-postcommands: add test for unsatisfied RRECOMMENDS

Juro Bystricky (1):
  gcc-6.3.inc: Use ucontext_t not struct ucontext.

Kevin Hao (5):
  meta-yocto-bsp: bump to the latest linux stable kernel for the non-x86
    BSPs
  meta-yocto-bsp: bump to the latest linux stable kernel for the non-x86
    BSPs
  meta-yocto-bsp: bump to the latest linux stable kernel for the non-x86
    BSPs
  meta-yocto-bsp: bump to the latest linux stable kernel for the non-x86
    BSPs
  meta-yocto-bsp: bump to the latest linux stable kernel for the non-x86
    BSPs

Khem Raj (1):
  rootfs-postcommands.bbclass: Filter out dangling symlinks in
    ssh_allow_empty_password()

Leonardo Sandoval (1):
  waffle: fix REQUIRED_DISTRO_FEATURES and PACKAGECONFIG virtual/libgl
    dependencies

Mark Hatle (1):
  bitbake: cooker.py: Fix layer priority processing

Ng Wei Tee (1):
  rpm: allow arch-dependent binaries in noarch packages

Olaf Mandel (3):
  bitbake: toaster: debug message for lists layers missing separators
  bitbake: toaster: set default pokydirname if no external layers
  (PRE)MIRRORS: fix pattern for npm:// without slash

Paul Eggleton (3):
  bitbake: cooker: add BB_CMDLINE to enable access to UI command line
    with memres
  bitbake: cooker: fix watching empty directories
  bitbake: cooker: ensure monkey-patching in collect_bbfiles() gets
    undone on error

Peter Kjellerstedt (1):
  alsa-utils: Do not hardcode path to /lib/udev

Richard Purdie (1):
  bitbake: cooker: Track directories searched for bbappend/bb files

Ross Burton (1):
  libproxy: use stable download URL

 bitbake/lib/bb/command.py                          |   3 +-
 bitbake/lib/bb/cooker.py                           |  84 ++++++++-----
 bitbake/lib/bb/cookerdata.py                       |   2 +-
 .../toaster/bldcontrol/localhostbecontroller.py    |   6 +-
 bitbake/lib/toaster/orm/fixtures/oe-core.xml       |   3 +
 bitbake/lib/toaster/orm/fixtures/poky.xml          |   9 ++
 .../toaster/orm/management/commands/lsupdates.py   |   2 +
 bitbake/lib/toaster/toastergui/buildtables.py      |   3 +
 bitbake/lib/toaster/toastergui/static/js/table.js  |  11 +-
 .../toaster/toastergui/templates/projectconf.html  |   3 +
 meta-yocto-bsp/conf/machine/beaglebone.conf        |   2 +-
 meta-yocto-bsp/conf/machine/edgerouter.conf        |   2 +-
 meta-yocto-bsp/conf/machine/mpc8315e-rdb.conf      |   2 +-
 .../recipes-kernel/linux/linux-yocto_4.1.bbappend  |  20 +--
 .../recipes-kernel/linux/linux-yocto_4.10.bbappend |  20 +--
 .../recipes-kernel/linux/linux-yocto_4.4.bbappend  |  20 +--
 .../recipes-kernel/linux/linux-yocto_4.9.bbappend  |  20 +--
 meta/classes/mirrors.bbclass                       |   4 +-
 meta/classes/own-mirrors.bbclass                   |   2 +-
 meta/classes/package_rpm.bbclass                   |   4 +
 meta/classes/rootfs-postcommands.bbclass           |  18 ++-
 meta/recipes-devtools/gcc/gcc-6.3.inc              |   1 +
 .../gcc/gcc-6.3/0055-unwind_h-glibc26.patch        | 139 +++++++++++++++++++++
 meta/recipes-graphics/waffle/waffle_1.5.2.bb       |  10 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb    |   4 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb   |   4 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb    |   6 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb    |   6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb  |   4 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb |   4 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb  |   6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb  |   6 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb       |  18 +--
 meta/recipes-kernel/linux/linux-yocto_4.10.bb      |  18 +--
 meta/recipes-kernel/linux/linux-yocto_4.4.bb       |  20 +--
 meta/recipes-kernel/linux/linux-yocto_4.9.bb       |  20 +--
 meta/recipes-multimedia/alsa/alsa-utils_1.1.3.bb   |   4 +-
 meta/recipes-support/libproxy/libproxy_0.4.14.bb   |   7 +-
 38 files changed, 367 insertions(+), 150 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.3/0055-unwind_h-glibc26.patch

-- 
2.7.4


