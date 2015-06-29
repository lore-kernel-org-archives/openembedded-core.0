Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 07D9F75C40
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 15:04:43 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 29 Jun 2015 08:04:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,699,1427785200"; d="scan'208";a="596767932"
Received: from sentry.rb.intel.com ([10.237.105.157])
	by orsmga003.jf.intel.com with ESMTP; 29 Jun 2015 08:02:59 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jun 2015 18:03:10 +0300
Message-Id: <cover.1435590134.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/1] Fix for bug YOCTO #7918
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
X-List-Received-Date: Mon, 29 Jun 2015 15:04:45 -0000

The following changes since commit 2578ff3dfe55a1c07208401861f96e2e327eacaf:

  bitbake: codeparser: Add repr() methods (2015-06-27 22:51:21 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/YB7918
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/YB7918

Cristian Iorga (1):
  runqemu-internal: correctly set format for root FS as raw

 scripts/runqemu-internal | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

-- 
2.1.4


