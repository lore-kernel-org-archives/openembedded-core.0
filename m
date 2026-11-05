Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29827.1793868243250309395
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:44:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=CI9qa/cI;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e6eb21a8fso688897f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868241; x=1794473041; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6pBzeMV0E5jSafrMyMWrNwRiLFSBOm3YvHd38BYWCkY=;
        b=CI9qa/cI9x7mm4x0+M35ykiSq5BfbXWo9TyijR3jqY02V/CKqbZ+WOJjXRVQHUxj3d
         YKeWsRSBZ3+YnjUtkDZfRET6lkv8uSH6djdV0oWSXiRyWkyd4SFFiSlqsiilCE4CWDCc
         gmoTl1tnKtvsKAvKm8SCSZTORqxIIgFYOFg9nE86+Ro+ZXGbbvbqW5CgDgWD6mt6KojU
         mkRdFqp/hiZMbFnjKfFasFIjUz5HA5CbUtYTTh6FhcvxJiyOqxOvvWz8PGxu/EG/JgRa
         WdvZ/6bkg/3c+CyNvVCEMplF2QDNYYKwS6TpOEJxcIRf9w8PkU6kEmhAuynyrDbfM33h
         ZwxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868241; x=1794473041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6pBzeMV0E5jSafrMyMWrNwRiLFSBOm3YvHd38BYWCkY=;
        b=b0aTQFJGLjZ+vdCTNNZQpUvZbugVJju17+iM9Tuc3mmKrDT5d8pDvsoWn/hJCQnncp
         3ST/HHlMla9boJmp8pKv2RiChA9RV9wNJpsQBAyGwklZuHDEt3oJhyWpUUc7c1sQhcux
         gErg46QVEvQYgPOHLulmNnTT5WmoVOayMq3mOq9C+MK0QPv2sMXJArlu7qJjNfRO2b3y
         s/OwDxtAbn9ktTzZTwoihi3TRN9TRzb4Z9J++NRen/pLtMdW4NRdW1D42QzQGzFf6eWi
         e39+aRrA42ze8SD+1ab5/ovz0qY5mS+oQyeFvmFlC29SZlJPY9cFJOndGBUmZx2cXJjp
         bulg==
X-Gm-Message-State: APuU4Z/FfZ8wAHNJv40Tr6zdzoZ4E9f9uW33Khm4Yq6yBrs7hvyL3zPu
	QyvcAVh4FFFsK/Pl6tEnfxx18HHjTQOR6v+yIAuy0GhAFv3H0dDLNufwu3m3eGmE4Y8V4F1MY8K
	Kn8OrGOI=
X-Gm-Gg: AYBFou0qswr7dfGeUxseemnMpE6CtFN73aUoi7QITMXSQ+VYM6B/gZtr6ffWltil49C
	7I16xrPly5yIAQcx5VG0ykWwLQibuo4mFwlt8L4ZRjfiIjVQ3JVwUyEEuoiaPuIfIEnrQLVwr4D
	XoIjbdDW6AE2R7NLcljUVQ3kPY8SpnqrvY+KM4K3ACDEpca3JUbml43XZjJIeyQmVBAt8/dqTV7
	CfyNoFZNnimp7mQjo21aTAKWUQRxeZH+V7x8JalExK6LawQlHKq2mNv1GokE4l3jIk6672NHcLU
	9nWIF6ik+QjQxlCyxz7XrmlrYWNgBN6UdJty97ygIFCkU6XMwKbJeDv5VelqaO+Q7T9bQSaF9DK
	eHAdqFztkvBtAiKJcm10JwUEyH5BZB34XxjKjTh3fu5UYofmQWB7Hw/XGFzd0Izrd5lgntRmYMa
	FERh47VTNxGo9jsl9RoCmNTLuPSnHsUplalOha4BOj4njolyYrlWrQZfDDEmrUlFMTqkSQZ/NaR
	PoK8gqQLEZ8ugFRkuH6/6JB6WbrWQpn1wGrutv2vzkY4NlMHO9Y380w47ZUykcyb1oefuc6b8OQ
	GEZS27hHEM8cWqw7a0X9SddIBqMBlWx3HTVwTmXsnKfljApNdclLNPGcEv6O8nXNMS9mo26iST2
	OdoDr5GEksRgtTRyqKjV1rDRTt95IwiW6CmwqKeM0yW0+CiIehw==
X-Received: by 2002:a5d:5e92:0:b0:491:286f:8e56 with SMTP id ffacd0b85a97d-491286f912fmr2473745f8f.33.1793868241440;
        Thu, 05 Nov 2026 00:44:01 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.44.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:44:01 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 43/60] opensbi: Fix build with clang 23
Date: Thu,  5 Nov 2026 09:43:02 +0100
Message-ID: <9f0ef71a986845417e96d9b36b434420252cdf6a.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:44:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249502
Content-Type: text/plain; charset="utf-8"

From: Khem Raj <raj.khem@gmail.com>

