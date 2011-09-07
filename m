Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R1Kp0-0000DK-83
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Sep 2011 18:17:54 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 07 Sep 2011 09:12:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,346,1312182000"; d="scan'208";a="14851850"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.148])
	by AZSMGA002.ch.intel.com with ESMTP; 07 Sep 2011 09:12:50 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Sep 2011 09:12:47 -0700
Message-Id: <cover.1315411864.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PULL v2 0/1] fix perl sstate issue
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
X-List-Received-Date: Wed, 07 Sep 2011 16:17:54 -0000

This fixes a problem where a sstate build will be using perl.real
directly instead of perl.

Sau!

The following changes since commit cb8efc0e1ec00892b46325aabfb1b4020a46c078:

  linux-yocto: re-enable utrace (2011-09-07 14:53:38 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/fix2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fix2

Saul Wold (1):
  cpan.bbclass: fix native perl issue

 meta/classes/cpan.bbclass |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

-- 
1.7.6



