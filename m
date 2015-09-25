Return-Path: <alejandro.franco@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 54C4176FD0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 21:02:54 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 25 Sep 2015 14:02:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,588,1437462000"; d="scan'208";a="797479529"
Received: from afshjern.zpn.intel.com ([10.219.128.51])
	by fmsmga001.fm.intel.com with ESMTP; 25 Sep 2015 14:02:53 -0700
From: Alex Franco <alejandro.franco@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Sep 2015 16:03:04 -0500
Message-Id: <1443214985-18686-1-git-send-email-alejandro.franco@linux.intel.com>
X-Mailer: git-send-email 2.5.3
Subject: [PATCHv3] lsb: add lsbinitscripts and util-linux rdepends
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
X-List-Received-Date: Fri, 25 Sep 2015 21:02:54 -0000

Changes since v2: moved util-linux RDEPENDS to lsbinitscripts, while
lsb still holds the lsbinitscritps dependency.

It was suggested it may be better to split up util-linux. Individual
utils like mountpoint in this case, could be added in a granular way
instead of potentially causing bloat. This should probably be minded
in a future patch...

[YOCTO #7732]

Signed-off-by: Alex Franco <alejandro.franco@linux.intel.com>

Alex Franco (1):
  lsb: add lsbinitscripts and util-linux rdepends

 meta/recipes-extended/lsb/lsb_4.1.bb             | 4 ++--
 meta/recipes-extended/lsb/lsbinitscripts_9.64.bb | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

-- 
2.5.3


