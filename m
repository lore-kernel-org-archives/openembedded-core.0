Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QUZHX-000897-J8
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 09:03:57 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 09 Jun 2011 00:00:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,340,1304319600"; d="scan'208";a="11662694"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.187])
	by orsmga001.jf.intel.com with ESMTP; 09 Jun 2011 00:00:34 -0700
From: Yu Ke <ke.yu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jun 2011 15:03:24 +0800
Message-Id: <cover.1307602786.git.ke.yu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1] add mesa-demos to sato-sdk to fix bug 1112
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
X-List-Received-Date: Thu, 09 Jun 2011 07:03:57 -0000

The following changes since commit c412674cf818e77e35857fb93353e392e7ac9e53:
  Khem Raj (1):
        package.bbclass,prserv.bbclass: Compare USE_PR_SERV with "1" or "0"

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kyu3/bug1112
  http://git.pokylinux.org/cgit.cgi//log/?h=kyu3/bug1112

Yu Ke (1):
  sato-sdk: add mesa-demos application

 meta/classes/core-image.bbclass                 |    1 +
 meta/recipes-sato/images/core-image-sato-sdk.bb |    2 +-
 meta/recipes-sato/tasks/task-core.bb            |    6 +++++-
 3 files changed, 7 insertions(+), 2 deletions(-)



