Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58B8BC41535
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 03:01:40 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.10382.1671591697321442313
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Dec 2022 19:01:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=l60gQIeF;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1671591695; i=@fujitsu.com;
	bh=iMWncdDMqDYAMayJt1+KyvsE2oDD1aJv3jZw2D+x1yo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=l60gQIeF3lZlvPeqYzT+1Hi+n6zcuNoPLOHBIjl3lD2XaWJK+ZFuSg31jg3pn3XiV
	 mdnF7T4vfyoc+TP0hr7XeobVDksHSRulw5CwC2wUibVevQesEPQ3Bo+Zddn9/PN6Q/
	 Gm259C2JdjkUwsTNqGRK6CyMg8MMjxiy899EGFmZKHfisRCM+v26Z8Wb+al0xXGh1r
	 5mDER9iKB8W4O+/ESNbLuLvcL0B6wii2Esd+O9/C6fSrZn+gstu13kCZ5rPyV04Zl1
	 FZR2AvD+3SSyMD7v3uHX59PiWwEGfLn8+tSxgpOT01CDidG1fKjSRTcZrcNYDrQpOE
	 r8tjvILpQukSA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRWlGSWpSXmKPExsViZ8OxWZevfFG
  ywb5jfBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8arqdOZCn5wVBxu3MPcwNjE0cXIxSEk8IBR
  YtnCPaxdjJxAziUmiXv93hCJPYwS75evZgFJsAlISdy4/5+ti5GDQ0RAT+LqP1GQMLOAisSL3
  z3sILawgLXE8RtLWUBKWARUJQ59NAIJ8wo4SWx93A82XkJAQWLKw/fMEHFBiZMzn7BAjJGQOP
  jiBTNEjaLE7MvNLBB2hcSsWW1MELaaxNVzm5gnMPLPQtI+C0n7AkamVYzmxalFZalFuoZmekl
  FmekZJbmJmTl6iVW6iXqppbp5+UUlGbqGeonlxXqpxcV6xZW5yTkpenmpJZsYgaGYUpzKvIPx
  8rI/eocYJTmYlER5fRgWJQvxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4DUtBcoJFqWmp1akZeYA4
  wImLcHBoyTCa1cClOYtLkjMLc5Mh0idYtTlmPm17QCzEEtefl6qlDjvbpAZAiBFGaV5cCNgMX
  qJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjBvDMgqnsy8ErhNr4COYAI6YtrNhSBHlCQipKQ
  amJ7lGjDFbzqzee3Dn62Xtz32jzXc5zBVpWbG20a+ef2eUmUHYh9Mdj3q/V79TazmjtSop7cz
  XU/W73W4zDFjj+eth6fVft/4vz3PeaWKWOAH4fTbUw9/XDfpLvu9DbF2D3mr52/78X/dxt0WZ
  1msiz5eDzEPdxdcbrjq7d234cY60QYX+55zn55x7uSjbWfmGf+e+SYz32f1TOfmicWbHfO3i/
  b65p8R3b2wKjz1//GTB6NWbQ1NyrXleX7afO0SbbbN/N4pbHWr1nU8nhj06VMva/Kpo2Geytt
  jA6Yd+3bK3443/v2WLq9LE+9/u/TPsyr+U1ad6rUAp19HMqpmNn4WOp6Qeen5049i89sVl1xS
  VWIpzkg01GIuKk4EAAQbYIlMAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-745.messagelabs.com!1671591693!35597!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15682 invoked from network); 21 Dec 2022 03:01:34 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-19.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 21 Dec 2022 03:01:34 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id ABAA9150
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 03:01:33 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 9E80973
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 03:01:33 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 21 Dec 2022 03:01:32 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] iproute2: upgrade 6.0.0 -> 6.1.0
Date: Wed, 21 Dec 2022 11:00:58 +0800
Message-ID: <1671591662-12509-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 03:01:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174894

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../iproute2/{iproute2_6.0.0.bb => iproute2_6.1.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_6.0.0.bb => iproute2_6.1.0.bb} (97%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb b/meta/recipes-connectivity/iproute2/iproute2_6.1.0.bb
similarity index 97%
rename from meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_6.1.0.bb
index c287b9c0f5..4c6dd1f7f4 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_6.1.0.bb
@@ -15,7 +15,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-libc-compat.h-add-musl-workaround.patch \
            "
 
-SRC_URI[sha256sum] = "523139e9e72aec996374fa2de74be4c53d2dd05589488934d21ff97bae19580a"
+SRC_URI[sha256sum] = "5ce12a0fec6b212725ef218735941b2dab76244db7e72646a76021b0537b43ab"
 
 inherit update-alternatives bash-completion pkgconfig
 
-- 
2.25.1


