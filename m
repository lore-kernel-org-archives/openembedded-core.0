Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jessica.zhang@intel.com>) id 1Qc3dr-0002jo-SL
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 00:53:56 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 29 Jun 2011 15:50:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,446,1304319600"; d="scan'208";a="21681734"
Received: from jzhang-desktop.jf.intel.com (HELO localhost) ([10.7.201.178])
	by orsmga001.jf.intel.com with ESMTP; 29 Jun 2011 15:50:11 -0700
From: Jessica Zhang <jessica.zhang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jun 2011 16:09:44 -0700
Message-Id: <cover.1309383006.git.jessica.zhang@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1] Add env setting to support libtool2.4 m4 macro
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
X-List-Received-Date: Wed, 29 Jun 2011 22:53:56 -0000

Add OECORE_ACLOCAL_OPTS to env setup scripts for options
running aclocal to generate correct libtool 2.4 m4 macro, 
the autogen.sh should be changed as aclocal ${OECORE_ACLOCAL_OPTS}
The following changes since commit c412674cf818e77e35857fb93353e392e7ac9e53:
  Khem Raj (1):
        package.bbclass,prserv.bbclass: Compare USE_PR_SERV with "1" or "0"

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jzhang/aclocal
  http://git.yoctoproject.org/cgit.cgi//log/?h=jzhang/aclocal

Jessica Zhang (1):
  Add OECORE_ACLOCAL_OPTS to env setup scripts for autotool project
    using correct libtool 2.4

 meta/classes/toolchain-scripts.bbclass |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)



