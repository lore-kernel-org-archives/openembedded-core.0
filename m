Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
	[209.85.167.53])
	by mail.openembedded.org (Postfix) with ESMTP id DECCA7D19E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 21:54:32 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id r25so7410560lfn.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 14:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=Gvxb7711OjzYhUko49Dl+cUwQ660b0fos8z0ELB7pWs=;
	b=0fxTLrZ7zgiKbeqrUr/xss02meMRx+/nm14rdZUXJ0pMedD3w6b5bv+FbRtwnS3z6y
	DlRsfvqY5eN7Arl2ODx158OS3i6ngaI7phDL0hNTTZHfhwsRNif+gyy3kIh5bMaD/NZ5
	4f4Q5tugxgJFcW9FINyD3PtLiUxCtSHqO4a8lgIXRO+v+B6v9/XJMxpVJJuZ6foHOcpS
	d2DulGgjjTi0YeQwUQps/xxHRM6TAv6Hg6KHI152PFMMieBBeUzrYFINOgRwMHt7+qfO
	oEUTtXJS5MejRvUTIIVB3WqerYYlIiEz+At5Y3UXmMIoMJNr5StH201GUMnHxFxN3PYh
	tCMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Gvxb7711OjzYhUko49Dl+cUwQ660b0fos8z0ELB7pWs=;
	b=RfgPYJ4dPIXBFkyfKiLbYamwybzldrHA7v/TEJ0iDxgOcrMcRQ+l0jfXLWfp9JJyU3
	P4imC6jmHJ6Po21caIsoabQEPhi4zsITYT46S3/Xzb0xjGHG3UENHNcLvjrW+5AfWRL8
	HbhRTA2QZ+AjFr9/Eip7sPtH7YMFfsKGqwCmG7nxEZ3+xIeAGJFerHGlWZqvNAGWx8R0
	qEqgJtm1AwsHO00VyqqUMr74j5Ajwop8bDIB+NFayBF+JFJ/G7OnK6+AzFYM958YzUeP
	rYShTAjp6iWn+Dl/fbbe8/Gcjy3cFj74cbWdfJVAFsGY6EOWpYYYPbRF3n5/K3qTayOi
	RaOw==
X-Gm-Message-State: APjAAAVPljhmtKai/apkTmZfaNBrRgIFjNXZfbK9A0VPNSX/s6GqXKi/
	TPgfPCJn/AR9H3QLpwSb17kZEbWfot8=
X-Google-Smtp-Source: APXvYqy1fsYN/6Bgy8T6YGsd9SMO5Fy4DtMWxfKkwA+9cd6mD8r4zFaKuYNZTRlTyFhftZhRnT+HMg==
X-Received: by 2002:a19:c203:: with SMTP id l3mr7148338lfc.39.1554155673024;
	Mon, 01 Apr 2019 14:54:33 -0700 (PDT)
Received: from lund.luxoft.com (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	t14sm2389064lji.33.2019.04.01.14.54.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Apr 2019 14:54:32 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Apr 2019 23:54:30 +0200
Message-Id: <20190401215430.26343-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] libxcrypt: update to 4.4.4
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
X-List-Received-Date: Mon, 01 Apr 2019 21:54:33 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{libxcrypt.bb => libxcrypt_4.4.4.bb}       | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)
 rename meta/recipes-core/libxcrypt/{libxcrypt.bb => libxcrypt_4.4.4.bb} (68%)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.4.4.bb
similarity index 68%
rename from meta/recipes-core/libxcrypt/libxcrypt.bb
rename to meta/recipes-core/libxcrypt/libxcrypt_4.4.4.bb
index 3b9af6d739..e3c87b3e02 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.bb
+++ b/meta/recipes-core/libxcrypt/libxcrypt_4.4.4.bb
@@ -4,22 +4,24 @@ HOMEPAGE = "https://github.com/besser82/libxcrypt"
 SECTION = "libs"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM ?= "file://LICENSING;md5=be275bc7f91642efe7709a8ae7a1433b \
-      file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
+                     file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
 "
 
 inherit autotools pkgconfig
 
-PV = "4.4.2"
-# v4.4.2
-SRCREV ?= "cf6abf18083566ec1612af27982a5160c9e0f137"
-SRCBRANCH ?= "develop"
+PV = "4.4.4"
 
-SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH} \
-           "
+SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH}"
+SRCREV = "3b251d4e1af66aa7697c4ac96c689f996fa90c32"
+SRCBRANCH ?= "develop"
 
 PROVIDES = "virtual/crypt"
 
-FILES_${PN} = "${libdir}/libcrypt*.so.* ${libdir}/libcrypt-*.so ${libdir}/libowcrypt*.so.* ${libdir}/libowcrypt-*.so"
+FILES_${PN} = "${libdir}/libcrypt*.so.* \
+               ${libdir}/libcrypt-*.so \
+               ${libdir}/libowcrypt*.so.* \
+               ${libdir}/libowcrypt-*.so \
+"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


