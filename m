Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web10.600.1624405935423697970
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 16:52:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=IjGf7e+V;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1624405933; i=@fujitsu.com;
	bh=hnJehqZSo5ogMknBDQgJ7wRp/wQbT4FdnYwHBEQojOM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=IjGf7e+V4lUwptSIFiK38EecgOfzY1BHLIAmKtd7YbHXaKce8dGO9A8fQTVMinyFx
	 1n9n7XFR7Ox8ryZnb3Kki/FYeLmBpdacn6JyU+Boe0n1XysQq/NGv0OYYscrgq3jB7
	 9HOOW7XBlKARqvy2Rk5igd9T2fMvo/bMQAk7DMUuf6b/wij4MIeSSwZda6oNFZqEcI
	 6LUCzbT8tXiYkU7D2SAQgFtSSVrNO5lhVGNTJ1rj4ImtWyCnmxWqGPBAWE8ClOpQkl
	 F7Ky4Xv5dWYdA9MCysDzgogSNIPMCLpt5RhSnMtUAtO5WdVhakORkGEZgSPWvCFlbB
	 cD133pq7LDSJQ==
Received: from [100.112.198.210] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-west-1.aws.symcld.net id CF/4E-08493-DA772D06; Tue, 22 Jun 2021 23:52:13 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8MRqrum/FK
  CwcxH+hZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8a+p89YC5o4K2ZtP8jWwLiAo4uRi0NIYBaT
  xOuFk9kgnBOMEvNufGbvYuTkYBNQk5h+6wZrFyMHh4iAnsTVf6IgYWYBFYkXv3vASoQFrCW+3
  NjNBmKzCKhK3H/7gwnE5hVwkmg7284IYksIKEhMefieGcTmFHCW+Pd5C1ivEFDN89XToeoFJU
  7OfMICMV9C4uCLF8wQvYoSsy83s0DYFRKvD19insDIPwtJyywkLQsYmVYxWiQVZaZnlOQmZub
  oGhoY6BoaGukaWlroGhma6iVW6SbppZbqlqcWl+ga6iWWF+sVV+Ym56To5aWWbGIEhmNKwbHr
  Oxivvv6gd4hRkoNJSZSXq+hSghBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3q2lQDnBotT01Iq0z
  BxgbMCkJTh4lER4u0BaeYsLEnOLM9MhUqcYFaXEef1A+gRAEhmleXBtsHi8xCgrJczLyMDAIM
  RTkFqUm1mCKv+KUZyDUUmYNxRkCk9mXgnc9FdAi5mAFiv8vgiyuCQRISXVwMRzLj1UMtl/o1F
  7e1/Me+MnbLu0j/DyJz18f+yY8JX0h4tfF9Q6GuX5nNzJUl79uOMt5zy+idk56uV+v5vKw25u
  ++CzR1xgyWY19oJgxb78Q4srE7ZX+r66ns8pGmHl/uxW6JItYevnHGgw5pHmuPrRqSio9d6hi
  wr1Ny0Tz7Azsvyq/Hz+1QddA5Mv00LWy4fWcJ3O33rP8053ztKQ6xGb+v79sd+ygeXwJaFpyX
  7TFFlF4j+vurRSbFnMmRzmaMnVD/Vsaj4GbOK+9bTacqP4m385R/ZeVrDLe9ZVYn9Y5aPv0QX
  nvz30WFknUOJ7dOmfmDUTbzg6Ok/wbBG1t679KfpU46n2hmPakzfbeyixFGckGmoxFxUnAgC+
  BMc2QgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-285.messagelabs.com!1624405932!100006!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29528 invoked from network); 22 Jun 2021 23:52:12 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-19.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 22 Jun 2021 23:52:12 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15MNq7BT013496
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jun 2021 00:52:12 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Wed, 23 Jun 2021 00:52:05 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libhandy: upgrade 1.2.2 -> 1.2.3
Date: Wed, 23 Jun 2021 07:51:39 +0800
Message-ID: <1624405899-80322-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1624405899-80322-1-git-send-email-wangmy@fujitsu.com>
References: <1624405899-80322-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libhandy/{libhandy_1.2.2.bb => libhandy_1.2.3.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/libhandy/{libhandy_1.2.2.bb => libhandy_1.2.3.bb} (92%)

diff --git a/meta/recipes-gnome/libhandy/libhandy_1.2.2.bb b/meta/recipes-gnome/libhandy/libhandy_1.2.3.bb
similarity index 92%
rename from meta/recipes-gnome/libhandy/libhandy_1.2.2.bb
rename to meta/recipes-gnome/libhandy/libhandy_1.2.3.bb
index 9652948a35..acb6e53b72 100644
--- a/meta/recipes-gnome/libhandy/libhandy_1.2.2.bb
+++ b/meta/recipes-gnome/libhandy/libhandy_1.2.3.bb
@@ -9,8 +9,8 @@ BUGTRACKER = "https://gitlab.gnome.org/GNOME/libhandy/-/issues"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=https"
-SRCREV = "09f36006b26f41a2bb383b0c853e954c5792cfe1"
+SRC_URI = "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=https;branch=libhandy-1-2"
+SRCREV = "e9ca4ac4b134bbd6ab91b6f916a915192fd3a465"
 S = "${WORKDIR}/git"
 
 GIR_MESON_ENABLE_FLAG = 'enabled'
-- 
2.25.1

