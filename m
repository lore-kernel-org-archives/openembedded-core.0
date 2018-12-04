Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id F207E6C510
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Dec 2018 15:08:52 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id r11-v6so9922991wmb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Dec 2018 07:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=npWAJiIRc7xtXrkzbwOwVxl351SGPnHPstKHV5cenkw=;
	b=MhQEkZWP3rM3FparDyO0Q+pTKUIzPdfIYh9jdR+ySRUDhsWZnq76R0HCXh1OvOwS29
	pK+CQR53Ot83wsC/8pSWmkHi5x6XFPPqgX/xSmMjxApIHvJkA9GwNSFCaXUDpaaEpRFx
	Kw4r7dEslA3HWnv7LNfS0bMtEY4sd0imrI85IOlmbLR6cODIWIa9BjSJQeCMcNNKoBkL
	getEeYn5AYYVu/Nb76U21ZnJeN+OhGKEMI5aSP/Ul1SPHAK/V0aGEvH1HKxfiacmRnTM
	REpJFVeg/OKw4lNmH4QkUdrLCNOpV2P/mEnbTMqLvywmXHMWq/iQ0ZtGKZAFCoHWl0PU
	S/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=npWAJiIRc7xtXrkzbwOwVxl351SGPnHPstKHV5cenkw=;
	b=ky0A/GXACS+29rgtnB1qHKye4nV0qA0GpRD3yMJtz5Lt2Kqbboy2MtYuVVNm4INpY/
	Ffjfvb74TjEtLPaQIbyZwZfOqeop9DhzWwiPzeAFi9Nv4UkK1jYyPu8IfFObuZcO5AID
	Jwyc4/CHUZdpGyI5vazTt6ygf5BAWiLP/H3sElGPWnKRPwT0WTBu8GXCdAChsDXuznxZ
	kIvGmNikIKA+ZBZbZ4v+MSRoBbqM6tzaNz5aNeAJJAijIQpsmqjE/fFa2BBGRpz3ohSS
	sEM0TVuPAcoKctVrNcU4Ig/NO0m2CCm8/XppUeYAiGDg1RgM/26c3Cevf9c4dzVkn88u
	EanQ==
X-Gm-Message-State: AA+aEWagA7pWwM4q4/bADHNTBdfT6oKjyqOvu53iHcy7VtM1fL6DPs2J
	qG3gWxmbRoWVH0+7mZHLG5y5PPlJvwY=
X-Google-Smtp-Source: AFSGD/Ud2ExSW3+L7AECu3b7Ad6HQ3CZTNormOyqoFU5wI1cdB2hE5BX8yVp7Qp5EshB55DVYyIWTA==
X-Received: by 2002:a1c:ee5b:: with SMTP id m88mr11624211wmh.12.1543936133359; 
	Tue, 04 Dec 2018 07:08:53 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id y12sm7393640wmi.7.2018.12.04.07.08.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Dec 2018 07:08:52 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Dec 2018 15:08:48 +0000
Message-Id: <20181204150848.15759-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20181204150848.15759-1-ross.burton@intel.com>
References: <20181204150848.15759-1-ross.burton@intel.com>
Subject: [PATCH 2/2] python3: drop redundant patch
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
X-List-Received-Date: Tue, 04 Dec 2018 15:08:53 -0000

This patch altered the clean target's behaviour to skip the ipkg-install
directory.  However this directory isn't created by opkg, opkg-utils, or the
package_ipk class; and we don't invoke the clean target as we perform
out-of-tree builds.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../python/python3-native_3.5.6.bb                 |  1 -
 .../python3/070-dont-clean-ipkg-install.patch      | 38 ----------------------
 meta/recipes-devtools/python/python3_3.5.6.bb      |  1 -
 3 files changed, 40 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/070-dont-clean-ipkg-install.patch

diff --git a/meta/recipes-devtools/python/python3-native_3.5.6.bb b/meta/recipes-devtools/python/python3-native_3.5.6.bb
index 4c8faf88c01..8476d681c3f 100644
--- a/meta/recipes-devtools/python/python3-native_3.5.6.bb
+++ b/meta/recipes-devtools/python/python3-native_3.5.6.bb
@@ -6,7 +6,6 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
 file://12-distutils-prefix-is-inside-staging-area.patch \
 file://python-config.patch \
 file://030-fixup-include-dirs.patch \
-file://070-dont-clean-ipkg-install.patch \
 file://080-distutils-dont_adjust_files.patch \
 file://130-readline-setup.patch \
 file://150-fix-setupterm.patch \
diff --git a/meta/recipes-devtools/python/python3/070-dont-clean-ipkg-install.patch b/meta/recipes-devtools/python/python3/070-dont-clean-ipkg-install.patch
deleted file mode 100644
index f9971c6bafd..00000000000
--- a/meta/recipes-devtools/python/python3/070-dont-clean-ipkg-install.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-consider opkg directories when cleaning up
-
--Khem
-
-Upstream-Status: Inappropriate [OE specific]
-
----
- Makefile.pre.in |    6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-Index: Python-3.5.3/Makefile.pre.in
-===================================================================
---- Python-3.5.3.orig/Makefile.pre.in
-+++ Python-3.5.3/Makefile.pre.in
-@@ -1574,8 +1574,8 @@ touch:
- # Sanitation targets -- clean leaves libraries, executables and tags
- # files, which clobber removes as well
- pycremoval:
--	-find $(srcdir) -depth -name '__pycache__' -exec rm -rf {} ';'
--	-find $(srcdir) -name '*.py[co]' -exec rm -f {} ';'
-+	-find $(srcdir) ! -path './ipkg-install/*' -depth -name '__pycache__' -exec rm -rf {} ';'
-+	-find $(srcdir) ! -path './ipkg-install/*' -name '*.py[co]' -exec rm -f {} ';'
- 
- rmtestturds:
- 	-rm -f *BAD *GOOD *SKIPPED
-@@ -1589,9 +1589,9 @@ docclean:
- 	-rm -rf Doc/tools/sphinx Doc/tools/pygments Doc/tools/docutils
- 
- clean: pycremoval
--	find . -name '*.[oa]' -exec rm -f {} ';'
--	find . -name '*.s[ol]' -exec rm -f {} ';'
--	find . -name '*.so.[0-9]*.[0-9]*' -exec rm -f {} ';'
-+	find . ! -path './ipkg-install/*' -name '*.[oa]' -exec rm -f {} ';'
-+	find . ! -path './ipkg-install/*' -name '*.s[ol]' -exec rm -f {} ';'
-+	find . ! -path './ipkg-install/*' -name '*.so.[0-9]*.[0-9]*' -exec rm -f {} ';'
- 	find build -name 'fficonfig.h' -exec rm -f {} ';' || true
- 	find build -name '*.py' -exec rm -f {} ';' || true
- 	find build -name '*.py[co]' -exec rm -f {} ';' || true
diff --git a/meta/recipes-devtools/python/python3_3.5.6.bb b/meta/recipes-devtools/python/python3_3.5.6.bb
index 275b7acd652..86176d0e962 100644
--- a/meta/recipes-devtools/python/python3_3.5.6.bb
+++ b/meta/recipes-devtools/python/python3_3.5.6.bb
@@ -9,7 +9,6 @@ DISTRO_SRC_URI_linuxstdbase = ""
 SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
 file://python-config.patch \
 file://030-fixup-include-dirs.patch \
-file://070-dont-clean-ipkg-install.patch \
 file://130-readline-setup.patch \
 file://150-fix-setupterm.patch \
 file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch \
-- 
2.11.0


