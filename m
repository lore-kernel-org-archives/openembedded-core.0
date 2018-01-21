Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 68D027874D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jan 2018 20:20:42 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id f4so16094098qtj.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jan 2018 12:20:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kIoRw58zXfPuPrmjAye3SGvusXjlhOt3HKhtT7Jrm6Q=;
	b=LL3PSJ/GJ5cmFNKE/QHbwJG+x3b4RBOTURxoab0I7paiLBVLtfN88q+zpbDWmAUv8h
	sx6raOnBna+7x+SqiRzPeP8ljSOuWkEvSES1pBCjs0HzjQiRXkx+3YCUwMrJr5lIVbFe
	iuegQ2vwxA4b7OckbtEhSRQl0WGgtPaiyVET+4BiSvhs/XDvcCWv4LqLNR/BRm76uQu+
	vsOfFhTfjTwkOwSiilReQExo/WS8vGSTGTbTcgvl+tL36eShRH2Y8mAb5Va9wEc+D7rX
	KalGWl5fggpDZ/tNy2BNgwDQ9ZlKfT4dMKVROULt+9/0f4DmAh5X++s6n8Vh0f56ShjQ
	nhiw==
X-Gm-Message-State: AKwxytdxUqGGpf7yxQIQ9GDiAYE278ujC6MQtEO0zqFcei7lvqTVtLS4
	9X0LRUz1bauSW7GFdmWyCL7HPq4K
X-Google-Smtp-Source: AH8x224zDiZCrMo8xpRRiwbxXdJSng/UtLKmg9PgHybgr0HRu6iLMdhUAmzet/Moz8PLkbGAhEH3BA==
X-Received: by 10.200.57.162 with SMTP id v31mr7939767qte.128.1516566043138;
	Sun, 21 Jan 2018 12:20:43 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	h55sm10450643qta.75.2018.01.21.12.20.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Jan 2018 12:20:42 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 Jan 2018 15:20:31 -0500
Message-Id: <1516566031-9012-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] python*-setuptools: update to 38.4.0
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
X-List-Received-Date: Sun, 21 Jan 2018 20:20:42 -0000

Update the python{3}-setuptools to the latest stable version

Tested on the qemu with core-image-minimal

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta/recipes-devtools/python/python-setuptools.inc                    | 4 ++--
 .../{python-setuptools_38.2.5.bb => python-setuptools_38.4.0.bb}      | 0
 .../{python3-setuptools_38.2.5.bb => python3-setuptools_38.4.0.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python-setuptools_38.2.5.bb => python-setuptools_38.4.0.bb} (100%)
 rename meta/recipes-devtools/python/{python3-setuptools_38.2.5.bb => python3-setuptools_38.4.0.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index 54b7c30..fc4fd9c 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -9,8 +9,8 @@ PYPI_PACKAGE_EXT = "zip"
 
 inherit pypi
 
-SRC_URI[md5sum] = "abfd02fba07b381c3a9682a32d765cc6"
-SRC_URI[sha256sum] = "b080f276cc868670540b2c03cee06cc14d2faf9da7bec0f15058d1b402c94507"
+SRC_URI[md5sum] = "3426bbf31662b4067dc79edc0fa21a2e"
+SRC_URI[sha256sum] = "6501fc32f505ec5b3ed36ec65ba48f1b975f52cf2ea101c7b73a08583fd12f75"
 
 DEPENDS += "${PYTHON_PN}"
 DEPENDS_class-native += "${PYTHON_PN}-native"
diff --git a/meta/recipes-devtools/python/python-setuptools_38.2.5.bb b/meta/recipes-devtools/python/python-setuptools_38.4.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-setuptools_38.2.5.bb
rename to meta/recipes-devtools/python/python-setuptools_38.4.0.bb
diff --git a/meta/recipes-devtools/python/python3-setuptools_38.2.5.bb b/meta/recipes-devtools/python/python3-setuptools_38.4.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-setuptools_38.2.5.bb
rename to meta/recipes-devtools/python/python3-setuptools_38.4.0.bb
-- 
2.7.4


