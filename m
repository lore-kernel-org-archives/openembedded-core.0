Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 660A278D5B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 21:54:26 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id w126-v6so6406386oie.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 14:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=KufUlRwHknP6jRxKZYeqKqIeT2Z5ZfWkAHQKbgLCWe4=;
	b=mXoUwh3RFzmrM5bpH5jcIgqhD83LJWJROX9DDq209RHoaXzZXzS2Dy1mlxGOjw03Qp
	kRKDCi5BuvCkyPyHeSlhpqIJ6lFLtkDi4FKnJIDJJPbi+OyIJ/ld4HHeDXg7u/lurOg2
	ZW583yQC/bsB25+L/rpLPAFV/mzniOxY33kCzm3T71uRnm8fKkuhYCRxFsGfAfTNVASS
	5DJ/+Y9G6CVqSXrJAZFnnfTtqTss/hiYK3+4m0aRBmuTaUcvcJWlMmq4ZB+naXnGpqqk
	KnJgjWSTtqN0/VTqkEUfvUGoBDEwoCOrbx+rLa7UBuuMvAlOQM/qteKI7u6naegcMejs
	cE6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=KufUlRwHknP6jRxKZYeqKqIeT2Z5ZfWkAHQKbgLCWe4=;
	b=VnRJf08WK8BkxkB964Dd/PW0cD/tPVjjBrnsCxMhRvw2GehEtRwxh8UhoTvHJuvpR0
	d3eWsyxCfoteuO2BXpy95NKNs6RH0evi/aS/WxUFZK+9gx8MXLg8OrcxYYOeSA+Qk7x6
	EIbQhFfIkNmtTtcm7oq3K3HDRaScAPgq/HCa2cDQU9jazISNjF5RM/jYfJ3tVB9SbBHe
	Td5u55DXT5TCYSe+Llnj+Y7nLQytlcd08rYTkW+BU341kR/t7RJdM1o7w8Rr9Fv2F3tt
	Z9JZ8mihIqOhERQi9KZnAVAOelGjF/JGXTH1NM0NpiLWqUHA7/jQEuajSuiG69gCjZv1
	79Dw==
X-Gm-Message-State: AOUpUlGRD0IqrUQDKrcr3HwYxC703cx+o02IDt2VA1NCiDh50nimG1qS
	ze4VRkdSD7Go1K7e424dCCo=
X-Google-Smtp-Source: AA+uWPxQ91Qz54Zc6SxL+pzX3bIXihYTF2b65Axe2jS+tKsXZZZ1Ja0GufLq1TdwUEYOn5/tFJWc6A==
X-Received: by 2002:aca:d452:: with SMTP id
	l79-v6mr4477088oig.222.1533765267559; 
	Wed, 08 Aug 2018 14:54:27 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:7d5f:b84e:a37e:2b6c])
	by smtp.gmail.com with ESMTPSA id
	s3-v6sm3384122oif.22.2018.08.08.14.54.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Aug 2018 14:54:27 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 14:54:13 -0700
Message-Id: <1533765259-10091-6-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533765259-10091-1-git-send-email-akuster808@gmail.com>
References: <1533765259-10091-1-git-send-email-akuster808@gmail.com>
Subject: [ROCKO][PATCH 06/12] Binutils: Security fix for CVE-2018-13033
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
X-List-Received-Date: Wed, 08 Aug 2018 21:54:26 -0000

From: Armin Kuster <akuster@mvista.com>

Affects: <= 2.30

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/binutils/binutils-2.29.1.inc |  1 +
 .../binutils/binutils/CVE-2018-13033.patch         | 71 ++++++++++++++++++++++
 2 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2018-13033.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.29.1.inc b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
index 4d9983b..2f9b4fe 100644
--- a/meta/recipes-devtools/binutils/binutils-2.29.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
@@ -69,6 +69,7 @@ SRC_URI = "\
      file://CVE-2018-10373.patch \
      file://CVE-2018-10534.patch \
      file://CVE-2018-10535.patch \
+     file://CVE-2018-13033.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2018-13033.patch b/meta/recipes-devtools/binutils/binutils/CVE-2018-13033.patch
new file mode 100644
index 0000000..3fa852c
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2018-13033.patch
@@ -0,0 +1,71 @@
+From 95a6d23566165208853a68d9cd3c6eedca840ec6 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Tue, 8 May 2018 12:51:06 +0100
+Subject: [PATCH] Prevent a memory exhaustion failure when running objdump on a
+ fuzzed input file with corrupt string and attribute sections.
+
+	PR 22809
+	* elf.c (bfd_elf_get_str_section): Check for an excessively large
+	string section.
+	* elf-attrs.c (_bfd_elf_parse_attributes): Issue an error if the
+	attribute section is larger than the size of the file.
+
+Upstream-Status: Backport
+Affects: <= 2.30
+CVE: CVE-2018-13033
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog   | 8 ++++++++
+ bfd/elf-attrs.c | 9 +++++++++
+ bfd/elf.c       | 1 +
+ 3 files changed, 18 insertions(+)
+
+Index: git/bfd/elf-attrs.c
+===================================================================
+--- git.orig/bfd/elf-attrs.c
++++ git/bfd/elf-attrs.c
+@@ -438,6 +438,15 @@ _bfd_elf_parse_attributes (bfd *abfd, El
+   /* PR 17512: file: 2844a11d.  */
+   if (hdr->sh_size == 0)
+     return;
++  if (hdr->sh_size > bfd_get_file_size (abfd))
++    {
++      /* xgettext:c-format */
++      _bfd_error_handler (_("%pB: error: attribute section '%pA' too big: %#llx"),
++			  abfd, hdr->bfd_section, (long long) hdr->sh_size);
++      bfd_set_error (bfd_error_invalid_operation);
++      return;
++    }
++
+   contents = (bfd_byte *) bfd_malloc (hdr->sh_size + 1);
+   if (!contents)
+     return;
+Index: git/bfd/elf.c
+===================================================================
+--- git.orig/bfd/elf.c
++++ git/bfd/elf.c
+@@ -297,6 +297,7 @@ bfd_elf_get_str_section (bfd *abfd, unsi
+       /* Allocate and clear an extra byte at the end, to prevent crashes
+ 	 in case the string table is not terminated.  */
+       if (shstrtabsize + 1 <= 1
++	  || shstrtabsize > bfd_get_file_size (abfd)
+ 	  || bfd_seek (abfd, offset, SEEK_SET) != 0
+ 	  || (shstrtab = (bfd_byte *) bfd_alloc (abfd, shstrtabsize + 1)) == NULL)
+ 	shstrtab = NULL;
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -1,3 +1,11 @@
++2018-05-08  Nick Clifton  <nickc@redhat.com>
++
++       PR 22809
++       * elf.c (bfd_elf_get_str_section): Check for an excessively large
++       string section.
++       * elf-attrs.c (_bfd_elf_parse_attributes): Issue an error if the
++       attribute section is larger than the size of the file.
++
+ 2018-04-24  Nick Clifton  <nickc@redhat.com>
+  
+        PR 23113
-- 
2.7.4


