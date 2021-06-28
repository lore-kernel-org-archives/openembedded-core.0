Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web08.6510.1624850786007173701
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jun 2021 20:26:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=DS7YBGoE;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1624850784; i=@fujitsu.com;
	bh=os9YFe+ZXUrpC7qcgWwUqYdLf9Sxtz4p15Zex4DNZxs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=DS7YBGoEqBM7phtCJlz0n8MDSlLjzHm5ExmX01ZtlAzxRkDztO9KdBIq07QqTMtKY
	 gSGG3ih+Ub7xr0YbM6fVFVPZri2QIOQJ2QIM5R5tIN3aB8qJmY1n6ooSnZvINtyNWU
	 GGLYcmcaQJ41FG/ewHtHP8yzz9U6/3fN9FlFnBf1X+bIqFwnk9s+hp7bj/5mOl2GbF
	 JsNnfyiO+sb6mtoVPuz4PxpwTz8pARILR+4VAoyfUIpLypNCvzAoLwnk5LN9lSHC4G
	 ZSlPKvj3EliN5PRBvLd8HLqEo8JUboIzKRDAMCcg3s/Blj3h0rgpS9xZvDzbg3brFv
	 IzU6WhHMS7//A==
Received: from [100.112.195.193] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.symcld.net id 64/BD-39326-F5149D06; Mon, 28 Jun 2021 03:26:23 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBIsWRWlGSWpSXmKPExsViZ8MxRTfe8Wa
  Cwcs7shZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aRZbEF7zkrWvf0MzYw9nN2MXJxCAnMYpLY
  MukHC4RzglHi+57HrF2MnBxsAmoS02/dALI5OEQE9CSu/hMFCTMLqEi8+N3DDmILC9hJ7F+wm
  x2khEVAVWLmFTOQMK+Ak8TupUfASiQEFCSmPHzPDBEXlDg58wkLxBgJiYMvXjBD1ChKzL7czA
  JhV0i8PnyJeQIj7ywkLbOQtCxgZFrFaJ5UlJmeUZKbmJmja2hgoGtoaKRraGmka2Kil1ilm6i
  XWqpbnlpcomuol1herFdcmZuck6KXl1qyiREYWCkFB3R2MP589UHvEKMkB5OSKK+J+M0EIb6k
  /JTKjMTijPii0pzU4kOMMhwcShK87g5AOcGi1PTUirTMHGCQw6QlOHiURHi/2gGleYsLEnOLM
  9MhUqcYXTmerV2yiJljw7ylQPL/3btAsn/BwdXMHDfbD61mFmLJy89LlRLnXWkP1CwA0pxRmg
  c3GhahlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ8waDXMiTmVcCd8EroOOYgI5T+XAV5Li
  SRISUVAOTR8wJx1up88uOlsvcf73PMePfx2dbC39elL7t8cCghOPTRBcj1pxF7IaqUpsMa81C
  2PT+a35zjVxSquuck5DGd+6ZXZVV8ff3a/hEBPUOLJjdzVp8lsWsLPeiaqfmEQmeqV2P565VY
  ura+MfwkKGQnUm0yyEloU0GruJR6t4HsvzXRvWfizWL7jn4+iqrIytDMgt36MMdz4/pqPKaPr
  m1bO9lppLVUcJV1im69/y3TVnm+uaoebHgp5e7pk7ecsOLOSzy8U37c5MF56xtnPdq177uz/9
  O/mRVtbwU+7P/p9nVxcWngqzOBD7cHT+Lt+HNzV8vozgWbD0Ztiw7SXLeHTe+3uz4CZ/qOoKO
  dS1UYinOSDTUYi4qTgQA0JYPg0sDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-265.messagelabs.com!1624850783!208319!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23339 invoked from network); 28 Jun 2021 03:26:23 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-5.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 28 Jun 2021 03:26:23 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15S3QEkg029305
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Jun 2021 04:26:23 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Mon, 28 Jun 2021 04:26:13 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pbr: upgrade 5.4.4 -> 5.6.0
Date: Mon, 28 Jun 2021 11:25:50 +0800
Message-ID: <1624850750-94689-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/python/python3-pbr_5.4.4.bb | 5 -----
 meta/recipes-devtools/python/python3-pbr_5.6.0.bb | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pbr_5.4.4.bb
 create mode 100644 meta/recipes-devtools/python/python3-pbr_5.6.0.bb

diff --git a/meta/recipes-devtools/python/python3-pbr_5.4.4.bb b/meta/recipes-devtools/python/python3-pbr_5.4.4.bb
deleted file mode 100644
index 6f335ea341..0000000000
--- a/meta/recipes-devtools/python/python3-pbr_5.4.4.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-inherit setuptools3
-require python-pbr.inc
-
-SRC_URI[md5sum] = "65cdc32e1a1ff56d481fc15aa8caf988"
-SRC_URI[sha256sum] = "139d2625547dbfa5fb0b81daebb39601c478c21956dc57e2e07b74450a8c506b"
diff --git a/meta/recipes-devtools/python/python3-pbr_5.6.0.bb b/meta/recipes-devtools/python/python3-pbr_5.6.0.bb
new file mode 100644
index 0000000000..c5ad778cd0
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pbr_5.6.0.bb
@@ -0,0 +1,5 @@
+inherit setuptools3
+require python-pbr.inc
+
+SRC_URI[md5sum] = "62565acc6bf3e7e10b082463421f8b46"
+SRC_URI[sha256sum] = "42df03e7797b796625b1029c0400279c7c34fd7df24a7d7818a1abb5b38710dd"
-- 
2.25.1

