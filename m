Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 657F2C43334
	for <webhook@archiver.kernel.org>; Wed, 29 Jun 2022 03:25:31 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web12.7204.1656473125567953233
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jun 2022 20:25:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=cY8UG2Df;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656473123; i=@fujitsu.com;
	bh=rq8MIYx/4hus5IgIEkHU8raqjtfJZ/a1CCtNwstdoQo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=cY8UG2DfKVMAqWB4kuA5hF4FHto8D4JTtf+YXYkneHQckPwxIxsrtN5CRtFoF/TFS
	 GHvt3fKGTxVhcKwz1xxMynguS9rbxC8KcFjGOPqK2WmlM5USYBin6udY9i4DeMtR+V
	 WBomPzAWg2KHPybhb8apUBr/WSbxj8Tx1xa2txVr7Kp/te8nLgYosUnjD+LtmQlMx6
	 2dWWdB6e3zzeBMOse1thTIQWfnzzJ0co3y0GFWD9JSQSEDoU4lNBrfG6qAkU/8Bt6U
	 uYfei+aWuj7PdFsvDZC4kh/kRWpmrCYrcndgVTqWtUdKRZx+Mdwsd/CrTGp/KQcpjn
	 sopDmxB9Md24g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8MxSVf52O4
  kg2tNvBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8baB8dZCs5xVEydf5WxgfE3excjF4eQwGNG
  iamnb7BCONeYJN41H2WEcPYwSkxe/wOojJODTUBNYvotkCoODhEBPYmr/0RBwswCKhIvfveAl
  QgL+EhMOPUOzGYRUJXYdqaXEcTmFXCUOH5gBlhcQkBBYsrD98wgYzgFnCS6GsRBwkJAJatvPW
  eCKBeUODnzCQvEeAmJgy9eMEO0KkrMvtzMAmFXSMyYsY0NwlaTuHpuE/MERsFZSNpnIWlfwMi
  0itEmqSgzPaMkNzEzR9fQwEDX0NBU19JM18jQQC+xSjdRL7VUNy+/qCRD11AvsbxYL7W4WK+4
  Mjc5J0UvL7VkEyMwjFOKEy7tYFy375feIUZJDiYlUV7HabuThPiS8lMqMxKLM+KLSnNSiw8xy
  nBwKEnwRh4BygkWpaanVqRl5gBjCiYtwcGjJMJbBJLmLS5IzC3OTIdInWLU5Zj5te0AsxBLXn
  5eqpQ47wSQIgGQoozSPLgRsPi+xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYl/cw0BSezLw
  SuE2vgI5gAjrCb+IOkCNKEhFSUg1MVVaudRutFrG9Mw90kd1XrJO5rVwhe9J+RaVPGWWpps9N
  t6Vumr6aMdY6RO/M9ygFexWx8GUu50v18sUC7p69s1BQlFPBX+CeZqnlrgLPrxaf44Mv31c7y
  rHw5u6umg3WDzfmn1+0PlxR38LhzInbz/IOvc69/K5b88rKkG3tbRny9V3z63peHJn75ObCW5
  rcVeWuy5YeaT2gv3LSuxtTU7YG7078+P4XS7aERQzLypCuuOldkl++y0twvlO06zt70kFyllT
  abb2GI58fTNJkrJkbtX5hyfn0zztmHjx2vX6KRm10fti+c4bGostSDie9l5zDd1/msLfZ+Ynd
  mtItCuwn9ymui//9t/nrWqtPSizFGYmGWsxFxYkANpyrQWoDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-732.messagelabs.com!1656473122!135334!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1562 invoked from network); 29 Jun 2022 03:25:23 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-16.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Jun 2022 03:25:23 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id A53321000C0
	for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 04:25:22 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 98C3F100078
	for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 04:25:22 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 29 Jun 2022 04:25:21 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-certifi: upgrade 2022.5.18.1 -> 2022.6.15
Date: Wed, 29 Jun 2022 11:24:05 +0800
Message-ID: <1656473046-4187-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1656473046-4187-1-git-send-email-wangmy@fujitsu.com>
References: <1656473046-4187-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jun 2022 03:25:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167362

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-certifi_2022.5.18.1.bb => python3-certifi_2022.6.15.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-certifi_2022.5.18.1.bb => python3-certifi_2022.6.15.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-certifi_2022.5.18.1.bb b/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-certifi_2022.5.18.1.bb
rename to meta/recipes-devtools/python/python3-certifi_2022.6.15.bb
index ff460d40b9..f78409b177 100644
--- a/meta/recipes-devtools/python/python3-certifi_2022.5.18.1.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb
@@ -7,7 +7,7 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=67da0714c3f9471067b729eca6c9fbe8"
 
-SRC_URI[sha256sum] = "9c5705e395cd70084351dd8ad5c41e65655e08ce46f2ec9cf6c2c08390f71eb7"
+SRC_URI[sha256sum] = "84c85a9078b11105f04f3036a9482ae10e4621616db313fe045dd24743a0820d"
 
 inherit pypi setuptools3
 
-- 
2.25.1


