Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SLGci-0003Mi-If
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Apr 2012 18:23:52 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Apr 2012 09:14:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="132135291"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by orsmga001.jf.intel.com with ESMTP; 20 Apr 2012 09:14:21 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Apr 2012 09:14:20 -0700
Message-Id: <cover.1334938400.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
Subject: [PATCH 0/1] Misc Fixes
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
X-List-Received-Date: Fri, 20 Apr 2012 16:23:53 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

The following changes since commit 1a03b7dfba464fde770ba69b618427d13e0a3b8b:

  documentation/bsp-guide/bsp.xml: spelling corrected. (2012-04-18 16:41:15 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/bugfixes
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/bugfixes

Nitin A Kamble (1):
  libproxy: fix compilation with gcc 4.7

 .../libproxy/libproxy_fix_for_gcc4.7.patch         |   30 ++++++++++++++++++++
 meta/recipes-support/libproxy/libproxy_0.4.7.bb    |    3 +-
 2 files changed, 32 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-support/libproxy/libproxy/libproxy_fix_for_gcc4.7.patch

-- 
1.7.7



