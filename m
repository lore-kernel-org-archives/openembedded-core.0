Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1RWOAj-0005q6-Nh
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 09:08:42 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Dec 2011 00:00:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,282,1320652800"; d="scan'208";a="81422776"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by azsmga001.ch.intel.com with ESMTP; 02 Dec 2011 00:00:53 -0800
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Dec 2011 15:55:54 +0800
Message-Id: <cover.1322812458.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/4] Packages Upgrade, Dec2, 2011
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
X-List-Received-Date: Fri, 02 Dec 2011 08:08:42 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

All,
These are upgrade for libfm, pcmanfm and x11vnc. Pls. help review and pull.

The following changes since commit 9d6790c4409dee4d08fe6a47450125c406d0ba32:

  cooker.py: Allow the -e option to work with virtual classes and -b (2011-12-01 23:14:05 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib gzhai/master2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/master2

Zhai Edwin (4):
  libfm: Upgrade to 0.1.17
  pcmanfm: Upgrade to 0.9.10
  x11vnc: Upgrade to 0.9.13
  distro-tracking: Update info after last upgrade

 .../conf/distro/include/distro_tracking_fields.inc |   54 ++++++++++----------
 .../x11vnc/{x11vnc_0.9.12.bb => x11vnc_0.9.13.bb}  |    8 ++--
 .../{pcmanfm_0.9.9.bb => pcmanfm_0.9.10.bb}        |    4 +-
 .../configure_fix.patch                            |    0
 .../libfm/{libfm_0.1.16.bb => libfm_0.1.17.bb}     |    7 +--
 5 files changed, 36 insertions(+), 37 deletions(-)
 rename meta/recipes-graphics/x11vnc/{x11vnc_0.9.12.bb => x11vnc_0.9.13.bb} (66%)
 rename meta/recipes-sato/pcmanfm/{pcmanfm_0.9.9.bb => pcmanfm_0.9.10.bb} (88%)
 rename meta/recipes-support/libfm/{libfm-0.1.16 => libfm-0.1.17}/configure_fix.patch (100%)
 rename meta/recipes-support/libfm/{libfm_0.1.16.bb => libfm_0.1.17.bb} (67%)



