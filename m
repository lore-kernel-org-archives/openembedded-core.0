Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 426B878F5C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 01:05:40 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id 7-v6so1916912pgf.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 18:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=h6rO5VtblqGdVPSCulbsqQKWzTJyoD/P7QVbPrB1gQg=;
	b=p/kCf3i9WWF9lgTBKyRk3bMYMajqrBWJXoFDPeOkvPEpvtwqzb4D6Pb1xNh+yNtCMT
	gzsA2QB4+F1LtsVNml/2EKGszMGWVtEhiRYXPv3BD98NsPceIxpbv90ic8TmaS8qgTZt
	GSA24nSYXaVr63PMaTagEP48tMmUVzx2R3mKrT7pi3MOhIGz+WsWCJfTe9lG3x/eTuWv
	a2DZc6wQDbPOUlmNgw6BQlR69VMyQ7AF7x5aoBjpGAr/ERae3fNQ74x2Jy/RLLTyi3Xd
	M0BNsyQm0z3hZftOSuSPkoCQSNlw7i5B5lv1e6UOI2Z6M30+Ex8fzPUVSw04FMT3EWi6
	pExg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=h6rO5VtblqGdVPSCulbsqQKWzTJyoD/P7QVbPrB1gQg=;
	b=sOgJavPSLMyRTP/aQFuEKxSK1qWNOBdEkidCo5b9VMyh6fJPAC9McW0PI5dGW8QQou
	XQ+5siIxv78MusXi/oooBVNKh6dvanIPHr/GUL+arkQpD4dJGLVKCH7WO5pusOVhMRAk
	ur+uYYUKFqSXjzsTKztnf8klBbw01ofAz7YkjxZM/kELd+X01Va/ghac9yvaTAfm76Jf
	Snj/lJjEfSlGq5/eUDHD62tS9oouo636urzNx9m/9/UFoLAKhHhwkJ1RF4xgPwpbuPY+
	5AVmGdqoI+5oeAFW7XlrQncoFRrbXaG4c9IQX6dcS4BPuZIZUaNZupyEPDRz54Zy85YQ
	B3bA==
X-Gm-Message-State: APzg51DuxGKCL9p8FzfPlKMaEygDRTHpzvVDt+z2ljtWftGRkdEWsfp8
	78ZJz7Net+ZFKm+2FrR2KpwvYcZD
X-Google-Smtp-Source: ANB0Vdb47SU1X5LGdKmSk/dlM8b6X4Ap1OTKCQaDWO52wdy9H4noeMRszmlcasN+KF1ZdPJU7WwVMw==
X-Received: by 2002:a62:c008:: with SMTP id
	x8-v6mr4918983pff.149.1536800740644; 
	Wed, 12 Sep 2018 18:05:40 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::2887])
	by smtp.gmail.com with ESMTPSA id
	f13-v6sm2664935pgs.92.2018.09.12.18.05.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Sep 2018 18:05:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Sep 2018 18:05:30 -0700
Message-Id: <20180913010531.41241-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
Subject: [PATCH 1/2] linux-libc-headers: Include linux/stddef.h in linux/swab.h
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
X-List-Received-Date: Thu, 13 Sep 2018 01:05:40 -0000
Content-Transfer-Encoding: 8bit

This helps compiling bpf tests using non-glibc C libraries e.g. musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 ...linux-stddef.h-in-swab.h-uapi-header.patch | 44 +++++++++++++++++++
 .../linux-libc-headers_4.18.bb                |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-include-linux-stddef.h-in-swab.h-uapi-header.patch

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-include-linux-stddef.h-in-swab.h-uapi-header.patch b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-include-linux-stddef.h-in-swab.h-uapi-header.patch
new file mode 100644
index 0000000000..9d17daa70f
--- /dev/null
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-include-linux-stddef.h-in-swab.h-uapi-header.patch
@@ -0,0 +1,44 @@
+From 9708dc74d9f49488d669e070982f6224a888d61a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 12 Sep 2018 17:08:58 -0700
+Subject: [PATCH] include linux/stddef.h in swab.h uapi header
+
+swab.h uses __always_inline without including the header where it is
+defined, this is exposed by musl based distributions where this macro is
+not defined by system C library headers unlike glibc where it is defined
+in sys/cdefs.h and that header gets pulled in indirectly via
+
+features.h -> sys/cdefs.h
+
+and features.h gets pulled in a lot of headers. Therefore it may work in
+cases where features.h is includes but not otherwise.
+
+Adding linux/stddef.h here ensures that __always_inline is always
+defined independent of which C library is used in userspace
+
+Upstream-Status: Submitted [https://lkml.org/lkml/2018/9/13/78]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Cc: Philippe Ombredanne <pombredanne@nexb.com>
+Cc: Kate Stewart <kstewart@linuxfoundation.org>
+Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+Cc: Thomas Gleixner <tglx@linutronix.de>
+---
+ include/uapi/linux/swab.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/uapi/linux/swab.h b/include/uapi/linux/swab.h
+index 23cd84868cc3..acddbe50a20d 100644
+--- a/include/uapi/linux/swab.h
++++ b/include/uapi/linux/swab.h
+@@ -3,6 +3,7 @@
+ #define _UAPI_LINUX_SWAB_H
+ 
+ #include <linux/types.h>
++#include <linux/stddef.h>
+ #include <linux/compiler.h>
+ #include <asm/swab.h>
+ 
+-- 
+2.19.0
+
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.18.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.18.bb
index e38872bb91..eb7bee72b0 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.18.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.18.bb
@@ -6,6 +6,7 @@ SRC_URI_append_libc-musl = "\
     file://0003-remove-inclusion-of-sysinfo.h-in-kernel.h.patch \
     file://0001-libc-compat.h-musl-_does_-define-IFF_LOWER_UP-DORMAN.patch \
     file://0001-if_ether-move-muslc-ethhdr-protection-to-uapi-file.patch \
+    file://0001-include-linux-stddef.h-in-swab.h-uapi-header.patch \
    "
 
 SRC_URI[md5sum] = "bee5fe53ee1c3142b8f0c12c0d3348f9"
-- 
2.19.0


