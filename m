Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RLME4-0004AC-RU
	for openembedded-core@lists.openembedded.org;
	Tue, 01 Nov 2011 22:50:33 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 01 Nov 2011 14:44:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,440,1315206000"; d="scan'208";a="69447598"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.200])
	by azsmga001.ch.intel.com with ESMTP; 01 Nov 2011 14:44:22 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Nov 2011 14:44:16 -0700
Message-Id: <cover.1320183757.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [Pull v2 0/4] convert these recipes to adduser bbclass
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
X-List-Received-Date: Tue, 01 Nov 2011 21:50:33 -0000


Richard,

So I ended up just hardcoding the xuser and unconditionally 
creating that user in xserver and connman recipes.  There
might be an alternative, but it will require more time to devlop.

V2: Fixed audioi -> audio (per Martin's email)
    PR Bumps updated

Sau!

The following changes since commit d0a2c87d068f2d769d47c8455bb1434b90a7a844:

  Fix HOMEPAGE values in libzypp and sat-solver .bb files (2011-11-01 18:28:06 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fix

Saul Wold (4):
  avahi: use useradd to create user
  xserver-nodm-init: Add xuser (hardcoded)
  connman: create xuser
  dbus: fix up ADDUSER_PARAMS

 meta/recipes-connectivity/avahi/avahi.inc          |   15 +++++----
 meta/recipes-connectivity/connman/connman.inc      |    7 ++++-
 meta/recipes-connectivity/connman/connman_0.75.bb  |    2 +-
 meta/recipes-core/dbus/dbus.inc                    |    3 +-
 .../x11-common/xserver-nodm-init.bb                |   30 +++++++------------
 5 files changed, 28 insertions(+), 29 deletions(-)

-- 
1.7.6.4



