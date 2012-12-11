Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1TiS0q-0006ZL-Bu
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Dec 2012 16:44:52 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 11 Dec 2012 07:29:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,259,1355126400"; d="scan'208";a="260538172"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by fmsmga001.fm.intel.com with ESMTP; 11 Dec 2012 07:29:11 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Dec 2012 17:29:38 +0200
Message-Id: <cover.1355236839.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Cc: Constantin Musca <constantinx.musca@intel.com>
Subject: [PATCH 0/4] Bug 3440 Fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Dec 2012 15:44:52 -0000

This represents a set of fixes for multilib warnings.

[YOCTO #3440]

The following changes since commit c607095894cab60493ddfc4b967b0325e1c313b4:

  bitbake: Revert "BBHandler: Ensure parser state engine is correctly reset for new parsing" (2012-12-07 18:09:01 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib cmuscax/multilib_warn
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=cmuscax/multilib_warn

Constantin Musca (4):
  alsa-utils: Pass udev-rules-dir as parameter
  pcmciautils: set correct udevdir and add missing debug files
  multilib.bbclass: fix do_package_qa_multilib
  package.bbclass: prepend MLPREFIX to LOCALEBASEPN

 meta/classes/multilib.bbclass                     | 4 +++-
 meta/classes/package.bbclass                      | 2 +-
 meta/recipes-bsp/pcmciautils/pcmciautils.inc      | 1 +
 meta/recipes-bsp/pcmciautils/pcmciautils_018.bb   | 4 ++--
 meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb | 4 ++--
 5 files changed, 9 insertions(+), 6 deletions(-)

-- 
1.7.11.7



