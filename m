Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SQIpW-0007pt-N6
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 15:45:54 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 04 May 2012 06:36:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="137013283"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.64])
	by orsmga001.jf.intel.com with ESMTP; 04 May 2012 06:36:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Scott Garman <scott.a.garman@intel.com>
Date: Fri,  4 May 2012 14:36:00 +0100
Message-Id: <cover.1336138307.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/1] Buildhistory fix
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
X-List-Received-Date: Fri, 04 May 2012 13:45:54 -0000

This fix should also go into 1.2.1.


The following change since commit 0be64cda0a20ca3aab75ee0cc360236d2dc40c95:

  gcc-package-target: add libexec for plugin (2012-05-03 15:38:07 +0100)

is available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/buildhistory-commit
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/buildhistory-commit

Paul Eggleton (1):
  buildhistory: fix multiple commit of images and packages at the same
    time

 meta/classes/buildhistory.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

-- 
1.7.5.4



