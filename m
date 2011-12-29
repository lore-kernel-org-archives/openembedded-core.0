Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1RgBKb-0000pz-7e
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Dec 2011 09:27:21 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 29 Dec 2011 00:20:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="91185450"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by orsmga001.jf.intel.com with ESMTP; 29 Dec 2011 00:20:05 -0800
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Dec 2011 16:09:17 +0800
Message-Id: <cover.1325145929.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/2] Bug fixes
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
X-List-Received-Date: Thu, 29 Dec 2011 08:27:21 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

All,
Patch of gnome-keyring to fix gsettings-data-convert seg fault, modified according to Saul's comments.
Another patch of matchbox-wm to remove the dependence between window manager and X session.

The following changes since commit 6a1b5c28f22bb07a0b7102eb88441d05768ec52e:

  self-hosted-image: Add builder user and mini X (2011-12-29 10:42:07 +0800)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib gzhai/build-appliance2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/build-appliance2

Zhai Edwin (2):
  gnome-keyring: fix gsettings_data_convert seg fault
  matchbox-wm: Remove x-session-manager handling

 meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb   |   12 ++++++++++--
 .../matchbox-wm/matchbox-wm_1.2.bb                 |    9 ++-------
 .../matchbox-wm/matchbox-wm_git.bb                 |    9 ++-------
 3 files changed, 14 insertions(+), 16 deletions(-)



