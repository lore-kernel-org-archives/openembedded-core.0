Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0F13C7C099
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jan 2019 09:32:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Jan 2019 01:23:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,505,1539673200"; d="scan'208";a="116442361"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga007.fm.intel.com with ESMTP; 22 Jan 2019 01:23:23 -0800
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Jan 2019 16:52:08 +0800
Message-Id: <1548147130-59459-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/2 v4] test-case-mgmt
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
X-List-Received-Date: Tue, 22 Jan 2019 09:32:58 -0000
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

Mazliana (1):
  scripts/resultstool: enable manual execution and result creation

Yeoh Ee Peng (1):
  resultstool: enable merge, store, report and regression analysis

 meta/lib/oeqa/selftest/cases/resultstooltests.py   | 104 ++++++++++++++++
 scripts/lib/resultstool/__init__.py                |   0
 scripts/lib/resultstool/manualexecution.py         | 137 +++++++++++++++++++++
 scripts/lib/resultstool/merge.py                   |  71 +++++++++++
 scripts/lib/resultstool/regression.py              | 134 ++++++++++++++++++++
 scripts/lib/resultstool/report.py                  | 122 ++++++++++++++++++
 scripts/lib/resultstool/resultsutils.py            |  47 +++++++
 scripts/lib/resultstool/store.py                   | 110 +++++++++++++++++
 .../resultstool/template/test_report_full_text.txt |  35 ++++++
 scripts/resultstool                                |  92 ++++++++++++++
 10 files changed, 852 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/resultstooltests.py
 create mode 100644 scripts/lib/resultstool/__init__.py
 create mode 100644 scripts/lib/resultstool/manualexecution.py
 create mode 100644 scripts/lib/resultstool/merge.py
 create mode 100644 scripts/lib/resultstool/regression.py
 create mode 100644 scripts/lib/resultstool/report.py
 create mode 100644 scripts/lib/resultstool/resultsutils.py
 create mode 100644 scripts/lib/resultstool/store.py
 create mode 100644 scripts/lib/resultstool/template/test_report_full_text.txt
 create mode 100755 scripts/resultstool

-- 
2.7.4


