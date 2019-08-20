Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id D63C57EC4C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 15:32:32 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id t16so12854614wra.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 08:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SKvb/BFc06d1D95sP/YsEzQQq7GANOnJWOw2tH+/pOY=;
	b=rohnX1rIRX3dgJ8CTi5i6ZviUBJy0JpWrL4JGDqCEGEl7oRkNLFoN3/5mag3aPCM9Z
	/RCLD2jXoT629MGjqmec8hYnYVMonrp/Fa8Dt020GO7xBZwZt8PQbBehOwXPAhrGVFO2
	vORpOrv5z7kbv79HDGZ4++pWq+sHG+6YrwRhfWkEZ/pg1njOobEw1AUKc6q0yeKFcjdW
	ELKgL11VRdmph9RoScSAwhB/kcvonV19gfzyrJAR+CbYTGdrsVLJhzA8vSh+W8K0UvdA
	FkglGo4HTlcBVrVKq8cdNi1oU0IQyMqHkBrDynff+aCUJRHN1NSJ4i4UWjGPurhGd7Xw
	oKMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=SKvb/BFc06d1D95sP/YsEzQQq7GANOnJWOw2tH+/pOY=;
	b=AWUqaUJM/VTlgQcJDXMWh9Y5Jd694oXplF64ndTSxYcAjLWXXQE+J6L2ffdTrC9oDD
	titKMTdzTtiQXWJB/YDYKDhke1TrLMLCF3FbSPv1rxcPNLD7UqAXV7sIVYIYQo/KNct7
	R2/916X9JwoRnLz4PNySptKHKFlxEZiE5uc2xKWZelmI3wGEuAjjzEKQDTiJj9pOnRVT
	zJfj51ZtSj0l/qSsgkgCe4Av6IFdqjE2K6cvzz2Mvg/S6MVTGl8qqeV2P7+xhmxCzgFR
	22R0Nr6Xi4GF9mluqPnxPBjYdTzMdiMciro5K/Kud7pyJ8oBVo22b4qmFXLAwC0Lbh8O
	PoEA==
X-Gm-Message-State: APjAAAXRbzcRrbmAGpOy3OXiZW/wOe4uDDQ8NAkdlwSb5mrLRyI4OJrs
	RSd+arDwLZDs3CZkyntnZXvGKc8EK5c=
X-Google-Smtp-Source: APXvYqydaYzR/ZzzaBe90YgcQohE6zQjgmEAt8zdi1rI/t9rXpOJSQzcyU+VuLOSX4f94pD41J4a7g==
X-Received: by 2002:adf:f3d1:: with SMTP id g17mr34577132wrp.38.1566315153393; 
	Tue, 20 Aug 2019 08:32:33 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id 6sm466700wmf.23.2019.08.20.08.32.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 20 Aug 2019 08:32:32 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Aug 2019 17:32:16 +0200
Message-Id: <20190820153219.62435-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190820153219.62435-1-alex.kanavin@gmail.com>
References: <20190820153219.62435-1-alex.kanavin@gmail.com>
Subject: [PATCH 09/12] desktop-file-utils: upgrade 0.23 -> 0.24
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
X-List-Received-Date: Tue, 20 Aug 2019 15:32:33 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...top-file-utils_0.23.bb => desktop-file-utils_0.24.bb} | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/desktop-file-utils/{desktop-file-utils_0.23.bb => desktop-file-utils_0.24.bb} (73%)

diff --git a/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.23.bb b/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.24.bb
similarity index 73%
rename from meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.23.bb
rename to meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.24.bb
index 6446f47189d..aecba07235c 100644
--- a/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.23.bb
+++ b/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.24.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://src/validator.c;beginline=4;endline=27;md5=281e1114ee6c486a1a0a4295986b9416"
 
 SRC_URI = "http://freedesktop.org/software/${BPN}/releases/${BP}.tar.xz"
-SRC_URI[md5sum] = "599133d51cc9a41bfec186414906b6f1"
-SRC_URI[sha256sum] = "6c094031bdec46c9f621708f919084e1cb5294e2c5b1e4c883b3e70cb8903385"
+SRC_URI[md5sum] = "9364b82e14cfcad881161aa7ea5257ae"
+SRC_URI[sha256sum] = "a1de5da60cbdbe91e5c9c10ac9afee6c3deb019e0cee5fdb9a99dddc245f83d9"
 
 DEPENDS = "glib-2.0"
 
@@ -17,3 +17,8 @@ inherit autotools pkgconfig
 EXTRA_OECONF += "ac_cv_prog_EMACS=no"
 
 BBCLASSEXTEND = "native nativesdk"
+
+do_install_append() {
+        rm -rf ${D}${datadir}/emacs
+}
+
-- 
2.17.1


