Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D5C9F718EC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Nov 2014 20:09:59 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 17 Nov 2014 12:07:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,404,1413270000"; d="scan'208";a="609301522"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by orsmga001.jf.intel.com with ESMTP; 17 Nov 2014 12:09:36 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Nov 2014 22:09:28 +0200
Message-Id: <cover.1416254938.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/3] Various Comms PUs
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
X-List-Received-Date: Mon, 17 Nov 2014 20:10:03 -0000

The following changes since commit edaeb8940813b620090a0797ad3b6a076897512d:

  bitbake: cooker.py: fix loginfo op being set to an invalid value (2014-11-12 17:04:50 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib PU2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/PU2

Cristian Iorga (3):
  netbase: upgrade to 5.3
  libpcap: upgrade to 1.6.2
  iproute2: upgrade to 3.17.0

 ...p-link-Remove-unnecessary-device-checking.patch | 35 ----------------------
 .../{iproute2_3.16.0.bb => iproute2_3.17.0.bb}     |  5 ++--
 .../libpcap/{libpcap_1.6.1.bb => libpcap_1.6.2.bb} |  4 +--
 .../netbase/{netbase_5.2.bb => netbase_5.3.bb}     |  6 ++--
 4 files changed, 7 insertions(+), 43 deletions(-)
 delete mode 100644 meta/recipes-connectivity/iproute2/iproute2/0001-ip-link-Remove-unnecessary-device-checking.patch
 rename meta/recipes-connectivity/iproute2/{iproute2_3.16.0.bb => iproute2_3.17.0.bb} (58%)
 rename meta/recipes-connectivity/libpcap/{libpcap_1.6.1.bb => libpcap_1.6.2.bb} (77%)
 rename meta/recipes-core/netbase/{netbase_5.2.bb => netbase_5.3.bb} (76%)

-- 
2.1.0


