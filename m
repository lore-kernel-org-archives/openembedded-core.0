Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.20911.1602867648215071234
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 10:00:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7DCFD40BD6;
	Fri, 16 Oct 2020 17:00:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r_Vbx-L-EF2w; Fri, 16 Oct 2020 17:00:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6275C40024;
	Fri, 16 Oct 2020 17:00:46 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id B5782174499;
	Fri, 16 Oct 2020 13:00:45 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] grep: upgrade 3.4 -> 3.5
Date: Fri, 16 Oct 2020 13:00:40 -0400
Message-Id: <1602867640-37529-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta/recipes-extended/grep/{grep_3.4.bb => grep_3.5.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-extended/grep/{grep_3.4.bb => grep_3.5.bb} (89%)

diff --git a/meta/recipes-extended/grep/grep_3.4.bb b/meta/recipes-extended/grep/grep_3.5.bb
similarity index 89%
rename from meta/recipes-extended/grep/grep_3.4.bb
rename to meta/recipes-extended/grep/grep_3.5.bb
index e176dd7..22ef70b 100644
--- a/meta/recipes-extended/grep/grep_3.4.bb
+++ b/meta/recipes-extended/grep/grep_3.5.bb
@@ -7,8 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "111b117d22d6a7d049d6ae7505e9c4d2"
-SRC_URI[sha256sum] = "58e6751c41a7c25bfc6e9363a41786cff3ba5709cf11d5ad903cf7cce31cc3fb"
+SRC_URI[sha256sum] = "b82ac77707c2ab945520c8404c9fa9f890f7791a62cf2103cf6238acad87a44a"
 
 inherit autotools gettext texinfo pkgconfig
 
-- 
2.7.4

