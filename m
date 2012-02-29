Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1S2XTI-0001rf-7p
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Feb 2012 01:32:44 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 28 Feb 2012 16:23:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="112490024"
Received: from unknown (HELO cenodoxus.amr.corp.intel.com) ([10.255.15.126])
	by azsmga001.ch.intel.com with ESMTP; 28 Feb 2012 16:23:09 -0800
From: Beth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Feb 2012 16:23:04 -0800
Message-Id: <cover.1330474667.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/1] Quote fixes.
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
X-List-Received-Date: Wed, 29 Feb 2012 00:32:44 -0000

I found these ParseError quoting issues in the fri2 layer. I fixed other
quoting issues in the class while I was there.

The following changes since commit d86e3082e695cde555df276a2436873fa5381130:

  licenses.conf: fix quotting of SRC_DISTRIBUTE_LICENSES (2012-02-28 17:51:52 +0000)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib eflanagan/quote_fixes
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=eflanagan/quote_fixes

Elizabeth Flanagan (1):
  bootimg.bbclass: Quoting fixes

 meta/classes/bootimg.bbclass |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)



