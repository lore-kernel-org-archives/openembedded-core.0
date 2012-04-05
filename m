Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SFoOR-0005nN-GJ
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Apr 2012 17:14:36 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 05 Apr 2012 08:05:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="138059880"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.110])
	by fmsmga001.fm.intel.com with ESMTP; 05 Apr 2012 08:05:22 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Apr 2012 23:00:31 +0800
Message-Id: <cover.1333637904.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1] multilib header support for python
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
X-List-Received-Date: Thu, 05 Apr 2012 15:14:36 -0000

Added multilib header support for python, so that lib32-python and python won't have
conflicting file pyconfig.h.

The following changes since commit 3e4562500956550dbae5467a5fe9289f1d32f775:
  Saul Wold (1):
        self-hosted-image: Increase space for build and allow builder user sudo access

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib llu/multilib2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/multilib2

Lianhao Lu (1):
  python: multilib header support.

 .../python/python-2.7-manifest.inc                 |    2 +-
 meta/recipes-devtools/python/python_2.7.2.bb       |    6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)



