Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DB2FC41535
	for <webhook@archiver.kernel.org>; Wed,  6 Apr 2022 16:33:18 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web08.7587.1649245610166096331
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Apr 2022 04:46:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=P2QLogjn;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649245608; i=@fujitsu.com;
	bh=qS8A8eWqcZeWB1cabV6pizdL2JbQvpcwjsJ4ZCkYh3U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=P2QLogjnq5oMxiUI4B8ws8stvRfJ06/XKOXpCfgQtiNd23XeiT3ynBgYaCeDbnMPH
	 CJO8+muSGYYO87JLa4D5ME0I6E7rqGKLxzG/YK5WQiRxO7rR8iSOp5DiG7dTU6cycU
	 72sJUVSff9m56lOduHJ5D3DiR4om9ug/zYr+dQK7BzExg3ylu7ojoAXjf8DCRmrdC2
	 vKfBZKFTmW+JG+NVKcNh6Qb20WNzlk9weicqx9I2iD6Gj5455em+gRRmohHQiPXjxX
	 rSW8PUpJR0Az+a7qupGH/faPTn+LC7pLT7agFVUSplxY9uCOVGkzHf/RSjMV3o77bf
	 VdqOUuTiPghaA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRWlGSWpSXmKPExsViZ8ORqLu81jf
  J4HuPtsWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmnHz+03WgslcFVd+v2RqYJzA2cXIxSEk8JhR
  YsbNBSwQznkmifV9y5m6GDmBnN2MEufvJ4LYbAJqEtNv3WDtYuTgEBHQk7j6TxQkzCygIvHid
  w87iC0sYCXRfX4CG4jNAhTffn0JmM0r4CTxav4DFhBbQkBBYsrD98wgYzgFnCX+dCZBbHKS2N
  3wF6pcUOLkzCcsEOMlJA6+eMEM0aooMftyM9SYColZs9qYIGw1iavnNjFPYBSchaR9FpL2BYx
  Mqxjtkooy0zNKchMzc3QNDQx0DQ1Ndc0NdQ2NjfUSq3QT9VJLdZNT80qKEoHSeonlxXqpxcV6
  xZW5yTkpenmpJZsYgYGcUuzeuoPxct9PvUOMkhxMSqK8+8t9k4T4kvJTKjMSizPii0pzUosPM
  cpwcChJ8G6pAsoJFqWmp1akZeYAowomLcHBoyTCq1UDlOYtLkjMLc5Mh0idYlSUEuf9UA2UEA
  BJZJTmwbXBIvkSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWFefpDxPJl5JXDTXwEtZgJa/O6
  MJ8jikkSElFQD05annh9nn/v1pWVOsn6e+359SUfTzLjYptTLjU/LdVa+mOpyY3nb+43F98qn
  HNq/YSm3/3oJz7h88fg0x7otChXd8+0sKj12mjDtY7Z6Y7R3udFOxbcrJ7/68W3iR8ddljkt7
  8I/vSx/uInrxlK+/SmzZX2+C05MZN+hqn+oaXbT6fB+Ti6tdqX1qfe8gtrnmBXN5vpWdDXqj9
  v9WvErnfUcJtmqXLl7VyWlGnoIm2+omrj7wJvZVU/utJ1WC7IVVrhV5de7eAffhqnNays0d/o
  fd73WdvPsrXVRkcru/Luyr9j9VFaYfTLpwf15ClIXp0pHf7zepjCjzt1qgVb8kW+Hj10zeX/P
  xtcye43BTyWW4oxEQy3mouJEAHpGdHBfAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-545.messagelabs.com!1649245607!453898!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4224 invoked from network); 6 Apr 2022 11:46:47 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-14.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Apr 2022 11:46:47 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id E2BE010019B
	for <openembedded-core@lists.openembedded.org>;
 Wed,  6 Apr 2022 12:46:46 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 8EBBB1001AD
	for <openembedded-core@lists.openembedded.org>;
 Wed,  6 Apr 2022 12:46:46 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 6 Apr 2022 12:46:43 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libsoup: upgrade 3.0.5 -> 3.0.6
Date: Mon, 4 Apr 2022 02:43:10 +0800
Message-ID: <1649011392-28818-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1649011392-28818-1-git-send-email-wangmy@fujitsu.com>
References: <1649011392-28818-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Apr 2022 16:33:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164066

Changelog:
=========
* Misc HTTP/2 fixes
* Add PUT/POST support to examples/get
* Add `--user-agent` option to examples/get
* Misc meson improvements
* Fix build with Visual Studio

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsoup/{libsoup_3.0.5.bb => libsoup_3.0.6.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libsoup/{libsoup_3.0.5.bb => libsoup_3.0.6.bb} (94%)

diff --git a/meta/recipes-support/libsoup/libsoup_3.0.5.bb b/meta/recipes-support/libsoup/libsoup_3.0.6.bb
similarity index 94%
rename from meta/recipes-support/libsoup/libsoup_3.0.5.bb
rename to meta/recipes-support/libsoup/libsoup_3.0.6.bb
index d2535c91a2..17825ae6a4 100644
--- a/meta/recipes-support/libsoup/libsoup_3.0.5.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.0.6.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl nghttp2"
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
-SRC_URI[sha256sum] = "f5d143db6830b3825edc2a1c4449d639273b0bfa017a4970871962d9bca22145"
+SRC_URI[sha256sum] = "b45d59f840b9acf9bb45fd45854e3ef672f57e3ab957401c3ad8d7502ac23da6"
 
 PROVIDES = "libsoup-3.0"
 CVE_PRODUCT = "libsoup"
-- 
2.25.1


