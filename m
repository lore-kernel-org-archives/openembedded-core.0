Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 071F7C433F5
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 14:58:58 +0000 (UTC)
Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com
 [195.245.230.83])
 by mx.groups.io with SMTP id smtpd.web09.7400.1637593136663523155
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 06:58:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=p5jyL3xG;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.83,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1637593134; i=@fujitsu.com;
	bh=q5pqmpUuDTmGNAcUVPUDxpx6ibAntSTHZ9i7HXgrLfo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=p5jyL3xGRDb0fHUG9qPNFG6GzRtiQGbOgteCe3BO64V+VStoQk/AduY5AGdpR+CTV
	 uESGQJ9AX36n2n4/s31hp+bRKagGCclRhCNxWFXDiSatnc1LAMgEtaBONX3zjhe7uj
	 yMp5i7f/4LNN6fbzXolkj/9tNKwNhdVLFP5/tmSXbWBdOmGzPWV7waUYA0SWFNkW1s
	 lOTm4Si6y8ozW5UUNsNAInCdrvNNXswZ7MSUw0JjINVa4jxAknE9KiaIVbYHcH4Gy4
	 HnK++ZUFKgrh9phenFVA1DgrQkvtA+z23hsG1bvTVbXSENFfNGt1IlP6z3Z2wHor2Z
	 Rms+PaT6jRvBQ==
Received: from [100.112.196.154] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-west-1.aws.symcld.net id D5/DF-09147-E20BB916;
 Mon, 22 Nov 2021 14:58:54 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRWlGSWpSXmKPExsViZ8MxSVdvw+x
  Eg6ZjYhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bHPzIFHzgr2s/uY25g/MLRxcjFISTwmFFi
  0qTzzBDOeSaJhp1f2boYOYGcE4wSW/YFg9hsAmoS02/dYO1i5OAQEdCTuPpPFCTMLKAi8eJ3D
  zuILSxgLrF5zR0mEJtFQFXie+MXZhCbV8BJ4tThTWAjJQQUJKY8fA8VF5Q4OfMJC8QcCYmDL1
  4wQ9QoSsy+3MwCYVdIzJrVxgRhq0lcPbeJeQIj/ywk7bOQtC9gZFrFaJFUlJmeUZKbmJmja2h
  goGtoaKRraGmma2RqqpdYpZukl1qqW55aXKJrqJdYXqxXXJmbnJOil5dasokRGIwpBUf+72Bc
  /uaD3iFGSQ4mJVFeo9mzE4X4kvJTKjMSizPii0pzUosPMcpwcChJ8D5eB5QTLEpNT61Iy8wBR
  gZMWoKDR0mE1wEkzVtckJhbnJkOkTrFqMux6sD0VcxCLHn5ealS4ry3QYoEQIoySvPgRsCi9B
  KjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYV779UBTeDLzSuA2vQI6ggnoiNPHp4McUZKIkJJ
  qYCqpyT7R+PIv65/vuyv87Q13ZrWtEGap/Xsxu+7bpWOei7aVFCtOab727cyF27uCRbdqBvia
  dxgdvfmyymkLm8mtz6ul1s34K5J5w+WM1qbXeexx/9bO39Z+ZZr8g4WbuGfrxRy4l2k9l705x
  CNHLdJr152dDTWvf//YkWn88v6E9sDY0s3T90yd696UNu360rkHZJ04//gyarNvvMb3Sn2n8r
  GHQkz8t11cvbtM/XbO57mUHldv0mb7MXuhgPa8P7VfLm3h/fDTJ+qyf+SpGcK6EraHEoJDVyf
  1H1e9eXZb+tTt9RcfNPDmOVWKdLb7PeCYfMi3cvGXvz8Fiz6xtZ7c9ujqO6WbtxP0JpqHh05U
  YinOSDTUYi4qTgQAq2NW7k0DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-285.messagelabs.com!1637593134!1091712!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3670 invoked from network); 22 Nov 2021 14:58:54 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-10.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Nov 2021 14:58:54 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id BDA2C100468
	for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 14:58:53 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 88B9110046C
	for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 14:58:53 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 22 Nov 2021 14:58:44 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libcap: upgrade 2.60 -> 2.61
Date: Mon, 22 Nov 2021 22:58:30 +0800
Message-ID: <1637593113-99188-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 22 Nov 2021 14:58:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158572

better number parsing in capsh and setcap;
fixed segfaulting in .so executables;
added example of capable shared library object.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/libcap/{libcap_2.60.bb => libcap_2.61.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libcap/{libcap_2.60.bb => libcap_2.61.bb} (96%)

diff --git a/meta/recipes-support/libcap/libcap_2.60.bb b/meta/recipes-support/libcap/libcap_2.61.bb
similarity index 96%
rename from meta/recipes-support/libcap/libcap_2.60.bb
rename to meta/recipes-support/libcap/libcap_2.61.bb
index 030198c41b..a3a6e10b89 100644
--- a/meta/recipes-support/libcap/libcap_2.60.bb
+++ b/meta/recipes-support/libcap/libcap_2.61.bb
@@ -16,7 +16,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
 SRC_URI:append:class-nativesdk = " \
            file://0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch \
            "
-SRC_URI[sha256sum] = "06a92076ce39a78bd28089e32085f1bde7f3bfa448fad37d895c2358f760b2eb"
+SRC_URI[sha256sum] = "c1e29680f8bcc51b172e9a8eb9a7a4d7255a00a14301a7c2cf96d1febf7449a5"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 
-- 
2.25.1


