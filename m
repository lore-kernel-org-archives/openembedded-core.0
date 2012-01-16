Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1Rml7L-0005g5-0Q
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jan 2012 12:52:51 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 Jan 2012 03:45:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="99038463"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.146])
	by orsmga002.jf.intel.com with ESMTP; 16 Jan 2012 03:45:13 -0800
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jan 2012 19:43:07 +0800
Message-Id: <cover.1326714004.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1] gcc support shared source for basichash
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
X-List-Received-Date: Mon, 16 Jan 2012 11:52:51 -0000

This is part of the Yocto Bug #1555 fixing.

We use ".done" file along with the task lockfile to allow multiple 
gcc-related recipes sharing the same source directory when basichash 
is used as the default signature handler.

The following changes since commit bd047935305c872b565f30b46c94b7077e5fb3a2:
  Richard Purdie (1):
        patch.bbclass: Ensure the DATE and SRCDATE variable exclusions apply to the correct function

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib llu/bug1555-gcc
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/bug1555-gcc

Lianhao Lu (1):
  gcc-common.inc: Added shared source support for basichash.

 meta/recipes-devtools/gcc/gcc-common.inc |   56 ++++++++++++++++++++++++++++++
 1 files changed, 56 insertions(+), 0 deletions(-)



