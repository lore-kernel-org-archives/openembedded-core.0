Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
	[209.85.216.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6CC8B7FCCD
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Dec 2019 04:05:59 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id j11so5919306pjs.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Dec 2019 20:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=cVaMU03YXlA2ISyTCpdUFInwpj6K9UmhqFroGVnZdbA=;
	b=Jb8LpbQR0m/dBmXgsHDE4DhoEw3fEETXma2RpsLeby34g5z5/Om8Cj8RiOYYhTmTTa
	Pe3gOzLA3wLeWlKzxEwh3zNM6WzZmnpwOu3ZZ+2H6FvbdzwA9GPVMTvhd4TWh0wj6nuQ
	cOG2mZrP/BI/qziYDVyz0SU+cK3YzGYepaH+bbxsOzIoztLvwU0eLUxLvefpThcusbyy
	CrsnReA2ikzY54by2JNu1ULaPZB0WOugY/6E+8AZ7/kBczC3+PLn2n7EM/L7KnBlwxv1
	0oqF6gyz/0OVBAHMTJGE252INPmRXM2kquu2KHicBLS4mgjsqNOqcKfcOMdVlnV5N5rj
	d5oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=cVaMU03YXlA2ISyTCpdUFInwpj6K9UmhqFroGVnZdbA=;
	b=iGBaJsd69BJmyr43ePU0N6C8CCQhDDtuxjyK74ER/rl+RAfIBhAL05IV6LNgmJ9f6J
	CpAU2rFkP2zIPt4NKhzwAOBFALlshyjCSknlHy0UW4Xwi1cAZbn/YXX1Xt0P+oAznoFq
	RTQnhkyP+LiUBHaBpx2/Q3pUt2LeG22yNqvh5Gt7qeHo8OgyyleTDX4EY8hzBrqG9qOG
	OvBzBB8qc+61s/pOijnHtodEd83EBR3yajNnCOzyuzC7kshDcbz3I1QWqjdwxUInkBk/
	gIeVdTn1hUBnPSNMosLW/QlaxQZ4S3ROpI50uBF778kk06iVraGDCdKna0UO9umTOsLK
	2JQA==
X-Gm-Message-State: APjAAAX3CUvmfkU5/zV+E0tNJK9gHT1HoBe1FSKC6R6QY8gjvcqt626I
	MrB+a2xbo5uzSakOplv1QrFYIOtI7DU=
X-Google-Smtp-Source: APXvYqzfe6Q6oXzLiQe2tqrjDrJBL3iRnOznwFUUetgb7Q9+kiKjAdGHaNUOgxn94wb6Q/qS9cjdew==
X-Received: by 2002:a17:90a:234f:: with SMTP id
	f73mr25908681pje.109.1576987560046; 
	Sat, 21 Dec 2019 20:06:00 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::36e9])
	by smtp.gmail.com with ESMTPSA id
	h16sm18988306pfn.85.2019.12.21.20.05.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 21 Dec 2019 20:05:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 21 Dec 2019 20:05:49 -0800
Message-Id: <20191222040549.286151-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191222040549.286151-1-raj.khem@gmail.com>
References: <20191222040549.286151-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] linux-yocto: Fix build with gcc10
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
X-List-Received-Date: Sun, 22 Dec 2019 04:05:59 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 ...sed-64-Define-__force_order-only-whe.patch | 42 +++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto_5.2.bb  |  2 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/files/0001-x86-boot-compressed-64-Define-__force_order-only-whe.patch

diff --git a/meta/recipes-kernel/linux/files/0001-x86-boot-compressed-64-Define-__force_order-only-whe.patch b/meta/recipes-kernel/linux/files/0001-x86-boot-compressed-64-Define-__force_order-only-whe.patch
new file mode 100644
index 0000000000..bd48de6dd9
--- /dev/null
+++ b/meta/recipes-kernel/linux/files/0001-x86-boot-compressed-64-Define-__force_order-only-whe.patch
@@ -0,0 +1,42 @@
+From 199caf12cdbe24796dc31fbd4fe5729ba2acf659 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 20 Dec 2019 17:42:02 -0800
+Subject: [PATCH] x86/boot/compressed/64: Define __force_order only when
+ CONFIG_RANDOMIZE_BASE is unset
+
+kaslr_64.c also defines the same variable, however when both files are
+included into final link, linker complains about multiple definition of
+`__force_order' which is coming from kaslr_64.o and pgtable_64.o, its
+possible that kaslr_64.o is disabled via CONFIG_RANDOMIZE_BASE config
+option, therefore define it conditionally only when
+CONFIG_RANDOMIZE_BASE is not set
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Cc: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
+Cc: Kees Cook <keescook@chromium.org>
+Cc: "H. Peter Anvin" <hpa@zytor.com>
+Cc: Ingo Molnar <mingo@redhat.com>
+Cc: Thomas Gleixner <tglx@linutronix.de>
+Cc: x86-ml <x86@kernel.org>
+Cc: Arnd Bergmann <arnd@arndb.de>
+---
+ arch/x86/boot/compressed/pgtable_64.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/arch/x86/boot/compressed/pgtable_64.c b/arch/x86/boot/compressed/pgtable_64.c
+index c8862696a47b..077d19268b0b 100644
+--- a/arch/x86/boot/compressed/pgtable_64.c
++++ b/arch/x86/boot/compressed/pgtable_64.c
+@@ -12,7 +12,9 @@
+  * It is not referenced from the code, but GCC < 5 with -fPIE would fail
+  * due to an undefined symbol. Define it to make these ancient GCCs work.
+  */
++#ifndef CONFIG_RANDOMIZE_BASE
+ unsigned long __force_order;
++#endif
+ 
+ #define BIOS_START_MIN		0x20000U	/* 128K, less than this is insane */
+ #define BIOS_START_MAX		0x9f000U	/* 640K, absolute maximum */
+-- 
+2.24.1
+
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.2.bb b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
index ff0f547399..5af0924808 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
@@ -29,6 +29,8 @@ SRCREV_meta ?= "bd0762cd138f1624b5a5f8669cfa3ac2b71cb87b"
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.2;destsuffix=${KMETA}"
 
+SRC_URI += "file://0001-x86-boot-compressed-64-Define-__force_order-only-whe.patch"
+
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 LINUX_VERSION ?= "5.2.20"
 
-- 
2.24.1


