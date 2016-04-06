Return-Path: <humberto.ibarra.lopez@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6AEC2770D8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Apr 2016 19:08:50 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 05 Apr 2016 12:08:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,445,1455004800"; d="scan'208";a="778683004"
Received: from jhibarra-desk.zpn.intel.com ([10.219.17.169])
	by orsmga003.jf.intel.com with ESMTP; 05 Apr 2016 12:08:52 -0700
From: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Apr 2016 22:15:51 -0500
Message-Id: <1459912554-1192-1-git-send-email-humberto.ibarra.lopez@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/3] handle issues with coverage file when coverage is not installed
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
X-List-Received-Date: Tue, 05 Apr 2016 19:08:51 -0000

Coverage subprocessing setup used to require user intervention. However,
after bug Yocto #8930 was fixed, this was changed and it is now automatically
controlled.

Error and warning messages remained that are not longer valid, and needed to be
removed. One of these issues was caused by a file introduced in that bug (8930).

This series handles all these issues caused by #8930. 


Humberto Ibarra (3):
  scripts/oe-selftest: remove unneeded coverage warning
  scripts/oe-selftest: remove coverage file if any coverage option is
    given
  scripts/oe-selftest: avoid the creation of coverage file when coverage
    not installed

 scripts/oe-selftest | 61 ++++++++++++++++++++++++++---------------------------
 1 file changed, 30 insertions(+), 31 deletions(-)

-- 
2.1.4


