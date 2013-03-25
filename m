Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UKDMs-0003TI-Bs
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Mar 2013 20:47:58 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 25 Mar 2013 12:30:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,907,1355126400"; d="scan'208";a="311714701"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.13.190])
	by fmsmga002.fm.intel.com with ESMTP; 25 Mar 2013 12:30:42 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Mar 2013 19:30:38 +0000
Message-Id: <cover.1364239707.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/1] Another buildhistory fix
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
X-List-Received-Date: Mon, 25 Mar 2013 19:49:09 -0000

The following change since commit 48dfd61901ce07491ef913cf04dbd9de9a52759f:

  package.bbclass: Ensure debug source file is generated correctly (2013-03-25 17:39:56 +0000)

is available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/buildhistory-fix6
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/buildhistory-fix6

Paul Eggleton (1):
  classes/buildhistory: improve SRCREV recording

 meta/classes/buildhistory.bbclass    |   58 +++++++++++++++++--
 scripts/buildhistory-collect-srcrevs |  104 ++++++++++++++++++++++++++++++++++
 2 files changed, 156 insertions(+), 6 deletions(-)
 create mode 100755 scripts/buildhistory-collect-srcrevs

-- 
1.7.10.4



