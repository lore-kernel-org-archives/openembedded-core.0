Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30980.1795560747629952243
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 14:52:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=QC9Vkb+2;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so2784043f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 14:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795560746; x=1796165546; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BpKd4eAevFvogK5uk5Hy6Y8yw47AH/B8yBTGjjLhHmc=;
        b=QC9Vkb+2RiyMDXt8WDc7JLunmxtLmTDusoG60veeCv8xfZekaruab+Pa2wX5jO1C53
         f2BQXNxfGtmPnnSs2YlHmRW2yLBK4uGfCOJpmglVr1yBrHG5aHGX1fh91M2cFBCTxDud
         be4eLY5oFx9H2jGBuPlNRiZynUkD11BrfzD5rVIY6UvviqMWGlWO7HsdszD+poF7ACrt
         iIvODYZ5E9z2df/FmYo1laFs8+7QwfNE7dW0FDZFnQacmTWJNzU03fpNo9Ie4yoAEIyM
         hwGOSXvEi3K+s/MGeCyQgtE9YgjxJeRgpWyYQKZwFjKU6hEDfyuISM8tigwVcvY37FYu
         hyDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560746; x=1796165546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BpKd4eAevFvogK5uk5Hy6Y8yw47AH/B8yBTGjjLhHmc=;
        b=RUMlTQekfPyFkQSj36n/41S/YxC7O+8Ekrtc+amDUv8ZlHikaVXNKKkFFghYsmTZOC
         xciYCL5EC/Aoe4zJyw93kVb4kHH7GuRk8ZcxMDWDkzb3vp8NV6p8ZmZYKV2O8Kh4KRim
         o5Q49MyjByYhg2SoomZ6aoTTeFxxer/czstF2ZaxbYv4oCA4c1NUt0HhIhIbFFoauOBp
         YNOP1bTGflXBcgofbMQw2TMC2ZnBKa/beMx3t22sviFCN1Dm/NWcHPte06ColFSOV1Y7
         Is1A83nVawY/fLZh1pmHKxx96Ts3ncFuYOcmsWzlAFwNT4vmgxmFlxxmjub1tZtE0WEX
         4ihQ==
X-Gm-Message-State: APuU4Z8yHpfpIVauSD5agNNRkS3n9SiLHFkEwhClqjeBgl/ImjIJf6kw
	7RqInekOAgILWmmAB711tQZNvAkRSGSDTGnQng6Dca8VsQ0Ws0+0bTftqcq/2vgsLUi3Bi92JpM
	6ClQL7sE=
X-Gm-Gg: AZFdTZdHCXloC0gZDZfTIIl7mSctmpdtn5rg9UmXe5wHDVa/M+8sI/YFSrwE3roFP1K
	v0P0dmwAUkYY/aOjER0uPZ4RkUWKVHCHLAFjkAPyKA0G8xeXcS0omShqtbmCiadYcLUiiH0A6fx
	T3UVsjHvhRl5qJ+E/flb8fAOtQcYFRRczIUuF4DSoiu6Eqz8OI4UfNooPPka/3lyKLXYnkpeMS/
	Fnjdkl/fTVJqPOMjQAtyA0ddhvuw726jRchvnLWpexmQPTUQurIAWH4OcYX/j/Aw1bo6KGPAUhJ
	CNWI+Do3Lzx1s/MwacBUHt6JqZCPjz7xbNkMPLOz5lx1w3CikQlTqNjWsnHfnMuzKoWWQtswB6i
	6YO5iFj1aZwE0/Kw3XgaxqyzEvk4NZNwiporzeY1RXapJrJ/Om9dIvHF147OaqR8GkCIapSCbK/
	UwvBSYbGKsV4uI1mZpyYXqb+znGHFVyyik+5VKvkAUPZqln0dAJk5Eh4Lc6xswSCB6WfxuaOeHv
	YkqOPj1hReXwV62MyX/iHoDRlf7Yf50y2YadnkhatYUZC3pLQRLca3jPkhDeayn/LGNgZpCJna8
	q4E7SS2Inq65OR9ProXptV4NwM3jK+Id6FAjFD1fEbte/ePD5dgd/gIV5w2r0qFpt3JfzVF6pbU
	oNYi1GDF/lNnFsBEWV82XdCvn6TTE
X-Received: by 2002:a05:6000:248a:b0:487:b50:101c with SMTP id ffacd0b85a97d-4abaa97702bmr29623283f8f.5.1795560745936;
        Tue, 24 Nov 2026 14:52:25 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm30462488f8f.52.2026.11.24.14.52.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:52:25 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 11/21] sqlite3: fix CVE-2026-119591
Date: Tue, 24 Nov 2026 23:51:18 +0100
Message-ID: <a7331e0fc5628e41e050aff1100c46ba1cfb937a.1795560335.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795560335.git.yoann.congal@smile.fr>
References: <cover.1795560335.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 22:52:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251091
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
 meta/recipes-support/sqlite/sqlite3_3.53.4.bb |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119591.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119591.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119591.patch
new file mode 100644
index 00000000000..57ca37d9092
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119591.patch
@@ -0,0 +1,40 @@
+From 5dbe255431ad2b935db31e8e3c2c66284e2709ef Mon Sep 17 00:00:00 2001
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
+index dc245c4..d814a1c 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -156251,6 +156251,10 @@ static int countOfViewOptimization(Parse *pParse, Select *p){
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
diff --git a/meta/recipes-support/sqlite/sqlite3_3.53.4.bb b/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
index 93ee778292b..f616c70073e 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
@@ -33,6 +33,7 @@ SRC_URI += "file://0001-Add-option-to-disable-zlib.patch \
 	file://CVE-2026-119378.patch \
 	file://CVE-2026-119376.patch \
 	file://CVE-2026-119371.patch \
+	file://CVE-2026-119591.patch \
 "
 SRC_URI[sha256sum] = "0e9483900e92cd5de8fd48d16bf9200145a61f7fd5be542a5ac81d8a9516eb9c"
 
