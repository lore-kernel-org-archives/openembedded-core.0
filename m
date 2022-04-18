Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C82C7C3527C
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:01 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web08.38711.1650283976543407751
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 05:12:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=QO2BDfdb;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650283975; i=@fujitsu.com;
	bh=/Q72Lc3j+rjStWZsaN1IH0QUSN+7ZCxJMF4n/ciLD2k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=QO2BDfdb7XA7CbwnSH29NqJe+cDCVextECCHz7JmBEta9RUQse6sn5Bq28gcehnT7
	 7C72BuniDD7WBbheYpqVUj2P4bO5eWqJtdllRjejL0b1ZA05wuJTGKtjLQIbJxm9hR
	 a/VQos+16j2KoIPD5jYnA5P7xwL6LSQ6kUS3znQg2uewSLQBePBpCBIbm0JELmKShq
	 eHZdj0HnXbYIviB/AUPVPmMHoy8fnSy5r9p7fnWvghr4snG6dRSpe4T8sZ9reUpIp9
	 fpfEBeDk88/O6GqQBU6FcKLcNEOj3eRfj9UFpd7auqi4c4X7UKFWcUhKXpo6N+UYV7
	 AfvxYzj1NZorg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8MxSfdYaGy
  Swe+TihZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bjve9YCu7xVFxd9pG1gXE5dxcjF4eQwGNG
  iT1LZjFDOOeZJHpuH2aBcPYwSqxYP4W1i5GTg01ATWL6rRtANgeHiICexNV/oiBhZgEViRe/e
  9hBbGEBG4lNfZvASlgEVCXmXeMDCfMKOEn8+vEdbIqEgILElIfvmUFsTgFniWlXNzGB2EJANf
  9/b2eBqBeUODnzCQvEeAmJgy9eMEP0KkrMvtzMAmFXSMya1cYEYatJXD23iXkCo+AsJO2zkLQ
  vYGRaxWidVJSZnlGSm5iZo2toYKBraGiqa2ypa2RgoJdYpZuol1qqW55aXKJrpJdYXqyXWlys
  V1yZm5yTopeXWrKJERjEKcXqJ3YwPl35U+8QoyQHk5Io73/f2CQhvqT8lMqMxOKM+KLSnNTiQ
  4wyHBxKErwtAUA5waLU9NSKtMwcYETBpCU4eJREeDkCgdK8xQWJucWZ6RCpU4yKUuK81SFACQ
  GQREZpHlwbLIovMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmFQWZwpOZVwI3/RXQYiagxdv
  nR4IsLklESEk1MJVvk27L3Vy5JvQGe3r/SxUtzidTKzJf8papi73aaOcff9tlocmhaRymiTK3
  HCY+TP6vIZS3Nvstz/UVK5JPmf6uOCu7k//43Ts//r2z+a3WIHQiNs9i39yqY0s7P+zgW7RwG
  zdfFpfb/8trP5zb/cX1zmRjY/Yfk+OOcGdUvWSzDxN5wS87/VTPY6mJFybenWH4UNHBK7CgV2
  n/Qzu28l6rq34Ges8FPvJwX/w+nzF6s6tDRfGRbbIsllLL1z+c9vfm34PXv37rVTnBPe2O6OP
  u6N/7T7nPE6vT+iCx53vQpJ86C04bCj5bcEyufbMs89V2vs0fV86RKOZ5zcWhdfnxpehN3+Zl
  TFzFcXTzP84GJZbijERDLeai4kQAz9I0jV0DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-571.messagelabs.com!1650283974!199306!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23003 invoked from network); 18 Apr 2022 12:12:54 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-22.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 18 Apr 2022 12:12:54 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 263FC10047B
	for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 13:12:54 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 17FE910044A
	for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 13:12:54 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 18 Apr 2022 13:12:36 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libusb1: upgrade 1.0.25 -> 1.0.26
Date: Mon, 18 Apr 2022 20:12:23 +0800
Message-ID: <1650283944-16485-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1650283944-16485-1-git-send-email-wangmy@fujitsu.com>
References: <1650283944-16485-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164591

Changelog:
==========
* Fix regression with transfer free's after closing device
* Fix regression with destroyed context if API is misused
* Workaround for applications using missing default context
* Fix hotplog enumeration regression
* Fix Windows isochronous transfer regression since 1.0.24
* Fix macOS exit crash in some multi-context cases
* Build fixes for various platforms and configurations
* Fix Windows HID multi-interface product string retrieval
* Update isochronous OUT packet actual lengths on Windows
* Add interface bound checking for broken devices
* Add umockdev tests on Linux

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libusb/{libusb1_1.0.25.bb => libusb1_1.0.26.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libusb/{libusb1_1.0.25.bb => libusb1_1.0.26.bb} (94%)

diff --git a/meta/recipes-support/libusb/libusb1_1.0.25.bb b/meta/recipes-support/libusb/libusb1_1.0.26.bb
similarity index 94%
rename from meta/recipes-support/libusb/libusb1_1.0.25.bb
rename to meta/recipes-support/libusb/libusb1_1.0.26.bb
index 64cc19e47d..fd63e7adc2 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.25.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.26.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://github.com/libusb/libusb/releases/download/v${PV}/libusb-${PV
 
 UPSTREAM_CHECK_URI = "https://github.com/libusb/libusb/releases"
 
-SRC_URI[sha256sum] = "8a28ef197a797ebac2702f095e81975e2b02b2eeff2774fa909c78a74ef50849"
+SRC_URI[sha256sum] = "12ce7a61fc9854d1d2a1ffe095f7b5fac19ddba095c259e6067a46500381b5a5"
 
 S = "${WORKDIR}/libusb-${PV}"
 
-- 
2.25.1


