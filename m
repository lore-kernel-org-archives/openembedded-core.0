Return-Path: <kristian.amlie@northern.tech>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id CD0797882D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Dec 2017 08:51:04 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id 6so1103665lfa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Dec 2017 00:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=northern.tech; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qG4A4l2+l3Vb/4aka4TBIqgFrlgLJSQVjNQ4BDG99Hs=;
	b=XbrEsz+1MOYClR4wiCIegBjE/kW77sHuNx4bFhotvZXDDFv98RpmxxMnp38mroT8Bl
	a5vd7VbkoLttv7Av7IhMBhR0URiyEwWvX9Jmdiy9h9iTx+wMNwNF8S1mLO39On/+wSQC
	JyMSztgtp1YIFs2cYXdqpp6nPvQwYq0eHQZQG6TX0yY45nDxV5s4tpaR9Te+T/8atxv2
	sHmCsOblYt2kTf2gxfYvZXs4UW3SZpbUhbcHFjYkrn+Pd4HYAp4ZOA4ILuZu6wjVvnK9
	bXYOt7FysjCD76nXaioafWhl1Vwq+sXBwBqE9rjZplbLy355U8mzc1a2PAViaFP1MIW5
	21Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=qG4A4l2+l3Vb/4aka4TBIqgFrlgLJSQVjNQ4BDG99Hs=;
	b=o+Lw7mdCLYFPO8GNMri15jZ4O6+Q2wC74jI/oG+o4RK7FZ4gcqL/q0HHO+SJjfnpYR
	237XW3y+hRJ0ADpJJ7vJhyLfL2ZfKLUjiyP7b8UMwg0jn3AWQfR3MxzgFia4yMdFXfz/
	bXg0S7TWq3iF5/zYccSIVgI1QcsLwCwisXy43Ty/1MEsi+fxsDe5cbH7kRNIoH3ZdTyL
	uUOuzQ0Q1DyfxOxFlHG/bI4F2UJ4MDeynI6SCCit96PL05R7ttsXMx/Uv6AEkBjkoTgc
	ThMIjsJV7xbuiErz1hVs8ivdhzdVqfJyeUWAJm7wlWAoDwqAvSuGlmAp29NSub4kKHsc
	a0/A==
X-Gm-Message-State: AKGB3mL8bqnq1XTYbHKU2/FJXKEnltJYUsghB3mA6ABAAq/WEvDjEYT5
	ZwrMRlC8s35tseGnIb03rIr1yx4m2iY=
X-Google-Smtp-Source: ACJfBosxBbyLkaPNp22HO5vaebLYEQSYYRpEDzhbTKZyIzDGXWlA/mgmlWjogUijZW9u1KOOWjXWRQ==
X-Received: by 10.25.201.87 with SMTP id z84mr5356435lff.62.1513327865041;
	Fri, 15 Dec 2017 00:51:05 -0800 (PST)
Received: from localhost.localdomain ([195.159.234.190])
	by smtp.googlemail.com with ESMTPSA id
	r66sm1249354lfe.48.2017.12.15.00.51.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Dec 2017 00:51:04 -0800 (PST)
From: Kristian Amlie <kristian.amlie@northern.tech>
To: openembedded-core@lists.openembedded.org,
	Denys Dmytriyenko <denis@denix.org>
Date: Fri, 15 Dec 2017 09:50:52 +0100
Message-Id: <1513327852-23896-2-git-send-email-kristian.amlie@northern.tech>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1513327852-23896-1-git-send-email-kristian.amlie@northern.tech>
References: <CAP9ODKqOpuhz-EOTY8bMj-x7s4gr7wY=FY_WhjwXpCgB0c7dnQ@mail.gmail.com>
	<1513327852-23896-1-git-send-email-kristian.amlie@northern.tech>
Cc: Tom Rini <trini@konsulko.com>
Subject: [PATCH v4] u-boot-fw-utils: Fix broken makefile in v2017.11.
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
X-List-Received-Date: Fri, 15 Dec 2017 08:51:05 -0000

See the patch for details. This patch has already been applied
upstream, but we need it for v2017.11.

Signed-off-by: Kristian Amlie <kristian.amlie@northern.tech>
---
 .../u-boot/files/v2017.11-fw-utils-build-fix.patch | 41 ++++++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot-common_2017.11.inc  |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/files/v2017.11-fw-utils-build-fix.patch

diff --git a/meta/recipes-bsp/u-boot/files/v2017.11-fw-utils-build-fix.patch b/meta/recipes-bsp/u-boot/files/v2017.11-fw-utils-build-fix.patch
new file mode 100644
index 0000000..2a8dd1e
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/v2017.11-fw-utils-build-fix.patch
@@ -0,0 +1,41 @@
+From 8ff69a3f4db024ece80b89cf23ca9f7e6f0fba58 Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [http://git.denx.de/?p=u-boot.git;a=commit;h=ded84f90a1066eef5f34daa4539273de64f7b811]
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


