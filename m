Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1T0wgI-0003v6-TQ
	for openembedded-core@lists.linuxtogo.org;
	Mon, 13 Aug 2012 17:35:51 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 13 Aug 2012 08:22:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,761,1336374000"; d="scan'208";a="207670896"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.33])
	by fmsmga002.fm.intel.com with ESMTP; 13 Aug 2012 08:22:50 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Aug 2012 17:27:29 +0300
Message-Id: <1344868052-15607-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
Cc: openembedded-core@lists.linuxtogo.org,
	Constantin Musca <constantinx.musca@intel.com>
Subject: [PATCH 0/3] Package upgrades
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
X-List-Received-Date: Mon, 13 Aug 2012 15:35:51 -0000

The set contains package upgrades compiled successfully on all architectures
and tested using the xorg-server.

Constantin Musca (3):
  pixman: upgrade to 0.27.2
  glproto: upgrade to 1.4.16
  dri2proto: upgrade to 2.8

 .../{pixman_0.26.2.bb => pixman_0.27.2.bb}         |    4 ++--
 .../{dri2proto_2.6.bb => dri2proto_2.8.bb}         |    4 ++--
 .../{glproto_1.4.15.bb => glproto_1.4.16.bb}       |    4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{pixman_0.26.2.bb => pixman_0.27.2.bb} (86%)
 rename meta/recipes-graphics/xorg-proto/{dri2proto_2.6.bb => dri2proto_2.8.bb} (76%)
 rename meta/recipes-graphics/xorg-proto/{glproto_1.4.15.bb => glproto_1.4.16.bb} (77%)

-- 
1.7.9.5



