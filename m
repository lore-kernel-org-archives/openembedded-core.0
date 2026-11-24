Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31035.1795560767425488546
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 14:52:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=kAN/e5zZ;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso50467155e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 14:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795560766; x=1796165566; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9Lk0vS4d/A+jKQ9uiUCozPbTRpHSg+L4eujFPLj9J8k=;
        b=kAN/e5zZcM6zDIpGLJxAg3capPsBV3NlHY9h0tEDtE9EPsHfkofkXDzYkF/z1F2wfx
         pQe/gjgelIC7UTzfkDUaWkHF3lTCuZVKqXf5mxXa2X/LOrU18HNH68w62OPhnAfXjBdV
         1RV2gUSp8Zg+X+Rt8iM3/R61/llRTnFinllmYsd7um5Ts9MEQO6BlFLv7KH72z9AzE3B
         PtP4Ag6FeZsQocu3ri9RiK7RU8oFN9YHZwuKsHGdbcTIZTPzW+QRwAMN57ne+vtzIPvm
         GJAxsVQtAPENp+Wx4vhCMnqwLCHuoN5SwU4KC56fe9vqP+xbSGr3ZPv+oTIoTbBlmTB6
         I8Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560766; x=1796165566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9Lk0vS4d/A+jKQ9uiUCozPbTRpHSg+L4eujFPLj9J8k=;
        b=Ga1dcO7zOAnpZaEDeq9De7QBZPKeQF1mQ/aL0MqkA/4xS3S/tIX4st5f61/YECDaJw
         ntcHnAfP6qVPtotLuGQhdjuqsYn1FjwLhOctSLUjrQOJxpz9cCYD2GHd2e5pBnMEhZ9t
         N2iElpBIoEt5S5SRv6eM+6y2N4yy5dIvBp5SM5P0cwSHwXTZ8AF79ZG2GCoQx9GVSPrQ
         qMKpWMpVZY9OaQU6lE+GlXcwv9ELYPG/6aOj5/4iQBZlpzac8gxPuISfuh1TFOzUKWe3
         y4It3znv3ZUuYndsf27GE0nexOrvXyWfzGfgcVkiIduGS+qYocojZaNBA37G1Ko+kGSN
         f6Bg==
X-Gm-Message-State: APuU4Z/Jy4E+KzQsy3p/bN6909096NFrrt6hLYaAnUnVaRnELhTFzUsb
	pLG7jxtlmKxzbOJMBcp06cdkaWGcpvNutrpnZvtlp0iUZ8qBtbJSmabewGRZd0AnwiOZkB71lDr
	HZ1RauEs=
X-Gm-Gg: AZFdTZdRIyTiUw+KeMivraXYw5sGcIjWJOZfxzwTW3y2jWS23OsJF+jv7VuRlydzxeo
	tiTxoBjd6DfeoQox7vLZnAiAd1P/l9l7dCpz6FS5ZtJT8QIgPbb9CDKej1LMi1cqcLFfrZl1GRb
	RWGium8h3NQ0sKO6wDG/1dS7I57yrVC0EwzR9HE7Hn4/Kg98/BkxFTpSfsepWEzz5E1RfI33jbw
	39hdrGv2jwVqySp26rV+wHweG2d7MFr87lAtk+AKuIkRzSMo4R//oxWLL+9C5sw8/DcBURHaHCZ
	YmDD4PwKyWeQyxz48kaaMHXjCRKYtihklHOBSExbNthWnVYonL66S8TJgRElXiuAIs8F6TEhqNA
	32gGV9/s9ELAtnpWou6mYwmKg1vInWshhCtqzeeApkfMboP7TOjPx4Lo6RyJLugK+vEIJbbEO3q
	7KPk1NSeilCuHeEyLLhJ+TxH7RGGGCYK407k+W+OgayA5gG5iDYkCPooxISJk/qdl9qGlunJUPq
	K7RABaIMePinDGo17WyxKsiR7bZCJrq34i/73QVGOZx7JLcHe0set8yVy8NMx7uz7qBrRwaoVAD
	f9/5YK11MJsxwyU0e24mkA6V7oua5ucTfHdmLMX2QpoQPwiMgy+V2DyKuKDLUIzerEcAphOF+vP
	GpJAiRd5Ax7pNX4bcOSm8QfrbcEMIQvZxl3PVI8wrr1RhMwpi15Q=
