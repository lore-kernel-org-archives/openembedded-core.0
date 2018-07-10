Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id EE20076017
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 21:16:08 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id a5-v6so5131026qtp.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 14:16:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kdxBCtBG/pz3ZSuwS+KlcOjM5zfq21gUoVWJfLPWUIE=;
	b=hj7tXHBRHgMVhkVK3EHCB9culFDHT8OLDCY0lvr1gTVEQX7ZoW7rTlXbf60pA0KVo4
	LTqeBJl/WZlPW6r7kD5YWOVzcmZMsfE1BVExwlwQRMiVArSYY6SBvZgHRIGdJ/R7BIEF
	NUZjdmjFSYNUosV3YFXhmIC73557ZaTc/YXjgRznQOKFK7IW6LRg6luX1455pl7n7mCW
	jrDN6+mCiOtUX+x7MMUXHltsnHts75vQQF7ZYcwPQ7qBihzurlDey+P6HoA8QVMit2n8
	Ur4Vf6hjoYuq7tvdWwSKtF8n8EzvCBBmifQpXj7baZt9SWJf1XaOuivkyi8JgEeN+Kmg
	HZ7A==
X-Gm-Message-State: APt69E15K7BKHWK3bfPmwXyzfHABcmd1L43nSDhGsNnpDl/dilLd0kKe
	rdtWqoMOIeWV2CKVYQ2J2BwAEbJ8
X-Google-Smtp-Source: AAOMgpfYaARzjoK2b0Kk11qAn3TMgfda2P+FbsxJDpvMQ3Zi0l3a529GCr0wlww1JLbyGnr39SaEXQ==
X-Received: by 2002:ac8:3615:: with SMTP id
	m21-v6mr25614739qtb.297.1531257369491; 
	Tue, 10 Jul 2018 14:16:09 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	s31-v6sm6416477qtc.68.2018.07.10.14.16.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Jul 2018 14:16:08 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jul 2018 17:16:02 -0400
Message-Id: <1531257362-30776-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] python*-setuptools: update to 40.0.0
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
X-List-Received-Date: Tue, 10 Jul 2018 21:16:09 -0000

Update the python{3}-setuptools to the latest stable version

Tested on the qemu with core-image-minimal

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta/recipes-devtools/python/python-setuptools.inc                    | 4 ++--
 .../{python-setuptools_39.2.0.bb => python-setuptools_40.0.0.bb}      | 0
 .../{python3-setuptools_39.2.0.bb => python3-setuptools_40.0.0.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python-setuptools_39.2.0.bb => python-setuptools_40.0.0.bb} (100%)
 rename meta/recipes-devtools/python/{python3-setuptools_39.2.0.bb => python3-setuptools_40.0.0.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index bf654be..25be446 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -9,8 +9,8 @@ PYPI_PACKAGE_EXT = "zip"
 
 inherit pypi
 
-SRC_URI[md5sum] = "dd4e3fa83a21bf7bf9c51026dc8a4e59"
-SRC_URI[sha256sum] = "f7cddbb5f5c640311eb00eab6e849f7701fa70bf6a183fc8a2c33dd1d1672fb2"
+SRC_URI[md5sum] = "260630ae1a64bafa39dcc53404d63829"
+SRC_URI[sha256sum] = "012adb8e25fbfd64c652e99e7bab58799a3aaf05d39ab38561f69190a909015f"
 
 DEPENDS += "${PYTHON_PN}"
 DEPENDS_class-native += "${PYTHON_PN}-native"
diff --git a/meta/recipes-devtools/python/python-setuptools_39.2.0.bb b/meta/recipes-devtools/python/python-setuptools_40.0.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-setuptools_39.2.0.bb
rename to meta/recipes-devtools/python/python-setuptools_40.0.0.bb
diff --git a/meta/recipes-devtools/python/python3-setuptools_39.2.0.bb b/meta/recipes-devtools/python/python3-setuptools_40.0.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-setuptools_39.2.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_40.0.0.bb
-- 
2.7.4


