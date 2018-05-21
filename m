Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id B0E5F7488C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 23:17:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D99E7204D6;
	Mon, 21 May 2018 23:17:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id EacovGuul1mH; Mon, 21 May 2018 23:17:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BBC9A20B82;
	Mon, 21 May 2018 23:17:55 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 48B06163482;
	Mon, 21 May 2018 19:17:55 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 May 2018 19:17:42 -0400
Message-Id: <65159aac07effae51da8058ec3a2b071b1665151.1526944475.git.denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1526944475.git.denys@ti.com>
References: <cover.1526944475.git.denys@ti.com>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 2/4] lz4: upgrade 1.8.1.2 -> 1.8.2
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
 meta/recipes-support/lz4/{lz4_1.8.1.2.bb => lz4_1.8.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/lz4/{lz4_1.8.1.2.bb => lz4_1.8.2.bb} (94%)

diff --git a/meta/recipes-support/lz4/lz4_1.8.1.2.bb b/meta/recipes-support/lz4/lz4_1.8.2.bb
similarity index 94%
rename from meta/recipes-support/lz4/lz4_1.8.1.2.bb
rename to meta/recipes-support/lz4/lz4_1.8.2.bb
index 03017b3..5ad17e1 100644
--- a/meta/recipes-support/lz4/lz4_1.8.1.2.bb
+++ b/meta/recipes-support/lz4/lz4_1.8.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://lib/LICENSE;md5=ebc2ea4814a64de7708f1571904b32cc \
 
 PE = "1"
 
-SRCREV = "dfed9fa1d77f0434306d377c4da1f7191d3ba08a"
+SRCREV = "b3692db46d2b23a7c0af2d5e69988c94f126e10a"
 
 SRC_URI = "git://github.com/lz4/lz4.git \
            file://run-ptest \
-- 
2.7.4


