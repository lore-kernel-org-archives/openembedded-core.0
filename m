Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id AA8DB7E457
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:11:16 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id e5so7009737pls.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2019 08:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=o+acMhsHqRRaLTTvEAcZ2tvc4oa1fgvEJGYtBGLHdPg=;
	b=VGPHr9myns96Kk2u3xT5wbYN3p0xZ9vmFHnwQiG64ZEsKCe8tRuB+bWRjqY9jwm9+W
	mYHtcgYU43ZTpFOn+yaMuU/4OVEM5+8EoOdxU0CaB84FILTjJ+7dQBv6T7r3eeyd2hkj
	g4QzZEX2iJSdrN7UT3cQFSnGP9whxiIGf7HepUrB316bXxihCf3frXEKclm1/hI9Mdfs
	xLi3eQF/FvzFmYhmnauM5EODgjHvucuWGRVVCpdhprJwbFjFMHHsvCc8b0H4lmzGD2RU
	pzXYPOdIW29saBdU6POILKRZm9N5ruBNUH3nSiGF+Y3weXLXne/QTiRKkmwVQPGTrpT5
	g1Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=o+acMhsHqRRaLTTvEAcZ2tvc4oa1fgvEJGYtBGLHdPg=;
	b=ARALjoXs1XBZzO+aQnQ2fEJwo4FFESgPrbooLTpFJKOaAPVFH5z/pkB90UIlwGPdKa
	Y9+06onVcqvDX51O1QQ7DTjo6HEgbrdr0KCOj4wSAaJAHEgU9rHfdgsYEeL5JjTYXqKB
	AL8fbj0EfZo2CubO6fFeQEOMFTGv6QcDpMliWCHLMCPELZfdD8DvfcZDL29MvPDuwsUs
	iPiQOh6kVHT6Dnj5sIvcYzMRmnKb9IzBE4lgbhKyvJSOVy1DM4ytmX/1PDHmFk9agdoP
	lQ5OD+HABlil4ph8FzrnDkjp0YInDjOQdBq30s9GCB1z/0fOk/yNepKu9snSACmYo4pZ
	vN6g==
X-Gm-Message-State: APjAAAWeujvFefkuFkgfPKEw0rjvz61zvp+KrPqw3+knPBjBEQ8lrVfg
	8hDjbM2w0UlDhKyz888R/7hrWjnblqE=
X-Google-Smtp-Source: APXvYqzE5DsFvsCLlB5o9cq8G/iF6GekRuhPeyaQA8kLmfOOYbnJLLuYT0Q2q0plV5a9PgjAe51l8g==
X-Received: by 2002:a17:902:7c94:: with SMTP id
	y20mr28922226pll.229.1570461077600; 
	Mon, 07 Oct 2019 08:11:17 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:65e8:7322:d189:1d85])
	by smtp.gmail.com with ESMTPSA id
	m102sm12786928pje.5.2019.10.07.08.11.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 07 Oct 2019 08:11:17 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Oct 2019 08:10:48 -0700
Message-Id: <16f4520f5cb581eb93bd3f0e3aa1feecc5c567ba.1570460789.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1570460789.git.akuster808@gmail.com>
References: <cover.1570460789.git.akuster808@gmail.com>
Subject: [thud 11/26] binutils: Security fix for CVE-2019-12972
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
X-List-Received-Date: Mon, 07 Oct 2019 15:11:17 -0000

From: Armin Kuster <akuster@mvista.com>

Source: git://sourceware.org / binutils-gdb.git
MR: 98770
Type: Security Fix
Disposition: Backport from https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=890f750a3b053532a4b839a2dd6243076de12031
ChangeID: 7ced6bffbe01cbeadf50177eb332eef514baa19c
Description:

Fixes CVE-2019-12972

Signed-off-by: Armin Kuster <akuster@mvista.com>

[v2]
forgot to refresh inc file before sending
---
 meta/recipes-devtools/binutils/binutils-2.31.inc   |  1 +
 .../binutils/binutils/CVE-2019-12972.patch         | 39 ++++++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-12972.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.31.inc b/meta/recipes-devtools/binutils/binutils-2.31.inc
index 247f779..e1a6673 100644
--- a/meta/recipes-devtools/binutils/binutils-2.31.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.31.inc
@@ -47,6 +47,7 @@ SRC_URI = "\
      file://CVE-2018-18606.patch \
      file://CVE-2018-18607.patch \
      file://CVE-2019-14444.patch \
+     file://CVE-2019-12972.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2019-12972.patch b/meta/recipes-devtools/binutils/binutils/CVE-2019-12972.patch
new file mode 100644
index 0000000..3e95b92
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2019-12972.patch
@@ -0,0 +1,39 @@
+From 890f750a3b053532a4b839a2dd6243076de12031 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Fri, 21 Jun 2019 11:51:38 +0930
+Subject: [PATCH] PR24689, string table corruption
+
+The testcase in the PR had a e_shstrndx section of type SHT_GROUP.
+hdr->contents were initialized by setup_group rather than being read
+from the file, thus last byte was not zero and string dereference ran
+off the end of the buffer.
+
+	PR 24689
+	* elfcode.h (elf_object_p): Check type of e_shstrndx section.
+
+Upstream-Status: Backport
+https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=890f750a3b053532a4b839a2dd6243076de12031
+
+CVE: CVE-2019-12972
+Affects: <= 2.23.0
+Dropped Changelog
+Signed-off-by Armin Kuster <akuster@mvista.com>
+---
+ bfd/ChangeLog | 5 +++++
+ bfd/elfcode.h | 3 ++-
+ 2 files changed, 7 insertions(+), 1 deletion(-)
+
+Index: git/bfd/elfcode.h
+===================================================================
+--- git.orig/bfd/elfcode.h
++++ git/bfd/elfcode.h
+@@ -747,7 +747,8 @@ elf_object_p (bfd *abfd)
+   /* A further sanity check.  */
+   if (i_ehdrp->e_shnum != 0)
+     {
+-      if (i_ehdrp->e_shstrndx >= elf_numsections (abfd))
++      if (i_ehdrp->e_shstrndx >= elf_numsections (abfd)
++	  || i_shdrp[i_ehdrp->e_shstrndx].sh_type != SHT_STRTAB)
+ 	{
+ 	  /* PR 2257:
+ 	     We used to just goto got_wrong_format_error here
-- 
2.7.4


