Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE454C77B61
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 09:41:58 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.40284.1681119709353061847
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 02:41:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Z4DhII/C;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681119707; i=@fujitsu.com;
	bh=eBlI/s+T72gLCPUmbPqrUcPAKe4WDAwJD3F10+E3s7A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Z4DhII/Cgh8dYJNenbayA1cpbdVQWWo/gz9NiKECk3cu/6fSfgKUiABBgFqqLbHRS
	 eMK+eUkbSUa2EG3s9OtW6Zj4UsybdnxKbbAs0uYU4xlkxu+TnFBhSN7yiNMSJIcDiP
	 n16uxaXv2vfwYwf7fO5LVGEEwpaS26/NaRcb7IMtyamdhmYnL4G4GDlQMc7ER88GiD
	 g21qMDkv7c6+Sm3Ywg0Eb4qOiNPgHgPCbnMi2dCq/9hx8nBVDZ9RbZ+uCo2aOxvrgv
	 LmdTHtMKoa5iiULc2WsuHI0Q8TSZZvkF80zIBIPPnQkrQkyTAqSiSJgdOhU6/V5YYl
	 3hdkkNVAtkq7g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8ORqHv7pnG
  KwZoWLos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPVJr+CVUIVq/++Y2tgfCbQxcjFISTwmFFi
  zdZT7BDONSaJKdPnMEM4exglLs16z9bFyMnBJiAlceP+fyCbg0NEQE/i6j9RkDCzgIrEi9897
  CC2sIC7xL4v35hBbBYBVYlL3+eAxXkFnCSeLdwIFpcQUJCY8vA9mM0p4CzR/eEnC4gtBFTz7s
  1SqHpBiZMzn7BAzJeQOPjiBVSvosTsy80sEHaFROP0Q0wQtprE1XObmCcwCs5C0j4LSfsCRqZ
  VjGbFqUVlqUW6hqZ6SUWZ6RkluYmZOXqJVbqJeqmluuWpxSW6RnqJ5cV6qcXFesWVuck5KXp5
  qSWbGIGhm1KsOGEH48W+v3qHGCU5mJREebu4jFOE+JLyUyozEosz4otKc1KLDzHKcHAoSfAyX
  AbKCRalpqdWpGXmAOMIJi3BwaMkwitxDSjNW1yQmFucmQ6ROsWoKCXOy3EeKCEAksgozYNrg8
  XuJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvGcuAk3hycwrgZv+CmgxE9BiLhcDkMUliQg
  pqQam8wp/jrNUdOsV+R1l/DllxdZrEUu1HxffDxQ0Ov+KoWf/xr5W5oCTu1cF/rjF2r9vSvFf
  uQmGW77fd8vKy+ecX/D9HudZv6uFM9z1L703LOqLqy70+PvSnOniU9czc1Z9jThxaMFdU2H1n
  kfP23zdJ0+bkOFcqLpdsmyFRPDr3Fn6YY1VS2/J1q4qqugL+B2QbN97/fbhJZ1n38786yun8r
  fZdMfEh20agRbGim4X51Qf50q62rem1SXJ+6SJhn3NfpYlyWd4/m75uvvArskZUoL3ErlTjny
  +y3Dl0bKGeDP1yyEvp2nUf+uraJ7Zn1Ay99oOr5w5h5SULQpLZd4w6IUdL5qXLCFekj29zKxc
  iaU4I9FQi7moOBEAaE3lAlgDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-571.messagelabs.com!1681119707!197531!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21484 invoked from network); 10 Apr 2023 09:41:47 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-6.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 09:41:47 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id D9D011001A2
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:41:46 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id CDCED1001A5
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:41:46 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 10:41:45 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-setuptools: upgrade 67.6.0 -> 67.6.1
Date: Mon, 10 Apr 2023 17:41:32 +0800
Message-ID: <1681119692-25319-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681119692-25319-1-git-send-email-wangmy@fujitsu.com>
References: <1681119692-25319-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:41:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179884

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 #3865: Fixed _WouldIgnoreField warnings for scripts and gui_scripts, when entry-points is not listed in dynamic.
 #3875: Update code generated by validate-pyproject to use v0.12.2. This should fix default license patterns when pyproject.toml is used.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-conditionally-do-not-fetch-code-by-easy_install.patch  | 2 +-
 ...ython3-setuptools_67.6.0.bb => python3-setuptools_67.6.1.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_67.6.0.bb => python3-setuptools_67.6.1.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index b12e4f5d05..4d56dc89ba 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From 8a67710131fc1b8246edc4dbcd8077eed96e13f7 Mon Sep 17 00:00:00 2001
+From 2b06ca797d3ccc5b195aaa04a085c44bf61d4de3 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
diff --git a/meta/recipes-devtools/python/python3-setuptools_67.6.0.bb b/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-setuptools_67.6.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_67.6.1.bb
index aa1d525c02..ad0d7cc527 100644
--- a/meta/recipes-devtools/python/python3-setuptools_67.6.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb
@@ -11,7 +11,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "2ee892cd5f29f3373097f5a814697e397cf3ce313616df0af11231e2ad118077"
+SRC_URI[sha256sum] = "257de92a9d50a60b8e22abfcbb771571fde0dbf3ec234463212027a4eeecbe9a"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.34.1


