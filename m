Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RclWt-0001JE-AF
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 23:17:55 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Dec 2011 14:10:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="88245193"
Received: from rmoore1-desk5.amr.corp.intel.com (HELO shamshir.jf.intel.com)
	([10.7.199.156])
	by orsmga001.jf.intel.com with ESMTP; 19 Dec 2011 14:10:51 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Dec 2011 14:10:38 -0800
Message-Id: <cover.1324332440.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.4
Subject: [PATCH 00/10] Various license clarifications v2
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
X-List-Received-Date: Mon, 19 Dec 2011 22:17:55 -0000

This series is a v2 of an earlier series. It includes a few metadata
massages to ensure LICENSE fields specify the correct license version.

Since v1 I've used the same notation as common convention and further
clarified some of the GPL licenses which have an or later clause.

Regards,
Joshua

The following changes since commit ae4118a1f78f113c3d687c3aa6a86007cf977cae:

  libsdl 1.2.14: fix packaging (2011-12-19 12:17:36 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib josh/updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/updates

Joshua Lock (10):
  gypsy: fix LICENSE field
  udev: tidy the LICENSE fields
  apt: clarify LICENSE as GPLv2.0
  dpkg: clarify LICENSE as GPLv2.0
  clutter: clarify LICENSE as LGPLv2.1
  cogl: clarify LICENSE as LGPLv2.1 and fix metadata
  matchbox-wm: clarify LICENSE as GPLv2.0
  pango: clarify LICENSE is LGPLv2.0+
  matchbox-desktop: clarify LICENSE is GPLv2.0+
  matchbox-session-sato: clarify LICENSE in GPLv2.0

 meta/recipes-connectivity/gypsy/gypsy.inc          |    2 +-
 meta/recipes-core/udev/udev-new.inc                |    4 ++--
 meta/recipes-core/udev/udev.inc                    |    4 ++--
 meta/recipes-devtools/apt/apt.inc                  |    2 +-
 meta/recipes-devtools/dpkg/dpkg.inc                |    2 +-
 meta/recipes-graphics/clutter/clutter.inc          |    2 +-
 meta/recipes-graphics/clutter/cogl.inc             |    6 +++---
 .../matchbox-wm/matchbox-wm_1.2.bb                 |    2 +-
 meta/recipes-graphics/pango/pango.inc              |    2 +-
 .../matchbox-desktop/matchbox-desktop_0.9.1.bb     |    2 +-
 .../matchbox-desktop/matchbox-desktop_2.0.bb       |    2 +-
 .../matchbox-sato/matchbox-session-sato_0.1.bb     |    2 +-
 12 files changed, 16 insertions(+), 16 deletions(-)

-- 
1.7.7.4



