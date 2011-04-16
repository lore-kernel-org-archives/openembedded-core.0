Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QAzSa-0006Lg-OT
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Apr 2011 08:58:24 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 15 Apr 2011 23:56:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,223,1301900400"; d="scan'208";a="679866118"
Received: from unknown (HELO localhost) ([10.255.12.232])
	by fmsmga002.fm.intel.com with ESMTP; 15 Apr 2011 23:55:46 -0700
Message-Id: <ab3742511791a775767bb11924ea658b29016c32.1302936483.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302936483.git.sgw@linux.intel.com>
References: <cover.1302936483.git.sgw@linux.intel.com>
Old-Date: Fri, 15 Apr 2011 17:11:49 +0100
Date: Fri, 15 Apr 2011 23:55:46 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Sat, 16 Apr 2011 12:03:17 +0200
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Jingdong Lu <jingdong.lu@windriver.com>, Kang Kai <kai.kang@windriver.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>
Subject: [PATCH 55/58] netbase: automatically bring up eth0
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
X-List-Received-Date: Sat, 16 Apr 2011 06:58:25 -0000

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
1.7.1.1



