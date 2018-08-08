Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f46.google.com (mail-pl0-f46.google.com
	[209.85.160.46])
	by mail.openembedded.org (Postfix) with ESMTP id 3767A78EBD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 15:35:45 +0000 (UTC)
Received: by mail-pl0-f46.google.com with SMTP id w3-v6so1200946plq.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 08:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=PZQix0Oy+E2NJfEz/lLrYgr/vc278RXIPW1W9P7/OJQ=;
	b=RROhSP4yPN0FavYqoeMKoW88YRDehs+c+n2yxlb3GXG8myLrRJb/Rb+fZkY5dojVbO
	I5qesc5TRMdlqHiUokcJIGGRF5QAaH9v929el+IB+74NK7c9O+POBRpX3JPlebvPxkKA
	TuVxu0Tzwd8HiW7bY2TS+EH+HAelF2inkGGILFd5C4g1uFzecELt2OOGEVYwdJSxR+At
	IcdZqy/naj/y9KHNgt8sZ0OGqtTWUYlnCw7tyY75QqQ71ssO8ar2TIfKjrtvB3wq5dzb
	fC8t7BVVS3jZzNxVdDD/kfiKG36icYaLrOaUkrlK/H4SamCpFHunkW7POd4IK4qD4DgS
	qxgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=PZQix0Oy+E2NJfEz/lLrYgr/vc278RXIPW1W9P7/OJQ=;
	b=RjYoXm5RaZAkkL1SXMD7p1vbvTTLlWeQ8AZCmCNvyRphul4SO0tgqk8fecykRs2l80
	9Oi8pl9YHNUepN3OyyK82x6STV4n0MxvemQlrrZGcEoIuITYJ7sdwmr2boXcVcY+TBwJ
	fsMs+WWsV42YvmbTYXO9sBqQ6qqgTQr1if8emBiVkAhGjjQhfr6L1XlDpa/x6K/KBRjz
	5oRE8QejuXZNnH8y9ttyAkiVkYQvnwqoxqu5kVBWUa/7e3aqV1tMtWVZnq/bVpqinWV3
	opBMgZNHHCOcLjK4t2pGUghprw/RiKT13bnd0usHkQfOAqBN5M9TMqSNU7k7KWKCJ+2q
	Bjxg==
X-Gm-Message-State: AOUpUlFoeIqWGJ0s+zO+jbXnLx8RqvpUmOwzICRNJUAe/x+MlgH5p2Kp
	81i1N6DQ2H9Qsz5CGavLiGU=
X-Google-Smtp-Source: AA+uWPz7lG5OvDZcJW8O7tFUGgp2dde8vIxrxzyIoekBLa7cMThoNSa3+ppoQ7OOZ15WaKvv6trlyA==
X-Received: by 2002:a17:902:bb85:: with SMTP id
	m5-v6mr3023437pls.46.1533742546450; 
	Wed, 08 Aug 2018 08:35:46 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:7d5f:b84e:a37e:2b6c])
	by smtp.gmail.com with ESMTPSA id
	q78-v6sm8290927pfi.185.2018.08.08.08.35.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Aug 2018 08:35:46 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 08:35:18 -0700
Message-Id: <1533742522-24357-23-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
References: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
Subject: [ROCKO][PATCH 23/27] binutls: Security fix for CVE-2017-16832
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
X-List-Received-Date: Wed, 08 Aug 2018 15:35:45 -0000

From: Armin Kuster <akuster@mvista.com>

Affects: <= 2.29.1

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/binutils/binutils-2.29.1.inc |  1 +
 .../binutils/binutils/CVE-2017-16832.patch         | 61 ++++++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-16832.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.29.1.inc b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
index d9758c4..b1842cb 100644
--- a/meta/recipes-devtools/binutils/binutils-2.29.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
@@ -59,6 +59,7 @@ SRC_URI = "\
      file://CVE-2017-16829.patch \
      file://CVE-2017-16830.patch \
      file://CVE-2017-16831.patch \
+     file://CVE-2017-16832.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-16832.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-16832.patch
new file mode 100644
index 0000000..9044bcc
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-16832.patch
@@ -0,0 +1,61 @@
+From 0bb6961f18b8e832d88b490d421ca56cea16c45b Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Tue, 31 Oct 2017 14:29:40 +0000
+Subject: [PATCH] Fix illegal memory access triggered when parsing a PE binary
+ with a corrupt data dictionary.
+
+	PR 22373
+	* peicode.h (pe_bfd_read_buildid): Check for invalid size and data
+	offset values.
+
+Upstrem-Status: Backport
+Affects: <= 2.29.1
+CVE: CVE-2017-16832
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog | 6 ++++++
+ bfd/peicode.h | 9 ++++++---
+ 2 files changed, 12 insertions(+), 3 deletions(-)
+
+Index: git/bfd/peicode.h
+===================================================================
+--- git.orig/bfd/peicode.h
++++ git/bfd/peicode.h
+@@ -1303,7 +1303,6 @@ pe_bfd_read_buildid (bfd *abfd)
+   bfd_byte *data = 0;
+   bfd_size_type dataoff;
+   unsigned int i;
+-
+   bfd_vma addr = extra->DataDirectory[PE_DEBUG_DATA].VirtualAddress;
+   bfd_size_type size = extra->DataDirectory[PE_DEBUG_DATA].Size;
+ 
+@@ -1327,8 +1326,12 @@ pe_bfd_read_buildid (bfd *abfd)
+ 
+   dataoff = addr - section->vma;
+ 
+-  /* PR 20605: Make sure that the data is really there.  */
+-  if (dataoff + size > section->size)
++  /* PR 20605 and 22373: Make sure that the data is really there.
++     Note - since we are dealing with unsigned quantities we have
++     to be careful to check for potential overflows.  */
++  if (dataoff > section->size
++      || size > section->size
++      || dataoff + size > section->size)
+     {
+       _bfd_error_handler (_("%B: Error: Debug Data ends beyond end of debug directory."),
+ 			  abfd);
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -1,3 +1,9 @@
++2017-10-31  Nick Clifton  <nickc@redhat.com>
++
++       PR 22373
++       * peicode.h (pe_bfd_read_buildid): Check for invalid size and data
++       offset values.
++
+ 2017-11-03  Mingi Cho  <mgcho.minic@gmail.com>
+            Nick Clifton  <nickc@redhat.com>
+ 
-- 
2.7.4


