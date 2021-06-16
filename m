Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web08.921.1623887671143323623
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jun 2021 16:54:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=pJ9vVHwl;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1623887669; i=@fujitsu.com;
	bh=hWE5ncO32OYyM1QNIgqZ8QD92b2iX1CyKt0RGmSc5EU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=pJ9vVHwlil8+MWjfThBj5DsRcYVDpSWdRME7No+hSv3C0O52qFVENLugRE7BCjOPS
	 tyUpsYnYG4eT7xyTR1qLJItrP22/UcBM+2umEPsTVBoPqwyALn50i9QVtezYm4Jt2h
	 PcTunUhAWal+F3elkPjnj+1MBqpu7AgMieIls9MkHIsOEu6NxdXOTPsTd4xYwPB04E
	 3pny4XBRRTPk+4so9ZKvpSyj2xUedX0o6pIo1KB+/5zP+UAiQ1Cj/D7n98C5wKz9oF
	 MR2zQNQUTqhCVM4AR7xeE9RVd7AKdhgoYeOKq/FjVlkcy+LiAmiLdPAQbl93uEJdZQ
	 gqbs6olABieKw==
Received: from [100.113.3.92] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.symcld.net id 45/B8-11194-43F8AC06; Wed, 16 Jun 2021 23:54:28 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8MxRdek/1S
  Cwbn7HBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0b3yeXMBYc4K5709TA2MD7j6GLk4hASmMUk
  MX/rXVYI5wSjxM+7h5i6GDk52ATUJKbfugGU4OAQEdCTuPpPFCTMLKAi8eJ3DzuILSzgLtG6d
  RoziM0ioCox8/53RhCbV8BJYu6Lk2BxCQEFiSkP34PZnALOEvt2/GYDsYWAaib/fM8OUS8ocX
  LmExaI+RISB1+8gOpVlJh9uZkFwq6QeH34EvMERv5ZSFpmIWlZwMi0itEiqSgzPaMkNzEzR9f
  QwEDX0NBY11DX1FAvsUo3US+1VDc5Na+kKBEoqZdYXqxXXJmbnJOil5dasokRGI4phYzGOxgP
  vv6gd4hRkoNJSZS3ufNUghBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3rReoJxgUWp6akVaZg4wN
  mDSEhw8SiK8HX1Aad7igsTc4sx0iNQpRkUpcd6vPUAJAZBERmkeXBssHi8xykoJ8zIyMDAI8R
  SkFuVmlqDKv2IU52BUEua9DrKdJzOvBG76K6DFTECL24TAFpckIqSkGpgmtPBcYz7rcdw+Tqn
  y1PdT8ypftTkteJb6VnM784dZU+Oc2O1OZXbGC71/8Sr9+gXt/d0dwgYmFQvZuecuy/D5XaOi
  vkHnkkkEU83ktVxzH7C2GB0U9bD21l+r+uPGuVfhEysP2KnPvhvUzP4m+iZb64da1b3qv5q4r
  32WzbBpEnmYUBC3zv6x8+qVJkYrVa8eTux0vZL44Jy6Tv0Tg6NLg2Ye55l3brV28I0JEXN2vN
  547NXKfd3OW19995nCr6On+fer6dYLJ2exSj8rvsyTFrH9QNf1/pD5/BorZYIr1j2v+h0hOuf
  bLtuS0Al7+GeYvGa34zYUk3ovsm1/S6QWs+7v6TuTVzL9fZp3LGu2EktxRqKhFnNRcSIAjFVU
  +EIDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-232.messagelabs.com!1623887667!218674!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19812 invoked from network); 16 Jun 2021 23:54:28 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-3.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Jun 2021 23:54:28 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15GNsKsO032701
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Jun 2021 00:54:27 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 17 Jun 2021 00:54:23 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] alsa-topology-conf: upgrade 1.2.5 -> 1.2.5.1
Date: Thu, 17 Jun 2021 07:53:58 +0800
Message-ID: <1623887640-63499-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1623887640-63499-1-git-send-email-wangmy@fujitsu.com>
References: <1623887640-63499-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...sa-topology-conf_1.2.5.bb => alsa-topology-conf_1.2.5.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-topology-conf_1.2.5.bb => alsa-topology-conf_1.2.5.1.bb} (84%)

diff --git a/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.5.bb b/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.5.1.bb
similarity index 84%
rename from meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.5.bb
rename to meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.5.1.bb
index a6b2d7a608..c96826c4bd 100644
--- a/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.5.bb
+++ b/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.5.1.bb
@@ -8,9 +8,8 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=20d74d74db9741697903372ad001d3b4"
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "8bfa8306ca63e1d0cbe80be984660273b91bd5b7dd0800a6c5aa71dd8c8d775c"
+SRC_URI[sha256sum] = "f7c5bae1545abcd73824bc97f4e72c340e11abea188ba0f1c06f5e0ad776b179"
 # Something went wrong at upstream tarballing
-S = "${WORKDIR}/${BPN}-1.2.4.2.g15998"
 
 inherit allarch
 
-- 
2.25.1

