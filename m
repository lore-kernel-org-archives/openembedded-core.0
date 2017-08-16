Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6045B77DA3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 13:45:32 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Aug 2017 06:45:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,382,1498546800"; d="scan'208";a="140948895"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 16 Aug 2017 06:45:34 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id CA91758011C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 06:45:33 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Aug 2017 16:47:09 +0300
Message-Id: <1502891231-2284-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 0/2] package upgrades from AUH
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
X-List-Received-Date: Wed, 16 Aug 2017 13:45:33 -0000

Package upgrades suggested by the Automatic Upgrade Helper.

Maxin B. John (2):
  screen: upgrade to 4.6.1
  harfbuzz: upgrade to 1.4.8

 .../screen/screen/fix-parallel-make.patch             | 19 -------------------
 .../screen/{screen_4.6.0.bb => screen_4.6.1.bb}       |  5 ++---
 .../harfbuzz/{harfbuzz_1.4.7.bb => harfbuzz_1.4.8.bb} |  4 ++--
 3 files changed, 4 insertions(+), 24 deletions(-)
 delete mode 100644 meta/recipes-extended/screen/screen/fix-parallel-make.patch
 rename meta/recipes-extended/screen/{screen_4.6.0.bb => screen_4.6.1.bb} (91%)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_1.4.7.bb => harfbuzz_1.4.8.bb} (88%)

-- 
2.4.0


