Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8843F71AC6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 01:31:59 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 May 2017 18:32:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,377,1491289200"; d="scan'208";a="105237506"
Received: from echidna.jf.intel.com ([10.54.77.34])
	by fmsmga006.fm.intel.com with ESMTP; 21 May 2017 18:32:00 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 May 2017 11:22:21 -0700
Message-Id: <1495390943-47688-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/2] *** oe-selftest: add an assertExists() function and change tests to use it ***
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
X-List-Received-Date: Mon, 22 May 2017 01:32:00 -0000

*** Add assertExists and assertNotExists, then add QA test for both functions  ***

Yeoh Ee Peng (2):
  base.py: add assertExists and assertNotExists to oeselftest
  selftest/oeselftest: add QA test for assertExists and assertNotExists

 meta/lib/oeqa/selftest/base.py       | 13 +++++++++++++
 meta/lib/oeqa/selftest/oeselftest.py | 35 +++++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/oeselftest.py

-- 
2.7.4


