Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SzrxQ-0001V8-S6
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Aug 2012 18:21:05 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Aug 2012 09:09:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,745,1336374000"; d="scan'208";a="184530296"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.78])
	by orsmga002.jf.intel.com with ESMTP; 10 Aug 2012 09:09:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Scott Garman <scott.a.garman@intel.com>
Date: Fri, 10 Aug 2012 17:09:03 +0100
Message-Id: <cover.1344614803.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [denzil][PATCH 0/4] Fixes for denzil-next
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
X-List-Received-Date: Fri, 10 Aug 2012 16:21:05 -0000

Some cherry-picks from master to fix bugs in denzil.


The following changes since commit 741146fa90f28f7ce8d82ee7f7e254872d519724:

  gconf.bbclass: don't register schemas in the install stage (2012-06-29 15:03:01 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/denzil-fixes-core
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/denzil-fixes-core

Paul Eggleton (4):
  classes/rootfs_*: fix splitting package dependency strings
  buildhistory_analysis: fix error when version specifier missing
  scripts/buildhistory-diff: add GitPython version check
  classes/license: fix manifest to work with deb

 meta/classes/license.bbclass         |    2 +-
 meta/classes/rootfs_deb.bbclass      |    4 ++--
 meta/classes/rootfs_ipk.bbclass      |    4 ++--
 meta/lib/oe/buildhistory_analysis.py |    2 +-
 scripts/buildhistory-diff            |    8 ++++++--
 5 files changed, 12 insertions(+), 8 deletions(-)

-- 
1.7.9.5



