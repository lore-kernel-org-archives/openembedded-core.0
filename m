Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SYzfY-0006na-Df
	for openembedded-core@lists.openembedded.org;
	Mon, 28 May 2012 15:07:32 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 28 May 2012 05:57:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="149243387"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.22])
	by orsmga002.jf.intel.com with ESMTP; 28 May 2012 05:57:14 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 May 2012 13:57:10 +0100
Message-Id: <cover.1338209763.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/2] A couple of buildhistory-diff fixes
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
X-List-Received-Date: Mon, 28 May 2012 13:07:32 -0000

The following changes since commit 363424cdc78cafa278008f973c2b4288297ebf8c:

  image.bbclass: Ensure ${S} is cleaned at the start of rootfs generation (2012-05-25 11:28:00 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/buildhistory-fixes6
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/buildhistory-fixes6

Paul Eggleton (2):
  buildhistory_analysis: fix error when version specifier missing
  scripts/buildhistory-diff: add GitPython version check

 meta/lib/oe/buildhistory_analysis.py |    2 +-
 scripts/buildhistory-diff            |    8 ++++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

-- 
1.7.9.5



