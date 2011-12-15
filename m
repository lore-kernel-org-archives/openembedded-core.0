Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RbKrz-0005Ea-Ii
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 00:37:50 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 15 Dec 2011 15:30:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="87086681"
Received: from unknown (HELO shamshir.jf.intel.com) ([10.7.199.105])
	by orsmga001.jf.intel.com with ESMTP; 15 Dec 2011 15:30:45 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Dec 2011 15:30:33 -0800
Message-Id: <cover.1323991540.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.4
Subject: [PATCH 00/10] Various license clarifications
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
X-List-Received-Date: Thu, 15 Dec 2011 23:37:50 -0000

A few metadata massages to ensure LICENSE fields specify the correct license
version.

The following changes since commit 0eb139619301d0efee330932eba3617dcb39284e:

  Patch Upstream Status Updates (2011-12-15 14:35:27 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib josh/updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/updates

Joshua Lock (10):
  gypsy: fix LICENSE field
  udev: fix LICENSE fields to be SPDX compliant
  apt: clarify LICENSE as GPL-2.0
  dpkg: clarify LICENSE as GPL-2.0
  clutter: clarify LICENSE as LGPL-2.1
  cogl: clarify LICENSE as LGPL-2.1 and fix metadata
  matchbox-wm: clarify LICENSE as GPL-2.0
  pango: clarify LICENSE is LGPL-2.0+
  matchbox-desktop: clarify LICENSE is GPL-2.0+
  matchbox-session-sato: clarify LICENSE in GPL-2.0

 meta/recipes-connectivity/gypsy/gypsy.inc          |    2 +-
 meta/recipes-core/udev/udev-new.inc                |    2 +-
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
 12 files changed, 15 insertions(+), 15 deletions(-)

-- 
1.7.7.4



