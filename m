Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 48F7978289
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Mar 2018 13:15:37 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id s188so15703833qkb.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Mar 2018 06:15:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CDOdR7GeWYGImQWhpsAM40aSE5ydoMycsbgDidKFkhQ=;
	b=cYz3gAIfx4S0EtSivh5MTH7uBOlx4nCKKDm4fXRPO6CoGUfL3Z+S8lFiTM3brWFhta
	qQgmf0lLvdKnkP2jLys93HU622xxwrKIr0QpEZ7JE31eGKs3A/oI1JDG86ft+CNysRhc
	bj5vCvRf+fAyHu3d75ZMlQMnQuP9jkrXkfYrepapCPQluqfChUWqwPCpC85HnwACdAnF
	W9r1XiApzaWwC0xdeJNSf8/8MfKJZK99DWItiKeR4os6CMlzweDkhc55QHyZ6CUDup98
	lVwExD2cMTqS84dU25ZngwXVPl6yRtr43sRHGbAexI6ZkOlhkoZEBDmhWr84rIENiRLj
	L8MQ==
X-Gm-Message-State: AElRT7EFlUk554MEfpIvWQsCrPEDKD8y9XO9+K9POvLcJwJxUIFL7fYY
	yhyyXvMHHRSI8wSfGSznboTLLrGI
X-Google-Smtp-Source: AG47ELt2fRDgSwmrfX+3gLpAyGcXoMfqqjYtbmBBHLAM/WEha9xzBvzkba6wZahE9kQlXHJCSxJlnA==
X-Received: by 10.55.217.77 with SMTP id u74mr12662131qki.148.1521378937946;
	Sun, 18 Mar 2018 06:15:37 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	y16sm4463844qky.10.2018.03.18.06.15.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 18 Mar 2018 06:15:37 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Mar 2018 09:15:28 -0400
Message-Id: <1521378928-23180-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] python*-setuptools: update to 39.0.0
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
X-List-Received-Date: Sun, 18 Mar 2018 13:15:37 -0000

Update the python{3}-setuptools to the latest stable version

Tested on the qemu with core-image-minimal

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta/recipes-devtools/python/python-setuptools.inc                    | 4 ++--
 .../{python-setuptools_38.5.2.bb => python-setuptools_39.0.0.bb}      | 0
 .../{python3-setuptools_38.5.2.bb => python3-setuptools_39.0.0.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python-setuptools_38.5.2.bb => python-setuptools_39.0.0.bb} (100%)
 rename meta/recipes-devtools/python/{python3-setuptools_38.5.2.bb => python3-setuptools_39.0.0.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index b5bd8cc..74706bf 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -9,8 +9,8 @@ PYPI_PACKAGE_EXT = "zip"
 
 inherit pypi
 
-SRC_URI[md5sum] = "b4c7f29c8079bdf2f0f355cdcd999e69"
-SRC_URI[sha256sum] = "8246123e984cadf687163bdcd1bb58eb325e2891b066e1f0224728a41c8d9064"
+SRC_URI[md5sum] = "379642a4f17214071fdc1894255d8d11"
+SRC_URI[sha256sum] = "94dc566247f35009ed42c0f4422f2b4f0a032fab1372c8308b864c8f26d93388"
 
 DEPENDS += "${PYTHON_PN}"
 DEPENDS_class-native += "${PYTHON_PN}-native"
diff --git a/meta/recipes-devtools/python/python-setuptools_38.5.2.bb b/meta/recipes-devtools/python/python-setuptools_39.0.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-setuptools_38.5.2.bb
rename to meta/recipes-devtools/python/python-setuptools_39.0.0.bb
diff --git a/meta/recipes-devtools/python/python3-setuptools_38.5.2.bb b/meta/recipes-devtools/python/python3-setuptools_39.0.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-setuptools_38.5.2.bb
rename to meta/recipes-devtools/python/python3-setuptools_39.0.0.bb
-- 
2.7.4


