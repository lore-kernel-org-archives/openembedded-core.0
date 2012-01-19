Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Rnq01-00017W-Nk
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 12:17:45 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 19 Jan 2012 02:32:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="113934454"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.198])
	by fmsmga002.fm.intel.com with ESMTP; 19 Jan 2012 02:32:19 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2012 10:32:08 +0000
Message-Id: <cover.1326968802.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/4] buildhistory analysis improvements
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
X-List-Received-Date: Thu, 19 Jan 2012 11:17:45 -0000

Collect and monitor some additional information about images, and
report other (possibly non-monitored) changes when a monitored item
changes to provide context.

Additionally a couple of minor issues where found in field handling for
the package info files.

The following changes since commit a0f5dd25a37fe3b8664c2133e80b6214559f93f6:

  package_rpm.bbclass: Add support for filenames with spaces (2012-01-17 16:20:46 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/buildhistory-imginfo
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/buildhistory-imginfo

Paul Eggleton (4):
  buildhistory: record additional image info
  buildhistory_analysis: correctly handle whitespace when splitting
    lists
  buildhistory_analysis: improve field handling robustness
  buildhistory_analysis: include related fields in output

 meta/classes/buildhistory.bbclass    |   18 +++++
 meta/lib/oe/buildhistory_analysis.py |  127 ++++++++++++++++++++++++----------
 2 files changed, 109 insertions(+), 36 deletions(-)

-- 
1.7.5.4



