Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 488026D0CA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 12:10:09 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 Nov 2013 04:10:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,774,1378882800"; d="scan'208";a="415081178"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.39])
	by orsmga001.jf.intel.com with ESMTP; 26 Nov 2013 04:10:06 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Nov 2013 12:09:51 +0000
Message-Id: <cover.1385467738.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 0/1] Image manifest support
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
X-List-Received-Date: Tue, 26 Nov 2013 12:10:09 -0000

The following change since commit 25a75e83550fab0f9d2486b13ec9ab6339b6a8b0:

  linux-firmware: add missing linux-firmware-iwlwifi-7260-7 package (2013-11-25 16:14:15 +0000)

is available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/manifest
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/manifest

Paul Eggleton (1):
  classes/image: write image manifest

 meta/classes/image.bbclass            | 15 +++++++++------
 meta/classes/populate_sdk_deb.bbclass |  2 ++
 meta/classes/populate_sdk_ipk.bbclass |  2 ++
 meta/classes/populate_sdk_rpm.bbclass |  2 ++
 meta/classes/rootfs_ipk.bbclass       | 14 --------------
 scripts/opkg-query-helper.py          |  9 +++++++++
 6 files changed, 24 insertions(+), 20 deletions(-)

-- 
1.8.1.2


