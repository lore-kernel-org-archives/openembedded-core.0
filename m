Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 613396FFA1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2018 14:28:16 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id o205so4257377qke.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2018 07:28:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ExNA+zwwzdjlWJblxdB7AlsCt0/X1EjuUdKkxyJ1ARs=;
	b=NzEimfjRysLcbtUDk/rT46aw3W35uinltW82WFXnRSbnbsWrm3pYkeMcSTVImMNQ6U
	wTaJzc9bhANAC03igN+7NxcFABMeJBV34x8H3tzynC8pTBfuIETlDGvKVaB+Tbij1kkV
	pvX4oBiz0RmekK5L5jR/eNCCiGbJkTs7DA3rchBIdEzAo7sMaK+/QgzFiDwC1310mtDn
	vhfVZ9sW6GGVBfXeVJdq6A1TZ4SoyOZSnZR9MoBBcoNq+0jg7qgKb7cYZWtTKtBxrnKE
	PI1lyK85/INq6N9CyBxSp1u/W7QUUaIAqxq6JtHKSp03DYxSiPpjYcOb00jWiEs+e2Mu
	cpsg==
X-Gm-Message-State: AElRT7EwCb075WUw9ULr5vfduIxpXnicpbW++ubFDFQq2EmjnC/AmN/0
	dY/UYdej6JKBkIeB+7fMAI6Kj0HZ
X-Google-Smtp-Source: AG47ELs3lXli23TfCFIfQxAQQmq6exOn8j/50EsnUrzEwXfBKu2fRIBKQsdpts8VHwut+gyRQkvAyQ==
X-Received: by 10.55.74.195 with SMTP id x186mr29896384qka.201.1521901697099; 
	Sat, 24 Mar 2018 07:28:17 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	e46sm8583843qtc.27.2018.03.24.07.28.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 24 Mar 2018 07:28:16 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Sat, 24 Mar 2018 10:28:07 -0400
Message-Id: <1521901687-6205-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] python*-setuptools: update to 39.0.1
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
X-List-Received-Date: Sat, 24 Mar 2018 14:28:16 -0000

Update the python{3}-setuptools to the latest stable version

Tested on the qemu with core-image-minimal

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta/recipes-devtools/python/python-setuptools.inc                    | 4 ++--
 .../{python-setuptools_39.0.0.bb => python-setuptools_39.0.1.bb}      | 0
 .../{python3-setuptools_39.0.0.bb => python3-setuptools_39.0.1.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python-setuptools_39.0.0.bb => python-setuptools_39.0.1.bb} (100%)
 rename meta/recipes-devtools/python/{python3-setuptools_39.0.0.bb => python3-setuptools_39.0.1.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index 74706bf..c5eb4a5 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -9,8 +9,8 @@ PYPI_PACKAGE_EXT = "zip"
 
 inherit pypi
 
-SRC_URI[md5sum] = "379642a4f17214071fdc1894255d8d11"
-SRC_URI[sha256sum] = "94dc566247f35009ed42c0f4422f2b4f0a032fab1372c8308b864c8f26d93388"
+SRC_URI[md5sum] = "75310b72ca0ab4e673bf7679f69d7a62"
+SRC_URI[sha256sum] = "bec7badf0f60e7fc8153fac47836edc41b74e5d541d7692e614e635720d6a7c7"
 
 DEPENDS += "${PYTHON_PN}"
 DEPENDS_class-native += "${PYTHON_PN}-native"
diff --git a/meta/recipes-devtools/python/python-setuptools_39.0.0.bb b/meta/recipes-devtools/python/python-setuptools_39.0.1.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-setuptools_39.0.0.bb
rename to meta/recipes-devtools/python/python-setuptools_39.0.1.bb
diff --git a/meta/recipes-devtools/python/python3-setuptools_39.0.0.bb b/meta/recipes-devtools/python/python3-setuptools_39.0.1.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-setuptools_39.0.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_39.0.1.bb
-- 
2.7.4


