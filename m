Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RcVfa-0007CZ-Jo
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 06:21:50 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 Dec 2011 21:14:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="88914483"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.50])
	by orsmga002.jf.intel.com with ESMTP; 18 Dec 2011 21:14:46 -0800
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org,
	sakoman@gmail.com
Date: Mon, 19 Dec 2011 13:14:48 +0800
Message-Id: <cover.1324271587.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/1] fix wget build issue: /usr/lib/libssl.so: could not read symbols
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
X-List-Received-Date: Mon, 19 Dec 2011 05:21:51 -0000

The following changes since commit b281fd127bac9ba77ab63a5c2b812ddd5d56df37:

  documentation/poky-ref-manual/technical-details.xml: edits per Richard Purdie (2011-12-16 16:58:41 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dcui/wget
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/wget

Dexuan Cui (1):
  wget: fix a host intrusion issue introduced by adding
    --with-ssl=openssl.

 meta/recipes-extended/wget/wget.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.6



