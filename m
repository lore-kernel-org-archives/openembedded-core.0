Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QBhCI-00085E-5z
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Apr 2011 07:40:30 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 17 Apr 2011 22:38:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,231,1301900400"; d="scan'208";a="910948753"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.102])
	by fmsmga001.fm.intel.com with ESMTP; 17 Apr 2011 22:38:07 -0700
Message-Id: <cover.1303105369.git.ke.yu@intel.com>
Old-Date: Mon, 18 Apr 2011 13:42:49 +0800
Date: Mon, 18 Apr 2011 13:45:38 +0800
To: openembedded-core@lists.openembedded.org
From: Yu Ke <ke.yu@intel.com>
Subject: [PATCH 0/3] misc recipe upgrade
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
X-List-Received-Date: Mon, 18 Apr 2011 05:40:31 -0000

From: Yu Ke <ke.yu@intel.com>

 these are some remaining patches on my hand:
 - remove old mesa recipe to cleanup mesa
 - add python dependcy for mesa
 - reassign Kevin's recipe

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: kyu3/upgrade-04-18
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kyu3/upgrade-04-18

Thanks,
    Yu Ke <ke.yu@intel.com>
---


Yu Ke (3):
  mesa 7.10.2: add python-native dependency
  mesa: cleanup and remove the old version 7.5, 7.7 and 7.8.2
  distro tracking: reassign Kevin's recipe

 .../conf/distro/include/distro_tracking_fields.inc |   66 ++++++++++----------
 meta/recipes-graphics/mesa/mesa-dri/cross2.patch   |    2 +
 meta/recipes-graphics/mesa/mesa-dri/crossfix.patch |    2 +
 meta/recipes-graphics/mesa/mesa-dri_7.10.2.bb      |    2 +-
 meta/recipes-graphics/mesa/mesa-dri_7.5.bb         |   48 --------------
 meta/recipes-graphics/mesa/mesa-dri_7.7.bb         |   49 ---------------
 meta/recipes-graphics/mesa/mesa-dri_7.8.2.bb       |   56 -----------------
 7 files changed, 38 insertions(+), 187 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/mesa-dri_7.5.bb
 delete mode 100644 meta/recipes-graphics/mesa/mesa-dri_7.7.bb
 delete mode 100644 meta/recipes-graphics/mesa/mesa-dri_7.8.2.bb



