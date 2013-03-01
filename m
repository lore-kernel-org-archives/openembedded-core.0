Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1UBTNj-0003AR-Kw
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2013 18:04:29 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 01 Mar 2013 08:46:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,762,1355126400"; d="scan'208";a="292377347"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.54])
	by orsmga002.jf.intel.com with ESMTP; 01 Mar 2013 08:48:01 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Mar 2013 18:48:25 +0200
Message-Id: <1362156507-10571-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/2] Connman upgrade and qemu ethernet provisioning
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
X-List-Received-Date: Fri, 01 Mar 2013 17:04:30 -0000

Connman 1.12 features Ethernet provisioning

As such, qemu machines will use it to prevent connman to
loose connectivity if no network infrastructure is present.

Fixes Yocto bugs YB3227, YB3804, YB3843.

Cristian Iorga (2):
  connman: upgrade to 1.12
  connman: Wired inteface provisioned via qemu

 meta/recipes-connectivity/connman/connman-conf.bb  |   17 +++---
 .../connman/connman-conf/qemuall/main.conf         |    3 --
 .../connman/connman-conf/qemuall/wired-setup       |   16 ++++++
 .../connman/connman-conf/qemuall/wired.config      |    8 +++
 meta/recipes-connectivity/connman/connman.inc      |    2 +-
 ...If-there-is-no-d_type-support-use-fstatat.patch |   55 --------------------
 meta/recipes-connectivity/connman/connman/connman  |    3 ++
 .../connman/{connman_1.10.bb => connman_1.12.bb}   |    5 +-
 8 files changed, 40 insertions(+), 69 deletions(-)
 delete mode 100644 meta/recipes-connectivity/connman/connman-conf/qemuall/main.conf
 create mode 100644 meta/recipes-connectivity/connman/connman-conf/qemuall/wired-setup
 create mode 100644 meta/recipes-connectivity/connman/connman-conf/qemuall/wired.config
 delete mode 100644 meta/recipes-connectivity/connman/connman/0002-storage.c-If-there-is-no-d_type-support-use-fstatat.patch
 rename meta/recipes-connectivity/connman/{connman_1.10.bb => connman_1.12.bb} (72%)

-- 
1.7.10.4



