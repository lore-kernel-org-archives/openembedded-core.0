Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SFzJU-0006Tl-KQ
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Apr 2012 04:54:12 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 05 Apr 2012 19:44:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="138307127"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.110])
	by fmsmga001.fm.intel.com with ESMTP; 05 Apr 2012 19:44:58 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Apr 2012 10:40:01 +0800
Message-Id: <cover.1333679903.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH V2 0/1] multilib header support for python
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
X-List-Received-Date: Fri, 06 Apr 2012 02:54:12 -0000

Added multilib header support for python, so that lib32-python and python won't have
conflicting file pyconfig.h.

The following changes since commit 1a82989345fb98becb487d270fd93a5e6dffeb47:
  Saul Wold (1):
        runqemu-internal: Add console=tty for qemuppc and NFS

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib llu/multilib2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/multilib2

Lianhao Lu (1):
  python: multilib header support.

 .../python/python-2.7-manifest.inc                 |    2 +-
 meta/recipes-devtools/python/python.inc            |    2 +-
 meta/recipes-devtools/python/python_2.7.2.bb       |    4 +++-
 scripts/contrib/python/generate-manifest-2.7.py    |    2 +-
 4 files changed, 6 insertions(+), 4 deletions(-)



