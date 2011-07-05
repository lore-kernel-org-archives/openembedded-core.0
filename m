Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QeEWm-0006v3-2a
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jul 2011 00:55:36 +0200
Received: by rex (Postfix, from userid 1000)
	id 60426292E7; Tue,  5 Jul 2011 23:51:15 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jul 2011 23:51:12 +0100
Message-Id: <cover.1309906154.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 00/17] Various QA/unpackaged files cleanups
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Jul 2011 22:55:36 -0000

This patch series is for a number of QA/unpackaged files cleanups.

The following changes since commit f05b7ee7716d1e5cc1ba0bbab57e91c3a0569e9e:

  x-load: Update to 1.5.0 (2011-07-05 14:16:33 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib rpurdie/master
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rpurdie/master

Richard Purdie (17):
  gcc: Fix unpackaged files warnings, broken symlink and superfluous
    files
  connman: Package unpackaged .la file
  tslib: Package unpackaged .la file
  btrfs-tools: Fix manpage creation directory
  xcb-proto: Package unshipped files, create python-xcbgen package for
    python xcbgen code
  eds-dbus: Package unpackaged files
  systemtap: Don't set prefix to a path including  so examples get
    placed in the correct path and packaged correctly
  qt4: Package debug source files
  telepathy-python: Remove unneeded and unpackaged files
  librsvg: Clean up unpackaged files
  gtk-engines: Package unpackaged files
  x11perf: Packaged unpackaged files
  apt: Package unpackaged files
  git: Package up python and gitweb files into appropriate packages
  kernelshark/trace-cmd: Clean up QA warnings including fising LDFLAGS
    issues
  opensp: Add unpackaged files
  chrpath: Ensure the package respects the docdir variable

 meta/recipes-connectivity/connman/connman.inc      |    2 +
 meta/recipes-connectivity/connman/connman_0.75.bb  |    2 +-
 .../telepathy/telepathy-python_0.15.19.bb          |    9 ++++-
 meta/recipes-devtools/apt/apt-package.inc          |    2 +-
 meta/recipes-devtools/apt/apt_0.7.14.bb            |    4 +-
 .../btrfs-tools/btrfs-tools/weak-defaults.patch    |   31 ++++++++++++++
 .../btrfs-tools/btrfs-tools_git.bb                 |    3 +-
 .../chrpath/chrpath/standarddoc.patch              |   19 +++++++++
 meta/recipes-devtools/chrpath/chrpath_0.13.bb      |    5 +-
 meta/recipes-devtools/gcc/gcc-package-target.inc   |   25 +++++++++--
 meta/recipes-devtools/git/git.inc                  |    6 +++
 meta/recipes-devtools/opensp/opensp_1.5.bb         |    4 +-
 .../gtk-engines/gtk-engines_2.20.2.bb              |    5 ++-
 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb       |   15 +++++--
 meta/recipes-graphics/tslib/tslib_1.0.bb           |    3 +-
 meta/recipes-graphics/xcb/xcb-proto.inc            |    5 ++-
 meta/recipes-graphics/xcb/xcb-proto_1.6.bb         |    2 +-
 meta/recipes-graphics/xorg-app/x11perf_1.5.3.bb    |    4 +-
 meta/recipes-kernel/systemtap/systemtap_git.bb     |    4 +-
 meta/recipes-kernel/trace-cmd/kernelshark_git.bb   |   10 ++++-
 .../trace-cmd/trace-cmd/addldflags.patch           |   43 ++++++++++++++++++++
 meta/recipes-kernel/trace-cmd/trace-cmd_git.bb     |    5 +-
 meta/recipes-qt/qt4/qt4.inc                        |    4 +-
 meta/recipes-sato/eds/eds-dbus_2.20.0.bb           |    7 ++-
 meta/recipes-sato/eds/eds-dbus_git.bb              |    9 +++-
 25 files changed, 193 insertions(+), 35 deletions(-)
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/weak-defaults.patch
 create mode 100644 meta/recipes-devtools/chrpath/chrpath/standarddoc.patch
 create mode 100644 meta/recipes-kernel/trace-cmd/trace-cmd/addldflags.patch

-- 
1.7.4.1



