Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5BEB66067D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 12:38:42 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 22 Jul 2016 05:38:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,404,1464678000"; d="scan'208";a="1000491738"
Received: from lwong9-mobl4.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.176.13])
	by orsmga001.jf.intel.com with ESMTP; 22 Jul 2016 05:38:41 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Jul 2016 00:38:06 +1200
Message-Id: <cover.1469190931.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/8] Extensible SDK improvements
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
X-List-Received-Date: Fri, 22 Jul 2016 12:38:45 -0000

Some fixes and enhancements centered around how the toolchain is
incorporated in the eSDK, as well as a couple of tweaks for buildhistory
that I found we needed during development.

Note: this is on top of my earlier as-yet unmerged eSDK progress patch.


The following changes since commit 7e4a33933d39f6406922231d64414637a5f52d66:

  classes/populate_sdk_ext: show progress when preparing build system (2016-07-23 00:34:44 +1200)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/extsdkfixes12-oe
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/extsdkfixes12-oe

Paul Eggleton (8):
  classes/populate_sdk_ext: set default for SDK_INCLUDE_PKGDATA
  meta-extsdk-toolchain: add meta-recipe to install toolchain into eSDK
  classes/populate_sdk_ext: allow including toolchain in eSDK on install
  scripts: add oe-check-sstate script
  classes/populate_sdk_ext: filter sstate within the extensible SDK
  classes/populate_sdk_ext: add gdb to full extensible SDK
  classes/buildhistory: add additional variables for eSDK
  classes/buildhistory: ensure eSDK sstate lists sorted secondarily by name

 meta/classes/buildhistory.bbclass               |   6 +-
 meta/classes/populate_sdk_ext.bbclass           |  92 +++++++++++++++++-
 meta/classes/sstate.bbclass                     |   3 +
 meta/lib/oe/copy_buildsystem.py                 |  27 +++++-
 meta/recipes-core/meta/meta-extsdk-toolchain.bb |  28 ++++++
 scripts/gen-lockedsig-cache                     |  16 +++-
 scripts/oe-check-sstate                         | 121 ++++++++++++++++++++++++
 7 files changed, 280 insertions(+), 13 deletions(-)
 create mode 100644 meta/recipes-core/meta/meta-extsdk-toolchain.bb
 create mode 100755 scripts/oe-check-sstate

-- 
2.5.5


