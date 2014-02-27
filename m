Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 291966F0FE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 16:05:37 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 27 Feb 2014 08:05:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,555,1389772800"; d="scan'208";a="463509377"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga001.jf.intel.com with ESMTP; 27 Feb 2014 08:04:36 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Feb 2014 18:07:29 +0200
Message-Id: <cover.1393517205.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH 0/4] Various Comms and Multimedia PUs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Feb 2014 16:05:38 -0000

The following changes since commit 5ab9d7e28f987fba8bab03bb7851c263f746c208:

  security-flags: Avoid lttng-tools issue on arm (2014-02-26 13:48:21 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/PUs
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/PUs

Cristian Iorga (4):
  wpa-supplicant: upgrade to 2.1
  bluez5: upgrade to 5.15
  telepathy-glib: upgrade to 0.23.2
  telepathy-mission-control: upgrade to 5.16.1

 meta/recipes-connectivity/bluez5/bluez5_5.14.bb    |   5 -
 meta/recipes-connectivity/bluez5/bluez5_5.15.bb    |   4 +
 ...thy-glib_0.23.0.bb => telepathy-glib_0.23.2.bb} |   7 +-
 ...16.0.bb => telepathy-mission-control_5.16.1.bb} |  10 +-
 .../{wpa-supplicant-2.0.inc => wpa-supplicant.inc} |   8 +-
 .../wpa-supplicant/wpa-supplicant/defconfig-gnutls | 186 +++++++++++++++++----
 .../register-autoscan-correctly.patch              |  51 ------
 .../wpa-supplicant/wpa-supplicant_2.0.bb           |   6 -
 .../wpa-supplicant/wpa-supplicant_2.1.bb           |   2 +
 9 files changed, 174 insertions(+), 105 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.14.bb
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.15.bb
 rename meta/recipes-connectivity/telepathy/{telepathy-glib_0.23.0.bb => telepathy-glib_0.23.2.bb} (76%)
 rename meta/recipes-connectivity/telepathy/{telepathy-mission-control_5.16.0.bb => telepathy-mission-control_5.16.1.bb} (89%)
 rename meta/recipes-connectivity/wpa-supplicant/{wpa-supplicant-2.0.inc => wpa-supplicant.inc} (91%)
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/register-autoscan-correctly.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bb
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.1.bb

-- 
1.8.3.2


