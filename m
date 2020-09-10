Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.11626.1599700604779323049
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 18:16:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2917640C1C;
	Thu, 10 Sep 2020 01:16:44 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f1CUf7JY7DqK; Thu, 10 Sep 2020 01:16:44 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0DA1C40B96;
	Thu, 10 Sep 2020 01:16:43 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id B761F17446E;
	Wed,  9 Sep 2020 21:16:42 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH v2] cryptodev: bump 1 commit past 1.11 to fix 5.9-rc1+
Date: Wed,  9 Sep 2020 21:16:38 -0400
Message-Id: <1599700598-39322-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

There's one commit on top of 1.11 release that fixes builds against kernel 5.9-rc1+.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - append SRCPV to PV

 meta/recipes-kernel/cryptodev/cryptodev.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/cryptodev/cryptodev.inc b/meta/recipes-kernel/cryptodev/cryptodev.inc
index 906f4fc..027d636 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev.inc
+++ b/meta/recipes-kernel/cryptodev/cryptodev.inc
@@ -5,7 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/cryptodev-linux/cryptodev-linux \
            "
-SRCREV = "2299d39475e91392abd050ea09f2d20feecb4adf"
+SRCREV = "fabe5989a3dc9fba0cd0a40b612247cdde351c01"
+PV .= "+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4

