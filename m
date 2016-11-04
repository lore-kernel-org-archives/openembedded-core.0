Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1C26F6E64A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Nov 2016 13:16:45 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga102.jf.intel.com with ESMTP; 04 Nov 2016 06:16:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,443,1473145200"; d="scan'208";a="27778559"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 04 Nov 2016 06:16:46 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id B98B42C8001;
	Fri,  4 Nov 2016 06:16:09 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Nov 2016 15:16:42 +0200
Message-Id: <cover.1478258311.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/1] run-postinsts: Use opkg/dpkg to configure when possible
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
X-List-Received-Date: Fri, 04 Nov 2016 13:16:46 -0000

run-postinst has not been using package managers to configure the
packages: the code was there all along but a bug prevented it from
being used.

I was hesitating sending this a bit as it felt quite difficult to test
comprehensively and the change is not completely trivial: as an example
the order of postinsts will likely change as it's now handled by the
package manager instead of OE. I can still run more tests if anyone
has good ideas...



Cheers, 
  Jussi


The following changes since commit c3d2df883a9d6d5036277114339673656d89a728:

  oeqa/selftest/kernel.py: Add new file destined for kernel related tests (2016-11-01 10:05:46 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/10478
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/10478

Jussi Kukkonen (1):
  run-postinsts: Use opkg/dpkg to configure when possible

 .../recipes-devtools/run-postinsts/run-postinsts/run-postinsts | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

-- 
2.1.4


