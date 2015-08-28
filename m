Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1070F71633
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 19:44:28 +0000 (UTC)
Received: by pacdd16 with SMTP id dd16so72018611pac.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 12:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=lhPpUAFZOGxexTC5GvPGVvJHCVk1kd21oMgqyEPHdaA=;
	b=oeYwd+OS8O5szaMHT/jFtwUWPY9QzBN4pFn8l8ib6dzYSa4Lm2OsCee0lQeGmrKgzx
	Xc7uP0ONupAkT2lCs9nQ/Sfau2wd2j6p/MEymmeb1PMSx7fkirvOdg0gQM2uOB8n8enT
	Ia4V+LSHkXHJ3LOz/khHuDpx2zJIs6bD4yPkoopAy/7hlnXXxbfFzgQUvlbylwVzoduZ
	04U4z1nh1o0af6whgpk9ejVJuj3Rhd3io2ERv8Q0uQDusXtd+qB3KHJ9uMqGgIRkDSSY
	LE6v7bWNBFqH+kDP8gjv3kftTpKEe6ahOPNZ9qw5QUUGEf8yqVGmqMU3N9Hxb/IB2tr8
	oK/w==
X-Received: by 10.66.102.71 with SMTP id fm7mr17756456pab.5.1440791068655;
	Fri, 28 Aug 2015 12:44:28 -0700 (PDT)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	xv1sm6590811pbb.25.2015.08.28.12.44.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Aug 2015 12:44:27 -0700 (PDT)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 714B2FC07A4; Fri, 28 Aug 2015 12:44:24 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Aug 2015 12:44:22 -0700
Message-Id: <cover.1440790956.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 00/15] For Dizzy 1.7.3a v2
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
X-List-Received-Date: Fri, 28 Aug 2015 19:44:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Rebased against Dizzy this time.

Please consider this changes for Dizzy 1.7.3

The following changes since commit 137f52ac3a3cf6dc9eed27178c37e9ce235341d8:

  grub-efi: Add backslash lost from previous commit (2015-08-20 21:42:31 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akuster/dizzy-next
  http://git.yoctoproject.org/cgit.cgi//log/?h=akuster/dizzy-next

Alejandro Hernandez (1):
  qemurunner: Improves checking for server and target IPs on qemus
    parameters

Aníbal Limón (1):
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
  runqueue: Add message to explain the problem if diffsigs multiple
    tasks don't exist
  fetch2: Extend mirroruri handlling
  sstate: Use SSTATE_DIR for FILESPATH

Ross Burton (1):
  oeqa/QemuRunner: don't use bb for logging

Sona Sarmadi (4):
  bind9.9.5: CVE-2015-5477
  qemu: CVE-2014-7840
  qemu-vnc: CVE-2014-7815
  qemu-slirp: CVE-2014-3640

Yi Zhao (1):
  oeqa/selftest: fix test_incremental_image_generation for changes in
    log output

 bitbake/lib/bb/fetch2/__init__.py                  |  1 +
 bitbake/lib/bb/runqueue.py                         |  2 +
 meta/classes/license.bbclass                       | 15 ++---
 meta/classes/sstate.bbclass                        |  4 +-
 meta/lib/oeqa/selftest/buildoptions.py             | 11 ++--
 meta/lib/oeqa/utils/qemurunner.py                  | 73 ++++++++++++----------
 meta/recipes-bsp/alsa-state/alsa-state.bb          |  2 +
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
 36 files changed, 318 insertions(+), 50 deletions(-)
 create mode 100644 meta/recipes-connectivity/bind/bind/bind9_9_5-CVE-2015-5477.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2014-7840.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/slirp-CVE-2014-3640.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/vnc-CVE-2014-7815.patch

-- 
1.9.1


