Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 51F7060FA7
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Oct 2013 12:23:04 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id c13so2306097eek.33
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 Oct 2013 05:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=KanoDbyoXxKc9ymSFUdfzSr9LeZ4grQPSgwFLIFSwMA=;
	b=Q6QFfIJPB5GRcGm9eqWv3D12Z5TB+RvnlvSKZXHh4obFXOU/BJ9BdY0IBuCjGVj/7J
	kpOxxTY9dUBVRQ/i4vuEjCwux34+Yb1ciQvC604hGa8aUO8fyJJbdMZsT5bxug3VDAhz
	JGn0w7h6rzKHlQ+/74tyhO2Wt1D9dmfCr5IkhbMR0sZLjAy0TqLsh3plUBH2gYOZoX1k
	u4SdIAAedRqnP33tDzpKL87LPYKar7iw5kSrnZgTYbVSxaw9gIlesqSwN6k7w7P5jv70
	DhuaetgL6313Ji46+2QpsIOk3GAsV9XsPdWp4owI7qjj20dEwozmTPo9k6Exlg3a1rXb
	qwVQ==
X-Received: by 10.15.56.72 with SMTP id x48mr533594eew.62.1380975785537;
	Sat, 05 Oct 2013 05:23:05 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	h52sm39222831eez.3.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 05 Oct 2013 05:23:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Oct 2013 14:22:57 +0200
Message-Id: <cover.1380975568.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCHv2 00/14] Deterministic dependencies II
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
X-List-Received-Date: Sat, 05 Oct 2013 12:23:04 -0000

The following changes since commit 796b7510853e71f158ad18dcea4cd1a10c7ef294:

  dbus: fix QA error building nativesdk-dbus (2013-10-04 18:25:06 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/deps
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/deps

Martin Jansa (14):
  gstreamer1.0-libav: Add PACKAGECONFIG for orc
  libunique: Add PACKAGECONFIG for dbus
  aspell: Add PACKAGECONFIG for curses
  xf86-input-synaptics: Add dependency on libxtst
  xdpyinfo: Add dependency on libxcomposite
  matchbox-wm: Add dependency on libxfixes and libxcursor
  telepathy-mission-control: Add PACKAGECONFIG for upower and
    connectivity
  tcl: Add dependency on zlib
  wget: Add dependency on libpcre
  x11vnc: Add PACKAGECONFIG for xinerama
  glib-networking: Add PACKAGECONFIG for p11-kit
  lame: Add dependency on ncurses
  subversion: Add dependency on file for libmagic
  systemd: Add PACKAGECONFIG for cryptsetup

 .../telepathy/telepathy-mission-control_5.15.0.bb            |  8 ++++++++
 meta/recipes-core/glib-networking/glib-networking_2.36.2.bb  |  3 +++
 meta/recipes-core/systemd/systemd_206.bb                     |  1 +
 meta/recipes-devtools/subversion/subversion_1.7.10.bb        |  2 +-
 meta/recipes-devtools/tcltk/tcl_8.6.0.bb                     |  2 +-
 meta/recipes-extended/wget/wget.inc                          |  2 +-
 meta/recipes-gnome/libunique/libunique_1.1.6.bb              |  5 ++++-
 meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.bb         |  2 +-
 meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb         |  2 +-
 meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb                |  1 +
 meta/recipes-graphics/xorg-app/xdpyinfo_1.3.1.bb             |  2 +-
 .../xorg-driver/xf86-input-synaptics_1.7.1.bb                |  2 +-
 .../recipes-graphics/xorg-driver/xf86-input-synaptics_git.bb |  2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc     |  1 +
 meta/recipes-multimedia/lame/lame_3.99.5.bb                  |  2 ++
 meta/recipes-support/aspell/aspell_0.60.6.1.bb               | 12 ++++++++----
 16 files changed, 36 insertions(+), 13 deletions(-)

-- 
1.8.3.2


