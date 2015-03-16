Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id AE46C6013D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 10:45:32 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 16 Mar 2015 03:45:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,407,1422950400"; d="scan'208";a="541464615"
Received: from sgconnee-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.8.217])
	by orsmga003.jf.intel.com with ESMTP; 16 Mar 2015 03:44:33 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Mar 2015 10:45:27 +0000
Message-Id: <cover.1426502565.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH 0/2] A couple of misc fixes
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
X-List-Received-Date: Mon, 16 Mar 2015 10:45:33 -0000

Two not-really-related fixes I made while working on devtool recently. The
oe-selftest patch adds a test that would have caught the regression that
occurred with wildcard support in bitbake-layers remove-layer.


The following changes since commit fb29441216435b9bae47ca9cd42db5a6b1fe77d8:

  oeqa/parselogs: Skip hda opcode errors (2015-03-12 12:49:22 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/fixes3
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/fixes3

Paul Eggleton (2):
  waffle: drop unneeded setting of EXTRA_OECMAKE
  oe-selftest: improve bitbake-layers tests

 meta/lib/oeqa/selftest/bblayers.py           | 27 ++++++++++++++++++++++-----
 meta/recipes-graphics/waffle/waffle_1.3.0.bb |  3 ---
 2 files changed, 22 insertions(+), 8 deletions(-)

-- 
1.9.3


