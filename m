Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2919E6B0CB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Feb 2015 10:23:52 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 18 Feb 2015 02:19:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,600,1418112000"; d="scan'208";a="456172964"
Received: from cbulfin-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.18.182])
	by FMSMGA003.fm.intel.com with ESMTP; 18 Feb 2015 02:08:47 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Feb 2015 10:23:41 +0000
Message-Id: <cover.1424254983.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [dizzy][PATCH 0/1] Enable complementary package exclusion
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
X-List-Received-Date: Wed, 18 Feb 2015 10:23:54 -0000

The following changes since commit 3cd31ef5bb5d0bd9245956d16680ba9d9668817e:

  toaster.bbclass: use the openembedded-core name (2015-02-13 14:46:28 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/exclude-complementary-dizzy
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/exclude-complementary-dizzy

Paul Eggleton (1):
  lib/oe/package_manager: support exclusion from complementary glob
    process by regex

 meta/lib/oe/package_manager.py |  3 +++
 scripts/oe-pkgdata-util        | 12 +++++++++---
 2 files changed, 12 insertions(+), 3 deletions(-)

-- 
1.9.3


