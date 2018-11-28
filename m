Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 9111A6C50C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2018 04:16:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Nov 2018 20:16:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,289,1539673200"; d="scan'208";a="96057593"
Received: from thivuong-mobl.ccr.corp.intel.com (HELO localhost.localdomain)
	([10.255.138.218])
	by orsmga008.jf.intel.com with ESMTP; 27 Nov 2018 20:16:27 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Nov 2018 17:16:13 +1300
Message-Id: <cover.1543378296.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.17.2
Subject: [PATCH 0/4] recipeutils fixes for devtool
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
X-List-Received-Date: Wed, 28 Nov 2018 04:16:29 -0000

A couple of fixes for issues in the recipeutils module (which affect
devtool), a cleanup patch, and some additional related tests for
oe-selftest.


The following changes since commit 21387613fec1a8c142ed48d7a74d587e205b0c98:

  gst-validate: upgrade 1.14.2 -> 1.14.4 (2018-11-27 22:11:22 +0000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool-recipeutils-fixes
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/devtool-recipeutils-fixes

Paul Eggleton (4):
  lib/oe/recipeutils: patch_recipe(): fix handling of values across
    includes/classes
  lib/oe/recipeutils: patch_recipe(): fix replacing varflag values
  lib/oe/recipeutils: drop obsolete functions
  oe-selftest: add some tests for recipeutils module

 meta/lib/oe/recipeutils.py                  | 104 +++++++++++----
 meta/lib/oeqa/selftest/cases/recipeutils.py | 135 ++++++++++++++++++++
 2 files changed, 211 insertions(+), 28 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/cases/recipeutils.py

-- 
2.17.2


