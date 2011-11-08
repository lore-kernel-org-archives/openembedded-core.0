Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RNr8t-000261-RE
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 20:15:32 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 08 Nov 2011 11:09:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,477,1315206000"; d="scan'208";a="87596167"
Received: from unknown (HELO localhost) ([10.255.12.17])
	by fmsmga002.fm.intel.com with ESMTP; 08 Nov 2011 11:09:06 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	tom_rini@mentor.com
Date: Tue,  8 Nov 2011 11:08:48 -0800
Message-Id: <cover.1320779076.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [PATCH 0/1] ncurses: refactor configure to avoid configuring widec when disabled
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
X-List-Received-Date: Tue, 08 Nov 2011 19:15:32 -0000

The following changes since commit e5226b1e44052b2fe5370f4922397a1d68985aaf:

  clutter-1.8: add bbappend for new clutter-1.8 recipe (2011-11-08 17:53:18 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dvhart/tiny
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dvhart/tiny

Darren Hart (1):
  ncurses: refactor configure to avoid configuring widec when disabled

 meta/recipes-core/ncurses/ncurses.inc |   64 +++++++++++++++++---------------
 1 files changed, 34 insertions(+), 30 deletions(-)

-- 
1.7.6.4



