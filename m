Return-Path: <amanda.r.brindle@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 3B0BF780BD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 23:20:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Jan 2018 15:20:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,378,1511856000"; d="scan'208";a="167314054"
Received: from arbrindl-dev.jf.intel.com ([10.7.199.57])
	by orsmga004.jf.intel.com with ESMTP; 18 Jan 2018 15:20:40 -0800
From: Amanda Brindle <amanda.r.brindle@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jan 2018 15:18:20 -0800
Message-Id: <cover.1516313803.git.amanda.r.brindle@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: paul.eggleton@linux.intel.com, Amanda Brindle <amanda.r.brindle@intel.com>
Subject: [PATCH V2 0/2]
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
X-List-Received-Date: Thu, 18 Jan 2018 23:20:39 -0000

In V2, fixed an error that did not list all packages if multiple packages were specified
on the command line.

The following changes since commit cf75fd5ae07355951b1f90d13842552a99e61063:

  contrib/yocto-bsp-kernel-update.sh: remove this script (2018-01-18 13:05:56 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib abrindle/rprovides
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=abrindle/rprovides

Amanda Brindle (2):
  oe-pkgdata-util: Refactor functions for consistency
  oe-pkgdata-util: Add support for RPROVIDES

 scripts/oe-pkgdata-util | 173 +++++++++++++++++++++++++++---------------------
 1 file changed, 97 insertions(+), 76 deletions(-)

-- 
2.7.4


