Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1QuXes-0003Mr-10
	for openembedded-core@lists.openembedded.org;
	Sat, 20 Aug 2011 00:35:22 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Aug 2011 15:30:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="39592233"
Received: from unknown (HELO scimitar.amr.corp.intel.com) ([10.255.14.3])
	by orsmga002.jf.intel.com with ESMTP; 19 Aug 2011 15:30:39 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Aug 2011 15:30:32 -0700
Message-Id: <cover.1313792370.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/1] Fix building BlueZ
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
X-List-Received-Date: Fri, 19 Aug 2011 22:35:22 -0000

Quick hit and run patch to enable bluez to build.

I believe Martin is going to check whether usbpath is desirable for oe-core.

Cheers,
Joshua

The following changes since commit c539155c51e43680711130df9050d3e92282591e:

  newt: update distro tracking fields (2011-08-19 09:05:54 -0700)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib josh/work
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/work

Joshua Lock (1):
  bluez4: drop usbpath from DEPENDS

 meta/recipes-connectivity/bluez/bluez4_4.96.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

-- 
1.7.6



