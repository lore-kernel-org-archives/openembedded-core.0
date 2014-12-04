Return-Path: <koen.kooi@linaro.org>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id C4FDF65E1A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Dec 2014 07:30:20 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id a1so21772922wgh.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Dec 2014 23:30:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1oNoKm4EPYTfZmp+bAGZ5vbUnFBe4zG3MiVEibHsPc8=;
	b=D83j28TXU1IHEccWozmM9/4zfG08etn/j4c5F6wb/QZItNG+purUCQxWkiFOan8cm7
	D6wEfDr6a22J22MU05p9loqQbSJ7a4CQ9juOoYgw7kLmdHGtwEV2TRhG0WXhTr7tFV9N
	k9khpDmpfzJvAC99lXvwqjAms0Eg1A1cgkOpCZMWrEWShJIWpQbSo27YxpdveiMYVhv2
	IgvivfibCFEu8USu8gZ3YgBh75C5JFoD2rPkgQBKnBK+D0xcy6fCIjluzxp11nb85jYX
	C+oRoKJ19DjdtWnuALYdlBS5WzoCzAn5gOIJ22k3zLcbqp2QurR0uGiIlwb1wV8p1vDY
	3kdQ==
X-Gm-Message-State: ALoCoQlR+8gCVSJ+NAClBLWhTC8SZT/yA/CKWA4eleW6bW16tJQbxLfFVvWJrFjvoVGv0g2lJ9PC
X-Received: by 10.180.82.226 with SMTP id l2mr8547130wiy.61.1417678221255;
	Wed, 03 Dec 2014 23:30:21 -0800 (PST)
Received: from localhost ([2001:610:612:0:2ad2:44ff:fe4b:bc17])
	by mx.google.com with ESMTPSA id c10sm19178680wjy.4.2014.12.03.23.30.20
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Dec 2014 23:30:20 -0800 (PST)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Dec 2014 08:30:18 +0100
Message-Id: <1417678218-1503-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.3
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH] tcmode-default.inc: use GCCVERSION for gcc-source
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
X-List-Received-Date: Thu, 04 Dec 2014 07:30:25 -0000

This was missing leading to gcc-source-<foo> being built when using gcc-cross-<bar> with GCCVERSION=bar.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/conf/distro/include/tcmode-default.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 26785e3..99d6df9 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -36,6 +36,7 @@ PREFERRED_VERSION_gcc-crosssdk-${SDK_ARCH} ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_gcc-crosssdk-initial-${SDK_ARCH} ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-runtime ?= "${GCCVERSION}"
+PREFERRED_VERSION_gcc-source ?= "${GCCVERSION}"
 PREFERRED_VERSION_nativesdk-gcc-runtime ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_libgcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_libgcc-initial ?= "${GCCVERSION}"
-- 
1.9.3


