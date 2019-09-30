Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id 6EC5560807
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 04:48:26 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id j11so97927plk.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 21:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=DJ3l99r2lq/DyWg02EX9klMGXtH156vmg1vqqqjvp6k=;
	b=jeSUvoB2HfNrk25xw9JKtlLbmQrOi4glC31clL5SEXoEYqeOrw/ClMXooibu8zSWA+
	lj9Gq7BadYgzaWIvmUFmme6w1JeWoYb8PX8OgUt/165+Vq20TCB7dxQjX+Hnd4aaoJdW
	saFSgeFEOYOa/B2jaErrqlEynHSlsot5wzI81HqVH/+tF6i3/QXhpEjeg7zUrueJRElI
	frI9kZM3kvVCOE5ZCgcNoGiShoBcp2W1mmX1CRHFmWufrgZ+9Xb3IctoEgTTEUveSxv7
	Nm1cTFV6YcLcmYGHNr5rHd2VxzSVjqPGyN123auO+aWuzni+plAMS/II/ZRDfGwHwnUI
	VW0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=DJ3l99r2lq/DyWg02EX9klMGXtH156vmg1vqqqjvp6k=;
	b=VaCsPegMazZ8I9enxLU9N6kWlrO7NG4TK7UD6ihIY6C0UJfW99ZV74noT4ppdW5Y/Z
	UOT7uIbqlShB+L8BHBpU0Kggu0XNJShuIm7eSi3WUSf/dPiaHB2Xc25t0QTUyI0R17/0
	4Nxfmba2iPwPTkgprE2KmJZXDy7o/ggGZ6g3UXs3o4PnaitRth6kTwCgwRnAiFskxsmq
	hqIFdk9nvMlkUiIv2OIfTCu1SLsdHNXmAl/ao4UksyvttG6DESsr+qcMJ8qNdVFEawRq
	f97DkQGkc5t/5XQn27REMgHrZLGnwNQyrWtxioibyV8DxvjSVrePeNeEtrvWcafwfyVp
	+gJw==
X-Gm-Message-State: APjAAAVLq7F6+9Y05L6Wrd1QZ612PFb2J1KuoBiLq9zVHB5GYF7fPOc9
	zAa29tEqMDmv61nHVfE97yr0mpKuJiQ=
X-Google-Smtp-Source: APXvYqx1iBwtCDZBytabnnUftZCOZPxNOukD0GagJ5Jvdm3c/rpFb6+0R9m2uMcHE0lbumJFy9x1qA==
X-Received: by 2002:a17:902:848e:: with SMTP id
	c14mr12425098plo.217.1569818906547; 
	Sun, 29 Sep 2019 21:48:26 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:edf9:811d:ad92:85c2])
	by smtp.gmail.com with ESMTPSA id
	h15sm18888493pgn.76.2019.09.29.21.48.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Sep 2019 21:48:26 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Sep 2019 21:47:27 -0700
Message-Id: <41579d569738a23b80d4599fd6ec082488c6cfee.1569818533.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569818533.git.akuster808@gmail.com>
References: <cover.1569818533.git.akuster808@gmail.com>
Subject: [warrior-next 32/54] binutils: fix CVE-2019-14250 CVE-2019-14444
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
X-List-Received-Date: Mon, 30 Sep 2019 04:48:26 -0000

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


