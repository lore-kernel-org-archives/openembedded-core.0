Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Rasnv-0006GU-EQ
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Dec 2011 18:39:43 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 14 Dec 2011 09:32:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="102185593"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.68])
	by fmsmga002.fm.intel.com with ESMTP; 14 Dec 2011 09:32:18 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Dec 2011 17:31:36 +0000
Message-Id: <cover.1323883800.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/3] CentOS 5.x fixes
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
X-List-Received-Date: Wed, 14 Dec 2011 17:39:43 -0000

A few fixes I made in the process of testing builds on CentOS 5.7.

The following changes since commit b9dfccc018f32a47fc045f35d5f53d7269d791ed:

  gdk-pixbuf: Ensure the binaries can be relocated (2011-12-13 18:00:18 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/qemu-centos5
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/qemu-centos5

Paul Eggleton (3):
  qemu: for native, do not fail if kvm is unavailable
  scripts/runqemu: show an error if /dev/net/tun is unusable
  scripts/bitbake: add a version >= 2.6 check

 meta/recipes-devtools/qemu/qemu.inc       |   10 ++++++++--
 meta/recipes-devtools/qemu/qemu_0.14.0.bb |    2 +-
 meta/recipes-devtools/qemu/qemu_0.15.1.bb |    2 ++
 meta/recipes-devtools/qemu/qemu_git.bb    |    2 +-
 scripts/bitbake                           |    9 +++++++++
 scripts/runqemu                           |    8 ++++++++
 6 files changed, 29 insertions(+), 4 deletions(-)

-- 
1.7.5.4



