Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6BC63751BF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2018 21:26:13 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id f1-v6so2113313qti.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2018 14:26:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=FTOnFgklC2HvkIl5yI0E1qa8oxhLDcqmMkSH1c3bJFY=;
	b=uoS/tlAwTNNvMGTE196FYHllYEzxjNMSCOFh/IxiqoZ3vZ1SO6+I+fw35Drq1SZJ2H
	dPEwxUU7oiG0V9PtTLSpmyMU/SvEYAQutW874tlAo1JTFCVNo3bN4tiT729k0vFmI8za
	5n21uIPyuGc3w4aANL4IEhfbCabF+4n04HRz8tZop01ZEVrNnHESTtKMIYfymBSN/BqF
	yoZEhnKWF00tLFD1Q0NMgU504zpZDzqp1S7tq9ycfmqui+qNFU9xPGY9cFfwWScNPGAg
	mHjBF3jmf+yxVxOsYSo4pe0h+XvL/m9XbsLXq05tYZaioLvzeB+pHGqnBclLDgVKf8O9
	Ondg==
X-Gm-Message-State: APt69E3T7umswd5Rc1S1IRPtiQ/vp58j9CTc+uUuWgY/pBVkpRSavVqN
	uJzlAIG6vy+V4e11TLH8mkTd7Z5O
X-Google-Smtp-Source: AAOMgpfhs8NAdYFFyRUN90G5qFkfc8vBuzyO17UPYwnGiS2KrETOgw7i9MgrZJ3oX08/HQeTU58fvQ==
X-Received: by 2002:a0c:bf4e:: with SMTP id
	b14-v6mr14942279qvj.65.1530307573906; 
	Fri, 29 Jun 2018 14:26:13 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-100-33-240-84.nycmny.fios.verizon.net. [100.33.240.84])
	by smtp.gmail.com with ESMTPSA id
	h43-v6sm7728700qth.6.2018.06.29.14.26.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jun 2018 14:26:13 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Jun 2018 17:26:04 -0400
Message-Id: <1530307564-14708-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] python*-setuptools: update to 39.2.0
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
X-List-Received-Date: Fri, 29 Jun 2018 21:26:13 -0000

Update the python{3}-setuptools to the latest stable version

Tested on the qemu with core-image-minimal

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta/recipes-devtools/python/python-setuptools.inc                    | 4 ++--
 .../{python-setuptools_39.0.1.bb => python-setuptools_39.2.0.bb}      | 0
 .../{python3-setuptools_39.0.1.bb => python3-setuptools_39.2.0.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python-setuptools_39.0.1.bb => python-setuptools_39.2.0.bb} (100%)
 rename meta/recipes-devtools/python/{python3-setuptools_39.0.1.bb => python3-setuptools_39.2.0.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index c5eb4a5..bf654be 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -9,8 +9,8 @@ PYPI_PACKAGE_EXT = "zip"
 
 inherit pypi
 
-SRC_URI[md5sum] = "75310b72ca0ab4e673bf7679f69d7a62"
-SRC_URI[sha256sum] = "bec7badf0f60e7fc8153fac47836edc41b74e5d541d7692e614e635720d6a7c7"
+SRC_URI[md5sum] = "dd4e3fa83a21bf7bf9c51026dc8a4e59"
+SRC_URI[sha256sum] = "f7cddbb5f5c640311eb00eab6e849f7701fa70bf6a183fc8a2c33dd1d1672fb2"
 
 DEPENDS += "${PYTHON_PN}"
 DEPENDS_class-native += "${PYTHON_PN}-native"
diff --git a/meta/recipes-devtools/python/python-setuptools_39.0.1.bb b/meta/recipes-devtools/python/python-setuptools_39.2.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-setuptools_39.0.1.bb
rename to meta/recipes-devtools/python/python-setuptools_39.2.0.bb
diff --git a/meta/recipes-devtools/python/python3-setuptools_39.0.1.bb b/meta/recipes-devtools/python/python3-setuptools_39.2.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-setuptools_39.0.1.bb
rename to meta/recipes-devtools/python/python3-setuptools_39.2.0.bb
-- 
2.7.4


