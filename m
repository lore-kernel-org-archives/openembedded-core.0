Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web10.4794.1594242489908046883
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2020 14:08:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=Fv9T6+wz;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=z9mr=at=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4B2BjN1Fx7z45
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jul 2020 23:08:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1594242488;
	bh=+tHji7niwTES0fWsTNfCGiei6hIIsZshUjvIiLkavc0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Fv9T6+wzB/M42WFDGLK8Wi8Rx915K4g3F4QEhgLJ0Bm3YmgGEclTVCA6Ul3r7x09g
	 EOOzqR3K+aBoaqQwkP5hk72V1mOuosyleA/yEysM2Vdn5aRwACHBKsBFqoaFPKLJtF
	 ycTZvWgvxpecltEOKLCJYA8M2q6fxksCASROlHR59sDKuRgsW/81jaiKVRANj7cW/n
	 Sc+vXxKCzzKZGdw6GkugNimtuPZGc72mxxRgGBBkgXtcDwSU4LoxuQv3HdBPgNVB1x
	 2xN+jOqcZKDyG7ZXnjd+sLCwuvGW8cw+88f5jeOXTexP7N76h6Il6qWPoCCCR+7E8u
	 mSN5tPtIs+DOBxGeQDqbDqeDv8WEW7MnGj7uA2JFaULMbcT5KQU9wzEJs2VQGhFnU+
	 QXipS5iKmOCovbZxl2+w6CY7JFDlTF5aaC8TzSQuYjCa+vS0wlzFI+VQXF+ul8gtDF
	 f04vV4ozz3LjFzOQkcTCkEwYFjQA4nRJ62uRqjWDlQgimBwORAhtvwwq6K8J2lD/3K
	 lgIEqg5u8HE/jClSEpWbcrRxiX9VpXyoqElL0tjkbZ5qp57Xdn4R2r4JDEYbHOOlQJ
	 qnbNpWUXENMHaHxkAu/2ASupfkzy4FQ6h5pGWyk5DhzZhGJ8VWG2zQHh0wBMYlOdce
	 VDL2mC9JxiuBETtvsl3Hry1w=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][zeus][PATCH 12/19] encodings: clear postinst script
Date: Thu,  9 Jul 2020 00:07:54 +0300
Message-Id: <20200708210801.5553-12-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200708210801.5553-1-bunk@stusta.de>
References: <20200708210801.5553-1-bunk@stusta.de>

From: Kai Kang <kai.kang@windriver.com>

Postinst script from xorg-font-common.inc doesn't apply to this recipe.
So clear the postinst script of encodings.

(From OE-Core rev: ba94c908b99713ce115e9240df525c6442a60c7a)

Signed-off-by: Kai Kang <kai.kang@windriver.com>
(cherry picked from commit 99ae6dbb7278dfd264453af852c108fa56a0d4e3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-graphics/xorg-font/encodings_1.0.5.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb b/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb
index a39609b5da..74014ff91b 100644
--- a/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb
+++ b/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb
@@ -19,3 +19,7 @@ SRC_URI[sha256sum] = "bd96e16143a044b19e87f217cf6a3763a70c561d1076aad6f6d862ec41
 inherit allarch
 
 EXTRA_OECONF += "--with-encodingsdir=${datadir}/fonts/X11/encodings"
+
+# postinst from .inc doesn't apply to this recipe
+pkg_postinst_${PN} () {
+}
-- 
2.17.1

