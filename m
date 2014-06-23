Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 94FEE6B3A4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jun 2014 13:15:05 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 Jun 2014 06:15:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,530,1400050800"; d="scan'208";a="532678487"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga001.jf.intel.com with ESMTP; 23 Jun 2014 06:15:05 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jun 2014 16:18:41 +0300
Message-Id: <cover.1403529482.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/3] Comms and multimedia PUs
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
X-List-Received-Date: Mon, 23 Jun 2014 13:15:11 -0000

The following changes since commit 7c1a975a1c2fd884aa9f6f4736656d854a6c5edb:

  bitbake: toaster: Fix spacing and layout in no image files notification (2014-06-20 14:03:58 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/PUs
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/PUs

Cristian Iorga (3):
  bluez5: upgrade to 5.20
  harfbuzz: upgrade to 0.9.29
  iproute2: upgrade to 3.15.0

 meta/recipes-connectivity/bluez5/bluez5_5.19.bb                       | 3 ---
 meta/recipes-connectivity/bluez5/bluez5_5.20.bb                       | 3 +++
 .../iproute2/{iproute2_3.14.0.bb => iproute2_3.15.0.bb}               | 4 ++--
 .../harfbuzz/{harfbuzz_0.9.28.bb => harfbuzz_0.9.29.bb}               | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.19.bb
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.20.bb
 rename meta/recipes-connectivity/iproute2/{iproute2_3.14.0.bb => iproute2_3.15.0.bb} (68%)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_0.9.28.bb => harfbuzz_0.9.29.bb} (88%)

-- 
1.9.1


