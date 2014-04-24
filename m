Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E724065D71
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Apr 2014 09:16:02 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 24 Apr 2014 02:16:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,917,1389772800"; d="scan'208";a="518695444"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 24 Apr 2014 02:15:44 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Apr 2014 12:19:02 +0300
Message-Id: <cover.1398331032.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/4] Various multimedia and comms PUs
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
X-List-Received-Date: Thu, 24 Apr 2014 09:16:03 -0000

The following changes since commit 68ef727cdcef439e9bfc57996f3cebfc0e07789e:

  ref-manual: Added new section to the 1.6 migration section plus some 1.5 edits. (2014-04-23 21:11:08 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/PU2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/PU2

Cristian Iorga (4):
  connman: upgrade to 1.23
  bluez5: upgrade to 5.18
  harfbuzz: upgrade to 0.9.27
  iproute2: upgrade to 3.14

 meta/recipes-connectivity/bluez5/bluez5_5.15.bb                    | 4 ----
 meta/recipes-connectivity/bluez5/bluez5_5.18.bb                    | 3 +++
 meta/recipes-connectivity/connman/connman.inc                      | 2 +-
 .../connman/{connman_1.22.bb => connman_1.23.bb}                   | 4 ++--
 meta/recipes-connectivity/iproute2/iproute2.inc                    | 2 --
 .../iproute2/{iproute2_3.12.0.bb => iproute2_3.14.0.bb}            | 7 +++----
 .../harfbuzz/{harfbuzz_0.9.26.bb => harfbuzz_0.9.27.bb}            | 5 ++---
 7 files changed, 11 insertions(+), 16 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.15.bb
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.18.bb
 rename meta/recipes-connectivity/connman/{connman_1.22.bb => connman_1.23.bb} (68%)
 rename meta/recipes-connectivity/iproute2/{iproute2_3.12.0.bb => iproute2_3.14.0.bb} (51%)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_0.9.26.bb => harfbuzz_0.9.27.bb} (88%)

-- 
1.9.1


