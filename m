Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.527.1589835719080742426
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2020 14:01:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7FFE540AF3;
	Mon, 18 May 2020 21:01:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NqLRlybzZqzs; Mon, 18 May 2020 21:01:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 60E1840A9E;
	Mon, 18 May 2020 21:01:57 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 2449C16F347;
	Mon, 18 May 2020 17:01:57 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] xz: upgrade 5.2.4 -> 5.2.5
Date: Mon, 18 May 2020 17:01:55 -0400
Message-Id: <1589835715-23069-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta/recipes-extended/xz/{xz_5.2.4.bb => xz_5.2.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/xz/{xz_5.2.4.bb => xz_5.2.5.bb} (91%)

diff --git a/meta/recipes-extended/xz/xz_5.2.4.bb b/meta/recipes-extended/xz/xz_5.2.5.bb
similarity index 91%
rename from meta/recipes-extended/xz/xz_5.2.4.bb
rename to meta/recipes-extended/xz/xz_5.2.5.bb
index 1c4450a..af21b60 100644
--- a/meta/recipes-extended/xz/xz_5.2.4.bb
+++ b/meta/recipes-extended/xz/xz_5.2.5.bb
@@ -23,8 +23,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=97d554a32881fee0aa283d96e47cb24a \
                     "
 
 SRC_URI = "https://tukaani.org/xz/xz-${PV}.tar.gz"
-SRC_URI[md5sum] = "5ace3264bdd00c65eeec2891346f65e6"
-SRC_URI[sha256sum] = "b512f3b726d3b37b6dc4c8570e137b9311e7552e8ccbab4d39d47ce5f4177145"
+SRC_URI[md5sum] = "0d270c997aff29708c74d53f599ef717"
+SRC_URI[sha256sum] = "f6f4910fd033078738bd82bfba4f49219d03b17eb0794eb91efbae419f4aba10"
 UPSTREAM_CHECK_REGEX = "xz-(?P<pver>\d+(\.\d+)+)\.tar"
 
 CACHED_CONFIGUREVARS += "gl_cv_posix_shell=/bin/sh"
-- 
2.7.4