Clang 23 adds -Wunused-but-set-global, enabled by -Wall, which
flags file-static globals in the sifive and cadence UART drivers
that are written but never read. opensbi builds with -Werror, so
the compile fails. Add a patch, submitted upstream, removing the dead
variables.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0fa300b4f195b1407cd40f69503621cdfc48df5d)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...-Remove-unused-baudrate-frequency-gl.patch | 67 +++++++++++++++++++
 meta/recipes-bsp/opensbi/opensbi_1.9.bb       |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-bsp/opensbi/files/0002-lib-utils-serial-Remove-unused-baudrate-frequency-gl.patch

diff --git a/meta/recipes-bsp/opensbi/files/0002-lib-utils-serial-Remove-unused-baudrate-frequency-gl.patch b/meta/recipes-bsp/opensbi/files/0002-lib-utils-serial-Remove-unused-baudrate-frequency-gl.patch
new file mode 100644
index 00000000000..b62c7c5b579
--- /dev/null
+++ b/meta/recipes-bsp/opensbi/files/0002-lib-utils-serial-Remove-unused-baudrate-frequency-gl.patch
@@ -0,0 +1,67 @@
+From b2b51e3de12703caad6fbb624d711d411ac0aae4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 15 Oct 2026 13:26:30 -0700
+Subject: [PATCH] lib: utils/serial: Remove unused baudrate/frequency globals
+
+The sifive-uart and cadence-uart drivers store the input clock
+frequency and baudrate into file-static globals during init, but
+never read them back; the divisor is computed directly from the
+function arguments. Clang 23 adds -Wunused-but-set-global, which is
+enabled by -Wall, so the build fails with -Werror:
+
+  sifive-uart.c:34:12: error: variable 'uart_in_freq' set but not used [-Werror,-Wunused-but-set-global]
+  sifive-uart.c:35:12: error: variable 'uart_baudrate' set but not used [-Werror,-Wunused-but-set-global]
+
+Drop the dead variables.
+
+Upstream-Status: Submitted [https://lore.kernel.org/opensbi/20261015203610.835320-1-khem.raj@oss.qualcomm.com/]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/utils/serial/cadence-uart.c | 4 ----
+ lib/utils/serial/sifive-uart.c  | 4 ----
+ 2 files changed, 8 deletions(-)
+
+diff --git a/lib/utils/serial/cadence-uart.c b/lib/utils/serial/cadence-uart.c
+index 30fbb95..80dc429 100644
+--- a/lib/utils/serial/cadence-uart.c
++++ b/lib/utils/serial/cadence-uart.c
+@@ -39,8 +39,6 @@
+ /* clang-format on */
+ 
+ static volatile void *uart_base;
+-static u32 uart_in_freq;
+-static u32 uart_baudrate;
+ 
+ /*
+  * Find minimum divisor divides in_freq to max_target_hz;
+@@ -95,8 +93,6 @@ static struct sbi_console_device cadence_console = {
+ int cadence_uart_init(unsigned long base, u32 in_freq, u32 baudrate)
+ {
+ 	uart_base     = (volatile void *)base;
+-	uart_in_freq  = in_freq;
+-	uart_baudrate = baudrate;
+ 
+ 	/* Disable interrupts */
+ 	set_reg(UART_REG_IDR, 0xFFFFFFFF);
+diff --git a/lib/utils/serial/sifive-uart.c b/lib/utils/serial/sifive-uart.c
+index 5563713..235976e 100644
+--- a/lib/utils/serial/sifive-uart.c
++++ b/lib/utils/serial/sifive-uart.c
+@@ -31,8 +31,6 @@
+ /* clang-format on */
+ 
+ static volatile char *uart_base;
+-static u32 uart_in_freq;
+-static u32 uart_baudrate;
+ 
+ /**
+  * Find minimum divisor divides in_freq to max_target_hz;
+@@ -94,8 +92,6 @@ static struct sbi_console_device sifive_console = {
+ int sifive_uart_init(unsigned long base, u32 in_freq, u32 baudrate)
+ {
+ 	uart_base     = (volatile char *)base;
+-	uart_in_freq  = in_freq;
+-	uart_baudrate = baudrate;
+ 
+ 	/* Configure baudrate */
+ 	if (in_freq && baudrate)
diff --git a/meta/recipes-bsp/opensbi/opensbi_1.9.bb b/meta/recipes-bsp/opensbi/opensbi_1.9.bb
index 954753d97e4..96167f7c735 100644
--- a/meta/recipes-bsp/opensbi/opensbi_1.9.bb
+++ b/meta/recipes-bsp/opensbi/opensbi_1.9.bb
@@ -12,6 +12,7 @@ SRCREV = "cbf9f6734dd85a982c63e3cb5db7ffe09da839ca"
 SRC_URI = " \
             git://github.com/riscv/opensbi.git;branch=master;protocol=https;tag=v${PV} \
             file://0001-Makefile-don-t-grep-when-setting-CC_SUPPORT_ZICSR_ZI.patch \
+            file://0002-lib-utils-serial-Remove-unused-baudrate-frequency-gl.patch \
             "
 
 TARGET_DBGSRC_DIR = "/share/opensbi/*/generic/firmware/"
