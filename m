Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 6ADFB76104
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 09:47:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 052B6608EEC
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Oct 2015 10:47:08 +0100
Message-Id: <cover.1445334356.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH v2 0/7] Various metadata tweaks v2
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
X-List-Received-Date: Tue, 20 Oct 2015 09:47:32 -0000

The following series are some tidy ups and changes made whilst
porting a distro with systemd and a Weston + Xwayland userland to
Jethro.

Please consider them for inclusion.

Changes since v1:
* Backport weston patch to use libsystemd.pc
* Don't enable systemd compat PACKAGECONFIG by default

Regards,

Joshua

  lib/oe/image.py: Fix dependency handling for compressed types (2015-10-14 18:08:22 +0300)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib joshuagl/cleanup
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=joshuagl/cleanup

Joshua Lock (7):
  systemd: add PACKAEGCONFIG to build with compatibility libraries
  weston: backport support for single libsystemd.pc
  weston: add PACKAGECONFIG to build with systemd-login support
  systemd: make dbus an optional build time dependency
  weston: add a PACKAGECONFIG option for xwayland support
  xserver-xorg: add Xwayland RRECOMMENDS
  xserver-xorg: drop empty ${PN}-security-policy package

 meta/recipes-core/systemd/systemd_225.bb           |  4 +-
 .../wayland/weston/libsystemd.patch                | 53 ++++++++++++++++++++++
 meta/recipes-graphics/wayland/weston_1.8.0.bb      |  7 ++-
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |  8 ++--
 4 files changed, 66 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-graphics/wayland/weston/libsystemd.patch

-- 
2.1.4


