Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1QomkH-00013U-L4
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 03:29:11 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 03 Aug 2011 18:23:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,313,1309762800"; d="scan'208";a="34156033"
Received: from envy.jf.intel.com ([10.7.201.175])
	by orsmga002.jf.intel.com with ESMTP; 03 Aug 2011 18:23:41 -0700
From: Beth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2011 18:18:25 -0700
Message-Id: <cover.1312419801.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/1] Disk io measurements for build statistics
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
X-List-Received-Date: Thu, 04 Aug 2011 01:29:11 -0000

This commit adds disk-io statistics functionality on a build
and per-task basis. I've also started drying it up some.

We pull measurements for whatever partition TMPDIR exists on.
We pull /proc/diskstats for every task and the entire build and collect
I do no analysis in this, leaving that for the end user. 
The following changes since commit 5fbac72eb8c3cddf10876cf007aff54180c7264e:

  multilib: Use BPN instead of PN for style like lib${PN} (2011-08-03 18:07:25 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib eflanagan/disk-io-stats
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=eflanagan/disk-io-stats

Beth Flanagan (1):
  buildstats.bbclass: Adding disk io measurement

 meta/classes/buildstats.bbclass |  220 +++++++++++++++++++++++++--------------
 1 files changed, 142 insertions(+), 78 deletions(-)



