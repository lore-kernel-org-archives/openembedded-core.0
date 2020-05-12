Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.6636.1589292859644308289
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2020 07:14:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=WlSrwa2H;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=h6oi=62=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49M0D96MgCz5R
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2020 16:14:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589292858;
	bh=bU/c67zdQbE674JwcRLl4jya1BzugbQJ/V07PCj4Nnw=;
	h=From:To:Subject:Date:From;
	b=WlSrwa2HzpkCuCi/5ivbjx5c9FyTRV1jYbaauxunWzGzLmqIo3ztj56+kAcDndpm2
	 wYdRCALcdflJNTmfELgjVlWQbzHlEReLRqyjoDeXmMAMEtzW/37qZAlBUAVouUc28u
	 3u7WMmDwgL8oPZ5OdTFurkF1+Qe4LqChlgq7QmlgR1vp07YQFW0aeP2Y7s5LG20fBi
	 9la9VaMmhFitTTGtschYC5tFfpQgwfhUPoTPLYcbCjayXi5NWrUg+s+p/L5puMFdL/
	 SW1G0Cbh1IHto/L/ZS7BqX20ss4WqFnnZUte2vxq9c4i0BrUyW6iFltzYRJrOJAcqI
	 O3geZdmBaSSp82cv/iBE6MODSjEa8Be5yBTf8l9IMvlyRbjMOjZFF5wj9Y9nPCelrU
	 8bU/NDNyCmGJMI6eP6FKQ+A7qeOww24PwIsk4F5Tg5w297DbPEiBp+cJH/+mcKshOv
	 U1br8eR7pfnZI5TvTYqA/OnyuSVFJ72QNRInOKnpLWeRui4MoE/VXXbbeF8KpElSwz
	 gpqUjy0u+/2PjWibKRIMq7kjod19Zjq0XNWyHm2mepISUoacarQhplaooqaSrAcke2
	 5RaEOTOdto4q3c4wQ3g7gtNOd7KPnm/FFmv+ZGQHo0La/QJ2q6bwXQjzoUlY201osl
	 0kO4+LZxfIgPJC2EjYP0MRss=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] libxcrypt2: Remove -fcommon
Date: Tue, 12 May 2020 17:14:10 +0300
Message-Id: <20200512141416.5327-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

This was fixed in upstream version 4.4.12.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-core/libxcrypt/libxcrypt.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index bee1367c99..2d2a0b03e3 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -27,8 +27,6 @@ BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
 TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir} -Wno-error"
 CPPFLAGS_append_class-nativesdk = " -Wno-error"
 
-CFLAGS += "-fcommon"
-
 API = "--disable-obsolete-api"
 EXTRA_OECONF += "${API}"
 
-- 
2.17.1

