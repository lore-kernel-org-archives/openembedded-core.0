Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8AB1C63708
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 06:10:32 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.6966.1670479824278091347
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Dec 2022 22:10:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=niSVse73;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670479822; i=@fujitsu.com;
	bh=rmMf1OASHNPE1MxG14etS9lBjvCDzra13h4uP3JZ1kE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=niSVse73XVOrYl22dpG19RDhpXLUPEL8f8dwEcoMmxlrbWxyCnPRHAhrTkBtm5Ye2
	 syGanzHkUi0eCZ52KhcYEq9F1YetWk9OuMe9MOp6gdNH8pREdgNrJLWQRKjM7dY5ho
	 Gm3+kDu9q/ESV4Mrjtvk3DxAmMzcu1PeFn6CYNPgNhmkbp3VwyyEve2By4C1SyCHAR
	 dGNsU5EajfT3kL17sy6s3G2nxLdiSjDGOpP0d1Y4q5D6SyGxhHcQadN/zoN6Vdio15
	 hJduN9hjsl6dULMNjjNjC+arkKx0CotLQ+k0msgleyqbFDfjOPtFqRZ0tXXzObZMX1
	 j/lfhNTHn1kSQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBIsWRWlGSWpSXmKPExsViZ8OxWfds/cR
  kg6uTtC3u/HzH7sDocW7jCsYAxijWzLyk/IoE1ox3rz6xFDzhrHhy9zhbA2M3ZxcjF4eQwANG
  ibWTO1m7GDmBnEtMEofnREDYuxklGt4ngdhsAlISN+7/Z+ti5OAQEdCTuPpPFCTMLKAi8eJ3D
  zuILSzgL9H8/zcjiM0CFJ97vRFsJK+Ao8SRzkdgcQkBBYkpD98zQ8QFJU7OfMICMUdC4uCLF8
  wQNYoSsy83s0DYFRKzZrUxQdhqElfPbWKewMg/C0n7LCTtCxiZVjGaFacWlaUW6Rqa6iUVZaZ
  nlOQmZuboJVbpJuqlluqWpxaX6BrpJZYX66UWF+sVV+Ym56To5aWWbGIEBmJKscKlHYxvlv3R
  O8QoycGkJMr7oro/WYgvKT+lMiOxOCO+qDQntfgQowwHh5IE74XKiclCgkWp6akVaZk5wKiAS
  Utw8CiJ8PrWAqV5iwsSc4sz0yFSpxh1OWZ+bTvALMSSl5+XKiXOu64OqEgApCijNA9uBCxCLz
  HKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5q0DmcKTmVcCt+kV0BFMQEfc+98LckRJIkJKqoF
  pntS/5rVxKukLNqqFvi+YxH4ioF69LuaGtN1zHs2batXbbIsfqRRf3ZKpdcRIZIoH51e/DaGR
  c40EXy0+u+7Yz9O7JFlmddxbcPjk2vMrg//VhDN9zZjZ4O8u/X0d9/OFsVte8S/7XM0XcvInj
  1mzo2VshbnZw+iFl83OaJ+cV8vAfoB/wtRdjR5+c3JmK80xOJPtIB5jK50h2hWX/LVexp7LQc
  bqe/Bhi0/ZCve67ao7p62yl1p3ROuts+pd7jkMWpN37d/jwLb0XUDtoqr67wcvTyqdL/hKeaH
  mxluJ8juWyPe/1fg6lfF8p5xRZMwj0Zwql6c6r789+TtvV6IV5/LQ+gV+PQtCIi6Zrj6rxFKc
  kWioxVxUnAgAb1OsB0sDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-571.messagelabs.com!1670479821!32260!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26514 invoked from network); 8 Dec 2022 06:10:21 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-8.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Dec 2022 06:10:21 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 70FDB154
	for <openembedded-core@lists.openembedded.org>; Thu,  8 Dec 2022 06:10:21 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 648A17B
	for <openembedded-core@lists.openembedded.org>; Thu,  8 Dec 2022 06:10:21 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 8 Dec 2022 06:10:19 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-protobuf: upgrade 4.21.9 -> 4.21.10
Date: Thu, 8 Dec 2022 14:09:50 +0800
Message-ID: <1670479794-1225-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 06:10:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174377

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-protobuf_4.21.9.bb => python3-protobuf_4.21.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_4.21.9.bb => python3-protobuf_4.21.10.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_4.21.9.bb b/meta-python/recipes-devtools/python/python3-protobuf_4.21.10.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-protobuf_4.21.9.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_4.21.10.bb
index 7970d0b90..0ddd49cfe 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_4.21.9.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_4.21.10.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "61f21493d96d2a77f9ca84fefa105872550ab5ef71d21c458eb80edcf4885a99"
+SRC_URI[sha256sum] = "4d97c16c0d11155b3714a29245461f0eb60cace294455077f3a3b8a629afa383"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
-- 
2.25.1


