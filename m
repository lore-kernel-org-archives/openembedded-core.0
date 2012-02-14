Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RxIkB-0004rp-Gx
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Feb 2012 14:48:31 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Feb 2012 05:40:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="109850968"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.250])
	by orsmga002.jf.intel.com with ESMTP; 14 Feb 2012 05:40:19 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Feb 2012 13:40:10 +0000
Message-Id: <cover.1329226672.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/7] buildhistory fixes
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
X-List-Received-Date: Tue, 14 Feb 2012 13:48:31 -0000

Analysis of the recent output from buildhistory on the Yocto Project and
Angstrom autobuilders showed a few anomalies and annoyances; this
set of patches addresses all of the ones I noticed.

The following changes since commit e5ad03093dfc4364d1407183f458df79f347c7a1:

  guile: fix cross configure failure (2012-02-10 13:38:16 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/buildhistory-fixes4
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/buildhistory-fixes4

Paul Eggleton (7):
  classes/buildhistory: squash spaces out of image variables
  classes/buildhistory: sort and de-dupe dependency graphs
  classes/buildhistory: sort FILELIST in package info
  classes/buildhistory: use hostname instead of reading /etc/hostname
  classes/buildhistory: fix splitting on + in package list fields
  buildhistory_analysis: avoid noise due to reordering
  buildhistory_analysis: correctly split RDEPENDS/RRECOMMENDS

 meta/classes/buildhistory.bbclass    |   25 +++++++++++++++++--------
 meta/lib/oe/buildhistory_analysis.py |   31 ++++++++++++++++++++++++++-----
 2 files changed, 43 insertions(+), 13 deletions(-)

-- 
1.7.5.4



