Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T4ILr-0005DI-Qp
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Aug 2012 23:20:36 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 22 Aug 2012 14:08:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,296,1344236400"; d="scan'208";a="184220053"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.21])
	by orsmga001.jf.intel.com with ESMTP; 22 Aug 2012 14:07:55 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2012 14:07:54 -0700
Message-Id: <cover.1345669569.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH 0/2] A couple of bug fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Aug 2012 21:20:36 -0000

working through the list!

Sau!

The following changes since commit e3b0925f4c861393e436deb6b1912f9f1f325d1e:

  libtool: normalize link paths before considering for RPATH (2012-08-22 14:22:51 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fix

Saul Wold (2):
  cups: disable pdftops
  external-python-tarball: Blacklist recipe if ipk is not in the
    PACKAGE_CLASSES list

 meta/recipes-core/meta/external-python-tarball.bb |    5 +++++
 meta/recipes-extended/cups/cups14.inc             |    1 +
 meta/recipes-extended/cups/cups_1.4.6.bb          |    2 +-
 3 files changed, 7 insertions(+), 1 deletions(-)

-- 
1.7.7.6



