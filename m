Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4F61F6179B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 22:45:37 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id i19so2039967pfa.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 14:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=a4HjstclgxPCV06v0Wa6UKgLj46YKMujTuEJXpN/CJY=;
	b=SRaiJPJKoGbJr+JiiHe58tQgZkz7EHrjVFj45sLxITsit8XbDo3FbHx3hsqV1rwp0H
	nHqfmdm2F/6ntRqJ8va7zE90ehMtfI/lkxhTawtBOphPOGCFawrc5LDPxJRKzdYqa5NE
	c4DYqs9erC3/+iWY0s7wpo1lZ/Ydi2bk0BTlAuu4RpK1pfMJgAn3Gkz8fzeOTDXyn0At
	gY2mjoMbeyShyfabDT4VQGlWz5+GHMDHtwmo7SL7O1zCnGKZhQgTBmluITCQt03ZkP/j
	Y408SUmjoY6IOqDQv7t6gWcyjzTpsZFcY4Rh8YrwfFRpjQ2/AVQ/+U8HHcKSyee9WmQ/
	tqZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=a4HjstclgxPCV06v0Wa6UKgLj46YKMujTuEJXpN/CJY=;
	b=N8QQOJduTRYOBkFjGZdOP/gzVOnJ2zJzBQ1LSfKYJ4Tdi5/zO8ccNm64dEMMw5vj80
	657TcoBKuuS4FxE/QMrng3iHwwZmk8IX0U6oC7UUp0ocHg/kncNNPlytfno/L9nXu107
	n+iM21gl1eAbmf9fkeldcqk//TrtzJEA7XLWdoEYZpZLWqOYGdg0ofhsVXLOXRLsRFbc
	tl/b8VVxxS93T2GX3nicFDzTq1Gc268O6ZiQ6KS4D5DVt3JcUSciPBJE3kRy7LCuCkHA
	ydGcVjbOl1eMmFQb8V7LNiUZHzp+i431sWa6fkJ5zNISD4gGSUlDjR59i3E91qfJL+wr
	4UWQ==
X-Gm-Message-State: APjAAAU9gaw1yiGqmYN8M0bw18zcvr9CLIOvzKwlOB/iH95JNSB3AO23
	ISpnhzRgrf9IffSItGIbuBEFtZGVawM=
X-Google-Smtp-Source: APXvYqyG7bFi5P6AXkLw7z/Uog5RR2IbEWN9whtfc+awk8ryBQJtyfGLVdX6LjCA+XISqauq3ykgmQ==
X-Received: by 2002:a62:33c6:: with SMTP id
	z189mr39938159pfz.246.1582325137500; 
	Fri, 21 Feb 2020 14:45:37 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::396c])
	by smtp.gmail.com with ESMTPSA id
	m12sm3830284pfh.37.2020.02.21.14.45.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 21 Feb 2020 14:45:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Feb 2020 14:45:35 -0800
Message-Id: <20200221224537.4052134-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200221224537.4052134-1-raj.khem@gmail.com>
References: <20200221224537.4052134-1-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: Upgrade Helper <auh@auh.yoctoproject.org>
Subject: [PATCH 2/4] ninja: upgrade 1.9.0 -> 1.10.0
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
X-List-Received-Date: Fri, 21 Feb 2020 22:45:37 -0000
Content-Transfer-Encoding: 8bit

From: Upgrade Helper <auh@auh.yoctoproject.org>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ninja/ninja/fix-musl.patch                | 46 -------------------
 .../ninja/{ninja_1.9.0.bb => ninja_1.10.0.bb} |  6 +--
 2 files changed, 2 insertions(+), 50 deletions(-)
 delete mode 100644 meta/recipes-devtools/ninja/ninja/fix-musl.patch
 rename meta/recipes-devtools/ninja/{ninja_1.9.0.bb => ninja_1.10.0.bb} (87%)

