Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8A9426FF56
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 20:43:35 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 14 Mar 2016 13:43:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,337,1455004800"; d="scan'208";a="764036129"
Received: from mtandon-mobl3.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.169.55])
	by orsmga003.jf.intel.com with ESMTP; 14 Mar 2016 13:43:34 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Mar 2016 09:43:04 +1300
Message-Id: <cover.1457988127.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [jethro][PATCH 0/2] Backports for issues using devtool on the kernel
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
X-List-Received-Date: Mon, 14 Mar 2016 20:43:35 -0000

Backport a couple of fixes from master that allow devtool to work
properly on the kernel.


The following changes since commit 9e7d207e207bf0319b09d403d87d37f24e3dfbee:

  base: check for existing prefix when expanding names in PACKAGECONFIG (2016-03-11 23:14:55 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/jethro-fixes4-oecore
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/jethro-fixes4-oecore

Markus Lehtonen (2):
  devtool: extract: copy kernel config to srctree
  devtool: extract: update SRCTREECOVEREDTASKS for kernel

 scripts/lib/devtool/standard.py | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

-- 
2.5.0


