Return-Path: <kristian.amlie@northern.tech>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id B9609606B2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 14:52:33 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id x204so2927868lfa.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 06:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=northern.tech; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Sv6mC5FAd22vwVhnmqra7edwDRuwthXB6qBpciu8Y/E=;
	b=VDzRGuogUiabKtw8W9xu5k/06sS9DVMyS9O92qS61zd+ZjgAujVkgb2Yv5W4nF2ACE
	zNL++d3A00zgEgvHabhx4V4obC/tRf424CBJ6/2m6IWw3lHB8UkgxBImU3/o7pOtaKRe
	RpsrQ4Tlgurfh6VZ8b3CZvKjHTKuZPLCuKG+k8EM5Wt1xc7wg4tUTr0MoWoQQaXkDi0U
	z9fp4Duiiw0JXEyLnskz7p2ymvs6kbUDOhH8Umxww+FT3Ha4ixXnIbzxIsnGAldqeWTs
	bCXFHtXn0+8XgnaGdriaSKCrZEmwY3f2z7V/a20aFbnbgyNTG1oAKN7MH1A3OwemNvEk
	Zsjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Sv6mC5FAd22vwVhnmqra7edwDRuwthXB6qBpciu8Y/E=;
	b=XVXVmWHjFDrej22o7Jx2RPgkwIN3x3rC6YmVTT8peYsE3+zJkqgA5b/LG4/0BQ0Erl
	7i1WHjAFKpuLXDJBI2WQns+UUaFamp1USrErSIUXlCkKQAVFirJdStKDcKObBM7Rq20O
	zvaslMKt7PVOGuPb5bbJ+NIhAVgSjfCTVmSamfv8V0N5eaWgH2Qf46ReNJcbLg2WioBY
	Z4WhjSJOClASlCqeEjTACxfocYHNXtMSa7Hv7Tt6YSgZKVbN9nkGPlLNzqT8WWdYzIxj
	rQ2l0+I9qDtv/wqItHUkft8tmUnybV2hk9MraLjZ/JX90XLyJws0PVFZRDqb7e75o59n
	kVfA==
X-Gm-Message-State: AKGB3mIJbNPAHsTwqKJJIemKnH4stzV3JKUCO4B33ehQjNytbfHluxk1
	VPg/7GkVomen8Xb1QYE8zO/dntbmRgI=
X-Google-Smtp-Source: ACJfBou56AslFztYcE25a6fczGZN8DNOMuBvIZYwtaBTKr1DaZtkUPjMHwtiomNpHVTXtlKn4nTF8Q==
X-Received: by 10.46.43.65 with SMTP id q62mr1604545lje.56.1513176752552;
	Wed, 13 Dec 2017 06:52:32 -0800 (PST)
Received: from localhost.localdomain ([195.159.234.190])
	by smtp.googlemail.com with ESMTPSA id
	p21sm305402ljb.85.2017.12.13.06.52.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Dec 2017 06:52:31 -0800 (PST)
From: Kristian Amlie <kristian.amlie@northern.tech>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Dec 2017 15:52:29 +0100
Message-Id: <1513176749-28928-1-git-send-email-kristian.amlie@northern.tech>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1513173807-26292-1-git-send-email-kristian.amlie@northern.tech>
References: <1513173807-26292-1-git-send-email-kristian.amlie@northern.tech>
Cc: Tom Rini <trini@konsulko.com>
Subject: [PATCH v3] u-boot-fw-utils: Fix broken makefile in v2017.11.
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
X-List-Received-Date: Wed, 13 Dec 2017 14:52:35 -0000

See the patch for details. This patch has already been applied
upstream, but we need it for v2017.11.

Upstream-Status: Accepted [http://git.denx.de/?p=u-boot.git;a=commit;h=ded84f90a1066eef5f34daa4539273de64f7b811]

Signed-off-by: Kristian Amlie <kristian.amlie@northern.tech>
---
 .../u-boot/files/v2017.11-fw-utils-build-fix.patch | 41 ++++++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot-common_2017.11.inc  |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/files/v2017.11-fw-utils-build-fix.patch

diff --git a/meta/recipes-bsp/u-boot/files/v2017.11-fw-utils-build-fix.patch b/meta/recipes-bsp/u-boot/files/v2017.11-fw-utils-build-fix.patch
new file mode 100644
index 0000000..6aadae4
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/v2017.11-fw-utils-build-fix.patch
@@ -0,0 +1,41 @@
+From 2d3078f3c0bd0656dadf6341888d608c0fe921ea Mon Sep 17 00:00:00 2001
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
+
+Upstream-Status: Accepted [http://git.denx.de/?p=u-boot.git;a=commit;h=ded84f90a1066eef5f34daa4539273de64f7b811]
+
+Signed-off-by: Kristian Amlie <kristian.amlie@northern.tech>
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


