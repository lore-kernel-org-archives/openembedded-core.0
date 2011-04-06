Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Q7Qex-0006qK-O4
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Apr 2011 13:12:28 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 06 Apr 2011 04:10:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,309,1299484800"; d="scan'208";a="729812243"
Received: from unknown (HELO localhost) ([10.255.12.213])
	by orsmga001.jf.intel.com with ESMTP; 06 Apr 2011 04:10:19 -0700
Message-Id: <cover.1302087686.git.josh@linux.intel.com>
Old-Date: Wed, 6 Apr 2011 12:01:26 +0100
Date: Wed, 06 Apr 2011 12:10:17 +0100
To: openembedded-core@lists.openembedded.org
CC: 
From: Joshua Lock <josh@linux.intel.com>
Subject: [PATCH 0/1] Fix elfutils-native with GCC 4.6
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
X-List-Received-Date: Wed, 06 Apr 2011 11:12:28 -0000

From: Joshua Lock <josh@linux.intel.com>

Unfortunately I'm currently unable to test this on a machine with GCC version
other than 4.6 but thought it was worth getting this patch out there as I'll
be in the air and travelling until next week.

Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: josh/elfutils
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/elfutils

Thanks,
    Joshua Lock <josh@linux.intel.com>
---


Joshua Lock (1):
  elfutils: remove unused variables to fix compilation with GCC 4.6

 .../elfutils/elfutils-0.148/remove-unused.patch    |  152 ++++++++++++++++++++
 meta/recipes-devtools/elfutils/elfutils_0.148.bb   |    3 +-
 2 files changed, 154 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.148/remove-unused.patch

-- 
1.7.4.1



