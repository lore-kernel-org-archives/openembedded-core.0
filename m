Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jiajun.xu@intel.com>) id 1RWV8p-00041o-Ob
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 16:35:12 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Dec 2011 07:27:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,284,1320652800"; d="scan'208";a="81549107"
Received: from unknown (HELO localhost) ([10.239.48.201])
	by azsmga001.ch.intel.com with ESMTP; 02 Dec 2011 07:27:21 -0800
From: Jiajun Xu <jiajun.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Dec 2011 23:48:37 +0800
Message-Id: <cover.1322840490.git.jiajun.xu@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/3] ltp: Add recipe from OE
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
X-List-Received-Date: Fri, 02 Dec 2011 15:35:12 -0000

The pull request is to address [YOCTO #1568] - "Add recipe for ltp/posix tests and automate test".
ltp is ported from OE and updated to latest version(20110915). Testcases are installed 
to ${D}/opt/ltp and POISX test suite is also copied into ${D}/opt/ltp/testcases folder. 
Include ltp to testapps list.

Note that some cases are removed from ltp since they depend on expect. Currently
there is no expect recipe in OE and we will add it for enhancement next.

The following changes since commit e57935dc18d576feb1003b48e7cdc72a444131b8:

  Revert "classes/buildhistory: add new output history collection class" (2011-12-01 23:00:52 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib jxu49/oe-contrib
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jxu49/oe-contrib

Jiajun Xu (3):
  ltp: Add recipe from OE
  distro_tracking_fields: add information for ltp
  task-core-tools: add ltp to testapps list

 .../conf/distro/include/distro_tracking_fields.inc |    8 +++
 meta/recipes-core/tasks/task-core-tools.bb         |    3 +-
 meta/recipes-extended/ltp/ltp_20110915.bb          |   67 ++++++++++++++++++++
 3 files changed, 77 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-extended/ltp/ltp_20110915.bb



