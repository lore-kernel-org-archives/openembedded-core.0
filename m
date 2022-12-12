Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F617C04FDE
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 07:33:58 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.37678.1670830430175404287
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Dec 2022 23:33:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=JLHlD1Gu;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670830428; i=@fujitsu.com;
	bh=n4t1CTiBAWiSZYb83LnPwfUcROWklJOMfL2hFG+6CQQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=JLHlD1Gu5y/JxeJFoxzcNh48CCX5YCAtI69QyCBylIwqA8V/OhDeUEdz3+s3/EG0N
	 iSjCMPsB9k2ch7i07NZsluVkSEYF7XqmPnELhS4vTs/vdqJsyDJkffZHl596VsIue5
	 v7Hqj1zHmRvCYKdjw6ZwxOHZH2oqtx/LDt48+DpPw+LqjksnL3kxidS6MglOqKLXTx
	 ffE6VxVJDsqRYPya1epD+U9XvYyU3HFuwL0bE7K0jiW2B9s2RhF4xM8By8PJw/qHbv
	 lU6D7Rdt2VT3wr6/Y8+RJ9fTGNpSN8zkQNxtHHMmt/9KCmGLWUE8snYpE7qRdUw2N7
	 ZRCfl9nRPEt/w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAIsWRWlGSWpSXmKPExsViZ8ORpBt9c1q
  ywY1/FhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bRy49ZCnZyVuxbf4utgfE6RxcjF4eQwANG
  ibmdyxkhnMtMEv/bFrFBOHsYJe5cb2bqYuTkYBOQkrhx/z9QgoNDREBP4uo/UZAws4CKxIvfP
  ewgtrCAvUTb5CWMIDaLgKrExCfXWUFsXgFHia2728FsCQEFiSkP3zNDxAUlTs58wgIxR0Li4I
  sXzBA1ihKzLzezQNgVErNmtTFB2GoSV89tYp7AyD8LSfssJO0LGJlWMZoVpxaVpRbpWuglFWW
  mZ5TkJmbm6CVW6SbqpZbq5uUXlWToGuollhfrpRYX6xVX5ibnpOjlpZZsYgQGY0pxivsOxuPL
  /ugdYpTkYFIS5a28Mi1ZiC8pP6UyI7E4I76oNCe1+BCjDAeHkgTvhmtAOcGi1PTUirTMHGBkw
  KQlOHiURHjdQFp5iwsSc4sz0yFSpxiNOdY2HNjLzDHza9sBZiGWvPy8VClx3gnXgUoFQEozSv
  PgBsEi9hKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYV4bkCk8mXklcPteAZ3CBHRK1MupIKe
  UJCKkpBqYUj9/nyavvyt1vprXfb/HGmemOjzO4d1yo8r45D/rXudn/xg0lDkq5JeYN25K2eom
  98J71QKO4n/nhX/Vp1xNnCYzQ+tXcYv9xUlv4ndNqPy+vSU9MnRFwNeQrGYlcU7Z+S89CoTsH
  iiKPZ9VZnbKPyG9ez9j+Y0PARLXNedsWf3KU6JuRmTR4owNl/N+sj1weP755yPB5RMj1sYUJm
  96rp5Tytr1QP3v1bMHrJuUrhimLc3X8rxxrP/Wdot3kXHzdh2JmHqaM4BLdCJ39JMTPzfuYem
  9+S512lHxk9M3y3G3aJZ2XHf/6XSUTfmyD9etHkfj3c7TjUsP+H6Z0Ky6gP2inSNH953ZQaGz
  Jm9pVmIpzkg01GIuKk4EAFQrh9BTAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-732.messagelabs.com!1670830427!223219!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5837 invoked from network); 12 Dec 2022 07:33:47 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-22.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Dec 2022 07:33:47 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 60BDC1AF
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Dec 2022 07:33:47 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 55DC01AD
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Dec 2022 07:33:47 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 12 Dec 2022 07:33:45 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libxshmfence: upgrade 1.3.1 -> 1.3.2
Date: Mon, 12 Dec 2022 15:33:17 +0800
Message-ID: <1670830398-2960-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 12 Dec 2022 07:33:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174486

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
configure: Use AC_SYS_LARGEFILE to enable large file support

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{libxshmfence_1.3.1.bb => libxshmfence_1.3.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxshmfence_1.3.1.bb => libxshmfence_1.3.2.bb} (87%)

diff --git a/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.1.bb b/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb
similarity index 87%
rename from meta/recipes-graphics/xorg-lib/libxshmfence_1.3.1.bb
rename to meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb
index be793882dc..6b9ed20ae7 100644
--- a/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb
@@ -16,6 +16,6 @@ EXTRA_OECONF += "--with-shared-memory-dir=/dev/shm"
 SRC_URI += "file://0001-xshmfence_futex.h-Define-SYS_futex-if-it-does-not-ex.patch"
 
 XORG_EXT = "tar.xz"
-SRC_URI[sha256sum] = "1129f95147f7bfe6052988a087f1b7cb7122283d2c47a7dbf7135ce0df69b4f8"
+SRC_URI[sha256sum] = "870df257bc40b126d91b5a8f1da6ca8a524555268c50b59c0acd1a27f361606f"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


