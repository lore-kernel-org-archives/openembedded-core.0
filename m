Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 9949D7EE0E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 03:13:33 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id x10so394182pgi.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 20:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=o+acMhsHqRRaLTTvEAcZ2tvc4oa1fgvEJGYtBGLHdPg=;
	b=CBfiBpiTZIlTQUbp/8oz4aKFm41lp2SIyTliQZe4ayMTR4WRXbWSaeLTKx+sggyaRc
	IIcX0vxC7/uZKzSMjuGSymacYE1+4yrRvNlQklBZTXeYoxPPHdD4YjRtnXb0tbxR1V8q
	vHhFcHfcw9ycWUgTKG8NV+wYyFdEccKh3pYec+WmrLTTrEPaO7YRTtCvOxk+NgIThTL7
	b4OT2iGWYlrYDqAh1ly04ZvmJmbPwISFUtoejewuqZVm/Y9NcMB4UvBChQwwZxjVIhc5
	Bo5w+Ylewq5xXk4zuTD8HBAq5DDNYLxKXBzsbbSb3Er9+B2gwLDtNLMvk6tg2OrD9sCq
	wMTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=o+acMhsHqRRaLTTvEAcZ2tvc4oa1fgvEJGYtBGLHdPg=;
	b=VUoHLUg9sdFUB7k8PA3n0FA+h1TGngv1UdbeJsc+OKKYauCAUEzz5Mij3D9aiPOuvG
	+dyPMjSdm9FylurIQ84muIw1hidq79b910gH2Ow1cJUKb7iImahN3mkzyE8m+4Ms44wL
	NRfEjNrXd2GUlQ94dZPxjQUczLdbqB28Ojk933PIxxfyS5t/Y4KKw4pNkHrmsmtWYwXZ
	Ko8MIh3dj0bwrPipu6mGcqfwvNZPLNuAgZ2lGizHjjDg0MUPnagDfiuspdd2vRzljZ3j
	JCrXBY4GlcjLsyJSc1T6Ay8m6rVZRvRIjV0zuOGxFbSXrmnHwAPQa1SeKbjAuJVH7bfy
	SkyA==
X-Gm-Message-State: APjAAAVtkp7Zj0xmt1KRVRn1de03pQqF4gSpA6AFvxRzVJoiqL0YIAhV
	dOJF9LRrjjBSFUTsm7VOyXqnY3xMYaw=
X-Google-Smtp-Source: APXvYqwY2IcqChRfJeujURCFJxigtIqOtgbeo5UtiSuElNvbIzIBkrLGqWdJ7WzsabPCpSWhEkY7XA==
X-Received: by 2002:a63:724e:: with SMTP id c14mr906588pgn.120.1569294814595; 
	Mon, 23 Sep 2019 20:13:34 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ec07:55c0:9c8c:b3de])
	by smtp.gmail.com with ESMTPSA id z23sm252602pgi.78.2019.09.23.20.13.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Sep 2019 20:13:33 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2019 20:13:07 -0700
Message-Id: <16f4520f5cb581eb93bd3f0e3aa1feecc5c567ba.1569294712.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569294712.git.akuster808@gmail.com>
References: <cover.1569294712.git.akuster808@gmail.com>
Subject: [Thud][ 11/24] binutils: Security fix for CVE-2019-12972
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


