Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RJw9g-0000F1-Kb
	for openembedded-core@lists.openembedded.org;
	Sat, 29 Oct 2011 01:48:08 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 28 Oct 2011 16:42:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="68744792"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.15.141])
	by orsmga002.jf.intel.com with ESMTP; 28 Oct 2011 16:42:05 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Oct 2011 16:41:59 -0700
Message-Id: <cover.1319844419.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7
Subject: [PATCH 0/4] Misc patches
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
X-List-Received-Date: Fri, 28 Oct 2011 23:48:08 -0000

A series of minor tweaks from my disk. The XFCE support in oe.terminal has
only been tested on a Fedora machine so I would appreciate testing from XFCE
users on other distros.

Regards,

Joshua

The following changes since commit ddc9a58b8553599d2328ac1c4449b41681ae45d1:

  Add readline as dependecy for gdb-cross-canadian (2011-10-27 08:37:53 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib josh/work
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/work

Joshua Lock (4):
  lib/oe/terminal: add support for XFCE's terminal emulator
  libxslt: Fix packaging of xsltConf.sh
  libcanberra: add new package for unpackaged files
  clutter-gtk: add LIC_FILES_CHKSUM to include file

 meta/lib/oe/terminal.py                            |   21 ++++++++++++++++++++
 meta/recipes-graphics/clutter/clutter-gtk.inc      |    1 +
 .../pulseaudio/libcanberra_0.28.bb                 |   11 ++++++++-
 meta/recipes-support/libxslt/libxslt_1.1.26.bb     |    4 +-
 4 files changed, 33 insertions(+), 4 deletions(-)

-- 
1.7.7



