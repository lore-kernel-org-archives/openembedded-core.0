Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 18A796FEFE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 20:49:44 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga105.fm.intel.com with ESMTP; 08 Sep 2016 13:49:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,302,1470726000"; d="scan'208";a="1027087339"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.10.74])
	by orsmga001.jf.intel.com with ESMTP; 08 Sep 2016 13:49:31 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Sep 2016 21:49:12 +0100
Message-Id: <cover.1473367495.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/1] runqemu: fix run from testimage with non-standard DEPLOY_DIR_IMAGE
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
X-List-Received-Date: Thu, 08 Sep 2016 20:49:45 -0000

Note: This patch is against master-next, as the Python 3 runqemu hasn't made it
to master yet.

This fixes a workflow where the contents of DEPLOY_DIR_IMAGE are copied to a
user-created directory which doesn't follow the standard OE naming of 
DEPLOY_DIR_IMAGE and then DEPLOY_DIR_IMAGE is set to point at that directory in
local.conf

Per the commit message it's possible that we don't want to try and check the
value a user uses for MACHINE and just let runqemu fail later, but this change
fixes the mentioned workflow without changing too much of the runqemu behaviour.


The following changes since commit 958c05bfa1009c57d8acc45ea0ed4b7f6f0d377a:

  maintainers.inc: rename gtk-doc-stub to gtk-doc, reassign to me (2016-09-08 17:05:37 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib joshuagl/runqemu
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=joshuagl/runqemu

Joshua Lock (1):
  runqemu: fix run from testimage with non-standard DEPLOY_DIR_IMAGE

 scripts/runqemu | 13 +++++++++++++
 1 file changed, 13 insertions(+)

-- 
2.7.4

