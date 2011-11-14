Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RQ6FP-0005bN-PL
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2011 00:47:31 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 14 Nov 2011 15:41:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="75339855"
Received: from miles.jf.intel.com (HELO localhost) ([10.7.199.81])
	by orsmga002.jf.intel.com with ESMTP; 14 Nov 2011 15:41:08 -0800
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Nov 2011 15:41:06 -0800
Message-Id: <cover.1321313978.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/1] Manual recipe version checks
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
X-List-Received-Date: Mon, 14 Nov 2011 23:47:32 -0000

Here are some updates for the distro_tracking.inc file for recipes that
require manual version checks.

The following changes since commit f2316ff39670ed99382411e15ac035550360fbdd:

  opkg: Ensure we use the uname/gname fields when extracting tarballs (2011-11-14 11:15:36 +0000)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib sgarman/recipe-manual-checks
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=sgarman/recipe-manual-checks

Scott Garman (1):
  distro_tracking: update manual checks for various recipes

 .../conf/distro/include/distro_tracking_fields.inc |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

-- 
1.7.5.4



