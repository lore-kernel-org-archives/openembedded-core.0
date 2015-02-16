Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D18EC60556
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Feb 2015 17:57:17 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 16 Feb 2015 09:49:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,589,1418112000"; d="scan'208";a="667141849"
Received: from mmettala-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.7.57])
	by fmsmga001.fm.intel.com with ESMTP; 16 Feb 2015 09:57:17 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Feb 2015 17:57:02 +0000
Message-Id: <cover.1424109368.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH 0/1] Enable complementary package exclusion
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
X-List-Received-Date: Mon, 16 Feb 2015 17:57:20 -0000

The following change since commit d5af8539c0a1718a7254bcdcfa973e3c887dfbd6:

  syslinux: support ext2/3/4 device (2015-02-15 08:11:19 +0000)

is available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/exclude-complementary
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/exclude-complementary

Paul Eggleton (1):
  lib/oe/package_manager: support exclusion from complementary glob
    process by regex

 meta/lib/oe/package_manager.py    | 3 +++
 meta/lib/oeqa/selftest/pkgdata.py | 5 +++++
 scripts/oe-pkgdata-util           | 6 +++++-
 3 files changed, 13 insertions(+), 1 deletion(-)

-- 
1.9.3


