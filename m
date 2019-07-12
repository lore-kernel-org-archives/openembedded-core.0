Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3277A7F0D4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 19:37:32 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id m23so10366496lje.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 12:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=N9H/tojS4PY7mmyxGDgGgxtmuz3vVxBaHg8t3KOVdi0=;
	b=fioqAvOJZuyORWlU1o4V1hDbhwxQgF7H07+v+MnGoYPH8/sABhvmEM4+unkCdAg03C
	FCGOMVEOAB3Sene8f0Syssdyjtv6d9fFNB6KaM1AL7j20C+lutPeh+BQPD5uDNshjwUp
	9noUjtGWj29ID9rhF6JsuWzqIo6xc5aRMUERAbEN1JKdiAgtDBMHfDqu/1CSJgye95dI
	lTp9a+nbna6IPQ9jcHe78DqnQOULfznUtqB/NGVA/0/VMUiVzGt96vh5U5QfYgbDhWtm
	UV3pvXiYZVNbxyBhpgfcqMGNBL5OKmllATGhRRlZ2lj9UDBs7mDF5m2sYsBv65kwfa9u
	o1Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=N9H/tojS4PY7mmyxGDgGgxtmuz3vVxBaHg8t3KOVdi0=;
	b=QydwMHVfpfJ9xTQlWfFZ/dEDBXJeb18W2j4QKXAG800VjGTiwR/8boLPSr3vXnt54M
	JHs8/baCZp9JzdwNNLBIrxnuU02VZieuBRDFbcy6WVyvMgr3Z5JlexaKCNd9hZeXHn2K
	TR6oCVuGFWOqUs3JwaNLcpcaCJW/UHKZEFetw5TRQK1Z4qA0KCEq4eD4s9Klfjt3fQHo
	M3OzLPnGo9m/W3rPLam20ktGVNBKTyBM6a2ajMgV3AQ/aKJkOwz+HCgTBaUW27XcjT/R
	4pJJkRbob0oqy7lOlPctdXbQE+1SWk5R9fE2YzS+YajnVkLL/hHWgVHcSYIzrFp0gCD7
	OrAg==
X-Gm-Message-State: APjAAAV+/WMdoQl+H9kexmEsRzL2Vp7El4x1c5OkMrGSc2G/qx5H5Ud/
	14BLkO84FdH4FXjHQvLHzjJNqL69
X-Google-Smtp-Source: APXvYqxMzupAF9OFZD8ggdwDTZyKjYcLDD5XQ45YBvDm2YjfmYbWdDyxfc3tmwNMSTvKaqSnjss50A==
X-Received: by 2002:a2e:3807:: with SMTP id f7mr6707704lja.87.1562960252562;
	Fri, 12 Jul 2019 12:37:32 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	n124sm1222742lfd.46.2019.07.12.12.37.31
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 12 Jul 2019 12:37:31 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Jul 2019 21:37:26 +0200
Message-Id: <20190712193726.22793-1-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Subject: [PATCH] libpciaccess: update to 0.15
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
X-List-Received-Date: Fri, 12 Jul 2019 19:37:33 -0000

Removed patch was upstreamed.

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
---
 .../0004-Don-t-include-sys-io.h-on-arm.patch  | 28 -------------------
 ...pciaccess_0.14.bb => libpciaccess_0.15.bb} |  8 ++----
 2 files changed, 2 insertions(+), 34 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libpciaccess/0004-Don-t-include-sys-io.h-on-arm.patch
 rename meta/recipes-graphics/xorg-lib/{libpciaccess_0.14.bb => libpciaccess_0.15.bb} (62%)

diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess/0004-Don-t-include-sys-io.h-on-arm.patch b/meta/recipes-graphics/xorg-lib/libpciaccess/0004-Don-t-include-sys-io.h-on-arm.patch
deleted file mode 100644
index f532858244..0000000000
--- a/meta/recipes-graphics/xorg-lib/libpciaccess/0004-Don-t-include-sys-io.h-on-arm.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From b6df5202306bd71158b482f25ca2e6919645d4dd Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 4 Jun 2015 20:55:06 -0700
-Subject: [PATCH 4/4] Don't include sys/io.h on arm
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- src/linux_sysfs.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/linux_sysfs.c b/src/linux_sysfs.c
-index 3f95e53..1e3aad3 100644
---- a/src/linux_sysfs.c
-+++ b/src/linux_sysfs.c
-@@ -50,7 +50,7 @@
- #include <dirent.h>
- #include <errno.h>
- 
--#if defined(__i386__) || defined(__x86_64__) || defined(__arm__)
-+#if defined(__i386__) || defined(__x86_64__)
- #include <sys/io.h>
- #else
- #define inb(x) -1
--- 
-2.1.4
-
diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess_0.14.bb b/meta/recipes-graphics/xorg-lib/libpciaccess_0.15.bb
similarity index 62%
rename from meta/recipes-graphics/xorg-lib/libpciaccess_0.14.bb
rename to meta/recipes-graphics/xorg-lib/libpciaccess_0.15.bb
index d030c31bd0..16393ac3bb 100644
--- a/meta/recipes-graphics/xorg-lib/libpciaccess_0.14.bb
+++ b/meta/recipes-graphics/xorg-lib/libpciaccess_0.15.bb
@@ -5,12 +5,8 @@ PCI bus and devices in a platform-independent way."
 
 require xorg-lib-common.inc
 
-SRC_URI += "\
-            file://0004-Don-t-include-sys-io.h-on-arm.patch \
-"
-
-SRC_URI[md5sum] = "8f436e151d5106a9cfaa71857a066d33"
-SRC_URI[sha256sum] = "3df543e12afd41fea8eac817e48cbfde5aed8817b81670a4e9e493bb2f5bf2a4"
+SRC_URI[md5sum] = "843e92d0eef94684a4eb9a2d311bfb12"
+SRC_URI[sha256sum] = "a75643bb5cd02f6da8667d437b76492842dd56bc88e3dfb8410f5d535b99f5dc"
 
 LICENSE = "MIT & MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=277aada5222b9a22fbf3471ff3687068"
-- 
2.17.1


