Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E0D4C43217
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 05:31:10 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web12.16143.1667453466890940304
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Nov 2022 22:31:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=LPRAVOwH;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667453465; i=@fujitsu.com;
	bh=JM0TGAswN5zwchC6xVROdILtz5ZKg7t9fzGjrJUoYfE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=LPRAVOwHSbAzT9RXUNzIpSnMWf6wka3Ll/eeGDqPfllBgocEd37GslQmrSE26UkSm
	 faGZ90C9Ygs3fyNta8MeIiuWaHnIG5VqHZVX7BP4+0FHA2l9vBQiX/8JU8suvFyzkv
	 WGTg+I4DtBm4IWYho31KJIMBqAY0/CY5z+6Vggya7yW85iQA2y1oAqQaFBCEj6iwNw
	 NPbbdfNKmBDq0cf+Zo1IysYVFtW/bjO2jIgf7zQowMT5H4bHgU6iGifxiiMQnWy6Bn
	 weFDIB7crjUruz4dKo5YNhaa9zOpuZYz7viADt5jBAY36rPaq2TdfGg7aQN2544tMO
	 cCmWCgyEC6Hqw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNIsWRWlGSWpSXmKPExsViZ8MxSVciKDn
  Z4NpGRYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPZuQ+MBXv1K14tO8vWwPhZu4uRk0NI4DGj
  RNsTawj7GpPEuqb0LkYuIHs3o8TUdx2MIAk2ASmJG/f/s3UxcnCICOhJXP0nChJmFlCRePG7h
  x3EFhawlGh4dokNxGYBiv9e0cEMYvMKOEnsX/EWLC4hoCAx5eF7qLigxMmZT1gg5khIHHzxgh
  miRlFi9uVmFgi7QmLWrDYmCFtN4uq5TcwTGPlnIWmfhaR9ASPTKkbT4tSistQiXVO9pKLM9Iy
  S3MTMHL3EKt1EvdRS3fLU4hJdQ73E8mK91OJiveLK3OScFL281JJNjMAwTClmLNvB2L3sj94h
  RkkOJiVR3is7k5KF+JLyUyozEosz4otKc1KLDzHKcHAoSfBqBSYnCwkWpaanVqRl5gBjAiYtw
  cGjJMJ73Q8ozVtckJhbnJkOkTrFqCglzrslACghAJLIKM2Da4PF4SVGWSlhXkYGBgYhnoLUot
  zMElT5V4ziHIxKwrxbQcbzZOaVwE1/BbSYCWjxtuokkMUliQgpqQamxvANsZFLl/78vfeJs92
  eK5v3HrZp5T5zSC3mNLPNHaH6+c8OnGwN5CuuOSHs/eH0pI/2LeduaU/1aFy+RWFD59Pbk5c/
  rPmgKrYqce0S5R+lM5bPOM8unRMy9cni53s3Ft9LWx92a0JCYIHU3jtfbb22v7m9Mub+0Q1iZ
  1Ufq93cJ76AgXHdzGOyHxb6/zJ+1Hn75DHp5WaVqQr9p8NnaCXb5RS8//j4mnvKTlvzN1dzM4
  L9m8v/71NyerZha8uUf2pr/94tK66S0J4ga+jz89/BlhlPfxvXMpRbHN94Nyv4V3+49tvudhO
  vfUL2Cmpl8+5bnlJ3Se/5HHGwXN2yIn2pvw1DyYuXlat/bNK2VVViKc5INNRiLipOBABOwqi4
  PgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-29.tower-585.messagelabs.com!1667453464!2250!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5518 invoked from network); 3 Nov 2022 05:31:04 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-29.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Nov 2022 05:31:04 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 285041000D7
	for <openembedded-core@lists.openembedded.org>; Thu,  3 Nov 2022 05:31:04 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 1B4041000D5
	for <openembedded-core@lists.openembedded.org>; Thu,  3 Nov 2022 05:31:04 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 3 Nov 2022 05:31:02 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] bind: upgrade 9.18.7 -> 9.18.8
Date: Thu, 3 Nov 2022 13:30:44 +0800
Message-ID: <1667453448-28192-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 05:31:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172602

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://gitlab.isc.org/isc-projects/bind9/-/blob/v9_18_8/CHANGES

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-avoid-start-failure-with-bind-user.patch               | 0
 .../0001-named-lwresd-V-and-start-log-hide-build-options.patch  | 0
 .../bind-ensure-searching-for-json-headers-searches-sysr.patch  | 0
 .../bind/{bind-9.18.7 => bind-9.18.8}/bind9                     | 0
 .../bind/{bind-9.18.7 => bind-9.18.8}/conf.patch                | 0
 .../bind/{bind-9.18.7 => bind-9.18.8}/generate-rndc-key.sh      | 0
 .../init.d-add-support-for-read-only-rootfs.patch               | 0
 .../make-etc-initd-bind-stop-work.patch                         | 0
 .../bind/{bind-9.18.7 => bind-9.18.8}/named.service             | 0
 .../bind/{bind_9.18.7.bb => bind_9.18.8.bb}                     | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind-9.18.7 => bind-9.18.8}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.7 => bind-9.18.8}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.7 => bind-9.18.8}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.7 => bind-9.18.8}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.7 => bind-9.18.8}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.7 => bind-9.18.8}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.7 => bind-9.18.8}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.7 => bind-9.18.8}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.7 => bind-9.18.8}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.7.bb => bind_9.18.8.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind-9.18.7/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.18.8/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.7/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.18.8/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.7/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.18.8/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.7/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.18.8/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.7/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.18.8/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.7/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.18.8/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.7/bind9 b/meta/recipes-connectivity/bind/bind-9.18.8/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.7/bind9
rename to meta/recipes-connectivity/bind/bind-9.18.8/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.18.7/conf.patch b/meta/recipes-connectivity/bind/bind-9.18.8/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.7/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.18.8/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.7/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.18.8/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.7/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.18.8/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.18.7/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.18.8/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.7/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.18.8/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.7/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.18.8/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.7/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.18.8/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.7/named.service b/meta/recipes-connectivity/bind/bind-9.18.8/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.7/named.service
rename to meta/recipes-connectivity/bind/bind-9.18.8/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.18.7.bb b/meta/recipes-connectivity/bind/bind_9.18.8.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.7.bb
rename to meta/recipes-connectivity/bind/bind_9.18.8.bb
index 4ab11486bf..4925c092c7 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.7.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.8.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "9e2acf1698f49d70ad12ffbad39ec6716a7da524e9ebd98429c7c70ba1262981"
+SRC_URI[sha256sum] = "0e3c3ab9378db84ba0f37073d67ba125ae4f2ff8daf366c9db287e3f1b2c35f0"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.25.1


