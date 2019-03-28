Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 959FE7D163
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 05:25:33 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Mar 2019 22:25:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,278,1549958400"; d="scan'208";a="129330439"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga008.jf.intel.com with ESMTP; 27 Mar 2019 22:25:33 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Mar 2019 12:54:32 +0800
Message-Id: <1553748873-50143-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v02] resulttool/merge: enhance merge and control testseries
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
X-List-Received-Date: Thu, 28 Mar 2019 05:25:33 -0000

v01:
Enable merging results where both base and target are directory. 

v02:
Follow suggestion from RP to reused the existing resultutils
code base where it will merge results to flat file. 
Refactor resultutils code base to enable merging results where both
base and target are directory. 
Add control for creation of testseries configuration. 

Yeoh Ee Peng (1):
  resulttool/merge: Merge files from folders and control add testseries

 meta/lib/oeqa/selftest/cases/resulttooltests.py |  16 ++--
 scripts/lib/resulttool/merge.py                 |  29 ++++--
 scripts/lib/resulttool/regression.py            |  10 +-
 scripts/lib/resulttool/report.py                |   6 +-
 scripts/lib/resulttool/resultutils.py           | 118 +++++++++++++++---------
 scripts/lib/resulttool/store.py                 |   5 +-
 6 files changed, 112 insertions(+), 72 deletions(-)

-- 
2.7.4


