Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1R3TPk-0006PZ-F4
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Sep 2011 15:52:40 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 13 Sep 2011 06:47:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,374,1312182000"; d="scan'208";a="50769875"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by fmsmga001.fm.intel.com with ESMTP; 13 Sep 2011 06:47:23 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Sep 2011 21:43:30 +0800
Message-Id: <cover.1315920902.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/1] Fix hard path in opensp
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
X-List-Received-Date: Tue, 13 Sep 2011 13:52:40 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Saul,
This is the new version to fix the hard path in opensp. After 2nd thought, I'm
reluctant to change the search directory path handling code in nsgmls in case
of any likely side effect to other package. I change the iputils' makefile to
avoid "../" in the sysid path, and it really works without regression.

This is reasonable, as other package, like linuxdoc-tools-native, make a lot of
works before calling nsgmls: prepare search directory path with "-D", introduce
a huge perf module to handle the sgml2XXX conversion...

Pls. help to review.

Thanks,
Edwin

The following changes since commit 52835dd30110d51a839872f198eef3b12e369850:

  avahi: only use gtk if DISTRO_FEATURES includes x11 (2011-09-07 23:44:29 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib gzhai/master2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/master2

Zhai Edwin (1):
  opensp: Fix hard path in native nsgmls.

 meta/recipes-devtools/opensp/opensp_1.5.bb         |    4 +-
 .../iputils/files/nsgmls-path-fix.patch            |   27 ++++++++++++++++++++
 meta/recipes-extended/iputils/iputils_s20101006.bb |    1 +
 3 files changed, 30 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/iputils/files/nsgmls-path-fix.patch


