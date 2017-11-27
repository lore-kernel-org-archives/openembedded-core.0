Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id A147977D16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 02:35:19 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id 61so7604047plf.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Nov 2017 18:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=K+RzKPi9Gnp8VE3b++9Si/7B5TBiEkJiR/cV6QFarFo=;
	b=cp3xO6tDn+A2HN6CYK9d56K61KQYPNQUvwr95WoWsUVZJXkn2jIx1HVZZ6zB/N/H6K
	SPIhUJJiLR4x0Glh6BsRklggdfnasfehMqTt5lqNONHOkoUlDWap7JJpEeyc5MkqUgPJ
	4m4QoSjimdbEG/Li6LqbrJgIo6uK1IJF2oi9T8RRr7NGZcqGQfTmP5++6tlxndYrY3ms
	ph9xqUKblteBzJWdik9l1R4171sMqGmxGr0N09iyCmJjcbtXO8zYDCrBhzi/VF4q7brO
	sZI5vcHilDvC+s5eFYEhrrw83loKcpiuKH/ImaZWLs/E5pR63pWsH5crPd+Iv+zmZlII
	dIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=K+RzKPi9Gnp8VE3b++9Si/7B5TBiEkJiR/cV6QFarFo=;
	b=bsgnJ4gs5DIE8JvvGIjqbGQkB1cNAG4PiMyH6Y2WC/i1YLxGevM+TM33A30YNHauka
	ZB9nW0PGhTdHK3sdraXqsBRMNSq3rvoi1zSPnt23Iau0iCWNaTQf2KuLyMf+3UK1w9qm
	0LNe8j4eyYlEELGiuKHsdMoxr/qpU77ou4GjdOYPd1KAKsjS8E9QUfF9eO4huuDLIzjh
	GGg70RGu6FTFVcNCQ1Mox4GXMmUiCQibmllSJcJ3QutNFu+P+vG35LF8wk0y9sXMQJGt
	2CbTdzjF+5GxLzbnxnnwSfTOaeF1NhGg782Ld9UhsIhI9g91u0Erbcolx51HZqLuLJyt
	pgUg==
X-Gm-Message-State: AJaThX63/7ANRG1Ew23cmYV8lWRs4QJUAUJMm8gZYJXR8PU1lnyNs/1B
	W4FFPb1HjdSVSQcL2SFtFVLnfg==
X-Google-Smtp-Source: AGs4zMbSgro9Dqc03w9iFUaaugTWZB56Kttpk9s07OTT11HuG9F6r7WSARPl0XGIPZPpqKawzeOavg==
X-Received: by 10.84.240.7 with SMTP id y7mr3889260plk.269.1511750121300;
	Sun, 26 Nov 2017 18:35:21 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:b082:a618:f613:3498])
	by smtp.gmail.com with ESMTPSA id
	e3sm17809103pfe.92.2017.11.26.18.35.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 26 Nov 2017 18:35:20 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sun, 26 Nov 2017 18:34:54 -0800
Message-Id: <1511750112-2263-8-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1511750112-2263-1-git-send-email-akuster808@gmail.com>
References: <1511750112-2263-1-git-send-email-akuster808@gmail.com>
Subject: [pyro][PATCH 08/26] binutils: Security fix CVE-2017-8421
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
X-List-Received-Date: Mon, 27 Nov 2017 02:35:19 -0000

Affects: <= 2.28

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.28.inc   |  1 +
 .../binutils/binutils/CVE-2017-8421.patch          | 52 ++++++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-8421.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.28.inc b/meta/recipes-devtools/binutils/binutils-2.28.inc
index d58d7b8..5b6270a 100644
--- a/meta/recipes-devtools/binutils/binutils-2.28.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.28.inc
@@ -50,6 +50,7 @@ SRC_URI = "\
      file://CVE-2017-8395.patch \
      file://CVE-2017-8396_8397.patch \
      file://CVE-2017-8398.patch \
+     file://CVE-2017-8421.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-8421.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-8421.patch
new file mode 100644
index 0000000..7969c66
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-8421.patch
@@ -0,0 +1,52 @@
+From 39ff1b79f687b65f4144ddb379f22587003443fb Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Tue, 2 May 2017 11:54:53 +0100
+Subject: [PATCH] Prevent memory exhaustion from a corrupt PE binary with an
+ overlarge number of relocs.
+
+	PR 21440
+	* objdump.c (dump_relocs_in_section): Check for an excessive
+	number of relocs before attempting to dump them.
+
+Upstream-Status: Backport
+CVE: CVE-2017-8421
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ binutils/ChangeLog | 6 ++++++
+ binutils/objdump.c | 8 ++++++++
+ 2 files changed, 14 insertions(+)
+
+Index: git/binutils/objdump.c
+===================================================================
+--- git.orig/binutils/objdump.c
++++ git/binutils/objdump.c
+@@ -3311,6 +3311,14 @@ dump_relocs_in_section (bfd *abfd,
+       return;
+     }
+ 
++  if ((bfd_get_file_flags (abfd) & (BFD_IN_MEMORY | BFD_LINKER_CREATED)) == 0
++      && relsize > get_file_size (bfd_get_filename (abfd)))
++    {
++      printf (" (too many: 0x%x)\n", section->reloc_count);
++      bfd_set_error (bfd_error_file_truncated);
++      bfd_fatal (bfd_get_filename (abfd));
++    }
++
+   relpp = (arelent **) xmalloc (relsize);
+   relcount = bfd_canonicalize_reloc (abfd, section, relpp, syms);
+ 
+Index: git/binutils/ChangeLog
+===================================================================
+--- git.orig/binutils/ChangeLog
++++ git/binutils/ChangeLog
+@@ -1,3 +1,9 @@
++2017-05-02  Nick Clifton  <nickc@redhat.com>
++
++       PR 21440
++       * objdump.c (dump_relocs_in_section): Check for an excessive
++       number of relocs before attempting to dump them.
++
+ 2017-04-28  Nick Clifton  <nickc@redhat.com>
+ 
+        PR binutils/21438
-- 
2.7.4


