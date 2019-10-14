Return-Path: <shuagr97@gmail.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id 289F060291
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2019 20:22:25 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id q5so10968858pfg.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2019 13:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:reply-to;
	bh=CKWda1Osb37qadB4fzJnLXA5XqwTaacWCxsFyPhLSpE=;
	b=bsgiLp4y/NJjnTV2aP67Z6A0AjSQAawTbKTFTKHb9X1eRz29dQ4Jp3Kf5LH0cFTH3X
	qOaUWYJoLsI93FsWYTPb/n9aoEO5gny+sRTaF9F7qYZkY+aIFbR6tfKGjpjO9SpX+fAA
	z07hpAluADDRSWIUDZODKpfuhN9rvIR6R/uQTkmEUA4SVplhsvQv2dujIiWhvz0/GmKt
	qfFBFFuioKXe8/cSis27f8k49GXbCAbTwcrh9jYPMrJUlK8y6Y62dvrI58ZQRL3AsJg2
	IPXau+Gj2POwnBVrJ/uQAOWxwTinSYb9AvJvp6ucHS4KqjwHN2s7oELjUffRhQrG/vfU
	9XSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
	bh=CKWda1Osb37qadB4fzJnLXA5XqwTaacWCxsFyPhLSpE=;
	b=knJKEFhOlc78n26BVAJQt8vbXQ2trbq4sUHyrf5n+B4zL26H9x5m1kA2eGqcTryCzH
	6o3xjrfirdBdajkD42qXcZY7y0se9TY0NMw1x8H/w+Vs/u6cVASKzw9lyrzugIkKpfQn
	qZAnkrVWgPdxL11x7Ndo2M1xPEVCYVU5A6/TGUeKij5S7nUfCTowfdJSBziou21kEt59
	ogeORTHXQeGlVrJiBMMLtNF7qXT1IxEc+srk32ahzGyEvlrue7fAFPGUvxVbIVeQfqCZ
	1FxA5buT06gJdTm59K8dT+j0yAyaSTgOLf0xncVlcwjiMf2lVEXIisncXixEWxTfuEg3
	v21w==
X-Gm-Message-State: APjAAAWXBIw7XFyerqrzXVRx52itn7AGiRBktAV2082LTW+w8dxkr8r7
	m97zauAltOVpkA+7o9LrCiCXj9kM
X-Google-Smtp-Source: APXvYqxUVGnTMNnJsayc4iA2hvb0kol3UI8StTNEgY5aBurEELTWjE401eeQNpyv8tuuIDXhP2BKkA==
X-Received: by 2002:a62:e206:: with SMTP id a6mr35544203pfi.245.1571084545525; 
	Mon, 14 Oct 2019 13:22:25 -0700 (PDT)
Received: from
	shuagr-yocto-build.mdn4q2lr1oauhmizmzsslly3ad.xx.internal.cloudapp.net
	([51.143.9.113]) by smtp.gmail.com with ESMTPSA id
	l21sm18215624pgm.55.2019.10.14.13.22.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Oct 2019 13:22:24 -0700 (PDT)
From: shuagr97@gmail.com
X-Google-Original-From: shuagr@microsoft.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Oct 2019 20:22:16 +0000
Message-Id: <1571084536-74960-1-git-send-email-shuagr@microsoft.com>
X-Mailer: git-send-email 2.7.4
Reply-To: shuagr@microsoft.com
Subject: [thud][PATCH v2] sqlite3: CVE fix
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
X-List-Received-Date: Mon, 14 Oct 2019 20:22:25 -0000

From: Shubham Agrawal <shuagr@microsoft.com>

CVE:CVE-2019-161680
Status: Backport

whitelist as changes already there due to previous patches in upstream
CVE:CVE-2018-20346
Status: Backported

Sign off: Shubham Agrawaslshuagr@microsoft.com
---
 .../sqlite/files/CVE-2019-16168.patch              | 37 ++++++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.23.1.bb      |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2019-16168.patch

diff --git a/meta/recipes-support/sqlite/files/CVE-2019-16168.patch b/meta/recipes-support/sqlite/files/CVE-2019-16168.patch
new file mode 100644
index 0000000..d8e93c0
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/CVE-2019-16168.patch
@@ -0,0 +1,37 @@
+From fc8bb8d6ae2d4cd024546e9e7bbab115427c3f41 Mon Sep 17 00:00:00 2001
+From: Shubham Agrawal <shuagr@microsoft.com>
+Date: Fri, 11 Oct 2019 20:20:18 +0000
+Subject: [PATCH] sqlite3 CVE: CVE-2019-16168 Status: backported Sign off:
+ Shubham Agrawal<shuagr@microsoft.com>
+Reply-To: shuagr@microsoft.com
+
+---
+ sqlite3.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 0f71a44..c480e53 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -101836,7 +101836,9 @@ static void decodeIntArray(
+       if( sqlite3_strglob("unordered*", z)==0 ){
+         pIndex->bUnordered = 1;
+       }else if( sqlite3_strglob("sz=[0-9]*", z)==0 ){
+-        pIndex->szIdxRow = sqlite3LogEst(sqlite3Atoi(z+3));
++        int sz = sqlite3Atoi(z+3);
++        if( sz<2 ) sz = 2;
++        pIndex->szIdxRow = sqlite3LogEst(sqlite3Atoi(sz));
+       }else if( sqlite3_strglob("noskipscan*", z)==0 ){
+         pIndex->noSkipScan = 1;
+       }
+@@ -137151,6 +137153,7 @@ static int whereLoopAddBtreeIndex(
+     ** it to pNew->rRun, which is currently set to the cost of the index
+     ** seek only. Then, if this is a non-covering index, add the cost of
+     ** visiting the rows in the main table.  */
++    assert( pSrc->pTab->szTabRow>0 );
+     rCostIdx = pNew->nOut + 1 + (15*pProbe->szIdxRow)/pSrc->pTab->szTabRow;
+     pNew->rRun = sqlite3LogEstAdd(rLogSize, rCostIdx);
+     if( (pNew->wsFlags & (WHERE_IDX_ONLY|WHERE_IPK))==0 ){
+-- 
+2.7.4
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.23.1.bb b/meta/recipes-support/sqlite/sqlite3_3.23.1.bb
index 7df61cd..e2e9b50 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.23.1.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.23.1.bb
@@ -8,6 +8,7 @@ SRC_URI = "\
   file://CVE-2018-20505.patch \
   file://CVE-2018-20506.patch \
   file://CVE-2019-8457.patch \
+  file://CVE-2019-16168.patch \
   "
 SRC_URI[md5sum] = "99a51b40a66872872a91c92f6d0134fa"
 SRC_URI[sha256sum] = "92842b283e5e744eff5da29ed3c69391de7368fccc4d0ee6bf62490ce555ef25"
-- 
2.7.4


