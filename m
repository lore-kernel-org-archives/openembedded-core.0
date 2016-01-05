Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CC70B731C8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 14:06:18 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 05 Jan 2016 06:06:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,525,1444719600"; d="scan'208";a="23923675"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 05 Jan 2016 06:06:19 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 13D906A4004
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 06:54:16 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jan 2016 16:08:14 +0200
Message-Id: <1452002894-10301-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1452002894-10301-1-git-send-email-maxin.john@intel.com>
References: <1452002894-10301-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/2] connman: upgrade to 1.31
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
X-List-Received-Date: Tue, 05 Jan 2016 14:06:18 -0000

1.30 -> 1.31

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../recipes-connectivity/connman/{connman_1.30.bb => connman_1.31.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/connman/{connman_1.30.bb => connman_1.31.bb} (77%)

diff --git a/meta/recipes-connectivity/connman/connman_1.30.bb b/meta/recipes-connectivity/connman/connman_1.31.bb
similarity index 77%
rename from meta/recipes-connectivity/connman/connman_1.30.bb
rename to meta/recipes-connectivity/connman/connman_1.31.bb
index 7d65ac9..7b6bcfb 100644
--- a/meta/recipes-connectivity/connman/connman_1.30.bb
+++ b/meta/recipes-connectivity/connman/connman_1.31.bb
@@ -7,8 +7,8 @@ SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
             file://0003-Fix-header-inclusions-for-musl.patch \
             file://connman \
             "
-SRC_URI[md5sum] = "4a3efdbd6796922db9c6f66da57887fa"
-SRC_URI[sha256sum] = "5c5e464bacc9c27ed4e7269fb9b5059f07947f5be26433b59212133663ffa991"
+SRC_URI[md5sum] = "cb1c413fcc4f49430294bbd7a92f5f3c"
+SRC_URI[sha256sum] = "88fcf0b6df334796b90e2fd2e434d6f5b36cd6f13b886a119b8c90276b72b8e2"
 
 RRECOMMENDS_${PN} = "connman-conf"
 
-- 
2.4.0


