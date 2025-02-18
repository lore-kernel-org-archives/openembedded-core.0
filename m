Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33EF0C021BB
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 07:41:39 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.14681.1739864485588248530
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 23:41:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=uBJ8oCuy;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739864491; x=1771400491;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=NqmLMkHEAP7UkjJzgcWuH0yYpSUJxLIkx4w0g2pycxI=;
  b=uBJ8oCuyw8aQ19jsN8Z9mflQ70eVbdxKXmVftDiJ4UMAthpAtPoY69i9
   aR72oqjVXkhY4Zl1+46k2xgdsHckSxH4U/rwUJdkigusdLk3L53w9nJur
   2/TXgL2jRNHumoCBfHkriQ9vXNpQfXhcWKSQfLtmXpMnC6S26uMxBGND2
   U6J5nW02i5+7V6nEPlpFUFKhRyLMS5GKDFteAjGDhcjXVVoPDXXQJoggW
   UWpdg5R3/gdGn07AQrGj10kgsj523yEZ9SVnxwDcBFdiJUPq5oQaupIAn
   uUuM2cTyFC/tCWp6FuRuhNif0xqV1JP7tKgpiDtYpCLyGw0YsLx2r5F8R
   Q==;
X-CSE-ConnectionGUID: zKhzOHeHQdC4H4lcEXV1RQ==
X-CSE-MsgGUID: qYCxZdFQT7qb98Zxiircog==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="190602681"
X-IronPort-AV: E=Sophos;i="6.13,295,1732546800"; 
   d="scan'208";a="190602681"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 16:41:30 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5DB80D5020
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 22DAED5041
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:28 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B80971A000B;
	Tue, 18 Feb 2025 15:41:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 20/32] python3-mako: upgrade 1.3.8 -> 1.3.9
Date: Tue, 18 Feb 2025 15:39:23 +0800
Message-Id: <1739864375-21394-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
References: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 07:41:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211582

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2025.

Fixed test suite to not rely upon ancient "future division" statement to
test the Template.future_imports feature.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-mako_1.3.8.bb => python3-mako_1.3.9.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-mako_1.3.8.bb => python3-mako_1.3.9.bb} (78%)

diff --git a/meta/recipes-devtools/python/python3-mako_1.3.8.bb b/meta/recipes-devtools/python/python3-mako_1.3.9.bb
similarity index 78%
rename from meta/recipes-devtools/python/python3-mako_1.3.8.bb
rename to meta/recipes-devtools/python/python3-mako_1.3.9.bb
index 3cfe56e043..83b6149337 100644
--- a/meta/recipes-devtools/python/python3-mako_1.3.8.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.3.9.bb
@@ -2,7 +2,7 @@ SUMMARY = "Templating library for Python"
 HOMEPAGE = "http://www.makotemplates.org/"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d0995d6f7ba3f186a03118f244e88f57"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=73026b50800163bd3c75cfdc121d9eb5"
 
 PYPI_PACKAGE = "mako"
 
@@ -10,7 +10,7 @@ inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 
 
-SRC_URI[sha256sum] = "577b97e414580d3e088d47c2dbbe9594aa7a5146ed2875d4dfa9075af2dd3cc8"
+SRC_URI[sha256sum] = "b5d65ff3462870feec922dbccf38f6efb44e5714d7b593a656be86663d8600ac"
 
 RDEPENDS:${PN} = "python3-html \
                   python3-markupsafe \
-- 
2.43.0


