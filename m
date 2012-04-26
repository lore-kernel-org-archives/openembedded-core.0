Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SNCIW-00037i-I3
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Apr 2012 02:11:00 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 25 Apr 2012 17:00:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="158420285"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by fmsmga002.fm.intel.com with ESMTP; 25 Apr 2012 17:00:59 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Apr 2012 17:00:58 -0700
Message-Id: <cover.1335398393.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
Subject: [PATCH 0/2] Misc Bugfixes
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
X-List-Received-Date: Thu, 26 Apr 2012 00:11:00 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

The following changes since commit 492a58cabdc053b2312712681dbcffa8270d4ea4:

  self-hosted-image: Update poky revision to point at the 1.2 release branch (2012-04-24 10:21:11 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/bugfixes
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/bugfixes

Nitin A Kamble (2):
  libproxy: fix compilations with gcc 4.7
  quilt: fix perl path in target perl scripts

 meta/recipes-devtools/quilt/quilt_0.51.bb          |   16 ++++++++++-
 .../libproxy/libproxy_fix_for_gcc4.7.patch         |   30 ++++++++++++++++++++
 meta/recipes-support/libproxy/libproxy_0.4.7.bb    |    3 +-
 3 files changed, 47 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/libproxy/libproxy/libproxy_fix_for_gcc4.7.patch

-- 
1.7.7



