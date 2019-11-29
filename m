Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id 024597FC7B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2019 13:12:25 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id p17so9133644wma.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2019 05:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Fhfmb3036Atu28VSAfMRWhcyulSrnoDEjbXcnnGahW0=;
	b=lEtnWuWu/2HGpIw43ERLwtj84t+7Nz40+NDfi1wdJmuoBVgKrd20M6mZ5BAN2bpBoI
	HgLXDVpo7/+qN7G4Rw4jz9uglQ8DY37mszSaKFdxLGgJYTe7xD4EpmTgyCEOb5wX4Iei
	o1XJ1j0BJLKVHa5mn4yCvOjJ6oef04/gkqQqeVcplk3ojVkwXMltYce3Yy3HdrRmMUwh
	rMNPqvbvIw2Yxur8zEUE+xzRDqq1vXUzIXV9BNuzw/9DcjGYnnokhhwA4+I9TkkIsdp9
	QN92cmEyacqDCNfhW/EhLsL47BzpMY3sV/A64nsKyfGQ01MpRw7F2vBZW3Mw3FAUMwal
	y5lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Fhfmb3036Atu28VSAfMRWhcyulSrnoDEjbXcnnGahW0=;
	b=CqayStaErjyOSIxT/lykKxjkeNFKy6DQUT7twfOfETj4ji3y1O9THTBTAYypd85I6l
	LSpDTzhgaCbVabnPq/7/8witctdPUf0/sV5UeKK/jQOTQDaHmFMjYkCRry5GNnYu58qa
	d5BUcejeaOkmOfCSe65rJ29VGsTHVY9ijHRJKTxVCruZg3DQxRx1drNC1KFp1bDUMJyJ
	1teeotyyGmbp/+dLlYHXixVn8n6/WmFfrMiMIV7ag3oG8u9+4Ygx1nFwCLDhR6JTNiql
	udd32QwlMPjl9Jx+HILVp6VL/9caMO5ZgffxPyuJePMAvh/q10qGR8CbkAry8Hi3XczO
	VWqQ==
X-Gm-Message-State: APjAAAVV4F74prHv1z6v54/rRNsAnKIlTI16S8AaGLQ8rHbM2gD5bNho
	DxyXe5v65pKppbY3owzHqzeFz/9h
X-Google-Smtp-Source: APXvYqxIpfMMDULQojfTuAAR6JIBtEqWoxNM+JZ1/1acmM/FLsnlY8x9MAk6ll2Hld5bTKLHnafhSA==
X-Received: by 2002:a7b:c255:: with SMTP id b21mr15337919wmj.39.1575033145765; 
	Fri, 29 Nov 2019 05:12:25 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id v17sm637224wrt.91.2019.11.29.05.12.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 29 Nov 2019 05:12:24 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Nov 2019 14:11:50 +0100
Message-Id: <20191129131152.128311-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191129131152.128311-1-alex.kanavin@gmail.com>
References: <20191129131152.128311-1-alex.kanavin@gmail.com>
Subject: [PATCH 13/15] libffi: update to 3.3 final
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
X-List-Received-Date: Fri, 29 Nov 2019 13:12:26 -0000

License-Update: copyright years
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ixed-missed-ifndef-for-__mips_soft_float.patch |  8 ++------
 .../recipes-support/libffi/libffi/not-win32.patch | 15 +++++++++++++--
 .../libffi/{libffi_3.3~rc0.bb => libffi_3.3.bb}   | 11 ++++-------
 3 files changed, 19 insertions(+), 15 deletions(-)
 rename meta/recipes-support/libffi/{libffi_3.3~rc0.bb => libffi_3.3.bb} (78%)

diff --git a/meta/recipes-support/libffi/libffi/0001-Fixed-missed-ifndef-for-__mips_soft_float.patch b/meta/recipes-support/libffi/libffi/0001-Fixed-missed-ifndef-for-__mips_soft_float.patch
index 00a30a35545..397194bc930 100644
--- a/meta/recipes-support/libffi/libffi/0001-Fixed-missed-ifndef-for-__mips_soft_float.patch
+++ b/meta/recipes-support/libffi/libffi/0001-Fixed-missed-ifndef-for-__mips_soft_float.patch
@@ -1,12 +1,11 @@
-From 4149a7627a998731cc246d3f58a36808745d04c8 Mon Sep 17 00:00:00 2001
+From 14e2e74682db3bfcf057688f738fdd842a02ff2d Mon Sep 17 00:00:00 2001
 From: Carl Hurd <carl@Carls-MacBook-Pro.local>
 Date: Wed, 18 Jul 2018 09:04:32 -0400
 Subject: [PATCH] Fixed missed #ifndef for __mips_soft_float
 
 Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
