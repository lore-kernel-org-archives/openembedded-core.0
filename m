Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web09.1221.1620435877651366635
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 May 2021 18:04:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=oJvwaGTA;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1620435876; i=@fujitsu.com;
	bh=vx1lPCQKXQV8Mm7C4pmv4FpUGBYgXcA5/k8/+pvb89E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=oJvwaGTAFEWid+cWyrNn012QSNKi2LW6jDNyrkY0sz8mV+vU2WdsqpFpobekWO0yE
	 1tp/55mmFGTBhr2lGeS8kDGo0fM70mjnoShpnUZ1YyFkIBAffiwIdrvS+fCWsnqMrL
	 s6G/t86jkbRfONzbxim4NQdIPPUO78B2MX2roV1nCOf3rKwnNrFqcwhfIYxp4OGEFb
	 4HGo76JTpI26ibbbwWveRma946p9sbijOBQ3D6v+igxmR2UR8uDEstZlYAcj6uIYcA
	 5UuQjey1J+wMGHCo1iDbbBkvHcNqgUWso+kHDtzVL/MRrC8K36VwYOx2obApbzLGhm
	 k1lMcTk09RXgg==
Received: from [100.112.196.73] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-west-1.aws.symcld.net id 2E/1B-46412-3A3E5906; Sat, 08 May 2021 01:04:35 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKIsWRWlGSWpSXmKPExsViZ8MxVXfx46k
  JBnc/Slvc+fmO3YHR49zGFYwBjFGsmXlJ+RUJrBmLpr5hK+jiqNj+6gV7A+Mm9i5GLg4hgZlM
  EhufdLNCOMcYJdr/PWbqYuTkYBNQk5h+6wZQgoNDREBP4uo/UZAws4CKxIvfPewgYWEBR4mVN
  zVAwixA4aWdFxlBwrwCThJfz1mAhCUEFCSmPHzPDGLzCghKnJz5hAViioTEwRcvmCFqFCVmX2
  5mgbArJF4fvsQ8gZF3FpKWWUhaFjAyrWK0SCrKTM8oyU3MzNE1NDDQNTQ00jW0NNc1NDbXS6z
  STdJLLdUtTy0u0TXUSywv1iuuzE3OSdHLSy3ZxAgMrZSCo507GH+9+qB3iFGSg0lJlLcoZ2qC
  EF9SfkplRmJxRnxRaU5q8SFGGQ4OJQnendeBcoJFqempFWmZOcAwh0lLcPAoifB6PQJK8xYXJ
  OYWZ6ZDpE4xKkqJ8z4FSQiAJDJK8+DaYLF1iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iwrx
  zIFJ7MvBK46a+AFjMBLf64dhLI4pJEhJRUA5P3XgcDs03Z882PpfFo7cxh9vNL69ic+/vFpUt
  9ZjuFXmsJ8Ykw/dnXffvIhuL9DnqhLM+YdkyrLrQz11nglnK/M2PuIwbezyFMmxfe2yykxcE2
  30Vz/QPbvi1v5jwq2Kt2k0siKsiCV/x6AOfva9c7trlw1W32zM+s9Y4LtWT8Mfuj5VT1V0f6T
  rKc1N5TYXuXv2LZy4BbDCIJk1Yc7duxol0m+Lag6rnvwjMF03YFfOzdpXnF7N3qb5pp3835G+
  Malh0W+sB28WL80vJ16eWTsp+L7Z/tMWXyhA33Z7NVdUikZYbPlBdWURcM/Pa2uOjWyplSgts
  5vBzC7i/Pt9kqK+bVdyRs/VYpCX91CSWW4oxEQy3mouJEANO0CKAoAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-291.messagelabs.com!1620435875!147648!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8179 invoked from network); 8 May 2021 01:04:35 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-15.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2021 01:04:35 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14814TNB018786
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Sat, 8 May 2021 02:04:35 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Sat, 8 May 2021 02:04:28 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] at-spi2-core: upgrade 2.40.0 -> 2.40.1
Date: Sat, 8 May 2021 09:04:11 +0800
Message-ID: <1620435855-48558-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../atk/{at-spi2-core_2.40.0.bb => at-spi2-core_2.40.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.40.0.bb => at-spi2-core_2.40.1.bb} (94%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.40.0.bb b/meta/recipes-support/atk/at-spi2-core_2.40.1.bb
similarity index 94%
rename from meta/recipes-support/atk/at-spi2-core_2.40.0.bb
rename to meta/recipes-support/atk/at-spi2-core_2.40.1.bb
index e80fa260f0..83e1908ef0 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.40.0.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.40.1.bb
@@ -11,7 +11,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "4196a7d30a0051e52a67b8ce4283fe79ae5e4e14a725719934565adf1d333429"
+SRC_URI[sha256sum] = "9f66e3a4ee42db897af478a826b1366d7011a6d55ddb7e9d4bfeb3300ab23856"
 
 X11DEPENDS = "virtual/libx11 libxi libxtst"
 
-- 
2.25.1

