Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30975.1795560744476322106
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 14:52:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=IpW+FsEF;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso2921743f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 14:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795560743; x=1796165543; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0gtszMEK3fVV5lTwJHs6VpBcMGIgWySnHeYa7/bg438=;
        b=IpW+FsEFMST4um7bqBxhfFit51mNPHSca4Ihyq/NVwbiiM6NXAmm714PiGs4YJz+pJ
         4mFS/bXNKw+4hZ83oPMF+stavyvc3YzFMnNdjvRSqOl0S37Pw9QR1hS0jLmZanB06+tQ
         sbJ8/VOgC5dPVLCF9fuvj9JzD1deYthbnUgVugOqlNf8VckbwFbZ9m8n2HS82Z/4BDU0
         w8DSfZOX9lOh3ApGPrePa3yivhRyTySdhgKgkki3ZIPdBUyP5Tv8n6oTnCNsEw9shBTY
         jpB6K4Nt03HKWjH3PeJ0ZIFjDe14YjIYXXlrCiUYejjbjp7OXHnh8MC/+6uNy8ipV4ya
         JJTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560743; x=1796165543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0gtszMEK3fVV5lTwJHs6VpBcMGIgWySnHeYa7/bg438=;
        b=KK+Yps2Fgcg0O6Qw7gKSBZpCeiXJXeqYY9UcnYOSTW3sIMs0gJKrTdHqoRzvmcGybU
         uIr1jF9pw0naknKI3acwNVSdDbvYdMJNsT/kXCElBSqfH/cUJMe/0Y7iXW7JYrHOS8/8
         yC1nfud7NYOhDuVSWR1zNaLZ36gCddEDf5h6YAimkGhr5yCB7nAnKAW21EEZR+p13Qch
         +zqiGQT5+jzxecIdPc5GfgQhQJ3XqGWiLL7KLpbqG0tW6c+k/+MdRbtdcVJ0j1LISrn8
         uafI9DQJvAQ6L/j0S/XPJtoh6AnOAdme7qgl/3jMWa1Y/vWOHkDbcQ8sVFVtfb7QYrsU
         A4Bw==
X-Gm-Message-State: APuU4Z/OwE8Zx3CDOAyiUMxg+vyeHPUwUHvQHIodX99+6Ss8oDwgh/3S
	r/ez/nhBA1xYXZr8RTFz02dT1JCo0qsJUUwiY3q8EdHHj5jpDIv2+mVARbAEy/dBNwFXCrCAAnp
	zVEmbwOo=
X-Gm-Gg: AZFdTZcqm9u3LkWrDYWE7A9A15mkZe21GC9FKi23Q5V88uh5+SW9g7fk94DVwbgCzeS
	N2r+zNe737/k9KryxUWs69pIiZC9Ds1u7ximCVMSsQ/KJA7H7t8fBYup2ztOJia97iEuTqK8SQN
	+jqManWY196Knoee1o5lIZG2iPlY1teg+meS86neZS9C5ppMJhIDUuRRt0Uy25HQXVprxUST98x
	cpnoftST2EWn3jHGLc+Y4irxgm5iFhnWaSxduBAobcJr0zF0dBmUq225xiHdzt8wdZ8c83GloN7
	d7bVmZw8p10VuYpl91GEZu+jmBD67wmdaKszuHXxdHhVA/AU1Fivr6Zaks72MjoQdGoefvDdZEP
	Gg4Vgq7yGaXnQ3a9/b5OlOKC/A2cyyTXlfiix1Hqj47DS97sRqLdWq9cYovS1agEQhhCI9PH/XM
	N4IXkbptWrrm1Ktvyq780hCnoWWMehmo4h4NTEUYHmu6mpxTxdI4H9TDm7eWAmV49t3YRd37MWt
	33nYbLfSNgaJZ3BGTR2H+C8urlutroCEa3v8s9BYln2aNJa1ihtjhv+BAF73WRBxDqR086Oe5VU
	Gke0NJLB7fV19ts7+0pE/G536Vh/Z1NZyEcHurV+RPrF4Gc9QGSBMP6KSKBhXus2pChxsYENAIv
	78wM+sEtsBzbhdehnyoPzs7U5/Fy0
X-Received: by 2002:a05:6000:47d4:b0:493:8c32:94 with SMTP id ffacd0b85a97d-4abb400ae31mr20422301f8f.38.1795560742672;
        Tue, 24 Nov 2026 14:52:22 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm30462488f8f.52.2026.11.24.14.52.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:52:22 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 06/21] sqlite3: fix CVE-2026-119379
Date: Tue, 24 Nov 2026 23:51:13 +0100
Message-ID: <1b4fde19c888c8d1c81c7d34c7155b529badce49.1795560335.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795560335.git.yoann.congal@smile.fr>
References: <cover.1795560335.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 22:52:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251086
Content-Type: text/plain; charset="utf-8"

