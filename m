Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web09.3260.1618467716177473605
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Apr 2021 23:21:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=d1Q7y75T;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1618467714; i=@fujitsu.com;
	bh=qhQGqE3bCKNEAKWu8Bq+dSh4hylctGlins98PjVztEw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=d1Q7y75TWovkbrzroIkpA6cEO123yPhNPxss+UikVmHSusLqNKxy+7qwDi7aESmEF
	 HqmdE3AhQTtm0VJ4qVFkt15Yj/feKyIhme6E4DDbF5b5mlwWKXPuik9ofwVyfOPUGm
	 iC90kZHXg497P6QCbVe0QFCUfvaipER2yJMDWhXe5kQCLTH1Q3TGNHf/ojheSGgZvr
	 hRlsq8OU7WgKFOuJjxNJLqgXBavJGnGyUN77IvTFcTE53SXtCEauIPYGQigWBeLfjC
	 sakByMWY7ZdXyB3D50ZD5xfRkeccQMDOprHfL0B2ZEaayjbnE/fe1s5Iks868bmnsG
	 hpCNzIheErmgA==
Received: from [100.113.6.193] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-central-1.aws.symcld.net id E3/73-14281-18BD7706; Thu, 15 Apr 2021 06:21:53 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeJIrShJLcpLzFFi42Kxs+GYqtt4uzz
  B4OhjPYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPhidlsBbfZK460FzcwvmLrYuTiEBKYxSTR
  vb+JCcLZzSjR9/cZcxcjJwebgK7Eucdr2bsYOThEBPQkrv4TBQkLC9hInJ/0gw3EZhFQlVhx7
  gYTSAmvgIfEuvYgkLCEgILElIfvwabwCghKnJz5hAXEZhaQkDj44gUzSLmEgKLE7OnyEOWVEt
  unnWWcwMgzC0nHLCQdCxiZVjFaJhVlpmeU5CZm5ugaGhjoGhoa65rrGhoZ6iVW6SbppZbqJqf
  mlRQlAmX1EsuL9Yorc5NzUvTyUks2MQJDKKWQvXIH49o3H/QOMUpyMCmJ8h5aUZYgxJeUn1KZ
  kVicEV9UmpNafIhRhoNDSYI38WZ5gpBgUWp6akVaZg4wnGHSEhw8SiK8uiBp3uKCxNzizHSI1
  ClGRSlx3r0gCQGQREZpHlwbLIYuMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmZboFNIUnM6
  8EbvoroMVMQIsrVpWCLC5JREhJNTAtk9xyMTXpIts3oTNPuviiw59Ofd8vsqeXrU9A4hLDt31
  nbl9r8fUL4U60XNmycc02aUPthacSjByYTDLtdl7n+lpxu+Rf3i/2GTFm98KufxNhvfJn3kMp
  9wPHzyxbomjFtKFxdk/wU/WPW870eVjGTz4TqHRApLIkwXZ9hPu2azJP31R78Uz6x7R+1Y0fd
  w58b+ANY9qaWJlXdvWI4AaL89ZX30uWs9jvmnP6Bd+iPUufJb9pNPnxLrtBX1mQpyvj0weXZr
  +9S6rS7yS/9VM9l/jlo3PdUkF9fR4+iTcbV0w8tu+hcNgZDxfLjOmrS1/KBqd5OrDrzT6st/r
  nhR17/5821Cu6/e3wg+gJUVffKbEUZyQaajEXFScCADGw/qIcAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-23.tower-248.messagelabs.com!1618467713!1014541!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9616 invoked from network); 15 Apr 2021 06:21:53 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-23.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Apr 2021 06:21:53 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13F6LrHK004071
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 07:21:53 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 15 Apr 2021 07:21:51 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] librepo: upgrade 1.13.0 -> 1.14.0
Date: Thu, 15 Apr 2021 22:53:39 +0800
Message-ID: <1618498419-53190-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../librepo/{librepo_1.13.0.bb => librepo_1.14.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/librepo/{librepo_1.13.0.bb => librepo_1.14.0.bb} (94%)

diff --git a/meta/recipes-devtools/librepo/librepo_1.13.0.bb b/meta/recipes-devtools/librepo/librepo_1.14.0.bb
similarity index 94%
rename from meta/recipes-devtools/librepo/librepo_1.13.0.bb
rename to meta/recipes-devtools/librepo/librepo_1.14.0.bb
index 0a68e0ac4f..109b40ce3d 100644
--- a/meta/recipes-devtools/librepo/librepo_1.13.0.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.14.0.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://github.com/rpm-software-management/librepo.git \
            file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch \
            "
 
-SRCREV = "a244d78bab11510408fb9413f1c78c2f56c69fa5"
+SRCREV = "88b769eceefc1b151937e6b54d108b48f2177d87"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

