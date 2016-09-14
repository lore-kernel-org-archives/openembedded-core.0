Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4FB707713C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 05:10:17 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP; 13 Sep 2016 22:10:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,332,1470726000"; 
   d="scan'208";a="8542950"
Received: from yagrawax-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.166.231])
	by orsmga004.jf.intel.com with ESMTP; 13 Sep 2016 22:10:14 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Sep 2016 17:09:50 +1200
Message-Id: <cover.1473829704.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/2] Path-related fixes for the extensible SDK
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
X-List-Received-Date: Wed, 14 Sep 2016 05:10:17 -0000

The following changes since commit 4d268abc2fc892c5d34449f78c8e9f2b1a9d6bac:

  oeqa.runtime.smart: work around smart race issues (2016-09-09 12:12:17 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/extsdk-path-fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/extsdk-path-fixes

Paul Eggleton (2):
  classes/populate_sdk_ext: ensure we clean the right temporary TMPDIR path
  lib/oe/copy_buildsystem: fix building eSDK with indirect paths in BBLAYERS

 meta/classes/populate_sdk_ext.bbclass | 7 ++++---
 meta/lib/oe/copy_buildsystem.py       | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

-- 
2.5.5


