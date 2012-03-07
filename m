Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1S5Bcs-0000At-Db
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Mar 2012 08:49:34 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 06 Mar 2012 23:40:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="115733665"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.62])
	by azsmga001.ch.intel.com with ESMTP; 06 Mar 2012 23:40:55 -0800
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Mar 2012 15:36:42 +0800
Message-Id: <cover.1331105701.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1] Added sanity check for PRservice
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
X-List-Received-Date: Wed, 07 Mar 2012 07:49:34 -0000

This patch fixed yocto bug #2052 by adding sanity check of PRService 
related variables.

The following changes since commit d7b8c247227f3cc82f92292407f548927e9fde78:
  Richard Purdie (1):
        base.bbclass: Fix PACKAGECONFIG handling when no flags are set

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib llu/bug2052
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/bug2052

Lianhao Lu (1):
  prservice: Added sanity check for prservice connection.

 meta/classes/prexport.bbclass |    4 +++-
 meta/classes/primport.bbclass |    3 +++
 meta/lib/oe/prservice.py      |   18 +++++++++++++++++-
 3 files changed, 23 insertions(+), 2 deletions(-)



