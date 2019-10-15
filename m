Return-Path: <shuagr97@gmail.com>
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id B98287F455
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 16:26:49 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id 23so12464062pgk.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 09:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:reply-to;
	bh=VuKERxk/X171tHtrXZ3I+rAzIoOG2xSiZp9eCypznnk=;
	b=tKlRbU1KvbbvVwvWYFLp8IJqZN6TifVPdsVFAnC/5bSSFsqHrqPtv2wmhJptm8mZi2
	3WytaZw0ScKt7I8KTLXUMF2J3gV/+/BzmJcMW96RNdznzmlocZoXxiv/mGLiG56aNbCo
	pY9xm24TbBaMizk2atmzK3f47COLxp8QkTFO+4dfpmKLVschquERoKNI6Ar/YcT9tUql
	Gx2F9oIYGpsVb0KUi34OvKBRbo8FG2BH8vAXq5S0Ri5jwNQSqaOhXtJokwZ+/zHaV4KM
	oUJeA38Cit7R9nZ4EgmF/YZTIXrG37a+uzdY/ehYSCO2oX8ULqUr192V+3S4GYOBKdou
	lnmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
	bh=VuKERxk/X171tHtrXZ3I+rAzIoOG2xSiZp9eCypznnk=;
	b=rm2lAvGkX3AEd+36gq3jA0FMNsYyhE/JkxcyJoSDhRI5EUG8nw+qvFGH7CYft/d8/S
	b2An1ezc2V/tEk/vPNrts52zIEmhyS1jYzS6YnZ4zCw7BFtZSk/yUE6UdTi4bNPv+fxk
	qpxvC+6FvFV0kcwLxXQzqx1nSmnyH5DxcEh8OUkw6QTQ2OZFyK/iKhzBytP4a5ZHORP1
	xuqZJBu2JBWa0jVRPsk/nbbh0eW+MH9/KdTXgnXkoC6Gp8rFwDzULmQWv7QNpkuEe33i
	2Y2vptHZnWxx+BoblJF8BEtxyqkelgDg8Fg5PQ5aCkY72iOqZEIlezjKXuVYre1UKMXD
	RYRg==
X-Gm-Message-State: APjAAAWLlrVS36nwgQmar4BDXhiv4cb5Wq6u6BgJefxVcl66ufDTdX3/
	ENpnvZwaDlEjzGqPISPdVZ2fheMo
X-Google-Smtp-Source: APXvYqyNfZFN4vK7bRrsHspbAkNhP4h6sc7HEFRTxms+5CCVxC92rHpQkM8nYcLEfJ8rHJloQefFaQ==
X-Received: by 2002:a62:1889:: with SMTP id 131mr39483723pfy.235.1571156810346;
	Tue, 15 Oct 2019 09:26:50 -0700 (PDT)
Received: from
	shuagr-yocto-build.mdn4q2lr1oauhmizmzsslly3ad.xx.internal.cloudapp.net
	([51.143.9.113]) by smtp.gmail.com with ESMTPSA id
	l21sm22444521pgm.55.2019.10.15.09.26.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 15 Oct 2019 09:26:48 -0700 (PDT)
From: shuagr97@gmail.com
X-Google-Original-From: shuagr@microsoft.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Oct 2019 16:26:43 +0000
Message-Id: <1571156803-117298-1-git-send-email-shuagr@microsoft.com>
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
X-List-Received-Date: Tue, 15 Oct 2019 16:26:49 -0000

From: Shubham Agrawal <shuagr@microsoft.com>

CVE:CVE-2019-16168
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


