Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31020.1795560747368259944
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 14:52:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=g+ZlGIsa;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48dee593f18so4795403f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 14:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795560745; x=1796165545; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wvhO74IUd6n8ZagX3Re2qgFbZB5krBJfZXbLHhh+hKI=;
        b=g+ZlGIsaICNT6im6q+IzlbhipotFK799LTVKR+biWs8MMg5EHQu8ArOovujDWXb+Zl
         mbwV3nb2ZA2poQh2eHUgzKbSMpWJ57RLrArKvIFfxQcJRslaJllEjDHuCyepx7Z2y7hK
         REt1QNU9EQQaMfMQip6Q/1TrCQwZ4bzsLLsFDXJMzIEfs35V5fVXuy83J3q0szkgcEA4
         ewwy2ZGacIXuOXzUcaKJZlZDkyHZ6z8jIzKSn6VyRpvRmRhjmEZbujIE7YM56ZIlF6vp
         FNDEpTXh9MYskQmAuiW7wnpg2MYoSYdsgfJkJVDA8j/GHgqdHpJzTaNeZhwIWTF4a4XG
         Tv2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560745; x=1796165545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wvhO74IUd6n8ZagX3Re2qgFbZB5krBJfZXbLHhh+hKI=;
        b=O/aRg3DD0XyYibcOZSF/3OBk2WZQcE/Ti3BYgNplQChuFt1ZkuyjFM0glRdfkFiGhv
         tWkQguVlx7wdqHoedmj34iuIv8yXfbaOMQlecK8VORUDzOe6m/AoUzZyjF2/2tkZtaVp
         yplSx03ulmgHYYFaNRuDlZMQJ0vJ3Px+QZeySuxGkA2UfK5iTE99z7EkZ2sjrMNHSoHc
         +ZMTQ5iGzb9/k3VEvWI17H8phyBnTiKrnmgcz+rPiOwe8m4vcQ1fk9YiiG4e0rfn42pe
         d1Ys6onDEKO9OFxR6WKoUeujXeL5MC375q3GCQQdxYLeJ8vb+D/81kcL1CuPFh7AQiIk
         DGFw==
X-Gm-Message-State: APuU4Z/JCgy1vIhmp3OpBCNyRijJpOQ2Sx7PVmC9MduL5YGL6sbgz9g6
	RE8i4hlVG8EVf40gjE4jKXi1eelt3LhE7Yq7N+V+F/zRa8v/2ifZKpKERenuqCN8a5WASc5N9Zs
	MenRjqio=
X-Gm-Gg: AZFdTZfuTNwbCwlz0ByiV2gJM2CpnTvbiepZF4pD3hMCYzpBXVw8enYnIR+3XPaEc4S
	mhPtoDAWjaRMF5Dg5ieOtlz9J0gSPSPcdRpDBAQZfOC2MRVS/7WfBt3WSbDaEwnxjYOtl1qQjFE
	Jn0iU6nAG5CWPibE9IJBVXxe8GgYfr4aNkaNUA1yCf5Jmyr3yKoxOHkkvWJnMehvsUHfbTpDZiE
	Nc9seuuEu64aAI7yQ5++WuBXlZKtjxeQE/FpEH/lwremJUW3SSMGJzR5A6aLmE0iFNj4UXCHLC3
	4NDu0KLaQxeMl8lW50c10VHoRzAqjQvbACeBsSkDtd6dxvc3fr5KCtBcuOZbjGw8kqOLJWjXNOe
	awzWNICFsnWFUWbwO1kVfnq2v/0rTaYthe8zq/tdK9s2x4EEJOHwA89ps2uFR7ENXIcUJkk+1d1
	NwMqMVLX/MEqLvPxG0fRGVj0yJFxgylO81zntDJ+hazKGEin7CBG0Gcv6omQg1J4CQbfm8uQ5FD
	AskLNgijc4Uz2XBqE9MBXVF+DrbezfnR6/aFioWqbEYMH7TK5Ps3rb9dzM/uovY3LeD03Wy8sTj
	zEEmlIfPC0YkT+llUjBWvKkI7SV4txIIRdIG40yLw9QB562eSx1VFiKCcSOzOYnK8h0PLVe3hB+
	wvfriikj0DWSGljeYfIo+2cb6F04oBOz52ahBzQC2CDjkKctutg==
X-Received: by 2002:a05:6000:2312:b0:48e:b62:d133 with SMTP id ffacd0b85a97d-4abab6de675mr32993340f8f.5.1795560745447;
        Tue, 24 Nov 2026 14:52:25 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm30462488f8f.52.2026.11.24.14.52.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:52:25 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 10/21] sqlite3: fix CVE-2026-119371
Date: Tue, 24 Nov 2026 23:51:17 +0100
Message-ID: <5394a83c67a1d91a45eb2259aa95462dd0c6a11c.1795560335.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795560335.git.yoann.congal@smile.fr>
References: <cover.1795560335.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 22:52:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251090
Content-Type: text/plain; charset="utf-8"

From: Arpit Patel <arpitpa@cisco.com>

This patch applies the upstream CTE recursion limit [1]. It uses the
expression-depth counter and limit already present in SQLite 3.53.4, so
the prerequisite patch is not needed. The GitHub mirror commit [1]
corresponds to the SQLite Fossil check-in shown in [2].

[1] https://github.com/sqlite/sqlite/commit/e6ff280c839fdfc7418fd5add12e8f32702a17fb
[2] https://sqlite.org/src/info/f54730871303e655

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-119371

