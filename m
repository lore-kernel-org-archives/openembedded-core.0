Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.666.1589315874388412108
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2020 13:37:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=fyJD2N3G;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=h6oi=62=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49M8kl2ZFvzJD
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2020 22:37:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589315871;
	bh=CtkSTnpREk+rxUAWuzd9RKNbWGnzyd87sfr6/LX1c0I=;
	h=From:To:Subject:Date:From;
	b=fyJD2N3GauwC4SJJFnQgT2h+ytgaQqVxnnuY7DlQWrC6G3kyeIX3xydz2fZm0L+lB
	 +Zht7l66tGD62ZfCTnhFKKD6sBwKZ0meB4zlrJbDtOOtcYlLobtjDZ1JWwBLhKJL/j
	 Wuptv/9eDLlq1MIq+p4NA42KP57qUmPbJoeQRi4hyIDP84wdDleKdCnKGa6HAz3iBk
	 JuKOcju5Jcpq9I0+Lm0rKhxFez3jf2QpehynQ7PP6o5tz9h5Zn9CkKT4bOwD7QNi0q
	 hIzGBAbKEZiQGpSgS7RR2HRu8w7pIsYs8pO1vQJVlkY19ycfe3tS5ROq1JiUE1H00K
	 CNhsTKGYRq4mlPPxvXBZ8pMNJQkH55WBbDgBzwIfgoHGYF6sWBfekLBPmCxS36gjXX
	 WUVZ6EAfgSt7MboUh0iHMPjSx5KF+U8Q+TOyXVXPatlqvJcMIKFDSYeLFolDIwGV7Q
	 0kaf0v0UfOeABbT0r5bfX82x1rXaUBR+xKk1ECmBbjZGGG++9gKQqJcpNqTx8kiSmT
	 bJHvkzNIClHVKlb+DVmDj8Rv9gWsWgsfuqTK054aspohw/r4wqqRK+cxLLnfzciMJd
	 xXqfbNtA1za36bFDaclw9glrUUa+f9z0k+XsPxecZRpIrO3ebiSNWMIb4CmhfzBkxx
	 9sy5akjGoNQ+QRBfVGl2Ysas=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] libtasn1: Remove workaround for host gcc < 5
Date: Tue, 12 May 2020 23:37:47 +0300
Message-Id: <20200512203748.8779-4-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-support/gnutls/libtasn1_4.16.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-support/gnutls/libtasn1_4.16.0.bb b/meta/recipes-support/gnutls/libtasn1_4.16.0.bb
index 8337b70241..18dae6d0c9 100644
--- a/meta/recipes-support/gnutls/libtasn1_4.16.0.bb
+++ b/meta/recipes-support/gnutls/libtasn1_4.16.0.bb
@@ -19,6 +19,4 @@ SRC_URI[sha256sum] = "0e0fb0903839117cb6e3b56e68222771bebf22ad7fc2295a0ed7d576e8
 
 inherit autotools texinfo lib_package gtk-doc
 
-CFLAGS_append_class-native = " -std=gnu99"
-
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

