Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R1Lrk-0001UH-TD
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Sep 2011 19:24:49 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 07 Sep 2011 10:19:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,346,1312182000"; d="scan'208";a="48975147"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.148])
	by fmsmga001.fm.intel.com with ESMTP; 07 Sep 2011 10:19:35 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Sep 2011 10:19:33 -0700
Message-Id: <cover.1315415799.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PULL v3 0/1] Fix for beagleboard ICE when building lttng-ust
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
X-List-Received-Date: Wed, 07 Sep 2011 17:24:49 -0000

v2 has a patch header!
v3 removed bad patch file

Been a rough morning!

Sau!

The following changes since commit cb8efc0e1ec00892b46325aabfb1b4020a46c078:

  linux-yocto: re-enable utrace (2011-09-07 14:53:38 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/gcc-fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/gcc-fix

Saul Wold (1):
  gcc: add patch for ice 50099, which caused lttng-ust not to build

 meta/recipes-devtools/gcc/gcc-4.6.inc              |    3 +-
 .../gcc/gcc-4.6/fix-for-ice-50099.patch            |   49 ++++++++++++++++++++
 2 files changed, 51 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6/fix-for-ice-50099.patch

-- 
1.7.6



