Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 765C27CF8A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Mar 2019 16:40:25 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id 10so3350450lfr.8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Mar 2019 09:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=dKE6d9Pd2y1FNyUCKrjunf9/KGt6HXuybgqBMlKYvGk=;
	b=WaIrssZessc0jxOImrvdKbyW/DDkoHInB3JcRhu0f1z2lzQFe6+wCxe1gmIfWyFcWR
	WMe3NVwHggmGZ8NECEtiqyykQvfqiRwfbAfoaMlpxZxMgrPhfYnYFNeUf54QcYceDXWD
	DznM1jC2ANPcAvK6BIILLHeHIwwNrh129yWTbJWLWHthi4doazUF38p1g+HYxO8q3PRo
	17tq7GyFdRd6Lhpshjq/vwSxPGoKszNjFDYYlt2GGxPyzKV8dUM8c33WLqsGiPQEgzfb
	7YvE0VXd/qbcSF/0twwU9pMvi4W0i7ULmUwssVOHElVQjpNdFqPoyoAKaWVhP1pjLw59
	7IIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dKE6d9Pd2y1FNyUCKrjunf9/KGt6HXuybgqBMlKYvGk=;
	b=ULErblovARr4XOT7hKrBUMjLjBygdnnzIjBJ1980nnBL7pHjGh5FNA2zqGVjgEC3r5
	o+GjR/g925ygNFDVRfh6WwM4HZekYpsYTsaXyFq/khJCVSJ7+Fm+9BaiOtyljDmqJphn
	1P902dCTMQkRS7L7JN8jXWDFRcC3he37Hx4gn4VzISx59d+hQsmKhPDia/c738xomZ5y
	kpWgzqoe5vknF30w0HknHf22N6rXLRHoDc7z8+/jN/pQp453c4eUKWOzqrf7ib4PW2IU
	BDTxzlQTXGjBIsTNJZbPXaYyFGxZT1AFCGbdt/r2Qd5ahstw/Co/PqVTUPJdKhoFBh7k
	5sYA==
X-Gm-Message-State: APjAAAVQ9bN8gatVF2FVaqM9Ivg4tcMeGMrql1ELYxxmkyy/twk+g2fj
	Ol7soPf0H0byKNVgF6LLU9HBwtKIz90=
X-Google-Smtp-Source: APXvYqxvvbp4CSWG8sT9k6ddF7cs4/wmtzq8cFAvS8oVOfdexIak158o8z19qTD6kbZBBR5btl2Yng==
X-Received: by 2002:ac2:44a2:: with SMTP id c2mr7865815lfm.155.1553359225769; 
	Sat, 23 Mar 2019 09:40:25 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	s24sm1048717ljs.30.2019.03.23.09.40.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 23 Mar 2019 09:40:25 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Mar 2019 17:40:10 +0100
Message-Id: <20190323164010.18632-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v3] ninja: update to 1.9.0
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
X-List-Received-Date: Sat, 23 Mar 2019 16:40:25 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../ninja/ninja/fix-musl.patch                | 39 +++++++++++++++++++
 .../ninja/{ninja_1.8.2.bb => ninja_1.9.0.bb}  |  6 ++-
 2 files changed, 43 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/ninja/ninja/fix-musl.patch
 rename meta/recipes-devtools/ninja/{ninja_1.8.2.bb => ninja_1.9.0.bb} (87%)

diff --git a/meta/recipes-devtools/ninja/ninja/fix-musl.patch b/meta/recipes-devtools/ninja/ninja/fix-musl.patch
new file mode 100644
index 0000000000..543d4f1c48
--- /dev/null
+++ b/meta/recipes-devtools/ninja/ninja/fix-musl.patch
@@ -0,0 +1,39 @@
+2ff54ad7478a90bd75c91e434236a Mon Sep 17 00:00:00 2001
+From: makepost <makepost@firemail.cc>
+Date: Mon, 24 Dec 2018 03:13:16 +0200
+Subject: [PATCH] Use st_mtim if st_mtime is macro, fix #1510
+
+In POSIX.1-2008, sys_stat has a st_mtim member and a st_mtime backward
+compatibility macro. Should help avoid hardcoding platform detection.
+---
+ src/disk_interface.cc | 14 ++++----------
+ 1 file changed, 4 insertions(+), 10 deletions(-)
+
+diff --git a/src/disk_interface.cc b/src/disk_interface.cc
+index d4c2fb087..dc297c449 100644
+--- src/disk_interface.cc
++++ /src/disk_interface.cc
+@@ -202,19 +202,13 @@ TimeStamp RealDiskInterface::Stat(const string& path, string* err) const {
+   // that it doesn't exist.
+   if (st.st_mtime == 0)
+     return 1;
+-#if defined(__APPLE__) && !defined(_POSIX_C_SOURCE)
++#if defined(_AIX)
++  return (int64_t)st.st_mtime * 1000000000LL + st.st_mtime_n;
++#elif defined(__APPLE__)
+   return ((int64_t)st.st_mtimespec.tv_sec * 1000000000LL +
+           st.st_mtimespec.tv_nsec);
+-#elif (_POSIX_C_SOURCE >= 200809L || _XOPEN_SOURCE >= 700 || defined(_BSD_SOURCE) || defined(_SVID_SOURCE) || \
+-       defined(__BIONIC__) || (defined (__SVR4) && defined (__sun)) || defined(__FreeBSD__))
+-  // For glibc, see "Timestamp files" in the Notes of http://www.kernel.org/doc/man-pages/online/pages/man2/stat.2.html
+-  // newlib, uClibc and musl follow the kernel (or Cygwin) headers and define the right macro values above.
+-  // For bsd, see https://github.com/freebsd/freebsd/blob/master/sys/sys/stat.h and similar
+-  // For bionic, C and POSIX API is always enabled.
+-  // For solaris, see https://docs.oracle.com/cd/E88353_01/html/E37841/stat-2.html.
++#elif defined(st_mtime) // A macro, so we're likely on modern POSIX.
+   return (int64_t)st.st_mtim.tv_sec * 1000000000LL + st.st_mtim.tv_nsec;
+-#elif defined(_AIX)
+-  return (int64_t)st.st_mtime * 1000000000LL + st.st_mtime_n;
+ #else
+   return (int64_t)st.st_mtime * 1000000000LL + st.st_mtimensec;
+ #endif
diff --git a/meta/recipes-devtools/ninja/ninja_1.8.2.bb b/meta/recipes-devtools/ninja/ninja_1.9.0.bb
similarity index 87%
rename from meta/recipes-devtools/ninja/ninja_1.8.2.bb
rename to meta/recipes-devtools/ninja/ninja_1.9.0.bb
index c6fcfef3dd..1b06328961 100644
--- a/meta/recipes-devtools/ninja/ninja_1.8.2.bb
+++ b/meta/recipes-devtools/ninja/ninja_1.9.0.bb
@@ -5,9 +5,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a81586a64ad4e476c791cda7e2f2c52e"
 
 DEPENDS = "re2c-native ninja-native"
 
-SRCREV = "253e94c1fa511704baeb61cf69995bbf09ba435e"
+SRCREV = "b25c08bda4949192c69cea4cee057887341a2ffc"
 
-SRC_URI = "git://github.com/ninja-build/ninja.git;branch=release"
+SRC_URI = "git://github.com/ninja-build/ninja.git;branch=release \
+           file://fix-musl.patch \
+"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
 
 S = "${WORKDIR}/git"
-- 
2.17.1


