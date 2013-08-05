Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id AB52C601AF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2013 21:07:41 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 05 Aug 2013 14:07:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,821,1367996400"; d="scan'208";a="342090544"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.23])
	by azsmga001.ch.intel.com with ESMTP; 05 Aug 2013 14:07:41 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Aug 2013 14:07:36 -0700
Message-Id: <cover.1375736784.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH 0/3] Package Updates
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
X-List-Received-Date: Mon, 05 Aug 2013 21:07:43 -0000


The following changes since commit bc6258f88705b0e7989089a8666ac5e5d2355823:

  grep: Add patch for texinfo 5.1 (2013-08-02 08:21:17 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/updates

Saul Wold (3):
  mc: upgrade to 4.8.10
  util-linux: upgrade to 2.23.2
  man-pages: upgrade to 3.53

 .../util-linux/{util-linux_2.23.1.bb => util-linux_2.23.2.bb}         | 4 ++--
 .../man-pages/{man-pages_3.52.bb => man-pages_3.53.bb}                | 4 ++--
 meta/recipes-extended/mc/{mc_4.8.9.bb => mc_4.8.10.bb}                | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux_2.23.1.bb => util-linux_2.23.2.bb} (83%)
 rename meta/recipes-extended/man-pages/{man-pages_3.52.bb => man-pages_3.53.bb} (82%)
 rename meta/recipes-extended/mc/{mc_4.8.9.bb => mc_4.8.10.bb} (93%)

-- 
1.8.1.4


