Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1R4bzN-0001ag-TS
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 19:14:10 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 16 Sep 2011 10:08:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="49215399"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.40])
	by orsmga002.jf.intel.com with ESMTP; 16 Sep 2011 10:08:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Sep 2011 18:08:52 +0100
Message-Id: <cover.1316192786.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/2] Konsole handling
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
X-List-Received-Date: Fri, 16 Sep 2011 17:14:10 -0000

The following changes since commit 20529035a4c0befb3c6bdbcb289a2de930fb143d:

  bugzilla.bbclass: add a class to report build problems to bugzilla (2011-09-16 17:36:27 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/konsole
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/konsole

Paul Eggleton (2):
  lib/oe/terminal.py: declare konsole from KDE 4.x as unsupported
  sanity.bbclass: add a sanity check for KDE 4.x konsole in TERMCMD

 meta/classes/sanity.bbclass |    6 ++++++
 meta/lib/oe/terminal.py     |   27 +++++++++++++++++++++++++++
 2 files changed, 33 insertions(+), 0 deletions(-)

-- 
1.7.4.1



