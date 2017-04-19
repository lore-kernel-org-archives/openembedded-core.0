Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 9BF0B6025F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 08:57:36 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP; 19 Apr 2017 01:57:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,220,1488873600"; d="scan'208";a="89627724"
Received: from nbayani-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.141.108])
	by orsmga005.jf.intel.com with ESMTP; 19 Apr 2017 01:57:35 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Apr 2017 20:57:26 +1200
Message-Id: <cover.1492592223.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH 0/3] eSDK / runqemu fixes
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
X-List-Received-Date: Wed, 19 Apr 2017 08:57:36 -0000

The following changes since commit ba2884f6ad3a4e746fc80cbd707f83fa8abd4210:

  oe-run-native: print more error messages (2017-04-14 10:26:10 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/esdk-runqemu-fixes
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/esdk-runqemu-fixes

Paul Eggleton (3):
  runqemu: fix incorrect calls to get variable values
  classes/populate_sdk_ext: work around runqemu behaviour within the eSDK
  ext-sdk-prepare.py: use quiet mode when preparing sysroot

 meta/classes/populate_sdk_ext.bbclass | 2 ++
 meta/files/ext-sdk-prepare.py         | 2 +-
 scripts/runqemu                       | 4 ++--
 3 files changed, 5 insertions(+), 3 deletions(-)

-- 
2.9.3


