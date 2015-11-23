Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id AA37C60110
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 02:38:02 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 22 Nov 2015 18:38:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,335,1444719600"; d="scan'208";a="857558501"
Received: from echoo1-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.170.181])
	by fmsmga002.fm.intel.com with ESMTP; 22 Nov 2015 18:38:01 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Nov 2015 15:37:35 +1300
Message-Id: <cover.1448246218.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/7] Extensible SDK fixes
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
X-List-Received-Date: Mon, 23 Nov 2015 02:38:07 -0000

Fixes for the extensible SDK and related items.


The following changes since commit 6f98c39418c60b7c0b25b30983d2e5257158a6a4:

  gcc: Drop 4.8 (2015-11-16 14:59:07 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/extsdkfixes2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/extsdkfixes2

Paul Eggleton (7):
  scripts/gen-lockedsig-cache: improve output
  nativesdk-buildtools-perl-dummy: fix rebuilding when SDKMACHINE changes
  toolchain-shar-extract.sh: do not allow $ in paths for ext SDK
  classes/populate_sdk_ext: tidy up preparation log file writing
  classes/populate_sdk_ext: make it clear when SDK installation has failed
  classes/populate_sdk_ext: tweak reporting of workspace exclusion
  classes/populate_sdk_ext: fail if SDK_ARCH != BUILD_ARCH

 meta/classes/populate_sdk_ext.bbclass                     | 10 ++++++++--
 meta/files/toolchain-shar-extract.sh                      |  4 ++--
 meta/lib/oe/copy_buildsystem.py                           |  5 +++--
 meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb | 11 +++++++++--
 scripts/gen-lockedsig-cache                               | 13 ++++++++++---
 5 files changed, 32 insertions(+), 11 deletions(-)

-- 
2.1.0


