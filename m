Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SF4Bb-0007mD-1D
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Apr 2012 15:54:15 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 03 Apr 2012 06:44:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="126549042"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.14])
	by azsmga001.ch.intel.com with ESMTP; 03 Apr 2012 06:44:42 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Apr 2012 14:44:39 +0100
Message-Id: <cover.1333460617.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/1] Fix elfutils build failure
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
X-List-Received-Date: Tue, 03 Apr 2012 13:54:15 -0000

The following change since commit 38ee88e3b32b7444d7f1eb64f1b4f69a48fe0458:

  gdb: build with expat, add missing RRECOMMENDS_gdbserver (2012-04-03 14:10:44 +0100)

is available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/elfutils-compress
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/elfutils-compress

Paul Eggleton (1):
  elfutils: disable lzma (and bzip2 for native)

 meta/recipes-devtools/elfutils/elfutils_0.148.bb |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

-- 
1.7.5.4



