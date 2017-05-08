Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A7A7571DEE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 May 2017 08:10:43 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 May 2017 01:10:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,308,1491289200"; d="scan'208";a="258229341"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 08 May 2017 01:10:44 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	by linux.intel.com (Postfix) with ESMTP id 11E136A4006
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 May 2017 01:10:29 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 May 2017 11:11:21 +0300
Message-Id: <1494231086-31827-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 0/5] version upgrades
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
X-List-Received-Date: Mon, 08 May 2017 08:10:50 -0000

Package version upgrades based on AUH.

Maxin B. John (5):
  mc: upgrade to 4.8.19
  minicom: upgrade to 2.7.1
  libsolv: upgrade to 0.6.27
  sqlite3: upgrade to 3.18.0
  harfbuzz: upgrade to 1.4.6

 .../recipes-extended/libsolv/{libsolv_0.6.26.bb => libsolv_0.6.27.bb} | 2 +-
 meta/recipes-extended/mc/{mc_4.8.18.bb => mc_4.8.19.bb}               | 4 ++--
 meta/recipes-extended/minicom/{minicom_2.7.bb => minicom_2.7.1.bb}    | 4 ++--
 .../harfbuzz/{harfbuzz_1.4.1.bb => harfbuzz_1.4.6.bb}                 | 4 ++--
 meta/recipes-support/sqlite/{sqlite3_3.17.0.bb => sqlite3_3.18.0.bb}  | 4 ++--
 5 files changed, 9 insertions(+), 9 deletions(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.6.26.bb => libsolv_0.6.27.bb} (95%)
 rename meta/recipes-extended/mc/{mc_4.8.18.bb => mc_4.8.19.bb} (94%)
 rename meta/recipes-extended/minicom/{minicom_2.7.bb => minicom_2.7.1.bb} (87%)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_1.4.1.bb => harfbuzz_1.4.6.bb} (88%)
 rename meta/recipes-support/sqlite/{sqlite3_3.17.0.bb => sqlite3_3.18.0.bb} (59%)

-- 
2.4.0


