Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T9Gr3-00007V-89
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Sep 2012 16:45:21 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 05 Sep 2012 07:32:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,374,1344236400"; d="scan'208";a="218385947"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.252])
	by fmsmga001.fm.intel.com with ESMTP; 05 Sep 2012 07:32:57 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Sep 2012 07:32:56 -0700
Message-Id: <cover.1346855361.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [CONSOLIDATED REQUEST 0/5] Packagegroup updates
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
X-List-Received-Date: Wed, 05 Sep 2012 14:45:21 -0000

Richard,

These are some changes that have been run through the AB
with the pre-RC1 build.

Thanks
	Sau!

The following changes since commit da9b66ddde02ec19f3f83f23eb2b595af9a57520:

  build-appliance-image: Update to latest poky master (2012-09-04 18:04:32 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Bruce Ashfield (1):
  linux-yocto-rt: 3.4.9-rt17 remaining changes

Martin Jansa (1):
  packagegroup-core-x11: split machine specific parts to separate
    recipe packagegroup-core-x11-server

Paul Eggleton (3):
  packagegroup-(base|core-basic): add RREPLACES/RCONFLICTS
  build-appliance-image: fix for packagegroup-apps-console removal
  packagegroup-core-x11: add upgrade path from meta-oe task-x11*

 meta/conf/layer.conf                               |    1 +
 meta/recipes-core/images/build-appliance-image.bb  |    4 +-
 .../packagegroups/packagegroup-base.bb             |   10 +++-----
 .../packagegroups/packagegroup-core-basic.bb       |    4 ++-
 .../packagegroups/packagegroup-core-x11-xserver.bb |   24 ++++++++++++++++++++
 .../packagegroups/packagegroup-core-x11.bb         |   21 ++++++++---------
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb    |    4 +-
 7 files changed, 46 insertions(+), 22 deletions(-)
 create mode 100644 meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb

-- 
1.7.7.6



