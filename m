Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C38DE7169F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 May 2015 14:15:40 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 04 May 2015 07:15:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,366,1427785200"; d="scan'208";a="689613080"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by orsmga001.jf.intel.com with ESMTP; 04 May 2015 07:15:41 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 May 2015 17:15:37 +0300
Message-Id: <cover.1430748903.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/2] connman: upgrade and cleanup
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
X-List-Received-Date: Mon, 04 May 2015 14:15:43 -0000

The following changes since commit 7a8f37daa7b42905233c31366915b897886a957a:

  dev-manual: Updates to add Luna support for Eclipse (2015-05-03 11:49:35 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib Ciorga/PUs
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=Ciorga/PUs

Cristian Iorga (2):
  connman: code cleanup
  connman: upgrade to 1.29

 meta/recipes-connectivity/connman/connman.inc      | 13 ++----
 ...-create-dirs-before-putting-files-in-them.patch | 46 ++++++++++++++++++++++
 .../connman/{connman_1.28.bb => connman_1.29.bb}   |  5 ++-
 3 files changed, 53 insertions(+), 11 deletions(-)
 create mode 100644 meta/recipes-connectivity/connman/connman/build-create-dirs-before-putting-files-in-them.patch
 rename meta/recipes-connectivity/connman/{connman_1.28.bb => connman_1.29.bb} (58%)

-- 
2.1.0


