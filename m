Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E346EC61DA4
	for <webhook@archiver.kernel.org>; Sun,  5 Mar 2023 08:07:05 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web11.5243.1678003619989564119
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Mar 2023 00:07:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jcDDSKlP;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678003618; i=@fujitsu.com;
	bh=OVWQpNCT1cu4pAqIaq74IkSGEbbyPu3HBKzhl/SDWGo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=jcDDSKlPqernzBYCVBWkCBZ8imTexocvLyhNzSRuKzrcVOkYdijM0a6aGZrCO70cm
	 Mgku2sl1R77+ACmlifc5dTSFaxg2jEUFAV6WvU1yuf+Kq5ZwJym5KmUWoCtYfcKp7A
	 FAXegRQ4RI2e6auoaTpw1RP43EmFBn1T4qL9UcOK0yY48ckJR+hA8NcPE1qbBWCMw+
	 VCkFINMxq0UFpiW7Xm0PD+743H5switxYGre0Notvog4oHlymI8tty0ZoQnJDCFnVM
	 yGSDw9RcISUACMtcM3/jZJQuVQizWEydMdCUWLwgQt9nZ7Ih7bod0pxuacCN2SAMK2
	 u0IjDYo4z8WhA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8ORqLvQlyX
  F4PoxVYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNeNf92GmgqVcFTPm/WZrYOzm7GLk4hASeMwo
  sWHeFTYI5zqTxIXGqawQzh5GiUtH97J3MXJysAlISdy4/x+oioNDREBP4uo/UZAws4CKxIvfP
  WAlwgK2EtO7/rCA2CxA8W23IeK8Ak4Ss2eeAYtLCChITHn4nhnE5hRwluhb9hfMFgKqufxwGx
  tEvaDEyZlPWCDmS0gcfPGCGaJXUWL25WaoOZUSrR9+QdlqElfPbWKewCg4C0n7LCTtCxiZVjG
  aFqcWlaUW6VrqJRVlpmeU5CZm5uglVukm6qWW6panFpfoGuollhfrpRYX6xVX5ibnpOjlpZZs
  YgSGbkoxq9MOxuN9f/UOMUpyMCmJ8gb+Yk4R4kvKT6nMSCzOiC8qzUktPsQow8GhJMH71I0lR
  UiwKDU9tSItMwcYRzBpCQ4eJRHeh55Aad7igsTc4sx0iNQpRkUpcd5lPkAJAZBERmkeXBssdi
  8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuY1ACYCIZ7MvBK46a+AFjMBLdY4zQCyuCQRISX
  VwKTUGMcybZZH0GulJnWFB3ofpKb8FtaPEvBJjBRKO+reOuX4c4sa+UvHHm76/E61L+GPr634
  gmOuslZ/rSv6zz/gefte1vAed7j4HQ/uFRvEnheEdB/z+/yJ8WL/Kw8mg0Rv46Z5qzimbvDmT
  lHaGnLmjvH9DceXNpzvFfFM8BJUP5Oy2MOm8hx3yyLudXMOR+x4Zj9P9O3DKXnWTxIsBNa5Np
  1Z7vft3DuZjUEa02/lip36ee6QTfm1P6pJ4pUSLYdNrx26XuvDP29/waRrxz1jLme+vTm73r4
  t9xTH7yU1sYVLF0cKFP06daCmnOWr2T17Laa/Bz9yndes+t/1UPV/fPzK3O1WT06d/fymuEOJ
  pTgj0VCLuag4EQC4SxnKWAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-587.messagelabs.com!1678003617!190140!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10971 invoked from network); 5 Mar 2023 08:06:57 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-15.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Mar 2023 08:06:57 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 3C28410019D
	for <openembedded-core@lists.openembedded.org>; Sun,  5 Mar 2023 08:06:57 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 2FD0E10018D
	for <openembedded-core@lists.openembedded.org>; Sun,  5 Mar 2023 08:06:57 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sun, 5 Mar 2023 08:06:55 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] glib-2.0: upgrade 2.74.5 -> 2.74.6
Date: Sun, 5 Mar 2023 16:06:39 +0800
Message-ID: <1678003602-30550-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678003602-30550-1-git-send-email-wangmy@fujitsu.com>
References: <1678003602-30550-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Mar 2023 08:07:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178034

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Bugs fixed:
  - !3239 Backport !3237 "Fix safe_wspawnve #define" to glib-2-74

* Translation updates:
  - Georgian
  - German

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../glib-2.0/{glib-2.0_2.74.5.bb => glib-2.0_2.74.6.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.74.5.bb => glib-2.0_2.74.6.bb} (96%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.74.6.bb
similarity index 96%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.74.6.bb
index d54f077cb0..5b79ae481c 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.74.6.bb
@@ -21,7 +21,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 
-SRC_URI[sha256sum] = "ceba83a5999ceb31a4c4fc9921207cb9ffffd2ab1d6ec03c162d3f608a5c14c8"
+SRC_URI[sha256sum] = "069cf7e51cd261eb163aaf06c8d1754c6835f31252180aff5814e5afc7757fbc"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.34.1


