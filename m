Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QAmPp-0005hg-W9
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Apr 2011 19:02:42 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 15 Apr 2011 10:00:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,220,1301900400"; d="scan'208";a="910143314"
Received: from unknown (HELO helios) ([10.255.12.218])
	by fmsmga001.fm.intel.com with SMTP; 15 Apr 2011 10:00:22 -0700
Received: by helios (sSMTP sendmail emulation); Fri, 15 Apr 2011 18:00:15 +0100
Message-Id: <28086a0fe35538a3aecb00ed405d5cb5a20bcae1.1302886579.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1302886579.git.paul.eggleton@linux.intel.com>
References: <cover.1302886579.git.paul.eggleton@linux.intel.com>
Old-Date: Fri, 15 Apr 2011 17:11:49 +0100
Date: Fri, 15 Apr 2011 18:00:15 +0100
To: openembedded-core@lists.openembedded.org,poky@yoctoproject.org
From: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 1/3] netbase: automatically bring up eth0
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
X-List-Received-Date: Fri, 15 Apr 2011 17:02:42 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

This avoids manual configuration for those machines that do not override
the default /etc/network/interfaces file.

Fixes [YOCTO #875]

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/netbase/netbase-4.45/interfaces |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/netbase/netbase-4.45/interfaces b/meta/recipes-core/netbase/netbase-4.45/interfaces
index b06924f..0acf4cf 100644
--- a/meta/recipes-core/netbase/netbase-4.45/interfaces
+++ b/meta/recipes-core/netbase/netbase-4.45/interfaces
@@ -14,6 +14,7 @@ iface wlan0 inet dhcp
 iface atml0 inet dhcp
 
 # Wired or wireless interfaces
+auto eth0
 iface eth0 inet dhcp
 iface eth1 inet dhcp
 
-- 
1.7.1



