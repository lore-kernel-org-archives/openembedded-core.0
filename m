Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1R8MEv-0003Yw-Jh
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Sep 2011 03:13:41 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 26 Sep 2011 18:08:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,447,1312182000"; d="scan'208";a="67725198"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by fmsmga001.fm.intel.com with ESMTP; 26 Sep 2011 18:08:15 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Sep 2011 09:03:52 +0800
Message-Id: <cover.1317084972.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/3] [RFC] enable Pegasus touch screen
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
X-List-Received-Date: Tue, 27 Sep 2011 01:13:41 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Tom,
These changes, based on meta-intel/tzanussi/pegasus, are needed to enable
eGalax touch screen on Pegasus. Could you pls. help to review?

When will you push Pegasus changes into meta-intel/master? We can have a common
place for people to try pegasus...

Thanks,
Edwin

The following changes since commit 59dc67f6e64a836fc01fa91a1200e76264bb954d:

  meta-pegasus: new layer for Pegasus (N455) systems (2011-06-15 23:27:47 -0500)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib gzhai/pegasus
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/pegasus

Zhai Edwin (3):
  eGalax touchscreen offical xorg driver
  Config xorg.conf with eGalax touchscreen input driver
  Enabled kernel module for eGalax touch screen.

 meta-pegasus/conf/machine/pegasus.conf             |    2 +-
 .../xf86-input-egalax/88eGalaxCalibrate.sh         |    5 ++
 .../xorg-driver/xf86-input-egalax_3.06.5605.bb     |   49 ++++++++++++++++++++
 .../xserver-xf86-config/pegasus/xorg.conf          |   10 ++++
 .../xorg-xserver/xserver-xf86-config_0.1.bbappend  |    2 +
 .../recipes-kernel/linux/linux-yocto/pegasus.cfg   |    4 ++
 .../linux/linux-yocto_2.6.37.bbappend              |   12 +++++
 7 files changed, 83 insertions(+), 1 deletions(-)
 create mode 100755 meta-pegasus/recipes-graphics/xorg-driver/xf86-input-egalax/88eGalaxCalibrate.sh
 create mode 100644 meta-pegasus/recipes-graphics/xorg-driver/xf86-input-egalax_3.06.5605.bb
 create mode 100644 meta-pegasus/recipes-kernel/linux/linux-yocto/pegasus.cfg
 create mode 100644 meta-pegasus/recipes-kernel/linux/linux-yocto_2.6.37.bbappend



