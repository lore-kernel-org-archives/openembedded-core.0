Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2513.1794961466247097320
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 16:24:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=CgoQRPwP;
 spf=pass (domain: gmail.com, ip: 74.125.82.44, mailfrom: ragaprasanth@gmail.com)
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1a3c08d6928so674252c88.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 16:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794961465; x=1795566265; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j/nGqGwy53/VMatOEmiJIl9iBvuzxx9MigxfYpufDbQ=;
        b=CgoQRPwP/GoJdENARrmUCyFeQFBbed/Es9qK66TZqosrE//4cIeechxoQ+totCNEVe
         /x1xSDBrTc22hz+VkGdm5FFACPf0Q0qeWslE0C1rKDIPpF3dEZTxJTz8m9zi2BR78Ktq
         1eg+H3XAWLYlXNe6UsmKci4ByYxc9BCAFo2gfEXMnJpUsdWySi3FZnSXdayhvbQlIqOT
         9NPP9tBOXorIa9i5/s6eOxhcUpSd/V5oB0SRsZoxDZ2IhWKvZ3t10xFQF61pxXSIoX+B
         6PBKi5CKQwrR3J7z/N7CEg5JbFWdkKDvbGcIyzcAHqKr0Ej/dn4FhwhkQDTlf7S6si3p
         qCMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794961465; x=1795566265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j/nGqGwy53/VMatOEmiJIl9iBvuzxx9MigxfYpufDbQ=;
        b=i085jj08iWSQfEXYLbHGbRVz5gtrPWT310fe8qsZNWSkNUnqnGoGOdDdLfAVMHgoBy
         H4J9rRlnAcpEHFTs4aBPtjRLxZ2VE5O7ph5K+AcOwmG0kTyiNwh37ccPZ6HRmG9I+uk0
         Y4Mu2lEVZja8UNVZMVsW5WljmYsFWXhkQymHBoOVMeUQ2BptmCIl81Pidq9eAljPPinP
         fFt3u7fcHxHSzI5eSYIzxgreLW9q9VxhQjCfUCjTIHbP1oHLf72qRhC8i2/aeG+PIgXO
         +xqwzX9QUm11xW4kBXHl9ugyvCZR8HYAJqbu9KPNoA9PqMIjm5AY1Db5ummbUxJFJsnd
         15Dw==
X-Gm-Message-State: APuU4Z+P6amZzNlNUZxIAb3+Ooz2MopVdmRR/4bJz10OcGeDHB4r1TeR
	Qh1wDwbW+jQxkFeFEGs8AuXXdc25phoKOAgVZpoYfXqF80A30HKuwlfIExlAO2ky
X-Gm-Gg: AYBFou1wofIjLs6HtKHueLfC73p+6wWboqZcsx34LHsRZBxGAPXY0lupeIsPdkNuxqw
	44m9sPagEVdUTWZF5l72SztF7yU6Eg4XX3mKaCWwV7vyv9f8HJSNPZwIDdYJDMwSExzuoaxV0wj
	aJR+Gc40S9snrlNqxYn7GiSocO57FgjOf9OXqySipaa/Jm+nl+3oQ9+lJsJQI7Jgp/Tq3KJy3nk
	zB/UTJaZUrJlyZbnHK/k2UXy+YylOfcEOw5l375L4zXUgUIgIlOhPaM5/bvQf5dWL+gHYkIbEmd
	JotYIX6CWFH3nJ6ku3chP6A0O/ZlQdD9KWONMjF5qCedfZIfnkABOIpHvimFcByABmR1mQAJyVR
	GFRcoZVYRlJQ8R6koNZZp2/Dj+AD3nrgSQHRzY2v5q0qXm4RPWq4MBxPzslRaXbJO4eekTmh2xX
	nJ1llGUfY8Bfma1B1EW+ibudcpPRFyfH+TkDFBXsnRenSOJP9EyDIgx7rGdCKy025+zWCxiVOLd
	orfRuxHbMTfoy4XUKb1b0qZiC/mS3ZmdUtphjXGVzyJSBCom0I4QkVFc6tjiz+/kRlkazhxN0Vu
	GpXpvH1jxdEYljypMTgW7/tdqJ1Mduc36yYOqlFTvWQQuupEwjhycANrz42SFqcCzQ==
X-Received: by 2002:a05:7022:ea56:20b0:1a9:f3d2:6262 with SMTP id a92af1059eb24-1b543d09688mr1095711c88.36.1794961465397;
        Tue, 17 Nov 2026 16:24:25 -0800 (PST)
Return-Path: <ragaprasanth@gmail.com>
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447f4e19sm2261778c88.13.2026.11.17.16.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:24:24 -0800 (PST)
From: Prasanth R <ragaprasanth@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: mathieu.dubois-briand@bootlin.com,
	Prasanth R <ragaprasanth@gmail.com>
