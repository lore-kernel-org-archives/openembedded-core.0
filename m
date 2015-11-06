Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 3D0A075D22
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 13:01:34 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 06 Nov 2015 05:01:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,252,1444719600"; d="scan'208";a="844153849"
Received: from bdiacone-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.8.207])
	by orsmga002.jf.intel.com with ESMTP; 06 Nov 2015 05:01:28 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Nov 2015 13:01:14 +0000
Message-Id: <cover.1446814828.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/6] Misc fixes for OE-Core
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
X-List-Received-Date: Fri, 06 Nov 2015 13:01:35 -0000

Some typo corrections and minor bug fixes.


The following changes since commit e44ed8c18e395b9c055aefee113b90708e8a8a2f:

  build-appliance-image: Update to jethro head revision (2015-11-03 14:02:57 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/misc-fixes-1
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/misc-fixes-1

Paul Eggleton (6):
  meta/conf/layer.conf: fix typo
  meta: Fix typos in Upstream-Status labels
  gitignore: fix overzealous exclusion
  conf/distro/include: drop old recipes from include files
  classes/buildhistory: split package history values only once
  classes/distrodata: split SRC_URI properly before determining type

 .gitignore                                         |  2 +-
 meta/classes/buildhistory.bbclass                  |  2 +-
 meta/classes/distrodata.bbclass                    |  4 +-
 meta/conf/distro/include/as-needed.inc             |  3 --
 meta/conf/distro/include/distro_alias.inc          | 58 ----------------------
 meta/conf/layer.conf                               |  2 +-
 .../openssl/crypto_use_bigint_in_x86-64_perl.patch |  2 +-
 .../autogen/autogen/redirect-output-dir.patch      |  2 +-
 ...oring-is-success-if-not-sound-card-device.patch |  2 +-
 9 files changed, 8 insertions(+), 69 deletions(-)

-- 
2.1.0


