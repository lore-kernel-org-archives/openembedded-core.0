Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id D977778A09
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 01:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4165D20B92;
	Tue, 20 Mar 2018 01:11:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id hW8MrMqarNDs; Tue, 20 Mar 2018 01:11:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 26FC72098D;
	Tue, 20 Mar 2018 01:11:19 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id D7DD8163373;
	Mon, 19 Mar 2018 21:11:18 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Mar 2018 21:11:08 -0400
Message-Id: <528d30b56fa423bae1c80d28ccccc574f6065c20.1521507765.git.denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1521507765.git.denys@ti.com>
References: <cover.1521507765.git.denys@ti.com>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 1/3] lzip: upgrade 1.19 -> 1.20
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
 meta/recipes-extended/lzip/{lzip_1.19.bb => lzip_1.20.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/lzip/{lzip_1.19.bb => lzip_1.20.bb} (88%)

diff --git a/meta/recipes-extended/lzip/lzip_1.19.bb b/meta/recipes-extended/lzip/lzip_1.20.bb
similarity index 88%
rename from meta/recipes-extended/lzip/lzip_1.19.bb
rename to meta/recipes-extended/lzip/lzip_1.20.bb
index 099b364..d1fc2a1 100644
--- a/meta/recipes-extended/lzip/lzip_1.19.bb
+++ b/meta/recipes-extended/lzip/lzip_1.20.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=76d6e300ffd8fb9d18bd9b136a9bba13 \
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/lzip/lzip-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "4dd8790d7528440d034fc713a8680bd3"
-SRC_URI[sha256sum] = "ffadc4f56be1bc0d3ae155ec4527bd003133bdc703a753b2cc683f610e646ba9"
+SRC_URI[md5sum] = "21c1517da2ace9689fd953918660b3c3"
+SRC_URI[sha256sum] = "c93b81a5a7788ef5812423d311345ba5d3bd4f5ebf1f693911e3a13553c1290c"
 
 CONFIGUREOPTS = "\
     '--srcdir=${S}' \
-- 
2.7.4


