Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1QteWp-0000KO-Cg
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 13:43:23 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 17 Aug 2011 04:38:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="38598580"
Received: from unknown (HELO cenodoxus.amr.corp.intel.com) ([10.255.13.232])
	by orsmga002.jf.intel.com with ESMTP; 17 Aug 2011 04:38:44 -0700
From: Beth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Aug 2011 04:38:42 -0700
Message-Id: <cover.1313580714.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/1] Minor patch to buildstats
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
X-List-Received-Date: Wed, 17 Aug 2011 11:43:23 -0000

Task endtime got left out of recent changes. Adding it back in and removing
a superfluous line of whitespace.

The following changes since commit a21ff559e7c93e9da61104f4a33e42e6004189fd:

  Fixup remaining bb.msg.domain users (2011-08-15 17:31:52 +0100)

are available in the git repository at:
  ssh://git@git.yoctoproject.org/poky-contrib eflanagan/disk_io_stats

Beth Flanagan (1):
      buildstats.bbclass: Fixing task endtime

 meta/classes/buildstats.bbclass |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

Beth Flanagan (1):
  buildstats.bbclass: Fixing task endtime

 meta/classes/buildstats.bbclass |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)



