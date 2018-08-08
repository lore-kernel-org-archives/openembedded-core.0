Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f54.google.com (mail-pl0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id 10C5E78E7A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 15:35:46 +0000 (UTC)
Received: by mail-pl0-f54.google.com with SMTP id w3-v6so1200969plq.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 08:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=4tNsZGmm55kviSmw+yUQkn6IisRA2OYXlKXLm9IwvAk=;
	b=pAyRCMQlvFbXuHZkn/DtuWXmQbnA+E4QpSekTp0p1zxEd2eRFwKuJjY82VXggBFznt
	3qCJHeR/p9IsXGNC1PluMqMxdzlVPHVtyzTraR8ykRa9EWguvgQA9KJr51kpCkQMkGxf
	lulrkKPSCpYjAVdtE2/JNaS8WulB0K8oml2b0N1NnTe3+0J2B7p+NlnUPOHAqSTRCNcu
	mE/t/pV8PEAbmoTsn7rvEHA+il29GAHbFKtYxy410Wt4WL3/64Y2ey5i61sw55G9mfpi
	ecBpJrDccX3etCnkSX8eJAvREEJJZLqXRSfzTzmSdEDKUmckpN04TrEHs4bWgjMHDj++
	KXyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=4tNsZGmm55kviSmw+yUQkn6IisRA2OYXlKXLm9IwvAk=;
	b=P8uBtlyYJuPHe/kR5DgSgN60s0843VilTAf+rXfWHkSzsDpTpTRI2LTrSlarx8q2tT
	BWG7gvEVhEQtAb8X1GDe5ISSDYsBocj/ZXMTaf3vfNZc4Fs9EucgsFxcpnnJQLPcJzOT
	prgVSSpcpGYrPLgVK3IVMljB3QRqzbypqBbVynQ/+MmtBMXcOgUJRN3XoaY+IZ1ALTrT
	35kGj/JENoeuYWZOWe8brcgwAeHfl1VE7/LvTDIUL2LUlVu4cXzCI9CJp8bOmdujHic3
	Lan8N6TUWCCckAEVI9BtIMYMU8ARm0lUVM+Eo2yD9VlJ83K5hWyBRCOnzWPpQSmHC7ec
	FHdQ==
X-Gm-Message-State: AOUpUlFaxDItar3Q21kSPkio8BvMlpVFRCfL8ddNrrrWr9BU6AKLc8Ls
	Xie+MYAysaucO+T2vxUumlvlYk9w
X-Google-Smtp-Source: AA+uWPwpyvEHdt26M3KiFBgt89l9+6+AEO4cG+f7u6DcLZBZuDB2ic7N93gl28crooEQ/0C4jwHHSQ==
X-Received: by 2002:a17:902:28aa:: with SMTP id
	f39-v6mr3083207plb.150.1533742547335; 
	Wed, 08 Aug 2018 08:35:47 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:7d5f:b84e:a37e:2b6c])
	by smtp.gmail.com with ESMTPSA id
	q78-v6sm8290927pfi.185.2018.08.08.08.35.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Aug 2018 08:35:46 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 08:35:19 -0700
Message-Id: <1533742522-24357-24-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
References: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
Subject: [ROCKO][PATCH 24/27] binutls: Security fix for CVE-2017-17080
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
X-List-Received-Date: Wed, 08 Aug 2018 15:35:46 -0000

From: Armin Kuster <akuster@mvista.com>

Affects: <= 2.29.1

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/binutils/binutils-2.29.1.inc |  1 +
 .../binutils/binutils/CVE-2017-17080.patch         | 78 ++++++++++++++++++++++
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-17080.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.29.1.inc b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
index b1842cb..3617b20 100644
--- a/meta/recipes-devtools/binutils/binutils-2.29.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
@@ -60,6 +60,7 @@ SRC_URI = "\
      file://CVE-2017-16830.patch \
      file://CVE-2017-16831.patch \
      file://CVE-2017-16832.patch \
+     file://CVE-2017-17080.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-17080.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-17080.patch
new file mode 100644
index 0000000..611a276
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-17080.patch
@@ -0,0 +1,78 @@
+From 80a0437873045cc08753fcac4af154e2931a99fd Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Thu, 16 Nov 2017 14:53:32 +0000
+Subject: [PATCH] Prevent illegal memory accesses when parsing incorrecctly
+ formated core notes.
+
+	PR 22421
+	* elf.c (elfcore_grok_netbsd_procinfo): Check that the note is big enough.
+	(elfcore_grok_openbsd_procinfo): Likewise.
+	(elfcore_grok_nto_status): Likewise.
+
+Upstream-Status: Backport
+Affects: <= 2.29.1
+CVE: CVE-2017-17080 
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog |  7 +++++++
+ bfd/elf.c     | 10 ++++++++++
+ 2 files changed, 17 insertions(+)
+
+Index: git/bfd/elf.c
+===================================================================
+--- git.orig/bfd/elf.c
++++ git/bfd/elf.c
+@@ -9862,6 +9862,7 @@ elfcore_grok_freebsd_psinfo (bfd *abfd,
+   /* Check for version 1 in pr_version.  */
+   if (bfd_h_get_32 (abfd, (bfd_byte *) note->descdata) != 1)
+     return FALSE;
++
+   offset = 4;
+ 
+   /* Skip over pr_psinfosz. */
+@@ -10030,6 +10031,9 @@ elfcore_netbsd_get_lwpid (Elf_Internal_N
+ static bfd_boolean
+ elfcore_grok_netbsd_procinfo (bfd *abfd, Elf_Internal_Note *note)
+ {
++  if (note->descsz <= 0x7c + 31)
++    return FALSE;
++
+   /* Signal number at offset 0x08. */
+   elf_tdata (abfd)->core->signal
+     = bfd_h_get_32 (abfd, (bfd_byte *) note->descdata + 0x08);
+@@ -10114,6 +10118,9 @@ elfcore_grok_netbsd_note (bfd *abfd, Elf
+ static bfd_boolean
+ elfcore_grok_openbsd_procinfo (bfd *abfd, Elf_Internal_Note *note)
+ {
++  if (note->descsz <= 0x48 + 31)
++    return FALSE;
++
+   /* Signal number at offset 0x08. */
+   elf_tdata (abfd)->core->signal
+     = bfd_h_get_32 (abfd, (bfd_byte *) note->descdata + 0x08);
+@@ -10185,6 +10192,9 @@ elfcore_grok_nto_status (bfd *abfd, Elf_
+   short sig;
+   unsigned flags;
+ 
++  if (note->descsz < 16)
++    return FALSE;
++
+   /* nto_procfs_status 'pid' field is at offset 0.  */
+   elf_tdata (abfd)->core->pid = bfd_get_32 (abfd, (bfd_byte *) ddata);
+ 
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -1,3 +1,10 @@
++2017-11-16  Nick Clifton  <nickc@redhat.com>
++ 
++       PR 22421
++       * elf.c (elfcore_grok_netbsd_procinfo): Check that the note is big enough.
++       (elfcore_grok_openbsd_procinfo): Likewise.
++       (elfcore_grok_nto_status): Likewise.
++
+ 2017-10-31  Nick Clifton  <nickc@redhat.com>
+ 
+        PR 22373
-- 
2.7.4


