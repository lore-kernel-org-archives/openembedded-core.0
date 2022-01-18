Return-Path: <changhyeok.bae@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78C4BC433EF
	for <webhook@archiver.kernel.org>; Tue, 18 Jan 2022 01:31:48 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web12.6972.1642469507646400379
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 17:31:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fmXm14m5;
 spf=pass (domain: gmail.com, ip: 209.85.208.43,
 mailfrom: changhyeok.bae@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 30so72900489edv.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 17:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=T/LPFafbDK7T1r+QE4R6s5ahSRZ6YHRa/iaBim+fUG0=;
        b=fmXm14m5B1IqZiV6X/kdl6hsTCII5mFMKbIch1BJJjmOy6hlcD48+HdlC25SwhrZUC
         88QZ5U2drBozk508T4LzrvrhkBPaUJRaFwp/0y9AGlTPRw2v6DIlUDHY5Hn/vRPabzk7
         Qew0b4dZZMbnbAtwVl7bBW1RbuF0030o4LuHbJphPZECnIJ1GM7ufvbTp2m8ghH72wey
         txVilQ4LEJ2ObEpVzYK+Fv1a4Ee8TbSmoJ0+zLsttlEwIkitAELEabAYRRD7QcYaVMwu
         YhHFGOCCvdYTgYlQnNxdQWo7nL3mi89I9DkS1BsL/c83ccES2e/3Mi8PkReiayijlyYi
         FdSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=T/LPFafbDK7T1r+QE4R6s5ahSRZ6YHRa/iaBim+fUG0=;
        b=OfrEpV81nY5kGe85L3xKPyHphwWt9AlNC+JjvJNKkfGQd114PTENepEKUbf39IFePm
         lIZUMRzMlVqVd2eNbnzPoXS4jRK8QNAm89u6IUQAzb9fOhcHiqhH8eSp29GdKkMtWhZk
         hihHzkh5GjO5u8hTe/FpbdsKqTP3kWiLQKGp6u3VB0rgo21jRUU+w4sCYCy1VoNycEML
         qDjoJiLWdtZtDUGqDukyzth10L2gsyfkBiNWPWiM0iBoQtIQL3tFGf9m0RQFJwzF2TfU
         49ArEDmK1WGC1IeI+O31oOLTrOPpxjPxW0oNotFn6PufxM9XrF69reD4TLByf7Jx/T6y
         6upg==
X-Gm-Message-State: AOAM5339z64c9HEa9ZpDsCYapuNrPIpyYpk8BpJOp2Mq8yG/QSaEVTRX
	JqgC+K01MUIBRxnxn7JBd3cm8xHVbw5y/g==
X-Google-Smtp-Source: 
 ABdhPJyFkzJQqesaaPZhEcerq+kvzRbTY1iU5EEl+jpQMmaGamSZWnFgS4KVT0ZW8Ad8FuiuQq9WXw==
X-Received: by 2002:a17:906:8a51:: with SMTP id
 gx17mr13015692ejc.215.1642469505553;
        Mon, 17 Jan 2022 17:31:45 -0800 (PST)
Received: from localhost.localdomain (ip5f5aec99.dynamic.kabel-deutschland.de.
 [95.90.236.153])
        by smtp.gmail.com with ESMTPSA id
 k11sm2979853ejr.143.2022.01.17.17.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jan 2022 17:31:45 -0800 (PST)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Changhyeok Bae <changhyeok.bae@gmail.com>
Subject: [OE-Core][PATCH] iproute2: update 5.15.0 to 5.16.0
Date: Tue, 18 Jan 2022 01:31:39 +0000
Message-Id: <20220118013139.62641-1-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jan 2022 01:31:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160668

0001-lib-fix-ax25.h-include-for-musl.patch is the fix for musl and comes
from upstream.

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 ...0001-lib-fix-ax25.h-include-for-musl.patch | 37 +++++++++++++++++++
 ...{iproute2_5.15.0.bb => iproute2_5.16.0.bb} |  3 +-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/iproute2/iproute2/0001-lib-fix-ax25.h-include-for-musl.patch
 rename meta/recipes-connectivity/iproute2/{iproute2_5.15.0.bb => iproute2_5.16.0.bb} (64%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-lib-fix-ax25.h-include-for-musl.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-lib-fix-ax25.h-include-for-musl.patch
new file mode 100644
index 0000000000..338def399e
--- /dev/null
+++ b/meta/recipes-connectivity/iproute2/iproute2/0001-lib-fix-ax25.h-include-for-musl.patch
@@ -0,0 +1,37 @@
+From 8bced38a941a181f1468fa39541e872e51b6022f Mon Sep 17 00:00:00 2001
+From: Sam James <sam@gentoo.org>
+Date: Thu, 13 Jan 2022 08:14:13 +0000
+Subject: [PATCH] lib: fix ax25.h include for musl
+
+ax25.h isn't guaranteed to be avilable in netax25/*;
+it's dependent on our choice of libc (it's not available
+on musl at least) [0].
+
+Let's use the version from linux-headers.
+
+[0] https://sourceware.org/glibc/wiki/Synchronizing_Headers
+Bug: https://bugs.gentoo.org/831102
+
+Signed-off-by: Sam James <sam@gentoo.org>
+Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
+
+Upstream-Status: Backport
+---
+ lib/ax25_ntop.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/ax25_ntop.c b/lib/ax25_ntop.c
+index cfd0e04b..3a72a43e 100644
+--- a/lib/ax25_ntop.c
++++ b/lib/ax25_ntop.c
+@@ -2,7 +2,7 @@
+
+ #include <errno.h>
+ #include <sys/socket.h>
+-#include <netax25/ax25.h>
++#include <linux/ax25.h>
+
+ #include "utils.h"
+
+--
+2.32.0 (Apple Git-132)
diff --git a/meta/recipes-connectivity/iproute2/iproute2_5.15.0.bb b/meta/recipes-connectivity/iproute2/iproute2_5.16.0.bb
similarity index 64%
rename from meta/recipes-connectivity/iproute2/iproute2_5.15.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_5.16.0.bb
index 99a743391a..871f8d8fb7 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_5.15.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_5.16.0.bb
@@ -2,9 +2,10 @@ require iproute2.inc
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-libc-compat.h-add-musl-workaround.patch \
+           file://0001-lib-fix-ax25.h-include-for-musl.patch \
            "
 
-SRC_URI[sha256sum] = "38e3e4a5f9a7f5575c015027a10df097c149111eeb739993128e5b2b35b291ff"
+SRC_URI[sha256sum] = "c064b66f6b001c2a35aa5224b5b1ac8aa4bee104d7dce30d6f10a84cb8b01e2f"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
2.17.1


