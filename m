Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1R1rLn-00059I-3o
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Sep 2011 05:01:55 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 08 Sep 2011 19:56:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,353,1312182000"; d="scan'208";a="46999951"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by azsmga001.ch.intel.com with ESMTP; 08 Sep 2011 19:56:49 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Sep 2011 10:53:04 +0800
Message-Id: <cover.1315536041.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/1] [RFC] Fix hard path of opensp, Edwin, Sep9, 2011
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
X-List-Received-Date: Fri, 09 Sep 2011 03:01:55 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Saul,
This is one fix to use "-D" as wrapper rather than environment val according to
your suggestion. Could you pls. have a look?

Thanks,
Edwin

The following changes since commit 52835dd30110d51a839872f198eef3b12e369850:

  avahi: only use gtk if DISTRO_FEATURES includes x11 (2011-09-07 23:44:29 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib gzhai/master2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/master2

Zhai Edwin (1):
  opensp: Fix hard path in native nsgmls.

 meta/recipes-devtools/opensp/opensp_1.5.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)



