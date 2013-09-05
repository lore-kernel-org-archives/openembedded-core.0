Return-Path: <mihaix.lindner@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 984096C6A6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 15:52:54 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 05 Sep 2013 08:52:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,847,1371106800"; d="scan'208";a="391553052"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 05 Sep 2013 08:52:46 -0700
Received: from mlindnex-mobl1.ger.corp.intel.com (unknown [10.237.105.34])
	by linux.intel.com (Postfix) with ESMTP id 56CD92C8001
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 08:52:44 -0700 (PDT)
From: Mihai Lindner <mihaix.lindner@linux.intel.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu,  5 Sep 2013 18:52:39 +0300
Message-Id: <cover.1378396260.git.mihaix.lindner@linux.intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH 0/3] oeqa: cleaner testimage log
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
X-List-Received-Date: Thu, 05 Sep 2013 15:52:55 -0000

The following changes since commit f41b7a7d4d0463a0dfafe6621d01680b81798019:

  bitbake: hob: remove PACKAGE_INSTALL variable setting from hob (2013-09-04 14:18:49 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mihai/tests
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mihai/tests

Mihai Lindner (3):
  oeqa/oetest: oeRuntimeTest: enable long messages
  oeqa/utils/sshcontrol: tweak ssh options
  oeqa/runtime/scp: replace dd call

 meta/lib/oeqa/oetest.py           |  2 ++
 meta/lib/oeqa/runtime/scp.py      | 19 +++++++++----------
 meta/lib/oeqa/runtime/smart.py    |  2 --
 meta/lib/oeqa/utils/sshcontrol.py | 23 ++++++++++++-----------
 4 files changed, 23 insertions(+), 23 deletions(-)

-- 
1.8.3.2