X-Received: by 2002:a05:600c:4504:b0:4a1:9078:911 with SMTP id 5b1f17b1804b1-4bb888284d7mr340767925e9.31.1795560765598;
        Tue, 24 Nov 2026 14:52:45 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad644140b5sm27446707f8f.17.2026.11.24.14.52.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:52:45 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 06/21] sqlite3: fix CVE-2026-119375
Date: Tue, 24 Nov 2026 23:52:23 +0100
Message-ID: <8afbe3bb846a6e1e0d73cb7e9b86428598ed2dee.1795560372.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795560372.git.yoann.congal@smile.fr>
References: <cover.1795560372.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 22:52:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251108
Content-Type: text/plain; charset="utf-8"

From: Arpit Patel <arpitpa@cisco.com>

This patch applies the upstream fix [1], which fully initializes the
page read when the WAL and database page sizes differ, preventing
disclosure of uninitialized page data. The GitHub mirror commit [1]
corresponds to the SQLite Fossil check-in shown in [2].

[1] https://github.com/sqlite/sqlite/commit/e5bf119821f25be1d7f10ef0a2edbe175289166e
[2] https://sqlite.org/src/info/f9b4ee369557c36c

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-119375

Signed-off-by: Arpit Patel <arpitpa@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../sqlite/sqlite3/CVE-2026-119375.patch      | 47 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.51.3.bb |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119375.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119375.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119375.patch
new file mode 100644
index 00000000000..94bf2752a32
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119375.patch
@@ -0,0 +1,47 @@
+From 01d00d78bc2c756021a2f8f01733d58af7dec1ef Mon Sep 17 00:00:00 2001
+From: drh <>
+Date: Sun, 16 Aug 2026 10:49:39 +0000
+Subject: [PATCH] When reading a frame from a WAL file where the WAL pagesize
+ and the database pagesize disagree, be sure to fully initialize the page that
+ is read.
+
+FossilOrigin-Name: f9b4ee369557c36c606666bd7e6d8dc4685d87531993d3ce4e7a718aa814a5ac
+
+CVE: CVE-2026-119375
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/e5bf119821f25be1d7f10ef0a2edbe175289166e]
+
+Backport Changes:
+- Applied the src/wal.c change to sqlite3.c because the recipe source
+  uses the amalgamated SQLite layout.
+- Omitted manifest and manifest.uuid because they are Fossil
+  repository metadata and are not needed in this source patch.
+
+Signed-off-by: Arpit Patel <arpitpa@cisco.com>
+---
+ sqlite3.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 1889632086..bcd317206b 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -70412,11 +70412,15 @@ SQLITE_PRIVATE int sqlite3WalReadFrame(
+   i64 iOffset;
+   sz = pWal->hdr.szPage;
+   sz = (sz&0xfe00) + ((sz&0x0001)<<16);
++  if( nOut>sz ){
++    memset(pOut+sz, 0, nOut-sz);
++    nOut = sz;
++  }
+   testcase( sz<=32768 );
+   testcase( sz>=65536 );
+   iOffset = walFrameOffset(iRead, sz) + WAL_FRAME_HDRSIZE;
+   /* testcase( IS_BIG_INT(iOffset) ); // requires a 4GiB WAL */
+-  return sqlite3OsRead(pWal->pWalFd, pOut, (nOut>sz ? sz : nOut), iOffset);
++  return sqlite3OsRead(pWal->pWalFd, pOut, nOut, iOffset);
+ }
+ 
+ /*
+-- 
+2.35.6
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.51.3.bb b/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
index f76ca8bd564..79d12d4b039 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
@@ -15,4 +15,5 @@ SRC_URI += "\
 	file://CVE-2026-119377_p2.patch \
 	file://CVE-2026-119373.patch \
 	file://CVE-2026-119374.patch \
+	file://CVE-2026-119375.patch \
 "
