Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED437C4321E
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 02:31:31 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.5306.1670207487648603455
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Dec 2022 18:31:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=AgwQ0EhV;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670207485; i=@fujitsu.com;
	bh=VCLaGfhV6ZGjIeF7Bocw1/+dXfrSMTAo0tLTlSNaSsg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=AgwQ0EhVfaMlxrHFCBUgRa1NoryFdjdAaWUTSesAuFmiX7nj+oyPLChFHXSE1o2W5
	 jLqOpu0r8cMsRn7xv/phaa1QMxfJFLHXjbUKMo/R4wAPT5M8vfZLHxAEND3wuC9cay
	 dyetIUsfZ6CZBGVyMTvSqzXGs1sCLZE0GfdDr+KPtjiGcpxV8vWt2LFxVsR6+zV4ni
	 DJpnoq5CLYYy/21+QhhHW6S7DhBdbcvQx+udWBRB2B6Or+C6fMMvqjDM8JGYhygL9N
	 sKgSWX+RzVF3kV2FfHkNne5jdXPFxFiPXkKGKyA6xeeGttUqE9qgwh/DiKvR/ST1nh
	 Ul4MjvRTRMQ+w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHIsWRWlGSWpSXmKPExsViZ8MxSfdPeG+
  ywfcJKhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aMWVNYC+ZwVNz8eI6lgXENexcjF4eQwGNG
  idUnXkM515gkTm5azAzh7GaU2Pp3B0sXIycHm4CUxI37/9m6GDk4RAT0JK7+EwUJMwuoSLz43
  cMOYgsLmEtcW9/OBmKzAMWbdn1iBbF5BRwl3q59BjZGQkBBYsrD98wgNqeAk8S3VU+YQGwhoJ
  qWI0sYIeoFJU7OfMICMV9C4uCLF8wQvYoSsy83Q82pkJg1q40JwlaTuHpuE/MERsFZSNpnIWl
  fwMi0itGsOLWoLLVI11QvqSgzPaMkNzEzRy+xSjdRL7VUNy+/qCRD11AvsbxYL7W4WK+4Mjc5
  J0UvL7VkEyMweFOKE5x2ME5Z9kfvEKMkB5OSKK/So+5kIb6k/JTKjMTijPii0pzU4kOMMhwcS
  hK80WG9yUKCRanpqRVpmTnASIJJS3DwKInwCnkDpXmLCxJzizPTIVKnGC05ps7+t5+ZYzmYnP
  m17QCzEEtefl6qlDivHDBehQRAGjJK8+DGwaL9EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiV
  hXjdfoCk8mXklcFtfAR3EBHTQRv4ukINKEhFSUg1Mlf5vdpnYLjrUUyAoUJ3Zr7Y7auvMWvVd
  /i5r0z4Kpq+f/MnLhH3HFu2/jhoNQR8aIw03f4262eMypY/Pqyws71bATekirQ7G1akrd/kZF
  M9oXl394rrWt6Y5U480vDdze/nAamVgqaeapFkO46/XikntDJ0Hua5qWuuZv/V+Vx+/+ZaM7Y
  u+W54z3Sd8eK5tm8gySTn6qr6E+A1Bs19S65kPp3xZuGDF3Sn/GTPeLj9Skb6ZR17n6spPTcr
  79Pa57/6UuuivdGfs32X/7fjKVi1xF+zVMP6r3Ff1pkbszWE9lTfNkUsL9qb1i8416riem9qm
  qDjzm8ymN5tjrRqPzbrZWLP1Vc6jWzeVt5xTYinOSDTUYi4qTgQAHlVAx3EDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-745.messagelabs.com!1670207484!6018!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25325 invoked from network); 5 Dec 2022 02:31:24 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-14.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Dec 2022 02:31:24 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 15AA11000D5
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Dec 2022 02:31:24 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 097591000D2
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Dec 2022 02:31:24 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 5 Dec 2022 02:31:22 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] swig: upgrade 4.1.0 -> 4.1.1
Date: Mon, 5 Dec 2022 10:30:42 +0800
Message-ID: <1670207442-7087-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670207442-7087-1-git-send-email-wangmy@fujitsu.com>
References: <1670207442-7087-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 02:31:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174270

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/swig/{swig_4.1.0.bb => swig_4.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/swig/{swig_4.1.0.bb => swig_4.1.1.bb} (72%)

diff --git a/meta/recipes-devtools/swig/swig_4.1.0.bb b/meta/recipes-devtools/swig/swig_4.1.1.bb
similarity index 72%
rename from meta/recipes-devtools/swig/swig_4.1.0.bb
rename to meta/recipes-devtools/swig/swig_4.1.1.bb
index 0eabd8ed60..b9e0175299 100644
--- a/meta/recipes-devtools/swig/swig_4.1.0.bb
+++ b/meta/recipes-devtools/swig/swig_4.1.1.bb
@@ -4,4 +4,4 @@ SRC_URI += "file://0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.pat
             file://0001-configure-use-pkg-config-for-pcre-detection.patch \
             file://determinism.patch \
            "
-SRC_URI[sha256sum] = "d6a9a8094e78f7cfb6f80a73cc271e1fe388c8638ed22668622c2c646df5bb3d"
+SRC_URI[sha256sum] = "2af08aced8fcd65cdb5cc62426768914bedc735b1c250325203716f78e39ac9b"
-- 
2.25.1


