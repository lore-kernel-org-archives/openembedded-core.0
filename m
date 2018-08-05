Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6367260557
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Aug 2018 02:07:14 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id j8-v6so5145479pff.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Aug 2018 19:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yYFLOADz9wzI8IP4a4yyvcgpux47eJe1/mmivD/KHqg=;
	b=Kl/xjsHl4snZvMyKkBM4Cqmswu0DFBewmf8T9cDlteE+UaNUqKQm3l7zQx/Bok9k2K
	erhGQAKvznIXzajjb5JM5uynQvqfgPiVnyCsyr7pDK02HgL2XckMs6O/8wsYo/W4vj6Q
	0nH2SytBGdK3KdhE+nXYx9NayeS0LVAXM3piXPCOeErNvEOtKfIxdLDDJiwsnQywlax7
	mig4gzU7PmIUlxOwIFsZvGs7cIvjOM8rj1SDAzt7ds4wHyYwSwYK16vcYyAbGgKA84zV
	gUEdTdt8CGtX7rqrZ1n7qKmlIYrHHyf1ZaxjWCQ2LQuzzedm+xhVYDkUvLwqpP4a7dcy
	88Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=yYFLOADz9wzI8IP4a4yyvcgpux47eJe1/mmivD/KHqg=;
	b=RZ8LNSlRSziXIq5EvRI0ciIDMi0v1pZgQBO0S0VWgLDF4xP2+LXYhzTmPR8lk3u1eQ
	Zgq2Z7v+A+sXCaUOTzdWb31xy30ZLauoxJt8J1R7dmyfHVcDKH5a9Hd+mfcNQpidyzPh
	+Xt8qDI8LqgcOYLiGJEVc6V99GCRnghY1HhY0MuKJfx33tFphvCZR93Nn/uqOq1SGBKQ
	9Pw1wOTcwpXOjuH2Ya8ZgdaFeSKr3XYA9m4I9g9VYltUYif+uCiKlWh0S/V6qQe3DUES
	mhzisbzxqSsdtC0WIKO83EJwDjn2XyYldf8wPbMxD8/29BgYuntORib4fD6cBf9zWk0C
	Zp1Q==
X-Gm-Message-State: AOUpUlFTxwNVUFO7BNT7hAlNbnI945c1iAC1AH26+AQD+QVv29vLpN+C
	m9rZcVuKXru/XjDPUc8n11Wihu/a
X-Google-Smtp-Source: AAOMgpfQS02ZSMTwRxVw9b6zkZhb4VTagBZ9XgiM3hE0zRuyo+DYWTh7oVBf5lYYpcGObpR2ZvzJlQ==
X-Received: by 2002:a63:b605:: with SMTP id
	j5-v6mr9556994pgf.437.1533434835082; 
	Sat, 04 Aug 2018 19:07:15 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::5b3b])
	by smtp.gmail.com with ESMTPSA id
	b195-v6sm4486021pfb.2.2018.08.04.19.07.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 04 Aug 2018 19:07:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 Aug 2018 19:06:57 -0700
Message-Id: <7428a130692baad170d0a2d99d2897e829f827ad.1533434674.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1533434674.git.raj.khem@gmail.com>
References: <cover.1533434674.git.raj.khem@gmail.com>
Subject: [PATCH 05/10] bootchart2: Update to master-tip
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
X-List-Received-Date: Sun, 05 Aug 2018 02:07:14 -0000

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


