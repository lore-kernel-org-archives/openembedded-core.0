Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id C4FCA7C984
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 11:31:41 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id l5so24461384wrw.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 03:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=kgzQR3EdQ7GjxZ/hBOTxXSxIEPXIOn5oltZEXgsE2so=;
	b=A20QCCm+vv4t65XlKyp7EncHwkgk81YbD4mmP7S0jmVzGwzfkbKG73jKLITabfJS/j
	L+VpORtHHnznGViJboLuU8RZKjE9ErJhRAFNjrxitAHur3YitnWlnt14ZqCoUsR+RkUz
	A0Svbsn9tm29hWtJAQv3/hsXKGMVGdPFCoe9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=kgzQR3EdQ7GjxZ/hBOTxXSxIEPXIOn5oltZEXgsE2so=;
	b=FG0YvCBJwUxtdVyfrUVvby45NrC5eCWeXeR2UNgwOqwRyllIBF2Ai5USrfPfFIizX7
	A+QceKU9QrS+USm/B7SSpiGw5xNbKOe6ScS4VoGaM2DT6ER77NZ3AJ+Z45t4AkhJx4Vx
	9yaR3Lg2e46TOXhQeMVsMWS+fR2unb2dsc3Ycp5dK/hseDieTUfPEuizPOmcwzHDcnDv
	QteXGc7ip+H+IUbIwKdGoIVjMLRS9C5UFQ0Oxjnf7AADvYTJMMp5HQ0sRhxWv+xgVlPB
	qZamEBssvvjV0AT54Ho2mhDU2tnybG8PzQZ4FUDnBikcnXaFMH5Rl3FvpWFs0e3JNLXg
	SFMA==
X-Gm-Message-State: AHQUAuZB6/laQg5MMGCO6VhJQ8+s5E39TxMDw5X3saLXeGgRBAC4Re3E
	vyU7x47GOtPzASjp+PUYLEXvrPGCOAA=
X-Google-Smtp-Source: AHgI3IZNXfkADQ3SG2QPF0WKdZ3Rzvpci47h1dNfMD2tEGkE2caL1RmfbZldADuU+PMUctqfNafuXg==
X-Received: by 2002:adf:a749:: with SMTP id e9mr23209002wrd.210.1550662302038; 
	Wed, 20 Feb 2019 03:31:42 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l125sm10377824wml.18.2019.02.20.03.31.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Feb 2019 03:31:40 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Feb 2019 11:31:35 +0000
Message-Id: <20190220113136.25171-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190220113136.25171-1-richard.purdie@linuxfoundation.org>
References: <20190220113136.25171-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 4/5] python3-setuptools: upgrade 40.0.0 -> 40.8.0
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
X-List-Received-Date: Wed, 20 Feb 2019 11:31:42 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...nditionally-do-not-fetch-code-by-easy_install.patch | 10 ++++------
 meta/recipes-devtools/python/python-setuptools.inc     |  4 ++--
 ...etuptools_40.0.0.bb => python-setuptools_40.8.0.bb} |  0
 ...tuptools_40.0.0.bb => python3-setuptools_40.8.0.bb} |  0
 4 files changed, 6 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/python/{python-setuptools_40.0.0.bb => python-setuptools_40.8.0.bb} (100%)
 rename meta/recipes-devtools/python/{python3-setuptools_40.0.0.bb => python3-setuptools_40.8.0.bb} (100%)

diff --git a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index 4b179218804..169d1b155bd 100644
--- a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From 019422d19c6401fa8f45b1311ecd31bb087c809d Mon Sep 17 00:00:00 2001
+From 5bba4f57f048016aa92ce5909e9e372db619554e Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
@@ -9,15 +9,16 @@ internet by easy_install.
 Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
 ---
  setuptools/command/easy_install.py | 5 +++++
  1 file changed, 5 insertions(+)
 
 diff --git a/setuptools/command/easy_install.py b/setuptools/command/easy_install.py
-index 85ee40f..7eb9d2a 100755
+index 05508ce..945e118 100755
 --- a/setuptools/command/easy_install.py
 +++ b/setuptools/command/easy_install.py
-@@ -637,6 +637,11 @@ class easy_install(Command):
+@@ -640,6 +640,11 @@ class easy_install(Command):
              os.path.exists(tmpdir) and rmtree(rmtree_safe(tmpdir))
  
      def easy_install(self, spec, deps=False):
@@ -29,6 +30,3 @@ index 85ee40f..7eb9d2a 100755
          if not self.editable:
              self.install_site_py()
  
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index 315ba313965..9092d7ad03a 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -10,8 +10,8 @@ inherit pypi
 
 SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-easy_install.patch"
 
-SRC_URI[md5sum] = "260630ae1a64bafa39dcc53404d63829"
-SRC_URI[sha256sum] = "012adb8e25fbfd64c652e99e7bab58799a3aaf05d39ab38561f69190a909015f"
+SRC_URI[md5sum] = "712697a5bc975cf479d487cd68206c20"
+SRC_URI[sha256sum] = "6e4eec90337e849ade7103723b9a99631c1f0d19990d6e8412dc42f5ae8b304d"
 
 DEPENDS += "${PYTHON_PN}"
 
diff --git a/meta/recipes-devtools/python/python-setuptools_40.0.0.bb b/meta/recipes-devtools/python/python-setuptools_40.8.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-setuptools_40.0.0.bb
rename to meta/recipes-devtools/python/python-setuptools_40.8.0.bb
diff --git a/meta/recipes-devtools/python/python3-setuptools_40.0.0.bb b/meta/recipes-devtools/python/python3-setuptools_40.8.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-setuptools_40.0.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_40.8.0.bb
-- 
2.20.1


