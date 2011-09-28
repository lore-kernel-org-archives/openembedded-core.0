Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R8lbe-0005bP-Il
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 06:18:50 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 27 Sep 2011 21:13:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,453,1312182000"; d="scan'208";a="56424919"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.219])
	by azsmga001.ch.intel.com with ESMTP; 27 Sep 2011 21:13:23 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Sep 2011 21:13:18 -0700
Message-Id: <cover.1317183118.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/3] Fix for RPM host contamination issue
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
X-List-Received-Date: Wed, 28 Sep 2011 04:18:50 -0000

Richard,

The first patch of this set fixes the host contamination issue that 
was found.

The second 2 fixes are doing some RDEPENDS clean up and QA warning on
un-packaged files.

Sau!

The following changes since commit 684a4b517d13884c315688967fadd5e6a4845b71:

  libffi: really populate -dev package (2011-09-26 20:50:27 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib sgw/oe-fix
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=sgw/oe-fix

Saul Wold (3):
  rpm: ensure that magic file is relocatable
  zypper & sat-solver: needs RDEPENDS on rpm-lib
  rpm: fix QA Warning on installed but not shipped staticdev filesw

 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |   31 +++++++++++++------
 meta/recipes-extended/libzypp/libzypp_git.bb       |    8 ++--
 meta/recipes-extended/sat-solver/sat-solver_git.bb |    4 ++-
 meta/recipes-extended/zypper/zypper_git.bb         |    6 ++-
 4 files changed, 32 insertions(+), 17 deletions(-)

-- 
1.7.6



