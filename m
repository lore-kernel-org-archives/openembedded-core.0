Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id AE4A26FFA4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Mar 2016 14:29:56 +0000 (UTC)
Received: by mail-qg0-f48.google.com with SMTP id w104so121074524qge.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Mar 2016 06:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=fylmZqhBUZ3B5qNPfZUl26a9iEBqOzqkbfPhyBlg82k=;
	b=XPsRYfwyP8B8Koxd7mO+3iLUsYYCib1mVcC8HdoqCVo9DAO1GeDD7E285/u6MdoW13
	PL9iu520CDRE49X4p+uoTCkukdR2zR/KSOwbrhA8p/tAInImGKg2wPRMmQ1+uBMdtMzc
	sz6THEeBxlbC2MDbeFr9VKPVUegcoCJHX57fqXpQFsgxVdVch52lNFGiEf5mBcHdjDul
	BwNmAYmzxki+LOAYSljHfGIfC20teNpvfuj/X1BqcjX+y86Zvg2Ka8sPBM5QnDJcGOca
	7leP4wccNQnWohbtrgPF9+Jni737gH99aA6vGQDtvUcWYA5lylCsrhdzbQ/aoaS0Q5mP
	PtyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fylmZqhBUZ3B5qNPfZUl26a9iEBqOzqkbfPhyBlg82k=;
	b=bp8Tym17Af7qFwfxKkbTEDp8fDQds2JNATEci4gGJeeQNk0oVR1DJwJ/A3aa7G71XZ
	SW6Wg6l7kFbOKPg1SxpfVrG6sHIVGLOXP1x+Pqw6G/HaVy9GBvI6m4l4aq9srdQ/c2q6
	nvo5gERyjo1AMWwTTISuECwDtzHGcCOdO+1QlAMgo1GpvJR5U44sgmBSVY6gzUmDgcph
	SUZFrkTDUGDoEYJ/VjB/V/WfQn2lMM3ovvBjFguU2jY4SXQmPgBYY88QaESq4MJeO96x
	moZMU4p4Oq257UdIG9EkEr5WD64tbNOHZhfCQK6W2YJNW6CRxPS/btaVFc+c4v3S6b8s
	XL+Q==
X-Gm-Message-State: AD7BkJLSSMF0WythRy0PQjYqb+vjq5T6LKcnfcwtHvzl2Sk/D/v8y5/EbGhu1x2SrHzNbQ==
X-Received: by 10.140.142.17 with SMTP id 17mr19763197qho.77.1457792997361;
	Sat, 12 Mar 2016 06:29:57 -0800 (PST)
Received: from eos.sys.comcast.net (a-96-118-179-133.sys.comcast.net.
	[96.118.179.133])
	by smtp.gmail.com with ESMTPSA id e79sm6250717qkj.2.2016.03.12.06.29.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 12 Mar 2016 06:29:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 12 Mar 2016 14:29:48 +0000
Message-Id: <1457792988-10081-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH V3] busybox: Drop -r passthrough patch
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
X-List-Received-Date: Sat, 12 Mar 2016 14:29:59 -0000

This was added to help clang compile busybox but since then
the option has been added to llvm and now we have upgraded clang
to 3.8 which has this option available

Fix git recipe to build with mdev feature and update to tip when here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../busybox/0002-Passthrough-r-to-linker.patch     | 32 ----------------------
 meta/recipes-core/busybox/busybox_1.24.1.bb        |  1 -
 meta/recipes-core/busybox/busybox_git.bb           |  9 ++++--
 3 files changed, 7 insertions(+), 35 deletions(-)
 delete mode 100644 meta/recipes-core/busybox/busybox/0002-Passthrough-r-to-linker.patch

diff --git a/meta/recipes-core/busybox/busybox/0002-Passthrough-r-to-linker.patch b/meta/recipes-core/busybox/busybox/0002-Passthrough-r-to-linker.patch
deleted file mode 100644
index de286fb..0000000
--- a/meta/recipes-core/busybox/busybox/0002-Passthrough-r-to-linker.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From df2cc76cdebc4773361477f3db203790f6986e3b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 22 Aug 2015 23:42:40 -0700
-Subject: [PATCH 2/2] Passthrough -r to linker
-
-clang does not have -r switch and it does not pass it down to linker
-either, LDFLAGS_RELOCATABLE is used when CC is used for LD, so this
-should not cause side effects
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 9da02cb..10dd4a9 100644
---- a/Makefile
-+++ b/Makefile
-@@ -309,7 +309,7 @@ CHECKFLAGS     := -D__linux__ -Dlinux -D__STDC__ -Dunix -D__unix__ -Wbitwise $(C
- MODFLAGS	= -DMODULE
- CFLAGS_MODULE   = $(MODFLAGS)
- AFLAGS_MODULE   = $(MODFLAGS)
--LDFLAGS_RELOCATABLE = -r -nostdlib
-+LDFLAGS_RELOCATABLE = -Xlinker -r -nostdlib
- LDFLAGS_MODULE  = $(LDFLAGS_RELOCATABLE)
- CFLAGS_KERNEL	=
- AFLAGS_KERNEL	=
--- 
-2.1.4
-
diff --git a/meta/recipes-core/busybox/busybox_1.24.1.bb b/meta/recipes-core/busybox/busybox_1.24.1.bb
index 174ca47..bdaa5a5 100644
--- a/meta/recipes-core/busybox/busybox_1.24.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.24.1.bb
@@ -29,7 +29,6 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://recognize_connmand.patch \
            file://busybox-cross-menuconfig.patch \
            file://0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch \
-           file://0002-Passthrough-r-to-linker.patch \
            file://busybox-1.24.1-unzip.patch \
            file://busybox-1.24.1-unzip-regression.patch \
            file://busybox-1.24.1-truncate-open-mode.patch \
diff --git a/meta/recipes-core/busybox/busybox_git.bb b/meta/recipes-core/busybox/busybox_git.bb
index ae16b59..c29b894 100644
--- a/meta/recipes-core/busybox/busybox_git.bb
+++ b/meta/recipes-core/busybox/busybox_git.bb
@@ -1,6 +1,6 @@
 require busybox.inc
 
-SRCREV = "966423d4034067f52b419570a1016d1dfc4aeacd"
+SRCREV = "1b7c17391de66502dd7a97c866e0a33681edbb1f"
 # Lookout for PV bump too when SRCREV is changed
 PV = "1.25.0+git${SRCPV}"
 
@@ -35,12 +35,17 @@ SRC_URI = "git://busybox.net/busybox.git \
            file://recognize_connmand.patch \
            file://busybox-cross-menuconfig.patch \
            file://0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch \
-           file://0002-Passthrough-r-to-linker.patch \
            file://mount-via-label.cfg \
            file://sha1sum.cfg \
            file://sha256sum.cfg \
            file://getopts.cfg \
            file://resize.cfg \
+           ${@["", "file://init.cfg"][(d.getVar('VIRTUAL-RUNTIME_init_manager', True) == 'busybox')]} \
+           ${@["", "file://mdev.cfg"][(d.getVar('VIRTUAL-RUNTIME_dev_manager', True) == 'busybox-mdev')]} \
+           file://inittab \
+           file://rcS \
+           file://rcK \
+           file://runlevel \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-- 
1.9.1


