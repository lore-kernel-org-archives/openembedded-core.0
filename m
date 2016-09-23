Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 083746060F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 09:22:16 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 23 Sep 2016 02:22:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,381,1470726000"; d="scan'208";a="1060910446"
Received: from yleow-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.155.25])
	by fmsmga002.fm.intel.com with ESMTP; 23 Sep 2016 02:22:15 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Sep 2016 21:22:09 +1200
Message-Id: <cover.1474622468.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/2] A couple of fixes for PATCHTOOL = "git"
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
X-List-Received-Date: Fri, 23 Sep 2016 09:22:18 -0000

A couple of fixes for PATCHTOOL = "git" (which devtool makes extensive
use of).


The following changes since commit 7e0f95bf359bc3b5bb1578024a993e184de155cd:

  base.bbclass: Drop unnecessary dirs setting (2016-09-22 11:08:23 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/patch-git-fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/patch-git-fixes

Paul Eggleton (2):
  lib/oe/patch: exclude "From <hash>" from commit message when PATCHTOOL
    is "git"
  lib/oe/patch: improve accuracy of patch header extraction

 meta/lib/oe/patch.py | 32 +++++++++++++++++++++++++++-----
 1 file changed, 27 insertions(+), 5 deletions(-)

-- 
2.5.5


