Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Svkw5-0004Vs-OL
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jul 2012 10:02:42 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 30 Jul 2012 00:51:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="179211209"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.227])
	by orsmga002.jf.intel.com with ESMTP; 30 Jul 2012 00:51:05 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jul 2012 00:51:04 -0700
Message-Id: <cover.1343634130.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [RFC v2 00/34] Fix Update-Alernative Warning (Cover Letter Only)
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
X-List-Received-Date: Mon, 30 Jul 2012 08:02:42 -0000

I am heading out, so please review this, I will resend next 
week when I return (unless it's deemed good enough now).

I have reviewed the build history and diffed the pkgdata/runtime
files. Only major change is pigz delivers pigz binary that are then
linked to gzip as an alternative.

A non-gplv3 build is still needed to confirm I got those bits
right!

Back online again Aug 6-7ish from Bucharest!

Sau!


The following changes since commit 529346325b5df7bf316823f98f7332be4d019215:

  xcb-proto: Update for python-native changes (2012-07-29 17:16:20 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/update-alternatives
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/update-alternatives

Saul Wold (34):
  rxvt-unicode: cleanup update-alternatives deprecated code
  openssh: cleanup update-alternatives deprecated code
  mini-x-session: cleanup update-alternatives deprecated code
  console-tools: cleanup update-alternatives deprecated code
  kbd: cleanup update-alternatives deprecated code
  tinylogin: cleanup update-alternatives deprecated code
  patch: cleanup update-alternatives deprecated code
  ubootchart: cleanup update-alternatives deprecated code
  bc: cleanup update-alternatives deprecated code
  diffutils: refactor to add a common diffutils.inc
  diffutils: cleanup update-alternatives deprecated code
  findutils: refactor common code to findutils.inc
  findutils: cleanup update-alternatives deprecated code
  powertop: cleanup update-alternatives deprecated code
  mutter: cleanup update-alternatives deprecated code
  matchbox-wm-2: cleanup update-alternatives deprecated code
  matchbox-session: cleanup update-alternatives deprecated code
  metacity: cleanup update-alternatives deprecated code
  pigz: cleanup update-alternatives deprecated code
  msmtp: cleanup update-alternatives deprecated code
  mktemp: cleanup update-alternatives deprecated code
  which: cleanup update-alternatives deprecated code
  less: cleanup update-alternatives deprecated code
  shadow: cleanup update-alternatives deprecated code
  mingetty: cleanup update-alternatives deprecated code
  hdparm: cleanup update-alternatives deprecated code
  gzip: cleanup update-alternatives deprecated code
  procps: cleanup update-alternatives deprecated code
  time: cleanup update-alternatives deprecated code
  wget: cleanup update-alternatives deprecated code
  sed: cleanup update-alternatives deprecated code
  gawk: cleanup update-alternatives deprecated code
  net-tools: cleanup update-alternatives deprecated code
  ncurses: fix file names for update -alternatives

 meta/recipes-connectivity/openssh/openssh_6.0p1.bb |    6 +---
 .../console-tools/console-tools_0.3.2.bb           |    4 +--
 meta/recipes-core/kbd/kbd_1.15.2.bb                |    7 ++---
 meta/recipes-core/ncurses/ncurses.inc              |    4 +--
 meta/recipes-core/tinylogin/tinylogin_1.4.bb       |   11 ++-----
 meta/recipes-devtools/patch/patch.inc              |    7 +----
 meta/recipes-devtools/patch/patch_2.5.9.bb         |    2 +-
 meta/recipes-devtools/patch/patch_2.6.1.bb         |    2 +-
 meta/recipes-devtools/ubootchart/ubootchart_svn.bb |    8 ++---
 meta/recipes-extended/bc/bc_1.06.bb                |    4 +--
 meta/recipes-extended/diffutils/diffutils.inc      |   22 ++++++++++++++
 meta/recipes-extended/diffutils/diffutils_2.8.1.bb |   24 +++------------
 meta/recipes-extended/diffutils/diffutils_3.2.bb   |   22 ++------------
 meta/recipes-extended/findutils/findutils.inc      |    4 ++-
 .../recipes-extended/findutils/findutils_4.2.31.bb |   31 ++++----------------
 meta/recipes-extended/findutils/findutils_4.4.2.bb |    4 +--
 meta/recipes-extended/gawk/gawk_3.1.5.bb           |    7 ++---
 meta/recipes-extended/gawk/gawk_4.0.1.bb           |    7 ++---
 meta/recipes-extended/gzip/gzip_1.3.12.bb          |    7 +++--
 meta/recipes-extended/hdparm/hdparm_9.39.bb        |    5 ++--
 meta/recipes-extended/less/less_444.bb             |    6 ++--
 meta/recipes-extended/mingetty/mingetty_1.08.bb    |   11 ++++---
 meta/recipes-extended/mktemp/mktemp_1.7.bb         |   11 ++++---
 meta/recipes-extended/msmtp/msmtp_1.4.24.bb        |    7 ++---
 .../net-tools/net-tools_1.60-23.bb                 |   19 +++++++-----
 meta/recipes-extended/pigz/pigz.inc                |   10 +++++--
 meta/recipes-extended/pigz/pigz_2.2.4.bb           |    2 +-
 meta/recipes-extended/procps/procps.inc            |    9 ++++--
 meta/recipes-extended/procps/procps_3.2.8.bb       |    9 +-----
 meta/recipes-extended/sed/sed_4.1.2.bb             |    9 +++---
 meta/recipes-extended/sed/sed_4.2.1.bb             |    9 +++---
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |   18 ++++--------
 meta/recipes-extended/time/time.inc                |    8 +----
 meta/recipes-extended/time/time_1.7.bb             |    2 +-
 meta/recipes-extended/wget/wget.inc                |   10 ++-----
 meta/recipes-extended/which/which_2.18.bb          |    8 ++---
 meta/recipes-extended/which/which_2.20.bb          |   10 ++-----
 meta/recipes-gnome/gnome/metacity_2.30.3.bb        |    7 ++---
 .../matchbox-session/matchbox-session_0.1.bb       |    7 ++---
 .../matchbox-wm-2/matchbox-wm-2_git.bb             |    7 ++---
 .../mini-x-session/mini-x-session_0.1.bb           |    7 ++---
 meta/recipes-graphics/mutter/mutter.inc            |    5 ++--
 meta/recipes-graphics/mutter/mutter_2.29.1.bb      |    2 +-
 meta/recipes-kernel/powertop/powertop_1.13.bb      |   13 ++++----
 .../recipes-sato/rxvt-unicode/rxvt-unicode_9.15.bb |    6 ++--
 45 files changed, 161 insertions(+), 239 deletions(-)
 create mode 100644 meta/recipes-extended/diffutils/diffutils.inc

-- 
1.7.9.5



