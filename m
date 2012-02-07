Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Ruo8X-00019X-NR
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 17:43:21 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 07 Feb 2012 08:26:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="104162861"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.5])
	by azsmga001.ch.intel.com with ESMTP; 07 Feb 2012 08:25:34 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Feb 2012 16:24:58 +0000
Message-Id: <cover.1328631790.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/2] Buildhistory sorting fixes
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
X-List-Received-Date: Tue, 07 Feb 2012 16:43:22 -0000

The following changes since commit 18d9fcfc4bc4b01f73e89f3b988c9d3d543c7705:

  libzypp: add missing runtime dependences on gzip and gnupg (2012-02-03 17:23:28 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/buildhistory-fix3
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/buildhistory-fix3

Paul Eggleton (2):
  classes/buildhistory: sort image file list
  classes/buildhistory: sort list fields in package info

 meta/classes/buildhistory.bbclass |   21 ++++++++++++++++-----
 1 files changed, 16 insertions(+), 5 deletions(-)

-- 
1.7.5.4



