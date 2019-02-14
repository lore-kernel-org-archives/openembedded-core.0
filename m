Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 953E76010B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 06:21:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Feb 2019 22:21:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,367,1544515200"; d="scan'208";a="318895891"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga006.fm.intel.com with ESMTP; 13 Feb 2019 22:21:47 -0800
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Feb 2019 13:50:36 +0800
Message-Id: <1550123438-37723-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/2 v7] test-case-mgmt
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
X-List-Received-Date: Thu, 14 Feb 2019 06:21:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

v1:
  Face key error from oe-git-archive
  Undesirable behavior when storing to multiple git branch

v2: 
  Include fix for oe-git-archive
  Include fix for store result to multiple git branch
  Improve git commit message   

v3:
  Enhance fix for oe-git-archive by using exception catch to
  improve code readability and easy to understand

v4:
  Add new features, merge result files & regression analysis 
  Add selftest to merge, store, report and regression functionalities
  Revise codebase for pythonic
  
v5:
  Add required files for selftest testing store
  
v6:
  Add regression for directory and git repository
  Enable regression pairing base set to multiple target sets 
  Revise selftest testing for regression
  
v7: 
  Optimize regression computation for ptest results
  Rename entry point script to resulttool

Mazliana (1):
  scripts/resulttool: enable manual execution and result creation

Yeoh Ee Peng (1):
  resulttool: enable merge, store, report and regression analysis

 meta/lib/oeqa/files/testresults/testresults.json   |  40 ++++
 meta/lib/oeqa/selftest/cases/resulttooltests.py    | 104 +++++++++++
 scripts/lib/resulttool/__init__.py                 |   0
 scripts/lib/resulttool/manualexecution.py          | 137 ++++++++++++++
 scripts/lib/resulttool/merge.py                    |  71 +++++++
 scripts/lib/resulttool/regression.py               | 208 +++++++++++++++++++++
 scripts/lib/resulttool/report.py                   | 113 +++++++++++
 scripts/lib/resulttool/resultsutils.py             |  67 +++++++
 scripts/lib/resulttool/store.py                    | 110 +++++++++++
 .../resulttool/template/test_report_full_text.txt  |  35 ++++
 scripts/resulttool                                 |  92 +++++++++
 11 files changed, 977 insertions(+)
 create mode 100644 meta/lib/oeqa/files/testresults/testresults.json
 create mode 100644 meta/lib/oeqa/selftest/cases/resulttooltests.py
 create mode 100644 scripts/lib/resulttool/__init__.py
 create mode 100755 scripts/lib/resulttool/manualexecution.py
 create mode 100644 scripts/lib/resulttool/merge.py
 create mode 100644 scripts/lib/resulttool/regression.py
 create mode 100644 scripts/lib/resulttool/report.py
 create mode 100644 scripts/lib/resulttool/resultsutils.py
 create mode 100644 scripts/lib/resulttool/store.py
 create mode 100644 scripts/lib/resulttool/template/test_report_full_text.txt
 create mode 100755 scripts/resulttool

-- 
2.7.4


