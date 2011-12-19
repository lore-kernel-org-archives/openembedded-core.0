Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1RclOf-00013L-FI
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 23:09:27 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Dec 2011 14:02:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="89247812"
Received: from envy.jf.intel.com ([10.7.201.175])
	by orsmga002.jf.intel.com with ESMTP; 19 Dec 2011 14:02:20 -0800
From: Beth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Dec 2011 13:50:20 -0800
Message-Id: <cover.1324331298.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/1] Manifest inclusion on image fix.
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
X-List-Received-Date: Mon, 19 Dec 2011 22:09:27 -0000

The manifest conditionals COPY_LIC_MANIFEST and COPY_LIC_DIRS
were returning true due to missing quotes in the bash test. This
made images larger than expected.

The following changes since commit 45987c5135d22757ed2eb06b37e192d73309f59f:

  eglibc: Fixes for running regression tests (2011-12-19 09:29:18 +0000)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib eflanagan/manifest
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=eflanagan/manifest

Beth Flanagan (1):
  license: Fix manifest conditional

 meta/classes/license.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)



