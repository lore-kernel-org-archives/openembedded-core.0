Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7486873167
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 08:21:02 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 04 May 2016 01:20:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,576,1455004800"; d="scan'208";a="968335393"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 04 May 2016 01:20:38 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id BA0696A4007
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 02:08:12 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 May 2016 11:20:20 +0300
Message-Id: <1462350024-29932-7-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1462350024-29932-1-git-send-email-maxin.john@intel.com>
References: <1462350024-29932-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 06/10] mc: upgrade to 4.8.16
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
X-List-Received-Date: Wed, 04 May 2016 08:21:04 -0000

4.8.15 -> 4.8.16

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-extended/mc/{mc_4.8.15.bb => mc_4.8.16.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/mc/{mc_4.8.15.bb => mc_4.8.16.bb} (93%)

diff --git a/meta/recipes-extended/mc/mc_4.8.15.bb b/meta/recipes-extended/mc/mc_4.8.16.bb
similarity index 93%
rename from meta/recipes-extended/mc/mc_4.8.15.bb
rename to meta/recipes-extended/mc/mc_4.8.16.bb
index 6c3a16a..16ed6a9 100644
--- a/meta/recipes-extended/mc/mc_4.8.15.bb
+++ b/meta/recipes-extended/mc/mc_4.8.16.bb
@@ -8,8 +8,8 @@ RDEPENDS_${PN} = "ncurses-terminfo"
 
 SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2 \
            "
-SRC_URI[md5sum] = "db48ce26ba425a61edc51930e94227fd"
-SRC_URI[sha256sum] = "f74e3da70410975cdeb27ee9a66d1dd812250b6d3ede364bca728dd5a48e5471"
+SRC_URI[md5sum] = "b93706dfe66ffe4f61c1a2650798d207"
+SRC_URI[sha256sum] = "c37ea495df93f6d375a3ce59cdcf0f3a3690338526205347b03a316daebdaaf8"
 
 inherit autotools gettext pkgconfig
 
-- 
2.4.0


