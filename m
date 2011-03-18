Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Q0Zyb-0005bC-9h
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Mar 2011 14:44:25 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 18 Mar 2011 06:41:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,205,1299484800"; d="scan'208";a="404679145"
Received: from unknown (HELO localhost) ([10.255.16.25])
	by azsmga001.ch.intel.com with ESMTP; 18 Mar 2011 06:41:29 -0700
Message-Id: <cover.1300455579.git.josh@linux.intel.com>
Old-Date: Fri, 18 Mar 2011 13:39:39 +0000
Date: Fri, 18 Mar 2011 13:41:23 +0000
To: openembedded-core@lists.openembedded.org
CC: 
From: Joshua Lock <josh@linux.intel.com>
Subject: [PATCH 0/1] Sanity check for duplicate PACKAGE_ARCHS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Mar 2011 13:44:25 -0000

From: Joshua Lock <josh@linux.intel.com>

I have had some pain this morning caused by duplicated entries in my
PACKAGE_ARCHS variable. After Richard helped me debug this he suggest we
add a sanity check for this issue.

Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: josh/pkgarch
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/pkgarch

Thanks,
    Joshua Lock <josh@linux.intel.com>
---


Joshua Lock (1):
  sanity.bbclass: check for duplicates in PACKAGE_ARCHS

 meta/classes/sanity.bbclass |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

-- 
1.7.4



