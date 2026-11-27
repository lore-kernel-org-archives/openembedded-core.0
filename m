Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1455.1795801778323227647
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 09:49:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=ksbZEuEY;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4acb44dcd7bso7510399f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 09:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795801776; x=1796406576; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aurjlxDFALYfR99B4VqnwQuYJcSUaMcgF6JT42IDlc0=;
        b=ksbZEuEY+8F+lsteCH6bDoWQezTaW7ARMqqNivSkRT2meuugkgKKc2FDh3wfRGgLyQ
         z2TqJXWx7PO94Rn6gL3mO18DPXU0+5HEMis5H616kcodorPTS9ElzDLEdWo5ZTtG8niE
         yRGPOYnVoym/+CKkTranzKoRyTFDu1l9oT5MYfnmWALjiz3t2HP7EntS04EbbqwOwUKE
         U03dXZ/FftnPt7iNQXgvs4tIgqdtq+Rcwxh9nUh9m5zHXYGX1w3bRTgd9GuJrWr/AaGE
         13ovqIX2tGuAXWuJZSo7QeWUxyDkvNJIoT09gXLmb1W8XHp0pN9Exi3FJrRXFzorRvDU
         4UJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801776; x=1796406576;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aurjlxDFALYfR99B4VqnwQuYJcSUaMcgF6JT42IDlc0=;
        b=isaCJpr6LOF3CjXRgfbOScMise5WtimZqlNTBQ/gfdpy5jwE+RSU9egEy+3Qz4j+f6
         ko1KyF1TvmKEuZ/iuXS74xo6eJlsZIObhAplNWkgeLi3ZFOXQOl2myQ/TvhKC8JBy8Y7
         1OPSaOoRCw5wQukki5lQ32fBeY5TZ7PX5MXtIhXeSk86g6snBWGSzutnawOHkFMm/r5Y
         kXDRQAfjjcyEJjqX+yjgSjaLWpo4J2R/Kyvy+vQZOLEOMfIN2m9ZwqlcRpSw6uDO/+qM
         Xu1tZ1LdD0CgYD0jXPwHJ7V7YD6DL+JezuClj4RBno3usIDS991SbsqeDOJei2N/bxsE
         TaBw==
X-Gm-Message-State: APuU4Z/HGoeRPcysk79aA2s/Wa9QG3Lsev+X6/9dcTlCs7Hf5+KbTE1f
	c0fTV31ShuqvJcZwvOnCRRphrRTJqyBACX9Y4wr8kx1sMOD5DBRjbWMro+GvWYCsoyPxqZ4VzCO
	I4WkCg34=
X-Gm-Gg: AZFdTZc+oYlA45UoIlRLFH3mRRPwBN761m8MRLN/fstR6KH0LXXKBcpAfSmkqHsw2KZ
	bwcPQa6yu8x25mz6FvLngR7lOHgmQroTQkShp8AHUH1jRkndP0EWs82+lpgB+jUevmxpKCl3NF9
	TnrPw0g703l33vPc9pSQiRN/qOwEQFnmplvtyN3fwktkjGxKZlYjw7gawNRcrsMmoT6Ny0Gxfkv
	IGoPUXFvhOVLy0Ry9uKHPoXf1qnI45df2Euyqc8NEYX2TuV6SjlIQ9mMML7StxtrJSg8vPEpay6
	fmZEmVhcC/XadCBFcvdfnLAjNw8wqjyskZtYWIrjQxoxu5Ogp8wZAb2V0YanvjbWg8WDUaNnfS0
	ypslOy8J+7L0h7JoAR0Amm7owPOVT5zPuMZqw3v1bUlKu7Ecqm2FbNByir7SCowuso4z1AOYWsF
	37u1M5UrUxIQJfLYWUvscZsfpjY0A40ZuRXFNz5wU00ZWpu+S90+2SwH/5n0aFAtSV3BKXrOz12
	pYwBubhNHCxrSo2j7dOXQgbCKqU41p/MCPPWbJ4Wcd33+P8BR23LHnplWQOs7aCFXdttp6MRl0a
	IVum2WfQMXjwzSgMFLypiIxfzcGJsnvagbQdgL3al93mhGIxTxRRFY3CHV4ysezcyWLM4AOePvP
	tr5T3h8hSgsCLnC8oBrkL2wac/J2M
