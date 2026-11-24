Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31017.1795560745665628267
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 14:52:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=Ql3f8TQk;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so2784038f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 14:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795560744; x=1796165544; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2yRHzI+RxyOjZ1/yk7lXB9VgspNvmNJ4k+KNpxwGnB8=;
        b=Ql3f8TQkFPOtlhmHDajC+su/DbA6Pin0UNODDKPCkP+/qMnz1IOUqS3E0ESc97tW6r
         3CbhFPVpiFSD3SFbcIY6UKyw4RXlV2/chzRpt+WRrag3cnhb/LHP3OH+ehH0hYlcsC3E
         bJcWKGqLXTrgY0OG6D4/qI0UCVrVkshh4pvVaE7zt84+ykZUVQ7QdqY2JGsk9EHnkvu1
         rTV/wjnjCQJlFZEO7CgySSykRaCkcc38BI7itYtflW+xUM5VozFclxD7dTlayWXTfcu6
         gOkZ1qdoJBXDe5pg+Vjr9HtTxrR5qfyLLjnika7UgoOX9zcP1WWCwoskqzz/S2IpmD3I
         llRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560744; x=1796165544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2yRHzI+RxyOjZ1/yk7lXB9VgspNvmNJ4k+KNpxwGnB8=;
        b=IK+MfVlWB2pEgiIVi7nmNEUTbOgO0Zp2yJEg//dQ0XKRrPWDvPIxvIJEVLkLNM26qq
         Z73mJDtfiNqIkDX9auAABfRK/1bjHMfR08fHEKBdLIEk0qWSaYjPBhSXoOKoyd//Eqwg
         byG9vURQxyLFffNrpFc/ugLUSB2jBiscmb0YzIxPs7nvbz9r0OSQ2bC3AJyN3cOv055a
         tcro6Hwxuq1LRItay3Wm+HP0Q6NcNS9fWR65sO/BaZ/fTsXzG84Wiy0LyYTgdtbhb7wu
         5q5Up1v4riWNnLmDYnJLoJn41sx8ilngIqj4q2ap3I0Fu2kqiojiVsZLIcUmcPB6ldpQ
         g+BA==
X-Gm-Message-State: APuU4Z89bFAXwP7f9iUSvkrlWdYtfnTYOlAlX33AZG6+gqxWZ337TXA+
	KNfYjnuglx06hQ2Q0lxnBYRHGQsSKS/YYCFgcTEdcg5KvRcl52A9z0PT753t7z0cV3c/llazLsA
	beevxpDk=
X-Gm-Gg: AZFdTZd98wlERR5QIi9YeklwTklQ2KDSTVo/ZTcS6fpsqmTCODlrShb7iwSEMPXEIUy
	IiQbJcCU3/ERvg9JYRZ32AgS+8WkJxwRxS2L/La2/lHFn4ohLs6yQLBp/LdwLsurevyjBKEB4GX
	jyXFNlpZh6TkKcD2bBwHJ/h7YYOIVPweMguKHlWd8npC7PVVBGqJFXh1v1lB+Vz13GfQlnt8AgW
	HGJVAymkwWyXbgTQIGN1smSpzae/9dKRqSubf9JOU3rSyw77MMF54Hyful+ifQG1PERhBkbkBxi
	pQEVDBcChY10FPsm7GTd7xZCE9rtmOqG+xO/isF15sl9W+5GRFH4LLcQ253NtxCE5ttdOG4VjFi
	6BTEsaNhIumyYXpB8XilLgv+uquSDf1/pzf8vs9vR2k3rmmJhwEa+znl0aqQXYpto3KOFYfmfbZ
	vrhWI2OaVKM8gpc7MvleDde+Q9I0+mkXLW5FnBnYhnbWAkJhzBL/t4i0aW2Wy5sN/W1+T5cQPdZ
	0K5ZdfJY0+2aJcFc6aD11NfUwvRRSt2fm0e6ljUwlK5EbuiGNtfzRlgD3fMdcAUcUdhqsMrm7lU
	nd7QBG9ka9C7i11OUphULEX444LptfNa3v1khH8mmtlVIxPU6J8VTcWZcPswRRuRisbRSwoJblB
	cJWsoyo6v1Kv3AY/HAaRI2nExWQZM
