Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCEEFC77B61
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 08:58:38 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web11.39803.1681117116181890623
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 01:58:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Mz75aLLH;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681117114; i=@fujitsu.com;
	bh=XP8eqILVAXkCQ2gAWel2sfZ9rJdtTqOZzWHnjxWjfME=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Mz75aLLHixlYCYU7iunso37gGDeTl35hEekClI0NOsgU3wKmwnLvBmaTkcq03RS2K
	 2ngLYZQLK2FcQqyrg7yZ+5ACes1k4vWtzGtK5+ahF4Hft8M5S6lyeqkql2GSckwcDX
	 V++4nu/DWWqn6mDJc4n6SFl6gnxsCjuCtZOQFPoxxfiWWR9cSaInM+ArBgdHWYBV/G
	 HNoyHj/kfmCGwnH3kkcWtY5FbWbrbc1yUx3bq73yRWmnxd4dxT9QjiDZ+JgA7qIwBK
	 pZ8QqDZZD+vR/OMPR7MTN2tMyUTMYhcNVeVRTvLzjSvkaN5g5r0nPJAy6cBASwTyMR
	 okrMT5sW2qjFA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBIsWRWlGSWpSXmKPExsViZ8OxWXfneeM
  Ug7dvlC3u/HzH7sDocW7jCsYAxijWzLyk/IoE1ox7E8wKPnBVHD1xkKmB8TxnFyMXh5DAA0aJ
  Bcvfs0M4l5kknmz7wgTh7GGUOD7hHlCGk4NNQErixv3/bF2MHBwiAnoSV/+JgoSZBVQkXvzuA
  SsRFrCWeLz0KSNICYuAqsTL0+YgYV4BJ4mjs7cxg9gSAgoSUx6+Z4aIC0qcnPmEBWKMhMTBFy
  +gahQlZl9uZoGwKyQapx9igrDVJK6e28Q8gZF/FpL2WUjaFzAyrWI0K04tKkst0jU01Esqykz
  PKMlNzMzRS6zSTdRLLdUtTy0u0TXUSywv1kstLtYrrsxNzknRy0st2cQIDMSUYqaqHYwv+v7q
  HWKU5GBSEuXt4jJOEeJLyk+pzEgszogvKs1JLT7EKMPBoSTBa3AWKCdYlJqeWpGWmQOMCpi0B
  AePkghvFjAyhHiLCxJzizPTIVKnGHU5Phy6spdZiCUvPy9VSpyXA6RIAKQoozQPbgQsQi8xyk
  oJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEubddhhoCk9mXgncpldARzABHcHlYgByREkiQkqqgWn
  9V94fPItmru4JU/FZ1yzyV/qQXd9pgycT1my3zw+N/nC3X/d4gms1a01C67Fyx4bgt9XRXesS
  N8xwtAzZojRnc0Lb46ymY6cfhpfq/7p3hnfDk5meDYeCl51c76da9KN79YS7Da7ueWqe3pXp7
  nflO245Oeu8Dpv+Ntu5K3m2yM2o0LkecqaWHJUFcjv5Kw/vNApZsFSa0cL9ebacZ2WZWrd59/
  x5q401NaftjpSObU6ydNiknDOB2/p05k4nkbIzH6tnKSZ2u5eK3Qyw6986m6vwPX99x3019tD
  5v/IM/ydlnxRseL11gbP7gYWNFd4pn1knfXjT8vzt7wU39701nB1WfOhS76n0Sf8+KrEUZyQa
  ajEXFScCAGLG/oJLAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-585.messagelabs.com!1681117113!194690!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2665 invoked from network); 10 Apr 2023 08:58:33 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-22.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 08:58:33 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 34C7E159
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:58:33 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 2793F155
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:58:33 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 09:58:31 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libhandy: upgrade 1.8.1 -> 1.8.2
Date: Mon, 10 Apr 2023 16:58:16 +0800
Message-ID: <1681117100-24726-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 08:58:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179848

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Demo
  - Correctly use GtkSwitch
  - Fix a GLib deprecation
- Docs
  - Fix dependency names
- HdyTabView
  - Fix set_menu_model() input check
  - Fix a typo in docs
- HdySwipeable
  - Fix get_swipe_area() fallback
- Memory leak fixes
- Translation updates
  - Slovenian

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libhandy/{libhandy_1.8.1.bb => libhandy_1.8.2.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libhandy/{libhandy_1.8.1.bb => libhandy_1.8.2.bb} (95%)

diff --git a/meta/recipes-gnome/libhandy/libhandy_1.8.1.bb b/meta/recipes-gnome/libhandy/libhandy_1.8.2.bb
similarity index 95%
rename from meta/recipes-gnome/libhandy/libhandy_1.8.1.bb
rename to meta/recipes-gnome/libhandy/libhandy_1.8.2.bb
index 41c8e9bfb8..e863e8d13b 100644
--- a/meta/recipes-gnome/libhandy/libhandy_1.8.1.bb
+++ b/meta/recipes-gnome/libhandy/libhandy_1.8.2.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=https;branch=libhandy-1-8"
-SRCREV = "f06c1bfa95a3160575b36315c6d9437376d8af77"
+SRCREV = "48ae7ec0f7f9ee5f666da38b0e39e66874957166"
 S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.(\d*[02468])+(\.\d+))"
-- 
2.34.1


