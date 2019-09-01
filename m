Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id 09CD07F454
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Sep 2019 14:36:54 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id o3so5389875plb.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Sep 2019 07:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=DJ3l99r2lq/DyWg02EX9klMGXtH156vmg1vqqqjvp6k=;
	b=g/x6Fx+OZXw8d9IDqm8ULfDe8d/uPIiHfQOUwutPUql3dp+an/ZbUwxch7V81YIJTR
	84WU0d1Y8cZtCpm92ihJ1VrhzvdkgGes/2v054S0/xWMuyW0nOHpd9YEJNwzAi8EJt2b
	wv1Y+MuuTpTx5NmabtD9x3CI/YeXZXcnnwu8FIcnc2B0sCOxb+vsVBwzF9RQgtH5xeMq
	0eGQEL0VGdB+mbXqCnIWKUIgRpiVGo+kta8ZZstytnozsurUt9E0YmGtJKq61AOD5aaE
	Qkmo0FgpSOezMg2CAviqeIdr8XzTHS1+IBDwL29pICZxkV2oA0DQlCP4cMSOo26xhttl
	1SLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=DJ3l99r2lq/DyWg02EX9klMGXtH156vmg1vqqqjvp6k=;
	b=JST2CxAaxk2pEhaS2z7yfmFWrWwRkXrTImBXFyuaHeeUTskaqZjIp2v8GKyqsom0hJ
	a2Upy9oShnYPM8E41dXhZXQbJFMW6EL20hXIzJJc0OY+79r8hun/vYQTRRIkFg1dwzgC
	gSwIK+vhU/1AVvM2aEvArPhuOHAGQkiMyTU8dFOEgDyBoqijI16/aF6kxh00yBypel3j
	oZsYAq875PJLLLkmLrcPl5VzC9gnJrUrJ3n8Kl//vAky0n4isbs8el1h8g2SnhUnjh/T
	IIjOc0mCHaWL4dLhgRsgNM51RQ28B5xUwmMeDJhTDFZnFuj5PykARxyi4Ak7NeySVI08
	1HZw==
X-Gm-Message-State: APjAAAW775nwlPWRKOCK5BX8xbhd9XLUAd1QBpMO5jD4NV84FBuHiUg0
	cCOmfACMi3JvDchRzRsMbirFVRcj
X-Google-Smtp-Source: APXvYqwsc6NegLX/Y/csw6YG5bbVksgYxpIW/o2v8pDGN9aICMikKloiFLGSnCqAT0ZhSXX0r1fOAw==
X-Received: by 2002:a17:902:7792:: with SMTP id
	o18mr9248248pll.73.1567348616031; 
	Sun, 01 Sep 2019 07:36:56 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:1d53:5246:e59:bfe9])
	by smtp.gmail.com with ESMTPSA id
	s16sm15911381pfs.6.2019.09.01.07.36.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 01 Sep 2019 07:36:55 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Sep 2019 07:36:11 -0700
Message-Id: <e4b1731aef7b7b1d547e95c57790d7457c8c3f41.1567348433.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567348433.git.akuster808@gmail.com>
References: <cover.1567348433.git.akuster808@gmail.com>
Subject: [warrior 33/43] binutils: fix CVE-2019-14250 CVE-2019-14444
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
X-List-Received-Date: Sun, 01 Sep 2019 14:36:55 -0000

From: Anuj Mittal <anuj.mittal@intel.com>

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.32.inc   |  2 ++
 .../binutils/binutils/CVE-2019-14250.patch         | 33 ++++++++++++++++++++++
 .../binutils/binutils/CVE-2019-14444.patch         | 28 ++++++++++++++++++
 3 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-14250.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-14444.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.32.inc b/meta/recipes-devtools/binutils/binutils-2.32.inc
index 31c24a3..d3c5293 100644
--- a/meta/recipes-devtools/binutils/binutils-2.32.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.32.inc
@@ -50,6 +50,8 @@ SRC_URI = "\
      file://CVE-2019-9077.patch \
      file://CVE-2019-9071.patch \
      file://CVE-2019-12972.patch \
+     file://CVE-2019-14250.patch \
+     file://CVE-2019-14444.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2019-14250.patch b/meta/recipes-devtools/binutils/binutils/CVE-2019-14250.patch
new file mode 100644
index 0000000..c915a83
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2019-14250.patch
@@ -0,0 +1,33 @@
+From df78be05daf4eb07f60f50ec1080cb979af32ec0 Mon Sep 17 00:00:00 2001
+From: marxin <marxin@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Tue, 23 Jul 2019 07:33:32 +0000
+Subject: [PATCH] libiberty: Check zero value shstrndx in simple-object-elf.c
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@273718 138bc75d-0d04-0410-961f-82ee72b054a4
+
+CVE: CVE-2019-14250
+Upstream-Status: Backport [from gcc: https://gcc.gnu.org/viewcvs/gcc?view=revision&revision=273718]
+[Removed Changelog entry]
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+diff --git a/libiberty/simple-object-elf.c b/libiberty/simple-object-elf.c
+index 502388991a08..bdee963634d6 100644
+--- a/libiberty/simple-object-elf.c
++++ b/libiberty/simple-object-elf.c
+@@ -548,7 +548,15 @@ simple_object_elf_match (unsigned char header[SIMPLE_OBJECT_MATCH_HEADER_LEN],
+       XDELETE (eor);
+       return NULL;
+     }
+-
++  
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
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2019-14444.patch b/meta/recipes-devtools/binutils/binutils/CVE-2019-14444.patch
new file mode 100644
index 0000000..85b9a9f
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2019-14444.patch
@@ -0,0 +1,28 @@
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
+CVE: CVE-2019-14444
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=e17869db99195849826eaaf5d2d0eb2cfdd7a2a7]
+[Removed Changelog entry]
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+diff --git a/binutils/readelf.c b/binutils/readelf.c
+index b896ad9f406..e785fde43e7 100644
+--- a/binutils/readelf.c
++++ b/binutils/readelf.c
+@@ -13366,7 +13366,7 @@ apply_relocations (Filedata *                 filedata,
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


