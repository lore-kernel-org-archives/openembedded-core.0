Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jiajun.xu@intel.com>) id 1RdP5f-0006NM-3j
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 17:32:27 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 21 Dec 2011 08:24:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="104697239"
Received: from unknown (HELO localhost) ([10.239.48.201])
	by fmsmga002.fm.intel.com with ESMTP; 21 Dec 2011 08:24:12 -0800
From: Jiajun Xu <jiajun.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Dec 2011 00:45:53 +0800
Message-Id: <cover.1324485726.git.jiajun.xu@intel.com>
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
X-List-Received-Date: Wed, 21 Dec 2011 16:32:27 -0000

The pull request is to address [YOCTO #1568] - "Add recipe for ltp/posix tests and automate test".
ltp is ported from OE and updated to latest version(20110915). Testcases are installed to 
${D}/opt/ltp and POISX test suite is also copied into ${D}/opt/ltp/testcases folder. We 
include ltp to testapps list by default.

Note that some cases are removed from ltp since they depend on expect. Currently there is 
no expect recipe in OE and we will add it for enhancement next.

The following changes since commit ae4118a1f78f113c3d687c3aa6a86007cf977cae:

  libsdl 1.2.14: fix packaging (2011-12-19 12:17:36 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib jxu49/oe-contrib
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jxu49/oe-contrib

Jiajun Xu (3):
  ltp: Add recipe from OE
  distro_tracking_fields: add information for ltp
  task-core-tools: add ltp to testapps list

 .../conf/distro/include/distro_tracking_fields.inc |    8 ++
 meta/recipes-core/tasks/task-core-tools.bb         |    3 +-
 meta/recipes-extended/ltp/ltp_20110915.bb          |   68 ++++++++++++++++++++
 3 files changed, 78 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-extended/ltp/ltp_20110915.bb



