Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 333556C397
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jan 2019 07:54:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Jan 2019 23:54:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,434,1539673200"; d="scan'208";a="307091593"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga006.fm.intel.com with ESMTP; 02 Jan 2019 23:54:33 -0800
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Jan 2019 15:23:12 +0800
Message-Id: <1546500195-57586-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/3] test-case-mgmt
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
X-List-Received-Date: Thu, 03 Jan 2019 07:54:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

v1:
  Face key error from oe-git-archive
  Undesirable behavior when storing to multiple git branch

v2: 
  Include fix for oe-git-archive
  Include fix for store result to multiple git branch
  Improve git commit message   

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
 scripts/oe-git-archive                             |  28 +++-
 scripts/test-case-mgmt                             | 105 +++++++++++++
 8 files changed, 650 insertions(+), 6 deletions(-)
 create mode 100644 scripts/lib/testcasemgmt/__init__.py
 create mode 100644 scripts/lib/testcasemgmt/gitstore.py
 create mode 100644 scripts/lib/testcasemgmt/manualexecution.py
 create mode 100644 scripts/lib/testcasemgmt/report.py
 create mode 100644 scripts/lib/testcasemgmt/store.py
 create mode 100644 scripts/lib/testcasemgmt/template/test_report_full_text.txt
 create mode 100755 scripts/test-case-mgmt

-- 
2.7.4


