Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 53CC378303
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 03:10:38 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Jun 2017 20:10:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,342,1493708400"; d="scan'208";a="868125520"
Received: from echidna.jf.intel.com ([10.54.77.34])
	by FMSMGA003.fm.intel.com with ESMTP; 14 Jun 2017 20:10:40 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Jun 2017 13:01:11 -0700
Message-Id: <1497470472-76873-1-git-send-email-ee.peng.yeoh@intel.com>
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
X-List-Received-Date: Thu, 15 Jun 2017 03:10:39 -0000

*** replace file assertTrue/False with assertExists/NotExists to improve assert message and simplify codes ***

Yeoh Ee Peng (1):
  selftest/devtool: replace file assertTrue/False with assertExists/NotExists

 meta/lib/oeqa/selftest/devtool.py | 128 +++++++++++++++++++-------------------
 1 file changed, 63 insertions(+), 65 deletions(-)

-- 
2.7.4


