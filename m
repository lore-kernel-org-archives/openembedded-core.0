Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C40E0C433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 09:53:33 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web11.9083.1648461212269509867
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 02:53:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jYJKR0+H;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648461210; i=@fujitsu.com;
	bh=+oI29dmz2tXzMPhTLf7dcR5xbUg/rRPIXOsyPGnV/78=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=jYJKR0+HfNTGc1sooRrV9gi2lmXY4hmUB4l6X71G6cqVHsWcW0wd32T4oECBPACCS
	 khC0jCWBOGb67ZACbWIzw3ZvfDJrDQdSiQXPkhJ18QXcalwjdENp9SX9hcEC8Ubrh6
	 /pzVEHq1hVvv7+GRZXEakqFcEP8k9609+7otV0jj20rHwgfkNVQQjqJSvyXn8poGsb
	 xMzRQu/F/dh3/R8QSye/3/0uVa1p/SjEIV7hH//c/dk0l/lz7f/LaJRXTaImJkx4qB
	 +tWeVGvrhOoNnNpoKMUSlvuJlOtKGc9oV67I0m5IPFpNgPgHBqDnY8BMfNod71JyuR
	 ouL6JMnPKiGlw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8MxSXdWq2O
  SwZIlvBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8biu8oFdzkqbq3UaWD8zt7FyMkhJPCYUWJT
  S2IXIxeQfZ5JYnXPYWYIZw+jxJbul8wgVWwCahLTb91g7WLk4BAR0JO4+k8UJMwsoCLx4ncP2
  CBhASuJS60L2EBsFgFViW/LT4K18go4SRycf44VxJYQUJCY8vA9WJxTwFni8KdTTBBHOEnMvn
  6NCaJeUOLkzCcsEPMlJA6+eMEM0asoMftyMwuEXSExa1YbE4StJnH13CbmCYyCs5C0z0LSvoC
  RaRWjVVJRZnpGSW5iZo6uoYGBrqGhqa6xrqGlpV5ilW6iXmqpbnlqcYmuoV5iebFeanGxXnFl
  bnJOil5easkmRmD4phQzH9/BOKXvp94hRkkOJiVRXqNMxyQhvqT8lMqMxOKM+KLSnNTiQ4wyH
  BxKEry3moFygkWp6akVaZk5wFiCSUtw8CiJ8Jo2AaV5iwsSc4sz0yFSpxgVpcR5g1uAEgIgiY
  zSPLg2WPxeYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTM6wIyhSczrwRu+iugxUxAi9e+swV
  ZXJKIkJJqYFqyr2zWEeaVe9N+58/MNcl7dyry+83Pm2YJS9n+aWvck7HqsErkn00rP4snf58w
  08zO7EHDBLMDPikBD6tXNoeF1aVHNCiy5844llTu+Ti2cZNk744p9kkxZQHR3TXvA107XjL+Y
  i9Wmhp9itvh5LIF8lKNRyqiVHnZkxcVKu9gWla39/yMc8WVh8/XCL9TcZ5yib3ZQk7ubY/Sbm
  F+HW+bhbzL9k036pJrSOfiPabZ+jksJ/COzsejh+N49DsL35ZP+XJwaozuEqvmsgiJXfv+rur
  rMfBeOufNR+Gsy+Y3tr9u9aj5cytBvsjQOv3ox5lxN87XLLi8K2RDjPj0LhkFly/folf4FUz+
  JbXdXYmlOCPRUIu5qDgRALX75dxaAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-25.tower-587.messagelabs.com!1648461209!26718!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28593 invoked from network); 28 Mar 2022 09:53:30 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-25.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Mar 2022 09:53:30 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id B680710044C
	for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 10:53:29 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id A7E831000FF
	for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 10:53:29 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Mar 2022 10:53:11 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libsoup: upgrade 3.0.4 -> 3.0.5
Date: Mon, 28 Mar 2022 17:52:52 +0800
Message-ID: <1648461173-15770-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648461173-15770-1-git-send-email-wangmy@fujitsu.com>
References: <1648461173-15770-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Mar 2022 09:53:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163697

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsoup/{libsoup_3.0.4.bb => libsoup_3.0.5.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libsoup/{libsoup_3.0.4.bb => libsoup_3.0.5.bb} (94%)

diff --git a/meta/recipes-support/libsoup/libsoup_3.0.4.bb b/meta/recipes-support/libsoup/libsoup_3.0.5.bb
similarity index 94%
rename from meta/recipes-support/libsoup/libsoup_3.0.4.bb
rename to meta/recipes-support/libsoup/libsoup_3.0.5.bb
index 775ab29ddd..d2535c91a2 100644
--- a/meta/recipes-support/libsoup/libsoup_3.0.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.0.5.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl nghttp2"
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
-SRC_URI[sha256sum] = "5bd38b5e091f707fd7fa3ed7c37aacca3f8e16c65787f1cc17dc38d1dcde567b"
+SRC_URI[sha256sum] = "f5d143db6830b3825edc2a1c4449d639273b0bfa017a4970871962d9bca22145"
 
 PROVIDES = "libsoup-3.0"
 CVE_PRODUCT = "libsoup"
-- 
2.25.1


