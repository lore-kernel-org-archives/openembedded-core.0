Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.665.1589315874387889445
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2020 13:37:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=cmWNaqZQ;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=h6oi=62=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49M8kk6b8szCY
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2020 22:37:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589315871;
	bh=6y5TFoVRkCGUMOFGZ2z4MEBUSeSB2z4RJTWYCMwxgsE=;
	h=From:To:Subject:Date:From;
	b=cmWNaqZQewnAKRMGp61G+ekW5RUW5Oy5Ww1Cxaqcpnjqjhhb3pW0iJjPu+i8ydjW1
	 rgkvdoiQfG373XSDsymiF4VQJEY1mouMIl+9hxf57evGyVp+d62Rn/LDKrUjN7L+3e
	 w1z7Myuw/DfUpqlvBrgdhofNaCS0Cv/amA6NsWaj5XleNEVcfa04pmuyQjrgD6pA1H
	 EHdcz5sJ0i/3iHwh8ZuIWJTfbS6B6Ne62HXwNss7a9ZBOuOxlk+Lca8+lilD+fWpzq
	 IAX+TvUy5iVteqwLv6jsxrZeQXBJu/oR7jM2WO0cbOSzmalySADEhSHVg54X/39dS3
	 akBWVW7pmkdmPKQ2DOWCIKabxs05s6gYJIqRm6tG2CJJiVR3u1AgGItkUuROIXBKMN
	 rSquatrjnUJxT/MsXJO/or9qFhYD8/Cn9Jldl3UcSuW42EtgLgqMJOIW1FM1mRkORs
	 1ErprFMVpK5jwmPW+j/H+9NVqF/JlUvpwo56dKxpJbq2XKKYGs7GTWfjypmhhqKHYY
	 KObjVa20lWJ5bfJtR8ZLBej/QRISFApKQZ9/H4jVRSE6B06WWEvLfnrAl9238CMT8I
	 gURGKcAbLAFiruNBHlKPlU6nIwDT4j7cGJrE0W2yjUKIx2JJ7GLABEPTKOA+PiqybT
	 HX+7ENlr6Zed9xfh28myRNFc=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] python-numpy: Remove workaround for host gcc < 5
Date: Tue, 12 May 2020 23:37:46 +0300
Message-Id: <20200512203748.8779-3-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-devtools/python-numpy/python-numpy.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-devtools/python-numpy/python-numpy.inc b/meta/recipes-devtools/python-numpy/python-numpy.inc
index 727755393e..0bff979a6b 100644
--- a/meta/recipes-devtools/python-numpy/python-numpy.inc
+++ b/meta/recipes-devtools/python-numpy/python-numpy.inc
@@ -15,9 +15,6 @@ SRC_URI[sha256sum] = "93ee59ec38f3bf8f9a42d5f4301f60e6825a4a6385a145f70badcd2bf2
 UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
 
-# Needed for building with gcc 4.x from centos 7
-CFLAGS_append_class-native = " -std=c99"
-
 DEPENDS += "python3-cython-native"
 
 S = "${WORKDIR}/numpy-${PV}"
-- 
2.17.1

