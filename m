Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id F16766D3E0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2013 10:15:29 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 05 Nov 2013 02:11:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,638,1378882800"; d="scan'208";a="422445328"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.90])
	by fmsmga001.fm.intel.com with ESMTP; 05 Nov 2013 02:15:22 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Nov 2013 10:15:18 +0000
Message-Id: <cover.1383646398.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 0/2] A couple of fixes for zisofs-tools-native
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
X-List-Received-Date: Tue, 05 Nov 2013 10:15:30 -0000

The following changes since commit 1d2d37d579492b63d20ff8aa890a43b9a1576cf0:

  toaster: add class to dump toaster-tracked data (2013-11-04 09:35:01 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/zisofs-tools
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/zisofs-tools

Paul Eggleton (2):
  zisofs-tools-native: add missing DEPENDS on zlib-native
  zisofs-tools-native: fix meta fields

 meta/recipes-devtools/zisofs-tools/zisofs-tools-native_1.0.8.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

-- 
1.8.1.2


