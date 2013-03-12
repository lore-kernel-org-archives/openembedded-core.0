Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1UFSrc-0002Wg-Ts
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 18:19:50 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 12 Mar 2013 10:03:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,832,1355126400"; d="scan'208";a="213474557"
Received: from sentry (HELO sentry.rb.intel.com) ([10.237.105.54])
	by AZSMGA002.ch.intel.com with ESMTP; 12 Mar 2013 10:02:43 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Mar 2013 19:03:11 +0200
Message-Id: <1363107795-2140-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH V2 0/4] BlueZ 5.3 new package
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
X-List-Received-Date: Tue, 12 Mar 2013 17:20:04 -0000

- BlueZ 5 v5.3 experimental new package;
- bluez5 package does not replace bluez4 package,
  as a lot of components that interact with bluez
  are not prepared to work correctly with bluez5;
- bluez5 is not an upgrade path from bluez4.
- libical is added back, as it is a requirement for
  bluez OBEX feature.
- bluez5 conflicts with bluez4. 

Cristian Iorga (4):
  libical: add recipe back in oe-core
  bluez5: new package for v5.3
  bluez5: conflicts with bluez4
  bluez4: conflicts with bluez5

 meta/recipes-connectivity/bluez/bluez4_4.101.bb    |    4 +-
 .../bluez5/bluez5-5.3/bluetooth.conf               |   16 ++++++
 .../bluez5/bluez5-5.3/fix-udev-paths.patch         |   35 +++++++++++++
 meta/recipes-connectivity/bluez5/bluez5.inc        |   45 +++++++++++++++++
 meta/recipes-connectivity/bluez5/bluez5_5.3.bb     |   37 ++++++++++++++
 .../libical/files/pthread-fix.patch                |   52 ++++++++++++++++++++
 meta/recipes-support/libical/libical_0.48.bb       |   17 +++++++
 7 files changed, 205 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5-5.3/bluetooth.conf
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5-5.3/fix-udev-paths.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5.inc
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.3.bb
 create mode 100644 meta/recipes-support/libical/files/pthread-fix.patch
 create mode 100644 meta/recipes-support/libical/libical_0.48.bb

-- 
1.7.10.4



