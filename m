Return-Path: <kristian.amlie@northern.tech>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id C96E2605BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 14:03:29 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id e137so2757410lfg.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 06:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=northern.tech; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Wr4IRTxB0zLWMWOTDObVIz0MEtNA4dyzzov2o0/auE0=;
	b=PZOktAr8ak4DbryV8ZiEBqo29RL5iB+6JJPo5+//XknYoST8RmelunjAFuiE6fSijP
	0ickrS2MiRdPfd4xWgr4kTcp1wFz1WyqoM1HuDquFoQzA0sV2BzObJUJrhzznHRtm2Zk
	M7cdCvLc/kf33U/LPPolN2CRq+jzzOvYq4RUBy2oeeFPGepIC2mBzIXztM94O6z+Sflv
	ppIU0ty5VCx1aXI3SfzHJHbWuqsVR6FY7By8ir0tTgN/PPOSCcPNL4MJ1sBBC84fx8Zz
	pwtILeJJ2Z3EYeOssaQu49R0biux+oKnGjalTSUq6Z4KlY6NXB8uvY69joaW5iNSyAs/
	RTPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Wr4IRTxB0zLWMWOTDObVIz0MEtNA4dyzzov2o0/auE0=;
	b=XCOwFwWBUqEjGhiQVOLezPBFtydeJx3N7NEFmRK+KyTNOz2EGKmfScytrYspo221DB
	Qko55vqeGQiiwSAFheR7QMb1dN2iu8M77R4zyKovV46RNuS9BdrK+2mrKVUyrTZx62Lu
	sAXIqUnCc/GYlXlr4wtVUWw+Urytr1/lew0Y8i5cRl5qycLnCNIe4WTaGveQLRPG2G5o
	sNZiuaVe1TClI3B4CLQPYT0llx/JBlqlSNvlOZjcdJox/dnRm3fJ8n0KiMN9UMyHG5Px
	v/3LSGZlT4c9JVB6kN/6DnSfwf+dM4thrnft9yZA6FrixLLXHFj2KLOCenoszyby0pox
	NtsA==
X-Gm-Message-State: AKGB3mJV2/HR7mkdKMX7/amb2P9SVtPQxiETnxzfNt3YHg7MvMSKzfr/
	Hzc2f1gfCLSvjWIOrnxpEozDMpL0tJg=
X-Google-Smtp-Source: ACJfBotfE12ZWLj1Ss5+pSx36EWNeaC6R7Ore0wOY9IAqy8l+FZ65FVC+uo5Kl21PpmQSLQOelBXiQ==
X-Received: by 10.46.20.4 with SMTP id u4mr1713704ljd.38.1513173809995;
	Wed, 13 Dec 2017 06:03:29 -0800 (PST)
Received: from localhost.localdomain ([195.159.234.190])
	by smtp.googlemail.com with ESMTPSA id
	j1sm339025lfe.66.2017.12.13.06.03.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Dec 2017 06:03:29 -0800 (PST)
From: Kristian Amlie <kristian.amlie@northern.tech>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Dec 2017 15:03:27 +0100
Message-Id: <1513173807-26292-1-git-send-email-kristian.amlie@northern.tech>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1513171550-25534-1-git-send-email-kristian.amlie@northern.tech>
References: <1513171550-25534-1-git-send-email-kristian.amlie@northern.tech>
Subject: [PATCH v2] u-boot-fw-utils: Fix broken makefile in v2017.11.
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
X-List-Received-Date: Wed, 13 Dec 2017 14:03:30 -0000

See the patch for details. This patch has already been applied
upstream, but we need it for v2017.11.

Upstream-Status: Accepted [http://git.denx.de/?p=u-boot.git;a=commit;h=ded84f90a1066eef5f34daa4539273de64f7b811]

Signed-off-by: Kristian Amlie <kristian.amlie@northern.tech>
---
 .../u-boot/files/v2017.11-fw-utils-build-fix.patch | 37 ++++++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot-common_2017.11.inc  |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/files/v2017.11-fw-utils-build-fix.patch

diff --git a/meta/recipes-bsp/u-boot/files/v2017.11-fw-utils-build-fix.patch b/meta/recipes-bsp/u-boot/files/v2017.11-fw-utils-build-fix.patch
new file mode 100644
index 0000000..fe89735
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/v2017.11-fw-utils-build-fix.patch
@@ -0,0 +1,37 @@
+From ded84f90a1066eef5f34daa4539273de64f7b811 Mon Sep 17 00:00:00 2001
+From: Stefan Agner <stefan.agner@toradex.com>
+Date: Tue, 14 Nov 2017 15:47:18 +0100
+Subject: [PATCH 1/1] envtools: make sure version/timestamp header file are
+ available
+
+With commit 84d46e7e8948 ("tools: env: allow to print U-Boot version")
+the fw_env utilities need the version.h header file. Building only
+the envtools in a pristine build directory will fail due to missing
+header files.
+
+Make sure the header files are a dependency of the envtools target.
+
+Fixes: 84d46e7e8948 ("tools: env: allow to print U-Boot version")
+Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
+Tested-by: Peter Robinson <pbrobinson@gmail.com>
+Reviewed-by: Simon Glass <sjg@chromium.org>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 61fd973..f8c66a2 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1447,7 +1447,7 @@ checkarmreloc: u-boot
+ 		false; \
+ 	fi
+ 
+-envtools: scripts_basic
++envtools: scripts_basic $(version_h) $(timestamp_h)
+ 	$(Q)$(MAKE) $(build)=tools/env
+ 
+ tools-only: scripts_basic $(version_h) $(timestamp_h)
+-- 
+2.7.4
+
diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2017.11.inc b/meta/recipes-bsp/u-boot/u-boot-common_2017.11.inc
index bfdf1a0..65f1228 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common_2017.11.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common_2017.11.inc
@@ -12,6 +12,7 @@ SRCREV = "c253573f3e269fd9a24ee6684d87dd91106018a5"
 SRC_URI = "git://git.denx.de/u-boot.git \
     file://MPC8315ERDB-enable-DHCP.patch \
     file://10m50-update-device-tree.patch \
+    file://v2017.11-fw-utils-build-fix.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.7.4


