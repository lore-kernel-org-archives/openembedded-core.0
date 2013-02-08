Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1U3kLa-0001cS-4d
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 10:34:18 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 08 Feb 2013 01:18:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,628,1355126400"; d="scan'208";a="288228705"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.51])
	by fmsmga002.fm.intel.com with ESMTP; 08 Feb 2013 01:18:23 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Feb 2013 09:18:19 +0000
Message-Id: <cover.1360315075.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/2] buildhistory: handle more R* variables
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
X-List-Received-Date: Fri, 08 Feb 2013 09:34:18 -0000

The following changes since commit 688e9485980de0f29aa00e24ce53a3efd3a3a7cc:

  qemu.bbclass: fix segfaults when running through pseudo (2013-02-07 16:50:40 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/buildhistory-rvars
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/buildhistory-rvars

Paul Eggleton (2):
  buildhistory: record more R* variables
  buildhistory_analysis: handle more R* variables

 meta/classes/buildhistory.bbclass    |   23 +++++++++++++++++++++++
 meta/lib/oe/buildhistory_analysis.py |    8 ++++----
 2 files changed, 27 insertions(+), 4 deletions(-)

-- 
1.7.10.4