From: Arpit Patel <arpitpa@cisco.com>

This patch applies the upstream fix [1], which prevents a buffer
overrun when applying a strategically corrupted changeset through
SQLite's session extension. The GitHub mirror commit [1] corresponds
to the SQLite Fossil check-in shown in [2].

[1] https://github.com/sqlite/sqlite/commit/64459c87cc702d600704fb77ee40ca1782398a52
[2] https://sqlite.org/src/info/3f57024aecea0f3b

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-119379

Signed-off-by: Arpit Patel <arpitpa@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../sqlite/sqlite3/CVE-2026-119379.patch      | 79 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.53.4.bb |  1 +
 2 files changed, 80 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119379.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119379.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119379.patch
new file mode 100644
index 00000000000..1fad466b3da
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119379.patch
@@ -0,0 +1,79 @@
+From 17e3b5a6f6c3a5e852a86597ad68f259d802296a Mon Sep 17 00:00:00 2001
+From: dan <Dan Kennedy>
+Date: Mon, 17 Aug 2026 11:31:59 +0000
+Subject: [PATCH] Avoid a buffer overrun when processing a strategically
+ corrupted changeset. Report [bugs:/info/2026-08-16T10:15:25Z |
+ 2026-08-16T10:15:25Z].
+
+FossilOrigin-Name: 3f57024aecea0f3b565ed823cf94b085031c481fd6323c1f2e4319a53500864f
+
+CVE: CVE-2026-119379
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/64459c87cc702d600704fb77ee40ca1782398a52]
+
+Backport Changes:
+- Applied the ext/session/sqlite3session.c fix to sqlite3.c because
+  the recipe source uses the amalgamated SQLite layout.
+- Omitted ext/session/sessioncorrupt.test because the extracted source
+  does not include the upstream test tree.
+- Omitted manifest and manifest.uuid because they are Fossil
+  metadata and are not required for this backport.
+
+Signed-off-by: Arpit Patel <arpitpa@cisco.com>
+---
+ sqlite3.c | 9 ++++-----
+ 1 file changed, 4 insertions(+), 5 deletions(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 04f4eea..39b300c 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -239370,10 +239370,10 @@ static int sessionChangesetApply(
+   int schemaMismatch = 0;
+   int rc = SQLITE_OK;             /* Return code */
+   const char *zTab = 0;           /* Name of current table */
+-  int nTab = 0;                   /* Result of sqlite3Strlen30(zTab) */
+   SessionApplyCtx sApply;         /* changeset_apply() context object */
+   int bPatchset;
+   u64 savedFlag = db->flags & SQLITE_FkNoAction;
++  int bNew = 0;                   /* True for first entry of new table */
+ 
+   assert( xConflict!=0 );
+ 
+@@ -239395,15 +239395,16 @@ static int sessionChangesetApply(
+   if( rc==SQLITE_OK ){
+     rc = sqlite3_exec(db, "PRAGMA defer_foreign_keys = 1", 0, 0, 0);
+   }
+-  while( rc==SQLITE_OK && SQLITE_ROW==sqlite3changeset_next(pIter) ){
++  while( rc==SQLITE_OK && SQLITE_ROW==sessionChangesetNext(pIter, 0, 0,&bNew) ){
+     int nCol;
+     int op;
+     const char *zNew;
+ 
+     sqlite3changeset_op(pIter, &zNew, &nCol, &op, 0);
+ 
+-    if( zTab==0 || sqlite3_strnicmp(zNew, zTab, nTab+1) ){
++    if( bNew ){
+       u8 *abPK;
++      bNew = 0;
+ 
+       rc = sessionRetryConstraints(
+           db, pIter->bPatchset, zTab, &sApply, xConflict, pCtx
+@@ -239438,7 +239439,6 @@ static int sessionChangesetApply(
+           rc = SQLITE_NOMEM;
+           break;
+         }
+-        nTab = (int)strlen(zTab);
+         sApply.azCol = (const char **)zTab;
+       }else{
+         int nMinCol = 0;
+@@ -239491,7 +239491,6 @@ static int sessionChangesetApply(
+             sApply.bStat1 = 0;
+           }
+         }
+-        nTab = sqlite3Strlen30(zTab);
+       }
+     }
+ 
+-- 
+2.35.6
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.53.4.bb b/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
index 29187e75b4b..2a0517efe67 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
@@ -28,6 +28,7 @@ SRC_URI += "file://0001-Add-option-to-disable-zlib.patch \
 	file://CVE-2026-119373.patch \
 	file://CVE-2026-119374.patch \
 	file://CVE-2026-119375.patch \
+	file://CVE-2026-119379.patch \
 "
 SRC_URI[sha256sum] = "0e9483900e92cd5de8fd48d16bf9200145a61f7fd5be542a5ac81d8a9516eb9c"
 
