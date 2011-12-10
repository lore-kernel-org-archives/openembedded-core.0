Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1RZQRZ-00030X-4X
	for openembedded-core@lists.openembedded.org;
	Sat, 10 Dec 2011 18:10:37 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 10 Dec 2011 09:03:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="84333961"
Received: from unknown (HELO cenodoxus.amr.corp.intel.com) ([10.255.15.144])
	by azsmga001.ch.intel.com with ESMTP; 10 Dec 2011 09:03:43 -0800
From: Beth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 10 Dec 2011 09:03:34 -0800
Message-Id: <cover.1323536396.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/1] [YOCTO #1819] License addtask PR bump failure
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
X-List-Received-Date: Sat, 10 Dec 2011 17:10:37 -0000

Changing back addtask of do_populate_lic as it does not need to be 
before do_compile and the change causes updated recipes to fail,
requiring a clean.

The following changes since commit 924b1e47ab7895e42dd6a56952beb2ef2f61e4fe:

  license/copyleft: exception for ast parse (2011-12-10 00:18:15 +0000)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib eflanagan/license_1819
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=eflanagan/license_1819

Elizabeth Flanagan (1):
  [YOCTO #1819] license: PR bump failure

 meta/classes/license.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)



