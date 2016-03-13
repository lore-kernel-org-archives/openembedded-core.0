Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 20C726FF56
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 22:26:20 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 13 Mar 2016 15:26:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,333,1455004800"; d="scan'208";a="936207275"
Received: from tbcheng-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.165.252])
	by fmsmga002.fm.intel.com with ESMTP; 13 Mar 2016 15:26:19 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Mar 2016 11:25:55 +1300
Message-Id: <cover.1457907892.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 0/1] Fix for QEMU-using oe-selftest tests
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
X-List-Received-Date: Sun, 13 Mar 2016 22:26:21 -0000

The following changes since commit 300f858ba07c938427ccd05a3d7220027a03d461:

  local.conf.sample: Disable prelink by default (2016-03-13 22:08:55 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/oe-selftest-qemu
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/oe-selftest-qemu

Paul Eggleton (1):
  Revert "selftest: Added MACHINE = "qemux86" to tests that use runqemu"

 meta/lib/oeqa/selftest/devtool.py       | 7 +++----
 meta/lib/oeqa/selftest/imagefeatures.py | 9 +++------
 2 files changed, 6 insertions(+), 10 deletions(-)

-- 
2.5.0


