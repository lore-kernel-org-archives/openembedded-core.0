Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 114ECC433F5
	for <webhook@archiver.kernel.org>; Wed, 13 Oct 2021 12:13:32 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web09.7158.1634127211164041285
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Oct 2021 05:13:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ikbblA90;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1634127199; i=@fujitsu.com;
	bh=fyHS5aA0PiSBanOkzoJ1ifdiMAAmr4lA+StzEu/5Nlk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ikbblA90MP/Yu4rWV15/wm1Selhu0YObXAERY2C2oFRbnVpw6WnRZA6XhsUYtx1R5
	 rc5C/U5HbGuSmP/66Om7JdgoI9yN37RHXPgRJ51NsbRsHbyzv57ZFTwSfzBdq/VOdY
	 TFLl6uIDNJKycuFsquwKItJO1zpcg20ffwx2zGTX6oJrozJJoqGKM+9MS/BlZtGzw8
	 wQRYAEUrezzWHvu5Oen4ivks4eJQbulljZRjp+MukIYy6V9JcfGSG/IlpslNoJkKkQ
	 mvumwSV7E5N/De4WzCCWFMK5IdOqulruwMaxPOJKjIZWSkWwQdNigmq+YcewWcGsxv
	 9NE7uyXgv/5wQ==
Received: from [100.113.6.246] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-central-1.aws.symcld.net id 5C/F8-14220-F5DC6616;
 Wed, 13 Oct 2021 12:13:19 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8ORqBt3Ni3
  R4OIvGYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPNup0sBf95Kk4c3MvawHiKu4uRi0NI4DGj
  xNH3J1kgnPNMEiePXWCCcE4wSiw/uwTI4eRgE1CTmH7rBmsXIweHiICexNV/oiBhZgEViRe/e
  9hBbGEBG4mNCxazgZSwCKhK3FrHBhLmFXCWWPTgFFiJhICCxJSH75kh4oISJ2c+YYEYIyFx8M
  ULZogaRYnZl5tZIOwKiVmz2pggbDWJq+c2MU9g5J+FpH0WkvYFjEyrGC2TijLTM0pyEzNzdA0
  NDHQNDY11TXQNjQ30Eqt0k/RSS3WTU/NKihKBsnqJ5cV6xZW5yTkpenmpJZsYgQGZUsjStIPx
  96sPeocYJTmYlER5WXanJQrxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4A06A5QTLEpNT61Iy8wBR
  gdMWoKDR0mEd9MJoDRvcUFibnFmOkTqFKOilDjvOpA+AZBERmkeXBssIi8xykoJ8zIyMDAI8R
  SkFuVmlqDKv2IU52BUEuZdeQpoCk9mXgnc9FdAi5mAFgdGpYAsLklESEk1MHnafbDRXvVt7rK
  dskdWaFxuOFuVqJPZXW/os1Pqt80hro26n9583ry6P9fSeCrT9ZxJDA9+LLmxtbClo6Sr5t2U
  FOt1/CUCJzbN7OGuZvF7YLTgYbaW4l+RZJmGR3F2Ecv2cYqExnD0Hjk6O+KPWOVW8031ilVmu
  1m3OESv+HiTY7H+5hOq3at1Zaal8z2/ua3t/vbWaWL3Zxj9PSYyaQG3SrHyN46kHwfSXvpt+7
  ovT+eky96edZHhP6U8S+f3+B1k2zbly6az1f/eh5eWPn5W573j132J/bJ3PBmO7dPV+6Tp0v3
  j7YK5M6/LHUl+LfZoRb67/h3mrlD1B8sT4wPWG87v1t04ST1lXtyFtRFKLMUZiYZazEXFiQCj
  rR4VQwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-248.messagelabs.com!1634127198!31369!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20428 invoked from network); 13 Oct 2021 12:13:18 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-15.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Oct 2021 12:13:18 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id EAB9D14B242
	for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Oct 2021 13:13:17 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id DF4B9100EDF
	for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Oct 2021 13:13:17 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Wed, 13 Oct 2021 13:12:58 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libical: upgrade 3.0.10 -> 3.0.11
Date: Wed, 13 Oct 2021 20:12:49 +0800
Message-ID: <1634127169-114653-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Wed, 13 Oct 2021 12:13:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156903

Version 3.0.11 is a patch release.
This release is binary and source compatible with version 3.0.0.
Note that the libical-glib library is considered unstable; therefore not binary compatible with previous releases

ReleaseNotes:
Fix icalrecur_iterator_set_start() for hourly, minutely, and secondly recurrences
Fix build for Berkeley DB version greater than 5
Fix vcal for some architectures (like aarch64, ppc64le and s390x)
Fix memory leaks in vcal
Prevent crash when looking for tzid in initialize_rscale
Adjust libdir and includedir in generated pkgconfig files
Built-in timezones updated to tzdata2021c

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libical/{libical_3.0.10.bb => libical_3.0.11.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libical/{libical_3.0.10.bb => libical_3.0.11.bb} (95%)

diff --git a/meta/recipes-support/libical/libical_3.0.10.bb b/meta/recipes-support/libical/libical_3.0.11.bb
similarity index 95%
rename from meta/recipes-support/libical/libical_3.0.10.bb
rename to meta/recipes-support/libical/libical_3.0.11.bb
index 209a50217c..b16081e9e2 100644
--- a/meta/recipes-support/libical/libical_3.0.10.bb
+++ b/meta/recipes-support/libical/libical_3.0.11.bb
@@ -14,7 +14,7 @@ SECTION = "libs"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
 "
-SRC_URI[sha256sum] = "f933b3e6cf9d56a35bb5625e8e4a9c3a50239a85aea05ed842932c1a1dc336b4"
+SRC_URI[sha256sum] = "1e6c5e10c5a48f7a40c68958055f0e2759d9ab3563aca17273fe35a5df7dbbf1"
 UPSTREAM_CHECK_URI = "https://github.com/libical/libical/releases"
 
 inherit cmake pkgconfig
-- 
2.25.1


