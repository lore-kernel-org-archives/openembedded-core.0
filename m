Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.3])
 by mx.groups.io with SMTP id smtpd.web10.4865.1618809216063031400
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Apr 2021 22:13:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=gG4v6div;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.3, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1618809214; i=@fujitsu.com;
	bh=ZbYaxCr45/Yj9Zvdodd9/Eb/MDMFHcCwqJDKXP/H0z4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=gG4v6div3qlzyvd0VPgRPetUSIUYttIPnx+E2rwNQuCA33mGuB1k6/OQnNqULSL9g
	 lmwyrLitRLBiFGszojAckEyoP5/AFqyoEmVtPr7EeLsRBngfaKF1GWFcmf9wst31aE
	 owAz9oUUZEtS5ural9iVEX62/WtZlifhEy/M3EQU8YoEFhJXAfQayq6BQmPx1AxeCF
	 pXgKGiqOP6QyohFz0YS9tAhiskoN7ovQdUn4exUaDISnPgYPFfBC/nz55IBFfCf1oW
	 zyvrQMFBkwve/MH/RPmbaMOtJ1bAOF7IS7kPGuhEBcRDbLAl5nvktfi2a4pUscfalC
	 qNADHYH66+V+w==
Received: from [100.112.193.211] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.symcld.net id 02/B9-24644-E711D706; Mon, 19 Apr 2021 05:13:34 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeJIrShJLcpLzFFi42Kxs+GYqlsrWJt
  gMO2NjcWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmrF32T2mgt+sFZ+v7WVrYJzP2sXIxSEkMItJ
  4srXtSxdjJxAzm5Gia1dsiA2m4CuxLnHa9m7GDk4RAT0JK7+EwUJCwsYSSw4848ZxGYRUJW4+
  P0RmM0r4Cmxd/1TsDESAgoSUx6+h4oLSpyc+QQsziwgIXHwxQtmkJESAooSs6fLQ5RXSmyfdp
  ZxAiPPLCQds5B0LGBkWsVokVSUmZ5RkpuYmaNraGCga2hopGtoCcQmJnqJVbqJeqmluuWpxSW
  6hnqJ5cV6xZW5yTkpenmpJZsYgSGUUnBgwg7G/a8/6B1ilORgUhLlvXy6MkGILyk/pTIjsTgj
  vqg0J7X4EKMMB4eSBO8t/toEIcGi1PTUirTMHGA4w6QlOHiURHh38ACleYsLEnOLM9MhUqcYF
  aXEeX0EgBICIImM0jy4NlgMXWKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzLsAZApPZl4J3P
  RXQIuZgBbvnl8JsrgkESEl1cC0fKvZq/ApfEe3d/8KLG71Wr/xto3Jvj9O9lHZhw+1VT/qYcn
  ZFDZzfmXc7yVNIjYdP/1rt9xbYVVVs4O7qcP1Iq/0ckmO1g9hn2xLTHZ0tcuEfC1fN3VdN3Pr
  0V9RtfVGWcXy29z/1V1Il5ihLZxsKX3jyELJWkObIP5H33lzI2/8O7n73JQwV7GJgsmpYR88n
  E9vqGgvNfzesbMlvT5vV77UIa4rt5y92/M/XtoRcp53n9HErxvzNrTq/DcTDN04uWr5l1iP9F
  kazmwTXX9KfLv8OP/iHJv3Uu8nZrkz3f0z9WbXxQ9h91d5nfe/wyl/RvnQ7vDNnd+mHv5asvb
  K7qope788if64bJVDmp2TEktxRqKhFnNRcSIAyo+2dBwDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-34.tower-265.messagelabs.com!1618809213!3914!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15988 invoked from network); 19 Apr 2021 05:13:33 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-34.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 19 Apr 2021 05:13:33 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13J5DOCO027491
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Apr 2021 06:13:33 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 19 Apr 2021 06:13:22 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] db: correct CVE_PRODUCT
Date: Mon, 19 Apr 2021 21:45:01 +0800
Message-ID: <1618839901-127113-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

In the CVE database, now it use db2 instead of oracle_berkeley_db.
So, in order to be handled correctly by CVE check, modify CVE_ PRODUCT.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 meta/recipes-support/db/db_5.3.28.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support/db/db_5.3.28.bb
index 9cb57e6a53..05720053f4 100644
--- a/meta/recipes-support/db/db_5.3.28.bb
+++ b/meta/recipes-support/db/db_5.3.28.bb
@@ -15,7 +15,7 @@ HOMEPAGE = "https://www.oracle.com/database/technologies/related/berkeleydb.html
 LICENSE = "Sleepycat"
 RCONFLICTS_${PN} = "db3"
 
-CVE_PRODUCT = "oracle_berkeley_db"
+CVE_PRODUCT = "db2"
 CVE_VERSION = "11.2.${PV}"
 
 PR = "r1"
-- 
2.25.1

