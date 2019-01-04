Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id BB9D87BDCB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Jan 2019 07:17:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Jan 2019 23:17:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,437,1539673200"; d="scan'208";a="123191431"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga002.jf.intel.com with ESMTP; 03 Jan 2019 23:17:20 -0800
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Jan 2019 14:46:00 +0800
Message-Id: <1546584363-72836-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/3 v3] test-case-mgmt
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
X-List-Received-Date: Fri, 04 Jan 2019 07:17:20 -0000
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

Mazliana (1):
  scripts/test-case-mgmt: enable manual execution and result creation

Yeoh Ee Peng (2):
  scripts/oe-git-archive: fix non-existent key referencing error
  scripts/test-case-mgmt: store test result and reporting

 scripts/lib/testcasemgmt/__init__.py               |   0
 scripts/lib/testcasemgmt/gitstore.py               | 172 +++++++++++++++++++++
 scripts/lib/testcasemgmt/manualexecution.py        | 142 +++++++++++++++++
 scripts/lib/testcasemgmt/report.py                 | 136 ++++++++++++++++
 scripts/lib/testcasemgmt/store.py                  |  40 +++++
 .../template/test_report_full_text.txt             |  33 ++++
 scripts/oe-git-archive                             |  19 ++-
 scripts/test-case-mgmt                             | 105 +++++++++++++
 8 files changed, 641 insertions(+), 6 deletions(-)
 create mode 100644 scripts/lib/testcasemgmt/__init__.py
 create mode 100644 scripts/lib/testcasemgmt/gitstore.py
 create mode 100644 scripts/lib/testcasemgmt/manualexecution.py
 create mode 100644 scripts/lib/testcasemgmt/report.py
 create mode 100644 scripts/lib/testcasemgmt/store.py
 create mode 100644 scripts/lib/testcasemgmt/template/test_report_full_text.txt
 create mode 100755 scripts/test-case-mgmt

-- 
2.7.4


