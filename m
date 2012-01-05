Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1RigdE-0000hJ-7R
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 07:16:56 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 04 Jan 2012 22:09:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="94658957"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by orsmga002.jf.intel.com with ESMTP; 04 Jan 2012 22:09:20 -0800
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2012 13:57:04 +0800
Message-Id: <cover.1325742856.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/1] matchbox-wm: remove x-session-manager handling
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
X-List-Received-Date: Thu, 05 Jan 2012 06:16:56 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

This is V2 version that made clear commit mesg and adjust alternative priority
to make mini-x has high priority over matchbox-session according to Saul's
suggestion.

Thanks,
Edwin


The following changes since commit 021848be9eeb71de8acfba6c66c11645b01523b8:

  valgrind: Fix for automake update (2012-01-04 16:04:08 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib gzhai/master2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/master2

Zhai Edwin (1):
  matchbox-wm: Remove x-session-manager handling

 .../matchbox-wm/matchbox-wm_1.2.bb                 |    9 ++-------
 .../matchbox-wm/matchbox-wm_git.bb                 |    9 ++-------
 .../mini-x-session/mini-x-session_0.1.bb           |    2 +-
 3 files changed, 5 insertions(+), 15 deletions(-)



