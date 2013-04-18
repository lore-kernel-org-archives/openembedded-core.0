Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1USsHT-0005wW-Ve
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Apr 2013 19:06:00 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 18 Apr 2013 09:48:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,502,1363158000"; d="scan'208";a="228898020"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.2])
	by AZSMGA002.ch.intel.com with ESMTP; 18 Apr 2013 09:48:14 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Apr 2013 09:48:13 -0700
Message-Id: <1366303693-30653-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [PATCH] init-ifupdown: move network interfaces file for the beagleboard
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
X-List-Received-Date: Thu, 18 Apr 2013 17:06:11 -0000

With the splite of netbase and init-ifupdown, the interfaces file needs to get
moved for the beagleboard

[YOCTO #4334]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../init-ifupdown-1.0}/beagleboard/interfaces                          |    0
 .../netbase_5.0.bbappend => init-ifupdown/init-ifupdown_1.0.bbappend}  |    0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-yocto-bsp/recipes-core/{netbase/netbase-5.0 => init-ifupdown/init-ifupdown-1.0}/beagleboard/interfaces (100%)
 rename meta-yocto-bsp/recipes-core/{netbase/netbase_5.0.bbappend => init-ifupdown/init-ifupdown_1.0.bbappend} (100%)

diff --git a/meta-yocto-bsp/recipes-core/netbase/netbase-5.0/beagleboard/interfaces b/meta-yocto-bsp/recipes-core/init-ifupdown/init-ifupdown-1.0/beagleboard/interfaces
similarity index 100%
rename from meta-yocto-bsp/recipes-core/netbase/netbase-5.0/beagleboard/interfaces
rename to meta-yocto-bsp/recipes-core/init-ifupdown/init-ifupdown-1.0/beagleboard/interfaces
diff --git a/meta-yocto-bsp/recipes-core/netbase/netbase_5.0.bbappend b/meta-yocto-bsp/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
similarity index 100%
rename from meta-yocto-bsp/recipes-core/netbase/netbase_5.0.bbappend
rename to meta-yocto-bsp/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
-- 
1.7.10.4



