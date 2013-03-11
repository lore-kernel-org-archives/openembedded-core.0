Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1UF15k-0002Qu-Sv
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 12:40:48 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 11 Mar 2013 04:23:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,822,1355126400"; d="scan'208";a="303796138"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.54])
	by fmsmga002.fm.intel.com with ESMTP; 11 Mar 2013 04:23:53 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Mar 2013 13:24:19 +0200
Message-Id: <1363001062-18854-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/3] Build Appliance Upgrade and Fixes
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
X-List-Received-Date: Mon, 11 Mar 2013 11:41:23 -0000

Build Appliance was upgraded to a newer poky revision;
Fixes related to connectivity were implemented.
The virtual network connection is now a bridged one
instead of NAT, which allows the use of proxies.
A small issue was introduced with a network connectivity
previous fix; issue is now fixed.

This set of patched also fixes YB #3998 and YB #4403.

Cristian Iorga (3):
  build-appliance-image: upgrade to newer poky revision.
  build-appliance-image: ethernet connection type is now bridged
  build-appliance-image: fix lost net connectivity after restart

 meta/recipes-connectivity/connman/connman-conf/qemuall/wired-setup |    2 +-
 meta/recipes-core/images/build-appliance-image.bb                  |    4 +---
 .../images/build-appliance-image/Yocto_Build_Appliance.vmx         |    2 +-
 3 files changed, 3 insertions(+), 5 deletions(-)

-- 
1.7.10.4



