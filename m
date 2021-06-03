Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [])
 by mx.groups.io with SMTP id smtpd.web12.4743.1622704430010196377
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jun 2021 00:13:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=qpBiY5P9;
 spf=neutral (domain: fujitsu.com, ip: <nil>, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1622704427; i=@fujitsu.com;
	bh=7CVNPhilxkNhqihz/tA3foh0JYwEpC0B53/JjDFtjqM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=qpBiY5P9X0dD2NdSxxhy+2I+GIllTBZeTtiGgxp66kQe7KR/5Q52leaVKCxsQPELm
	 mC5m/Q3mKC7f3rdT/rdTo7CRVu4W4URVXkPPEwm5rqnen1QXXb3mro6P5bBMsMmBqq
	 LwJcy5vd8vGUzZl5pHPtKhviZaKNLJuEXTzbfrNyt2t7Ei7/Fn72QgOTpnuIon+mEF
	 z9l6EhK8EGE1KtFA6LoLpT44NmVERNUjuJ+EnQQ9hLEwHw7hyNz7K39GQEajKyhd9x
	 hCXmnXoH7ez0zrJu2U4bKJUUsClc3lNqcQuzxBHkhzkk/6OLF0h+Ix31F0nsBvDTX9
	 blwe7EmKavJ+g==
Received: from [100.112.193.7] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.symcld.net id 61/FD-45475-B2188B06; Thu, 03 Jun 2021 07:13:47 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8MxRVe7cUe
  CQcdPZos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNaN52U7mglaOirN9U9kaGKezdzFycQgJzGSS
  eLXrKiOEc5xR4nHLBaAMJwebgJrE9Fs3WLsYOThEBPQkrv4TBQkzC6hIvPjdA1YiLGAtcezuf
  DYQmwUovnbjP1YQm1fASWLrul9MILaEgILElIfvmUFsTgFniWM/nrGA2EJANTt6Otgh6gUlTs
  58wgIxX0Li4IsXzBC9ihKzLzezQNgVEq8PX2KewMg/C0nLLCQtCxiZVjFaJBVlpmeU5CZm5ug
  aGhjoGhoa6RpaArGRmV5ilW6iXmqpbnlqcYmuoV5iebFecWVuck6KXl5qySZGYDimFByo28H4
  4PUHvUOMkhxMSqK8xmk7EoT4kvJTKjMSizPii0pzUosPMcpwcChJ8BbVA+UEi1LTUyvSMnOAs
  QGTluDgURLhlasFSvMWFyTmFmemQ6ROMSpKifO+BekTAElklObBtcHi8RKjrJQwLyMDA4MQT0
  FqUW5mCar8K0ZxDkYlYd4DIFN4MvNK4Ka/AlrMBLRYwGsbyOKSRISUVAPTrb07v+knRdxOk8h
  uvqQ0T4DnvcI55t+1ylVXlh2aGK1jpb48rLMp+iLX86yoPYafBWrbdTvt0pTOaHU77LhV+WeB
  RKxWYLQrt6P5hh1FTz6rCz9bXyBjPeUyc+av+Wxf7k+O31Rpz6Pw+6FGdV9/OPfJBnUFh3+qu
  wtmvI3e9rRDJnSimknkCT1lE7XXf1aXTo9dsMj2nbxc2nXff1YP+JRdltxL7Oj9WnoylelHNv
  /rWpeaK2npE96Uv/2X4G/2/eOuwu6D/x2D91iez1pfmBDy4t6DYOVL/2asFb1wQ7zwYM/Oz1t
  +GMx+vu2OhSar6+el1VYfJy9/tI3nta3d+aM/5jpv8A05zLFbxPibEktxRqKhFnNRcSIAwiy/
  LUIDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-271.messagelabs.com!1622704426!107441!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2394 invoked from network); 3 Jun 2021 07:13:47 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-3.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Jun 2021 07:13:47 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1537Dd8S023806
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 3 Jun 2021 08:13:46 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 3 Jun 2021 08:13:44 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] mtools: upgrade 4.0.27 -> 4.0.29
Date: Thu, 3 Jun 2021 15:13:20 +0800
Message-ID: <1622704403-26153-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1622704403-26153-1-git-send-email-wangmy@fujitsu.com>
References: <1622704403-26153-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../mtools/{mtools_4.0.27.bb => mtools_4.0.29.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/mtools/{mtools_4.0.27.bb => mtools_4.0.29.bb} (93%)

diff --git a/meta/recipes-devtools/mtools/mtools_4.0.27.bb b/meta/recipes-devtools/mtools/mtools_4.0.29.bb
similarity index 93%
rename from meta/recipes-devtools/mtools/mtools_4.0.27.bb
rename to meta/recipes-devtools/mtools/mtools_4.0.29.bb
index c6fa02ebdf..38de1dd923 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.27.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.29.bb
@@ -24,7 +24,7 @@ RRECOMMENDS_${PN}_libc-glibc = "\
 	glibc-gconv-ibm866 \
 	glibc-gconv-ibm869 \
 	"
-SRC_URI[sha256sum] = "9c88c8d9244e54768e40b92c005e61ec4e084ea7c070df9184caf1a6408838b3"
+SRC_URI[sha256sum] = "c6b50b4603e7afe54ba0109094669373028db9af743f5c541bca4b7664aefec7"
 
 SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \
-- 
2.25.1

