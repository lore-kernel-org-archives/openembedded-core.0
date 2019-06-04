Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 030786D6F5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jun 2019 16:04:16 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id h1so16436127wro.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Jun 2019 09:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=lP1X4OxlasiK4BwPkiFEbnB4qluJZTqyYq6KK/DO858=;
	b=qgdVCv75KPyjstQwSEQFs+yfpO+7/kJnQtsfvgcS9WyxS7OqWJtt7CgUPjXLHGjkbO
	Z/VcijPTO1bVmsjCVjAsPkje36nGBKZdreTZdGabQv/Yh4P6B5eSt9J79sUB1Exgs0GN
	4sWWsY1oRlyfVhiuoWdgnr3CFiUklxP5Bn9SIOaz5fqPcUQuxKzHAQIfhk+NzCPcnn9S
	kUW1HbsstdkWfzjbIyglMMV5WPxkHqBt9xxyaBH5s+OV5cg0gBzxemp00Q6+6VQ/PMca
	/Tx0dSMCWVQJJgICr5d8JgiCLZulPQVd0AsK2fH2XMLTibl1u3koSYqSF/nhAB62Ck74
	a19w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=lP1X4OxlasiK4BwPkiFEbnB4qluJZTqyYq6KK/DO858=;
	b=uL3jYAbUM0ETjJk2HwVtr9dW7fGbeowO243rvJT0OffQ+mk4SdlhZHfnlZ1LqbKWRO
	o46nLeS+yyGywN9hWEjovg5GJ+rMQsJaf7eh92hu+uJGrT9hduhg+MPi9xZ2WGLz7lM9
	cge4qG6Q1etxRUVHWcH1iLUobZADt5QddrmS0AzrTmU0n6KwUfNOovd8dTQ3XpbF5VFx
	hVv+rDaeFQ/3OKTk8orjNmiilWcTr+SOIGDa3qscbBC/9tB1+JBw341lw8MfQUvWcqUz
	dNgEZyuRfTWv75pmpRHEmJKl+zHJr+yXSiMYZzvstENwklqUJMBph3lu7GfImdF+AqoN
	8XHw==
X-Gm-Message-State: APjAAAWd+DYBFPG/YlrnSx44jYt5HbmE3MJUQQdiKR3fFIC1MgT6LSlP
	1GF/yQr8CEKdt9J58RsSISgctMWybtw=
X-Google-Smtp-Source: APXvYqyuoS/KBoFZyWC3cjneE0HSdMaOjiO6Sgjp9pK5XI54i3AiuFBq2jk8zWHiJaUNb/rcPu4oDg==
X-Received: by 2002:a05:6000:120a:: with SMTP id
	e10mr21986165wrx.171.1559664257134; 
	Tue, 04 Jun 2019 09:04:17 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	k10sm11592396wmk.14.2019.06.04.09.04.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Jun 2019 09:04:16 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Jun 2019 17:04:13 +0100
Message-Id: <20190604160413.22313-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] libidn2: upgrade to 2.2.0
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
X-List-Received-Date: Tue, 04 Jun 2019 16:04:17 -0000

The unistring patch isn't needed anymore (the relevant lines are entirely
removed).

License checksums updated because of a typo fix, and an added author name.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...need_charset_alias-when-building-for-musl.patch | 23 ----------------------
 .../libidn/{libidn2_2.0.5.bb => libidn2_2.2.0.bb}  | 12 +++++------
 2 files changed, 5 insertions(+), 30 deletions(-)
 delete mode 100644 meta/recipes-extended/libidn/libidn2/Unset-need_charset_alias-when-building-for-musl.patch
 rename meta/recipes-extended/libidn/{libidn2_2.0.5.bb => libidn2_2.2.0.bb} (67%)

diff --git a/meta/recipes-extended/libidn/libidn2/Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-extended/libidn/libidn2/Unset-need_charset_alias-when-building-for-musl.patch
deleted file mode 100644
index ace50bbfde5..00000000000
--- a/meta/recipes-extended/libidn/libidn2/Unset-need_charset_alias-when-building-for-musl.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Unset need_charset_alias when building for musl
-
-localcharset uses ac_cv_gnu_library_2_1 from glibc21.m4
-which actually shoudl be fixed in gnulib and then all downstream
-projects will get it eventually. For now we apply the fix to
-coreutils
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Index: libidn2-2.0.5/unistring/Makefile.am
-===================================================================
---- libidn2-2.0.5.orig/unistring/Makefile.am
-+++ libidn2-2.0.5/unistring/Makefile.am
-@@ -293,7 +293,7 @@ install-exec-localcharset: all-local
- 	  case '$(host_os)' in \
- 	    darwin[56]*) \
- 	      need_charset_alias=true ;; \
--	    darwin* | cygwin* | mingw* | pw32* | cegcc*) \
-+	    darwin* | cygwin* | mingw* | pw32* | cegcc* | linux-musl*) \
- 	      need_charset_alias=false ;; \
- 	    *) \
- 	      need_charset_alias=true ;; \
diff --git a/meta/recipes-extended/libidn/libidn2_2.0.5.bb b/meta/recipes-extended/libidn/libidn2_2.2.0.bb
similarity index 67%
rename from meta/recipes-extended/libidn/libidn2_2.0.5.bb
rename to meta/recipes-extended/libidn/libidn2_2.2.0.bb
index 0daf7a68770..d7fec89fba2 100644
--- a/meta/recipes-extended/libidn/libidn2_2.0.5.bb
+++ b/meta/recipes-extended/libidn/libidn2_2.2.0.bb
@@ -3,17 +3,15 @@ DESCRIPTION = "Implementation of the Stringprep, Punycode and IDNA specification
 HOMEPAGE = "http://www.gnu.org/software/libidn/"
 SECTION = "libs"
 LICENSE = "(GPLv2+ | LGPLv3) & GPLv3+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ab90e75ef97cc6318ce4f2fbda62fe4d \
+LIC_FILES_CHKSUM = "file://COPYING;md5=2d834ea7d480438ada04e5d846152395 \
                     file://COPYING.LESSERv3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
                     file://COPYINGv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://src/idn2.c;endline=16;md5=0283aec28e049f5bcaaeee52aa865874 \
+                    file://src/idn2.c;endline=16;md5=426b74d6deb620ab6d39c8a6efd4c13a \
                     file://lib/idn2.h.in;endline=27;md5=c2cd28d3f87260f157f022eabb83714f"
 
-SRC_URI = "${GNU_MIRROR}/libidn/${BPN}-${PV}.tar.gz \
-           file://Unset-need_charset_alias-when-building-for-musl.patch \
-          "
-SRC_URI[md5sum] = "eaf9a5b9d03b0cce3760f34b3124eb36"
-SRC_URI[sha256sum] = "53f69170886f1fa6fa5b332439c7a77a7d22626a82ef17e2c1224858bb4ca2b8"
+SRC_URI = "${GNU_MIRROR}/libidn/${BPN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "b846d4d20e22b99d6f7387bb66e00a1f"
+SRC_URI[sha256sum] = "fc734732b506d878753ec6606982bf7b936e868c25c30ddb0d83f7d7056381fe"
 
 DEPENDS = "virtual/libiconv libunistring"
 
-- 
2.11.0


