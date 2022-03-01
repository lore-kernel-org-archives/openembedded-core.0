Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F5D4C433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 11:53:17 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.7236.1646135596293686162
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 03:53:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=DixRi9SV;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646135594; i=@fujitsu.com;
	bh=QINlTxVrygX0hRWLOXCpXXavnKmjuY22KsnN0X+NUqs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=DixRi9SVkpzzr2vE7t3djArFzJn5StobaQ8gYtG6RKcnGNNE+K9ecMqQbY1a4G1T+
	 44ZGJEb+GnNdTT6M1Y9zbsvvvi+FEcY+08L+Y3cvt/FFYl/t44cBNENRppfmmfYpoI
	 yqxz6Ftm+6Qo5J3yzkUGa5lVz2V+h23F6JrbdsbPIHJ/jMTh6gl1vACWtA+Obc+9qO
	 HAsz6i0OCIE27RcAyhImIVYcnw4fKkmW9bFALy3IZOwZTKZ975kxE86G1jFseozOxg
	 kGEKhg4V10PlapK/JAuzIHHaEY6lovHAuWh+FojfDijXUtVoD9LeeIkekgp3Eseeli
	 LIiIok0UEUHcA==
Received: from [100.115.68.61] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 69/A5-24566-A290E126; Tue, 01 Mar 2022 11:53:14 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRWlGSWpSXmKPExsViZ8ORqKvFKZd
  kcPclk8Wdn+/YHRg9zm1cwRjAGMWamZeUX5HAmrF98W7Wgh08FY3r77M3MP7j6mLk4hASeMwo
  8f3gC6YuRk4g5zyTxM2WOojEcUaJnT+vM4Mk2ATUJKbfusHaxcjBISKgJ3H1nyhImFlAReLF7
  x52kLCwgLVEawfYGBag8MP+T2CdvAJOEscbD4DZEgIKElMevgezOQWcJf7dfsQMsdZJounKQq
  h6QYmTM5+wQIyXkDj44gVUr6LE7MvNLBB2hcSsWW1MELaaxNVzm5gnMArOQtI+C0n7AkamVYx
  2SUWZ6RkluYmZObqGBga6hoamumZmuoYWZnqJVbqJeqmlusmpeSVFiUBpvcTyYr3U4mK94src
  5JwUvbzUkk2MwEBOKXbatYPxYN9PvUOMkhxMSqK8ajdlk4T4kvJTKjMSizPii0pzUosPMcpwc
  ChJ8G5nl0sSEixKTU+tSMvMAUYVTFqCg0dJhDeOBSjNW1yQmFucmQ6ROsWoKCXO68EBlBAASW
  SU5sG1wSL5EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3naQ7TyZeSVw018BLWYCWvw3WAp
  kcUkiQkqqgWnB+uxjr/u5FNebGDytr7ZJCD0VyvDVrldg+kLLt+vf1m3eynavQVOvb9GZN3cb
  T+vpP96UfiTJ85BYScOuH272XPP2n/d7vmV298uJWTe9xMLzs592JXwSa1jJwVJw9Hj6xEWfO
  uRSxct/+7NvXFS3ZfqHJ8kOn83szH303nbwXgqdZhpWp6OccF95hcRtnY2XA6LOT6g4b5Ri+0
  /x/Tu5HmPJM/zHa17lftry5tgBybaZK4z/Vr0qzY/cNdny0oSZhlOvsJz0abn81y3/QufujQq
  v4xi4uMv5nfL/a/wX9bX9MM2hk3/pohcf7j4Jq54T+XfqFIbJOVFJEss+cG/p9TN4w9n1cZ/U
  NIbreguUWIozEg21mIuKEwFZNyOpXwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-532.messagelabs.com!1646135593!16201!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9054 invoked from network); 1 Mar 2022 11:53:14 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-11.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 1 Mar 2022 11:53:14 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 7A9DB100181
	for <openembedded-core@lists.openembedded.org>;
 Tue,  1 Mar 2022 11:53:13 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 5206B100193
	for <openembedded-core@lists.openembedded.org>;
 Tue,  1 Mar 2022 11:53:13 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 1 Mar 2022 11:53:04 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] dbus: upgrade 1.12.20 -> 1.12.22
Date: Tue, 1 Mar 2022 19:52:51 +0800
Message-ID: <1646135571-38971-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646135571-38971-1-git-send-email-wangmy@fujitsu.com>
References: <1646135571-38971-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 11:53:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162544

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../dbus/{dbus-test_1.12.20.bb => dbus-test_1.12.22.bb}        | 0
 meta/recipes-core/dbus/dbus.inc                                | 3 +--
 meta/recipes-core/dbus/{dbus_1.12.20.bb => dbus_1.12.22.bb}    | 0
 3 files changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-core/dbus/{dbus-test_1.12.20.bb => dbus-test_1.12.22.bb} (100%)
 rename meta/recipes-core/dbus/{dbus_1.12.20.bb => dbus_1.12.22.bb} (100%)

diff --git a/meta/recipes-core/dbus/dbus-test_1.12.20.bb b/meta/recipes-core/dbus/dbus-test_1.12.22.bb
similarity index 100%
rename from meta/recipes-core/dbus/dbus-test_1.12.20.bb
rename to meta/recipes-core/dbus/dbus-test_1.12.22.bb
diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index a43bf65629..cb4c56db92 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -11,8 +11,7 @@ SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://stop_using_selinux_set_mapping.patch \
 "
 
-SRC_URI[md5sum] = "dfe8a71f412e0b53be26ed4fbfdc91c4"
-SRC_URI[sha256sum] = "f77620140ecb4cdc67f37fb444f8a6bea70b5b6461f12f1cbe2cec60fa7de5fe"
+SRC_URI[sha256sum] = "8d25785c798ec4f892e6f9d177fb0ceeb8b29867b119798f9d5228561d3ad474"
 
 EXTRA_OECONF = "--disable-xml-docs \
                 --disable-doxygen-docs \
diff --git a/meta/recipes-core/dbus/dbus_1.12.20.bb b/meta/recipes-core/dbus/dbus_1.12.22.bb
similarity index 100%
rename from meta/recipes-core/dbus/dbus_1.12.20.bb
rename to meta/recipes-core/dbus/dbus_1.12.22.bb
-- 
2.25.1


