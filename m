Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 8787371633
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 19:16:10 +0000 (UTC)
Received: by padhm10 with SMTP id hm10so15732632pad.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 12:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=Q9/K5aZDeR4dX2LEA9lSCQkWoI5HH10oHlwi+wt/oMQ=;
	b=mJn06ioZ1dAK7UAQbKrDPQL1zQe6BT71Uhv1svIqaLqRX5TQDjhA0FFlzqJluI1rO9
	aRv5V1xW4c81TYErpvOV3H0sWl1HebB0zbNnKiJSeWH2Uuj8plRqP4YY2dN4IEQsY6Y1
	JvKOnj8kO9P9KJx45OoM/P3fQSEx+ixH0jZdVfE5Sa7mF840y8OaxO+2Kv9tIOzuE6Yu
	SRzGILysty4UShCbSjDuJ3PrNnnVi1pbvsucZ2QBgwyClw8DKeEsPN4Mp5PZMB0JbqMY
	Ayv+3EXPOx9MwgJtTJFeCfdTYG23lG3nDMEXPU0zchUJFweE/yE4G0mmRdPM36msvOTE
	dBkA==
X-Received: by 10.68.57.170 with SMTP id j10mr17985426pbq.56.1440789370677;
	Fri, 28 Aug 2015 12:16:10 -0700 (PDT)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id ri9sm6545483pbc.4.2015.08.28.12.16.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Aug 2015 12:16:09 -0700 (PDT)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 7D9CFFC07A4; Fri, 28 Aug 2015 12:16:06 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Aug 2015 12:16:04 -0700
Message-Id: <cover.1440789168.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 00/17] For Dizzy 1.7.3a
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
X-List-Received-Date: Fri, 28 Aug 2015 19:16:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please consider these addition changes for Dizzy 1.7.3

The following changes since commit 86971b5d97645cdbf2e48c39f30afa7c44e81e81:

  oeqa/bbtests: Fix to ensure DL_DIR is set (2015-07-26 07:59:00 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akuster/dizzy-next
  http://git.yoctoproject.org/cgit.cgi//log/?h=akuster/dizzy-next

Alejandro Hernandez (1):
  qemurunner: Improves checking for server and target IPs on qemus
    parameters

Aníbal Limón (2):
  license_class: Fix choose_lic_set into incompatible license
  license_class: fix license.manifest shows LICENSE field differently to
    recipe

Martin Jansa (2):
  connman-conf: fix SRC_URI_append
  license.bbclass: fix unexpected operator for LICENSE values with space

Paul Eggleton (1):
  oeqa/utils/qemurunner: fix logging

Petter Mabäcker (1):
  meta: set proper S value

Richard Purdie (3):
  dpkg: Fix for Fedora22 and new versions of tar
  dpkg: Fix tarfix.patch
  grub-efi: Add backslash lost from previous commit

Ross Burton (1):
  oeqa/QemuRunner: don't use bb for logging

Saul Wold (1):
  grub-efi: Use the backport patch from grub

Sona Sarmadi (4):
  bind9.9.5: CVE-2015-5477
  qemu: CVE-2014-7840
  qemu-vnc: CVE-2014-7815
  qemu-slirp: CVE-2014-3640

Yi Zhao (1):
  oeqa/selftest: fix test_incremental_image_generation for changes in
    log output

 meta/classes/license.bbclass                       | 18 +++---
 meta/lib/oeqa/selftest/buildoptions.py             | 11 ++--
 meta/lib/oeqa/utils/qemurunner.py                  | 73 ++++++++++++----------
 meta/recipes-bsp/alsa-state/alsa-state.bb          |  2 +
 meta/recipes-bsp/grub/grub-efi_2.00.bb             |  1 +
 meta/recipes-bsp/hostap/hostap-conf_1.0.bb         |  2 +
 meta/recipes-bsp/keymaps/keymaps_1.0.bb            |  2 +
 .../bind/bind/bind9_9_5-CVE-2015-5477.patch        | 45 +++++++++++++
 meta/recipes-connectivity/bind/bind_9.9.5.bb       |  1 +
 meta/recipes-connectivity/connman/connman-conf.bb  |  8 ++-
 .../ppp-dialin/ppp-dialin_0.1.bb                   |  2 +
 .../init-ifupdown/init-ifupdown_1.0.bb             |  2 +
 .../initrdscripts/initramfs-boot_1.0.bb            |  2 +
 .../initrdscripts/initramfs-framework_1.0.bb       |  2 +
 .../initrdscripts/initramfs-live-boot_1.0.bb       |  2 +
 .../initramfs-live-install-efi-testfs_1.0.bb       |  2 +
 .../initramfs-live-install-efi_1.0.bb              |  2 +
 .../initramfs-live-install-testfs_1.0.bb           |  2 +
 .../initrdscripts/initramfs-live-install_1.0.bb    |  2 +
 meta/recipes-core/initscripts/initscripts_1.0.bb   |  2 +
 .../systemd/systemd-systemctl-native.bb            |  2 +
 .../sysvinit/sysvinit-inittab_2.88dsf.bb           |  2 +-
 meta/recipes-core/udev/udev-extraconf_1.1.bb       |  2 +
 meta/recipes-devtools/dpkg/dpkg/tarfix.patch       | 45 +++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.17.4.bb          |  1 +
 meta/recipes-devtools/opkg/opkg-collateral.bb      |  2 +
 .../recipes-devtools/qemu/qemu/CVE-2014-7840.patch | 57 +++++++++++++++++
 .../qemu/qemu/slirp-CVE-2014-3640.patch            | 48 ++++++++++++++
 .../qemu/qemu/vnc-CVE-2014-7815.patch              | 53 ++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.1.0.bb           |  3 +
 .../run-postinsts/run-postinsts_1.0.bb             |  2 +
 .../shadow/shadow-securetty_4.2.1.bb               |  2 +
 .../xorg-xserver/xserver-xf86-config_0.1.bb        |  2 +
 .../modutils-initscripts/modutils-initscripts.bb   |  3 +
 meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb        |  2 +
 .../ptest-runner/ptest-runner_1.0.bb               |  2 +
 36 files changed, 361 insertions(+), 50 deletions(-)
 create mode 100644 meta/recipes-connectivity/bind/bind/bind9_9_5-CVE-2015-5477.patch
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/tarfix.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2014-7840.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/slirp-CVE-2014-3640.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/vnc-CVE-2014-7815.patch

-- 
1.9.1


