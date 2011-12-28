Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RftuR-0002o4-7z
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Dec 2011 14:51:11 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 28 Dec 2011 05:43:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="90955810"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.71])
	by orsmga001.jf.intel.com with ESMTP; 28 Dec 2011 05:43:36 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Dec 2011 13:43:33 +0000
Message-Id: <cover.1325079532.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [RFC PATCH 0/1] Locale package installation
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
X-List-Received-Date: Wed, 28 Dec 2011 13:51:11 -0000

Implement locale package installation as we had in OE-Classic; please
review. In particular I'm not sure of the naming of
rootfs_check_package_exists() (since it resolves the package to a
filename in the case of RPM). Note that because of the default value of
IMAGE_LINGUAS this patch will result in images growing slightly.

The following change since commit 8f348ccad083d6c02c200652ff6295e701e88f0d:

  coreutils: ensure --color works so DEPEND on libcap (2011-12-24 10:05:35 +0000)

is available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/image-linguas
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/image-linguas

Paul Eggleton (1):
  classes/image: implement generic locale package installation

 meta/classes/image.bbclass      |   37 +++++++++++++++++++++++++++++++++++++
 meta/classes/rootfs_deb.bbclass |   37 +++++++++++++++++++++++++++----------
 meta/classes/rootfs_ipk.bbclass |   30 +++++++++---------------------
 meta/classes/rootfs_rpm.bbclass |   35 +++++++++++------------------------
 4 files changed, 84 insertions(+), 55 deletions(-)

-- 
1.7.5.4



