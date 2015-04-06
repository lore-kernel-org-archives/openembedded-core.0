Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9E9DD73C3F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Apr 2015 17:37:10 +0000 (UTC)
Received: by iedfl3 with SMTP id fl3so30392722ied.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Apr 2015 10:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=2h+pIzEBZsUFiVwKOhOjkEp2f3uoF7qRq3x0dCryAyk=;
	b=cVSCF3wt7m5fm0ecqrNou3GqjwDWaj/Senikgevbyu2lwqY96IBQsdnPO0pdfbPzDl
	IqxYedNOpVxic4dQadEfKnhr4o4ysBCq5LD5SBDPogivk/nNe3fHz85e3REyBfVXzAqX
	CrJo3BzESmEd8G3dA0snimhepxt0d11vmi64wrT9O23FPrxXW93dnWOtRUovEYc6KOkq
	GYXE4/uh9hekWZHQ1BQzyBByjrmt6Xn1FQZMGb0pVADkLS7RpRpOYdGBy2ki4y3eqskh
	ciWDgPUCZhozLXP08zvMt+mareSUpXjv5/opvrGwHiOVaxDZGgO9Tb1saZYF8FDFm683
	Nr9g==
X-Received: by 10.50.30.130 with SMTP id s2mr25223146igh.11.1428341832132;
	Mon, 06 Apr 2015 10:37:12 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id 7sm3063135iol.43.2015.04.06.10.37.11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Apr 2015 10:37:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Apr 2015 17:36:43 +0000
Message-Id: <5dd446f70cb5dc288003540e5bce1d3feb7854bb.1428341478.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <ff271af7055b2ee3ee93b5ae53dce06876585381.1428341478.git.raj.khem@gmail.com>
References: <ff271af7055b2ee3ee93b5ae53dce06876585381.1428341478.git.raj.khem@gmail.com>
In-Reply-To: <cover.1428341477.git.raj.khem@gmail.com>
References: <cover.1428341477.git.raj.khem@gmail.com>
Subject: [PATCH 15/24] libffi: Use proper compiler define for linux platform
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
X-List-Received-Date: Mon, 06 Apr 2015 17:37:11 -0000

Change-Id: I8253249a2e1c5e9ded0d028545f21cfdc093c3cd
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ps-Use-compiler-internal-define-for-linux.patch | 32 ++++++++++++++++++++++
 meta/recipes-gnome/libffi/libffi_3.2.1.bb          |  4 ++-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-gnome/libffi/libffi/0001-mips-Use-compiler-internal-define-for-linux.patch

diff --git a/meta/recipes-gnome/libffi/libffi/0001-mips-Use-compiler-internal-define-for-linux.patch b/meta/recipes-gnome/libffi/libffi/0001-mips-Use-compiler-internal-define-for-linux.patch
new file mode 100644
index 0000000..db96e63
--- /dev/null
+++ b/meta/recipes-gnome/libffi/libffi/0001-mips-Use-compiler-internal-define-for-linux.patch
@@ -0,0 +1,32 @@
+From a5efaa96fd934eb245c234a5275fcf62698ef986 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 2 Apr 2015 21:38:03 -0700
+Subject: [PATCH] mips: Use compiler internal define for linux
+
+__linux__ is defined by compiler when building for
+linux platforms, lets use it
+
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/mips/ffitarget.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/mips/ffitarget.h b/src/mips/ffitarget.h
+index 717d659..6faa358 100644
+--- a/src/mips/ffitarget.h
++++ b/src/mips/ffitarget.h
+@@ -32,7 +32,7 @@
+ #error "Please do not include ffitarget.h directly into your source.  Use ffi.h instead."
+ #endif
+ 
+-#ifdef linux
++#ifdef __linux__
+ # include <asm/sgidefs.h>
+ #elif defined(__rtems__)
+ /*
+-- 
+2.1.4
+
diff --git a/meta/recipes-gnome/libffi/libffi_3.2.1.bb b/meta/recipes-gnome/libffi/libffi_3.2.1.bb
index 2302810..fd916ca 100644
--- a/meta/recipes-gnome/libffi/libffi_3.2.1.bb
+++ b/meta/recipes-gnome/libffi/libffi_3.2.1.bb
@@ -10,7 +10,9 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3610bb17683a0089ed64055416b2ae1b"
 
 SRC_URI = "ftp://sourceware.org/pub/libffi/${BP}.tar.gz \
-           file://fix-libffi.la-location.patch"
+           file://fix-libffi.la-location.patch \
+	   file://0001-mips-Use-compiler-internal-define-for-linux.patch \
+	   "
 
 SRC_URI[md5sum] = "83b89587607e3eb65c70d361f13bab43"
 SRC_URI[sha256sum] = "d06ebb8e1d9a22d19e38d63fdb83954253f39bedc5d46232a05645685722ca37"
-- 
2.1.4


