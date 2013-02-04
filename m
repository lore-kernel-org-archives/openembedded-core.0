Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1U2IZO-0005ZS-L8
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 10:42:36 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 04 Feb 2013 01:26:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,598,1355126400"; d="scan'208";a="282427171"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by fmsmga001.fm.intel.com with ESMTP; 04 Feb 2013 01:26:19 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Feb 2013 11:26:09 +0200
Message-Id: <ff4039a533e01156e1b64a1695b9fb3a1d3dbe68.1359968730.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1359968730.git.laurentiu.palcu@intel.com>
References: <cover.1359968730.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1359968730.git.laurentiu.palcu@intel.com>
References: <cover.1359968730.git.laurentiu.palcu@intel.com>
Subject: [PATCH 5/5] rpm: remove /var/volatiles/cache/rpm from the FILEs list
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

Since /var/cache is not in volatiles anymore, this entry has to go.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-devtools/rpm/rpm_5.4.9.bb |    1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index 881b960..39b0481 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -223,7 +223,6 @@ FILES_${PN} =  "${bindir}/rpm \
 		${libdir}/rpm/bin/wget \
 		/var/lib/rpm \
 		/var/cache/rpm \
-		/var/volatile/cache/rpm \
 		"
 
 FILES_${PN}-dbg += "${libdir}/rpm/.debug \
-- 
1.7.9.5



