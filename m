Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 83F25789CF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 12:34:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Jul 2018 05:34:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,365,1526367600"; d="scan'208";a="55642264"
Received: from spalapa-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
	([10.249.34.182])
	by fmsmga008.fm.intel.com with ESMTP; 17 Jul 2018 05:34:27 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2018 14:34:16 +0200
Message-Id: <cover.1531830833.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 0/2] A couple of fixes for oe-run-native
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
X-List-Received-Date: Tue, 17 Jul 2018 12:34:27 -0000

The following changes since commit 26e04b23ba1b6942aa7c7df478d41dfe7b73e6e0:

  oeqa/selftest/wic: Split tests into two class groups (2018-07-15 16:36:09 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/oe-run-native-fixes
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/oe-run-native-fixes

Paul Eggleton (2):
  oe-run-native: ensure arguments get quoted
  oe-find-native-sysroot: drop message if pseudo is not found

 scripts/oe-find-native-sysroot | 2 --
 scripts/oe-run-native          | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

-- 
2.17.1


