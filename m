Received: from smtp0.taitradio.net (smtp0.taitradio.net [202.37.96.22])
 by mx.groups.io with SMTP id smtpd.web11.5274.1600139915323088065
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 20:18:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: taitradio.com, ip: 202.37.96.22, mailfrom: douglas.royds@taitradio.com)
Received: from acheron.taitradio.net (unknown [10.200.20.196])
	by smtp0.taitradio.net (Postfix) with ESMTP id 2F81922027A;
	Tue, 15 Sep 2020 15:18:32 +1200 (NZST)
From: "Douglas" <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Cc: Douglas Royds <douglas.royds@taitradio.com>
Subject: [PATCH] nativesdk: Set TARGET_CC_KERNEL_ARCH for sdk
Date: Tue, 15 Sep 2020 15:18:30 +1200
Message-Id: <20200915031830.29491-1-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1

We install the linux-libc-headers for the build machine, so
take control of the TARGET_CC_KERNEL_ARCH.
In this way, we get no task signature changes when we build
nativesdk-linux-libc-headers with different MACHINEs,
avoiding a build-through from glibc up.

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta/classes/nativesdk.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index 7f2692c51a..420ee52be2 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -47,6 +47,7 @@ TARGET_VENDOR = "${SDK_VENDOR}"
 TARGET_OS = "${SDK_OS}"
 TARGET_PREFIX = "${SDK_PREFIX}"
 TARGET_CC_ARCH = "${SDK_CC_ARCH}"
+TARGET_CC_KERNEL_ARCH = "${SDK_CC_ARCH}"
 TARGET_LD_ARCH = "${SDK_LD_ARCH}"
 TARGET_AS_ARCH = "${SDK_AS_ARCH}"
 TARGET_CPPFLAGS = "${BUILDSDK_CPPFLAGS}"
-- 
2.17.1

