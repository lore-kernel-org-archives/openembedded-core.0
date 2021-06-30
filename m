Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web11.2065.1625031602177270826
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jun 2021 22:40:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wg3jE+vL;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1625031599; i=@fujitsu.com;
	bh=QAok9QmlASWqJnHDhiXdT88EtG4lVooD6Z2mApEaIXU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=wg3jE+vL2jUZilDdsJOi0deSPIX2/wvD3t7MmzlNx01kzod4JbFUCmiUJgd6vT8cG
	 qB40yMng+uM7dow7McheIkUM2ugPxNrJ5U+VXIqG09LX9+23mMfy5eicqYgliqF+X1
	 WtqwR7b+IqtCgzfFCo1ri8r+/Y8g96fAuPuGTi5YKgmeyd3xFODxXGp2Y8v4gHHsXm
	 m76jeo9V0E2GIZP+aZSx4kkS1N2APvMOYvIDm4tMrThVGz9qh5fKFQsh1ROmopM+OJ
	 e3hCh7Hv+Nyz2qg8CxpoYp5ZFgi/hQoHf7e/sT1fTbDimk6ff9zZ/mtpEvsrl9bLAR
	 j8zGGnJSIvHBQ==
Received: from [100.112.197.63] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-west-1.aws.symcld.net id 3B/66-07802-FA30CD06; Wed, 30 Jun 2021 05:39:59 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKIsWRWlGSWpSXmKPExsViZ8MxVXc9850
  EgzenWC3u/HzH7sDocW7jCsYAxijWzLyk/IoE1oyFR+YxF/zmqjh5dRtzA2MrVxcjF4eQwCwm
  ibNPP7JCOHsYJeYuvMjYxcjJwSagK3Hu8Vr2LkYODhEBPYmr/0RBwsICARK3Pu8GC7MIqErMm
  WwOEuYV8JCY3zGJGcSWEFCQmPLwPTNEXFDi5MwnLCA2s4CExMEXL5hBWiUEFCVmT5eHKK+QmD
  FjG9sERp5ZSDpmIelYwMi0itEiqSgzPaMkNzEzR9fQwEDX0NBI19DSQtfI0FQvsUo3SS+1VLc
  8tbhE11AvsbxYr7gyNzknRS8vtWQTIzCEUgqOXd/BePX1B71DjJIcTEqivFNu3E4Q4kvKT6nM
  SCzOiC8qzUktPsQow8GhJMEbw3QnQUiwKDU9tSItMwcYzjBpCQ4eJRFe9/9ArbzFBYm5xZnpE
  KlTjLoc734uXsQsxJKXn5cqJc7LBDJDAKQoozQPbgQsti4xykoJ8zIyMDAI8RSkFuVmlqDKv2
  IU52BUEuadzgg0hSczrwRu0yugI5iAjlj05CbIESWJCCmpBqaUCG4nad/n06L6/t06OD+D75+
  N6PzpbB9c/mvv4FOe773iwGSlmV1r2+86BsmU62vlHpi5zfYmz6bF81Z9OP29I/57/WPHyX+W
  r+r5FcNVfee4i6JMIZPMd3ZTvfj3O74trnsStvtA07RwY5Wr3GsFl+uzhPCsfj9DJOTLrmUp7
  kJm6zxdebmuWuhN/bV8KauvkYoqT0TMAj+neTabvZi4mD5bdHswcCyL4F1q1tvF6Lzb/seFZ0
  IPeZ0ev566ymiCdSKTeXnPZv3dmyXabjd2rT8wOVHZb1EhK3/bYcsY4aaeeO+FniesdP3+RZ2
  pa5rSuOoZT27yHab62wsmbty96azT731anCXH5i1NvajEUpyRaKjFXFScCAApnQqfKAMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-8.tower-285.messagelabs.com!1625031598!489806!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12974 invoked from network); 30 Jun 2021 05:39:59 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-8.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 30 Jun 2021 05:39:59 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15U5dmoj022894
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Jun 2021 06:39:58 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Wed, 30 Jun 2021 06:39:47 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH v2] python3-importlib-metadata: upgrade 4.5.0 -> 4.6.0
Date: Wed, 30 Jun 2021 13:39:36 +0800
Message-ID: <1625031576-67231-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

v4.6.0
======

* #326: Performance tests now rely on
  `pytest-perf <https://pypi.org/project/pytest-perf>`_.
  To disable these tests, which require network access
  and a git checkout, pass ``-p no:perf`` to pytest.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...ib-metadata_4.5.0.bb => python3-importlib-metadata_4.6.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-importlib-metadata_4.5.0.bb => python3-importlib-metadata_4.6.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_4.5.0.bb b/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-importlib-metadata_4.5.0.bb
rename to meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb
index 7c156787a0..b9fd2fe59e 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_4.5.0.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb
@@ -8,7 +8,7 @@ inherit pypi setuptools3
 PYPI_PACKAGE = "importlib_metadata"
 UPSTREAM_CHECK_REGEX = "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
 
-SRC_URI[sha256sum] = "b142cc1dd1342f31ff04bb7d022492b09920cb64fed867cd3ea6f80fe3ebd139"
+SRC_URI[sha256sum] = "4a5611fea3768d3d967c447ab4e93f567d95db92225b43b7b238dbfb855d70bb"
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-- 
2.25.1

