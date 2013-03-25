Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1UK7NK-000664-Nq
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Mar 2013 14:23:47 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 25 Mar 2013 06:06:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,905,1355126400"; d="scan'208";a="308014018"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 25 Mar 2013 06:06:45 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Mar 2013 15:07:19 +0200
Message-Id: <1364216841-32600-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH V3 0/2] BlueZ 5.3 new package
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
X-List-Received-Date: Mon, 25 Mar 2013 13:23:47 -0000

- BlueZ 5 v5.3 experimental new package;
- bluez5 package does not replace bluez4 package,
  as a lot of components that interact with bluez
  are not prepared to work correctly with bluez5;
- bluez5 is not an upgrade path from bluez4.
- bluez5 conflicts with/replaces bluez4.

Cristian Iorga (2):
  bluez5: new package for v5.3
  bluez4: conflicts with/replaces bluez5

 meta/recipes-connectivity/bluez/bluez4_4.101.bb    |    5 ++-
 .../bluez5/bluez5-5.3/bluetooth.conf               |   16 +++++++
 .../bluez5/bluez5-5.3/fix-udev-paths.patch         |   35 +++++++++++++++
 meta/recipes-connectivity/bluez5/bluez5.inc        |   45 ++++++++++++++++++++
 meta/recipes-connectivity/bluez5/bluez5_5.3.bb     |   38 +++++++++++++++++
 5 files changed, 138 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5-5.3/bluetooth.conf
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5-5.3/fix-udev-paths.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5.inc
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.3.bb

-- 
1.7.10.4



