Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 0F63178A27
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 01:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6E9D82098D;
	Tue, 20 Mar 2018 01:11:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 4O3BqPUdV_G9; Tue, 20 Mar 2018 01:11:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5271420B46;
	Tue, 20 Mar 2018 01:11:19 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id E4513163376;
	Mon, 19 Mar 2018 21:11:18 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Mar 2018 21:11:09 -0400
Message-Id: <ba3039f52e26f4db6f8e5dc68d2005c0551875ea.1521507765.git.denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1521507765.git.denys@ti.com>
References: <cover.1521507765.git.denys@ti.com>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 2/3] hdparm: upgrade 9.53 -> 9.55
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
X-List-Received-Date: Tue, 20 Mar 2018 01:11:19 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta/recipes-extended/hdparm/{hdparm_9.53.bb => hdparm_9.55.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/hdparm/{hdparm_9.53.bb => hdparm_9.55.bb} (90%)

diff --git a/meta/recipes-extended/hdparm/hdparm_9.53.bb b/meta/recipes-extended/hdparm/hdparm_9.55.bb
similarity index 90%
rename from meta/recipes-extended/hdparm/hdparm_9.53.bb
rename to meta/recipes-extended/hdparm/hdparm_9.55.bb
index 4c3ec5c..c50e73f 100644
--- a/meta/recipes-extended/hdparm/hdparm_9.53.bb
+++ b/meta/recipes-extended/hdparm/hdparm_9.55.bb
@@ -25,8 +25,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/hdparm/${BP}.tar.gz \
            file://wiper.sh-fix-stat-path.patch \
           "
 
-SRC_URI[md5sum] = "1e54b52e0c8cb79389d4d47eacba411d"
-SRC_URI[sha256sum] = "2673f591df6916c6a1faec07069a7eb1cb8ee307615a615d808192fb0c0265e5"
+SRC_URI[md5sum] = "adae46e9564075ae288af8082d5ad9fd"
+SRC_URI[sha256sum] = "b5c76b732483df36bf08001a209b95b45558016615f935008e5ea91a7fde6dc7"
 
 EXTRA_OEMAKE = 'STRIP="echo" LDFLAGS="${LDFLAGS}"'
 
-- 
2.7.4


