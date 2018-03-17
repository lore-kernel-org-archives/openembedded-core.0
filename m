Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2B9F978988
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Mar 2018 03:40:48 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id i14so4847661pgv.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2018 20:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=x4NkTESie65fJotsXxejqNBT9GzO7m+dcA3yKdqS5LE=;
	b=ViauqvQp0FUwvNhBHW2wQAMi67kDYjDsnQsNWF9DQkPnv08r+Y+lGQLwkpnFaNNWZS
	5JnFzZdlO/gwrV6gWwFr4n7w3oywoL8U/UPzo7RHrwbd1tVkJ9NG1I5FRPVYE0G4YaWV
	RviN7px+jv9r89EScerI15+JtrG1M5IDtKG0VjM3lIM86bUFx2hJmG5gGencWqfvMkH1
	sTS+qCy+hF5sBgZq4owUYEq+u46h6UZArLaVosORJ2n0GDDdhJSyBLtaY8L/Ukq+CHQu
	JF3hC2FGHWzNrMZKqZMSNf3Spgz2wHDipUaW6yO1n43wIZV7N4oHoCHk1ORUbLZ1jDbo
	5qkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=x4NkTESie65fJotsXxejqNBT9GzO7m+dcA3yKdqS5LE=;
	b=YSKj/MmMLy7AxXQ0R78XiigX3GQ8fPVehMfTD3SuFohTrX+flUR+5f/vWE97j29hGr
	QvkXZl6kIWdD5ZSTJOm4rdm15Ounjo5e03Zl6hSzVlEVKB+isrB1B/5zDQP6lE1ziFK4
	QtbMitYGVw3g0ZOzHuQne0WlRcRzh1JZVdan1r39/HYbNXFtPGkClsb5lpxd7j6NLGTu
	KePhO5iKKBTCPADCy3m8EHosmv8ZAp0cE9wG7t8R93Y7JQdkq3XcilsZqXXX2egfFOhQ
	k0L+nzb9CZXhDr3yTPAmbSTTKFPubyoPU9hugur2umhnPE87u9Gm4Q5WaGibSFCm6LMP
	kD1w==
X-Gm-Message-State: AElRT7GAsJVKlJIVkXKPMnMRi+56jTC3ka98oqXXmMtmaJADOxZuosUU
	MeYTxVDibdoSQG/8+qAkfw4ofw==
X-Google-Smtp-Source: AG47ELsr4fEqZYB8WHTj6zxAdnxk4lCZhYjaKrbfUPs2xwq0g2bOuW/qLxOtZiANBDPi6g86ZUKerQ==
X-Received: by 10.101.99.66 with SMTP id p2mr3269678pgv.384.1521258050125;
	Fri, 16 Mar 2018 20:40:50 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	184sm874800pfg.124.2018.03.16.20.40.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Mar 2018 20:40:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2018 20:40:36 -0700
Message-Id: <4ba522fb958aa945019feecf16c73f001b04346f.1521257828.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <cover.1521257828.git.raj.khem@gmail.com>
References: <cover.1521257828.git.raj.khem@gmail.com>
Subject: [PATCH 5/5] dpkg: Backport riscv support
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
X-List-Received-Date: Sat, 17 Mar 2018 03:40:49 -0000

Refresh patches with devtool

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-arch-Add-support-for-riscv64-CPU.patch    | 54 ++++++++++++++++++++++
 .../dpkg/dpkg/glibc2.5-sync_file_range.patch       | 21 +++++++--
 meta/recipes-devtools/dpkg/dpkg_1.18.24.bb         |  1 +
 3 files changed, 71 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/0001-arch-Add-support-for-riscv64-CPU.patch

diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-arch-Add-support-for-riscv64-CPU.patch b/meta/recipes-devtools/dpkg/dpkg/0001-arch-Add-support-for-riscv64-CPU.patch
new file mode 100644
index 0000000000..45c606e690
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-arch-Add-support-for-riscv64-CPU.patch
@@ -0,0 +1,54 @@
+From 319f32d743f5b5e725012654d124e49226d5de91 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 16 Mar 2018 20:28:24 -0700
+Subject: [PATCH] arch: Add support for riscv64 CPU
+
+  * Architecture support:
+    - Add support for riscv64 CPU. Closes: #822914
+      Thanks to Manuel A. Fernandez Montecelo <mafm@debian.org>
+
+Upstream-Status: Backport [https://alioth.debian.org/plugins/scmgit/cgi-bin/gitweb.cgi?p=dpkg%2Fdpkg.git;a=commitdiff_plain;h=ee0855cc66076691de4796be48f8a0d889fde001;hp=2f5816d8be40b449d2473b22f9e0c33b32f3bd78]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ data/cputable         | 1 +
+ scripts/t/Dpkg_Arch.t | 4 ++--
+ 2 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/data/cputable b/data/cputable
+index a2bd7d6..9f2a8e0 100644
+--- a/data/cputable
++++ b/data/cputable
+@@ -41,6 +41,7 @@ powerpc		powerpc		(powerpc|ppc)		32	big
+ powerpcel	powerpcle	powerpcle		32	little
+ ppc64		powerpc64	(powerpc|ppc)64		64	big
+ ppc64el		powerpc64le	powerpc64le		64	little
++riscv64		riscv64		riscv64			64	little
+ s390		s390		s390			32	big
+ s390x		s390x		s390x			64	big
+ sh3		sh3		sh3			32	little
+diff --git a/scripts/t/Dpkg_Arch.t b/scripts/t/Dpkg_Arch.t
+index d478b49..ecd5d66 100644
+--- a/scripts/t/Dpkg_Arch.t
++++ b/scripts/t/Dpkg_Arch.t
+@@ -16,7 +16,7 @@
+ use strict;
+ use warnings;
+ 
+-use Test::More tests => 16367;
++use Test::More tests => 16832;
+ 
+ use_ok('Dpkg::Arch', qw(debarch_to_debtuple debarch_to_multiarch
+                         debarch_eq debarch_is debarch_is_wildcard
+@@ -162,7 +162,7 @@ is(gnutriplet_to_debarch(undef), undef, 'undef gnutriplet');
+ is(gnutriplet_to_debarch('unknown-unknown-unknown'), undef, 'unknown gnutriplet');
+ is(gnutriplet_to_debarch('x86_64-linux-gnu'), 'amd64', 'known gnutriplet');
+ 
+-is(scalar get_valid_arches(), 524, 'expected amount of known architectures');
++is(scalar get_valid_arches(), 539, 'expected amount of known architectures');
+ 
+ {
+     local $ENV{CC} = 'false';
+-- 
+2.16.2
+
diff --git a/meta/recipes-devtools/dpkg/dpkg/glibc2.5-sync_file_range.patch b/meta/recipes-devtools/dpkg/dpkg/glibc2.5-sync_file_range.patch
index d56b8a69a3..d48386647e 100644
--- a/meta/recipes-devtools/dpkg/dpkg/glibc2.5-sync_file_range.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/glibc2.5-sync_file_range.patch
@@ -1,12 +1,17 @@
+From 9d260d408f9e17abd1d1dccd685bd7e80a3655a9 Mon Sep 17 00:00:00 2001
+From: Donn Seeley <donn.seeley@windriver.com>
+Date: Tue, 25 Feb 2014 17:44:04 +0800
+Subject: [PATCH] dpkg: fix a link problem for dpkg-native on CentOS 5.8
+
 CentOS 5.8 kernels and headers support the sync_file_range() system call,
 but glibc 2.5 doesn't provide the syscall stub.  It appears that this
 problem is known but will never be fixed:
 
   https://bugzilla.redhat.com/show_bug.cgi?id=518581
 
-  Bug 518581 - [RHEL5] glibc misses sync_file_range syscall interface 
+  Bug 518581 - [RHEL5] glibc misses sync_file_range syscall interface
 
-  Status:       CLOSED CANTFIX 
+  Status:       CLOSED CANTFIX
   Last Closed:  2009-11-22 22:19:55
 
   Kirby Zhou 2009-08-20 23:37:55 EDT
@@ -60,13 +65,16 @@ Upstream-Status: Inappropriate [everyone else builds on newer hosts :-)]
 
 Signed-off-by: Donn Seeley <donn.seeley@windriver.com>
 Signed-off-by: Lei Liu <lei.liu2@windriver.com>
+
 ---
- src/archives.c |    4 ++--
+ src/archives.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
+diff --git a/src/archives.c b/src/archives.c
+index 4b2fc92..a92b795 100644
 --- a/src/archives.c
 +++ b/src/archives.c
-@@ -75,7 +75,7 @@
+@@ -69,7 +69,7 @@ fd_writeback_init(int fd)
    /* Ignore the return code as it should be considered equivalent to an
     * asynchronous hint for the kernel, we are doing an fsync() later on
     * anyway. */
@@ -75,7 +83,7 @@ Signed-off-by: Lei Liu <lei.liu2@windriver.com>
    sync_file_range(fd, 0, 0, SYNC_FILE_RANGE_WRITE);
  #elif defined(HAVE_POSIX_FADVISE)
    posix_fadvise(fd, 0, 0, POSIX_FADV_DONTNEED);
-@@ -1179,7 +1179,7 @@
+@@ -1078,7 +1078,7 @@ tarobject(void *ctx, struct tar_entry *ti)
    return 0;
  }
  
@@ -84,3 +92,6 @@ Signed-off-by: Lei Liu <lei.liu2@windriver.com>
  static void
  tar_writeback_barrier(struct fileinlist *files, struct pkginfo *pkg)
  {
+-- 
+2.16.2
+
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.18.24.bb b/meta/recipes-devtools/dpkg/dpkg_1.18.24.bb
index c0c59f1410..6d8ec34768 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.18.24.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.18.24.bb
@@ -14,6 +14,7 @@ SRC_URI = "http://snapshot.debian.org/archive/debian/20170518T093838Z/pool/main/
            file://0006-add-musleabi-to-known-target-tripets.patch \
            file://0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch \
            file://0001-dpkg-Support-muslx32-build.patch \
+           file://0001-arch-Add-support-for-riscv64-CPU.patch \
            "
 SRC_URI_append_class-native = " file://glibc2.5-sync_file_range.patch "
 
-- 
2.16.2


