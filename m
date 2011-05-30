Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QQw8z-000897-QO
	for openembedded-core@lists.openembedded.org;
	Mon, 30 May 2011 08:40:05 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 29 May 2011 23:36:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,290,1304319600"; 
   d="scan'208";a="9311546"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.187])
	by fmsmga002.fm.intel.com with ESMTP; 29 May 2011 23:36:55 -0700
From: Yu Ke <ke.yu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 May 2011 14:40:51 +0800
Message-Id: <cover.1306737527.git.ke.yu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 0/1] Fix powerpc xserver dlopen issue
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
X-List-Received-Date: Mon, 30 May 2011 06:40:06 -0000

Fix Yocto bug 736, 737

The following changes since commit c412674cf818e77e35857fb93353e392e7ac9e53:
  Khem Raj (1):
        package.bbclass,prserv.bbclass: Compare USE_PR_SERV with "1" or "0"

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kyu3/dl-issue
  http://git.pokylinux.org/cgit.cgi//log/?h=kyu3/dl-issue

Yu Ke (1):
  site/powerpc-common: remove the incorrect dlopen default setting

 meta/site/powerpc-common |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)



