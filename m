Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 99B8561794
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 22:45:38 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id a14so1332609pgb.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 14:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=KdX9YfM543mA3DfdqjPVyBifqYGEGEqKtizJXkC6vz8=;
	b=ilfjBRJKpJGbAopIzoF/DIVt7z0BPaugvTe1LRKdfxD+gY8/8oCyuYb6gxaSHZub4R
	O4YcUZ0qyRRRCJczqXaoKvdGN19i0mmQI2KEfijknin2G5XMpbc/2kC3juP0Lg1C+F99
	9hus2VQ/v/Im4Ddq+kU86lBlEwEEGVPLA0PEbvhRhbUCBHj12tNGH49dQpi/5NuXOE1J
	NW7wZ+pDgWs/hgfVIVHPb1MdXkKele5LwkakXgOuL3UhZDWuCCN2nHL4hva5t2XUWahr
	VdQfjTL3i31uIR5FK6noQLYZ4CMFv/jhN73w51OXtXpR5d44QOmffM060K1SfOpBhEaW
	vUIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=KdX9YfM543mA3DfdqjPVyBifqYGEGEqKtizJXkC6vz8=;
	b=kIZVfUDbPeYZcf9nUf23X1Gcu4005yza1XIpQ8Cz+ufuQtJPAiMb57KbFIkQUMT6qj
	CeU9qysBZ9bkDBvIZANv5xZ3RK8N2lWbXsQcFtHu7zYm5rbQgL8T7QGEya+A397394Wo
	0sMSxk+zatK2a4HXsmdoRUBLa3wW7LplizmZqnmytyP+mCdHa3k3pPVSc1/U0VYCcNC6
	kRlRyoAzSPrQrIifAvGaZCL6Vhd77H44XoQoFWQzH6NrwcFMdVO8d7VReiZ9GzbTeeQo
	8mLuBuv1aIJjSWGHc/C6Tih/9mYKk5VPeeI4JnGziMy9CCNQKDOLEwwCSJCcmqGBzp7E
	1iyQ==
X-Gm-Message-State: APjAAAVG8FF2peb9BXVnBHWtznMwRbsaszva8WDLwVj5PhKGLXUGJf3r
	L35mdPXbGqGvJPUJjDURBy5cm4Jj5cM=
X-Google-Smtp-Source: APXvYqzPiGkSlSLJjmWx/n7UJSj8xKICeeqYIjCywSZ+YZMzUp5vERlrFKzByimVXX2XpH/GQ147+Q==
X-Received: by 2002:aa7:8717:: with SMTP id b23mr40171648pfo.53.1582325139335; 
	Fri, 21 Feb 2020 14:45:39 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::396c])
	by smtp.gmail.com with ESMTPSA id
	m12sm3830284pfh.37.2020.02.21.14.45.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 21 Feb 2020 14:45:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Feb 2020 14:45:37 -0800
Message-Id: <20200221224537.4052134-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200221224537.4052134-1-raj.khem@gmail.com>
References: <20200221224537.4052134-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] gmp: Upgrade to 6.2.0
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
X-List-Received-Date: Fri, 21 Feb 2020 22:45:39 -0000
Content-Transfer-Encoding: 8bit

Drop amd64 patch, the bsfq has been replaced with bsfl for count_trailing_zeros
Forward port rest of patches to 6.2.0

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/gmp/gmp-6.1.2/amd64.patch | 18 ------------------
 ...-provided-flags-to-the-auto-detected-.patch |  0
 ...c-Believe-the-cflags-from-environment.patch | 16 ++++++++--------
 .../{gmp-6.1.2 => gmp}/use-includedir.patch    |  3 +++
 .../gmp/{gmp_6.1.2.bb => gmp_6.2.0.bb}         |  5 ++---
 5 files changed, 13 insertions(+), 29 deletions(-)
 delete mode 100644 meta/recipes-support/gmp/gmp-6.1.2/amd64.patch
 rename meta/recipes-support/gmp/{gmp-6.1.2 => gmp}/0001-Append-the-user-provided-flags-to-the-auto-detected-.patch (100%)
 rename meta/recipes-support/gmp/{gmp-6.1.2 => gmp}/0001-confiure.ac-Believe-the-cflags-from-environment.patch (80%)
 rename meta/recipes-support/gmp/{gmp-6.1.2 => gmp}/use-includedir.patch (83%)
 rename meta/recipes-support/gmp/{gmp_6.1.2.bb => gmp_6.2.0.bb} (86%)

