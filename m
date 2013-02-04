Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1U2IZN-0005Zi-Jw
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 10:42:36 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 04 Feb 2013 01:26:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,598,1355126400"; d="scan'208";a="282427166"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by fmsmga001.fm.intel.com with ESMTP; 04 Feb 2013 01:26:18 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Feb 2013 11:26:08 +0200
Message-Id: <c9656e5817f7728bc13636b59ab414fb66dd3fd4.1359968730.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1359968730.git.laurentiu.palcu@intel.com>
References: <cover.1359968730.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1359968730.git.laurentiu.palcu@intel.com>
References: <cover.1359968730.git.laurentiu.palcu@intel.com>
Subject: [PATCH 4/5] systemd: remove /var/cache from volatiles
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
X-List-Received-Date: Mon, 04 Feb 2013 09:42:39 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../systemd/systemd/00-create-volatile.conf        |    1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd/00-create-volatile.conf b/meta/recipes-core/systemd/systemd/00-create-volatile.conf
index d160a9b..6163a9c 100644
--- a/meta/recipes-core/systemd/systemd/00-create-volatile.conf
+++ b/meta/recipes-core/systemd/systemd/00-create-volatile.conf
@@ -3,7 +3,6 @@
 # inside /var/log.
 
 
-d		/var/volatile/cache	-	-	-	-
 d		/var/volatile/log		-	-	-	-
 d		/var/volatile/lock		-	-	-	-
 d		/var/volatile/run		-	-	-	-
-- 
1.7.9.5



