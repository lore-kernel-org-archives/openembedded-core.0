Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4D3436011C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2016 13:02:31 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 04 Jul 2016 06:02:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,574,1459839600"; d="scan'208";a="133585751"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 04 Jul 2016 06:02:11 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 36F716A4080
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2016 06:02:04 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jul 2016 16:02:00 +0300
Message-Id: <1467637324-16642-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 0/4] package upgrades
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
X-List-Received-Date: Mon, 04 Jul 2016 13:02:32 -0000

Recipe upgrades as suggested by the Upgrade Helper tool.

Maxin B. John (4):
  libsolv: upgrade to 0.6.22
  ethtool: upgrade to 4.6
  libatomic-ops: upgrade to 7.4.4
  screen: upgrade to 4.4.0

 .../ethtool/{ethtool_4.5.bb => ethtool_4.6.bb}     |  4 +-
 meta/recipes-extended/libsolv/libsolv_git.bb       |  4 +-
 ...-stack-overflow-due-to-too-deep-recursion.patch | 58 ----------------------
 .../screen/0001-fix-for-multijob-build.patch       | 58 ----------------------
 .../screen/{screen_4.3.1.bb => screen_4.4.0.bb}    |  6 +--
 ...batomic-ops_7.4.2.bb => libatomic-ops_7.4.4.bb} |  4 +-
 6 files changed, 8 insertions(+), 126 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_4.5.bb => ethtool_4.6.bb} (88%)
 delete mode 100644 meta/recipes-extended/screen/screen/0001-Fix-stack-overflow-due-to-too-deep-recursion.patch
 delete mode 100644 meta/recipes-extended/screen/screen/0001-fix-for-multijob-build.patch
 rename meta/recipes-extended/screen/{screen_4.3.1.bb => screen_4.4.0.bb} (87%)
 rename meta/recipes-support/libatomic-ops/{libatomic-ops_7.4.2.bb => libatomic-ops_7.4.4.bb} (85%)

-- 
2.4.0


