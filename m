Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 02FE173D46
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 08:33:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id E6FC36092E9
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Oct 2015 09:31:31 +0100
Message-Id: <cover.1445588979.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH v4 0/6] Various metadata tweaks v4
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
X-List-Received-Date: Fri, 23 Oct 2015 08:33:26 -0000

The following series are some tidy ups and changes made whilst
porting a distro with systemd and a Weston + Xwayland userland to
Jethro.

Please consider them for inclusion.

Changes since v3:
* Only submit the 6 patches I created, sorry about the spam

Changes since v2:
* Backport weston patch to make enabling/disabling of systemd-login explicit
* Mention the change in default behaviour regarding systemds dbus-related tests

Regards,

Joshua

The following changes since commit 73f8a0bf3b99d480bf97e266da0fb048714b4caf:

  build-appliance-image: Update to jethro head revision (2015-10-21 23:13:03 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib joshuagl/cleanup
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=joshuagl/cleanup

Joshua Lock (6):
  systemd: add PACKAGECONFIG to build with compatibility libraries
  weston: add PACKAGECONFIG to build with systemd-login support
  systemd: make dbus an optional build time dependency
  weston: add a PACKAGECONFIG option for xwayland support
  xserver-xorg: add Xwayland RRECOMMENDS
  xserver-xorg: drop empty ${PN}-security-policy package

 meta/recipes-core/systemd/systemd_225.bb           |  4 +-
 .../weston/explicit-enable-disable-systemd.patch   | 70 ++++++++++++++++++++++
 .../wayland/weston/libsystemd.patch                | 53 ++++++++++++++++
 meta/recipes-graphics/wayland/weston_1.8.0.bb      |  8 ++-
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |  8 +--
 5 files changed, 137 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-graphics/wayland/weston/explicit-enable-disable-systemd.patch
 create mode 100644 meta/recipes-graphics/wayland/weston/libsystemd.patch

-- 
2.1.4


