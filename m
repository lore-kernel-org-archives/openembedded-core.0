Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6A63E786DA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Feb 2018 03:02:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Feb 2018 19:02:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,381,1515484800"; d="scan'208";a="30026511"
Received: from vsharmab-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.74.120])
	by orsmga003.jf.intel.com with ESMTP; 22 Feb 2018 19:02:47 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Feb 2018 16:02:08 +1300
Message-Id: <cover.1519354910.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.14.3
Subject: [PATCH 0/8] devtool fixes
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
X-List-Received-Date: Fri, 23 Feb 2018 03:02:49 -0000

This incorporates several of the fixes from my previous series and adds
a few others - I've excluded the multi-source changes from the previous
series as they may not be ready yet and it's too late in the release
cycle now. These have all passed through oe-selftest locally.


The following changes since commit 6e5dbb53a7cbd05baf07de62b1abc88dccfd4cb9:

  nativesdk-qemu-helper: add a missing nativesdk-python3-logging dependency (2018-02-22 16:02:17 +0000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool33-oe
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/devtool33-oe

Paul Eggleton (8):
  lib/oe/path: implement is_path_under()
  devtool: fix poor handling of upgraded BBCLASSEXTENDed recipes
  devtool: reset: delete bbappend file if _check_preserve() doesn't
  devtool: finish: fix erroneously creating bbappend for relative paths
  devtool: deploy-target: don't specify ssh/scp port unless user does
  lib/oe/recipeutils: add .txz extension to archive list
  devtool: search: also look in recipe cache
  devtool: search: tweak help text

 meta/lib/oe/path.py             |  24 ++++++++++
 meta/lib/oe/recipeutils.py      |   2 +-
 scripts/devtool                 |   5 +-
 scripts/lib/devtool/deploy.py   |  12 ++---
 scripts/lib/devtool/search.py   | 100 ++++++++++++++++++++++++++--------------
 scripts/lib/devtool/standard.py |  17 +++++--
 6 files changed, 110 insertions(+), 50 deletions(-)

-- 
2.14.3


