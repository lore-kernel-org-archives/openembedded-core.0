Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 982086B7C2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2019 07:27:57 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id u18so9383726plq.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Jan 2019 23:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Lwxm7b7CdDLltLaCR4Lgn7KPDEzolyehNbcf7/5Tzvo=;
	b=nSIYDgZuvjquFKdfCvduvd8hGVYI5paMf4KvXdwizyRegXX0E9YJViSBstJ3ZiAfUk
	paGkchBOtLQjGknDnxx8Eexe1Vaz8y30iDROvw1KhA6HNCYDPyVqhl1CUV05tzTHCqRJ
	Rj+yNJoHpD+rPCELU2YIUpRSgLyo12fyfdFm5e+tSR3f6e+FIBConYHOlmts2U+V/Nsh
	LFcZD7KSohqugdIEPep6ultsgLKv/D9yGlANoucunj8o7gyGDGqfIiUdFKg6uJ8JyQ2Q
	yNE5EvZMCIyi/ivXgV8HRGEeBTVDxQxgnpJyDZSAX3xjmpJAw0XBMpHbM4GpmL936hHr
	XVeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Lwxm7b7CdDLltLaCR4Lgn7KPDEzolyehNbcf7/5Tzvo=;
	b=jqCiyx05FqP/FYzDY0xJW3Ol+c98lI8EMot6RzgjCEiHlZ6buLH46eii9KStwAzCGa
	Z1CIypuVPgfYbwoE+WqaV8g3dcNreihRMUw7Tz7d6fCbxhaaEbtKY2WrGHXyjT+Lemfg
	wzvKGj/X72ACdhbYmwDboi6PO7pcgfy2Q3mNPPnNz1rNki3hBpShYEuZu50QTsctDoNQ
	rUdTlQk4DJCbNzgtdadPRoVG7PsqQw/T42OCyWepnUuet1QAdewnFzZH38MmGmPVDKxE
	TqwhQ1FOlsXVqnyFFxq/U0pEvVQZRjY8uamKf8z0lR/JM/oDq93X2j0jpcDZi5d/tsFP
	nu/w==
X-Gm-Message-State: AJcUukfkyJg0IKprmxyCFJ+F+tRicsP3esjiLoIl2x1WEDllrwN+FWnd
	lvvrxIe0LZojvavQnZNyo6+zA7Obz7o=
X-Google-Smtp-Source: ALg8bN7GDSrexXD38tizC0GG3FTTkCVqFIPsCjdkpZbJw4d4EIWyP8KjcWcu5NGHtoQPkjokqXry+g==
X-Received: by 2002:a17:902:24d:: with SMTP id
	71mr28249001plc.225.1548055678435; 
	Sun, 20 Jan 2019 23:27:58 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::b601])
	by smtp.gmail.com with ESMTPSA id
	e16sm15239976pfn.46.2019.01.20.23.27.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Jan 2019 23:27:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 20 Jan 2019 23:27:49 -0800
Message-Id: <20190121072749.15424-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190121072749.15424-1-raj.khem@gmail.com>
References: <20190121072749.15424-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] apt: Backport a patch to include std::array definition
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
X-List-Received-Date: Mon, 21 Jan 2019 07:27:57 -0000
Content-Transfer-Encoding: 8bit

This partial backport helps compiling apt with clang/libc++

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/apt/apt.inc             |  1 +
 .../0001-Include-array.h-for-std-array.patch  | 35 +++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/apt/apt/0001-Include-array.h-for-std-array.patch

diff --git a/meta/recipes-devtools/apt/apt.inc b/meta/recipes-devtools/apt/apt.inc
index bff59e521a..842c30240b 100644
--- a/meta/recipes-devtools/apt/apt.inc
+++ b/meta/recipes-devtools/apt/apt.inc
@@ -13,6 +13,7 @@ SRC_URI = "https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/${BPN}/${P
            file://disable-test.patch \
            file://0001-environment.mak-musl-based-systems-can-generate-shar.patch \
            file://0001-apt-1.2.12-Fix-musl-build.patch \
+           file://0001-Include-array.h-for-std-array.patch \
            "
 SRC_URI[md5sum] = "ce8f9ab11f4fd0a08ec73eaffd75c8f0"
 SRC_URI[sha256sum] = "fa1311a9ce00e72379a0a3bc6d240ba30c0968cfbbb3472859e50b99e24e9598"
diff --git a/meta/recipes-devtools/apt/apt/0001-Include-array.h-for-std-array.patch b/meta/recipes-devtools/apt/apt/0001-Include-array.h-for-std-array.patch
new file mode 100644
index 0000000000..e4a8faa2b4
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt/0001-Include-array.h-for-std-array.patch
@@ -0,0 +1,35 @@
+From 4d64ec843185bf6fd1b85c3a6a4c4e3c968c8ab1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 20 Jan 2019 18:56:58 -0800
+Subject: [PATCH] Include <array.h> for std::array
+
+When compiling using clang/libc++ it fails to build because this header
+is not included, with libstdc++ this seems to be pulled in
+automatically.
+
+Fixes below error
+
+apt-pkg/contrib/strutl.cc:949:38: error: implicit instantiation of undefined template 'std::__1::array<const char *const, 7>'
+   std::array<char const * const, 7> c_weekdays = {{ "sun", "mon", "tue", "wed", "thu", "fri", "sat" }};
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Backport [https://github.com/Debian/apt/commit/24a59c62efafbdb8387b2d3c5616b04b9fd21306]
+---
+ apt-pkg/contrib/strutl.cc | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/apt-pkg/contrib/strutl.cc b/apt-pkg/contrib/strutl.cc
+index 60d0ca8..c2bfcbc 100644
+--- a/apt-pkg/contrib/strutl.cc
++++ b/apt-pkg/contrib/strutl.cc
+@@ -21,6 +21,7 @@
+ #include <apt-pkg/fileutl.h>
+ #include <apt-pkg/error.h>
+ 
++#include <array>
+ #include <algorithm>
+ #include <iomanip>
+ #include <locale>
+-- 
+2.20.1
+
-- 
2.20.1