X-Received: by 2002:a05:6000:310a:b0:48d:f383:2356 with SMTP id ffacd0b85a97d-4abb5eabd3dmr34501190f8f.53.1795560743916;
        Tue, 24 Nov 2026 14:52:23 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm30462488f8f.52.2026.11.24.14.52.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:52:23 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 08/21] sqlite3: fix CVE-2026-119378
Date: Tue, 24 Nov 2026 23:51:15 +0100
Message-ID: <6ac90ac92db451d1f3aca1d53347248464dc993b.1795560335.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795560335.git.yoann.congal@smile.fr>
References: <cover.1795560335.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 22:52:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251088
Content-Type: text/plain; charset="utf-8"

From: Arpit Patel <arpitpa@cisco.com>

This patch applies the upstream fix [1], which prevents a use-after-free
in R-Tree when a manipulated shadow-table schema causes
sqlite3_last_insert_rowid() to return 0. The GitHub mirror commit [1]
corresponds to the SQLite Fossil check-in shown in [2].

[1] https://github.com/sqlite/sqlite/commit/d21bd37c7cfc1b85b17a6703555f0926b6236e04
[2] https://sqlite.org/src/info/6a9e1415659f9e75

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-119378

Signed-off-by: Arpit Patel <arpitpa@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../sqlite/sqlite3/CVE-2026-119378.patch      | 52 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.53.4.bb |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119378.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119378.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119378.patch
new file mode 100644
index 00000000000..23d9aaf6aad
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119378.patch
@@ -0,0 +1,52 @@
+From 347b0263ce597345446fcfd259d063ef86228191 Mon Sep 17 00:00:00 2001
+From: dan <Dan Kennedy>
+Date: Thu, 24 Sep 2026 20:14:31 +0000
+Subject: [PATCH] Avoid a use-after-free problem in rtree triggered by an
+ attacker manipulating the shadow table schema to ensure
+ sqlite3_last_insert_rowid() returns 0 after certain INSERTs. Problem reported
+ by Claude and Ada Logics.
+
+FossilOrigin-Name: 6a9e1415659f9e75940b3c3a6f6e123f61c5e9e2a7a612693ee395d7b7567bef
+
+CVE: CVE-2026-119378
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/d21bd37c7cfc1b85b17a6703555f0926b6236e04]
+
+Backport Changes:
+- Applied the ext/rtree/rtree.c fix to sqlite3.c because the recipe
+  source uses the amalgamated SQLite layout.
+- Omitted ext/rtree/rtreeI.test because the extracted source does not
+  include the upstream test tree.
+- Omitted manifest and manifest.uuid because they are Fossil
+  repository metadata and are not needed for this source patch.
+
+Signed-off-by: Arpit Patel <arpitpa@cisco.com>
+---
+ sqlite3.c | 12 +++++++++++-
+ 1 file changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 76cb284..d2c0f23 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -219417,7 +219417,17 @@ static int nodeWrite(Rtree *pRtree, RtreeNode *pNode){
+     sqlite3_bind_null(p, 2);
+     if( pNode->iNode==0 && rc==SQLITE_OK ){
+       pNode->iNode = sqlite3_last_insert_rowid(pRtree->db);
+-      nodeHashInsert(pRtree, pNode);
++      if( pNode->iNode==0 ){
++        /* If the SQL statement has succeeded but sqlite3_last_insert_rowid()
++        ** returns 0, then the shadow table schema has been corrupted somehow
++        ** (e.g. the %_node table has been replaced by a WITHOUT ROWID table).
++        ** It would be dangerous to continue in this case as the hash table
++        ** implementation assumes iNode==0 means that the node is not part
++        ** of the hash table. */
++        rc = SQLITE_CORRUPT_VTAB;
++      }else{
++        nodeHashInsert(pRtree, pNode);
++      }
+     }
+   }
+   return rc;
+-- 
+2.35.6
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.53.4.bb b/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
index 911f5720298..1aea7cb3741 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
@@ -30,6 +30,7 @@ SRC_URI += "file://0001-Add-option-to-disable-zlib.patch \
 	file://CVE-2026-119375.patch \
 	file://CVE-2026-119379.patch \
 	file://CVE-2026-119372.patch \
+	file://CVE-2026-119378.patch \
 "
 SRC_URI[sha256sum] = "0e9483900e92cd5de8fd48d16bf9200145a61f7fd5be542a5ac81d8a9516eb9c"
 
