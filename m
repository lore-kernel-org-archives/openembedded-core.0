Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id E540C602D9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Feb 2018 15:55:36 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id n188so15744448qkn.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Feb 2018 07:55:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YiRePTL4YkQPmRmpD52DymksR3h9+6AopVFIweBNnrU=;
	b=K2fTayhiJzN6SZP/npzVeECRHASN7H9Rz2nF/RdxkZGkVAmL5bthpUh0USREsTIZwE
	GR+6Z+LaYf28EkqlDDk6aCWqcRhBzwDp85SThtRwFDxgNdBKGGLPBn6ISymBWjjVdW0q
	vLvmLBoDo3Bupl1Ll6lO5wiK17XScBYSM+6tOcOtGO9U8BKMpSfQcvw70g76ooCUoKSY
	/AEmlAtficIoyjTX+aCzNFSK/uoPpRBeTG2QwLx8gJhW7M8f8s4aTeVJd1gpj4tu9eNw
	5nfj1fY3VV2xtD+/4EZT4G8pWPTCjitXldCvWcdqnoVPlzVcxk1LxS2pigmGybnFQ2Vt
	8DmA==
X-Gm-Message-State: APf1xPCdmW8LEduqG7aMY/7K2YEY4k6JvdXVYCmgoQNRlhn3+src2FS+
	xJETTRlpA4nPby6hFEI96srdzDyX
X-Google-Smtp-Source: AH8x226i+9jtP3XNxZNSM8k5fgZzLR6XL6PGB8pUlX/uoCVWSNdtPSgqUdyuNUjijI+JwK2yfHFf2g==
X-Received: by 10.55.158.199 with SMTP id h190mr11887448qke.167.1518364537692; 
	Sun, 11 Feb 2018 07:55:37 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	f128sm4634627qkc.36.2018.02.11.07.55.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 11 Feb 2018 07:55:37 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Sun, 11 Feb 2018 10:55:22 -0500
Message-Id: <1518364522-12197-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] python*-setuptools: update to 38.5.1
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
X-List-Received-Date: Sun, 11 Feb 2018 15:55:37 -0000

Update the python{3}-setuptools to the latest stable version

Tested on the qemu with core-image-minimal

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta/recipes-devtools/python/python-setuptools.inc                    | 4 ++--
 .../{python-setuptools_38.4.0.bb => python-setuptools_38.5.1.bb}      | 0
 .../{python3-setuptools_38.4.0.bb => python3-setuptools_38.5.1.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python-setuptools_38.4.0.bb => python-setuptools_38.5.1.bb} (100%)
 rename meta/recipes-devtools/python/{python3-setuptools_38.4.0.bb => python3-setuptools_38.5.1.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index fc4fd9c..65383ce 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -9,8 +9,8 @@ PYPI_PACKAGE_EXT = "zip"
 
 inherit pypi
 
-SRC_URI[md5sum] = "3426bbf31662b4067dc79edc0fa21a2e"
-SRC_URI[sha256sum] = "6501fc32f505ec5b3ed36ec65ba48f1b975f52cf2ea101c7b73a08583fd12f75"
+SRC_URI[md5sum] = "1705ae74b04d1637f604c336bb565720"
+SRC_URI[sha256sum] = "6425484c08e99a98a42209c25c3d325f749230b55284d66192784f941a7e6628"
 
 DEPENDS += "${PYTHON_PN}"
 DEPENDS_class-native += "${PYTHON_PN}-native"
diff --git a/meta/recipes-devtools/python/python-setuptools_38.4.0.bb b/meta/recipes-devtools/python/python-setuptools_38.5.1.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-setuptools_38.4.0.bb
rename to meta/recipes-devtools/python/python-setuptools_38.5.1.bb
diff --git a/meta/recipes-devtools/python/python3-setuptools_38.4.0.bb b/meta/recipes-devtools/python/python3-setuptools_38.5.1.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-setuptools_38.4.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_38.5.1.bb
-- 
2.7.4


