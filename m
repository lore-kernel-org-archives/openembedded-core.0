Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QQ4KO-0007Kg-4I
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 23:12:16 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 May 2011 14:09:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,282,1304319600"; 
   d="scan'208";a="8750405"
Received: from swold-mobl.jf.intel.com ([10.24.82.108])
	by fmsmga002.fm.intel.com with ESMTP; 27 May 2011 14:09:09 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 May 2011 14:09:07 -0700
Message-Id: <cover.1306530446.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH 0/1] Fix for build failure of xserver on mpc build
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
X-List-Received-Date: Fri, 27 May 2011 21:12:16 -0000

This fixes a problem with the MPC building the xserver-xf86-lite

The following changes since commit 4786ecdf7cd427089464dcb62579110d494e7cd7:

  License Field Cleanup: Non-standard field names (2011-05-27 18:27:04 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/dlfix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/dlfix

Yu Ke (1):
  xserver: force to use libdl

 .../xorg-xserver/files/force-libdl.patch           |   19 +++++++++++++++++++
 .../xorg-xserver/xserver-xf86-lite_1.10.1.bb       |    5 +++--
 2 files changed, 22 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-xserver/files/force-libdl.patch

-- 
1.7.3.4



