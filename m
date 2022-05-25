Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67CBFC433FE
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 06:41:24 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.3909.1653460873070276389
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 23:41:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=gUhQ75Qt;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653460871; i=@fujitsu.com;
	bh=mm/3HgLmnOc7Cs8sTbsX5FxDcC8PQ1i1h7GXMsvpTRw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=gUhQ75QtGuAB4teTNHNePewsBM2bPJ5alyyikMl3QSVZTX38M2bqRA0C0AJcyq1a8
	 cuhTG0DYTeg1JP7aZe/pI3az943SlAYprbcRSskgd8/5GaZt7jfUsH3v/UG3XGKoT/
	 hCxCd1jJhreEA4llzxxjtqFgJKC1Vg+29DY5XH+PgUViKHMDJmLZP2m94u9e0c+9bR
	 nQd163thvA+F0T4ZRzMoz+o/pBTjO6DSS69Gs+FZg1z1+xvpHKxLGIZWLc9nZWuxvV
	 X3L8FDv2nMhiStNw6aYJtkqGD6dSSJOckfieND4MqHcK0TsUSrb+iNii0Psk6rBMfn
	 nBTOGtfC25Ihg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRWlGSWpSXmKPExsViZ8ORqNt+vjf
  J4G2KxZ2f79gdGD3ObVzBGMAYxZqZl5RfkcCaseb9BMaC01wVi9/8Ym9gvMHZxcjJISTwmFFi
  6vT4LkYuIPs8k8TDH3dZIJw9jBIdX1sZQarYBNQkpt+6wdrFyMEhIqAncfWfKEiYWUBF4sXvH
  nYQW1jAVeLnledsIDaLgKrEvlsnWEFsXgEnibPHpzOB2BICChJTHr5nBrE5BZwltv44ygJxhJ
  PEl3ObGSHqBSVOznzCAjFfQuLgixfMEL2KErMvN7NA2BUSM2ZsY4Ow1SSuntvEPIFRcBaS9ll
  I2hcwMq1itE4qykzPKMlNzMzRNTQw0DU0NNU1NtE1MrTQS6zSTdRLLdUtTy0u0TXSSywv1kst
  LtYrrsxNzknRy0st2cQIDOGUYqVbOxg3rPqpd4hRkoNJSZT3xIbeJCG+pPyUyozE4oz4otKc1
  OJDjDIcHEoSvKtPA+UEi1LTUyvSMnOA8QSTluDgURLhdToDlOYtLkjMLc5Mh0idYtTlOPb1+3
  5mIZa8/LxUKXHe82eBigRAijJK8+BGwGL7EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVhXtV
  zQFN4MvNK4Da9AjqCCeiIfF6wI0oSEVJSDUx7djZ3cC698O3ldHPm/5mHn4uf/CparnbJXtwy
  IU6lg+XZm2eqJu2Liys393vsLEiNKczalbHOM/N11+Xt17fUzv9s3/7p+8eVhrZ7A5P+Pf68R
  /Lx+RXpKTaR+5e/vFzJe614WUfmzkDtayxRMXtD9pg79q99kLbzSaVPQujxNrk1ohY2GzrKsv
  fHtu9zDrK5UsmXofwi3I/h2b6r+x5334rcdycxrfL+c/4HLR+e8xu0WzLfnZKlvX/OLcEe0w9
  a3M07/7yM3W481/PANp578+Zqre89qO/CulU7uJjjVNFB97dfJ1qdUPDdkbVJ9fl7jx1H7dkO
  p/m2pR75sl//oWrW41/XY+cl+bu8fP1diaU4I9FQi7moOBEAO+uY02gDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-571.messagelabs.com!1653460870!79868!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16676 invoked from network); 25 May 2022 06:41:11 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-7.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 25 May 2022 06:41:11 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 5DDDB1001A2
	for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:41:10 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 2E74E100192
	for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:41:10 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 25 May 2022 07:40:56 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-cython: upgrade 0.29.28 -> 0.29.30
Date: Wed, 25 May 2022 14:40:35 +0800
Message-ID: <1653460837-12404-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1653460837-12404-1-git-send-email-wangmy@fujitsu.com>
References: <1653460837-12404-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 06:41:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166095

Changelog:
https://github.com/cython/cython/blob/master/CHANGES.rst

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/python/python-cython.inc                  | 2 +-
 .../{python3-cython_0.29.28.bb => python3-cython_0.29.30.bb}    | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cython_0.29.28.bb => python3-cython_0.29.30.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-cython.inc b/meta/recipes-devtools/python/python-cython.inc
index 5050dfd427..ab8c4d65f3 100644
--- a/meta/recipes-devtools/python/python-cython.inc
+++ b/meta/recipes-devtools/python/python-cython.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 PYPI_PACKAGE = "Cython"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "d6fac2342802c30e51426828fe084ff4deb1b3387367cf98976bb2e64b6f8e45"
+SRC_URI[sha256sum] = "2235b62da8fe6fa8b99422c8e583f2fb95e143867d337b5c75e4b9a1a865f9e3"
 UPSTREAM_CHECK_REGEX = "Cython-(?P<pver>.*)\.tar"
 
 inherit pypi
diff --git a/meta/recipes-devtools/python/python3-cython_0.29.28.bb b/meta/recipes-devtools/python/python3-cython_0.29.30.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-cython_0.29.28.bb
rename to meta/recipes-devtools/python/python3-cython_0.29.30.bb
-- 
2.25.1


