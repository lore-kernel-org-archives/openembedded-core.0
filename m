Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id ECED66AC35
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 12:05:50 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 05 Feb 2015 04:05:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,523,1418112000"; d="scan'208";a="647734035"
Received: from mhgreen-mobl5.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.19.49])
	by orsmga001.jf.intel.com with ESMTP; 05 Feb 2015 04:05:50 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 12:05:39 +0000
Message-Id: <cover.1423131107.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH 0/1] bblayers.conf version mismatch fix
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
X-List-Received-Date: Thu, 05 Feb 2015 12:05:57 -0000

NOTE: there is a corresponding patch for meta-yocto that should be applied 
there at the same time as this patch.


The following change since commit eb9d896db2fc67bac8efd258744d06fbbee87f06:

  libtool: avoid running automake/autoconf --version (2015-02-05 09:45:49 +0000)

is available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/bblayers-ver-oecore
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/bblayers-ver-oecore

Paul Eggleton (1):
  classes/sanity: avoid bblayers version issue when switching between
    poky and other DISTRO values

 meta/classes/sanity.bbclass | 7 ++++++-
 meta/conf/sanity.conf       | 2 +-
 2 files changed, 7 insertions(+), 2 deletions(-)

-- 
1.9.3


