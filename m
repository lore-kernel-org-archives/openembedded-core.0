Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RVs8c-0007gD-G4
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 22:56:22 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 30 Nov 2011 13:49:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="81486478"
Received: from unknown (HELO localhost) ([10.255.12.165])
	by orsmga001.jf.intel.com with ESMTP; 30 Nov 2011 13:49:40 -0800
From: Darren Hart <darren@dvhart.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2011 13:49:34 -0800
Message-Id: <cover.1322689519.git.darren@dvhart.com>
X-Mailer: git-send-email 1.7.6.4
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 0/4] Cleanups: grub, autotools, meta-environment
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
X-List-Received-Date: Wed, 30 Nov 2011 21:56:22 -0000

During grub feature development I ran across various bugs, typos, thinkos,
ommisions, etc. that I've collected in this series.

The following changes since commit 2864ff6a4b3c3f9b3bbb6d2597243cc5d3715939:

  getVar/setVar cleanups (2011-11-26 22:42:00 +0000)

are available in the git repository at:
  git://git.yoctoproject.org/user-contrib/dvhart/oe-core cleanup
  http://git.yoctoproject.org/cgit.cgi/user-contrib/dvhart/oe-core/log/?h=cleanup

Darren Hart (4):
  meta-environment: Fix a typo in do_populate_sysroot[noexec]
  autotools.bbclass: Report the missing configure path
  grub: Use COMPATIBLE_MACHINE
  grub: Drop "apply=yes" from patch

 meta/classes/autotools.bbclass             |    9 +++++----
 meta/recipes-bsp/grub/grub_1.99.bb         |   11 +++--------
 meta/recipes-core/meta/meta-environment.bb |    2 +-
 3 files changed, 9 insertions(+), 13 deletions(-)

-- 
1.7.6.4



