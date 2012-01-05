Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Ribaa-0005n3-ED
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 01:53:52 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 04 Jan 2012 16:46:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="103611999"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.127])
	by fmsmga001.fm.intel.com with ESMTP; 04 Jan 2012 16:46:28 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jan 2012 16:46:24 -0800
Message-Id: <cover.1325724295.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [PATCH 0/3] Build Fixes
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
X-List-Received-Date: Thu, 05 Jan 2012 00:53:52 -0000

Richard,

This set fixes various know build failures on the Autobuilder.

Sau!

The following changes since commit f309769d10cb3d8b72b8c7c4f7f418dcb8422c61:

  valgrind: Fix for automake update (2012-01-04 16:03:59 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fix

Saul Wold (3):
  image_types: Fix rootfs size calcuation
  glib-2.0: ensure dtrace is diabled for all distro options and fix
    packaging
  libxp: fix cast error

 meta/classes/image_types.bbclass                   |    2 +-
 meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb      |    2 +-
 meta/recipes-core/glib-2.0/glib.inc                |    9 +++-
 .../xorg-lib/libxp/fix-cast-error.patch            |   42 ++++++++++++++++++++
 meta/recipes-graphics/xorg-lib/libxp_1.0.1.bb      |    4 +-
 5 files changed, 53 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxp/fix-cast-error.patch

-- 
1.7.6.4



