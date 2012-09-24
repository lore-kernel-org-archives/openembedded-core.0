Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TGAlA-00066J-RS
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 17:39:49 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 24 Sep 2012 08:26:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,476,1344236400"; d="scan'208";a="225795126"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.13])
	by fmsmga001.fm.intel.com with ESMTP; 24 Sep 2012 08:26:46 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Scott Garman <scott.a.garman@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 24 Sep 2012 16:26:43 +0100
Message-Id: <cover.1348500281.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [denzil][PATCH 0/1] menuconfig fix for denzil
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
X-List-Received-Date: Mon, 24 Sep 2012 15:39:49 -0000

Note that as noted in the patch this relies upon the task tainting
feature in bitbake; this will do nothing with versions of bitbake that
do not have that feature.


The following changes since commit 95756cfbb7a9348b23cb46a49a5509e57e973faf:

  valgrind: fix default.supp missing issue (2012-08-21 11:19:26 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/denzil-force-oecore
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/denzil-force-oecore

Paul Eggleton (1):
  classes/cml1: ensure -c menuconfig forces a rebuild next time

 meta/classes/cml1.bbclass |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)

-- 
1.7.9.5



