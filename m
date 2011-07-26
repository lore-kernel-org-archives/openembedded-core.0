Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QlgtC-0001NR-LR
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 14:37:34 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 26 Jul 2011 05:33:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,269,1309762800"; d="scan'208";a="34603576"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by fmsmga001.fm.intel.com with ESMTP; 26 Jul 2011 05:33:19 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2011 20:30:52 +0800
Message-Id: <cover.1311682779.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/3] utils for touchscreen calibration
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
X-List-Received-Date: Tue, 26 Jul 2011 12:37:35 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

These are some debug and calibration utils for touchscreen. Xinput and evtest
can also be used for other input device. I'm not sure about where they should
go under meta. Any comments?

Thanks,
Edwin

The following changes since commit e0fc42b51a8209dac1163ae8126f8c687b6bfddf:

  distro_tracking_fields.inc: update RECIPE_MANUAL_CHECK_DATE for screen and tcf-agent (2011-06-29 15:04:59 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib gzhai/master
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/master

Zhai Edwin (3):
  xinput: Add 1.5.3 as new recipes
  xinput-calibrator: Add 0.7.5 as new recipe
  evtest: Add 1.25 as new recipe

 meta/recipes-graphics/evtest/evtest_1.25.bb        |   16 +++++++++++++
 .../xinput-calibrator/xinput-calibrator_0.7.5.bb   |   24 ++++++++++++++++++++
 meta/recipes-graphics/xorg-app/xinput_1.5.3.bb     |    9 +++++++
 3 files changed, 49 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-graphics/evtest/evtest_1.25.bb
 create mode 100644 meta/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb
 create mode 100644 meta/recipes-graphics/xorg-app/xinput_1.5.3.bb



