Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R1W1D-0003VD-EI
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Sep 2011 06:15:15 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 07 Sep 2011 21:10:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,348,1312182000"; d="scan'208";a="15069517"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.148])
	by AZSMGA002.ch.intel.com with ESMTP; 07 Sep 2011 21:10:11 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Sep 2011 21:10:09 -0700
Message-Id: <cover.1315454900.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/1] fix for mesa-* build failures
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
X-List-Received-Date: Thu, 08 Sep 2011 04:15:15 -0000

Fixes mesa configure scripts finding host (not native) 
python2 executable

The following changes since commit fa8dad209247b780590bc8476b5b16e6608d7907:

  avahi: only use gtk if DISTRO_FEATURES includes x11 (2011-09-07 23:44:07 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fix

Saul Wold (1):
  python-native: add link for python2

 .../recipes-devtools/python/python-native_2.6.6.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

-- 
1.7.6



