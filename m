Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1Sd0fM-0001vf-Cx
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jun 2012 16:59:56 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 08 Jun 2012 07:48:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="153552604"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by azsmga001.ch.intel.com with ESMTP; 08 Jun 2012 07:48:20 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jun 2012 17:48:14 +0300
Message-Id: <1339166898-11667-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/4] Package upgrades: freetype, tzdata, ethtool, menu-cache
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
X-List-Received-Date: Fri, 08 Jun 2012 14:59:56 -0000

Tests done:
	- packages compile fine on all architectures;
	- basic functionality:
		* ethtool - ran ethtool directly;
		* menu-cache - ran pcmanfm;
		* tzdata - it's just a database;
		* freetype - ran matchbox-keyboard;

Laurentiu Palcu (4):
  freetype: upgrade to 2.4.9
  tzdata: upgrade to 2012c
  ethtool: upgrade to 3.2
  menu-cache: upgrade to 0.3.3

 meta/recipes-extended/ethtool/ethtool_2.6.36.bb    |   15 ---------------
 meta/recipes-extended/ethtool/ethtool_3.2.bb       |   15 +++++++++++++++
 .../tzdata/{tzdata_2012b.bb => tzdata_2012c.bb}    |    6 +++---
 .../no-hardcode.patch                              |    0
 .../{freetype_2.4.8.bb => freetype_2.4.9.bb}       |    4 ++--
 .../{menu-cache_0.3.2.bb => menu-cache_0.3.3.bb}   |    8 ++++----
 6 files changed, 24 insertions(+), 24 deletions(-)
 delete mode 100644 meta/recipes-extended/ethtool/ethtool_2.6.36.bb
 create mode 100644 meta/recipes-extended/ethtool/ethtool_3.2.bb
 rename meta/recipes-extended/tzdata/{tzdata_2012b.bb => tzdata_2012c.bb} (97%)
 rename meta/recipes-graphics/freetype/{freetype-2.4.8 => freetype-2.4.9}/no-hardcode.patch (100%)
 rename meta/recipes-graphics/freetype/{freetype_2.4.8.bb => freetype_2.4.9.bb} (91%)
 rename meta/recipes-graphics/menu-cache/{menu-cache_0.3.2.bb => menu-cache_0.3.3.bb} (76%)

-- 
1.7.9.5



