Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5062F60103
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 06:04:53 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 May 2017 23:04:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,422,1491289200"; d="scan'208";a="107364047"
Received: from echidna.jf.intel.com ([10.54.77.34])
	by orsmga005.jf.intel.com with ESMTP; 30 May 2017 23:04:54 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 May 2017 15:55:20 -0700
Message-Id: <1496184921-78297-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] *** Selftest/devtool: replace file assertTrue/False with assertExists/NotExists ***
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
X-List-Received-Date: Wed, 31 May 2017 06:04:54 -0000

*** replace file assertTrue/False with assertExists/NotExists to improve assert message and simplify codes ***

Yeoh Ee Peng (1):
  selftest/devtool: replace file assertTrue/False with
    assertExists/NotExists

 meta/lib/oeqa/selftest/devtool.py | 128 +++++++++++++++++++-------------------
 1 file changed, 63 insertions(+), 65 deletions(-)

-- 
2.7.4


