Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id B003F747FB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 23:17:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A5A0120BB1;
	Mon, 21 May 2018 23:17:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 1GNo_XWq0-Y8; Mon, 21 May 2018 23:17:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 89F71204D6;
	Mon, 21 May 2018 23:17:55 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 3CA3916342D;
	Mon, 21 May 2018 19:17:55 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 May 2018 19:17:41 -0400
Message-Id: <822034c0ed2bc9609424f61ca8a1f5c55b89d747.1526944475.git.denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1526944475.git.denys@ti.com>
References: <cover.1526944475.git.denys@ti.com>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 1/4] hdparm: upgrade 9.55 -> 9.56
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
X-List-Received-Date: Mon, 21 May 2018 23:17:56 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta/recipes-extended/hdparm/{hdparm_9.55.bb => hdparm_9.56.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/hdparm/{hdparm_9.55.bb => hdparm_9.56.bb} (90%)

diff --git a/meta/recipes-extended/hdparm/hdparm_9.55.bb b/meta/recipes-extended/hdparm/hdparm_9.56.bb
similarity index 90%
rename from meta/recipes-extended/hdparm/hdparm_9.55.bb
rename to meta/recipes-extended/hdparm/hdparm_9.56.bb
index c50e73f..17932ad 100644
--- a/meta/recipes-extended/hdparm/hdparm_9.55.bb
+++ b/meta/recipes-extended/hdparm/hdparm_9.56.bb
@@ -25,8 +25,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/hdparm/${BP}.tar.gz \
            file://wiper.sh-fix-stat-path.patch \
           "
 
-SRC_URI[md5sum] = "adae46e9564075ae288af8082d5ad9fd"
-SRC_URI[sha256sum] = "b5c76b732483df36bf08001a209b95b45558016615f935008e5ea91a7fde6dc7"
+SRC_URI[md5sum] = "7900608e32834f65d2654fdb696e71a0"
+SRC_URI[sha256sum] = "6ff9ed695f1017396eec4101f990f114b7b0e0a04c5aa6369c0394053d16e4da"
 
 EXTRA_OEMAKE = 'STRIP="echo" LDFLAGS="${LDFLAGS}"'
 
-- 
2.7.4


