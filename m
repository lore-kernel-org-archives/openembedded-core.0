Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1QtATG-0005qF-2H
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Aug 2011 05:37:43 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 15 Aug 2011 20:33:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="38762313"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.146])
	by orsmga001.jf.intel.com with ESMTP; 15 Aug 2011 20:33:03 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Aug 2011 11:34:12 +0800
Message-Id: <cover.1313465312.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH v3 Bug #892 0/2] Collected cached siteconfig in the runtime
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
X-List-Received-Date: Tue, 16 Aug 2011 03:37:43 -0000

These 2 patches are trying to fix the bug #892. It collected the cached site config files name in the runtime for meta-toolchain and meta-environment, and also added task dependencies to ensure the caches are generated. 

The variable TOOLCHAIN_NEED_CONFIGSITE_CACHE specifies what site config files are needed from the cache used for the toolchain.

The following changes since commit 13db5f420ca9bff98561f80d78958278734ad1f4:
  Zhai Edwin (1):
        distro-tracking: Update info for gpgme, libassuan, apr... after last upgrade.

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib llu/bug892
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/bug892

Lianhao Lu (2):
  toolchain-script.bbclass: Collected cached site config in runtime.
  meta-toolchain/environment: Collected site config files in runtime.

 meta/classes/populate_sdk.bbclass             |    2 +-
 meta/classes/siteinfo.bbclass                 |    4 +++-
 meta/classes/toolchain-scripts.bbclass        |   24 +++++++++++++++++++++---
 meta/recipes-core/meta/meta-environment.bb    |    7 +++----
 meta/recipes-core/meta/meta-toolchain-gmae.bb |    2 ++
 meta/recipes-core/meta/meta-toolchain.bb      |    4 +---
 6 files changed, 31 insertions(+), 12 deletions(-)



