Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 26CF76BE5D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 16:01:54 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id q16so344862ead.35
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 09:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=lYuW3t6v0lkImkFW+VAujvsTWNiBVlwcoBkBvPVIxJc=;
	b=xEG0jt9haXhcs+s/zFOA37RwvV+a0UNJeHIyF7rlkjLMoo5RvRovEtmfmwH22AE+c7
	jyijdViNrLLCQCXgHJXic+5uZA/oYyPmL0IsCMqvddunBl1edPCKXo/eE5Y1ZWPMhho4
	juPOIJjLyt/ccCOXP9z7Rb8jxKPZ0lDTPinr4jSojQk4TeCbMA/yPB7PE97QdD0ehEUc
	wMgSyXnSsEBxmbb7MuQJQ3outcNcdfQPxcWa4Icz4P9VNoLVDjh1ET1DfmdMYAojx2RL
	zpZRzFUtrXyf+T5f4tf2WmgTB5SQos5OGHAfXN5uvSp485/Jg6mrVxqMsDf9GbflglRr
	HcHQ==
X-Received: by 10.14.224.198 with SMTP id x46mr5448356eep.53.1377792115291;
	Thu, 29 Aug 2013 09:01:55 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	b45sm47231040eef.4.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 09:01:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Aug 2013 18:02:47 +0200
Message-Id: <cover.1377792005.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [WIP][PATCH 00/20] Deterministic dependencies II
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
X-List-Received-Date: Thu, 29 Aug 2013 16:01:56 -0000

WIP because verification build is still running and I must admit that I'm mostly
testing that all dependencies are correctly "disabled" and in the end deterministic.

I'm not testing if every possible combination of PACKAGECONFIG options provide sufficient
dependency tree.

But it would be nice to get some review in advance and be able to get this
in 1.5 if I manage to fix all possible review comments and/or issues discovered
in my builds in time.

The following changes since commit 7d93288117e7054472d8a01dde0b38bc0ff98c27:

  buildtools-tarball: Add python-pkgutil (2013-08-29 00:22:49 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/deps
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/deps

Martin Jansa (20):
  gstreamer1.0-libav: Add PACKAGECONFIG for orc
  libunique: Add PACKAGECONFIG for dbus
  aspell: Add PACKAGECONFIG for curses
  xf86-input-synaptics: Add dependency on libxtst
  xdypinfo: Add dependency on libxcomposite
  libmatchbox: Add PACKAGECONFIG for png
  matchbox-wm: Add dependency on libxfixes and libxcursor
  telepathy-mission-control: Add PACKAGECONFIG for upower and
    connectivity
  tcl: Add dependency on zlib
  weston: Add PACKAGECONFIG for poppler
  wget: Add dependency on libpcre
  x11vnc: Add PACKAGECONFIG for xfixes, xinerama, xrandr and xdamage
  guile: Add PACKAGECONFIG for readline
  consolekit: Add patch to explicitly disable polkit when not enabled
  glib-networking: Add PACKAGECONFIG for p11-kit
  lame: Add dependency on ncurses
  librsvg: Fix dependencies for PACKAGECONFIG gdkpixbuf
  subversion: Add dependency on file for libmagic
  systemd: Add PACKAGECONFIG for cryptsetup
  qemu: Add PACKAGECONFIG for nss, uuid, tls and curses

 .../telepathy/telepathy-mission-control_5.15.0.bb  |  8 ++++
 .../glib-networking/glib-networking_2.36.2.bb      |  3 ++
 meta/recipes-core/systemd/systemd_206.bb           |  1 +
 meta/recipes-devtools/guile/guile_2.0.9.bb         |  3 ++
 meta/recipes-devtools/qemu/qemu.inc                |  4 ++
 .../subversion/subversion_1.7.10.bb                |  2 +-
 meta/recipes-devtools/tcltk/tcl_8.6.0.bb           |  2 +-
 meta/recipes-extended/wget/wget.inc                |  2 +-
 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb       |  2 +-
 meta/recipes-gnome/libunique/libunique_1.1.6.bb    |  5 ++-
 .../libmatchbox/libmatchbox_1.11.bb                |  3 ++
 .../matchbox-wm/matchbox-wm_1.2.bb                 |  2 +-
 .../matchbox-wm/matchbox-wm_git.bb                 |  2 +-
 .../0001-configure-Allow-to-disable-poppler.patch  | 43 ++++++++++++++++++++++
 meta/recipes-graphics/wayland/weston_1.1.0.bb      |  2 +
 meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb      |  6 +++
 meta/recipes-graphics/xorg-app/xdpyinfo_1.3.1.bb   |  2 +-
 .../xorg-driver/xf86-input-synaptics_1.7.1.bb      |  2 +-
 .../xorg-driver/xf86-input-synaptics_git.bb        |  2 +-
 .../gstreamer/gstreamer1.0-libav.inc               |  1 +
 meta/recipes-multimedia/lame/lame_3.99.5.bb        |  2 +
 meta/recipes-support/aspell/aspell_0.60.6.1.bb     | 12 ++++--
 .../allow.to.disable.polkit.support.patch          | 33 +++++++++++++++++
 .../recipes-support/consolekit/consolekit_0.4.6.bb |  4 +-
 24 files changed, 132 insertions(+), 16 deletions(-)
 create mode 100644 meta/recipes-graphics/wayland/weston/0001-configure-Allow-to-disable-poppler.patch
 create mode 100644 meta/recipes-support/consolekit/consolekit/allow.to.disable.polkit.support.patch

-- 
1.8.3.2


