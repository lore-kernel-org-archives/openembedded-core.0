Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D456CCA473
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 12:26:14 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.31197.1654518373026588346
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:26:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=pwUjoLSK;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1654518371; i=@fujitsu.com;
	bh=mDQ2V3+R/dCmNtN2S8mKiywN5xN0CIKfHIebRbj8La8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=pwUjoLSKI0hrWO+yN1PXxfz51HgxadBLDFrGT/u5GyHLmoaGrmyaB4Pu4C5kZg4Bi
	 47TpjkHkBzyGArnc/f4aYtyHRbWGF/DLNFYA3FBxCPNssegS71TVziZqnFBBZ6QpTT
	 BpGPwtkgp47E3FrTUhczsRBu2UsrFb8OQks16W4krH0xjLntbtvFdVabB9Q2O2JEAR
	 UNiqYZBYIvPj2NhViSe6YxwXCTQzpgyWCxqeLIrOHqgEHt+4j3jeDaoAA3Eq95lqu0
	 EcbszWeUQ4HEIAp4RiwReAyUHhtMrARopuljks58sPdfxhdnJVhYM2LQK9V9if+bzv
	 tucD815yeFMWw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8ORqJv8aW6
  SQetdZos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPGurVMBas5Kxb82sPewLiDo4uRi0NI4DGj
  xIeNN9ghnPNMEvNbZrFAOLsZJXZNXMLaxcjJwSagJjH91g0gm4NDREBP4uo/UZAws4CKxIvfP
  ewgtrCAlcS5C21g5SxA8a6t/1lAbF4BR4mvpxeA2RICChJTHr5nBrE5BZwkji75DmYLAdVsaj
  4DVS8ocXLmExaI+RISB1+8YIboVZSYfbkZak6FxIwZ29ggbDWJq+c2MU9gFJyFpH0WkvYFjEy
  rGK2TijLTM0pyEzNzdA0NDHQNDU11jS10DY3M9RKrdBP1Ukt1y1OLS3SN9BLLi/VSi4v1iitz
  k3NS9PJSSzYxAsM4pVitfgfji5U/9Q4xSnIwKYny2l+bmyTEl5SfUpmRWJwRX1Sak1p8iFGGg
  0NJgrfuA1BOsCg1PbUiLTMHGFMwaQkOHiURXut3QGne4oLE3OLMdIjUKUZdjplf2w4wC7Hk5e
  elSonzHgeZIQBSlFGaBzcCFt+XGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzPgCZwpOZVwK
  36RXQEUxAR/g8mANyREkiQkqqgSm78KaGsZjPvgX8PIx39PkYdXM+SDJWiU+drfvmT+6vD/Jr
  Vrqa/Qu5smxD1a3/ak/S9heprzSdeWRzdUhI+t9cj4eHX/7haJ1+etZzdebN7vpqGv0vpTaZa
  N1ZJy6oGrPYR3zOspuJUvpHl8wQ4nde52LmFH3p3k1jVrGtl5+K3XntGCKTkzPZ89iLpX05/g
  VHfwbI3DMNDVF8eMm1rX2f0UnTVf/1XbW1vBpXvqr9u/5p7vNMuaQS10lvVM6V/k5aa5CdtO/
  TvbPXTZTmXC39VHr3MdfC1hXhjYtu27JMKO4xEnrO/9++Ijdrr4LPN8EPO7fOmW19Yd8T0ffq
  VtzCXLtlPTSvxE2+dnOhRbYSS3FGoqEWc1FxIgBBCHMGagMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-565.messagelabs.com!1654518370!628306!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1142 invoked from network); 6 Jun 2022 12:26:11 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-23.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Jun 2022 12:26:11 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 9E5C01001B0
	for <openembedded-core@lists.openembedded.org>;
 Mon,  6 Jun 2022 13:26:10 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 7DC99100192
	for <openembedded-core@lists.openembedded.org>;
 Mon,  6 Jun 2022 13:26:10 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 6 Jun 2022 13:26:02 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] meson: upgrade 0.62.1 -> 0.62.2
Date: Mon, 6 Jun 2022 20:25:36 +0800
Message-ID: <1654518337-9206-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1654518337-9206-1-git-send-email-wangmy@fujitsu.com>
References: <1654518337-9206-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 12:26:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166619

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-devtools/meson/{meson_0.62.1.bb => meson_0.62.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/meson/{meson_0.62.1.bb => meson_0.62.2.bb} (98%)

diff --git a/meta/recipes-devtools/meson/meson_0.62.1.bb b/meta/recipes-devtools/meson/meson_0.62.2.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_0.62.1.bb
rename to meta/recipes-devtools/meson/meson_0.62.2.bb
index dabdcaab01..acfc64fd4f 100644
--- a/meta/recipes-devtools/meson/meson_0.62.1.bb
+++ b/meta/recipes-devtools/meson/meson_0.62.2.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://0001-is_debianlike-always-return-False.patch \
            file://0001-Check-for-clang-before-guessing-gcc-or-lcc.patch \
            "
-SRC_URI[sha256sum] = "a0f5caa1e70da12d5e63aa6a9504273759b891af36c8d87de381a4ed1380e845"
+SRC_URI[sha256sum] = "a7669e4c4110b06b743d57cc5d6432591a6677ef2402139fe4f3d42ac13380b0"
 
 UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
 UPSTREAM_CHECK_REGEX = "meson-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.25.1


