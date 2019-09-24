Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 9EFD17F26B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 03:13:32 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id i30so412926pgl.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 20:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=BVgOfByex4I7uEohJopYtW6jJit5k1woaab3pyX2+2Y=;
	b=sqDgW77QuYoj2OmUqxNXAkXV5zUHSd175Rn79nyvb7H8T0yXu4cB35cyKHluiPGiBw
	xibjxCJf2nVPh4qUGgu+hjitW4ZS+JZ8sSRp4tmyNTtIHUnPjVIlkhI2wCF8okcpg/ry
	SoLjSYBP5218wn9upualywl/rUyGbakL9nA44JIhEoCZNzR/gyyqxS7/H+wRRFBgc8sA
	eq7jLDm21Gc58GIwNEon/ZZqI6kHYuwZkkdhNlw3jdElQthnbnaqrWEld1NxpYUVVrRU
	+GlFrEFi155qN4obIKBi1k/ZrDGM3nxkynDlqr7KDDxVUZTAG1/TrVQcSEkImL5hpIAn
	AhXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=BVgOfByex4I7uEohJopYtW6jJit5k1woaab3pyX2+2Y=;
	b=Ya2VhT6ANjsA2h1AST0Kq+OvUMqhdo3ukWW1rejynciKq9cAMA0Ia6PFLHIdNZW1Qa
	zw1m+fGwQzidsKuDMvQaHV22yzTlxLVn3N0bt87QjTzMUI0XgsgukJu4s5WaiShWyrQT
	FDvxGWAS+7XKbQXBN8SlQOn01Ss9iTnJRvNzWp4TCjWoy6DCI5CkgwJh2O2Q+3vDi4Hz
	2fU6/utzTTbkwlzJzdQL/UVxPNJasn9rTdlhup0YOrdcLYmyI7ws6dMpNJ1Ap8JTuVgR
	FmogKIg8cz9ZWUzg+hG+4S5tPU6cxixXpVSouQEm0F+vN0u8NgiDTTq1qZMxXgWkIBpa
	bJwA==
X-Gm-Message-State: APjAAAVTom3uZU9XyjVtHJucj7X2BPR40qrzgReFlZU8VQ8ugZkz3uQc
	i8ZujIQDeJUGzZFuZABJacmbiEasmSE=
X-Google-Smtp-Source: APXvYqxcG47NhheUmVu/GYmF66WPBgC2RKNIX0J/rHc7q/9YNsSvC1Z9isELml+1Fjx+yZJ9vp1qFw==
X-Received: by 2002:a17:90a:9d87:: with SMTP id
	k7mr470333pjp.103.1569294813545; 
	Mon, 23 Sep 2019 20:13:33 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ec07:55c0:9c8c:b3de])
	by smtp.gmail.com with ESMTPSA id z23sm252602pgi.78.2019.09.23.20.13.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Sep 2019 20:13:33 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2019 20:13:06 -0700
Message-Id: <a367928942411b36a0b0bbb95055d01548430e8e.1569294712.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569294712.git.akuster808@gmail.com>
References: <cover.1569294712.git.akuster808@gmail.com>
Subject: [Thud][ 10/24] binutils: Security fix for CVE-2019-14444
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
X-List-Received-Date: Tue, 24 Sep 2019 03:13:33 -0000

Source: git://sourceware.org / binutils-gdb.git
MR: 99255
Type: Security Fix
Disposition: Backport from https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=e17869db99195849826eaaf5d2d0eb2cfdd7a2a7
ChangeID: 67ad4ab1ec34b941bdcfbb4f55d16176bbbd3d72
Description:

Affects: <= 2.32.0

Fixes CVE-2019-14444

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.31.inc   |  1 +
 .../binutils/binutils/CVE-2019-14444.patch         | 33 ++++++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-14444.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.31.inc b/meta/recipes-devtools/binutils/binutils-2.31.inc
index 62acec5..247f779 100644
--- a/meta/recipes-devtools/binutils/binutils-2.31.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.31.inc
@@ -46,6 +46,7 @@ SRC_URI = "\
      file://CVE-2018-18605.patch \
      file://CVE-2018-18606.patch \
      file://CVE-2018-18607.patch \
+     file://CVE-2019-14444.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2019-14444.patch b/meta/recipes-devtools/binutils/binutils/CVE-2019-14444.patch
new file mode 100644
index 0000000..499cf0e
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2019-14444.patch
@@ -0,0 +1,33 @@
+From e17869db99195849826eaaf5d2d0eb2cfdd7a2a7 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Mon, 5 Aug 2019 10:40:35 +0100
+Subject: [PATCH] Catch potential integer overflow in readelf when processing
+ corrupt binaries.
+
+	PR 24829
+	* readelf.c (apply_relocations): Catch potential integer overflow
+	whilst checking reloc location against section size.
+
+Upstream-Status: Backport
+https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=e17869db99195849826eaaf5d2d0eb2cfdd7a2a7
+CVE: CVE-2019-14444
+Dropped changelog
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ binutils/readelf.c | 2 +-
+ 2 files changed, 7 insertions(+), 1 deletion(-)
+
+Index: git/binutils/readelf.c
+===================================================================
+--- git.orig/binutils/readelf.c
++++ git/binutils/readelf.c
+@@ -13113,7 +13113,7 @@ apply_relocations (Filedata *
+ 	    }
+ 
+ 	  rloc = start + rp->r_offset;
+-	  if ((rloc + reloc_size) > end || (rloc < start))
++	  if (rloc >= end || (rloc + reloc_size) > end || (rloc < start))
+ 	    {
+ 	      warn (_("skipping invalid relocation offset 0x%lx in section %s\n"),
+ 		    (unsigned long) rp->r_offset,
-- 
2.7.4


