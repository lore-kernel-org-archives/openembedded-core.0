Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.7579.1599688065184849859
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 14:47:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9089340C13;
	Wed,  9 Sep 2020 21:47:44 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tKVnV9vMEDZv; Wed,  9 Sep 2020 21:47:44 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 772B240BFD;
	Wed,  9 Sep 2020 21:47:43 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 3862E17446E;
	Wed,  9 Sep 2020 17:47:43 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] cryptodev: bump 1 commit past 1.11 to fix 5.9-rc1+
Date: Wed,  9 Sep 2020 17:47:43 -0400
Message-Id: <1599688063-38109-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

There's one commit on top of 1.11 release that fixes builds against kernel 5.9-rc1+.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta/recipes-kernel/cryptodev/cryptodev.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/cryptodev/cryptodev.inc b/meta/recipes-kernel/cryptodev/cryptodev.inc
index 906f4fc..c050eda 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev.inc
+++ b/meta/recipes-kernel/cryptodev/cryptodev.inc
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/cryptodev-linux/cryptodev-linux \
            "
-SRCREV = "2299d39475e91392abd050ea09f2d20feecb4adf"
+SRCREV = "fabe5989a3dc9fba0cd0a40b612247cdde351c01"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4

