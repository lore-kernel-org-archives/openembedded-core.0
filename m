Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web11.7817.1587124094594937425
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Apr 2020 04:48:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=aO8sFwJw;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 0683960133;
	Fri, 17 Apr 2020 13:48:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1587124092;
	bh=XjKxojWq7G+K2L66p4tHVAwQ9u6RP7ztnE5w8dIoXqM=;
	h=From:To:Cc:Subject:Date:From;
	b=aO8sFwJwZQSnzTbJZ7H//IjR8ZmfHjX3lXGjiShBFtufYcrMb1Ydd2VClJNHQBNDx
	 vX2E0lMbzHln3CLGqOeLx+fwfoYowOfTxE+/ZG11SxAHPqbKJtuSFwNbQTKj7PD5E7
	 A08AUN5ddSvrwf1L6fN6yGmbzktzbjScoQDvWvrIHZL+5y2Whyipi7S9vh5BkomA6l
	 3bOsD6uhw9Pog/W4KspOfTIITDlKdXXlXfxPaVndHeVSdMbtpURyTRRALKlmuDO0Rt
	 0wTCKHAKb+GAVX1gWWrzn9FM/cl36rpsUIwqQWCtmlK4rdoPnOyIiyR2TL2NDKkXEX
	 pFCaix9nQ/rQw==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-core@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [PATCH] ell: upgrade 0.30 -> 0.31
Date: Fri, 17 Apr 2020 13:47:11 +0200
Message-Id: <1587124031-7778-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

This is a bugfix release:

ver 0.31:
	Fix issue with verification of the second certificate in chain.
	Fix issue with handling trusted CA matching in verification.

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta/recipes-core/ell/{ell_0.30.bb => ell_0.31.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/ell/{ell_0.30.bb => ell_0.31.bb} (83%)

diff --git a/meta/recipes-core/ell/ell_0.30.bb b/meta/recipes-core/ell/ell_0.31.bb
similarity index 83%
rename from meta/recipes-core/ell/ell_0.30.bb
rename to meta/recipes-core/ell/ell_0.31.bb
index 17045b3..1db7131 100644
--- a/meta/recipes-core/ell/ell_0.30.bb
+++ b/meta/recipes-core/ell/ell_0.31.bb
@@ -14,8 +14,8 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "79c757858688cc6c36087605234d87a8"
-SRC_URI[sha256sum] = "51cf8cc66a9d1038e41f7d619ea5660aa4476904496562b2d45ca79370ca4a5e"
+SRC_URI[md5sum] = "3f670230be4d89d621b0508c70b1d36b"
+SRC_URI[sha256sum] = "ae88617275452f9f5840b2365e33e6c7fb6fa3405d42cbf9367de642ee8b6701"
 
 do_configure_prepend () {
     mkdir -p ${S}/build-aux
-- 
2.7.4

