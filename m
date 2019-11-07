Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 162DC7F7A4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 09:50:33 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Nov 2019 01:50:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,277,1569308400"; d="scan'208";a="201359956"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga007.fm.intel.com with ESMTP; 07 Nov 2019 01:50:32 -0800
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Nov 2019 17:50:26 +0800
Message-Id: <1573120230-33685-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/4] Resulttool minor enhancements
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
X-List-Received-Date: Thu, 07 Nov 2019 09:50:34 -0000

Resulttool minor enhancements
 - Enable report to use regression_map
 - Enable report to output raw test results
 - Enable report to print total test result statistic
 - Enable store to add extra test environment config data

Yeoh Ee Peng (4):
  scripts/resulttool/report: Enable report to use regression_map
  scripts/resulttool/report: Enable output raw test results
  scripts/resulttool/report: Add total statistic to test result.
  resulttool/store.py: Enable add extra test environment data

 scripts/lib/resulttool/report.py                   | 35 ++++++++++++++++++----
 scripts/lib/resulttool/resultutils.py              |  4 +--
 scripts/lib/resulttool/store.py                    |  5 +++-
 .../resulttool/template/test_report_full_text.txt  |  3 +-
 4 files changed, 38 insertions(+), 9 deletions(-)

-- 
2.7.4


