Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1U2IZE-0005ZS-No
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 10:42:26 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 04 Feb 2013 01:26:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,598,1355126400"; d="scan'208";a="282427144"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by fmsmga001.fm.intel.com with ESMTP; 04 Feb 2013 01:26:15 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Feb 2013 11:26:06 +0200
Message-Id: <2ba7e1531b0bb6f7280aa242470b3c34bd89e635.1359968730.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1359968730.git.laurentiu.palcu@intel.com>
References: <cover.1359968730.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1359968730.git.laurentiu.palcu@intel.com>
References: <cover.1359968730.git.laurentiu.palcu@intel.com>
Subject: [PATCH 2/5] fs-perms: remove /var/cache from volatiles
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
X-List-Received-Date: Mon, 04 Feb 2013 09:42:30 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/files/fs-perms.txt |    1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/files/fs-perms.txt b/meta/files/fs-perms.txt
index f5a2b69..ef44e26 100644
--- a/meta/files/fs-perms.txt
+++ b/meta/files/fs-perms.txt
@@ -45,7 +45,6 @@ ${oldincludedir}	0755	root	root	true	0644	root	root
 
 # Items from base-files
 # Links
-${localstatedir}/cache	link	volatile/cache
 ${localstatedir}/run	link	volatile/run
 ${localstatedir}/log	link	volatile/log
 ${localstatedir}/lock	link	volatile/lock
-- 
1.7.9.5



