Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TBN9G-0007Ts-K7
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 11:52:50 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 11 Sep 2012 02:40:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,402,1344236400"; d="scan'208";a="143720386"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.164])
	by AZSMGA002.ch.intel.com with ESMTP; 11 Sep 2012 02:40:18 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Sep 2012 10:40:13 +0100
Message-Id: <cover.1347356375.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/2] A couple of fixes for sanity.bbclass
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
X-List-Received-Date: Tue, 11 Sep 2012 09:52:50 -0000

The following changes since commit 9f0453c29891e32f8038c4bbc22ada28bfbf818a:

  lib/oe/sstatesig.py: add signature data query function (2012-09-10 13:03:45 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/sanityfixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/sanityfixes

Paul Eggleton (2):
  classes/sanity: skip tune checks if machine is invalid
  classes/sanity: remove obsolete code

 meta/classes/sanity.bbclass |   19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

-- 
1.7.9.5



