Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 678317D697
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 03:23:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5I3MZCt032706
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2019 20:22:51 -0700
Received: from localhost (128.224.162.136) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Mon, 17 Jun 2019 20:22:26 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Jun 2019 11:22:24 +0800
Message-ID: <1560828144-19475-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.136]
Subject: [PATCH] less: upgrade 550 -> 551
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
X-List-Received-Date: Tue, 18 Jun 2019 03:23:00 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-extended/less/{less_550.bb => less_551.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/less/{less_550.bb => less_551.bb} (89%)

diff --git a/meta/recipes-extended/less/less_550.bb b/meta/recipes-extended/less/less_551.bb
similarity index 89%
rename from meta/recipes-extended/less/less_550.bb
rename to meta/recipes-extended/less/less_551.bb
index bb1618f..a818c68 100644
--- a/meta/recipes-extended/less/less_550.bb
+++ b/meta/recipes-extended/less/less_551.bb
@@ -28,8 +28,8 @@ DEPENDS = "ncurses"
 SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
 	  "
 
-SRC_URI[md5sum] = "8caff88e34afff512b663d7c690bd2cf"
-SRC_URI[sha256sum] = "6a53639f08d7ed05b6e104b82c32193f79ac01a3eddb20e114e1c261948bd57b"
+SRC_URI[md5sum] = "4ad4408b06d7a6626a055cb453f36819"
+SRC_URI[sha256sum] = "ff165275859381a63f19135a8f1f6c5a194d53ec3187f94121ecd8ef0795fe3d"
 
 UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
 
-- 
2.7.4