Subject: [PATCH v2] cmake,cmake-native: upgrade 4.4.5 -> 4.5.0
Date: Wed, 18 Nov 2026 09:24:05 +0900
Message-Id: <20261118002405.3564394-1-ragaprasanth@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117061549.1066408-1-ragaprasanth@gmail.com>
References: <20261117061549.1066408-1-ragaprasanth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 00:24:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250504
Content-Type: text/plain; charset="utf-8"

CMake 4.5 now bundles rapidhash (MIT), so add its license file.

The bundled curl in 4.5 refuses OpenSSL older than 3.0. cmake-native
takes its libraries from the native sysroot (CMAKE_LIBRARY_PATH) but
not its headers, so FindOpenSSL used the host's openssl/ssl.h and the
build failed on hosts with OpenSSL 1.1. Add CMAKE_INCLUDE_PATH so the
headers come from openssl-native as well.

Release notes:
https://cmake.org/cmake/help/v4.5/release/4.5.html

AI-Generated: Uses Claude
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
v2:
- Take headers from the native sysroot too (CMAKE_INCLUDE_PATH), so
  FindOpenSSL uses openssl-native instead of the host's OpenSSL 1.1.

Tested: cmake-native, nativesdk-cmake, and cmake for qemux86-64 and
qemuarm; OPENSSL_INCLUDE_DIR now points to recipe-sysroot-native
(it was /usr/include before).

 .../cmake/{cmake-native_4.4.5.bb => cmake-native_4.5.0.bb}      | 2 ++
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 meta/recipes-devtools/cmake/{cmake_4.4.5.bb => cmake_4.5.0.bb}  | 1 +
 3 files changed, 4 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake-native_4.4.5.bb => cmake-native_4.5.0.bb} (95%)
 rename meta/recipes-devtools/cmake/{cmake_4.4.5.bb => cmake_4.5.0.bb} (96%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_4.4.5.bb b/meta/recipes-devtools/cmake/cmake-native_4.5.0.bb
similarity index 95%
rename from meta/recipes-devtools/cmake/cmake-native_4.4.5.bb
rename to meta/recipes-devtools/cmake/cmake-native_4.5.0.bb
index aed38b7ed1..48362195ef 100644
--- a/meta/recipes-devtools/cmake/cmake-native_4.4.5.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_4.5.0.bb
@@ -17,6 +17,7 @@ LIC_FILES_CHKSUM:append = " \
     file://Utilities/cmcurl/COPYING;md5=0515352b285b9c3f66464b135c9c0fdc \
     file://Utilities/cmnghttp2/COPYING;md5=764abdf30b2eadd37ce47dcbce0ea1ec \
     file://Utilities/cmcppdap/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57 \
+    file://Utilities/cmrapidhash/LICENSE;md5=4ba32c08f2e0fce0078296c3d100fb93 \
 "
 
 B = "${WORKDIR}/build"
@@ -24,6 +25,7 @@ do_configure[cleandirs] = "${B}"
 
 EXTRA_OECMAKE += "\
     -DCMAKE_LIBRARY_PATH=${STAGING_LIBDIR_NATIVE} \
+    -DCMAKE_INCLUDE_PATH=${STAGING_INCDIR_NATIVE} \
     -DBUILD_CursesDialog=1 \
     -DCMAKE_USE_SYSTEM_LIBRARY_JSONCPP=0 \
     -DCMAKE_USE_SYSTEM_LIBRARY_CPPDAP=0 \
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 30294fd9b8..01fe71c119 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            "
 
-SRC_URI[sha256sum] = "a0c54c88abb8078dd8eccadb717fc6bb194bf18e7d44c86309910288886e04e2"
+SRC_URI[sha256sum] = "424352d6133e8455e020da787008e8dc67abb18820af3532572ab35657e49213"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_4.4.5.bb b/meta/recipes-devtools/cmake/cmake_4.5.0.bb
similarity index 96%
rename from meta/recipes-devtools/cmake/cmake_4.4.5.bb
rename to meta/recipes-devtools/cmake/cmake_4.5.0.bb
index 6265316fd9..9cfd4434f0 100644
--- a/meta/recipes-devtools/cmake/cmake_4.4.5.bb
+++ b/meta/recipes-devtools/cmake/cmake_4.5.0.bb
@@ -15,6 +15,7 @@ LICENSE:append = " AND BSD-1-Clause AND MIT"
 LIC_FILES_CHKSUM:append = " \
     file://Utilities/cmjsoncpp/LICENSE;md5=5d73c165a0f9e86a1342f32d19ec5926 \
     file://Utilities/cmlibrhash/COPYING;md5=a8c2a557a5c53b1c12cddbee98c099af \
+    file://Utilities/cmrapidhash/LICENSE;md5=4ba32c08f2e0fce0078296c3d100fb93 \
 "
 
 # Strip ${prefix} from ${docdir}, set result into docdir_stripped
-- 
2.34.1

