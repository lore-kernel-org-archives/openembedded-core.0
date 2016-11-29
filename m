Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9FD0C71ABA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 14:42:56 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga101.fm.intel.com with ESMTP; 29 Nov 2016 06:42:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,717,1473145200"; d="scan'208";a="36902308"
Received: from ylu41-mobl2.amr.corp.intel.com (HELO
	mlopezva-MOBL2.amr.corp.intel.com) ([10.254.1.198])
	by fmsmga005.fm.intel.com with ESMTP; 29 Nov 2016 06:42:57 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Nov 2016 08:42:57 -0600
Message-Id: <cover.1480429545.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.7.3
Subject: [PATCH 0/2] Add communication mechanism for sending test results
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
X-List-Received-Date: Tue, 29 Nov 2016 14:42:59 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>


These changes add a mechanism for sending test result to a remote
repository for later consumption of the data from other clients.

These patches were tested in our local autobuilders.

The following changes since commit 12a0ee049e453b6d0d2ce2f3fa981d1b6e02bd78:

  dev-manual: Added note about RPM not dealing with post-install (2016-11-23 11:10:35 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mariano/bug9954
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mariano/bug9954

Mariano Lopez (2):
  oeqa/utils/metadata.py: Add metadata library
  oe-selftest: Add option to submit test result to a git repository.

 meta/lib/oeqa/utils/metadata.py | 77 ++++++++++++++++++++++++++++++++
 scripts/oe-selftest             | 98 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 175 insertions(+)
 create mode 100644 meta/lib/oeqa/utils/metadata.py

-- 
2.7.3