X-Received: by 2002:adf:e011:0:10b0:48d:f99d:a0d2 with SMTP id ffacd0b85a97d-4abb2168f53mr36548620f8f.15.1795801776542;
        Fri, 27 Nov 2026 09:49:36 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm49374624f8f.16.2026.11.27.09.49.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:49:36 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/37] sqlite3: fix CVE-2026-119379
Date: Fri, 27 Nov 2026 18:48:49 +0100
Message-ID: <7c6abe1b033d6e1239a2761b8d1dbf757cca6e39.1795798718.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795798718.git.yoann.congal@smile.fr>
References: <cover.1795798718.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 17:49:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251412
Content-Type: text/plain; charset="utf-8"

From: João Marcos Costa (Schneider Electric) <joaomarcos.costa@bootlin.com>

This vulnerability, marked as High [1], was fixed upstream [2] since
3.54.0.

Backport the fix to sqlite v3.45.3.

[1] https://nvd.nist.gov/vuln/detail/cve-2026-119379
[2] https://github.com/sqlite/sqlite/commit/64459c87cc702d600704fb77ee40ca1782398a52

Signed-off-by: João Marcos Costa (Schneider Electric) <joaomarcos.costa@bootlin.com>
Signed-off-by: Bastien Jauny <bastien.jauny@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../sqlite/sqlite3/CVE-2026-119379.patch      | 70 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.45.3.bb |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119379.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119379.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119379.patch
new file mode 100644
index 00000000000..4ecf5386902
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119379.patch
@@ -0,0 +1,70 @@
+From 7ced15a861a05e25f5a8ad29d0dca95806af3a9e Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
+Date: Thu, 5 Nov 2026 12:06:23 +0100
+Subject: [PATCH] Avoid a buffer overrun when processing a strategically
+ corrupted changeset. Report [bugs:/info/2026-08-16T10:15:25Z |
+ 2026-08-16T10:15:25Z].
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+FossilOrigin-Name: 3f57024aecea0f3b565ed823cf94b085031c481fd6323c1f2e4319a53500864f
+
+CVE: CVE-2026-119379
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/64459c87cc702d600704fb77ee40ca1782398a52]
+
+Signed-off-by: João Marcos Costa <joaomarcos.costa@bootlin.com>
+---
+ sqlite3.c | 9 ++++-----
+ 1 file changed, 4 insertions(+), 5 deletions(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 3ba2e27..9f4fe9d 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -228393,9 +228393,9 @@ static int sessionChangesetApply(
+   int schemaMismatch = 0;
+   int rc = SQLITE_OK;             /* Return code */
+   const char *zTab = 0;           /* Name of current table */
+-  int nTab = 0;                   /* Result of sqlite3Strlen30(zTab) */
+   SessionApplyCtx sApply;         /* changeset_apply() context object */
+   int bPatchset;
++  int bNew = 0;                   /* True for first entry of new table */
+ 
+   assert( xConflict!=0 );
+ 
+@@ -228411,15 +228411,16 @@ static int sessionChangesetApply(
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
+@@ -228454,7 +228455,6 @@ static int sessionChangesetApply(
+           rc = SQLITE_NOMEM;
+           break;
+         }
+-        nTab = (int)strlen(zTab);
+         sApply.azCol = (const char **)zTab;
+       }else{
+         int nMinCol = 0;
+@@ -228506,7 +228506,6 @@ static int sessionChangesetApply(
+             sApply.bStat1 = 0;
+           }
+         }
+-        nTab = sqlite3Strlen30(zTab);
+       }
+     }
+ 
diff --git a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
index c1e2006a6fe..926f8223fd0 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://www.sqlite.org/2024/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2026-11822_CVE-2026-11824.patch \
            file://CVE-2026-119373.patch \
            file://CVE-2026-119374.patch \
+           file://CVE-2026-119379.patch \
 "
 SRC_URI[sha256sum] = "b2809ca53124c19c60f42bf627736eae011afdcc205bb48270a5ee9a38191531"
 
