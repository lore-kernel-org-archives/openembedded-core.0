Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D05EEC433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 12:00:06 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.8972.1647950405447119163
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 05:00:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=i6+GNweu;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647950403; i=@fujitsu.com;
	bh=UvXpC0KPfOqrzrb+KijO+FhMS2n7gypqa2KdtYnB3+0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=i6+GNweurtGMz2SxCD6/EgbHSEW+rscE607QYF5Cp9zlYkOKX0kugisPu5bDJk+oP
	 EN+H31r6XOcyKF52JYUwwnFg/3xtwagK4B+i7VhYtOKnnyuyR0jbbEo2SQVcOEvPnc
	 ATTvcrLjPn7uQZXKNL2WRM8mmac3UGL8G6R9QJliZaRff+XfMBedf+0QEPCJ4HSLpq
	 rehC7HZmacn9qn4xzTn/pGUg9DkCNc2yNwXRMcfXNJL9LXk2fOLFJF8JlrfU+tua5d
	 rvEFuRjl7eVg/Fc2Rhof1LUu77VV8mtXIxFfoJIyRedXmIl6FFi4Xevp3Yl6NCo8ed
	 k08ZRHskv8rxg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRWlGSWpSXmKPExsViZ8ORqOu8yzL
  JYGqrrMWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmvFhzwrWgo2cFTNmLmBuYHzO0cXIxSEk8JhR
  4sTiTUxdjJxAznkmiV9zZCESexglfnzdwAaSYBNQk5h+6wZrFyMHh4iAnsTVf6IgYWYBFYkXv
  3vYQWxhAV+Jd8+Og9ksAqoSe9asZQaxeQUcJc6d+AkWlxBQkJjy8D1YnFPASaL19B1miL2OEk
  9nfmeBqBeUODnzCQvEfAmJgy9eMEP0KkrMvtzMAmFXSMya1cYEYatJXD23iXkCo+AsJO2zkLQ
  vYGRaxWiVVJSZnlGSm5iZo2toYKBraGiqa2ypa2Gkl1ilm6iXWqpbnlpcogvklhfrpRYX6xVX
  5ibnpOjlpZZsYgSGcEqxetAOxm8rfuodYpTkYFIS5RVfbpkkxJeUn1KZkVicEV9UmpNafIhRh
  oNDSYJ3/XagnGBRanpqRVpmDjCeYNISHDxKIrx/NwCleYsLEnOLM9MhUqcYFaXEeSfsBEoIgC
  QySvPg2mAxfIlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMO8MkCk8mXklcNNfAS1mAlqsz2o
  GsrgkESEl1cCkKm4Ucv7bXinxipSlsQ2/rLo/Jzxme6fBK2hqpBn95/TJZGmRmKx9Zz/MmOzF
  NDtsOWv7Qg75wGDJNutnL585nuyK7Sx6blratSCEKfCaY6nF5EIOdtHzW/m+zvlZ82yhc1HGb
  Wc9oSt3c3wS6t2vb74e8e339+t7Zoglrp0THhRo//5C6c9/d+78mLlKI7XebuYR1UaVx+9Tzt
  ZYG32rlDgfc/5PVkTn1btu/nOYMxfPKNs8bdKha+bybtmHTt+d/LzkjFfrewvnCcd8E83LVoQ
  1X62N3rb9cl3sJK1/042UlG4nrs9cu3nesdD7N878e5/Lwtp5h/l+9Onbm2ebFy1ev+oh0/c5
  +j8uGu4pUmIpzkg01GIuKk4EAD0iE/NcAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-565.messagelabs.com!1647950403!1233!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21510 invoked from network); 22 Mar 2022 12:00:03 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-16.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Mar 2022 12:00:03 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 04C1E100195
	for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 12:00:03 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id D548910018F
	for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 12:00:02 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 22 Mar 2022 11:59:51 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] gsettings-desktop-schemas: upgrade 41.0 -> 42.0
Date: Tue, 22 Mar 2022 19:59:34 +0800
Message-ID: <1647950374-5921-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1647950374-5921-1-git-send-email-wangmy@fujitsu.com>
References: <1647950374-5921-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Mar 2022 12:00:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163547

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...esktop-schemas_41.0.bb => gsettings-desktop-schemas_42.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gsettings-desktop-schemas/{gsettings-desktop-schemas_41.0.bb => gsettings-desktop-schemas_42.0.bb} (85%)

diff --git a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_41.0.bb b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb
similarity index 85%
rename from meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_41.0.bb
rename to meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb
index 280e3c8b50..b8ae15c229 100644
--- a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_41.0.bb
+++ b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb
@@ -13,4 +13,4 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gobject-introspection gettext
 
-SRC_URI[archive.sha256sum] = "77289972e596d044583f0c056306d8f1dbd8adcf912910a50da0a663e65332ed"
+SRC_URI[archive.sha256sum] = "6686335a9ed623f7ae2276fefa50a410d4e71d4231880824714070cb317323d2"
-- 
2.25.1


