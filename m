Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98F18C433FE
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 08:34:35 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.7003.1653381261876001141
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 01:34:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=tib4ca/i;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653381259; i=@fujitsu.com;
	bh=rTdSERjS3jknsi1bEVXQBG9d1+I+pOChuptu5t0jDeE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=tib4ca/iB2fKN9U3OrYSqw0iedNmVPhcpc/W+avjnz+xgBouAZujOJxJc3NniHWmt
	 LbiY+2q5RDofFiYHWPngTLd9GkW13G649+P6DzbtSDUm7XmDZ2kyd/b0TfoqFTcFqI
	 jjezSD2K0kyrRisaFwfeUYVSyJ3PZxTkRR5vZOx5nfn0fGhKPfZL7hxXnZZuR+4UHl
	 qN+b3fQFvltFikNAr3fmi1CqeaROIEbETYglPCEXqouvSZAxJD1BNZSzwxEJzBJXZ0
	 aNnxW6YoA9h1FlR2YaIMDjyR53dmmSJZ6HU639QZvK85EuzBpy05447InnB0eH/w67
	 tbyP4t/M94qTg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8ORqNs9oyf
  JYOovQYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePJmW1sBbu5Kw7+vsrcwLiBq4uRi0NI4DGj
  xPYtG9m7GDmBnPNMEtO2BkIk9jBKXNnRygySYBNQk5h+6wZrFyMHh4iAnsTVf6IgYWYBFYkXv
  3vAeoUF7CXO7XgNVs4ioCox7c4GsDivgKPEv0sTwOISAgoSUx6+B7M5BZwklp0+xgix11Fiyv
  KJUPWCEidnPmGBmC8hcfDFC6heRYnZl5tZIOwKiRkztrFB2GoSV89tYp7AKDgLSfssJO0LGJl
  WMVonFWWmZ5TkJmbm6BoaGOgaGprqGlvqGhka6yVW6SbqpZbqlqcWl+ga6SWWF+ulFhfrFVfm
  Juek6OWllmxiBAZxSrH61R2Mm1f91DvEKMnBpCTKm9HSkyTEl5SfUpmRWJwRX1Sak1p8iFGGg
  0NJgje7HSgnWJSanlqRlpkDjCiYtAQHj5IIb/t0oDRvcUFibnFmOkTqFKOilDhvF0hCACSRUZ
  oH1waL4kuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHmjQKbwZOaVwE1/BbSYCWhxr0QnyOK
  SRISUVANT1K/WJ+E+Gr0bloovZOI/Fc/5Z4a5JvvHJar/9+xImrR1/d/A9M+ZnIV//3TGTesX
  muDrVXyqweLSwpCU7Vu+yy+Mdcl/tHxO06JT8+/dqvhV0pameq1750a3o/Gzu0R8tO1V5u1fx
  3ri3XNB0V8lcmax76RXLX35qm/51rQtyysMVq0Vcjj8ZpV/TcXGNYrn5pefrEs989DBqiE5sc
  y4bun85YvTXtw2ajKRWX8hYwFXYaMBJ/PXh0KCfRkHav/yJWrrrD6juvGL8LqJdxhv87v83vL
  OM3P2U99C7hydj+dXXc3nUJhvOS30eYLTroJAm1sxLvHOQhZrn8nv+vL2xuK2ghRepiO7QqSM
  1HYeVmIpzkg01GIuKk4EABo9WK1dAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-565.messagelabs.com!1653381259!99164!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11960 invoked from network); 24 May 2022 08:34:19 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-10.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 24 May 2022 08:34:19 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id CB5AF10019F
	for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 09:34:18 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id A21EA10018E
	for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 09:34:18 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 24 May 2022 09:34:03 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH] [OE-core] [PATCH] ccache: upgrade 4.6 -> 4.6.1
Date: Tue, 24 May 2022 16:33:43 +0800
Message-ID: <1653381225-6080-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1653381225-6080-1-git-send-email-wangmy@fujitsu.com>
References: <1653381225-6080-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 May 2022 08:34:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166050

Changelog:
https://ccache.dev/releasenotes.html#_ccache_4_6_1

License-Update:
- Copyright year updated to 2020
- updated version of expected-lite from 0.5.0 to revision
  3abf06821d489d56aa9c60eccf8aab70d67d158b

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ccache/{ccache_4.6.bb => ccache_4.6.1.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/ccache/{ccache_4.6.bb => ccache_4.6.1.bb} (82%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.6.bb b/meta/recipes-devtools/ccache/ccache_4.6.1.bb
similarity index 82%
rename from meta/recipes-devtools/ccache/ccache_4.6.bb
rename to meta/recipes-devtools/ccache/ccache_4.6.1.bb
index f019679cf1..418d1070cd 100644
--- a/meta/recipes-devtools/ccache/ccache_4.6.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.6.1.bb
@@ -7,12 +7,12 @@ HOMEPAGE = "http://ccache.samba.org"
 SECTION = "devel"
 
 LICENSE = "GPL-3.0-or-later"
-LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=ff5327dc93e2b286c931dda3d6079da9"
+LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=7a19377a02749d8a1281ed608169b0ee"
 
 DEPENDS = "zstd"
 
 SRC_URI = "https://github.com/ccache/ccache/releases/download/v${PV}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "73a1767ac6b7c0404a1a55f761a746d338e702883c7137fbf587023062258625"
+SRC_URI[sha256sum] = "59b28a57c3a45e48d6049001999c9f94cd4d3e9b0196994bed9a6a7437ffa3bc"
 
 UPSTREAM_CHECK_URI = "https://github.com/ccache/ccache/releases/"
 
-- 
2.25.1


