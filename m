Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SaQPY-0006HU-91
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jun 2012 13:52:56 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 01 Jun 2012 04:41:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="106677860"
Received: from unknown (HELO lpalcu-laptop.ger.corp.intel.com)
	([10.252.120.35])
	by AZSMGA002.ch.intel.com with ESMTP; 01 Jun 2012 04:41:27 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jun 2012 14:41:23 +0300
Message-Id: <1338550885-4165-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/2] Package upgrades: directfb, directfb-examples
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
X-List-Received-Date: Fri, 01 Jun 2012 11:52:56 -0000

Tests done(qemuarm):
	- compiles fine on all architectures;
	- directfb examples run OK. I did not test all of them, just a few, to see directfb works.

Laurentiu Palcu (2):
  directfb: upgrade to 1.5.3
  directfb-examples: upgrade to 1.5.3

 ...xamples_1.2.0.bb => directfb-examples_1.5.3.bb} |    4 +--
 meta/recipes-graphics/directfb/directfb.inc        |    2 +-
 ...se-ARM-assembler-for-atomic-operations-on.patch |   27 ++++++++++++++++++++
 ...ibdirect-remove-include-of-linux-config.h.patch |   27 ++++++++++++++++++++
 meta/recipes-graphics/directfb/directfb_1.4.15.bb  |   20 ---------------
 meta/recipes-graphics/directfb/directfb_1.5.3.bb   |   23 +++++++++++++++++
 6 files changed, 80 insertions(+), 23 deletions(-)
 rename meta/recipes-graphics/directfb/{directfb-examples_1.2.0.bb => directfb-examples_1.5.3.bb} (77%)
 create mode 100644 meta/recipes-graphics/directfb/directfb/libdirect-Use-ARM-assembler-for-atomic-operations-on.patch
 create mode 100644 meta/recipes-graphics/directfb/directfb/libdirect-remove-include-of-linux-config.h.patch
 delete mode 100644 meta/recipes-graphics/directfb/directfb_1.4.15.bb
 create mode 100644 meta/recipes-graphics/directfb/directfb_1.5.3.bb

-- 
1.7.9.5



