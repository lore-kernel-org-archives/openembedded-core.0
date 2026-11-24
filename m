Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30993.1795560770985614471
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 14:52:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=YJWy7SBe;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso2921894f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 14:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795560769; x=1796165569; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sxy3LkzGBQ60uNa4m3/RzrP/sKHzgPxIpxBx8gQL7t4=;
        b=YJWy7SBe3vfKbqW6WheJA11O9V/YCMS2Mw6o5avOYPaF0F+jIxkzjmqzpGgwKergAO
         31Kst6m2Rh5YCPkSQY3DgdejZtptycB7XGICWG+S7Xl0RdofF9Dt5Fn5A9poy+0aUnCP
         zXx/6IYWAkv5/7lFopNrrdIL34VAfKL/WWi7awrt00te1RUKh63RcXuop9ggzOxHPuEu
         1wGyaqWLsUqu3vuldN/T33a2cF0+waj33sw7MG5HQP40MVhNX8YnuF+wb3q7qR6T7OWI
         VDGr42/2Q5/CMlRSa9KP0MsmnNF2ymr+ZyF7ZVgOJuz9FWIt7p9XFswbC5m72dEifMsh
         kY9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560769; x=1796165569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sxy3LkzGBQ60uNa4m3/RzrP/sKHzgPxIpxBx8gQL7t4=;
        b=GBb77+Hx3Fv3Oq/YN4CO0lC9pFBzuSA1ZwDMxtHbxouc1IMlmt4cdTdych1KnQ2CEm
         FXUEjAWtm95WiOP18QKec6G6BxQ8lTLwjE15lsZfV5Id2Wxe7jfnbwLCCULIPYov69IV
         5o5gu/upjh/wT3WqWgiQFGrvapEG5IFXPPj/Nm4kDPrgd7ddKmW9ojNOUs0JXZEC5BJY
         8S8IH9zw0xL8wujDJk+kANo911MEiQk5UOTZiogq1S4YfZCraAUM+XMt9t/CNiqOCFxB
         uKGnbT/fW/BciqC+W/sWRQiFpTbT0xHipNb7jmPry3GCPy2sYWayW8APczy7+yQ6KUrm
         1nwQ==
X-Gm-Message-State: APuU4Z9lzZ62FXeYBhiEH8vKwu5BlGHabpcnWdt5hCMV0/9DeZgi9zY3
	Z0klGFo2MjZRrAkBD+r54rwwow1fEKyrP6r/gcqq/xJo0ptpo74EGP1sJUDsYagcVp6GaHtcgyr
	1RFgZoYU=
X-Gm-Gg: AZFdTZeFrdLJ9Gy9GEiXPpWV++c9zgz2JUgINWZXnCjO5pCThSwtlrY75MHJtybYSyW
	6pX0RCverEXZD5CvcX3M89sv1NVvge3UYOtvN+HTUQJpLLTRlJgTuGGXHwHjuErsFM9AXlJkAhB
	Mn08B58ZDkUOtBERPW5upJMcafb2OUDh+RPyQ7+KQSHRSqCPnUSkXDp1lKg1txbcI5VJCyyfSj5
	4i4CM+N4IeTnLi7j3JcrP0eR2R1oD2kj0LgVKlHcJju4hZ72TqR2pX/beMvJ8gfLAwSvxkexDYI
	R0KBB7WhL3l757+RHUxv7QyUL5BrbJF+BD8eTLDc3jgOJxQlBNawPt9DUO87t/EbR2kUFbAE/OD
	+fYyVDn4AVSeUnVppzOvlthi3XY9pohgOBJBbyls5R624U9kwF/w/+Ejwk2H202SjAAzWQZr0Rm
	RxzxP5uHSyVoZK4U4f+MlJkHnEaTlnjHB6ndTAOgW2XajcZHjBllehNMhcyI9OAP/+3udlELRjL
	aDCEhPefxP8t5PWfO4r3LXRSwF0Ogz2Hi1zQl22vFV+NTTmlf8uoHFNfFwi4BZ4k/e/NZje/sQw
	ntVfVWUlPRGFIOcx1udrkPmDs6N9FCOgvqTEhisRNXrxR221fjrQ9Ma+8aIcR9V1XG52Cm6vySc
	+C7mbqrtsyvAasJwEubwbGhKNtNsU
X-Received: by 2002:a05:6000:4812:b0:48d:b650:69aa with SMTP id ffacd0b85a97d-4abb55185e4mr30554767f8f.50.1795560769261;
        Tue, 24 Nov 2026 14:52:49 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad644140b5sm27446707f8f.17.2026.11.24.14.52.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:52:48 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 12/21] sqlite3: fix CVE-2026-119591
Date: Tue, 24 Nov 2026 23:52:29 +0100
Message-ID: <e2c3735b9ddfe925b40c298cc428afffee90e7a2.1795560372.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795560372.git.yoann.congal@smile.fr>
References: <cover.1795560372.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 22:53:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251114
Content-Type: text/plain; charset="utf-8"

From: Arpit Patel <arpitpa@cisco.com>

This patch applies the upstream fix [1] for stack exhaustion in the
count-of-view optimization. The GitHub mirror commit [1] corresponds
to the SQLite Fossil check-in shown in [2].

[1] https://github.com/sqlite/sqlite/commit/eff50a067c55f972909e7780e506e91382d08de2
[2] https://sqlite.org/src/info/ab621a3e11ee4acc

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-119591

Signed-off-by: Arpit Patel <arpitpa@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../sqlite/sqlite3/CVE-2026-119591.patch      | 40 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.51.3.bb |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119591.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119591.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119591.patch
new file mode 100644
index 00000000000..3b616842fb4
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119591.patch
@@ -0,0 +1,40 @@
+From 0894e1c6c54cde37d822bd1cb367fd1ed2765732 Mon Sep 17 00:00:00 2001
+From: drh <>
+Date: Mon, 5 Oct 2026 12:18:23 +0000
+Subject: [PATCH] Prevent the expression generated by the count-of-view
+ optimization from getting too deep and causing a CPU stack overflow.
+ [bugs:/info/2026-10-04T05:34:47Z|Bug 2026-10-04T05:34:47Z]
+
+FossilOrigin-Name: ab621a3e11ee4accce14bf6c90a7cc273d9c25a7c3d9dd2466f2bdc2bbbf8084
+
+CVE: CVE-2026-119591
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/eff50a067c55f972909e7780e506e91382d08de2]
+
+Backport Changes:
+- Ported the src/select.c change into the amalgamated sqlite3.c.
+- Omitted manifest and manifest.uuid because they are Fossil metadata
+  and are not needed for this source layout.
+
+Signed-off-by: Arpit Patel <arpitpa@cisco.com>
+---
+ sqlite3.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 19ab450812..f3f10400c4 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -154164,6 +154164,10 @@ static int countOfViewOptimization(Parse *pParse, Select *p){
+     }else{
+       pExpr = sqlite3PExpr(pParse, TK_PLUS, pTerm, pExpr);
+     }
++    if( pParse->nErr ){
++      sqlite3ExprDelete(db, pExpr);
++      pExpr = 0;
++    }
+     pSub = pPrior;
+   }
+   p->pEList->a[0].pExpr = pExpr;
+-- 
+2.35.6
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.51.3.bb b/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
index 4073a48202b..6347fcd8d51 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
@@ -22,4 +22,5 @@ SRC_URI += "\
 	file://CVE-2026-119376.patch \
 	file://CVE-2026-119371-dependent.patch \
 	file://CVE-2026-119371.patch \
+	file://CVE-2026-119591.patch \
 "
