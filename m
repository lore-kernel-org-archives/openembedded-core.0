Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 4EB597F4C7
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Sep 2019 00:01:35 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id h3so4967259pls.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Aug 2019 17:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=0gZ4b+aq453K2ywi9dLvJjloKVzas53sRc2M3jfZkZ4=;
	b=KZk0LduVdWkg26Cp4CzxouRy7Y5nqRqoZErwJew9QQLGDkwDCGHbukaxnpM4Mb51GS
	NM+NY/2Ba2c1Yly5OrbUjK40zRBfY+peIsv3oesDSygQfWSp2skOUdPCcqimQvkHrL4f
	+do71D7fWbnMhJCfLxN3+4nMRKXfLTL/fvbhU3wOGnN/2imer/FBJIImsK0mZRlQkV2V
	ea/V18ixxeIMWEWXdrX+HAuyaFQnJvXh41rIg8/cq4onH3EWDwyeKN8TNMFISg+XCm+F
	i6yO1v+EMMX8HLvYK3oxnfzk5V7OV39N9X0xmiYtVOHGCv9gToLU6smW4+6btEGisL82
	s2EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0gZ4b+aq453K2ywi9dLvJjloKVzas53sRc2M3jfZkZ4=;
	b=PjbW46oubLLdjEZKRU0rG6NRzS8IiVrGNDSk77B6trfUEM/zhtF3RKjFCu4HuGEkLw
	dDOWTGaxL//MZ+gBQCY+yLrRHYlP92wfd5Z2JX6z/JZd0hlcOgrviQ/dWVvHd5+alyiI
	CUFimZWwqmSKS0Rvod+JMEPAAtBLU54q2ox7l9kzvZS0tn96vXUDP7zznpuC9eaHfQSf
	nmzjfGRnZ2V78VyUoO193OeP9DEzacKWdmGzlVmdyJPvDzM0usTKexfTSMOP36Ubx6PV
	Y41+VxPAeFPvroOGlA5wiK99en3AgAz7RgNUofguNgSertbvHtzPP2VnC8mfvz4PLeB2
	n2Rw==
X-Gm-Message-State: APjAAAXEEgrl5H76TK1IBOMGl6t0E0bNcrnFluKiB6QDfPHqa0xMKX8m
	sO0rUnSFi8mj0rUNfknzVJlA7GKu
X-Google-Smtp-Source: APXvYqzNrzGQ2OFtz25hbelviSYYsl6n3oGglURiOl1qNMpHeZO/B7Hwd428rs41YPMS9gDKUPRDaA==
X-Received: by 2002:a17:902:7047:: with SMTP id
	h7mr2206937plt.275.1567296096192; 
	Sat, 31 Aug 2019 17:01:36 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:8107:6109:754a:f033])
	by smtp.gmail.com with ESMTPSA id
	j128sm5650388pfg.51.2019.08.31.17.01.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 31 Aug 2019 17:01:35 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 31 Aug 2019 17:01:33 -0700
Message-Id: <1567296093-14471-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Armin Kuster <akuster@mvista.com>
Subject: [thud][PATCH] binutils: Security fix for CVE-2019-12972
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
X-List-Received-Date: Sun, 01 Sep 2019 00:01:35 -0000

From: Armin Kuster <akuster@mvista.com>

Source: git://sourceware.org / binutils-gdb.git
MR: 98770
Type: Security Fix
Disposition: Backport from https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=890f750a3b053532a4b839a2dd6243076de12031
ChangeID: 7ced6bffbe01cbeadf50177eb332eef514baa19c
Description:

Fixes CVE-2019-12972

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/binutils/binutils-2.31.inc   |  1 +
 .../binutils/binutils/CVE-2019-12972.patch         | 39 ++++++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-12972.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.31.inc b/meta/recipes-devtools/binutils/binutils-2.31.inc
index 247f779..865fa10 100644
--- a/meta/recipes-devtools/binutils/binutils-2.31.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.31.inc
@@ -47,6 +47,7 @@ SRC_URI = "\
      file://CVE-2018-18606.patch \
      file://CVE-2018-18607.patch \
      file://CVE-2019-14444.patch \
+     file://CVE-2019-8457.patch \
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


