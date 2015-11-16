Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 59E93763F8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 08:57:59 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 16 Nov 2015 00:58:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,301,1444719600"; d="scan'208";a="839503259"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 16 Nov 2015 00:58:00 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 6D2BC6A4083
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 00:56:54 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Nov 2015 10:58:50 +0200
Message-Id: <1447664330-13081-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] mc: upgrade to 4.8.15
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
X-List-Received-Date: Mon, 16 Nov 2015 08:58:03 -0000

4.8.14 -> 4.8.15

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-extended/mc/{mc_4.8.14.bb => mc_4.8.15.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/mc/{mc_4.8.14.bb => mc_4.8.15.bb} (93%)

diff --git a/meta/recipes-extended/mc/mc_4.8.14.bb b/meta/recipes-extended/mc/mc_4.8.15.bb
similarity index 93%
rename from meta/recipes-extended/mc/mc_4.8.14.bb
rename to meta/recipes-extended/mc/mc_4.8.15.bb
index 3b6c2ff..ed53760 100644
--- a/meta/recipes-extended/mc/mc_4.8.14.bb
+++ b/meta/recipes-extended/mc/mc_4.8.15.bb
@@ -8,9 +8,8 @@ RDEPENDS_${PN} = "ncurses-terminfo"
 
 SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2 \
            "
-
-SRC_URI[md5sum] = "fe1cb75643c2bd4df64bbcf2dab76905"
-SRC_URI[sha256sum] = "61fd0fd2280c3d09d7e0aec8ab001fc89dad8e4fd9941f386414667b55152ec5"
+SRC_URI[md5sum] = "db48ce26ba425a61edc51930e94227fd"
+SRC_URI[sha256sum] = "f74e3da70410975cdeb27ee9a66d1dd812250b6d3ede364bca728dd5a48e5471"
 
 inherit autotools gettext pkgconfig
 
-- 
2.4.0


