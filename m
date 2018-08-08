Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com
	[209.85.218.47])
	by mail.openembedded.org (Postfix) with ESMTP id 4C86D78D97
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 21:54:27 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id s198-v6so6374637oih.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 14:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=0j6IaJO03Whf5BIJ7WYeqWYL6cXGNfjedF/tb/ECGe4=;
	b=I6TneqdkiIglyLzMa271qA1Z1GkKdyDEJFcab6gTF/oomixDS5MgdEwG9s9P5w8cRE
	ZDK8dtT3BZmSQ1Y1KVGKMtQgeaFri5WcxNnN4DGGA7gdna0fXQ6rs3bTaXRSRMeOGiLx
	msTVKjkvNSSYHgZxRhtxOlYefcDJ7buF9nzRI/u5e6zBg0K3p+8SrsplvfoKHi2//Cn+
	6e2Jtqy2f2ECXUIyAEsmO5JRwa5A4nsECpyozyDynveE/hJotSgJOdpo5pm2xEP+Hc3/
	+XuQnpmfHys50HwfvXnz5rnKvE7edMVpthpAnSUNdz8EfIIhSLJL7T1c29+mSlBa1JUx
	sqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=0j6IaJO03Whf5BIJ7WYeqWYL6cXGNfjedF/tb/ECGe4=;
	b=NTgWmxvhFgIV8jqeF/KSQyZ4a5u3KQNLUPVAeIWtr3aLUPzoE84JTSU5BcP7nawCeQ
	k57IMnGEsVARss1nFySvzNEp+GM2W6oW00cB7JUO4Iusrw88ipYkFbcJbelOQjbz0G42
	z9vFNCIkh0+4YfPWNAYcaiYL/OLAWiIHnG+CLtuJInou5ekIFAk3Yss6oilm9U4bVNE5
	NTieXISYvdY5ZKhOoUmF3/BeLYnanIsIbE5lShdMDeCeOncJ/DJWW6P1sFY20fhNhpxR
	ZXSJ1rVPV5wLkGeVwueYkOIuRk3O0kO3pnfMdfGnzblNzY001fECqK5KZy6eTYlC5AY8
	EdcQ==
X-Gm-Message-State: AOUpUlEaC5GAGSqhSV8/wgdNQKmWeYwyCuRx2D8azwRgBNutQzX7XcW2
	0q9tKQP8cdIE+eWzuRL+FfI=
X-Google-Smtp-Source: AA+uWPw9154SALtRhyE1FUbVfPxeq12J0ExBZgdO4uaYy32Y7nyW92g25Y/LKwh/WfEf0ZyHnLxWZg==
X-Received: by 2002:aca:d48c:: with SMTP id
	l134-v6mr5162553oig.15.1533765268476; 
	Wed, 08 Aug 2018 14:54:28 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:7d5f:b84e:a37e:2b6c])
	by smtp.gmail.com with ESMTPSA id
	s3-v6sm3384122oif.22.2018.08.08.14.54.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Aug 2018 14:54:28 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 14:54:14 -0700
Message-Id: <1533765259-10091-7-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533765259-10091-1-git-send-email-akuster808@gmail.com>
References: <1533765259-10091-1-git-send-email-akuster808@gmail.com>
Subject: [ROCKO][PATCH 07/12] Binutils: Security fix for CVE-2018-6323
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
X-List-Received-Date: Wed, 08 Aug 2018 21:54:27 -0000

From: Armin Kuster <akuster@mvista.com>

Affected: <= 2.29.1

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/binutils/binutils-2.29.1.inc |  1 +
 .../binutils/binutils/CVE-2018-6323.patch          | 55 ++++++++++++++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2018-6323.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.29.1.inc b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
index 2f9b4fe..db7305a 100644
--- a/meta/recipes-devtools/binutils/binutils-2.29.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
@@ -70,6 +70,7 @@ SRC_URI = "\
      file://CVE-2018-10534.patch \
      file://CVE-2018-10535.patch \
      file://CVE-2018-13033.patch \
+     file://CVE-2018-6323.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2018-6323.patch b/meta/recipes-devtools/binutils/binutils/CVE-2018-6323.patch
new file mode 100644
index 0000000..2c6b1b2
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2018-6323.patch
@@ -0,0 +1,55 @@
+From 38e64b0ecc7f4ee64a02514b8d532782ac057fa2 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Thu, 25 Jan 2018 21:47:41 +1030
+Subject: [PATCH] PR22746, crash when running 32-bit objdump on corrupted file
+
+Avoid unsigned int overflow by performing bfd_size_type multiplication.
+
+	PR 22746
+	* elfcode.h (elf_object_p): Avoid integer overflow.
+
+Upstream-Status: Backport
+Affects: <= 2.29.1
+CVE: CVE-2018-6323
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog | 5 +++++
+ bfd/elfcode.h | 4 ++--
+ 2 files changed, 7 insertions(+), 2 deletions(-)
+
+Index: git/bfd/elfcode.h
+===================================================================
+--- git.orig/bfd/elfcode.h
++++ git/bfd/elfcode.h
+@@ -680,7 +680,7 @@ elf_object_p (bfd *abfd)
+       if (i_ehdrp->e_shnum > ((bfd_size_type) -1) / sizeof (*i_shdrp))
+ 	goto got_wrong_format_error;
+ #endif
+-      amt = sizeof (*i_shdrp) * i_ehdrp->e_shnum;
++      amt = sizeof (*i_shdrp) * (bfd_size_type) i_ehdrp->e_shnum;
+       i_shdrp = (Elf_Internal_Shdr *) bfd_alloc (abfd, amt);
+       if (!i_shdrp)
+ 	goto got_no_match;
+@@ -776,7 +776,7 @@ elf_object_p (bfd *abfd)
+       if (i_ehdrp->e_phnum > ((bfd_size_type) -1) / sizeof (*i_phdr))
+ 	goto got_wrong_format_error;
+ #endif
+-      amt = i_ehdrp->e_phnum * sizeof (*i_phdr);
++      amt = (bfd_size_type) i_ehdrp->e_phnum * sizeof (*i_phdr);
+       elf_tdata (abfd)->phdr = (Elf_Internal_Phdr *) bfd_alloc (abfd, amt);
+       if (elf_tdata (abfd)->phdr == NULL)
+ 	goto got_no_match;
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -1,3 +1,8 @@
++2018-01-25  Alan Modra  <amodra@gmail.com>
++
++       PR 22746
++       * elfcode.h (elf_object_p): Avoid integer overflow.
++
+ 2018-05-08  Nick Clifton  <nickc@redhat.com>
+ 
+        PR 22809
-- 
2.7.4


