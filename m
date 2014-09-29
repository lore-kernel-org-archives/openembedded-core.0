Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id AD7426FDEB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Sep 2014 07:39:18 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id bj1so6846831pad.29
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Sep 2014 00:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=cUlmrIfm7svudeoUKewqvFeW/CT+KYnjs2ThzaLPQZ0=;
	b=RZ8jUZm7MdIHNEZMV2h9MtTYPPxWnoMB0ZqcKy4OIygFMHxJnbsvcr6YUHKQ+jYdCD
	+BkydOpgY+spKVLvHM5Dm3P5VZ43YmzJC2hNctrmPemxEfP3ily/5Zb7ZzTHPTUAKGtv
	NmpdniNj4Ls3K9toSf9CJuNfa6ew1dKzlX6BUt0nsxEbnZxwyuWMTdH1f7UhMNjfkFoU
	o63Ghkb6dIOP5vIFDPGSBYI0MmqfcMEz1N2gn0RJG72LQoSUU1XOylsJn84j3d4WEQMh
	kUIsfYdSiS/WHwYtSLPtmicBSHaHIbntb7s9l59jHr6AldOoM1MrQQ36gCr9p2YS3cTA
	4NiQ==
X-Received: by 10.69.20.10 with SMTP id gy10mr24037970pbd.119.1411976360184;
	Mon, 29 Sep 2014 00:39:20 -0700 (PDT)
Received: from haswell.localdomain (c-76-103-58-225.hsd1.ca.comcast.net.
	[76.103.58.225])
	by mx.google.com with ESMTPSA id hu4sm1047513pbb.68.2014.09.29.00.39.19
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 29 Sep 2014 00:39:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Sep 2014 00:43:11 -0700
Message-Id: <1411976591-3886-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.1
Subject: [PATCH] tcmode-default: Define PREFERRED_VERSION for binutils-native
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
X-List-Received-Date: Mon, 29 Sep 2014 07:39:19 -0000

When using other toolchain layers, it does not pick
the OE-Core version eventhough not specified, its because
we did not pin it.

Change-Id: Ic47fd607a2a6535dd157d8afdd004197d2a6f60b
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 6c0f102..26785e3 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -42,6 +42,7 @@ PREFERRED_VERSION_libgcc-initial ?= "${GCCVERSION}"
 PREFERRED_VERSION_nativesdk-libgcc ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_nativesdk-libgcc-initial ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_binutils ?= "${BINUVERSION}"
+PREFERRED_VERSION_binutils-native ?= "${BINUVERSION}"
 PREFERRED_VERSION_binutils-cross-${TARGET_ARCH} ?= "${BINUVERSION}"
 PREFERRED_VERSION_binutils-crosssdk-${SDK_ARCH} ?= "${BINUVERSION}"
 PREFERRED_VERSION_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "${BINUVERSION}"
-- 
2.1.1


