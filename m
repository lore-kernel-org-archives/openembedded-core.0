Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 69BDA77F90
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 02:35:21 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id u14so7590171plm.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Nov 2017 18:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=zUA2q4FrGU65MV3p0D1Z7yTZbce7ofnDB4TaLi6DhWQ=;
	b=Cf24601u+weMgeix40CHWPKeCUh72z+TBWie3PKFFKouAGFvUvgVKvkHBV1x+GZW+X
	uQd6d+myrd9PChZw/PaNMypcdQAResfVIz52UWbvp30qr235XjcCRzE7PzepWY0zT5Pr
	x3XWQwNP3yDQf0rda7eCR2DioDVnqWWSgh06Fz9ddg+uw6+VbohwX1ThXAUULCx+NKlO
	Eo6op5kLlg0wBAqkvF4DSG5qkLO357HUnmLi57CSfvhjgN91KqB6r+AL5++OXomm5Pxq
	uKoLhuDzL0OYVjWc1QhK0IzdEeGbOiSZIVyayDw2+srkP/WVXSxcW7DoCVRKavuJtiYU
	chGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=zUA2q4FrGU65MV3p0D1Z7yTZbce7ofnDB4TaLi6DhWQ=;
	b=tQYeKIlKdKmLAflM9UPJsLDygbwCsbEzn4QmkizL6PHXRrap0kFGl9MnZXRk1q308+
	msxkAKRpqv4JaQNaF9dThIDc6jtC0V5z9FeXNXBV5xGMiqNRs9BasELCqm6SL/XY/vmb
	UAby/imqBKHTk9UkNAZG8FGymrcjn/oJ9EFQ0CznFq7QYFBgE5beOofNHZitYPIZfNUI
	jEvImBUlua+Y0T2xO3liY5F/cTr+5PYCKtyTLn7T3yLqdggZ7a8YmI+ptIXxxyBPDDzk
	ZU33d1UqZcXV+qKjjpS0dy0xv7Y7hJ9O4RYRDXJq6dlYSIQTk7HW5iJ8EIQQaLRO7I+c
	hkdg==
X-Gm-Message-State: AJaThX6eWjx8vDyRdenqWz0Ofeg/fyq86+6Rte/19P/yrqZZi7C4Qm+o
	M9t40ZxoniFT7EdXj8VgCkYRMg==
X-Google-Smtp-Source: AGs4zMbtIQTK57R0Kku8ejPAqCKxFAoMvx0XThxHADLGVZ+/OGf7XJe5nHAsNZ2cJ7PyvN5YuA3MrA==
X-Received: by 10.159.208.67 with SMTP id w3mr37212038plz.175.1511750123065;
	Sun, 26 Nov 2017 18:35:23 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:b082:a618:f613:3498])
	by smtp.gmail.com with ESMTPSA id
	e3sm17809103pfe.92.2017.11.26.18.35.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 26 Nov 2017 18:35:22 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sun, 26 Nov 2017 18:34:56 -0800
Message-Id: <1511750112-2263-10-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1511750112-2263-1-git-send-email-akuster808@gmail.com>
References: <1511750112-2263-1-git-send-email-akuster808@gmail.com>
Subject: [pyro][PATCH 10/26] binutils: Security fix for CVE-2017-9039
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
X-List-Received-Date: Mon, 27 Nov 2017 02:35:21 -0000

Affects: <= 2.28

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.28.inc   |  1 +
 .../binutils/binutils/CVE-2017-9039.patch          | 61 ++++++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-9039.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.28.inc b/meta/recipes-devtools/binutils/binutils-2.28.inc
index 377165a..b8199a4 100644
--- a/meta/recipes-devtools/binutils/binutils-2.28.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.28.inc
@@ -52,6 +52,7 @@ SRC_URI = "\
      file://CVE-2017-8398.patch \
      file://CVE-2017-8421.patch \
      file://CVE-2017-9038_9044.patch \
+     file://CVE-2017-9039.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-9039.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-9039.patch
new file mode 100644
index 0000000..aed8f7f
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-9039.patch
@@ -0,0 +1,61 @@
+From 82156ab704b08b124d319c0decdbd48b3ca2dac5 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Mon, 3 Apr 2017 12:14:06 +0100
+Subject: [PATCH] readelf: Fix overlarge memory allocation when reading a
+ binary with an excessive number of program headers.
+
+	PR binutils/21345
+	* readelf.c (get_program_headers): Check for there being too many
+	program headers before attempting to allocate space for them.
+
+Upstream-Status: Backport
+CVE: CVE-2017-9039
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ binutils/ChangeLog |  6 ++++++
+ binutils/readelf.c | 17 ++++++++++++++---
+ 2 files changed, 20 insertions(+), 3 deletions(-)
+
+Index: git/binutils/readelf.c
+===================================================================
+--- git.orig/binutils/readelf.c
++++ git/binutils/readelf.c
+@@ -4765,9 +4765,19 @@ get_program_headers (FILE * file)
+   if (program_headers != NULL)
+     return 1;
+ 
+-  phdrs = (Elf_Internal_Phdr *) cmalloc (elf_header.e_phnum,
+-                                         sizeof (Elf_Internal_Phdr));
++  /* Be kind to memory checkers by looking for
++     e_phnum values which we know must be invalid.  */
++  if (elf_header.e_phnum
++      * (is_32bit_elf ? sizeof (Elf32_External_Phdr) : sizeof (Elf64_External_Phdr))
++      >= current_file_size)
++    {
++      error (_("Too many program headers - %#x - the file is not that big\n"),
++	     elf_header.e_phnum);
++      return FALSE;
++    }
+ 
++  phdrs = (Elf_Internal_Phdr *) cmalloc (elf_header.e_phnum,
++					 sizeof (Elf_Internal_Phdr));
+   if (phdrs == NULL)
+     {
+       error (_("Out of memory reading %u program headers\n"),
+Index: git/binutils/ChangeLog
+===================================================================
+--- git.orig/binutils/ChangeLog
++++ git/binutils/ChangeLog
+@@ -1,5 +1,11 @@
+ 2017-04-03  Nick Clifton  <nickc@redhat.com>
+ 
++       PR binutils/21345
++       * readelf.c (get_program_headers): Check for there being too many
++       program headers before attempting to allocate space for them.
++
++2017-04-03  Nick Clifton  <nickc@redhat.com>
++
+        PR binutils/21343
+        * readelf.c (get_unwind_section_word): Fix snafu checking for
+        invalid word offsets in ARM unwind information.
-- 
2.7.4


