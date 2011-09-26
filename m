Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1R89wA-00047z-N9
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Sep 2011 14:05:30 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 26 Sep 2011 05:00:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="56497900"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by orsmga002.jf.intel.com with ESMTP; 26 Sep 2011 05:00:04 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Sep 2011 19:55:46 +0800
Message-Id: <cover.1317037371.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/1] Update SRCREV for matchbox
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
X-List-Received-Date: Mon, 26 Sep 2011 12:05:30 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

All,
Update matchbox SRCREV after pushing patches in upstream.
Pls. help to pull.

Thanks,
Edwin

The following changes since commit 49ed1cab3bee2318fdd5fc2538b1b3d43542ed2d:

  documentation/poky-ref-manual/ref-classes.xml: documented useradd.bbclass (2011-09-25 18:00:00 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib gzhai/master2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/master2

Zhai Edwin (1):
  matchbox: Upgrade SRCREV to reflect recent accpeted patches by
    upstream

 .../libmatchbox/files/16bppfixes.patch             |    2 +-
 .../libmatchbox/files/matchbox-start-fix.patch     |    2 +-
 .../libmatchbox/libmatchbox_git.bb                 |    6 +--
 .../matchbox-wm-2/matchbox-wm-2/fix_makefile.patch |    4 +-
 .../files/dso_linking_change_build_fix.patch       |    2 +-
 .../matchbox-desktop/files/window-resize-fix.patch |   50 --------------------
 .../matchbox-desktop/matchbox-desktop_git.bb       |    8 +--
 .../matchbox-panel-2/matchbox-panel-2_git.bb       |    7 +--
 .../recipes-sato/matchbox-panel-2/startup_fix.diff |   19 -------
 .../files/dso_linking_change_build_fix.patch       |   37 --------------
 .../matchbox-stroke/matchbox-stroke_git.bb         |    3 +-
 .../matchbox-theme-sato-2/png_rename.patch         |   16 ------
 .../matchbox-theme-sato-2_git.bb                   |    5 +-
 13 files changed, 17 insertions(+), 144 deletions(-)
 delete mode 100644 meta/recipes-sato/matchbox-desktop/files/window-resize-fix.patch
 delete mode 100644 meta/recipes-sato/matchbox-panel-2/startup_fix.diff
 delete mode 100644 meta/recipes-sato/matchbox-stroke/files/dso_linking_change_build_fix.patch
 delete mode 100644 meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato-2/png_rename.patch



