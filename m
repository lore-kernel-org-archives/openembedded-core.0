Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id BA0147716B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 15:51:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 5544A600680
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Oct 2015 16:51:17 +0100
Message-Id: <cover.1445010332.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/6] Various metadata tweaks
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
X-List-Received-Date: Fri, 16 Oct 2015 15:51:46 -0000

The following series are some tidy ups and changes made whilst
porting a distro with systemd and a Weston + Xwayland userland to
Jethro.

Please consider them for inclusion.

Regards,

Joshua


The following changes since commit 10e5df3503632a6e1c54612055b19f7258c3ae2f:

  lib/oe/image.py: Fix dependency handling for compressed types (2015-10-14 18:08:22 +0300)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib joshuagl/cleanup
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=joshuagl/cleanup

Joshua Lock (6):
  systemd: build with compatibility libraries
  weston: add PACKAGECONFIG to build with systemd-login support
  systemd: make dbus an optional build time dependency
  weston: add a PACKAGECONFIG option for xwayland support
  xserver-xorg: add Xwayland RRECOMMENDS
  xserver-xorg: drop empty ${PN}-security-policy package

 meta/recipes-core/systemd/systemd_225.bb            | 6 ++++--
 meta/recipes-graphics/wayland/weston_1.8.0.bb       | 6 +++++-
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 8 ++++----
 3 files changed, 13 insertions(+), 7 deletions(-)

-- 
2.1.4


