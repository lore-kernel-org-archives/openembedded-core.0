Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id C48267F4F6
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Sep 2019 14:37:03 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id n4so5949801pgv.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Sep 2019 07:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=qTeGTUYJFAxnTEn35ceW/LtkqKkiVHdbomGRuRV+ofA=;
	b=SJcaBwHLJzyrJGtWallMPUYwZDdplnQeb/O6HZSKkTW1cvQA7Xn7PYabJOqNTgDPND
	O4Bs6DbZ4v97B6YfI85uDAp0c6jhLAbI8FPmCHEy+xsRfGSpBwdBjdrkBNpLTgzeAcjC
	CNyTLTE96BD0STRLEXaQaspaLB78xqzTfMVDKsi54pxQQvfrZeghAWHRxLc0e5rp0zQt
	sPf1c4iXRZxa/ModB8Som0x37ZJDudZgJdQKK3JkuWiR7gx2AU7yzCiaYCpZz/77Wv2s
	PqsNpgpFE2NzaKmTq7mScE7O3hQcd/lQBq0M1TQnoRER8+LXCQ+imWhVhlFj0yVn2/GH
	L5vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=qTeGTUYJFAxnTEn35ceW/LtkqKkiVHdbomGRuRV+ofA=;
	b=UAemSl5TiGV6e8+CNTAgohlkPODxHcRyxFJWqBEfF6sfJTROklvDwa4+C8O1heovEo
	TNsQLkMT8gplRe1PV6z8/oHLNqfPPRRDR49djPu+UzgQxdj55uvKqG3tG8LisUpw5qGJ
	KcQod4xznY2egsq9+9wLFddjzggUegfGESn2sF9dfnOvy+agTlADuX/MwAbCEKuJbYoI
	BhaRL6qq/NxCMFVMXCQzu9tN8Qoxzg/NZBenaASvoBfmcr1kC/R8Dom2ykcMGHBSxzLG
	eBLzNON6iZwZ4gRXn1Ihouo/YVZ1lrej7SPrSDV8hME3SJkaOoZo8nre8BEzaHw0CkmQ
	4cvA==
X-Gm-Message-State: APjAAAXXz+hJX9ExaYSmrut/reuVXg0ZD9gN9HZeEM9vZKJuFtStd/Am
	IrlgltKbsMdWKgozui2w3IV2KDkx
X-Google-Smtp-Source: APXvYqy+aPaR3wRekg/tWRi99V0qEJ/pLv3gmKrd78/CUJoHNMfsJN7TByyAyZJBIw/icQF3H1Cvqw==
X-Received: by 2002:a65:64cf:: with SMTP id t15mr20843610pgv.88.1567348624738; 
	Sun, 01 Sep 2019 07:37:04 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:1d53:5246:e59:bfe9])
	by smtp.gmail.com with ESMTPSA id
	s16sm15911381pfs.6.2019.09.01.07.37.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 01 Sep 2019 07:37:04 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Sep 2019 07:36:21 -0700
Message-Id: <c9eb2ed8d37be4fd4f06edc54a4845a908f72166.1567348433.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567348433.git.akuster808@gmail.com>
References: <cover.1567348433.git.akuster808@gmail.com>
Subject: [warrior 43/43] gcc-8.3: Security fix for CVE-2019-14250
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
X-List-Received-Date: Sun, 01 Sep 2019 14:37:04 -0000

From: Armin Kuster <akuster@mvista.com>

Affects < 9.2

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-8.3.inc              |  1 +
 .../gcc/gcc-8.3/CVE-2019-14250.patch               | 44 ++++++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.3/CVE-2019-14250.patch

diff --git a/meta/recipes-devtools/gcc/gcc-8.3.inc b/meta/recipes-devtools/gcc/gcc-8.3.inc
index dce85a2..80f716a 100644
--- a/meta/recipes-devtools/gcc/gcc-8.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-8.3.inc
@@ -74,6 +74,7 @@ SRC_URI = "\
            file://0041-Add-a-recursion-limit-to-libiberty-s-demangling-code.patch \
            file://0042-PR-debug-86964.patch \
            file://0043-PR85434-Prevent-spilling-of-stack-protector-guard-s-.patch \
+           file://CVE-2019-14250.patch \
 "
 SRC_URI[md5sum] = "65b210b4bfe7e060051f799e0f994896"
 SRC_URI[sha256sum] = "64baadfe6cc0f4947a84cb12d7f0dfaf45bb58b7e92461639596c21e02d97d2c"
diff --git a/meta/recipes-devtools/gcc/gcc-8.3/CVE-2019-14250.patch b/meta/recipes-devtools/gcc/gcc-8.3/CVE-2019-14250.patch
new file mode 100644
index 0000000..e327684
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.3/CVE-2019-14250.patch
@@ -0,0 +1,44 @@
+From a4f1b58eb48b349a5f353bc69c30be553506d33b Mon Sep 17 00:00:00 2001
+From: rguenth <rguenth@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Thu, 25 Jul 2019 10:48:26 +0000
+Subject: [PATCH] 2019-07-25  Richard Biener  <rguenther@suse.de>
+
+	PR lto/90924
+	Backport from mainline
+	2019-07-12  Ren Kimura  <rkx1209dev@gmail.com>
+
+	* simple-object-elf.c (simple_object_elf_match): Check zero value
+	shstrndx.
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-8-branch@273794 138bc75d-0d04-0410-961f-82ee72b054a4
+
+Upstream-Status: Backport
+Affectes: <  9.2
+CVE: CVE-2019-14250
+Dropped changelog
+Signed-off-by: Armin Kuster <Akustre@mvista.com>
+
+---
+ libiberty/simple-object-elf.c | 8 ++++++++
+ 2 files changed, 17 insertions(+)
+
+Index: gcc-8.2.0/libiberty/simple-object-elf.c
+===================================================================
+--- gcc-8.2.0.orig/libiberty/simple-object-elf.c
++++ gcc-8.2.0/libiberty/simple-object-elf.c
+@@ -549,6 +549,14 @@ simple_object_elf_match (unsigned char h
+       return NULL;
+     }
+ 
++  if (eor->shstrndx == 0)
++    {
++      *errmsg = "invalid ELF shstrndx == 0";
++      *err = 0;
++      XDELETE (eor);
++      return NULL;
++    }
++
+   return (void *) eor;
+ }
+ 
-- 
2.7.4


