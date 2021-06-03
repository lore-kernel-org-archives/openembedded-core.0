Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.115])
 by mx.groups.io with SMTP id smtpd.web08.4773.1622705044784289917
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jun 2021 00:24:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=mPaHZXIY;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.115, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1622705041; i=@fujitsu.com;
	bh=snD5M6cHBrHD6k1Zj8qUvq7f7cyER0HgeW3nOSu932Q=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=mPaHZXIYQGxfzpFvIp3/XGWINNN6Ypxki5KpdaIwIzss5vnqzx3bjct08vMdgF1mC
	 rT/flFLJFwgE4aPJFIvGI1d1MtP1T26ceaZzGDcD8oNciV041oaqZ9/GwaD/ONYa95
	 i5tAZiYiSF04e2QXesZxU9a1MMoM5Adbk6Yj87zit1bZbvhJBN0ddS8BXftfv5B5y2
	 UATH4D/oWq78vWwt3RPszA3fDlqhC14jF/4LGDMI25dSrbrVyvBD9sZjvcwXs7VCo0
	 HOwpIV6Oa7TsPuFpKd9/3LdHwCtl+UEubdtudFtoFivFHUEdZBjLd2NtBqGA7XQjJx
	 ZBZqSBFhrmjAA==
Received: from [100.113.4.24] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-central-1.aws.symcld.net id 05/87-27273-19388B06; Thu, 03 Jun 2021 07:24:01 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRWlGSWpSXmKPExsViZ8MxRXdi844
  Eg2ldAhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8b+RYfYCo6wVzRdWMvUwPiBrYuRi0NIYCaT
  xLoZTxghnOOMEt2z/rB3MXJysAmoSUy/dYO1i5GDQ0RAT+LqP1GQMLOAisSL3z1gJcICxhLTP
  s1jBrFZgOLPDnxiBLF5BZwkGr+tZgGxJQQUJKY8fM8MEReUODnzCQvEHAmJgy9eMEPUKErMvt
  wMVV8h8frwJeYJjLyzkLTMQtKygJFpFaNlUlFmekZJbmJmjq6hgYGuoaGxrqmuoamxXmKVbpJ
  eaqlucmpeSVEiUFYvsbxYr7gyNzknRS8vtWQTIzDAUgpZZ+5g/PT6g94hRkkOJiVRXuO0HQlC
  fEn5KZUZicUZ8UWlOanFhxhlODiUJHgVmoBygkWp6akVaZk5wGCHSUtw8CiJ8NqBpHmLCxJzi
  zPTIVKnGBWlxHk3giQEQBIZpXlwbbAIu8QoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmNcNZA
  pPZl4J3PRXQIuZgBYLeG0DWVySiJCSamCq0dbcVuFvvcRPRGRd9xv5KY6XVXWEla/zPti0zUm
  mIlZXZea/AwzF2UeX/K7scN7YU9WqsdX803n7X4yN3SdibiRo2OS4Vm2+7arqLnplx4sL/Gwr
  mWfJb7/f2PaI89xOX5n/M26cfXvHlflQygKFlXmHQqKzJ99jrYt7Wn/Vc23616MLpHy8nfeL3
  DmVWP/c5wzfrqwb09XTf2R93z/zoMohdwHuE5NS+gUkNKIqVhZZHn3Y/OG/68/WGhOnyd6Xd/
  3++tqvdePaCQYLa3Kv6R9wnRezz+yTxYV7K/YeFLGs+Or5L/1r2Sqf2V7tH3tlzdhDTYTLClS
  8VutuS1y08Z+pp9O+/SdyH/q+4GBWYinOSDTUYi4qTgQAvx3lCisDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-248.messagelabs.com!1622705040!120010!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15919 invoked from network); 3 Jun 2021 07:24:01 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-18.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Jun 2021 07:24:01 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1537O05d029488
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 3 Jun 2021 08:24:00 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 3 Jun 2021 08:23:58 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] less: upgrade 586 -> 589
Date: Thu, 3 Jun 2021 15:23:45 +0800
Message-ID: <1622705025-26203-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/less/{less_586.bb => less_589.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/less/{less_586.bb => less_589.bb} (93%)

diff --git a/meta/recipes-extended/less/less_586.bb b/meta/recipes-extended/less/less_589.bb
similarity index 93%
rename from meta/recipes-extended/less/less_586.bb
rename to meta/recipes-extended/less/less_589.bb
index b300f2badd..cf459a382d 100644
--- a/meta/recipes-extended/less/less_586.bb
+++ b/meta/recipes-extended/less/less_589.bb
@@ -28,7 +28,7 @@ DEPENDS = "ncurses"
 SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
 	  "
 
-SRC_URI[sha256sum] = "09288d3ec515a21430ec1fbe1e97a2f741fdaf98afc95b114e342416c6a7dd99"
+SRC_URI[sha256sum] = "a15cd502196c1fb2c1f0235db19d4baad564d07be00df42281d6f1f056f5dda8"
 
 UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
 
-- 
2.25.1

