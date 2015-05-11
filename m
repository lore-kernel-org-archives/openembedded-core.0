Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A3C7F6013D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 06:08:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4B68jXt003147
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 May 2015 23:08:46 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Sun, 10 May 2015 23:08:45 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 10 May 2015 23:08:33 -0700
Message-ID: <cover.1431324180.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 00/12] make world build work without x11 in DISTRO_FEATURES
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
X-List-Received-Date: Mon, 11 May 2015 06:08:46 -0000
Content-Type: text/plain

Hello,

These patches make world build OK without x11 in DISTRO_FEATURES,
please feel free to give your comments.

I'm trying to make the commits by directories, if there is only one
recipe in the directory that I have edited, then use the recipe name.

I've added comments in the patch on why it needs x11 in DISTRO_FEATURES,
please see the patch for more info.

// Robert

The following changes since commit 7ffe10df73cc20d10fcd41b121074445273bd60e:

  license_class: license_create_manifest improvment (2015-05-09 22:26:02 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/no_x11
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/no_x11

Robert Yang (12):
  mesa: fix do_install_append
  gtk+/cairo: enable x11 or directfb
  mesa-demos: only enable glu when x11 in DISTRO_FEATURES
  libglu: add x11 to REQUIRED_DISTRO_FEATURES
  libsdl: depends on libglu when x11
  libowl/settings-daemon/libnotify: add x11 to REQUIRED_DISTRO_FEATURES
  recipes-extended: add x11 to REQUIRED_DISTRO_FEATURES
  recipes-graphics: add x11 to REQUIRED_DISTRO_FEATURES
  gst-plugins-gl: add x11 to REQUIRED_DISTRO_FEATURES
  packagegroup-core-qt: add x11 to REQUIRED_DISTRO_FEATURES
  recipes-sato: add x11 to REQUIRED_DISTRO_FEATURES
  at-spi2-atk: add x11 to REQUIRED_DISTRO_FEATURES

 .../packagegroups/packagegroup-core-lsb.bb         |    5 ++++-
 .../xdg-utils/xdg-utils_1.1.0-rc1.bb               |    5 ++++-
 meta/recipes-gnome/gtk+/gtk+.inc                   |    5 ++---
 meta/recipes-gnome/libnotify/libnotify_0.6.0.bb    |    6 +++++-
 meta/recipes-graphics/cairo/cairo.inc              |    7 +++++--
 meta/recipes-graphics/libepoxy/libepoxy_1.2.bb     |    5 ++++-
 meta/recipes-graphics/libfakekey/libfakekey_git.bb |    5 ++++-
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb      |    4 ++--
 meta/recipes-graphics/mesa/libglu_9.0.0.bb         |    5 ++++-
 meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb     |    4 ++--
 meta/recipes-graphics/mesa/mesa_10.5.4.bb          |    2 +-
 meta/recipes-graphics/mesa/mesa_git.bb             |    2 +-
 meta/recipes-graphics/waffle/waffle_1.3.0.bb       |    5 ++++-
 .../xorg-font/xorg-font-common.inc                 |    6 +++++-
 .../xorg-font/xorg-minimal-fonts.bb                |    5 ++++-
 meta/recipes-graphics/xorg-lib/libxcb.inc          |    5 ++++-
 meta/recipes-graphics/xorg-lib/xcb-util.inc        |    4 +++-
 .../xvideo-tests/xvideo-tests_git.bb               |    5 ++++-
 .../gstreamer/gst-plugins-gl_0.10.3.bb             |    5 ++++-
 .../packagegroups/packagegroup-core-qt.bb          |    5 ++++-
 meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb      |    8 +++++---
 meta/recipes-sato/libowl/libowl_git.bb             |    5 ++++-
 .../matchbox-config-gtk/matchbox-config-gtk_git.bb |    4 +++-
 .../matchbox-desktop/matchbox-desktop_git.bb       |    5 ++++-
 .../matchbox-keyboard/matchbox-keyboard_git.bb     |    5 ++++-
 .../matchbox-panel-2/matchbox-panel-2_git.bb       |    5 ++++-
 .../matchbox-sato/matchbox-session-sato_0.1.bb     |    5 +++++
 .../matchbox-theme-sato/matchbox-theme-sato.inc    |    5 ++++-
 meta/recipes-sato/midori/midori_0.5.8.bb           |    5 ++++-
 meta/recipes-sato/pcmanfm/pcmanfm_1.2.3.bb         |    5 ++++-
 meta/recipes-sato/puzzles/oh-puzzles_git.bb        |    9 +++++++--
 meta/recipes-sato/puzzles/puzzles_r10116.bb        |    5 ++++-
 .../sato-screenshot/sato-screenshot_git.bb         |    5 ++++-
 .../settings-daemon/settings-daemon_git.bb         |    5 ++++-
 meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb       |    5 ++++-
 meta/recipes-support/atk/at-spi2-atk_2.16.0.bb     |    5 ++++-
 36 files changed, 138 insertions(+), 43 deletions(-)

-- 
1.7.9.5


