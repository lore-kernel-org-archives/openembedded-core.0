Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UKuzz-0000yp-Go
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Mar 2013 19:23:06 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 27 Mar 2013 11:04:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,920,1355126400"; d="scan'208";a="285386377"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.13.95])
	by orsmga001.jf.intel.com with ESMTP; 27 Mar 2013 11:05:53 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Mar 2013 18:05:49 +0000
Message-Id: <cover.1364407435.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH v2 0/1] Another buildhistory fix
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
X-List-Received-Date: Wed, 27 Mar 2013 18:23:16 -0000

Since v1, fix erroneous use of os.path.remove() (which does not exist)
instead of os.remove().

Martin is working on a separate patch for tracking and warning when an
upstream tag changes on top of this.


The following changes since commit 09a5fec50d622d338db5bd5516d29e4f4d0cec0d:

  qemuimage-testlib: Capture stderror in the logs as well as stdout (2013-03-27 13:54:06 +0000)

are available in the git repository at:

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



