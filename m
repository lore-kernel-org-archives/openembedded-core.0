Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1Rbazv-0003tu-Qa
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 17:51:04 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 16 Dec 2011 08:44:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="86504177"
Received: from unknown (HELO cenodoxus.amr.corp.intel.com) ([10.255.15.176])
	by azsmga001.ch.intel.com with ESMTP; 16 Dec 2011 08:44:02 -0800
From: Beth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Dec 2011 08:44:00 -0800
Message-Id: <cover.1324053729.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/1] Remove manifest creation bashism.
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
X-List-Received-Date: Fri, 16 Dec 2011 16:51:04 -0000

Quick fix to a bashism that dumps cruft into rootfs log.

The following changes since commit cdba3979b9c59a653f9c0e6e779d11c5ff58bb17:

  readline: drop empty dir to shut up QA warning (2011-12-16 16:19:28 +0000)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib eflanagan/license_dash
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=eflanagan/license_dash

Elizabeth Flanagan (1):
  license.bbclass: remove bashism

 meta/classes/license.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)



