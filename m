Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1479978339
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 03:16:53 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Nov 2017 20:16:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,336,1505804400"; d="scan'208";a="331471814"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.249.64.52])
	by fmsmga004.fm.intel.com with ESMTP; 02 Nov 2017 20:16:50 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Nov 2017 16:16:09 +1300
Message-Id: <cover.1509678875.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
Subject: [PATCH 0/3] Misc OE-Core fixes
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
X-List-Received-Date: Fri, 03 Nov 2017 03:16:54 -0000

The following changes since commit 3b413a80578caacd9a7f405f3c51a3921d78a60d:

  README.qemu: qemuppc64 is not supported (2017-10-16 23:54:27 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/core-fixes
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/core-fixes

Paul Eggleton (3):
  lib/oe/sstatesig: fix wildcard matching wrong task signature files
  buildhistory: enable committing history by default
  scripts/send-pull-request: allow -C to be used multiple times

 meta/classes/buildhistory.bbclass | 2 +-
 meta/lib/oe/sstatesig.py          | 2 +-
 scripts/send-pull-request         | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.9.5


