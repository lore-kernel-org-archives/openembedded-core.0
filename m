Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id BCD6A73637
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 17:44:25 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 20 Feb 2015 09:44:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,616,1418112000"; d="scan'208";a="669192671"
Received: from marazel-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.23.180])
	by fmsmga001.fm.intel.com with ESMTP; 20 Feb 2015 09:44:24 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Feb 2015 17:44:04 +0000
Message-Id: <cover.1424454072.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH 0/3] OE-Core changes to support bitbake-layers layerindex-fetch
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
X-List-Received-Date: Fri, 20 Feb 2015 17:44:29 -0000

Some changes to support a bitbake patchset to allow fetching layers from
the OE layer index from the command line - we need some pieces in
OE-Core to avoid hardcoded knowledge of OE creeping in (+ one fix
for some deprecated syntax).


The following changes since commit 530565c6cb77319f4cc49edeea6fec6be997415d:

  glibc: Update to glibc 2.21 release tag (2015-02-19 17:04:19 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/bblayers-layerindex-oecore
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/bblayers-layerindex-oecore

Chong Lu (1):
  bitbake.conf: Add two variables for layer index

Paul Eggleton (2):
  layer.conf: set a variable to map to the OE Layer Index name
  lib/oeqa/selftest/bblayers: use dashed subcommands

 meta/conf/bitbake.conf             | 6 ++++++
 meta/conf/layer.conf               | 2 ++
 meta/lib/oeqa/selftest/bblayers.py | 6 +++---
 3 files changed, 11 insertions(+), 3 deletions(-)

-- 
1.9.3


