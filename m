Return-Path: <akuster808@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 45E727FBEE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2019 06:50:05 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id q70so4377231wme.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 23:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=PP91nFXtnWuQCI0bpnR99CGrbz5bmEfrCpocuAMEWPE=;
	b=aro81DHh/ApNasq9cc3yDNQ1znVDZiU616ldtFt7HWFQBftZARPB45vwW6NGyNd6Fr
	82AhV7IpskvJqPxjBtQa9iaWkhzoWKMKf1hNfJMWrX41EkwoljN6P46zRy0IfbNDZ9KL
	NBgJkBxOi1NGiMxftdDwsGyDtjuNVVkDpcjlw5MLwZ+9uSrRCM+E3pmef3gtQ1QU1MQ6
	dfvULvMgVgPZQAIU4mQrkBjlkA2fSTLfcRif2wJyHwPEs3SqugT9oiqOdH7drqLb5+VJ
	RH2vg705maM/QTmVUoXmqXfW/3hVT2RiTsV8kDZ4RDugx5Bf+ZSzoky+TluytnmKKITG
	VJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=PP91nFXtnWuQCI0bpnR99CGrbz5bmEfrCpocuAMEWPE=;
	b=sE+Zob7teFHkh7rxUs6yD4IqjptjRAK1M3Dq1IYL7fMpm6/sESEhosXiflBr15pApb
	Q0G83EA65cZ37RUvH2HQJjqphSvOUkzjCJas4DdnSyv2wBTcRUfC3fdsljoJo4UvFYqk
	WucKVIBH+3rr4Y1aIuMEDzacRAXKyEZ/Wbkf7eIWvv68nuWNcKa/MoMLrNhDnbj6Hr9k
	KiIgZaQJwo2ukX8DW8NeLgzeOEhMDs1+h1iXA8NHhr8zW+Bra+q50zFP3HfWYnPhMuf0
	Hc8adEP613SZa+rXgeLwR497938exSLhMDs/ZpQRJ2oMyltKvajOyPkQAHhJiULyKokw
	Y0mg==
X-Gm-Message-State: APjAAAVfiA1c0RJ2Psv0d8DUmSkoDYzeNIUxu7FL75DsnlaZukxO3thH
	rDQnMHky3M9LRKKvIZGt3osg1t+qoZM=
X-Google-Smtp-Source: APXvYqytuauLMnH1UP/jOZjnhOcszRSyr/xqinfOQ8PIt1cYGHnhyU1Ttxg9gI40ylEMUx2/IGEcCQ==
X-Received: by 2002:a1c:f212:: with SMTP id s18mr6395119wmc.72.1572072605580; 
	Fri, 25 Oct 2019 23:50:05 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.controleur.wifipass.org ([178.18.58.186])
	by smtp.gmail.com with ESMTPSA id v6sm4807911wru.72.2019.10.25.23.50.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Oct 2019 23:50:04 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Oct 2019 23:49:33 -0700
Message-Id: <948b0dd6d91eeed529c6983141ab80327fa4ae9c.1572072422.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1572072421.git.akuster808@gmail.com>
References: <cover.1572072421.git.akuster808@gmail.com>
Subject: [zeus 01/28] sqlite3: fix CVE-2019-16168
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
X-List-Received-Date: Sat, 26 Oct 2019 06:50:05 -0000

From: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../sqlite/files/0001-Fix-CVE-2019-16168.patch     | 40 ++++++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.29.0.bb      |  3 +-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/sqlite/files/0001-Fix-CVE-2019-16168.patch

diff --git a/meta/recipes-support/sqlite/files/0001-Fix-CVE-2019-16168.patch b/meta/recipes-support/sqlite/files/0001-Fix-CVE-2019-16168.patch
new file mode 100644
index 0000000..7c4a65b
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/0001-Fix-CVE-2019-16168.patch
@@ -0,0 +1,40 @@
+From fcf06b0b426e6c243d6ca2d6c6a02830717ab6a3 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Tue, 15 Oct 2019 13:22:52 +0800
+Subject: [PATCH] Fix CVE-2019-16168
+
+CVE: CVE-2019-16168
+
+Upstream-Status: Backport [https://www.sqlite.org/src/vpatch?from=4f5b2d938194fab7&to=98357d8c1263920b]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ sqlite3.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 61bfdeb..b3e6ae2 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -105933,7 +105933,9 @@ static void decodeIntArray(
+       if( sqlite3_strglob("unordered*", z)==0 ){
+         pIndex->bUnordered = 1;
+       }else if( sqlite3_strglob("sz=[0-9]*", z)==0 ){
+-        pIndex->szIdxRow = sqlite3LogEst(sqlite3Atoi(z+3));
++        int sz = sqlite3Atoi(z+3);
++        if( sz<2 ) sz = 2;
++        pIndex->szIdxRow = sqlite3LogEst(sz);
+       }else if( sqlite3_strglob("noskipscan*", z)==0 ){
+         pIndex->noSkipScan = 1;
+       }
+@@ -143260,6 +143262,7 @@ static int whereLoopAddBtreeIndex(
+     ** it to pNew->rRun, which is currently set to the cost of the index
+     ** seek only. Then, if this is a non-covering index, add the cost of
+     ** visiting the rows in the main table.  */
++    assert( pSrc->pTab->szTabRow>0 );
+     rCostIdx = pNew->nOut + 1 + (15*pProbe->szIdxRow)/pSrc->pTab->szTabRow;
+     pNew->rRun = sqlite3LogEstAdd(rLogSize, rCostIdx);
+     if( (pNew->wsFlags & (WHERE_IDX_ONLY|WHERE_IPK))==0 ){
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.29.0.bb b/meta/recipes-support/sqlite/sqlite3_3.29.0.bb
index 07e36be..34066fb 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.29.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.29.0.bb
@@ -3,6 +3,7 @@ require sqlite3.inc
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
-SRC_URI = "http://www.sqlite.org/2019/sqlite-autoconf-${SQLITE_PV}.tar.gz"
+SRC_URI = "http://www.sqlite.org/2019/sqlite-autoconf-${SQLITE_PV}.tar.gz \
+           file://0001-Fix-CVE-2019-16168.patch"
 SRC_URI[md5sum] = "8f3dfe83387e62ecb91c7c5c09c688dc"
 SRC_URI[sha256sum] = "8e7c1e2950b5b04c5944a981cb31fffbf9d2ddda939d536838ebc854481afd5b"
-- 
2.7.4


