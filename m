Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web12.22900.1625672690357497229
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jul 2021 08:44:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=hxjbFGvF;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1625672688; i=@fujitsu.com;
	bh=cAcFKmE8ERbc461PbYEiqfAVtzyVzxtYTgHPcJjyMaY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=hxjbFGvF3rXaqYoHUIJJphDAX4mGD6UKqyQVZu+WqWykgJjH5tX+A9AA7iKMaZ+7E
	 Y0ChdgWvdGWwvk/IE2HB2xzbs/giyqiJlQ5oP/QM1eOhl8k5t2j7XXBKYaPiE2q4QS
	 7JPE9KJs87keW6eGgxV7wqXQFBGxqIYGg/tOJntGRScCfW+58lWOD6NyfIsjBJRD/g
	 h0LdHr6jljLUOUXnaS3IbXPoUKGyTF/pQTZEr3M8FmZ1vVr1vTpJrqvm9cO54awsZm
	 oIRWNmmCfS4F1O2BnbWut/BxMhSlWgksmFvOL03/LCz6I/4tfvKkN0L1Gwcuq9MNHq
	 0O2URCdq6zukQ==
Received: from [100.113.1.116] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.symcld.net id 39/6E-03136-FEBC5E06; Wed, 07 Jul 2021 15:44:47 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8MRovv+9NM
  Eg+kz5C3u/HzH7sDocW7jCsYAxijWzLyk/IoE1oyle2YyF7znrOja1MDYwNjD2cXIxSEkMJNJ
  4sH5FawQznFGiaY/95i6GDk52ATUJKbfugGU4OAQEdCTuPpPFCTMLKAi8eJ3DzuILSzgK/Fp1
  xVGkBIWoPiFjwogYV4BR4mjn/6wgNgSAgoSUx6+ZwYp4RRwkpj5UgskLARUMvvRXFaIckGJkz
  OfsEBMl5A4+OIFM0SrosTsy81QYyokXh++xDyBkX8WkpZZSFoWMDKtYrRMKspMzyjJTczM0TU
  0MNA1NDTWNdY1NDPUS6zSTdRLLdVNTs0rKUoEyuollhfrFVfmJuek6OWllmxiBAZjSiHzwh2M
  P15/0DvEKMnBpCTKO3PF0wQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKErxup4BygkWp6akVaZk5w
  MiASUtw8CiJ8M4GSfMWFyTmFmemQ6ROMSpKifOGgyQEQBIZpXlwbbBovMQoKyXMy8jAwCDEU5
  BalJtZgir/ilGcg1FJmDcFZApPZl4J3PRXQIuZgBYzHAZbXJKIkJJqYLJP7Nq2vv3Fm+t6gp+
  8rn9lyO/US/+RUVaTE7AjpTX82soo2efWT1/wScdYXHnVI29QGr77Q6uulXbFB3YXjvhz/C/Z
  3i/PCdZivC3QLLlm8ev5FulhnIuur6l+5LDt56oFS8/tnDMhZcPpM43eE26Xb9i9Zi9f9E4tz
  auSbWISb/N7evsvLJozySzig9NrYdWPl+tV1Ezd/q99cH6LaZjysXlZR/4wVUqtOq6nMdNX5V
  Xplq07NJ7ky8ha/PTjvHi9+mjRkWmC+28f/x207NH7l/GFfwwKgj+flXOYoJasnhtZfTJsVuZ
  kZgGvNz6WoquSp/tKVhzfcmHD+5Iby+yStDVPT1i26E+ow0lnv2glluKMREMt5qLiRAAOLvnA
  QQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-232.messagelabs.com!1625672686!46055!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16522 invoked from network); 7 Jul 2021 15:44:47 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-11.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Jul 2021 15:44:47 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 167Fifmx024237
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 7 Jul 2021 16:44:46 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Wed, 7 Jul 2021 16:44:42 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-importlib-metadata: upgrade 4.6.0 -> 4.6.1
Date: Wed, 7 Jul 2021 23:44:27 +0800
Message-ID: <1625672669-3918-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1625672669-3918-1-git-send-email-wangmy@fujitsu.com>
References: <1625672669-3918-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

v4.6.1
======

* #327: Deprecation warnings now honor call stack variance
  on PyPy.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ib-metadata_4.6.0.bb => python3-importlib-metadata_4.6.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-importlib-metadata_4.6.0.bb => python3-importlib-metadata_4.6.1.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb b/meta/recipes-devtools/python/python3-importlib-metadata_4.6.1.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb
rename to meta/recipes-devtools/python/python3-importlib-metadata_4.6.1.bb
index b9fd2fe59e..7e9604aaf4 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_4.6.1.bb
@@ -8,7 +8,7 @@ inherit pypi setuptools3
 PYPI_PACKAGE = "importlib_metadata"
 UPSTREAM_CHECK_REGEX = "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
 
-SRC_URI[sha256sum] = "4a5611fea3768d3d967c447ab4e93f567d95db92225b43b7b238dbfb855d70bb"
+SRC_URI[sha256sum] = "079ada16b7fc30dfbb5d13399a5113110dab1aa7c2bc62f66af75f0b717c8cac"
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-- 
2.25.1

