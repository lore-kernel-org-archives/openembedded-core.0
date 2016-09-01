Return-Path: <humberto.ibarra.lopez@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 4547F600B3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Sep 2016 18:54:33 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga104.jf.intel.com with ESMTP; 01 Sep 2016 11:54:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,268,1470726000"; d="scan'208";a="1034368197"
Received: from jhibarra-mobl1.zpn.intel.com ([10.219.26.58])
	by fmsmga001.fm.intel.com with ESMTP; 01 Sep 2016 11:54:32 -0700
From: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Sep 2016 13:56:38 -0500
Message-Id: <1472756200-4001-1-git-send-email-humberto.ibarra.lopez@intel.com>
X-Mailer: git-send-email 2.4.11
Cc: joshua.g.lock@intel.com
Subject: [PATCH v4 0/2] oe-selftest refactoring
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
X-List-Received-Date: Thu, 01 Sep 2016 18:54:33 -0000

Refactoring of oe-selftest and adding version tracking for its syntax. These patches need to be integrated at the same time as the corresponding change for autobuilder to aovid breaking anything.

[YOCTO #8938]

Humberto Ibarra (2):
  oe-selftest: reorganize syntax to use subcommands
  oe-selftest: Add syntax version tracking to oe-selftest

 scripts/oe-selftest | 376 +++++++++++++++++++++++++++-------------------------
 1 file changed, 198 insertions(+), 178 deletions(-)

-- 
2.4.11


