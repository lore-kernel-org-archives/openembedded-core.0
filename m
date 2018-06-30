Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 04706745D1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jun 2018 09:37:29 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id b66-v6so6293894qkj.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jun 2018 02:37:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=PYYhVmUNDDRTcuzi0gkj02jal5cIsVAgUx3FGYI8XRQ=;
	b=E9ILSBM23QZfPJJZ9076maI3D2Hwr3BMCr54tCnA8S5+hqmY7vhHF54M44INzJtSTT
	iwFQP/HqFIMZ/7LxKNwcgX9xiwZyejl3wB2k+6J4E0VkIlBamwftYz2eyho0pHgidUs4
	om0+NjWSRV2w/gyWXLlV7GRJeRMIkpuxL2pw5dW38XFg4HyBANyTSv8jedquYsEmbn5a
	mWA7Ks5tLk7tKGK/N8vcFVdMpVh6VtnpnzVG0BI0t9LTIYvZXXv3s3lj1zFf7JvEXcat
	TxSpMLRihC0pu3akOVKeTzJMDcyX3jQO7KrTTLlEav80HSiov/3Otu9WFA4FptydW2pD
	Q3iA==
X-Gm-Message-State: APt69E31OsgSOLYJuAjOcBU99BryMzAGsjk5sTT5kTkNObW5QVDAP8e+
	6qm9049NBe2BNHP/YhTCDOua81K2
X-Google-Smtp-Source: AAOMgpf+82XX6yUTubJaWfHvaQb+xSYsBuntMzTnuKQljJGh/1RMtG+LtE5XA6B0aqxzw1zH0wzrwQ==
X-Received: by 2002:a37:d401:: with SMTP id
	l1-v6mr15288927qki.221.1530351450511; 
	Sat, 30 Jun 2018 02:37:30 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-100-33-240-84.nycmny.fios.verizon.net. [100.33.240.84])
	by smtp.gmail.com with ESMTPSA id
	l61-v6sm7103433qte.67.2018.06.30.02.37.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 30 Jun 2018 02:37:29 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Sat, 30 Jun 2018 05:37:20 -0400
Message-Id: <1530351440-2417-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] python3-pip: update to version 10.0.1
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
X-List-Received-Date: Sat, 30 Jun 2018 09:37:30 -0000

License-Update: Update checksum for whitespace (CRLF) changes

Update to the latest stable version

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python3-pip_9.0.3.bb => python3-pip_10.0.1.bb}          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_9.0.3.bb => python3-pip_10.0.1.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-pip_9.0.3.bb b/meta/recipes-devtools/python/python3-pip_10.0.1.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-pip_9.0.3.bb
rename to meta/recipes-devtools/python/python3-pip_10.0.1.bb
index 850556d..100d4d0 100644
--- a/meta/recipes-devtools/python/python3-pip_9.0.3.bb
+++ b/meta/recipes-devtools/python/python3-pip_10.0.1.bb
@@ -2,12 +2,12 @@ SUMMARY = "The PyPA recommended tool for installing Python packages"
 HOMEPAGE = "https://pypi.python.org/pypi/pip"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=25fba45109565f87de20bae85bc39452"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3f8d33acaac5c5dac8c613904bd56a6f"
 
 DEPENDS += "python3 python3-setuptools-native"
 
-SRC_URI[md5sum] = "b15b33f9aad61f88d0f8c866d16c55d8"
-SRC_URI[sha256sum] = "7bf48f9a693be1d58f49f7af7e0ae9fe29fd671cde8a55e6edca3581c4ef5796"
+SRC_URI[md5sum] = "83a177756e2c801d0b3a6f7b0d4f3f7e"
+SRC_URI[sha256sum] = "f2bd08e0cd1b06e10218feaf6fef299f473ba706582eb3bd9d52203fdbd7ee68"
 
 inherit pypi distutils3
 
-- 
2.7.4


