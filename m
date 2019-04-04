Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 65E9D7D42E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Apr 2019 03:11:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Apr 2019 20:01:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,306,1549958400"; d="scan'208";a="220388001"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga001.jf.intel.com with ESMTP; 03 Apr 2019 20:01:36 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Apr 2019 10:30:34 +0800
Message-Id: <1554345037-72697-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v03] resulttool/merge: enhance merge and control testseries
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
X-List-Received-Date: Thu, 04 Apr 2019 03:11:06 -0000

v01:
Enable merging results where both base and target are directory. 

v02:
Follow suggestion from RP to reused the existing resultutils code base where it will merge results to flat file. 
Refactor resultutils code base to enable merging results where both base and target are directory. 
Add control for creation of testseries configuration. 

v03:
Follow suggestion from RP to breakdown the patches to ease reviewing. 
Enable resultutils library to control the adding of "TESTSERIES"
configuration as well as allow adding extra configurations when needed.
Enable store to add "EXECUTED_BY" configuration to track who executed 
each results file. 
Enable merge to control the adding of "TESTSERIES" configuration 
as well as allow adding "EXECUTED_BY" configuration when needed.

Yeoh Ee Peng (3):
  resulttool/resultutils: Enable add extra configurations to results
  resulttool/store: Enable add EXECUTED_BY config to results
  resulttool/merge: Enable control TESTSERIES and extra configurations

 scripts/lib/resulttool/merge.py       | 20 ++++++++++++++------
 scripts/lib/resulttool/resultutils.py | 19 ++++++++++++-------
 scripts/lib/resulttool/store.py       |  7 ++++++-
 3 files changed, 32 insertions(+), 14 deletions(-)

-- 
2.7.4


