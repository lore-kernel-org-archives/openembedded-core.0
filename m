Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web08.2589.1621474707262487420
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 May 2021 18:38:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=lx/PdiIh;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1621474704; i=@fujitsu.com;
	bh=CrrrwainzmDbO5QhFiwOvTSbsx7uY7sFJujuwUEol8I=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=lx/PdiIhC3PO43w6a0rrFeEX4UknmrV1YEHHJYGMPb5ShREgL7KULvgtJPoJivqoU
	 kTzT3MSeeS7O//5LI8LhzmOFGV6e38BWU0smol9UON89tXyWXOYacNLs9F5sdzbv5C
	 vD/KcdndhFtoD9+P3KnFEPcF2O7PM3jG9NZwGJLF8hy+DNX8FIx/Pt5CQTvKHnAnEQ
	 EpbSVFXW0ARJ5en67tIqk3a4Io85hML4oGgUI2AlUxF2TuvGxAJLW9YLhgkA+aOZuO
	 1votmZZBHaKDdFkn0mbFmhZX148yumxucLj633TU04/+cQmGPs0jZ0tCtdHubviZTO
	 X/v1b8BTTwKpw==
Received: from [100.113.3.92] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.symcld.net id 09/9E-63525-F8DB5A06; Thu, 20 May 2021 01:38:23 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+GYqtu7d2m
  CwdKnOhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bvLb+ZCpZwVkxcc4utgfESRxcjF4eQwCwm
  ic3NR5kgnD2MEv83LmDsYuTkYBPQlTj3eC17FyMHh4iAnsTVf6IgYWEBP4nZzZfZQWwWAVWJZ
  UfPsoHYvAKeEkvebGAGsSUEFCSmPHzPDBEXlDg58wkLiM0sICFx8MULZpCREgKKErOny0OUV0
  jMmLGNbQIjzywkHbOQdCxgZFrFaJlUlJmeUZKbmJmja2hgoGtoaKwLJI0N9BKrdBP1Ukt1k1P
  zSooSgbJ6ieXFesWVuck5KXp5qSWbGIFhlFLI0LSD8d2rD3qHGCU5mJREec3uL0oQ4kvKT6nM
  SCzOiC8qzUktPsQow8GhJMErvntpgpBgUWp6akVaZg4wpGHSEhw8SiK8/7cBpXmLCxJzizPTI
  VKnGBWlxHm59gAlBEASGaV5cG2wOLrEKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZi3HmQ7T2
  ZeCdz0V0CLmUAWNy4CWVySiJCSamC6pPXy9dILM3p8VOTiXp0ImdJwviSSfZWdedzxdyVXiub
  1McTZsm8s3fvHP92oMalgf57T0at3Ypfcz5/XK8otqGPAybWL8U7ol4g0ixUKlx5yaVhMPlKW
  lSzYPsFgs8ESicVfS3sC9Y3q41l3XjlnFmt6oOjOJ78Q3zll3fEzpn78OvNx3JZHdwr62MrOz
  o3UcmL7stuTT1jjT5t1wry87207nO76q8y30Jm9vbRRovrBvL9vbvG7nEyxPzwlgfPAldXHuL
  sS3E5ebUnbwOQR7vyI65tH8YFaLcN9hf6zfiqvjg2o8nnhcVjUsD+T6UJ7RBbrqq69HV5aS59
  mtaotaU36Gvz45VX57n/t25VYijMSDbWYi4oTAYlyJgkeAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-19.tower-228.messagelabs.com!1621474701!183265!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18357 invoked from network); 20 May 2021 01:38:21 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-19.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 May 2021 01:38:21 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14K1cKIA021753
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 02:38:21 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 20 May 2021 02:38:19 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] python3-importlib-metadata: upgrade 3.10.1 -> 4.0.1
Date: Thu, 20 May 2021 09:36:43 +0800
Message-ID: <1621474603-127563-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...b-metadata_3.10.1.bb => python3-importlib-metadata_4.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-importlib-metadata_3.10.1.bb => python3-importlib-metadata_4.0.1.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_3.10.1.bb b/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-importlib-metadata_3.10.1.bb
rename to meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb
index af46a8ccc9..f4013da345 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_3.10.1.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb
@@ -8,7 +8,7 @@ inherit pypi setuptools3
 PYPI_PACKAGE = "importlib_metadata"
 UPSTREAM_CHECK_REGEX = "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
 
-SRC_URI[sha256sum] = "c9356b657de65c53744046fa8f7358afe0714a1af7d570c00c3835c2d724a7c1"
+SRC_URI[sha256sum] = "8c501196e49fb9df5df43833bdb1e4328f64847763ec8a50703148b73784d581"
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-- 
2.25.1

