Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BF23E7327E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 08:43:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tBM8hvs3005596
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 22 Dec 2015 00:43:57 -0800
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 22 Dec 2015 00:43:55 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <randy.macleod@windriver.com>, 
	<ross.burton@intel.com>, <jackie.huang@windriver.com>,
	<mark.hatle@windriver.com>, <liezhi.yang@windriver.com>
Date: Tue, 22 Dec 2015 16:43:20 +0800
Message-ID: <41cf19965419fa391815e56eff811f54c8d16c9c.1450772654.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1450772654.git.hongxu.jia@windriver.com>
References: <cover.1450772654.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] connman.inc: add networkmanager to RCONFLICTS
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
X-List-Received-Date: Tue, 22 Dec 2015 08:43:59 -0000
Content-Type: text/plain

Since networkmanager add connman to its RCONFLICTS,
The connman should do the same thing.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-connectivity/connman/connman.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 76e61b4..a4b814a 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -109,6 +109,8 @@ RDEPENDS_${PN} = "\
 	dbus \
 	"
 
+RCONFLICTS_${PN} = "networkmanager"
+
 PACKAGES_DYNAMIC += "^${PN}-plugin-.*"
 
 def add_rdepends(bb, d, file, pkg, depmap, multilib_prefix, add_insane_skip):
-- 
1.9.1


