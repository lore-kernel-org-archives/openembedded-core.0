Return-Path: <Alexey.Brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (us01smtprelay-2.synopsys.com
	[198.182.60.111])
	by mail.openembedded.org (Postfix) with ESMTP id 911AA798C9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 14:26:22 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost1.synopsys.com [10.12.238.239])
	by smtprelay.synopsys.com (Postfix) with ESMTP id 155C510C1B77;
	Fri, 21 Sep 2018 07:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1537539984; bh=tSV+tpwCYfquebbafsXFz8I8+xCYVekSrhiKRxnN20w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CYWyTfD4tkD6FKhKhpli1YOh7sH06IGoJiNN9Y3WLr6n7ROklHvMUlrECNBKGNvNC
	V3XtusalXad6r9jrOstfbc1DU4DwNMIU8najer5/tsViT3wpMNE46ARREjP2LsFt3j
	MMZm+7EfwQzjmtbYXvPrLUZUkET+OmuB7H6oSWyjYILlwK4B0K3elv11dA6K7JakID
	oIaMh/ILeI+8DySi5H4xTGhekM0Nh2G76SlVN9pnEFGhgwNF4wD8N072+NM0Iqogdz
	lcHNVGpkALZeRzF4nKHeU/CVtVEt0zgOJJIah1k8DWCO62xymVu+/dGpyxDzGl08mD
	rzfHljnCI5jWQ==
Received: from ru20arcgnu1.internal.synopsys.com
	(ru20arcgnu1.internal.synopsys.com [10.121.9.48])
	by mailhost.synopsys.com (Postfix) with ESMTP id B0B975DAE;
	Fri, 21 Sep 2018 07:26:22 -0700 (PDT)
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Sep 2018 17:26:05 +0300
Message-Id: <20180921142608.36203-7-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180921142608.36203-1-abrodkin@synopsys.com>
References: <20180921142608.36203-1-abrodkin@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org,
	Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH v3 6/9] icu: Add ARC support
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
X-List-Received-Date: Fri, 21 Sep 2018 14:26:22 -0000

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---

No changes in v3.

Changes v1 -> v2:

 * Added upstream status

 .../icu/icu/0002-Add-ARC-support.patch             | 27 ++++++++++++++++++++++
 meta/recipes-support/icu/icu_62.1.bb               |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-support/icu/icu/0002-Add-ARC-support.patch

diff --git a/meta/recipes-support/icu/icu/0002-Add-ARC-support.patch b/meta/recipes-support/icu/icu/0002-Add-ARC-support.patch
new file mode 100644
index 0000000000..20e3d8356c
--- /dev/null
+++ b/meta/recipes-support/icu/icu/0002-Add-ARC-support.patch
@@ -0,0 +1,27 @@
+From fcfd57105b4bdb30d906df152ef01748fa95daff Mon Sep 17 00:00:00 2001
+From: Alexey Brodkin <abrodkin@synopsys.com>
+Date: Thu, 13 Sep 2018 17:13:20 +0300
+Subject: [PATCH] icu: Add ARC support
+
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+
+Upstream-Status: Submitted [ https://github.com/unicode-org/icu/pull/149 ]
+---
+ i18n/double-conversion-utils.h                 | 2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/i18n/double-conversion-utils.h b/i18n/double-conversion-utils.h
+index 57fc49b231a3..0bd3e8340673 100644
+--- a/i18n/double-conversion-utils.h
++++ b/i18n/double-conversion-utils.h
+@@ -86,7 +86,7 @@ inline void abort_noreturn() { abort(); }
+     defined(__SH4__) || defined(__alpha__) || \
+     defined(_MIPS_ARCH_MIPS32R2) || \
+     defined(__AARCH64EL__) || defined(__aarch64__) || \
+-    defined(__riscv)
++    defined(__riscv) || defined(__arc__)
+ #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
+ #elif defined(__mc68000__)
+ #undef DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS
+2.17.1
+
diff --git a/meta/recipes-support/icu/icu_62.1.bb b/meta/recipes-support/icu/icu_62.1.bb
index ec9db7de84..4e3750b997 100644
--- a/meta/recipes-support/icu/icu_62.1.bb
+++ b/meta/recipes-support/icu/icu_62.1.bb
@@ -16,6 +16,7 @@ BASE_SRC_URI = "http://download.icu-project.org/files/icu4c/${PV}/icu4c-${ICU_PV
 SRC_URI = "${BASE_SRC_URI} \
            file://icu-pkgdata-large-cmd.patch \
            file://fix-install-manx.patch \
+           file://0002-Add-ARC-support.patch \
            "
 
 SRC_URI_append_class-target = "\
-- 
2.16.2


