Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 925BC6D476
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 14:32:55 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 13 Nov 2013 06:32:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,693,1378882800"; d="scan'208";a="426920104"
Received: from junemccl-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.121.116])
	by fmsmga001.fm.intel.com with ESMTP; 13 Nov 2013 06:32:56 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2013 14:32:37 +0000
Message-Id: <cover.1384353075.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 00/11] Misc cleanups / validation improvements
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
X-List-Received-Date: Wed, 13 Nov 2013 14:32:56 -0000

Tidy up a bunch of minor things I had on my todo list or that I noticed
recently. Note the two class removals at the end.


The following changes since commit 616354f13732d13c17434d5b60b166f691c25761:

  binutils: Add gnu-config-native to DEPENDS (2013-11-12 16:00:20 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/fixes

Paul Eggleton (11):
  scripts/create-recipe: fix handling of --help
  classes/insane: improve LIC_FILES_CHKSUM messages
  classes/sanity: validate SDKMACHINE value
  bitbake.conf: remove BOOTSTRAP_EXTRA_* variable defaults
  bitbake.conf: remove CPU_FEATURES defaults
  gtk-immodules-cache: fix error message to use correct names
  classes/license: use "1" to set boolean variables
  classes/license: fix comments
  systemd: fix comments
  classes/pkg_distribute: remove
  classes/pkg_metainfo: remove

 meta/classes/gtk-immodules-cache.bbclass |  2 +-
 meta/classes/insane.bbclass              | 16 +++++++++++++---
 meta/classes/license.bbclass             | 10 +++++-----
 meta/classes/pkg_distribute.bbclass      | 29 -----------------------------
 meta/classes/pkg_metainfo.bbclass        | 22 ----------------------
 meta/classes/sanity.bbclass              |  5 +++++
 meta/classes/systemd.bbclass             |  4 ++--
 meta/conf/bitbake.conf                   | 10 ----------
 meta/recipes-core/systemd/systemd_208.bb |  4 ++--
 scripts/create-recipe                    |  2 +-
 10 files changed, 29 insertions(+), 75 deletions(-)
 delete mode 100644 meta/classes/pkg_distribute.bbclass
 delete mode 100644 meta/classes/pkg_metainfo.bbclass

-- 
1.8.1.2


