Return-Path: <petter@technux.se>
Received: from bin-vsp-out-01.atm.binero.net (vsp-authed01.binero.net
	[195.74.38.224])
	by mail.openembedded.org (Postfix) with ESMTP id 09E6272BEC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 21:57:33 +0000 (UTC)
X-Halon-ID: 9135c0e4-9d01-11e4-a1ae-005056917a89
Authorized-sender: petter@technux.se
Received: from elxbvzzwp1-cy.localdomain (unknown [95.197.59.95])
	by bin-vsp-out-01.atm.binero.net (Halon Mail Gateway) with ESMTPSA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 22:57:58 +0100 (CET)
From: =?UTF-8?q?Petter=20Mab=C3=A4cker?= <petter@technux.se>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Jan 2015 22:57:17 +0100
Message-Id: <cover.1421358457.git.petter@technux.se>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/5] base.bbclass: detect when S has been set incorrectly
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
X-List-Received-Date: Thu, 15 Jan 2015 21:57:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

No code changes since the RFC version, besides a rebase against latest yocto changes.

The following changes since commit 10837473b27aa1708866eb2b1b5701daa984e94e:

  libxml2: Backport fix for CVE introduced entity issues (2015-01-15 16:55:17 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib petmab/bug5627
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=petmab/bug5627

Petter Mabäcker (5):
  base.bbclass: detect when S has been set incorrectly
  makedevs: set and handle S in a proper way
  lsof: handle S in a proper way
  xorg-minimal-fonts: set and handle S in a proper way
  meta: set proper S value

 meta/classes/base.bbclass                               | 17 +++++++++++++----
 meta/recipes-bsp/alsa-state/alsa-state.bb               |  2 ++
 meta/recipes-bsp/hostap/hostap-conf_1.0.bb              |  2 ++
 meta/recipes-bsp/keymaps/keymaps_1.0.bb                 |  2 ++
 meta/recipes-connectivity/connman/connman-conf.bb       |  2 ++
 meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb  |  2 ++
 meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb    |  2 ++
 meta/recipes-core/initrdscripts/initramfs-boot_1.0.bb   |  2 ++
 .../initrdscripts/initramfs-framework_1.0.bb            |  2 ++
 .../initrdscripts/initramfs-live-boot_1.0.bb            |  2 ++
 .../initramfs-live-install-efi-testfs_1.0.bb            |  2 ++
 .../initrdscripts/initramfs-live-install-efi_1.0.bb     |  2 ++
 .../initrdscripts/initramfs-live-install-testfs_1.0.bb  |  2 ++
 .../initrdscripts/initramfs-live-install_1.0.bb         |  2 ++
 meta/recipes-core/initscripts/initscripts_1.0.bb        |  2 ++
 meta/recipes-core/systemd/systemd-systemctl-native.bb   |  2 ++
 meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb  |  2 +-
 meta/recipes-core/udev/udev-extraconf_1.1.bb            |  2 ++
 meta/recipes-devtools/makedevs/makedevs_1.0.1.bb        |  6 ++----
 meta/recipes-devtools/opkg/opkg-collateral.bb           |  2 ++
 .../recipes-devtools/run-postinsts/run-postinsts_1.0.bb |  2 ++
 meta/recipes-extended/lsof/lsof_4.88.bb                 |  7 +++++++
 meta/recipes-extended/shadow/shadow-securetty_4.2.1.bb  |  2 ++
 meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb   |  4 +++-
 .../xorg-xserver/xserver-xf86-config_0.1.bb             |  2 ++
 .../modutils-initscripts/modutils-initscripts.bb        |  3 +++
 meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb             |  2 ++
 meta/recipes-support/ptest-runner/ptest-runner_1.0.bb   |  2 ++
 28 files changed, 73 insertions(+), 10 deletions(-)

-- 
1.9.1


