Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46CE8C433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 08:29:19 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.8695.1644308957894367371
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 00:29:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=GDbnUoZN;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644308956; i=@fujitsu.com;
	bh=UKAm+RLULlqlPXkjdwOrBgO8iVWz/kairVDuskGNF50=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=GDbnUoZNjG2xIkgXeUWC+j9GdUUjheZCBprO9ywoX5EIXB7o/pLpcsXvoF2wH3NO5
	 5H9MFLzgSzdWWUiMPE5VrP1IO9B6Kj4bfhMyOeYYgiXqHBzbRA/+k1yLVABXWdxexL
	 d7DGvM4OCZUVPsJA5NBuUutUXBSvCvllW0Gqodmk3nA8tzGHP+pZx8XxNiVaCn/j/x
	 i8xAPIzXRAMgpVK4vHqXQbrtG+PfQCU+6J9zKDfTxAEIxu/74/FHo562e3S68IsRtr
	 Hn+uo+Gfp/TezNLqcjXO974qOK16b4ZGm0/n7NPgYNX74ZvZgdgiLqS0liMt0ZGL6F
	 TY6Lf3uEQZ7eQ==
Received: from [100.115.69.41] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 FE/19-30582-CD922026; Tue, 08 Feb 2022 08:29:16 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKIsWRWlGSWpSXmKPExsViZ8ORqHtDkyn
  JoO2gkMWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmjF3z3TWgqX8FZM3zGdtYJzA28XIxSEk8JhR
  Yt/ifSwQznkmiWU3JjNDOMcZJbbfPszWxcjJwSagJjH91g3WLkYODhEBPYmr/0RBwswCKhIvf
  vewg9jCAlYSxz+vZwEpYQGKdx1XAgnzCjhKHDgzjxXElhBQkJjy8D0zRFxQ4uTMJywQYyQkDr
  54wQxRoygx+3IzC4RdITFrVhsThK0mcfXcJuYJjPyzkLTPQtK+gJFpFaNdUlFmekZJbmJmjq6
  hgYGuoaGprpmZrqGpqV5ilW6iXmqpbnJqXklRIlBaL7G8WC+1uFivuDI3OSdFLy+1ZBMjMDRT
  ip1m72Dc0fdT7xCjJAeTkihvkipTkhBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3jPiQDnBotT01
  Iq0zBxgnMCkJTh4lER4v2kApXmLCxJzizPTIVKnGBWlxHkngCQEQBIZpXlwbbDYvMQoKyXMy8
  jAwCDEU5BalJtZgir/ilGcg1FJmPccyBSezLwSuOmvgBYzAS3+uuhfItDikkSElFQDk5DhSbZ
  Fpil/Pi2YyhfzZsu0dZXrz7WXJhqLbnSe+1Ot2+bm61VCD7zrbwtP2rJ87xm52yZ2DxQ9S0Uj
  rxztnH5sTnh6ybF4cfGKxXZ+LxjWTH3SICYncvj80qaJum6TtZ3T/py3arFtf3Rf8oy28J6Oy
  RUCeoGq9rUvhGsu5mzLsZl4sKLYxyvshrtSzb/5E9eHiUqe5PS6rDp1Y92UsoRvflF7M3hT+T
  c8S5x67tvLwzm5Ul0sMYY15QcPcfu3GvS/b2Da8TK79aDl3kPWfhLL1NO/2+06tirKJcimIqJ
  q5aynre+023mC/q5czrLhaOQfplLDyYtVpWYbSX730vrenxkgzP/0yuYAyQMMSizFGYmGWsxF
  xYkA1WusRkgDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-528.messagelabs.com!1644308952!1922!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28916 invoked from network); 8 Feb 2022 08:29:12 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-6.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 8 Feb 2022 08:29:12 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id C3873100193
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Feb 2022 08:29:11 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id B61B3100185
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Feb 2022 08:29:11 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 8 Feb 2022 08:28:49 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] man-db: upgrade 2.9.4 -> 2.10.0
Date: Tue, 8 Feb 2022 16:28:41 +0800
Message-ID: <1644308922-5558-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 08:29:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161485

License-Update:
==============
 COPYING : "GNU Library" changed to "GNU Lesser"
         format changed
 COPYING.LIB : "51 Franklin St" changed to "51 Franklin Street"
               format changed

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../man-db/{man-db_2.9.4.bb => man-db_2.10.0.bb}            | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/man-db/{man-db_2.9.4.bb => man-db_2.10.0.bb} (90%)

diff --git a/meta/recipes-extended/man-db/man-db_2.9.4.bb b/meta/recipes-extended/man-db/man-db_2.10.0.bb
similarity index 90%
rename from meta/recipes-extended/man-db/man-db_2.9.4.bb
rename to meta/recipes-extended/man-db/man-db_2.10.0.bb
index f97974abb8..6a8ac2e3e3 100644
--- a/meta/recipes-extended/man-db/man-db_2.9.4.bb
+++ b/meta/recipes-extended/man-db/man-db_2.10.0.bb
@@ -2,13 +2,13 @@ SUMMARY = "An implementation of the standard Unix documentation system accessed
 HOMEPAGE = "http://man-db.nongnu.org/"
 DESCRIPTION = "man-db is an implementation of the standard Unix documentation system accessed using the man command. It uses a Berkeley DB database in place of the traditional flat-text whatis databases."
 LICENSE = "LGPLv2.1 & GPLv2"
-LIC_FILES_CHKSUM = "file://docs/COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343 \
-                    file://docs/COPYING;md5=eb723b61539feef013de476e68b5c50a"
+LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
+                    file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/man-db/man-db-${PV}.tar.xz \
            file://99_mandb \
            file://man_db.conf-avoid-multilib-install-file-conflict.patch"
-SRC_URI[sha256sum] = "b66c99edfad16ad928c889f87cf76380263c1609323c280b3a9e6963fdb16756"
+SRC_URI[sha256sum] = "0a8629022f7117dc7fc6473c6fdb14913b24b106059bb056abee87dbd6070c79"
 
 # remove at next version upgrade or when output changes
 PR = "r1"
-- 
2.25.1


