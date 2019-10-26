Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id BF5B47FC04
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2019 20:42:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 470tFj4wDZz7x
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2019 22:42:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572122537;
	bh=DgBNJP7esrmrZdZOu9t0iXQC7ISKorxiMjpVskonRcw=;
	h=From:To:Subject:Date:From;
	b=Yuy3fxDDKNool0wfDn1G9LMOTbGTXOt/4Q0rlND8Y5FXRLfDHRub6vyI3inX5AOtz
	zW1N7Lgfzv2cEbRBfpN62EK1zSRB8O9qQU4FKZO9FR+oFo42KHv9kjRkcvyTj83USs
	dSPvNxKKtD2M9ZuOPu3l2f8OAOHXhYBtetENt10adkm88BxBdWelSBbEiFDT1Htp05
	1/J7N0e4IT7LEpi1MdnCf5BqtIYvdfAqK2SeIAnRQ9KC5vdENBoOrdANdgx3DItD4B
	j4a8Fyq3iS4kjobVETNAAJePOmrV4Ftt/GXOrw+beKftt5Ygqx1/bNoRMLKSWVw/FL
	FU1ZFWv5jsDnoJ7RTRgdkmtiR9Osr0NrX1O9Hzqp/g5ysIuQ4x0ISQlUU6/S2h46L7
	C4RA80NvZBso7gtI2oS9f51rSV6qzquI2OfnHJUM6bmGMT7CJOM5j3pbqUm2VfVpAQ
	FnjeN/YOkDm7HizSrZnxqIdyfI/FmfFB5tvi9tvetGXeIKGaMfYiSRDzm1MmXJY4nh
	BDdXsRLKTGaK7nGuVDpREToB5d8nQLmVzwigFsrCULPV/fmr1Vf0jOD4WZ5T0Br6tA
	6mnZteMOaau2WUv/4xGGl14SUJmmWa2+TmdUDy0U4vzLNS57IVIwPizZQ9abCBkV/H
	4IDWhq8Jlkvm86uS/Exu9lRE=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sat, 26 Oct 2019 23:42:12 +0300
Message-Id: <20191026204216.9298-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] Remove stale gcc 8 patchfile
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
X-List-Received-Date: Sat, 26 Oct 2019 20:42:19 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../gcc/gcc-8.3/CVE-2019-14250.patch          | 44 -------------------
 1 file changed, 44 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-8.3/CVE-2019-14250.patch

diff --git a/meta/recipes-devtools/gcc/gcc-8.3/CVE-2019-14250.patch b/meta/recipes-devtools/gcc/gcc-8.3/CVE-2019-14250.patch
deleted file mode 100644
index e327684e16..0000000000
--- a/meta/recipes-devtools/gcc/gcc-8.3/CVE-2019-14250.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From a4f1b58eb48b349a5f353bc69c30be553506d33b Mon Sep 17 00:00:00 2001
-From: rguenth <rguenth@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Thu, 25 Jul 2019 10:48:26 +0000
-Subject: [PATCH] 2019-07-25  Richard Biener  <rguenther@suse.de>
-
-	PR lto/90924
-	Backport from mainline
-	2019-07-12  Ren Kimura  <rkx1209dev@gmail.com>
-
-	* simple-object-elf.c (simple_object_elf_match): Check zero value
-	shstrndx.
-
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-8-branch@273794 138bc75d-0d04-0410-961f-82ee72b054a4
-
-Upstream-Status: Backport
-Affectes: <  9.2
-CVE: CVE-2019-14250
-Dropped changelog
-Signed-off-by: Armin Kuster <Akustre@mvista.com>
-
----
- libiberty/simple-object-elf.c | 8 ++++++++
- 2 files changed, 17 insertions(+)
-
-Index: gcc-8.2.0/libiberty/simple-object-elf.c
-===================================================================
---- gcc-8.2.0.orig/libiberty/simple-object-elf.c
-+++ gcc-8.2.0/libiberty/simple-object-elf.c
-@@ -549,6 +549,14 @@ simple_object_elf_match (unsigned char h
-       return NULL;
-     }
- 
-+  if (eor->shstrndx == 0)
-+    {
-+      *errmsg = "invalid ELF shstrndx == 0";
-+      *err = 0;
-+      XDELETE (eor);
-+      return NULL;
-+    }
-+
-   return (void *) eor;
- }
- 
-- 
2.17.1


