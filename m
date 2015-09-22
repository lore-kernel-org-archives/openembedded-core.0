Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id BBB6E73243
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 11:48:14 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 22 Sep 2015 04:48:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,572,1437462000"; d="scan'208";a="810331945"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga002.fm.intel.com with ESMTP; 22 Sep 2015 04:48:11 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Sep 2015 14:50:16 +0300
Message-Id: <cover.1442922193.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/1] gmp: Use __gnu_inline__ attribute in 4.2.1 with gcc 5
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
X-List-Received-Date: Tue, 22 Sep 2015 11:48:17 -0000

gmp 4.2.1 doesn't build with gcc5 without a small patch. This didn't
come up in testing because Yoctos "non-gpl3" builder still doesn't
seem to pick up the right version (YOCTO #8158).
 


The following changes since commit 7b86c771c80d0759c2ca0e57c46c4c966f89c49e:

  bitbake: bitbake: bb.fetch2.git: Import errno module (2015-09-19 22:38:44 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/gmp-inline-fix
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/gmp-inline-fix

Jussi Kukkonen (1):
  gmp: Use __gnu_inline__ attribute in 4.2.1 with gcc 5

 .../Use-gnu-inline-attribute-with-gcc-5.patch      | 45 ++++++++++++++++++++++
 .../gmp/gmp-4.2.1/disable-stdc.patch               | 39 -------------------
 meta/recipes-support/gmp/gmp_4.2.1.bb              |  2 +-
 3 files changed, 46 insertions(+), 40 deletions(-)
 create mode 100644 meta/recipes-support/gmp/gmp-4.2.1/Use-gnu-inline-attribute-with-gcc-5.patch
 delete mode 100644 meta/recipes-support/gmp/gmp-4.2.1/disable-stdc.patch

-- 
2.1.4


