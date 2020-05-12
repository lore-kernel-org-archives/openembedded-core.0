Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web11.6559.1589292860573511465
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2020 07:14:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=m2XDBGT2;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=h6oi=62=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49M0DB59LgzJD
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2020 16:14:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589292858;
	bh=Txvgr1FtkACXTbpwiq5MUeqW3MtEBnoMkSK9DhHbZTE=;
	h=From:To:Subject:Date:From;
	b=m2XDBGT25KfPgvJxG8veeXtzfVwLVFtiLyQyYFMSavO5xeEcPgXOh6jCN6RLpsHJS
	 4OjID5aXPpoblK0XUAxEVDlSXXisgtnMM1DKhjrdJ9hHpH4veRRZfYgcVmm6Sc2FxR
	 tLmuMZnmMX5mtea4uB8PHVuses9Mtio2Km9gorSRPw9T84J2/tkl/uene3SHwmSTGt
	 gGpzwI8Xm/63h/+RJMNpLD4bPFiEiIlEyNcqNMosDq5XTHCQj03oLHLlaM4V9eoOzY
	 Kpjf9L3k09gMQZe9ihUyQ7cd3z5P2BeIlHgW/AzDm9JSn60gDIdhXrKm7L2m6DWH7X
	 YQMqJhZGIdGC3YgwhFHdgW+mpaSsD+OJorLacMuZ7KQMMYccXFAIymAAJOmpgOxD5t
	 Q1l3FF2/VCnKz46Ed36QJ64cWA+Wh3Q9E+Rea+38tKRsRRjSp8roZxb7N0PFfW15+8
	 9hdwy4ovZTapa9/PWSMhNIx9z8v1AF8tvLDqOXOzMIqvIH4a3kEW+aBy5Mz6vmHOA7
	 1czjkPwl3mKWlmWpPv7eXF3DbkNDb20xZnZ+/HPn1YL+9ROvj9xPD2jsKkPyuipW58
	 dJch7vBL0x+zz7PKLqWDyt1p9wGmR6RkZLyjstzWChA3yReJAozWognqAfuaISr68l
	 kQztG1GtJfbc+EihRzEKbGdI=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] mesa: Remove -fcommon
Date: Tue, 12 May 2020 17:14:12 +0300
Message-Id: <20200512141416.5327-4-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

This was fixed in upstream version 20.0.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-graphics/mesa/mesa_20.0.2.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa_20.0.2.bb b/meta/recipes-graphics/mesa/mesa_20.0.2.bb
index 56ee28c870..ee0260e073 100644
--- a/meta/recipes-graphics/mesa/mesa_20.0.2.bb
+++ b/meta/recipes-graphics/mesa/mesa_20.0.2.bb
@@ -14,8 +14,6 @@ SRC_URI[sha256sum] = "aa54f1cb669550606aab8ceb475105d15aeb814fca5a778ce70d0fd10e
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-CFLAGS += "-fcommon"
-
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
 do_install_append() {
-- 
2.17.1

