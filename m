Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 97E627D434
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Apr 2019 09:19:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2019 02:19:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,306,1549958400"; d="scan'208";a="132890980"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga006.jf.intel.com with ESMTP; 04 Apr 2019 02:19:37 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Apr 2019 16:48:34 +0800
Message-Id: <1554367718-74682-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/4] resulttool/manualexecution: Enhancement and fixes
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
X-List-Received-Date: Thu, 04 Apr 2019 09:19:37 -0000

These series of patches include enhancement and fixes for manualexecution:
 - Enhance input check to standardize checking
 - Enhancement to display full steps without press enter 
 - Fix test steps display order
 - Refactor to simplify code and align to pythonic style

Yeoh Ee Peng (4):
  resulttool/manualexecution: Standardize input check
  resulttool/manualexecution: Enable display full steps without press
    enter
  resulttool/manualexecution: Fixed step sorted by integer
  resulttool/manualexecution: Refactor and simplify codebase

 scripts/lib/resulttool/manualexecution.py | 61 ++++++++++++-------------------
 1 file changed, 23 insertions(+), 38 deletions(-)

-- 
2.7.4


