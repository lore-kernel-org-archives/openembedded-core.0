Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 599DC6CEF9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2014 16:27:06 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 08 Jan 2014 08:27:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,625,1384329600"; d="scan'208";a="455528058"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 08 Jan 2014 08:27:01 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jan 2014 18:29:40 +0200
Message-Id: <aad23c0025f82e7d39608ef7dbed3def3ece0445.1389198449.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1389198449.git.cristian.iorga@intel.com>
References: <cover.1389198449.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1389198449.git.cristian.iorga@intel.com>
References: <cover.1389198449.git.cristian.iorga@intel.com>
Subject: [PATCH v2 1/2] netbase: upgrade to 5.2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Jan 2014 16:27:08 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-core/netbase/{netbase_5.1.bb => netbase_5.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/netbase/{netbase_5.1.bb => netbase_5.2.bb} (84%)

diff --git a/meta/recipes-core/netbase/netbase_5.1.bb b/meta/recipes-core/netbase/netbase_5.2.bb
similarity index 84%
rename from meta/recipes-core/netbase/netbase_5.1.bb
rename to meta/recipes-core/netbase/netbase_5.2.bb
index 2b1df07..ab7ae65 100644
--- a/meta/recipes-core/netbase/netbase_5.1.bb
+++ b/meta/recipes-core/netbase/netbase_5.2.bb
@@ -9,8 +9,8 @@ PE = "1"
 SRC_URI = "${DEBIAN_MIRROR}/main/n/netbase/netbase_${PV}.tar.gz \
            file://hosts"
 
-SRC_URI[md5sum] = "d9ba76be063eb9b31fc60e14ad8a1206"
-SRC_URI[sha256sum] = "0d291fa48e3f6490601b8e8ad62804c530cc937665a79e5c69510cd3c5ec889e"
+SRC_URI[md5sum] = "3a01bfce6a28e1743412198abd241262"
+SRC_URI[sha256sum] = "d62ba56d62b9b121664828175c2a237a7014ef32df8a4116ea33cff332de3307"
 
 do_install () {
 	install -d ${D}/${mandir}/man8 ${D}${sysconfdir}
-- 
1.8.3.2


