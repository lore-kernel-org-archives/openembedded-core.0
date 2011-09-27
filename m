Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1R8f2q-0007FZ-49
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Sep 2011 23:18:28 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 27 Sep 2011 14:13:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="57234420"
Received: from unknown (HELO scimitar.amr.corp.intel.com) ([10.255.15.9])
	by orsmga002.jf.intel.com with ESMTP; 27 Sep 2011 14:13:01 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Sep 2011 14:12:53 -0700
Message-Id: <cover.1317157793.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
Subject: [PATCH 0/1] Fix building ghostcript variants on Ubuntu 11.10
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
X-List-Received-Date: Tue, 27 Sep 2011 21:18:28 -0000

Ubuntu 11.10 has moved sys/time.h such that the hard-coded test paths in
ghostscripts configuration scripts fails.

This patch works around that issue.

Regards,
Joshua

The following changes since commit 684a4b517d13884c315688967fadd5e6a4845b71:

  libffi: really populate -dev package (2011-09-26 20:50:27 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib josh/work
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/work

Joshua Lock (1):
  ghostscript: disable check for time.h

 .../ghostscript/ghostscript_9.02.bb                |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

-- 
1.7.6.2



