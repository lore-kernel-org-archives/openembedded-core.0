Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56A91C433F5
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 14:31:27 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.11885.1642429886233376824
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 06:31:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=EKJbYiOg;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1642429884; i=@fujitsu.com;
	bh=h8c5R6ex6wNBeyAS3mvaaK33y03wl5DDqtH1FnI5LCY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=EKJbYiOgkHojYz0F8Ua4A8oxg5012pCU0ffNAAqOQtb8Nawg9R4LiBqG13k9CFvrc
	 ew/3RDDNcnjFREfS+vrJse7YJHi9OgQ+W/w/Re/VUJI5BJNdmUEoFcXk/HgrEEfhtl
	 RyQsJ18zrdA2crDrqzJzb2tAO/e14yhZsJXTKI4fzUShffQn1XnUzY724/WD17EBYV
	 sp9x+Bbr/8MVDDXWzyw7kqShQ58LIFLLU3L2qAbVqTu7opbxLf81z+7eLWjw8+1EqY
	 ocD0Uznt0OTNXXFY1rLyFBYSzL/8aYeIVjqAsbRz0OuqjUM/DkKB2pFIFysNghox8j
	 dph/AlSc7wJUQ==
Received: from [100.115.37.147] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-2.aws.ess.symcld.net id 55/DC-23453-CBD75E16;
 Mon, 17 Jan 2022 14:31:24 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJIsWRWlGSWpSXmKPExsViZ8MxRXdP7dN
  Eg3PNQhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bFRyIFezkrbi88yNTAeIaji5GLQ0hgBpNE
  ++q1zBDOCUaJnwe+s3cxcnKwCahJTL91g7WLkYNDREBP4uo/UZAws4CKxIvfPWAlwgIOEl3zf
  7GA2CwCqhLP9r5jArF5BZwkZk45wwhiSwgoSEx5+J4ZIi4ocXLmExaIORISB1+8YIaoUZSYfb
  mZBcKukJg1q41pAiPvLCQts5C0LGBkWsVonVSUmZ5RkpuYmaNraGCga2hoqmtsqmtoYqmXWKW
  bqJdaqlueWlyia6SXWF6sl1pcrFdcmZuck6KXl1qyiREYYinFylN3MJ5e9VPvEKMkB5OSKC9n
  2NNEIb6k/JTKjMTijPii0pzU4kOMMhwcShK8t2uAcoJFqempFWmZOcBwh0lLcPAoifBqA0Nei
  Le4IDG3ODMdInWKUVFKnLcBpE8AJJFRmgfXBouxS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJ
  WEeb+ATOHJzCuBm/4KaDET0OJVHx+BLC5JREhJNTDxtC+fO2tVKF+xua7xTZd0hYSwBOuyIHm
  Jg/M6ZkQsPmcb0qP04MThvK8p06ZuXzNH3Pym0ulbF980vTbIOa1wf6cz37lzed59bTdDZ5Wy
  tywsvBC8WzXDeGcWy/G6sl2lf/q4m7/7zUjqTledL7mqZlLOIpuCVR+f/Vh/NGi3s3vxOoGTF
  iaWb0v4NT2fJP11sVT56OL/vcgp43Lpjxnr1Z47CjHe/L7cYM+DNe6q+o9/saY7n/py5F97rU
  g5t/Ok6eadF/5O5DpXWJ62uYnv/X2zCdnfUxTP6khN4Fmqm3Qp7vgrK9nf90vTptvfstm/xqO
  Bt21OwCHFkyfKDOcxt1ac8Zqp7mMkeSVbJk6JpTgj0VCLuag4EQCB3YtALAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-548.messagelabs.com!1642429884!1245!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7815 invoked from network); 17 Jan 2022 14:31:24 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-16.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Jan 2022 14:31:24 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 20HEVNBb012712
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jan 2022 14:31:24 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 17 Jan 2022 14:31:22 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-git: upgrade 3.1.24 -> 3.1.26
Date: Mon, 17 Jan 2022 22:31:13 +0800
Message-ID: <1642429874-13890-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jan 2022 14:31:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160648

Changelog:
=========
Fixes a leaked file descriptor when reading the index, which would cause make
writing a previously read index on windows impossible.
See https://github.com/gitpython-developers/GitPython/issues/1395 for details.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-git_3.1.24.bb => python3-git_3.1.26.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-git_3.1.24.bb => python3-git_3.1.26.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.24.bb b/meta/recipes-devtools/python/python3-git_3.1.26.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-git_3.1.24.bb
rename to meta/recipes-devtools/python/python3-git_3.1.26.bb
index 445c7b0235..b6171a0e4d 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.24.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.26.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "GitPython"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "df83fdf5e684fef7c6ee2c02fc68a5ceb7e7e759d08b694088d0cacb4eba59e5"
+SRC_URI[sha256sum] = "fc8868f63a2e6d268fb25f481995ba185a85a66fcad126f039323ff6635669ee"
 
 DEPENDS += " ${PYTHON_PN}-gitdb"
 
-- 
2.25.1


