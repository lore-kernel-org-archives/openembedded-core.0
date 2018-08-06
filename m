Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id A0B3D745BF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 22:57:28 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id k21-v6so7538378pff.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 15:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yYFLOADz9wzI8IP4a4yyvcgpux47eJe1/mmivD/KHqg=;
	b=NBTZ54Fp+QOGR+ipO9TqzPlTeO0UavMzmgr9msyU25ZhgOPVR9ksxazn2a5ocjo2Yv
	iIZgO5EIMkW2hfnZGvQONrLF+bXPSOtMnTD4TS7zO+2ZfB76FUR2wt7zC+ervHywPtz6
	QyxjOFys/noNV3XE0bf+0R3PYHYpLsj25t2bAPrmT0RV3Tn0BXh1wpAmeU/Vqu3fFwIy
	/t7+y5L9l50EFeRK2x/iww8dXIrUw7LTbKXIl8cd/uVjiYSriID1MFzwOSEAeWJLLzFj
	MbwxL1ISsbZmQuht7TLilBbKR8kIOUj/3oOjmZy7qMhOKmgTpj1gfOfjELsNSKb9SyaX
	NpUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=yYFLOADz9wzI8IP4a4yyvcgpux47eJe1/mmivD/KHqg=;
	b=M7gEpumqWOznGgzjL3vnvSbOsQoGpAklaUT0CLibBUgUf3gmMaohIIbBljssAC0tFF
	MIasZmVGTeShA6xhHTC8kr68QTSwDHbWOnHWOmSzp3Pjh0b6TqZMnAuGSCSafalqYj2e
	EyZKCCcA6bgpLzU6UTpefeg+jy1PJBj7DEmeUhF1E96XDaJvV9htoZx1WJV8TS+fr3Db
	01jHgqEeTmRmWDMdO2Y4IuMq0YhDY6xBsvVMyj7hrEAtmu5oZj7t6icvJbkZZjmkkzUm
	d6EBFcEwSEXDKUUVPgWDcC9DL+YzU6Xi4r1ZO/H/EwBD8A9fvmPagKYkP6yghrSiA+iB
	dkLw==
X-Gm-Message-State: AOUpUlFhSiY7qMd6Hi295GLvjkjW+xjftqXxdpkRVDYcs5Q8Ouu/2f/C
	L1hZNwzIZ+2jtE41UFOr9rAhRDx7
X-Google-Smtp-Source: AAOMgpcG39Fm7EF10eCvIbs8tkf+ZnTi54vCmii2ralKe658+kHb2f6xANgpt0OQWKJ9Ail0sxQ+Rg==
X-Received: by 2002:a65:6551:: with SMTP id
	a17-v6mr16286798pgw.132.1533596249409; 
	Mon, 06 Aug 2018 15:57:29 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::1d00])
	by smtp.gmail.com with ESMTPSA id
	x1-v6sm11993137pgr.59.2018.08.06.15.57.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Aug 2018 15:57:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Aug 2018 15:57:02 -0700
Message-Id: <686091cb772584e50fb5a42b88dff3fc342e7b8f.1533595822.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1533595822.git.raj.khem@gmail.com>
References: <cover.1533595822.git.raj.khem@gmail.com>
Subject: [PATCH 05/18] bootchart2: Update to master-tip
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
X-List-Received-Date: Mon, 06 Aug 2018 22:57:28 -0000

This has several fixes to get it building with glibc 2.28+
remove backported patch which is not needed now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ssing-default-value-for-BOOTLOG_DEST.patch | 30 -------------------
 .../bootchart2/bootchart2_0.14.8.bb           |  4 +--
 2 files changed, 2 insertions(+), 32 deletions(-)
 delete mode 100644 meta/recipes-devtools/bootchart2/bootchart2/0001-Fixed-Missing-default-value-for-BOOTLOG_DEST.patch

diff --git a/meta/recipes-devtools/bootchart2/bootchart2/0001-Fixed-Missing-default-value-for-BOOTLOG_DEST.patch b/meta/recipes-devtools/bootchart2/bootchart2/0001-Fixed-Missing-default-value-for-BOOTLOG_DEST.patch
deleted file mode 100644
index 118814a807..0000000000
--- a/meta/recipes-devtools/bootchart2/bootchart2/0001-Fixed-Missing-default-value-for-BOOTLOG_DEST.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 2225ab2038bfe50f16f972e39d89bcd0bd7767f5 Mon Sep 17 00:00:00 2001
-From: Steffen Pankratz <kratz00@gmx.de>
-Date: Tue, 9 Feb 2016 13:49:42 +0100
-Subject: [PATCH] Fixed: Missing default value for BOOTLOG_DEST
-
-Upstream-Status: Backport
-
-BUILDLOG_DEST seems to be a typo or mix-up which was introduced with 281d1df80884bf2969c509ec60ee8a6593524fe8
-
-Signed-off-by: Peter Liu <peter.x.liu@external.atlascopco.com>
----
- bootchartd.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/bootchartd.in b/bootchartd.in
-index f58ab9e..30af677 100755
---- a/bootchartd.in
-+++ b/bootchartd.in
-@@ -37,7 +37,7 @@ PATH="/sbin:/bin:/usr/sbin:/usr/bin:$PATH"
- 
- # Defaults, in case we can't find our configuration
- SAMPLE_HZ=50
--BUILDLOG_DEST=/var/log/bootchart.tgz
-+BOOTLOG_DEST=/var/log/bootchart.tgz
- AUTO_RENDER="no"
- AUTO_RENDER_DIR="/var/log"
- AUTO_RENDER_FORMAT="png"
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb b/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
index b3c889b0a8..396d0ec0a1 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
@@ -92,12 +92,12 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
 
 SRC_URI = "git://github.com/xrmx/bootchart.git \
            file://bootchartd_stop.sh \
-           file://0001-Fixed-Missing-default-value-for-BOOTLOG_DEST.patch \
            file://0001-collector-Allocate-space-on-heap-for-chunks.patch \
           "
 
 S = "${WORKDIR}/git"
-SRCREV = "48e0071048564c6af75ab969e842d6dec808da09"
+SRCREV = "331ada031f1d65f6d934d918f896e1c708c64bf7"
+PV .= "+git${SRCPV}"
 
 inherit systemd update-rc.d python3native update-alternatives
 
-- 
2.18.0


