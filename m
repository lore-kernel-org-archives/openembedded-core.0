Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1UF3TJ-0005Hz-Hc
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 15:13:03 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 11 Mar 2013 06:56:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,822,1355126400"; d="scan'208";a="212736106"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.54])
	by AZSMGA002.ch.intel.com with ESMTP; 11 Mar 2013 06:56:19 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Mar 2013 15:56:47 +0200
Message-Id: <1363010209-18220-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/2] BlueZ 5.3 new package
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
X-List-Received-Date: Mon, 11 Mar 2013 14:13:09 -0000

- BlueZ 5 v5.3 experimental new package;
- bluez5 package does not replace bluez4 package,
  as a lot of components that interact with bluez
  are not prepared to work correctly with bluez5;
- libical is added back, as it is a requirement for
  bluez OBEX feature.

Cristian Iorga (2):
  libical: add recipe back in oe-core
  bluez5: new package for v5.3

 .../bluez5/bluez5-5.3/bluetooth.conf               |   16 ++++++
 .../bluez5/bluez5-5.3/fix-udev-paths.patch         |   35 +++++++++++++
 meta/recipes-connectivity/bluez5/bluez5.inc        |   45 +++++++++++++++++
 meta/recipes-connectivity/bluez5/bluez5_5.3.bb     |   35 +++++++++++++
 .../libical/files/pthread-fix.patch                |   52 ++++++++++++++++++++
 meta/recipes-support/libical/libical_0.48.bb       |   17 +++++++
 6 files changed, 200 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5-5.3/bluetooth.conf
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5-5.3/fix-udev-paths.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5.inc
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.3.bb
 create mode 100644 meta/recipes-support/libical/files/pthread-fix.patch
 create mode 100644 meta/recipes-support/libical/libical_0.48.bb

-- 
1.7.10.4



