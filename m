Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68BC8C433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Dec 2021 14:19:17 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web09.26627.1640614756747452717
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Dec 2021 06:19:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=NcO6nryG;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1640614748; i=@fujitsu.com;
	bh=Im5oEh521FE2vOkvDWwoB176N7wCavowWnZNrqvidAY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=NcO6nryGV7v4ZQUnEn3c8FnkW4ZzQB7sXxE8HyPEKmIk63JrJYUowfWaWR4fj56tQ
	 BWucpAz0R+JAokvuhwCBhSnHU+tLsP8BvKrlQVhqKXt03BeNM5xAAMdWmml2WEPcZ8
	 LztSRL0G1ryLlml/2wt+MSws9uULYtZbxj195bzoRLWkAJds/Y13PecrftXcbh6Rtb
	 3pBHGTLvKqEE4qJ9ulo1BWyA6jfFv4Z6SDFI3zjyXhGv45mj4GEsDO9BrDz1hxNABN
	 lWSi7NCKJoJ15U8XLfhUbkpysDuThdwdH2qT/XWGYKKOTfjFRaX2lVJtn+2cg0fG8G
	 Er3pcFppqM3Rw==
Received: from [100.115.70.228] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 7F/BC-06990-C5BC9C16; Mon, 27 Dec 2021 14:19:08 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOIsWRWlGSWpSXmKPExsViZ8MxSdfr9Ml
  Eg/0beC3u/HzH7sDocW7jCsYAxijWzLyk/IoE1oxbi5azFczkqNi3bC5bA+MK9i5GTg4hgceM
  EqvfRnUxcgHZ55kkZk5cxAbh7GGUePpyDStIFZuArsS5x2uBOjg4RAT0JK7+EwUJCwvYSNz89
  wOshEVAVWLvlYdsIDavgLvEj3vfwRZICChITHn4nhkiLihxcuYTFhCbWUBC4uCLF8wgIyUEFC
  VmT5eHKK+QeH34EjOErSZx9dwm5gmMfLOQdM9C0r2AkWkVo21SUWZ6RkluYmaOrqGBga6hoam
  umYmusYleYpVuol5qqW5yal5JUSJQVi+xvFgvtbhYr7gyNzknRS8vtWQTIzD8UoodlHYwnu37
  qXeIUZKDSUmU9/uEk4lCfEn5KZUZicUZ8UWlOanFhxhlODiUJHiDTwHlBItS01Mr0jJzgLEAk
  5bg4FES4ZUBSfMWFyTmFmemQ6ROMSpKifP+OgmUEABJZJTmwbXB4u8So6yUMC8jAwODEE9Bal
  FuZgmq/CtGcQ5GJWHePyBTeDLzSuCmvwJazAS0eKbDcZDFJYkIKakGJnGnV+2qngZCb+Kn6T8
  NOpXnNet8WItOddred3O2KuQK/Sy3PcznI/gm53GWqtaTq2ZhT6LmPvgw+7vK22md1XcDN4Wo
  tud0vviy/ZLTKclqyeTFQov2iu347HVMKYYru+fOGdbz86zv8Kc3L7o6+0CS75H8q1VNW8+87
  d1s+OpbaOFjK5nP5SyWG5fdz7qq21SaWqtSkcLKWvLa7UuMXXm9K5fEku330icdf3wzdgvDTj
  b2tXsn/OnvSuw+d/0tK4Pq/rLppo/THl19MftJ5/WZRbdmH18mPv/nnt3N9rEJs7YkF3l/l/1
  at/7wOfk/HLfO2rVpZhtVKy7afUSY66lDwU8zuVWZOuKBbL6By5RYijMSDbWYi4oTAWjp27k6
  AwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-545.messagelabs.com!1640614729!216105!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9687 invoked from network); 27 Dec 2021 14:18:50 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-11.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Dec 2021 14:18:50 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id A254610044A
	for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Dec 2021 14:18:49 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 946B0100331
	for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Dec 2021 14:18:49 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 27 Dec 2021 14:18:37 +0000
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] gtk+3: upgrade 3.24.30 -> 3.24.31
Date: Tue, 28 Dec 2021 07:18:29 +0800
Message-ID: <1640647109-3552-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Dec 2021 14:19:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160028

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 meta/recipes-gnome/gtk+/{gtk+3_3.24.30.bb => gtk+3_3.24.31.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.24.30.bb => gtk+3_3.24.31.bb} (89%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb b/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb
similarity index 89%
rename from meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb
index 3de5b588eb..a53cd7a45e 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb
@@ -7,7 +7,7 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar
            file://0003-Add-disable-opengl-configure-option.patch \
            file://link_fribidi.patch \
            "
-SRC_URI[sha256sum] = "ba75bfff320ad1f4cfbee92ba813ec336322cc3c660d406aad014b07087a3ba9"
+SRC_URI[sha256sum] = "423c3e7fdb4c459ee889e35fd4d71fd2623562541c1041b11c07e5ad1ff10bf9"
 
 S = "${WORKDIR}/gtk+-${PV}"
 
-- 
2.25.1


