Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CD10C433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 10:27:15 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web12.9436.1644316033058551498
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 02:27:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=FK+050nS;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644316031; i=@fujitsu.com;
	bh=djYV67yR33swz86W9d9wmS0nXcpVACHo/iqXIjlALN8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=FK+050nSv9OY5Q6F3nCg9xzhXE460Ko0bjVVqKZ6XLjFVzWSNk631ELeGc0IDMFOU
	 hVlhq0J+MW4KHtv9wVRr37oTHwN2kEMoSIp7673lrWwjdDN0xo0oWjCRpJowvjZP3W
	 h6gZrH7XRiqFqGNjTNVQMaCcAcAZWi57f3WIeozpImUr/o+EMBmu9ePU0DSprT7CgL
	 PZV4EWOCuul6jRupKktS7KurgzaR2Hm1b9/b1zJRs8g9qKhGKKwuRViyzQh2Rdvjm4
	 a3DudxS7eHO7D+nEIQfCxK0FFYe1JW8QVKI0VSWaN7ZcB/NV0uyWG16Q1e5PFo5/mN
	 wriH8GkYzKJAQ==
Received: from [100.115.2.51] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.ess.symcld.net id 10/E7-12986-F7542026;
 Tue, 08 Feb 2022 10:27:11 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8MxSbfOlSn
  J4OsTU4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNaOtu5uxYJZQxbz2n+wNjB8Fuhi5OIQEHjNK
  fNv6lw3COc8k8WTXT0YI5zijxMvOO8xdjJwcbAJqEtNv3WDtYuTgEBHQk7j6TxQkzCygIvHid
  w87iC0s4CnReO8KK4jNAhTfs2QiE4jNK+AosXbBAjBbQkBBYsrD92AjOQWcJO7veMYCYgsB1X
  zctZIVol5Q4uTMJywQ8yUkDr54wQzRqygx+3IzC4RdITFrVhvUTDWJq+c2MU9gFJyFpH0WkvY
  FjEyrGK2SijLTM0pyEzNzdA0NDHQNDU11DXSNDE31Eqt0E/VSS3XLU4tLdA31EsuL9VKLi/WK
  K3OTc1L08lJLNjECgzilmOH6DsaJfT/1DjFKcjApifImqTIlCfEl5adUZiQWZ8QXleakFh9il
  OHgUJLgtXYBygkWpaanVqRl5gAjCiYtwcGjJMK7GiTNW1yQmFucmQ6ROsWoKCXOKwOSEABJZJ
  TmwbXBovgSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWFeF5ApPJl5JXDTXwEtZgJa/HXRv0S
  gxSWJCCmpBiatVAPnpORcI+mHW9dbbj7S/TfDiOnan8oNUbqXv65KveYkpvYsP2+n+oOEgxqF
  hi3nHHnFm+SNnn4RPslkUrOx/RejCnuJxOnVr3YxLZLT5Fx+UTv7R7Gvk832Ph2mw8Fun/kDr
  GvX5hVlX2mPuMvgxqlXx+Ybr/xPf4321/d7na3OqSTEBhyrE/13tdXbeGlK0foZ1fcMzoonz3
  geeeep8oGgv1uC/v8PD116RiHqf5m31q2rn91KBdJbdiqIxRVl8Pz3vb8n7dbfsz/keQtfn/c
  qipr68pnlscSSToFvIr88rrpMPq3/Pq9HcrP2ItkVvf0TqmxWfmi6Hy+3WuWz4mv5jR+KnYPC
  1ll8VGIpzkg01GIuKk4EAEnUK7ddAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-591.messagelabs.com!1644316030!1420!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3184 invoked from network); 8 Feb 2022 10:27:10 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-16.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 8 Feb 2022 10:27:10 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 55E37100455
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Feb 2022 10:27:10 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 405C910044C
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Feb 2022 10:27:10 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 8 Feb 2022 10:26:53 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pycryptodome: upgrade 3.14.0 -> 3.14.1
Date: Tue, 8 Feb 2022 18:26:38 +0800
Message-ID: <1644316000-5853-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1644316000-5853-1-git-send-email-wangmy@fujitsu.com>
References: <1644316000-5853-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 10:27:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161491

Changelog:
=========
GH#595: Fixed memory leak for GMP integers.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/python/python3-pycryptodome_3.14.0.bb  | 5 -----
 meta/recipes-devtools/python/python3-pycryptodome_3.14.1.bb  | 5 +++++
 ...cryptodomex_3.14.0.bb => python3-pycryptodomex_3.14.1.bb} | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pycryptodome_3.14.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-pycryptodome_3.14.1.bb
 rename meta/recipes-devtools/python/{python3-pycryptodomex_3.14.0.bb => python3-pycryptodomex_3.14.1.bb} (69%)

diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.14.0.bb b/meta/recipes-devtools/python/python3-pycryptodome_3.14.0.bb
deleted file mode 100644
index fb2f8d5ff0..0000000000
--- a/meta/recipes-devtools/python/python3-pycryptodome_3.14.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require python-pycryptodome.inc
-inherit setuptools3
-
-SRC_URI[sha256sum] = "ceea92a4b8ba6c50d8d70f2efbb4ea14b002dac4160ce4dda33f1b7442f8158a"
-
diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.14.1.bb b/meta/recipes-devtools/python/python3-pycryptodome_3.14.1.bb
new file mode 100644
index 0000000000..c0324590c2
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pycryptodome_3.14.1.bb
@@ -0,0 +1,5 @@
+require python-pycryptodome.inc
+inherit setuptools3
+
+SRC_URI[sha256sum] = "e04e40a7f8c1669195536a37979dd87da2c32dbdc73d6fe35f0077b0c17c803b"
+
diff --git a/meta/recipes-devtools/python/python3-pycryptodomex_3.14.0.bb b/meta/recipes-devtools/python/python3-pycryptodomex_3.14.1.bb
similarity index 69%
rename from meta/recipes-devtools/python/python3-pycryptodomex_3.14.0.bb
rename to meta/recipes-devtools/python/python3-pycryptodomex_3.14.1.bb
index b83549840d..79a3fee19c 100644
--- a/meta/recipes-devtools/python/python3-pycryptodomex_3.14.0.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodomex_3.14.1.bb
@@ -1,7 +1,7 @@
 require python-pycryptodome.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "2d8bda8f949b79b78b293706aa7fc1e5c171c62661252bfdd5d12c70acd03282"
+SRC_URI[sha256sum] = "2ce76ed0081fd6ac8c74edc75b9d14eca2064173af79843c24fa62573263c1f2"
 
 FILES:${PN}-tests = " \
     ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/ \
-- 
2.25.1


