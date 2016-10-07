Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id AEB2960620
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Oct 2016 03:10:46 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP; 06 Oct 2016 20:10:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,454,1473145200"; d="scan'208";a="17149604"
Received: from pequod.jf.intel.com ([10.7.201.50])
	by orsmga005.jf.intel.com with ESMTP; 06 Oct 2016 20:10:48 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Oct 2016 20:09:46 -0700
Message-Id: <20161007030947.12602-1-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.10.0
Subject: [PATCH V2] Cleanup subprocess calls
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
X-List-Received-Date: Fri, 07 Oct 2016 03:10:47 -0000

Changed since V1: 
changed smart_opt to an array and fixed the effected functions
cleaned up _invoke_smart calls to use arrays

Note that there is still some work to do on this file in terms of
subprocess calls, which I will create a bug for, but that this is a
good stopping point for M4.

Stephano Cetola (1):
  subprocess: remove strings and migrate to direct arrays

 meta/lib/oe/distro_check.py    |   2 +-
 meta/lib/oe/package.py         |  13 +--
 meta/lib/oe/package_manager.py | 218 ++++++++++++++++++++---------------------
 3 files changed, 114 insertions(+), 119 deletions(-)

-- 
2.10.0