diff --git a/meta/recipes-support/gmp/gmp-6.1.2/amd64.patch b/meta/recipes-support/gmp/gmp-6.1.2/amd64.patch
deleted file mode 100644
index 3935589f8b..0000000000
--- a/meta/recipes-support/gmp/gmp-6.1.2/amd64.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Upstream-Status: Pending
-
-Index: gmp-6.1.2/longlong.h
-===================================================================
---- gmp-6.1.2.orig/longlong.h
-+++ gmp-6.1.2/longlong.h
-@@ -1036,8 +1036,10 @@ extern UWtype __MPN(udiv_qrnnd) (UWtype
-    count is only an int. */
- #define count_trailing_zeros(count, x)					\
-   do {									\
-+    UDItype __cbtmp;							\
-     ASSERT ((x) != 0);							\
--    __asm__ ("bsfq %1,%q0" : "=r" (count) : "rm" ((UDItype)(x)));	\
-+    __asm__ ("bsfq %1,%0" : "=r" (__cbtmp) : "rm" ((UDItype)(x)));	\
-+    (count) = __cbtmp;							\
-   } while (0)
- #endif /* __amd64__ */
- 
diff --git a/meta/recipes-support/gmp/gmp-6.1.2/0001-Append-the-user-provided-flags-to-the-auto-detected-.patch b/meta/recipes-support/gmp/gmp/0001-Append-the-user-provided-flags-to-the-auto-detected-.patch
similarity index 100%
rename from meta/recipes-support/gmp/gmp-6.1.2/0001-Append-the-user-provided-flags-to-the-auto-detected-.patch
rename to meta/recipes-support/gmp/gmp/0001-Append-the-user-provided-flags-to-the-auto-detected-.patch
diff --git a/meta/recipes-support/gmp/gmp-6.1.2/0001-confiure.ac-Believe-the-cflags-from-environment.patch b/meta/recipes-support/gmp/gmp/0001-confiure.ac-Believe-the-cflags-from-environment.patch
similarity index 80%
rename from meta/recipes-support/gmp/gmp-6.1.2/0001-confiure.ac-Believe-the-cflags-from-environment.patch
rename to meta/recipes-support/gmp/gmp/0001-confiure.ac-Believe-the-cflags-from-environment.patch
index 1e47924ccc..56564db505 100644
--- a/meta/recipes-support/gmp/gmp-6.1.2/0001-confiure.ac-Believe-the-cflags-from-environment.patch
+++ b/meta/recipes-support/gmp/gmp/0001-confiure.ac-Believe-the-cflags-from-environment.patch
@@ -18,13 +18,11 @@ Upstream-Status: Inappropriate[OE-Specific]
  configure.ac | 11 -----------
  1 file changed, 11 deletions(-)
 
-Index: gmp-6.1.2/configure.ac
-===================================================================
---- gmp-6.1.2.orig/configure.ac
-+++ gmp-6.1.2/configure.ac
-@@ -604,15 +604,6 @@ case $host in
-     any_32_testlist="sizeof-long-4"
-     any_64_testlist="sizeof-long-8"
+--- a/configure.ac
++++ b/configure.ac
+@@ -625,17 +625,6 @@ case $host in
+     any_32_testlist="sizeof-void*-4"
+     any_64_testlist="sizeof-void*-8"
  
 -    # This is needed for clang, which is not content with flags like -mfpu=neon
 -    # alone.
@@ -33,12 +31,14 @@ Index: gmp-6.1.2/configure.ac
 -        gcc_cflags_fpmode="-mfloat-abi=softfp" ;;
 -      *-*-*eabihf)
 -        gcc_cflags_fpmode="-mfloat-abi=hard" ;;
+-      *-*-mingw*)
+-        limb_64=longlong ;;
 -    esac
 -
      # FIXME: We make mandatory compiler options optional here.  We should
      # either enforce them, or organise to strip paths as the corresponding
      # options fail.
-@@ -746,8 +737,6 @@ case $host in
+@@ -780,8 +769,6 @@ case $host in
  	;;
        *)
  	path="arm"
diff --git a/meta/recipes-support/gmp/gmp-6.1.2/use-includedir.patch b/meta/recipes-support/gmp/gmp/use-includedir.patch
similarity index 83%
rename from meta/recipes-support/gmp/gmp-6.1.2/use-includedir.patch
rename to meta/recipes-support/gmp/gmp/use-includedir.patch
index 6b089cf39c..d27317cdf6 100644
--- a/meta/recipes-support/gmp/gmp-6.1.2/use-includedir.patch
+++ b/meta/recipes-support/gmp/gmp/use-includedir.patch
@@ -1,4 +1,7 @@
+exec includedir should be pointing to general yocto includdir
+
 Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Index: gmp-6.1.2/Makefile.am
 ===================================================================
diff --git a/meta/recipes-support/gmp/gmp_6.1.2.bb b/meta/recipes-support/gmp/gmp_6.2.0.bb
similarity index 86%
rename from meta/recipes-support/gmp/gmp_6.1.2.bb
rename to meta/recipes-support/gmp/gmp_6.2.0.bb
index c745dbbfe7..a19c74fca8 100644
--- a/meta/recipes-support/gmp/gmp_6.1.2.bb
+++ b/meta/recipes-support/gmp/gmp_6.2.0.bb
@@ -9,13 +9,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 
 REVISION = ""
 SRC_URI = "https://gmplib.org/download/${BPN}/${BP}${REVISION}.tar.bz2 \
-           file://amd64.patch \
            file://use-includedir.patch \
            file://0001-Append-the-user-provided-flags-to-the-auto-detected-.patch \
            file://0001-confiure.ac-Believe-the-cflags-from-environment.patch \
            "
-SRC_URI[md5sum] = "8ddbb26dc3bd4e2302984debba1406a5"
-SRC_URI[sha256sum] = "5275bb04f4863a13516b2f39392ac5e272f5e1bb8057b18aec1c9b79d73d8fb2"
+SRC_URI[md5sum] = "c24161e0dd44cae78cd5f67193492a21"
+SRC_URI[sha256sum] = "f51c99cb114deb21a60075ffb494c1a210eb9d7cb729ed042ddb7de9534451ea"
 
 acpaths = ""
 
-- 
2.25.1


