Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3F086788B9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 16:43:25 +0000 (UTC)
Received: by mail-qt0-f170.google.com with SMTP id l25so7919073qtj.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 09:43:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=eEuR6bEMhSVR4iAunorrxVCwUGpHqzqYAXhBUx6Yqgg=;
	b=X65wF2ZPumXqo0b4kpghBWbK5nuAuWk3u2GhF+fsv8nRNXJjRo6RkOCJpKaEYktHG9
	lq19LoEhfVCG30DxrrQoY3iVGrKs4zkzwEWooSQioRBXW4t9Uq1+rLD9Ngi+BRq3MCcc
	aSJuya5nG6R+DzjQC9IY2zmA1GoMHi7ONONUrKhQog7V1KBP3tIbUhiZ0QZ4KrSi6KZG
	ezJTIQi3B0SKqOBhjl6P1Fm1a/NmfxeUiAJaxlcoC7eSJZzoqQrbmgoFdT4bI3HUI8g0
	3NgRP2rQFZmUaRU+yatvLrirjJ6ocBiV6IMl/1GtZzeTbTxrxjJV32kTKDhfgGjIOzCg
	JYgA==
X-Gm-Message-State: AElRT7FZRJRJzmcNIN1obSCNnuzYBRacTtoKfm+qOydVwK1vjlRCK3rB
	rsG/lIjmYYWx7e4Pi1l+cpYAnsgY
X-Google-Smtp-Source: AG47ELsF2p4rIsrWabuYKabDGjhH0E1BdiwPeGUzCn9mAfZpgw8QlWlWZPcshtd2+8rscz1h8LnfGw==
X-Received: by 10.200.47.163 with SMTP id l32mr13626506qta.195.1521132206611; 
	Thu, 15 Mar 2018 09:43:26 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id u5sm3474456qkh.36.2018.03.15.09.43.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 15 Mar 2018 09:43:25 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Mar 2018 12:43:11 -0400
Message-Id: <1521132191-17851-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCHv3] python3: update to version 3.5.5 to fix security issues
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
X-List-Received-Date: Thu, 15 Mar 2018 16:43:26 -0000

License-Update: checksum change is due to bump in copyright year

Resolves CVE-2017-1000158 and other potential security issues

See https://docs.python.org/3.5/whatsnew/changelog.html#python-3-5-5-final

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python3-native_3.5.4.bb => python3-native_3.5.5.bb}     | 6 +++---
 meta/recipes-devtools/python/{python3_3.5.4.bb => python3_3.5.5.bb} | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/python/{python3-native_3.5.4.bb => python3-native_3.5.5.bb} (94%)
 rename meta/recipes-devtools/python/{python3_3.5.4.bb => python3_3.5.5.bb} (98%)

diff --git a/meta/recipes-devtools/python/python3-native_3.5.4.bb b/meta/recipes-devtools/python/python3-native_3.5.5.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-native_3.5.4.bb
rename to meta/recipes-devtools/python/python3-native_3.5.5.bb
index c825253..3f09b32 100644
--- a/meta/recipes-devtools/python/python3-native_3.5.4.bb
+++ b/meta/recipes-devtools/python/python3-native_3.5.5.bb
@@ -27,10 +27,10 @@ file://0001-Do-not-use-the-shell-version-of-python-config-that-w.patch \
 file://support_SOURCE_DATE_EPOCH_in_py_compile.patch \
 "
 
-SRC_URI[md5sum] = "fb2780baa260b4e51cbea814f111f303"
-SRC_URI[sha256sum] = "94d93bfabb3b109f8a10365a325f920f9ec98c6e2380bf228f9700a14054c84c"
+SRC_URI[md5sum] = "f3763edf9824d5d3a15f5f646083b6e0"
+SRC_URI[sha256sum] = "063d2c3b0402d6191b90731e0f735c64830e7522348aeb7ed382a83165d45009"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f741e51de91d4eeea5930b9c3c7fa69d"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b6ec515b22618f55fa07276b897bacea"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
diff --git a/meta/recipes-devtools/python/python3_3.5.4.bb b/meta/recipes-devtools/python/python3_3.5.5.bb
similarity index 98%
rename from meta/recipes-devtools/python/python3_3.5.4.bb
rename to meta/recipes-devtools/python/python3_3.5.5.bb
index a94d009..8150dd6 100644
--- a/meta/recipes-devtools/python/python3_3.5.4.bb
+++ b/meta/recipes-devtools/python/python3_3.5.5.bb
@@ -38,10 +38,10 @@ SRC_URI += "\
             file://0001-Issue-21272-Use-_sysconfigdata.py-to-initialize-dist.patch \
             file://pass-missing-libraries-to-Extension-for-mul.patch \
            "
-SRC_URI[md5sum] = "fb2780baa260b4e51cbea814f111f303"
-SRC_URI[sha256sum] = "94d93bfabb3b109f8a10365a325f920f9ec98c6e2380bf228f9700a14054c84c"
+SRC_URI[md5sum] = "f3763edf9824d5d3a15f5f646083b6e0"
+SRC_URI[sha256sum] = "063d2c3b0402d6191b90731e0f735c64830e7522348aeb7ed382a83165d45009"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f741e51de91d4eeea5930b9c3c7fa69d"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b6ec515b22618f55fa07276b897bacea"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.7.4


