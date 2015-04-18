Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 618567162E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Apr 2015 03:06:05 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 Apr 2015 20:06:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,598,1422950400"; d="scan'208";a="711239188"
Received: from achsu-mobl2.amr.corp.intel.com (HELO
	swold-mobl.amr.corp.intel.com) ([10.254.72.158])
	by fmsmga002.fm.intel.com with ESMTP; 17 Apr 2015 20:06:06 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Fri, 17 Apr 2015 20:06:04 -0700
Message-Id: <1429326365-25767-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] Dpkg: Fix broken patch
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
X-List-Received-Date: Sat, 18 Apr 2015 03:06:06 -0000

Richard,

Major mia culpa! 

I tested sgw/dizzy and then manged to push another patch from a different branch, I had this
patch queued up and it ran on the AB before I pushed the wrong branch.

Please pull this patch (it's the correct one), and reset the Build Appliance SRCREV, I 
will try to start an RC2 build this weekend.

Sau!


Saul Wold (1):
  dpkg: Fix patch to adjust for older code

 .../dpkg/dpkg/tar-error-code.patch                 | 27 +++++++++++-----------
 1 file changed, 14 insertions(+), 13 deletions(-)

-- 
2.1.0


