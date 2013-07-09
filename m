Return-Path: <emilia.maria.silvia.ciobanu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id BC8C4608C6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 08:50:12 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 09 Jul 2013 01:50:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1026,1363158000"; d="scan'208";a="367310888"
Received: from ema-vostro-460.rb.intel.com ([10.237.105.147])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jul 2013 01:50:10 -0700
From: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Jul 2013 11:57:37 +0300
Message-Id: <cover.1373359791.git.emilia.maria.silvia.ciobanu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/4] Fix typos
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
X-List-Received-Date: Tue, 09 Jul 2013 08:50:12 -0000

The following changes since commit dc86293f0444384e8ae5131fdd10b6cb077164b0:

  bitbake: HOB:Proper handle of SIGINT (2013-07-05 15:52:48 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib emac/typo_fixes
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=emac/typo_fixes

Emilia Ciobanu (4):
  chkconfig-alternatives-native: add git token in package version
  lttng-modules: rename recipe
  unzip: rename recipe
  zip: rename recipe

 .../chkconfig-alternatives-native_1.3.59.bb        |    2 +-
 .../unzip/{unzip_6.0.bb => unzip_60.bb}            |    0
 .../recipes-extended/zip/{zip_3.0.bb => zip_30.bb} |    0
 ...lttng-modules_2.2.0.bb => lttng-modules_git.bb} |    2 +-
 4 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/unzip/{unzip_6.0.bb => unzip_60.bb} (100%)
 rename meta/recipes-extended/zip/{zip_3.0.bb => zip_30.bb} (100%)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.2.0.bb => lttng-modules_git.bb} (97%)

-- 
1.7.9.5


