Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1Rp1rv-0002ZG-Vx
	for openembedded-core@lists.openembedded.org;
	Sun, 22 Jan 2012 19:10:20 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 22 Jan 2012 10:02:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="99362155"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by orsmga001.jf.intel.com with ESMTP; 22 Jan 2012 10:02:38 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2012 02:06:22 +0800
Message-Id: <6d0fc0863871057d2ee0c4b453ae891a4b20e788.1327255446.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <a3776c81de568353900eec28bb7f10372875e727.1327255445.git.shane.wang@intel.com>
References: <a3776c81de568353900eec28bb7f10372875e727.1327255445.git.shane.wang@intel.com>
In-Reply-To: <cover.1327255445.git.shane.wang@intel.com>
References: <cover.1327255445.git.shane.wang@intel.com>
Subject: [PATCH 17/18] libsoup: update its info in distro_tracking.inc
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
X-List-Received-Date: Sun, 22 Jan 2012 18:10:20 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index b7af42c..beb02b8 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -59,7 +59,7 @@ RECIPE_MANUAL_CHECK_DATE_pn-autogen = "Jan 17, 2012"
 RECIPE_MAINTAINER_pn-autogen = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-libsoup = "red"
-RECIPE_LATEST_VERSION_pn-libsoup = "check"
+RECIPE_LATEST_VERSION_pn-libsoup = "2.2.105"
 RECIPE_LAST_UPDATE_pn-libsoup = "Sep 22, 2008"
 RECIPE_MAINTAINER_pn-libsoup = "Zhai Edwin <edwin.zhai@intel.com>"
 
-- 
1.7.6