Signed-off-by: Arpit Patel <arpitpa@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../sqlite/sqlite3/CVE-2026-119371.patch      | 103 ++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.53.4.bb |   1 +
 2 files changed, 104 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119371.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119371.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119371.patch
new file mode 100644
index 00000000000..ecd644dd3d5
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119371.patch
@@ -0,0 +1,103 @@
+From e6ff280c839fdfc7418fd5add12e8f32702a17fb Mon Sep 17 00:00:00 2001
+From: drh <>
+Date: Mon, 5 Oct 2026 09:32:24 +0000
+Subject: [PATCH] Limit the depth of recursion for CTEs using
+ SQLITE_LIMIT_EXPR_DEPTH. [bugs:/info/2026-10-04T04:58:58Z|Bug
+ 2026-10-04T04:58:58Z].
+
+FossilOrigin-Name: f54730871303e655a70f3167ce1a39dcd4e53fcf017d225f429e2bb67ad96604
+
+CVE: CVE-2026-119371
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/e6ff280c839fdfc7418fd5add12e8f32702a17fb]
+
+Backport Changes:
+- Ported src/select.c changes into the amalgamated sqlite3.c file.
+- Omitted test/with2.test because the extracted source lacks the
+  upstream Tcl test tree.
+- Omitted manifest and manifest.uuid because they are Fossil metadata.
+
+Signed-off-by: Arpit Patel <arpitpa@cisco.com>
+---
+ sqlite3.c | 36 ++++++++++++++++++++++++------------
+ 1 file changed, 24 insertions(+), 12 deletions(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 816b998..3432915 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -151472,6 +151472,20 @@ SQLITE_PRIVATE void sqlite3SubqueryColumnTypes(
+   pTab->szTabRow = 1; /* Any non-zero value works */
+ }
+ 
++/*
++** Check the current subquery nesting depth.  Return true and set an
++** error if it has gone too deep.
++*/
++static int checkSubqueryNestingDepth(Parse *pParse){
++#if SQLITE_MAX_EXPR_DEPTH>0
++  if( pParse->nNestSel >= pParse->db->aLimit[SQLITE_LIMIT_EXPR_DEPTH] ){
++    sqlite3ErrorMsg(pParse, "VIEWs and/or subqueries nested too deep");
++    return 1;
++  }
++#endif
++  return 0;
++}
++
+ /*
+ ** Given a SELECT statement, generate a Table structure that describes
+ ** the result set of that SELECT.
+@@ -151482,12 +151496,7 @@ SQLITE_PRIVATE Table *sqlite3ResultSetOfSelect(Parse *pParse, Select *pSelect, c
+   u64 savedFlags;
+ 
+   pParse->nNestSel++;
+-#if SQLITE_MAX_EXPR_DEPTH>0
+-  if( pParse->nNestSel >= db->aLimit[SQLITE_LIMIT_EXPR_DEPTH] ){
+-    sqlite3ErrorMsg(pParse, "VIEWs and/or subqueries nested too deep");
+-    return 0;
+-  }
+-#endif
++  if( checkSubqueryNestingDepth(pParse) ) return 0;
+   savedFlags = db->flags;
+   db->flags &= ~(u64)SQLITE_FullColNames;
+   db->flags |= SQLITE_ShortColNames;
+@@ -154703,14 +154712,13 @@ SQLITE_PRIVATE With *sqlite3WithPush(Parse *pParse, With *pWith, u8 bFree){
+ }
+ 
+ /*
+-** This function checks if argument pFrom refers to a CTE declared by
++** This function checks to see if argument pFrom refers to a CTE declared by
+ ** a WITH clause on the stack currently maintained by the parser (on the
+-** pParse->pWith linked list).  And if currently processing a CTE
+-** CTE expression, through routine checks to see if the reference is
+-** a recursive reference to the CTE.
++** pParse->pWith linked list).  And if currently processing a CTE expression,
++** it also checks to see if the reference is a recursive reference to the CTE.
+ **
+-** If pFrom matches a CTE according to either of these two above, pFrom->pSTab
+-** and other fields are populated accordingly.
++** If pFrom matches a CTE, pFrom->pSTab and other fields are populated
++** accordingly.
+ **
+ ** Return 0 if no match is found.
+ ** Return 1 if a match is found.
+@@ -154839,6 +154847,8 @@ static int resolveFromTermToCte(
+       pRecTerm = pRecTerm->pPrior;
+     }
+ 
++    pParse->nNestSel++;
++    if( checkSubqueryNestingDepth(pParse) ) return 2;
+     pCte->zCteErr = "circular reference: %s";
+     pSavedWith = pParse->pWith;
+     pParse->pWith = pWith;
+@@ -154863,6 +154873,8 @@ static int resolveFromTermToCte(
+       }
+     }
+     pParse->pWith = pWith;
++    pParse->nNestSel--;
++    assert( pParse->nNestSel>=0 );
+ 
+     for(pLeft=pSel; pLeft->pPrior; pLeft=pLeft->pPrior);
+     pEList = pLeft->pEList;
+-- 
+2.35.6
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.53.4.bb b/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
index 06cd34818f5..93ee778292b 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
@@ -32,6 +32,7 @@ SRC_URI += "file://0001-Add-option-to-disable-zlib.patch \
 	file://CVE-2026-119372.patch \
 	file://CVE-2026-119378.patch \
 	file://CVE-2026-119376.patch \
+	file://CVE-2026-119371.patch \
 "
 SRC_URI[sha256sum] = "0e9483900e92cd5de8fd48d16bf9200145a61f7fd5be542a5ac81d8a9516eb9c"
 
