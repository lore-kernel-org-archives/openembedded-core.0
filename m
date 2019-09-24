Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 373E67F27C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 02:50:06 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id v27so348176pgk.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 19:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=DJ3l99r2lq/DyWg02EX9klMGXtH156vmg1vqqqjvp6k=;
	b=vbCpXeWGaTy3exnrrOjIBB3p9kxd/VIhf222ZpkgwyKM3+PUExAFYbBwWUsOJ7E9WP
	vxJweAVHfXW/2i9mHFGtEgKbWgQ39UoxOlK9Ht5wO2F4nyJr1Sy1WuGIsQQkcRnOB1xi
	JSCK58MXc1bDZyBDCfw4VQperpL6AGgEgEnu6dH1KyKKNF/O2qy2YOtt2Eo/9STErnZz
	6ZXe3/3E2GWY56UMP34Bgd9oJVPKtBOu9cQgTisFu/6d69klD/wLBvF0VjSVrBSZg0IU
	94NuB5riXiNYS4EMg08l+CvXUnwq8TQSA8Q7Dkl1ioatie5GqZtyV5GaP/PktxUNtIru
	KeRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=DJ3l99r2lq/DyWg02EX9klMGXtH156vmg1vqqqjvp6k=;
	b=T8D5/rwW/dqVCX5mBc3V7hAqx+ex6EGkkPfeOOMG99H9Z3ChI7TqckPQBrcEJ1/UBy
	JmCJFeDg6H9I6U1s1bLWR0jCLxhtCAqty8XP8SLZ6+N9+80PIwY444ghCHSHAuQptTNv
	VnbXuGgqEonR1WgX+GBf5q1Dr0fvtxcwv7stn+0rHurgMULeiKtMyZkAEfpXgVJyoCr+
	ugPSMCGuUCiuVuDWUPjzwk5+btxVQbDrFZPdMndSWt2DfFCnum4aAMyfc1tBta1DKK3/
	zGhjBBqoYHl7OZlDABUHrvrPDBb0E4OMSbxU0VMm6Fm4MYcbqdvJgeNUeWJV3cnJfHP/
	A1yQ==
X-Gm-Message-State: APjAAAXV2kvj5qgYqmiqQueS3uYztoI9W9LMW5QF3H5BNVGRKNfcmw4R
	wYWa99ufu1IF63cpJqCbnflvKJpZi0Y=
X-Google-Smtp-Source: APXvYqwUR9Kdjmz/1ahj7Ts3UV1lzU8aAoyAiH2+RxmIuWGPPE3mcUkaDPXVFQ7sMCnVAd7FrrPAvw==
X-Received: by 2002:aa7:8f08:: with SMTP id x8mr760616pfr.48.1569293407237;
	Mon, 23 Sep 2019 19:50:07 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ec07:55c0:9c8c:b3de])
	by smtp.gmail.com with ESMTPSA id
	q204sm146791pfc.11.2019.09.23.19.50.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Sep 2019 19:50:06 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2019 19:49:13 -0700
Message-Id: <e4b1731aef7b7b1d547e95c57790d7457c8c3f41.1569292053.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569292053.git.akuster808@gmail.com>
References: <cover.1569292053.git.akuster808@gmail.com>
Subject: [warrior][ 33/50] binutils: fix CVE-2019-14250 CVE-2019-14444
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
X-List-Received-Date: Tue, 24 Sep 2019 02:50:06 -0000

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