----
 Upstream-Status: Submitted [https://github.com/libffi/libffi/pull/442]
-
+---
  src/mips/o32.S | 2 ++
  1 file changed, 2 insertions(+)
 
@@ -26,6 +25,3 @@ index 44e74cb..799139b 100644
  1:
  	# prepare arguments for ffi_closure_mips_inner_O32
  	REG_L	a0, 4($15)	 # cif 
--- 
-2.21.0
-
diff --git a/meta/recipes-support/libffi/libffi/not-win32.patch b/meta/recipes-support/libffi/libffi/not-win32.patch
index 86a7fc9e405..62daaf4b389 100644
--- a/meta/recipes-support/libffi/libffi/not-win32.patch
+++ b/meta/recipes-support/libffi/libffi/not-win32.patch
@@ -1,3 +1,8 @@
+From 306719369a0d3608b4ff2737de74ae284788a14b Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Thu, 4 Feb 2016 16:22:50 +0000
+Subject: [PATCH] libffi: ensure sysroot paths are not in libffi.pc
+
 libffi's configure assumes that cross-compiled builds are complicated and
 introduces convoluted path manipulation involving gcc search paths to the
 install paths, resulting in paths like -L/usr/lib/../lib/ appearing in
@@ -11,9 +16,15 @@ As this block is generally pointless, disable it.
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index b764368..d51ce91 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -350,7 +350,7 @@ AC_ARG_ENABLE(multi-os-directory,
+@@ -354,7 +354,7 @@ AC_ARG_ENABLE(multi-os-directory,
                            
  # These variables are only ever used when we cross-build to X86_WIN32.
  # And we only support this with GCC, so...
@@ -21,4 +32,4 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
 +if false; then
    if test -n "$with_cross_host" &&
       test x"$with_cross_host" != x"no"; then
-     toolexecdir="${exec_prefix}"/'$(target_alias)'
+     toolexecdir='${exec_prefix}'/'$(target_alias)'
diff --git a/meta/recipes-support/libffi/libffi_3.3~rc0.bb b/meta/recipes-support/libffi/libffi_3.3.bb
similarity index 78%
rename from meta/recipes-support/libffi/libffi_3.3~rc0.bb
rename to meta/recipes-support/libffi/libffi_3.3.bb
index 8acb699d4ab..f97d49ce1fa 100644
--- a/meta/recipes-support/libffi/libffi_3.3~rc0.bb
+++ b/meta/recipes-support/libffi/libffi_3.3.bb
@@ -8,24 +8,21 @@ library really only provides the lowest, machine dependent layer of a fully feat
 A layer must exist above `libffi' that handles type conversions for values passed between the two languages."
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3610bb17683a0089ed64055416b2ae1b"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=492385fe22195952f5b9b197868ba268"
 
-SRC_URI = "https://github.com/libffi/libffi/releases/download/v3.3-rc0/libffi-3.3-rc0.tar.gz \
+SRC_URI = "https://github.com/libffi/libffi/releases/download/v${PV}/${BPN}-${PV}.tar.gz \
            file://not-win32.patch \
            file://0001-Fixed-missed-ifndef-for-__mips_soft_float.patch \
            "
-SRC_URI[md5sum] = "8d2a82a78faf10a5e53c27d986e8f04e"
-SRC_URI[sha256sum] = "403d67aabf1c05157855ea2b1d9950263fb6316536c8c333f5b9ab1eb2f20ecf"
+SRC_URI[md5sum] = "6313289e32f1d38a9df4770b014a2ca7"
+SRC_URI[sha256sum] = "72fba7922703ddfa7a028d513ac15a85c8d54c8d67f55fa5a4802885dc652056"
 UPSTREAM_CHECK_URI = "https://github.com/libffi/libffi/releases/"
 UPSTREAM_CHECK_REGEX = "libffi-(?P<pver>\d+(\.\d+)+)\.tar"
-UPSTREAM_VERSION_UNKNOWN = "1"
 
 EXTRA_OECONF += "--disable-builddir"
 EXTRA_OEMAKE_class-target = "LIBTOOLFLAGS='--tag=CC'"
 inherit autotools texinfo multilib_header
 
-S = "${WORKDIR}/${BPN}-3.3-rc0"
-
 do_install_append() {
 	oe_multilib_header ffi.h
 }
-- 
2.17.1


