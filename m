Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T8wPp-0005u4-VF
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 18:55:54 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 04 Sep 2012 09:43:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,367,1344236400"; d="scan'208";a="141382022"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.161])
	by AZSMGA002.ch.intel.com with ESMTP; 04 Sep 2012 09:43:29 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Sep 2012 17:43:24 +0100
Message-Id: <cover.1346776916.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/2] Package group fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Sep 2012 16:55:54 -0000

Fix a couple of things missed in the package group changes.


The following changes since commit 92f8605b81d373b66224b15355226f93ac5b3a46:

  udev: Remove files moved to udev-extraconf (2012-09-04 15:41:01 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/packagegroup-fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/packagegroup-fixes

Paul Eggleton (2):
  packagegroup-core-standalone-gmae-sdk-target: allow dbg package
  packagegroup-*: add RREPLACES/RCONFLICTS

 .../packagegroups/packagegroup-core-boot.bb        |    4 +++-
 .../packagegroups/packagegroup-core-nfs.bb         |    4 +++-
 .../packagegroups/packagegroup-core-sdk.bb         |    4 +++-
 .../packagegroup-core-ssh-dropbear.bb              |    4 +++-
 .../packagegroups/packagegroup-core-ssh-openssh.bb |    4 +++-
 .../packagegroup-core-standalone-sdk-target.bb     |    6 +++++-
 .../packagegroups/packagegroup-core-tools-debug.bb |    4 +++-
 .../packagegroup-core-tools-profile.bb             |    4 ++++
 .../packagegroup-core-tools-testapps.bb            |    4 ++++
 .../packagegroup-core-device-devel.bb              |    3 +++
 .../packagegroups/packagegroup-core-sdk-gmae.bb    |    4 +++-
 ...packagegroup-core-standalone-gmae-sdk-target.bb |    6 +++---
 .../packagegroups/packagegroup-core-clutter.bb     |    4 +++-
 .../packagegroup-core-gtk-directfb.bb              |    4 +++-
 .../packagegroups/packagegroup-core-x11-base.bb    |    4 +++-
 .../packagegroups/packagegroup-core-qt.bb          |    4 +++-
 .../packagegroups/packagegroup-core-qt4e.bb        |    4 +++-
 .../packagegroups/packagegroup-core-x11-sato.bb    |    4 +++-
 18 files changed, 58 insertions(+), 17 deletions(-)

-- 
1.7.9.5



