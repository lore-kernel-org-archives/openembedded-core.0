Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SmpmE-0002vC-Gd
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 19:23:38 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 05 Jul 2012 10:12:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="161778212"
Received: from miles.jf.intel.com (HELO localhost) ([10.7.199.51])
	by orsmga001.jf.intel.com with ESMTP; 05 Jul 2012 10:12:25 -0700
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jul 2012 10:12:19 -0700
Message-Id: <cover.1341508255.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/2] runqemu minor fixes
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
X-List-Received-Date: Thu, 05 Jul 2012 17:23:38 -0000

Hello,

These two commits fix yocto bug #2611.

Scott

The following changes since commit dcc43c34bfa9304233ecfd3f518a84ddfdc2fd90:

  perf: remove unconditional python-ext install (2012-07-05 15:56:17 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib sgarman/runqemu-minor-fixes-oe
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=runqemu-minor-fixes-oe

Scott Garman (2):
  runqemu: fix support for ext4 rootfs images
  runqemu: fix usage() help for MACHINE setting

 scripts/runqemu |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.9.5



