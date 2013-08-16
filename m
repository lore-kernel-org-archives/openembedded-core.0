Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 34B4A6A9F9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2013 13:33:29 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 16 Aug 2013 06:33:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,895,1367996400"; d="scan'208";a="363632779"
Received: from timevans-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.122.223])
	by orsmga001.jf.intel.com with ESMTP; 16 Aug 2013 06:33:14 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Aug 2013 14:33:11 +0100
Message-Id: <cover.1376659841.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 0/1] tslib 1.1 update
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
X-List-Received-Date: Fri, 16 Aug 2013 13:33:29 -0000

Tested both with ts_calibrate/ts_test and the Qt Embedded demo
application on both qemumips and qemux86. Once merged this should also
allow removal of the tslib recipe in meta-oe.


The following change since commit b8952942aed77473d3b44a17112cbf6a9e83eff3:

  qemu: Fix bit extraction for MTFSFI and MTFSF (2013-08-16 11:39:43 +0100)

is available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/tslib
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/tslib

Paul Eggleton (1):
  tslib: update to 1.1

 .../tslib/0001-Link-plugins-against-libts.patch    |  57 --
 .../tslib/tslib/32bitBE-support.patch              |  55 --
 .../recipes-graphics/tslib/tslib/fix_version.patch |  34 -
 meta/recipes-graphics/tslib/tslib/multievent.patch | 845 ---------------------
 .../tslib/tslib/obsolete_automake_macros.patch     |  15 -
 .../tslib/set-open-mode-for-ts_calibrate_c.patch   |  30 -
 .../tslib/{tslib_1.0.bb => tslib_1.1.bb}           |  14 +-
 7 files changed, 3 insertions(+), 1047 deletions(-)
 delete mode 100644 meta/recipes-graphics/tslib/tslib/0001-Link-plugins-against-libts.patch
 delete mode 100644 meta/recipes-graphics/tslib/tslib/32bitBE-support.patch
 delete mode 100644 meta/recipes-graphics/tslib/tslib/fix_version.patch
 delete mode 100644 meta/recipes-graphics/tslib/tslib/multievent.patch
 delete mode 100644 meta/recipes-graphics/tslib/tslib/obsolete_automake_macros.patch
 delete mode 100644 meta/recipes-graphics/tslib/tslib/set-open-mode-for-ts_calibrate_c.patch
 rename meta/recipes-graphics/tslib/{tslib_1.0.bb => tslib_1.1.bb} (77%)

-- 
1.8.1.2


