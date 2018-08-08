Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	by mail.openembedded.org (Postfix) with ESMTP id 38AF976078
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 21:54:21 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id b15-v6so6373024oib.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 14:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=bAcr6Vh5AssNQT6TRw477cIjr4duIx+nG92XVhnyq20=;
	b=CS987pImcyaguM+qlH4b7veSnMWXnDiVD6JucrDxgb7a5qTw/ed1YFDUm+OU4DOZ6j
	F5M+8GTZK9Y49TCwKcNb9LVU6/qvp9cR+4MvMJgWO6VzvYIphYvQ3JCuzNr3dLI8Zv+M
	cpwSgftzIw0dA2XYEIVXP5auj28in2MdaEnSm6Cg0dSmD9YFKlntvWJT0FXqjl/FjLt9
	my+ur6tDBZM6j4ZY2ie+q/lLNqSunk8YHVoADfPD/Pha3fV5rr7DjBN/KsVtJkk+dOHV
	Zr8g6YJtWVvskL/WxcOgRIwZ6Y7WPDaGnPk3I6q3QOvtQ8BZKe7/+SwXaor3JOtnuDHT
	OC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=bAcr6Vh5AssNQT6TRw477cIjr4duIx+nG92XVhnyq20=;
	b=PcJCiqDlJC+tAWYO56KoK5nlxKTJVLG2CA2DFJqyPVvjl3HQPO3ArbaXQj5yB4W5XL
	m3QM3wSx5Bitr8h5gr2klq4exBZlILZ/l0vltpfDP50uvXJQmUyj9y+vTlOmrhUoW9sr
	tpulsIALOJ6Ku5v6C30H6GBkwZK2nj/rLilBkIE616oWWjLnp2DhnfzMQti/u7vZBLxU
	SgiqH93wD8z7kt0lcMPBtxQIQhJJehUr8ytd2T/L2HjCGwBE4y/SgVD40RljYzM54hWl
	DsAV0tlbhuCM+/L3p3cxccLP2DLc0sIeJw1tA8O5ZhqCL8YfMNa1EZH9qEpsJ59AVrgq
	P5qQ==
X-Gm-Message-State: AOUpUlHYnH8ngkB1RCIKXfx9gAQb9XphpM3k09N6dZVQynYBT8MnT7t8
	pTg8diPlc5PAE1AqAt0MwNs=
X-Google-Smtp-Source: AA+uWPxODUHkrcQWttKQAT5lPvUHlf/GJHGdwFNzYWB+oe3ZwGBqCzU4osNYi1qbO5SwW9zYtu65tA==
X-Received: by 2002:aca:2c89:: with SMTP id
	s131-v6mr4490233ois.171.1533765262075; 
	Wed, 08 Aug 2018 14:54:22 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:7d5f:b84e:a37e:2b6c])
	by smtp.gmail.com with ESMTPSA id
	s3-v6sm3384122oif.22.2018.08.08.14.54.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Aug 2018 14:54:21 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 14:54:08 -0700
Message-Id: <1533765259-10091-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [ROCKO][PATCH 01/12] binutils: Security fix for CVE-2017-17123
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
X-List-Received-Date: Wed, 08 Aug 2018 21:54:21 -0000

From: Armin Kuster <akuster@mvista.com>

Affects: <= 2.29.1

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/binutils/binutils-2.29.1.inc |  1 +
 .../binutils/binutils/CVE-2017-17123.patch         | 33 ++++++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-17123.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.29.1.inc b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
index f80b59a..8fe897e 100644
--- a/meta/recipes-devtools/binutils/binutils-2.29.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
@@ -64,6 +64,7 @@ SRC_URI = "\
      file://CVE-2017-17121.patch \
      file://CVE-2017-17122.patch \
      file://CVE-2017-17125.patch \
+     file://CVE-2017-17123.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-17123.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-17123.patch
new file mode 100644
index 0000000..0841210
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-17123.patch
@@ -0,0 +1,33 @@
+From 4581a1c7d304ce14e714b27522ebf3d0188d6543 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Wed, 29 Nov 2017 17:12:12 +0000
+Subject: [PATCH] Check for a NULL symbol pointer when reading relocs from a
+ COFF based file.
+
+	PR 22509
+	* coffcode.h (coff_slurp_reloc_table): Check for a NULL symbol
+	pointer when processing relocs.
+
+Upstream-Status: Backport
+Affects: <= 2.29.1
+CVE: CVE-2017-17123
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog  | 6 ++++++
+ bfd/coffcode.h | 2 +-
+ 2 files changed, 7 insertions(+), 1 deletion(-)
+
+Index: git/bfd/coffcode.h
+===================================================================
+--- git.orig/bfd/coffcode.h
++++ git/bfd/coffcode.h
+@@ -5326,7 +5326,7 @@ coff_slurp_reloc_table (bfd * abfd, sec_
+ #else
+       cache_ptr->address = dst.r_vaddr;
+ 
+-      if (dst.r_symndx != -1)
++      if (dst.r_symndx != -1 && symbols != NULL)
+ 	{
+ 	  if (dst.r_symndx < 0 || dst.r_symndx >= obj_conv_table_size (abfd))
+ 	    {
-- 
2.7.4


