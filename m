Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web09.36468.1612196792874700453
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 08:26:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=InaTqz9l;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.175, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f175.google.com with SMTP id d20so3592896oiw.10
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Feb 2021 08:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=NtCKli0a/j2WRAYlpLfHNAMPffO6bwsCxFlH7XwYCYo=;
        b=InaTqz9lIw2YrT0bt3j79STTYZT6wVd4wqeIFoemngc1fnWLqbWFUTcqcGqxOrH7Xs
         MRGxRMNJkI9tcVDC6OPBz2xquSDpStga2cqpCC5ReYUYvgNnO2UEmCyyekexK7puuDYK
         lF492bjOohQTtep65x8VUHFtCksExG637tLKSqQWtj+92+TrjrwlqqrasZt5Lh6jrPa/
         LMi6usSHjoLWlK0110gMK392BjXLlF/SL9BWxvHq2aY+zVznmihfqCAAmNji4kRjnzxX
         /dJA5RxhbX9k7APTbcbKrvmvq740ErY3fztlpVjdIt4Vq2RYd7ZqGVdDV+MQcR0QzvqD
         UxsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NtCKli0a/j2WRAYlpLfHNAMPffO6bwsCxFlH7XwYCYo=;
        b=Yyl/ZVSevJCTeD2jeD15xsNXypripaQLS9tHWCTL9pk1100ttutdzIwbC8MWVNT87/
         ELs1rjjOjqrX65aIKh9cW9ZNz+tHO1L74HqhKmt/G1USvNS6EdC81IrGOZ81h04QzEVr
         LECkgOFocG510nDMQjXyLb730nGSO+7bPcfjzmhum1y0xHOxrDEGBtd5v9XSKzKtRY3m
         WR6eume2ujx8U+eHPLS6vXskOmTeD6efvojtPf3cVdLfVTraZashJf8J9D7kOVSwg65m
         86pR45drxPw8/MEFVRNGYTKIcXAXaHUFvcXA92T4KmvNL7loOyToYvBM0aPig5EK+9NV
         4NNg==
X-Gm-Message-State: AOAM533RH7NFGPjHF2OZzeiGUUqZVfd1v3s/16r1c6Qjqj8Dh7Y1DdSq
	s1iqLnl05fH3hxhR2esHmoFReM7FDhhnw1faTTE=
X-Google-Smtp-Source: ABdhPJzcCU407gST/uTOYDnidwjNZyOY4yW0ijglzcWxpO3Xgk0fy9r79LWwtM8PkGwKwAKOkjKzbA==
X-Received: by 2002:aca:c60d:: with SMTP id w13mr11161827oif.26.1612196791483;
        Mon, 01 Feb 2021 08:26:31 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id o16sm3980726ote.79.2021.02.01.08.26.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 08:26:30 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/21] dtc: improve reproducibility
Date: Mon,  1 Feb 2021 06:24:43 -1000
Message-Id: <9cc6506b228982dc619080a24e70daf0cfaf16ab.1612188857.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612188857.git.steve@sakoman.com>
References: <cover.1612188857.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksiy Obitotskyy <oobitots@cisco.com>

Makefile override CFLAGS, so -fmacro/debug-prefix-map
optiions was omitted and binaries contains absolute
patch to sources.

Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b58e808a087bbc0a5abd78fd34bb6f1c0c93ba25)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/dtc/dtc.inc               |  2 ++
 ...-Makefile-to-add-CFLAGS-not-override.patch | 36 +++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-kernel/dtc/dtc/0001-dtc-Fix-Makefile-to-add-CFLAGS-not-override.patch

diff --git a/meta/recipes-kernel/dtc/dtc.inc b/meta/recipes-kernel/dtc/dtc.inc
index 0650e3c82e..5da6c24fbf 100644
--- a/meta/recipes-kernel/dtc/dtc.inc
+++ b/meta/recipes-kernel/dtc/dtc.inc
@@ -7,7 +7,9 @@ DEPENDS = "flex-native bison-native"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/dtc/dtc.git \
            file://make_install.patch \
+           file://0001-dtc-Fix-Makefile-to-add-CFLAGS-not-override.patch \
            "
+
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 EXTRA_OEMAKE='NO_PYTHON=1 PREFIX="${prefix}" LIBDIR="${libdir}" DESTDIR="${D}"'
diff --git a/meta/recipes-kernel/dtc/dtc/0001-dtc-Fix-Makefile-to-add-CFLAGS-not-override.patch b/meta/recipes-kernel/dtc/dtc/0001-dtc-Fix-Makefile-to-add-CFLAGS-not-override.patch
new file mode 100644
index 0000000000..a2deb12d4b
--- /dev/null
+++ b/meta/recipes-kernel/dtc/dtc/0001-dtc-Fix-Makefile-to-add-CFLAGS-not-override.patch
@@ -0,0 +1,36 @@
+From f0119060ef1b9bd80e2cae487df1e4aedffb0e9b Mon Sep 17 00:00:00 2001
+From: Oleksiy Obitotskyy <oobitots@cisco.com>
+Date: Fri, 22 Jan 2021 09:12:48 +0200
+Subject: [PATCH] dtc: Fix Makefile to add CFLAGS not override
+
+Makefile override CFLAGS not extend them, so some of them
+missing. Sources builds out of kernel tree and probably not all
+options could be used (?). We need at least -fmacro-prefix-map/
+debug-prefix-map to eliminate absolute path in binaries.
+
+Upstream-Status: Pending
+Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
+---
+ Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 35d936f..b5b13cf 100644
+--- a/Makefile
++++ b/Makefile
+@@ -20,10 +20,10 @@ CONFIG_LOCALVERSION =
+ # See libfdt_internal.h for details
+ ASSUME_MASK ?= 0
+ 
+-CPPFLAGS = -I libfdt -I . -DFDT_ASSUME_MASK=$(ASSUME_MASK)
++CPPFLAGS += -I libfdt -I . -DFDT_ASSUME_MASK=$(ASSUME_MASK)
+ WARNINGS = -Wall -Wpointer-arith -Wcast-qual -Wnested-externs \
+ 	-Wstrict-prototypes -Wmissing-prototypes -Wredundant-decls -Wshadow
+-CFLAGS = -g -Os $(SHAREDLIB_CFLAGS) -Werror $(WARNINGS) $(EXTRA_CFLAGS)
++CFLAGS += -g -Os $(SHAREDLIB_CFLAGS) -Werror $(WARNINGS) $(EXTRA_CFLAGS)
+ 
+ BISON = bison
+ LEX = flex
+-- 
+2.25.1
+
-- 
2.25.1

