Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 5B52F7FD0C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 16:24:02 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id c9so9979614wrw.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 08:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UFQyrsW6Y/BZ0NvNpeYDgagluYivXlQtBMEk7SmUo/E=;
	b=Kp/dQ7CxwFQqVww1qyzMMthqhBZ+JrJIIjALhEsjqqgFqij5NOR4BQF8bDLBeNp1rm
	kqSBvtDr1UnBzKTcEOEdZlbdlwNceHNsieBYSctbxRTos2YT/KfCAt/6F0QQeaeoIt/j
	a6H0BzgL5KUpdHCSRwlStWkDmbKvkvwifjMHo044+VSWvDKTULBxmRIdl9UVXTx/hLJj
	hdj7SKX7WJNERQwnzA29rvL5uiPjH6d66iCJMqjJSvSCBb4fakAFRREbViyy4rcGKWYx
	hpdl361P9ZGNkQyX2kOQc3LNpGwh+lTe5tvpnFi6gRASBEyU7Oyn1a1tyw0cWeYbyTJf
	XEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UFQyrsW6Y/BZ0NvNpeYDgagluYivXlQtBMEk7SmUo/E=;
	b=gGl/7c5IGtITStnNB2LmFoDgpccYdJSNMFYF4d3wgVXmrkg4ymUdz2FHGdr6UhRd1c
	t44JwyOzi9jw+PAd65w9TbGE3gqQO5ef8ntTpl10wowJ6vKACw/lb0iC8k6Uts9+YIbh
	cweNidETkjsEBhRZnJHm7IzIym4qZt4LeeHD3YnCpAzBHd3mzvTBrhNzAZccf9qNqPAl
	CNn0z4pf42dwbyleAg5nBVaR0wvuEU2DhDJ0qF0hkwWxBGBqkuCezC5ZRr+iM/viTfMX
	g5/vELHV+r8Ua8kiTcdiSYvCeDptiXTXPx39zj1bDKlA5WFqIirNvjBXHIobPOUm+OhD
	MEAw==
X-Gm-Message-State: APjAAAVNVS2WEmJXX47rMxFf8k37w3SuikfgnlQY0ZkIQB0ZUY0Js3cW
	5u07Myc7CZNFS4c6woCtuiVmYTKU5JA=
X-Google-Smtp-Source: APXvYqwBP1KsLAqjsjHCBPuWaAUSlFgcJglT9aNo0U+WOxhRkfjSggN5z2GOW/3ErlsVlVfPB+1Vag==
X-Received: by 2002:adf:d184:: with SMTP id v4mr16126550wrc.76.1576859042844; 
	Fri, 20 Dec 2019 08:24:02 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	w17sm10436356wrt.89.2019.12.20.08.24.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Dec 2019 08:24:02 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Dec 2019 17:23:48 +0100
Message-Id: <20191220162351.94498-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191220162351.94498-1-alex.kanavin@gmail.com>
References: <20191220162351.94498-1-alex.kanavin@gmail.com>
Subject: [PATCH 08/11] prelink: upgrade to latest revision (in the cross_prelink branch)
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
X-List-Received-Date: Fri, 20 Dec 2019 16:24:02 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...check-info-resolvetls-before-use-its.patch | 51 -------------------
 meta/recipes-devtools/prelink/prelink_git.bb  |  5 +-
 2 files changed, 2 insertions(+), 54 deletions(-)
 delete mode 100644 meta/recipes-devtools/prelink/prelink/0001-src-arch-mips.c-check-info-resolvetls-before-use-its.patch

diff --git a/meta/recipes-devtools/prelink/prelink/0001-src-arch-mips.c-check-info-resolvetls-before-use-its.patch b/meta/recipes-devtools/prelink/prelink/0001-src-arch-mips.c-check-info-resolvetls-before-use-its.patch
deleted file mode 100644
index b1688243afe..00000000000
--- a/meta/recipes-devtools/prelink/prelink/0001-src-arch-mips.c-check-info-resolvetls-before-use-its.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 2136969e3e196b9cf7f4788340efa4b1d9b39565 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Thu, 11 Oct 2018 10:05:52 +0800
-Subject: [PATCH] src/arch-mips.c: check info->resolvetls before use its member
-
-The info->resolvetls might be NULL according to src/prelink.c:
-[snip]
- /* Dynamic linker does not depend on any other library,
-    all symbols resolve to themselves with the exception
-    of SHN_UNDEF symbols which resolve to 0.  */
-if (info->symtab[r_sym].st_shndx == SHN_UNDEF)
-  {
-    info->resolveent = NULL;
-    info->resolvetls = NULL;
-[snip]
-
-So we must check it before use its members, otherwise, there might be
-Segmentation fault error.
-
-Fixed:
-MACHINE = "qemumips"
-IMAGE_INSTALL_append = " qemu"
-$ bitbake core-image-minimal
-[snip]
-| /path/to/qemumips-poky-linux/core-image-minimal/1.0-r0/temp/run.prelink_image.1000: line 111:  1010 Segmentation fault      (core dumped)
-[snip]
-
-Upstream-Status: Submitted [https://lists.yoctoproject.org/pipermail/yocto/2018-October/042812.html]
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- src/arch-mips.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/arch-mips.c b/src/arch-mips.c
-index ccb1834..02c608f 100644
---- a/src/arch-mips.c
-+++ b/src/arch-mips.c
-@@ -567,7 +567,8 @@ mips_prelink_reloc (struct prelink_info *info, GElf_Addr r_offset,
-       if (dso->ehdr.e_type == ET_EXEC)
- 	{
- 	  value = info->resolve (info, r_sym, r_type);
--	  value += info->resolvetls->offset - TLS_TP_OFFSET;
-+	  if (info->resolvetls != NULL)
-+	    value += info->resolvetls->offset - TLS_TP_OFFSET;
- 	  if (r_type == R_MIPS_TLS_TPREL32)
- 	    mips_prelink_32bit_reloc (dso, rela, value);
- 	  else
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/prelink/prelink_git.bb b/meta/recipes-devtools/prelink/prelink_git.bb
index f0946de2cc1..674f815dbfc 100644
--- a/meta/recipes-devtools/prelink/prelink_git.bb
+++ b/meta/recipes-devtools/prelink/prelink_git.bb
@@ -9,7 +9,7 @@ and executables, so that far fewer relocations need to be resolved at \
 runtime and thus programs come up faster."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
-SRCREV = "a853a5d715d84eec93aa68e8f2df26b7d860f5b2"
+SRCREV = "f9975537dbfd9ade0fc813bd5cf5fcbe41753a37"
 PV = "1.0+git${SRCPV}"
 
 #
@@ -32,8 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/prelink-cross.git;branch=cross_prelink_sta
            file://prelink.cron.daily \
            file://prelink.default \
            file://macros.prelink \
-           file://0001-src-arch-mips.c-check-info-resolvetls-before-use-its.patch \
-"
+           "
 UPSTREAM_CHECK_COMMITS = "1"
 
 # error: error.h: No such file or directory
-- 
2.17.1


