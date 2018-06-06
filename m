Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 2828D77F76
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jun 2018 21:37:36 +0000 (UTC)
Received: by mail-pf0-f179.google.com with SMTP id b17-v6so3773570pfi.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jun 2018 14:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gwTlB22MEUaHe/pTB1MXianPPXtqY2SNLnPqxEsoCUQ=;
	b=LIlLX9fkCly9ZypBH6NJeIzzkJMd9CVlGG3cQ//QkIEAk5XSH4GIVeWscqQjTCmasI
	RQs5VV1rcAaYjWtdIZylzijw0aWBdvIZKPlSWO7zq84cFc6P9DEZ6cY+UCwgbBcEdiPC
	mG+hQ+m8M3p77JYylxFpCEL+VlktLOMfUU64LyphT0pGhaaQEBenpIiP/1Un5/eVw0YB
	CbS1elxV53kdPRkCcv1ENfQB6ufmroeYVjns1GvExhFlUzgtlI+ZBFjvD5/6/1hPgjWx
	8F8z/MXE5eI3iHUTwF2n9RY5isMmDlj+vctkMBx8pGxWGeV0FhVSNMGrBmadqsnnhHp8
	s7dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=gwTlB22MEUaHe/pTB1MXianPPXtqY2SNLnPqxEsoCUQ=;
	b=Y2gvHAc6JitLKWD+xoOk+0DDkBUTDQvU0SHFjScJQugyel87l8xs7QiaSHSfwtMjNk
	M7eQu4TuDjdifaJRODG/a2CFv2yOKLETAu0YSnQhrPzG6I2/sTucgJuzglIjdRmY0Ep6
	Sl3LLfC4f4/6VmPBfmAWz0sadHDkFI08AVbyta/zoskjQBIy6OPWcGRiVc2oiDHrVctN
	55acQAwLBLBIJk3PMKua0+cmyl68lF/JlMSi/38lbOQsYPDOqR6s54OinAY5VaXidNLH
	abhHgh68f76M/nF/U/yduSnYDj1X4PATtWhJgB4DRujFgjMN1hUK4MLndeYC/upGmJA0
	syLg==
X-Gm-Message-State: APt69E3mFI+ti3Hl6taQLPTFgU67DNtWcy0ZOBTd9TjLYTAkoLEaiQy2
	S21tlJRDLnUn5ZLI3L0KbJ1WlA==
X-Google-Smtp-Source: ADUXVKLVxLlA85nzaB6lntUuXUbFWtSpS0BSoanoVw8js92a1EXHEv0kT515eWs6o6yj4yDUgH6lGQ==
X-Received: by 2002:a63:7a4a:: with SMTP id
	j10-v6mr3918551pgn.421.1528321056968; 
	Wed, 06 Jun 2018 14:37:36 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	c191-v6sm30452374pfg.48.2018.06.06.14.37.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Jun 2018 14:37:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jun 2018 14:37:26 -0700
Message-Id: <1ff58046b4eef02b93398683e15592165513018e.1528320772.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1528320772.git.raj.khem@gmail.com>
References: <cover.1528320772.git.raj.khem@gmail.com>
Subject: [PATCH 10/12] linux-yocto: Fix mips build with gcc8
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
X-List-Received-Date: Wed, 06 Jun 2018 21:37:36 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ips-Disable-attribute-alias-warnings.patch | 43 +++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto_4.15.bb |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/files/0001-mips-Disable-attribute-alias-warnings.patch

diff --git a/meta/recipes-kernel/linux/files/0001-mips-Disable-attribute-alias-warnings.patch b/meta/recipes-kernel/linux/files/0001-mips-Disable-attribute-alias-warnings.patch
new file mode 100644
index 0000000000..f24d933bcb
--- /dev/null
+++ b/meta/recipes-kernel/linux/files/0001-mips-Disable-attribute-alias-warnings.patch
@@ -0,0 +1,43 @@
+From bb47f1bdc9243117bf8009f1c265b2a8feaf9c58 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 4 May 2018 11:49:35 -0700
+Subject: [PATCH] mips: Disable attribute-alias warnings
+
+This warning is seen with gcc-8
+include/linux/syscalls.h:211:18: error: 'sys_cachectl' alias between functions of incom
+patible types 'long int(char *, int,  int)' and 'long int(long int,  long int,  long int)'
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ arch/mips/kernel/Makefile | 2 ++
+ arch/mips/mm/Makefile     | 1 +
+ 2 files changed, 3 insertions(+)
+
+diff --git a/arch/mips/kernel/Makefile b/arch/mips/kernel/Makefile
+index f10e1e15e1c6..eb92e52eb3db 100644
+--- a/arch/mips/kernel/Makefile
++++ b/arch/mips/kernel/Makefile
+@@ -2,6 +2,8 @@
+ #
+ # Makefile for the Linux/MIPS kernel.
+ #
++CFLAGS_signal.o		+= $(call cc-disable-warning, attribute-alias)
++CFLAGS_syscall.o	+= $(call cc-disable-warning, attribute-alias)
+ 
+ extra-y		:= head.o vmlinux.lds
+ 
+diff --git a/arch/mips/mm/Makefile b/arch/mips/mm/Makefile
+index c463bdad45c7..b7f9ef80dac7 100644
+--- a/arch/mips/mm/Makefile
++++ b/arch/mips/mm/Makefile
+@@ -2,6 +2,7 @@
+ #
+ # Makefile for the Linux/MIPS-specific parts of the memory manager.
+ #
++CFLAGS_cache.o			+= $(call cc-disable-warning, attribute-alias)
+ 
+ obj-y				+= cache.o dma-default.o extable.o fault.o \
+ 				   gup.o init.o mmap.o page.o page-funcs.o \
+-- 
+2.17.0
+
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.15.bb b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
index 31d96ef434..d579ffd645 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
@@ -26,6 +26,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
 
 SRC_URI += "file://0001-powerpc-Disable-attribute-alias-warnings-from-gcc8.patch \
             file://0002-powerpc-ptrace-Disable-array-bounds-warning-with-gcc.patch \
+            file://0001-mips-Disable-attribute-alias-warnings.patch \
 "
 
 LINUX_VERSION ?= "4.15.13"
-- 
2.17.1


