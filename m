Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D84F9C6379F
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 02:38:24 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.5651.1676255893429876327
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Feb 2023 18:38:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=V5agpkxL;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676255896; i=@fujitsu.com;
	bh=K79ddXWAKifOWI1O5EtMr8R84ZgmHRE6Dm3aUAWS8Bg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=V5agpkxLCGrlgtdrcqHP5nvzxOlBKYLORDvb28V2kiJ0k0bNQziM+GPXetYIt4cob
	 Sne06gn5EIo0LgH1+opQe8ECGRcENWnvM4yidAhr/VHw+oGsqz5KGGlkq4zV22kIN4
	 eg7RsLt9HzLpBfWRss1ukd+UqnyjD8MZpUbWXxUfJjADqbfZN/P3EG9+b+xIsKzq80
	 lshBrHb5lvuTKAtg3ujyU0xzI3uVmHCB9INXpBXqIQvspztru7dBPt2G8ifelZIDkG
	 ID3Xm/sFM5BcoAaYhwO/9qYVEMIYiVBTxou084/r2ac04h/PkwZ7Wf04zgXli6ScNt
	 Ccs1uRfH7d4ZA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPIsWRWlGSWpSXmKPExsViZ8OxWXf6opf
  JBt3NvBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aFa0UFy3gqXvxuZW5g7OLuYuTkEBK4zyhx
  561xFyMXkH2ZSeLvgfusEM5eRokXR2cyg1SxCUhJ3Lj/n62LkYNDREBP4uo/UZAws4CKxIvfP
  ewgtrCAjcSpzkWsIDaLgKrE6jOPGEFsXgEniUWNLWA1EgIKElMevgcbySngLPF5y0dWiCOcJN
  5PmsMEUS8ocXLmExaI+RISB1+8YIboVZSYfbmZBcKulGj98AvKVpO4em4T8wRGwVlI2mchaV/
  AyLSK0bQ4tagstUjXVC+pKDM9oyQ3MTNHL7FKN1EvtVS3PLW4RNdQL7G8WC+1uFivuDI3OSdF
  Ly+1ZBMjMGxTilnMdjC29/3VO8QoycGkJMrbx/EyWYgvKT+lMiOxOCO+qDQntfgQowwHh5IEr
  9QCoJxgUWp6akVaZg4whmDSEhw8SiK8FhOA0rzFBYm5xZnpEKlTjLocnfu7DjALseTl56VKif
  PyLwQqEgApyijNgxsBi+dLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5d88CmsKTmVcCt+k
  V0BFMQEc85gM7oiQRISXVwKTZYpWrXFBxNtA+/dhCF1O1B9uuX9Ho/Dmt1uA5k4ZJa8JNIY3a
  4oXqB/dvSZqq829KJ3/40VsyexQU005fOP3Vo/3fXMkn38zKFvHc4/11tXP/D5+vIlm36oNtM
  91POBdkTHmwcaf568Kwu8tMMmXcd0aqq8ms3iDboH17/+3mFkP2z3eCk3d7N80SbToSxm+y1I
  3F7FnvfOkvhbzp7bU5Xh5CSa0KO6MbcuNbspQKqgKWXtS4cuAAzxmtsIIauWcMSW//i7vPaX3
  9qStZVrxuYrkQZ1/K2XOJv86bat4ovef6KezKrPU505y6IlLsjuwPqsyeqVvpoSNokhj0/qdn
  yqaDNzO0eowuKWxWYinOSDTUYi4qTgQAEQSn/WIDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-591.messagelabs.com!1676255895!518836!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12543 invoked from network); 13 Feb 2023 02:38:15 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-17.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 Feb 2023 02:38:15 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id D1CDA7B
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 02:38:14 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id C5DE473
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 02:38:14 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 13 Feb 2023 02:38:13 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libsdl2: upgrade 2.26.2 -> 2.26.3
Date: Mon, 13 Feb 2023 10:37:53 +0800
Message-ID: <1676255874-19490-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1676255874-19490-1-git-send-email-wangmy@fujitsu.com>
References: <1676255874-19490-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 02:38:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177075

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2023.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsdl2/{libsdl2_2.26.2.bb => libsdl2_2.26.3.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.26.2.bb => libsdl2_2.26.3.bb} (96%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.26.2.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.26.3.bb
similarity index 96%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.26.2.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.26.3.bb
index 17fc410f6c..871bb19712 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.26.2.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.26.3.bb
@@ -9,7 +9,7 @@ SECTION = "libs"
 
 LICENSE = "Zlib & BSD-2-Clause"
 LIC_FILES_CHKSUM = "\
-    file://LICENSE.txt;md5=68a088513da90254b2fbe664f42af315 \
+    file://LICENSE.txt;md5=31f575634fd56b27fc6b6cbe8dc9bd38 \
     file://src/hidapi/LICENSE.txt;md5=7c3949a631240cb6c31c50f3eb696077 \
     file://src/hidapi/LICENSE-bsd.txt;md5=b5fa085ce0926bb50d0621620a82361f \
     file://src/video/yuv2rgb/LICENSE;md5=79f8f3418d91531e05f0fc94ca67e071 \
@@ -25,7 +25,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz"
 
 S = "${WORKDIR}/SDL2-${PV}"
 
-SRC_URI[sha256sum] = "95d39bc3de037fbdfa722623737340648de4f180a601b0afad27645d150b99e0"
+SRC_URI[sha256sum] = "c661205a553b7d252425f4b751ff13209e5e020b876bbfa1598494af61790057"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 
-- 
2.34.1


