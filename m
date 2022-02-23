Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48FADC433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 11:03:33 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.6207.1645614211543550961
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 03:03:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=oI3UsJ0H;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1645614209; i=@fujitsu.com;
	bh=Z0KyRolNgG8cewNOLp9pw/uowynR5E7HcU5gWt5GbGk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=oI3UsJ0H+UUhW1kWc97851TJZObu8ReZC5+dcUsU3lIC4rflF8QhLzywBsIvEECWW
	 /ZhDcKg6FblXUaZvBIbFW1j7yQNf75th61t/HCcSIHSHamvV+NiHPLcpTRm8VegLaN
	 2CLHHumLmgxRaTswgu/mL0zr1dG8HphBVxaiDrZ1PaAaC6fH0aS2WZzBnlwd8lShR+
	 +eQKgRN9gkvxLY1qZUT1dWyHh6Xt5PN7Ny8YCBkvjlkt/WPeiUF+Qp5X3TJ6KJqWa9
	 AXxb0X8axkOK+fXNKKpSvBCAH/r3T4WOVCb8Jy8PYSfR9d/3G77w7AUZKTDxfY2lXS
	 g7AZBX5imf1rg==
Received: from [100.115.71.247] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 9E/48-24566-18416126; Wed, 23 Feb 2022 11:03:29 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRWlGSWpSXmKPExsViZ8MxRbdRRCz
  JoHMaq8Wdn+/YHRg9zm1cwRjAGMWamZeUX5HAmtF2UKRgJ3fFyzOHWRoYN3J1MXJxCAnMYJK4
  umYtI4RzglHi/M3pzF2MnBxsAmoS02/dYO1i5OAQEdCTuPpPFCTMLKAi8eJ3DztIWFjAReLyc
  x2QMIuAqsTN/j0sIDavgJPE/Q2vmEBsCQEFiSkP34NN5BRwlrj3tIsVxBYCqvnf/JoZol5Q4u
  TMJywQ4yUkDr54wQzRqygx+3IzC4RdITFrVhvTBEb+WUhaZiFpWcDItIrRLqkoMz2jJDcxM0f
  X0MBA19DQVNfMTNfQ1FQvsUo3US+1VDc5Na+kKBEorZdYXqyXWlysV1yZm5yTopeXWrKJERiW
  KcVOs3cw7uj7qXeIUZKDSUmU9xqPWJIQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCV5nAaCcYFFqe
  mpFWmYOMEZg0hIcPEoivAl8QGne4oLE3OLMdIjUKUZdjqtXruxlFmLJy89LlRLn5RACKhIAKc
  oozYMbAYvXS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeW1BpvBk5pXAbXoFdAQT0BFTsoR
  AjihJREhJNTDJWf/6d2BTz1uOS+vk3h48c+2C9+ndxdumPJmyIihIPzItsfbMhN4F3+rusrjf
  OvN/4hephb6NQWs2dgp8ebCg5r6BdoTAPsVDpw2Yxe6d690su3NtxK0Jm3a5r5c1eNG6mz/rV
  FPk9aerLnXV3dWc9Lu4229m4st9y3yXC2aUdqXoT5q2VLTEW2l36+/iHf93HisVLbAIM5x4j7
  Utwv5wapTHpZURAtVfJEXv5nxPf7tx78TtWafjhPZkfPRae9PjRxNz0R+GnSm27prpEcHe4vF
  X9bf17/qxW8fx0ie/2Mf/D27t2bXs3X23ew2OZ5tNs1KTq9Pte2027n56w7JTTq1l7rV5AqLr
  zJyc4lM+K7EUZyQaajEXFScCAFBXqqlSAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-532.messagelabs.com!1645614208!5144!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21719 invoked from network); 23 Feb 2022 11:03:29 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-9.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Feb 2022 11:03:29 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 21NB3Mpu014052
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Feb 2022 11:03:28 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 23 Feb 2022 11:03:26 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] init-system-helpers: upgrade 1.60 -> 1.62
Date: Wed, 23 Feb 2022 19:03:11 +0800
Message-ID: <1645614192-28889-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1645614192-28889-1-git-send-email-wangmy@fujitsu.com>
References: <1645614192-28889-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Feb 2022 11:03:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162251

Changelog:
=========
* use fakechroot instead of unsharing the mount namespace and mounting tmpfs
* deb-systemd-invoke: systemctl --machine @<UID> is now available in
  v249.10. Adjust the version check accordingly
* Skip build-time tests if DEB_BUILD_OPTIONS=nocheck is set
* Fix typos found by Lintian
* Set Rules-Requires-Root: no

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{init-system-helpers_1.60.bb => init-system-helpers_1.62.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/initscripts/{init-system-helpers_1.60.bb => init-system-helpers_1.62.bb} (96%)

diff --git a/meta/recipes-core/initscripts/init-system-helpers_1.60.bb b/meta/recipes-core/initscripts/init-system-helpers_1.62.bb
similarity index 96%
rename from meta/recipes-core/initscripts/init-system-helpers_1.60.bb
rename to meta/recipes-core/initscripts/init-system-helpers_1.62.bb
index 187bb8326b..d5c05ff8e5 100644
--- a/meta/recipes-core/initscripts/init-system-helpers_1.60.bb
+++ b/meta/recipes-core/initscripts/init-system-helpers_1.62.bb
@@ -16,7 +16,7 @@ SECTION = "base"
 LICENSE = "BSD-3-Clause & GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=ee2b1830fcfead84d07bc060ec43e072"
 
-SRCREV = "dbd9197569c0935029acd5c9b02b84c68fd937ee"
+SRCREV = "bbe4b508f3216cdc124683ba449e2295974a6b4a"
 SRC_URI = "git://salsa.debian.org/debian/init-system-helpers.git;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


