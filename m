Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UQkfu-0005dY-Ip
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Apr 2013 22:34:24 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 12 Apr 2013 13:15:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,465,1363158000"; d="scan'208";a="317416418"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.13.168])
	by orsmga002.jf.intel.com with ESMTP; 12 Apr 2013 13:16:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Apr 2013 21:16:50 +0100
Message-Id: <cover.1365797632.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/1] Fix handling of bblayers.conf updating
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
X-List-Received-Date: Fri, 12 Apr 2013 20:34:25 -0000

Fixes endless looping and other bad behaviour in the code that updates
bblayers.conf on startup. This is an important fix for the 1.4 release.


The following change since commit 6af6df6c6507cae61dbd9d6994ff4162b54df451:

  oprofile: Add Upstream-Status and description to patch (2013-04-12 18:33:07 +0100)

is available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/bblayers-conf-fix-core
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/bblayers-conf-fix-core

Paul Eggleton (1):
  classes/sanity: fix handling of bblayers.conf updating

 meta/classes/sanity.bbclass |   77 +++++++++++++++++++++++++++++--------------
 1 file changed, 52 insertions(+), 25 deletions(-)

-- 
1.7.10.4



