Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7055B7CFDF
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Mar 2019 16:39:21 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id p1so3328467lfk.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Mar 2019 09:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=dKE6d9Pd2y1FNyUCKrjunf9/KGt6HXuybgqBMlKYvGk=;
	b=zxB8KvY03Rr3A6jkI0sptRT1gYLxzW1AjHmtA4cA6gHY+0DN3aqiUB4wkvvL+iYtUN
	Yy04ru3YBljr8C30bRck8K57feGH9Yir9Ax+8IDJzEmPBUm9x6J34l9W0etTExSqUDv2
	zYHTbdpfGo/pIk0uq422UJ4nArxG60Bt/bbIAeYmIyS/qfkCdReE2DRRUXFCftz/HHgo
	smMgEqkceotrx0ItCXlcvIRBulzjyBHKZNdpG+jCLNDabgX4IE/Lwbddk2JeIkk10z4L
	UEth1Xr4abT4OXGyg1t//Me4eIgxIga21QAUl7vrmsm1+0tDkLZcOD3qyY5WxPNLnJBO
	D6Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dKE6d9Pd2y1FNyUCKrjunf9/KGt6HXuybgqBMlKYvGk=;
	b=UKNydrpCkQz8pnmKyz1NVF151r2IFrZJIb32irSj1QR+lBU7arWgFHua0Y23zsQRn0
	JUo8nXoNz9rMdTcdhj8ik3J6rLGHSPEpukCJGZML/sNX7ApMeY8UY53iH9+hQQ9m39KU
	EOGQEOgl+xyLML2wpHl2SXxbyeUH9n+2fhUdvpgg5B4hMfXs7Ge4N7/G1Hj15KLggBJ5
	BmmE2Q1Z4DaS8MtLQIYsCxDfVE8q9M/V/HpC15ZV4Rei/I4XCj8Th8nqvpmSzH67g3ll
	uTfmzxt+p6hcKH5LdGuyNb2u22q9r4jsWpo2v3QcLRkp1tC+Q69roSt2DEPD3xQkmg0m
	YhRA==
X-Gm-Message-State: APjAAAVvxMRBAUt99d208nS1YeLsdgkU746sQSH8ZUOvWR9XFwLIJu5h
	NKjUxswJxTVjdSWHno2bOHo6P4LoGlI=
X-Google-Smtp-Source: APXvYqzbhxneMr/wfR9+Dr0qOOgzxFNQhYy2xktIdfkxgQJAdcOyXkzxDya+EB7ogy8zVgkdw8g5+g==
X-Received: by 2002:a19:7d84:: with SMTP id y126mr7822098lfc.124.1553359161389;
	Sat, 23 Mar 2019 09:39:21 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id t28sm2760326lje.9.2019.03.23.09.39.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 23 Mar 2019 09:39:20 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Mar 2019 17:38:58 +0100
Message-Id: <20190323163858.15371-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v2] ninja: upate to 1.9.0
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
X-List-Received-Date: Sat, 23 Mar 2019 16:39:21 -0000

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


