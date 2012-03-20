Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SA1jf-0006ph-KV
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 17:16:35 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 20 Mar 2012 09:06:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="141958467"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.195])
	by fmsmga002.fm.intel.com with ESMTP; 20 Mar 2012 09:06:30 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Mar 2012 16:06:23 +0000
Message-Id: <cover.1332259383.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/5] buildhistory_analysis fixes
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
X-List-Received-Date: Tue, 20 Mar 2012 16:16:35 -0000

Some fixes for the buildhistory_analysis module to reduce the output
and make it more readable when using the buildhistory-diff tool.

The following changes since commit 5d404fdb36b0535ce758d98408b02134cdbce4ee:

  xserver-kdrive: compile xserver without dtrace support (2012-03-20 15:21:18 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/buildhistory-fixes5
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/buildhistory-fixes5

Paul Eggleton (5):
  buildhistory_analysis: use bb.utils.explode_dep_versions
  buildhistory_analysis: hide version number increases in dependencies
  buildhistory_analysis: skip FILELIST changes for dbg packages
  buildhistory_analysis: report if all items removed from a list
  buildhistory_analysis: avoid printing PE/PV/PR more than once

 meta/lib/oe/buildhistory_analysis.py |   75 +++++++++++++++++++++++++++++----
 scripts/buildhistory-diff            |   21 ++++++++-
 2 files changed, 84 insertions(+), 12 deletions(-)

-- 
1.7.5.4



