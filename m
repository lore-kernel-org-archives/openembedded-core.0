Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BD1AC433F5
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 06:46:24 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web09.3750.1653461174147625360
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 23:46:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=URN1G8TE;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653461172; i=@fujitsu.com;
	bh=Us6luVWnl6bM0M+FkC/UJPr+7oZOezZYZXl/TcdtW50=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=URN1G8TE/yprGe8tzY/e/1yKNSbAfhht/qA7tPRF3/GOhUzlEzYCw8JZFXaYDmhk6
	 x2izaMSU9NRSnCT4BtrAeprLPpKZHS/xzf+8Byht3vffr66g90koDCvPNl3xyOcWRi
	 Ly0G0Bt4DkECPNKCA3SZujvL+HFE/++y41biE/WggyVTd7F+CzgSJTVw6ZgvgU2IWY
	 Xg90EnFtYOP8oJaODc0G5xfJpfqbKO5CzcR6yXwkA5rZWd9KGsI8J+M2HtPyIdYI+q
	 0t14e85z0w0PBklgD6vPs380sYbNq/gVmTTS/ncO1cxRR7hHLNHAQm6cdL92fi9qzQ
	 wnfZLHmLgxATg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8ORqLv5Qm+
  SwbQjBhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aRn8fZCm4KVGw/JtfAuI6/i5GLQ0jgMaPE
  8q4WFgjnPJPEs9mT2CGcPYwSR6c+YO1i5ORgE1CTmH7rBpDNwSEioCdx9Z8oSJhZQEXixe8ed
  hBbWMBdYvrPbYwgNouAqsSO7qvMIOW8Ak4SS08XgoQlBBQkpjx8zwxicwo4S7za+RpsuhBQyf
  vzd9hAbF4BQYmTM5+wQIyXkDj44gUzRK+ixOzLzSwQdoXEjBnb2CBsNYmr5zYxT2AUnIWkfRa
  S9gWMTKsYbZKKMtMzSnITM3N0DQ0MdA0NTXUtzXQNjY30Eqt0E/VSS3Xz8otKMnQN9RLLi/VS
  i4v1iitzk3NS9PJSSzYxAoM4pTihZQfj7X2/9A4xSnIwKYnyntjQmyTEl5SfUpmRWJwRX1Sak
  1p8iFGGg0NJgjf5PFBOsCg1PbUiLTMHGFEwaQkOHiUR3h8gad7igsTc4sx0iNQpRl2OY1+/72
  cWYsnLz0uVEuf9BlIkAFKUUZoHNwIW3ZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfOyAFO
  FEE9mXgncpldARzABHZHPC3ZESSJCSqqBScIkYOrDi3WiS5LL3sntN9x1YTaTes2tshCWP9ou
  /ZfPH1b9vLbgfVd36NkE47OZf2/8sF71rSt9Ah9D+fKnW746vrNKi41WeXnxR4fUwQl7Fp0Xe
  /fsvfGiqOCZAp1x+q/1Pp7wv+t+clHTuwlm2sLF+1UzvqYfdIorTFzidGX1T//T+146fN8e3B
  vSPuvsBm1tlvpYAxGZK3vin3pcc5mna8BdJj8p8caM5qvrz+5yW9g44w2zAs/blvnPlqtaMkh
  Nrbn5jyOBm9NQvO3zba1DMleXtP56uKT1bNZWgUVCN2rkD2f9/vhh937mvx6THQujFnRxMa5M
  dUmw4ePUClwo0fbk3qMr6aECNhNeGSuxFGckGmoxFxUnAgBxCY7vaQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-728.messagelabs.com!1653461171!70124!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4134 invoked from network); 25 May 2022 06:46:11 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-4.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 25 May 2022 06:46:11 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 0482010019F
	for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:46:11 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id E7AD9100192
	for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:46:10 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 25 May 2022 07:45:54 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-setuptools: upgrade 62.3.1 -> 62.3.2
Date: Wed, 25 May 2022 14:45:33 +0800
Message-ID: <1653461133-12463-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1653461133-12463-1-git-send-email-wangmy@fujitsu.com>
References: <1653461133-12463-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 06:46:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166103

Changelog:
=========
Misc
-----
#3328: Include a first line summary to some of the existing multi-line warnings.


Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-conditionally-do-not-fetch-code-by-easy_install.patch  | 2 +-
 ...ython3-setuptools_62.3.1.bb => python3-setuptools_62.3.2.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_62.3.1.bb => python3-setuptools_62.3.2.bb} (95%)

diff --git a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index a2b7a519af..b28865291c 100644
--- a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From d1b4fa4a99774878035a0f664ec0d9686e7f0c89 Mon Sep 17 00:00:00 2001
+From d03595e69cc532e27c0d3d535f08107349669d3d Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
diff --git a/meta/recipes-devtools/python/python3-setuptools_62.3.1.bb b/meta/recipes-devtools/python/python3-setuptools_62.3.2.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-setuptools_62.3.1.bb
rename to meta/recipes-devtools/python/python3-setuptools_62.3.2.bb
index c9367c180f..406a4bd4e7 100644
--- a/meta/recipes-devtools/python/python3-setuptools_62.3.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_62.3.2.bb
@@ -11,7 +11,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += "file://0001-change-shebang-to-python3.patch \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "28c79c24d83c42a5e6d6cc711e5e9a6c1b89326229feaa5807fc277040658600"
+SRC_URI[sha256sum] = "a43bdedf853c670e5fed28e5623403bad2f73cf02f9a2774e91def6bda8265a7"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.25.1


