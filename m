Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1Qgvj5-0006Nq-HF
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 11:27:27 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 13 Jul 2011 02:23:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,524,1304319600"; d="scan'208";a="27345032"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.187])
	by fmsmga002.fm.intel.com with ESMTP; 13 Jul 2011 02:23:27 -0700
From: Yu Ke <ke.yu@intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Wed, 13 Jul 2011 17:22:21 +0800
Message-Id: <cover.1310548638.git.ke.yu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/2] extra fix for non /usr/lib libdir
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
X-List-Received-Date: Wed, 13 Jul 2011 09:27:27 -0000

sta-solver and libzypp also need fix to pass the build with non /usr/lib libdir
e.g. libdir=/usr/lib64

The following changes since commit 7354fc9213f27aa1b643dbe88070437f1ee4c063:
  Paul Eggleton (1):
        insane.bbclass: skip rdepends QA checks for kernel / modules

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kyu3/libdir-fix-v3
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kyu3/libdir-fix-v3

Yu Ke (2):
  sat-solver: fix for non /usr/lib libdir case
  libzypp: fix for non /usr/lib libdir case

 meta/classes/cmake.bbclass                         |    4 +++
 .../libzypp/libzypp/hardcode-lib-fix.patch         |   22 ++++++++++++++++++++
 meta/recipes-extended/libzypp/libzypp_git.bb       |    5 ++-
 meta/recipes-extended/sat-solver/sat-solver_git.bb |    6 +++-
 4 files changed, 33 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-extended/libzypp/libzypp/hardcode-lib-fix.patch



