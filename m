Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1U7Sli-0003NX-0e
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Feb 2013 16:36:38 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 18 Feb 2013 07:20:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,688,1355126400"; d="scan'208";a="203607661"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by AZSMGA002.ch.intel.com with ESMTP; 18 Feb 2013 07:20:18 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Feb 2013 17:20:15 +0200
Message-Id: <1361200817-22531-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/2] Package upgrades
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
X-List-Received-Date: Mon, 18 Feb 2013 15:36:38 -0000

These 2 upgrades compiled fine on all architectures and were tested in
qemu.

Thanks,
Laurentiu

Laurentiu Palcu (2):
  xrandr: upgrade to 1.4.0
  xvinfo: upgrade to 1.1.2

 meta/recipes-graphics/xorg-app/xrandr_1.3.5.bb |   16 ----------------
 meta/recipes-graphics/xorg-app/xrandr_1.4.0.bb |   16 ++++++++++++++++
 meta/recipes-graphics/xorg-app/xvinfo_1.1.1.bb |   15 ---------------
 meta/recipes-graphics/xorg-app/xvinfo_1.1.2.bb |   15 +++++++++++++++
 4 files changed, 31 insertions(+), 31 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-app/xrandr_1.3.5.bb
 create mode 100644 meta/recipes-graphics/xorg-app/xrandr_1.4.0.bb
 delete mode 100644 meta/recipes-graphics/xorg-app/xvinfo_1.1.1.bb
 create mode 100644 meta/recipes-graphics/xorg-app/xvinfo_1.1.2.bb

-- 
1.7.9.5



