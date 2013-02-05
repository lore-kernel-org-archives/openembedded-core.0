Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1U2jj8-0007Q1-Ni
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 15:42:28 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 05 Feb 2013 06:26:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,602,1355126400"; d="scan'208";a="198895611"
Received: from unknown (HELO localhost) ([10.255.12.93])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Feb 2013 06:26:35 -0800
From: tom.zanussi@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Feb 2013 08:26:33 -0600
Message-Id: <cover.1360074262.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 0/1] systemtap 'crosstap' fix
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
X-List-Received-Date: Tue, 05 Feb 2013 14:42:32 -0000

From: Tom Zanussi <tom.zanussi@linux.intel.com>

This is a patch to crosstap which fixes a problem where a passed-in
builddir gets lost in the session copy constructor when connecting
to remote hosts, resulting in failed script compilation.

The problem turned out to be simple hyphen/underscore confusion.

The following changes since commit 7e9cb437b1b720e656f4a33f73c07c5dc7356a2c:

  dropbear: fix RPROVIDES (2013-02-04 23:31:02 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/crosstap-x86-64-fix
  http://git.yoctoproject.org/cgit.cgi//log/?h=tzanussi/crosstap-x86-64-fix

Tom Zanussi (1):
  crosstap: handle hyphenated x86_64 target arch

 scripts/crosstap | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.7.11.4



