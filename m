Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 52C906D092
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 17:49:24 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 21 Oct 2013 10:49:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,540,1378882800"; d="scan'208";a="414632833"
Received: from unknown (HELO swold-linux.host.org) ([10.255.12.37])
	by fmsmga001.fm.intel.com with ESMTP; 21 Oct 2013 10:49:16 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Oct 2013 10:49:11 -0700
Message-Id: <1382377754-4904-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 0/3] Clean up my check mess
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
X-List-Received-Date: Mon, 21 Oct 2013 17:49:26 -0000

Richard,

A small set of patches that remove my bogus check recipe. It adds
native support to libcheck since kbd needs it for it's testing.

Sau!

Saul Wold (3):
  libcheck: Add native support for kbd-native
  kbd: Use libcheck instead of check
  check: Remove duplicate recipe of libcheck

 meta/recipes-core/kbd/kbd_2.0.0.bb               |  2 +-
 meta/recipes-support/check/check_0.9.10.bb       | 20 ----------------
 meta/recipes-support/check/files/ptest.patch     | 29 ------------------------
 meta/recipes-support/check/files/run-ptest       |  3 ---
 meta/recipes-support/libcheck/libcheck_0.9.10.bb |  3 +++
 5 files changed, 4 insertions(+), 53 deletions(-)
 delete mode 100644 meta/recipes-support/check/check_0.9.10.bb
 delete mode 100644 meta/recipes-support/check/files/ptest.patch
 delete mode 100644 meta/recipes-support/check/files/run-ptest

-- 
1.8.3.1