diff --git a/meta/recipes-devtools/ninja/ninja/fix-musl.patch b/meta/recipes-devtools/ninja/ninja/fix-musl.patch
deleted file mode 100644
index 7fd779110d..0000000000
--- a/meta/recipes-devtools/ninja/ninja/fix-musl.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From e92a915183f8bff268f74c8cd00d986301a2bbf8 Mon Sep 17 00:00:00 2001
-From: makepost <makepost@firemail.cc>
-Date: Mon, 24 Dec 2018 03:13:16 +0200
-Subject: [PATCH] Use st_mtim if st_mtime is macro, fix #1510
-
-In POSIX.1-2008, sys_stat has a st_mtim member and a st_mtime backward
-compatibility macro. Should help avoid hardcoding platform detection.
-
-Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
-
-Upstream-Status: Pending
----
- src/disk_interface.cc | 14 ++++----------
- 1 file changed, 4 insertions(+), 10 deletions(-)
-
-diff --git a/src/disk_interface.cc b/src/disk_interface.cc
-index d4c2fb0..dc297c4 100644
---- a/src/disk_interface.cc
-+++ b/src/disk_interface.cc
-@@ -202,19 +202,13 @@ TimeStamp RealDiskInterface::Stat(const string& path, string* err) const {
-   // that it doesn't exist.
-   if (st.st_mtime == 0)
-     return 1;
--#if defined(__APPLE__) && !defined(_POSIX_C_SOURCE)
-+#if defined(_AIX)
-+  return (int64_t)st.st_mtime * 1000000000LL + st.st_mtime_n;
-+#elif defined(__APPLE__)
-   return ((int64_t)st.st_mtimespec.tv_sec * 1000000000LL +
-           st.st_mtimespec.tv_nsec);
--#elif (_POSIX_C_SOURCE >= 200809L || _XOPEN_SOURCE >= 700 || defined(_BSD_SOURCE) || defined(_SVID_SOURCE) || \
--       defined(__BIONIC__) || (defined (__SVR4) && defined (__sun)) || defined(__FreeBSD__))
--  // For glibc, see "Timestamp files" in the Notes of http://www.kernel.org/doc/man-pages/online/pages/man2/stat.2.html
--  // newlib, uClibc and musl follow the kernel (or Cygwin) headers and define the right macro values above.
--  // For bsd, see https://github.com/freebsd/freebsd/blob/master/sys/sys/stat.h and similar
--  // For bionic, C and POSIX API is always enabled.
--  // For solaris, see https://docs.oracle.com/cd/E88353_01/html/E37841/stat-2.html.
-+#elif defined(st_mtime) // A macro, so we're likely on modern POSIX.
-   return (int64_t)st.st_mtim.tv_sec * 1000000000LL + st.st_mtim.tv_nsec;
--#elif defined(_AIX)
--  return (int64_t)st.st_mtime * 1000000000LL + st.st_mtime_n;
- #else
-   return (int64_t)st.st_mtime * 1000000000LL + st.st_mtimensec;
- #endif
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/ninja/ninja_1.9.0.bb b/meta/recipes-devtools/ninja/ninja_1.10.0.bb
similarity index 87%
rename from meta/recipes-devtools/ninja/ninja_1.9.0.bb
rename to meta/recipes-devtools/ninja/ninja_1.10.0.bb
index f1236e8ac8..bdc6365052 100644
--- a/meta/recipes-devtools/ninja/ninja_1.9.0.bb
+++ b/meta/recipes-devtools/ninja/ninja_1.10.0.bb
@@ -5,11 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a81586a64ad4e476c791cda7e2f2c52e"
 
 DEPENDS = "re2c-native ninja-native"
 
-SRCREV = "b25c08bda4949192c69cea4cee057887341a2ffc"
+SRCREV = "ed7f67040b370189d989adbd60ff8ea29957231f"
 
-SRC_URI = "git://github.com/ninja-build/ninja.git;branch=release \
-           file://fix-musl.patch \
-"
+SRC_URI = "git://github.com/ninja-build/ninja.git;branch=release"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


