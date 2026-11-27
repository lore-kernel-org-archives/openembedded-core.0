Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1457.1795801779591701480
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 09:49:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=WhuAuK6T;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so5707550f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 09:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795801778; x=1796406578; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QeiR33halZP+z4o5YxfcQeiN3mXpVz0IIa+5cl7oweg=;
        b=WhuAuK6T/a8lrTZfmUJRaW+ZXc2P4vZY35nC/1Dmhm9SYGR6/FEBFQpb7EWRYZV7uC
         2bJctN0kEJCbXSidiMcB1n4pvuhLiqBmVLwvWXOxJQoMWR1IweBFINAejr/l65LEiV6l
         wCf0+ICg7P6LdRAin4QmD2hO8Ji/Ai91ZcxuL8CzMZZIPqZ1qSd48pKP1Gv73w5lPXKX
         Y/A7qR0G6M4SH3hvL9d56LC6ujc9v3rlebPwPziIW3Mj82okBvDKI9f0kQE4q7B+/HQW
         +hVEWEyDrzn5dth97tXGcGNLDhsvJIni3z6KsMN2D3XXK1nKOgjukKZ8G0mysa6P4hX3
         Qstg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801778; x=1796406578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QeiR33halZP+z4o5YxfcQeiN3mXpVz0IIa+5cl7oweg=;
        b=onDGQueuPt9HJCeZi2aCu3NYtGODHXJmoFKJTJiAYtCfHLkk4YdeIxWCyKMnhGNlhI
         ClKSMSpiT9jff+7v8RTpEBfJ3kyxs0aXvyWCFpzqNEhST1PYWa1AnXC5RE33wkvl273S
         UKEGvEIM/ZqXVen19Np8IeU9SX16hzMunyyHtwZf13XidRzIH5McpuWyT3KNsB4ANrOU
         dOkx76F54TjBdIAd+atrLSKsWoslEatOSIuvD1TBM7J4lpBrQej6RiD0zp8pfGcQBYGE
         u4pMpjfzkaQgSJBV4cFYxWM4RZOyc3hiXaIQnMkZFXa9pDf0o5NQ2rmt6Bt31ts+aWnw
         qebg==
X-Gm-Message-State: APuU4Z93z+OdLMDColF+IxBZEUDTVr9bq2K8cblVk/AvgSSOfb/Pyg9T
	bQX+XlAZyhyda1JgHgEGvornS2B4+pxPuZbMfknh9SxppjBbX4jKBT/vgha9PCevFu13SYrF74h
	hoD7a0U0=
X-Gm-Gg: AZFdTZfQmi7EPHDJc4xJyVd6D3ZUpyxg9TF2IIQ6ffkyu7NoFHZxfAs0QAxPnXhdJam
	980gB0ftAHRZm4xpdiBf5a9LzQedWFHUDvxT5fHjw7UXF1PxKi24pGkECplY+YKYI1NH6SBECyx
	awqblpeMW6ibzG3Ty4H7CILGoHfY00G/THaMHg1TKSawLJ6EAGJ5o76Yhj0/oUizC06UILNajx4
	bp4eDAfNx1pOZAmb9bDd3nTcL4Tx1gAlIxTv8LfH0Ve1e00zhNIbmH2cDo0vNdC6IbBnKyxl4A0
	H9IpexHmx5u9Zj6V8CQs7wl19LcRzgyjzYw86KEwAmKFlBEmwTOgbcdGB8ekqHL3Ny0u2PXRT0a
	J5dqjJsrNndILofpB+NLgpphGcejwxXShUpMxOElIknYOCc6CDtRzl3ReOcZYotbLGCfVF5o+yQ
	Nx58+aBXru+QgC/ekmRz64+oEjscxRuNxRMZFdQY56MCMUPCNiZBciZjAzopUXgLLoE1TjpFDca
	b5SAhWv+1WUSgJvwigiUkW83yVjIYn5qU6pzoXK5ExzkNEHAWFLIH2JyBzEJTsiLAvkob8b2KUB
	DpDyaLQ+nX4l5vCNwoMkkJ07Pi6q8IbbSpQG/V59uZIyUck164oyiDoYb4mpY9+LY/UoEBgx+nT
	3eR3L4ZEES8yNeFrRGf/qGJxKjpPv
X-Received: by 2002:a05:6000:4705:b0:48d:f851:ee5f with SMTP id ffacd0b85a97d-4abb225e5f9mr51749941f8f.24.1795801777801;
        Fri, 27 Nov 2026 09:49:37 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm49374624f8f.16.2026.11.27.09.49.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:49:37 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/37] sqlite3: fix CVE-2026-119375
Date: Fri, 27 Nov 2026 18:48:51 +0100
Message-ID: <993996e8219dd868818edd4a790d0c4f1baf903e.1795798718.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795798718.git.yoann.congal@smile.fr>
References: <cover.1795798718.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 17:49:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251414
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
Signed-off-by: Bastien Jauny <bastien.jauny@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../sqlite/sqlite3/CVE-2026-119375.patch      | 47 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.45.3.bb |  3 ++
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119375.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119375.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119375.patch
new file mode 100644
index 00000000000..390a3f5234b
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119375.patch
@@ -0,0 +1,47 @@
+From c9e05db641c387aad309081b35afa3e703aa075d Mon Sep 17 00:00:00 2001
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
+index a397e4d36b..afcf2b1969 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -68201,11 +68201,15 @@ SQLITE_PRIVATE int sqlite3WalReadFrame(
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
diff --git a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
index 84d67ce977f..d5d5f101b0a 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
@@ -17,6 +17,9 @@ SRC_URI = "http://www.sqlite.org/2024/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2026-119377-dependent_p2.patch \
            file://CVE-2026-119377_p1.patch \
            file://CVE-2026-119377_p2.patch \
+           file://CVE-2026-119373.patch \
+           file://CVE-2026-119374.patch \
+           file://CVE-2026-119375.patch \
           "
 SRC_URI[sha256sum] = "b2809ca53124c19c60f42bf627736eae011afdcc205bb48270a5ee9a38191531"
 
