Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 8FBA47F8BB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 21:44:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47739J4N4rz8t
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 22:44:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572990292;
	bh=7u8+ZvFl5WstJpUByfIu5FrSrqx7OzKJ7ox7sx1+SlA=;
	h=From:To:Subject:Date:From;
	b=ACMW7dMrD+GIsVAqoefT9pjv1qeL/TM5B1MUz88+oDxdE54gxBp8c+vuT2E/WjzZD
	Eku8xsFjao4SVkACBdVJepSKeLgGjQa9wFoohziv73/APA6+ZTcK2ZjBWjTYfy6Hx7
	NboVcdt6JS2mqFKIhCjOD3deXgpEKFO4wafZaIEo2ivDfXifaHqDDpiVnIsocQW0dI
	YnHnI/9zrys77GYCd0OIDW24eRZzrlJlNcXezg0tDiK+iUhXQd2dhuguUcjGa9erES
	BikZl9pgvfcUSdswclBpoiPAIgPRAw5a5SOQSY4tJUEM7Bkjd4DyGixdkyfPrx4XNS
	WrmrHraTKR22gsoJOPWpZk6cKbQz0/18GRTEOoVQZ9Np47ninLyEMu619Kb306LKEt
	TarEesjtQnB/hTlJ8y+S8MtFBHl2pLTMmOfp1t0yrRL7z3nbxfzU9f+GWAm+QgcShy
	6N57KOe/RpOtOlrEAkLQQUIT0OYwP8AB89m5xQYtVwcASJZgoeOehk0wOfsWsuhTS/
	MDf61tFYPw/sarbqnxdmE4/lqMG6eWHd4957sWp0voGsVvQEs1ZcrLBnkRAIsJMAy8
	Cl6akFFTpGcrE3G3h87pjq7GYdhoRnarVHeIWGqaX9pPxwPrXzaa6CWcC6tHNpKYVh
	N1vVoJDyWPtWKTT5DOU1Uo0g=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Nov 2019 23:44:44 +0200
Message-Id: <20191105214448.2511-8-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][PATCH] libxfont2: set CVE_PRODUCT
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
X-List-Received-Date: Tue, 05 Nov 2019 21:44:51 -0000

From: Chen Qi <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-graphics/xorg-lib/libxfont2_2.0.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.3.bb b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.3.bb
index 2b72d6750c..6994d79e89 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.3.bb
@@ -20,3 +20,5 @@ SRC_URI[sha256sum] = "0e8ab7fd737ccdfe87e1f02b55f221f0bd4503a1c5f28be4ed6a54586b
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
+
+CVE_PRODUCT = "libxfont libxfont2"
-- 
2.17.1


