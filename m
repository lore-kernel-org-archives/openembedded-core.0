Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SAlk3-0004g6-Ur
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 18:24:04 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 22 Mar 2012 10:15:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="143359115"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.227])
	by fmsmga002.fm.intel.com with ESMTP; 22 Mar 2012 10:15:07 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Mar 2012 17:15:03 +0000
Message-Id: <cover.1332436375.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/2] combo-layer fixes
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
X-List-Received-Date: Thu, 22 Mar 2012 17:24:04 -0000

A couple of fixes for combo-layer. Thanks to Otavio Salvador for testing
the second patch.


The following changes since commit d036265de1d9931bedb660e01a763d3d1d9e4097:

  xserver-kdrive: Fix packaging warnings (2012-03-21 23:17:26 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/combo-layer-fixes4
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/combo-layer-fixes4

Paul Eggleton (2):
  scripts/combo-layer: limit component repo dirty check
  scripts/combo-layer: handle diffs in commit messages

 scripts/combo-layer |   56 ++++++++++++++++++++++++++++++++++++++++++--------
 1 files changed, 47 insertions(+), 9 deletions(-)

-- 
1.7.5.4



