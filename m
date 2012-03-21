Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SAID2-0005tP-To
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 10:52:01 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 21 Mar 2012 02:42:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="79909658"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.110])
	by AZSMGA002.ch.intel.com with ESMTP; 21 Mar 2012 02:42:49 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Mar 2012 17:41:04 +0800
Message-Id: <cover.1332315222.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1] change name of lttng-ust from lttng-2.0
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
X-List-Received-Date: Wed, 21 Mar 2012 09:52:01 -0000

This patch change the recipe name of lttng-ust from lttng-2.0 to lttng2-ust, 
so the lttng-ust(s) from both the old lttng and the new lttng-2.0 can coexist.

The following changes since commit 5d404fdb36b0535ce758d98408b02134cdbce4ee:
  Lauri Hintsala (1):
        xserver-kdrive: compile xserver without dtrace support

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib llu/bug2062
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/bug2062

Lianhao Lu (1):
  lttng-2.0/lttng-ust: Change recipe name to lttng2-ust.

 .../lttng-2.0/lttng-tools_2.0-pre16.bb             |    2 +-
 .../{lttng-ust_1.9.4.bb => lttng2-ust_1.9.4.bb}    |    0
 2 files changed, 1 insertions(+), 1 deletions(-)
 rename meta/recipes-kernel/lttng-2.0/{lttng-ust_1.9.4.bb => lttng2-ust_1.9.4.bb} (100%)



