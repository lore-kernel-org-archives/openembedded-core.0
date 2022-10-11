Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E505FC433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 08:06:58 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web09.4846.1665475585192561736
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 01:06:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=PZp3NmGb;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665475583; i=@fujitsu.com;
	bh=NjKA8mlDpUuVIycDnqpSfadIQEz9KXeeaQR1xXvYu7c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=PZp3NmGbdnAUAmIVRPBCFKUQY89Cy1a2MG4WanPxRNbpYLaRIZl9psWa0EVwr+noH
	 zoarix0hAV0dV/duj0tTSUTusJ10CbkB1tc1EdSV6YTDS24PwrohBBVW/uBNJSp7ek
	 PCCd5UdFC5PxK9rD10Wqn55uxejCWfWz1mf82W0IiXP8UN+NALXrBzODw48z8qfD8K
	 aHEzQnqytsu+kuxo9mYIHkASs/nYAXuaZ0KUOdyzVnXjLwCwLUmnA3sk9Yccf59h/A
	 BqXD+7PWyAHxoqv+QYhRSNWVs7dLzYMODVuo2lvq8hYtBvNEow8p3vT/42lxzxhdpL
	 g5ziX4STcoelA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8MxSfefsmu
  ywYGfFhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0bn2SPsBe9FKxr3b2RuYHwu1MXIySEk8JhR
  Yt01zi5GLiD7GpPE+9et7BDOHkaJSwduM4FUsQmoSUy/dYO1i5GDQ0RAT+LqP1GQMLOAisSL3
  z3sILawgJXEmUMHwWwWAVWJM/dWMIPYvAJOEqsOnQOLSwgoSEx5+B4szingLPGk5xILxBFOEp
  tb1kPVC0qcnPmEBWK+hMTBFy+YIXoVJWZfbmaBsCskZs1qY4Kw1SSuntvEPIFRcBaS9llI2hc
  wMq1itE4qykzPKMlNzMzRNTQw0DU0NNW1NNM1NNNLrNJN1Est1c3LLyrJ0DXUSywv1kstLtYr
  rsxNzknRy0st2cQIDOKU4gSBHYx79/3SO8QoycGkJMp79blLshBfUn5KZUZicUZ8UWlOavEhR
  hkODiUJ3l9KrslCgkWp6akVaZk5wIiCSUtw8CiJ8PZIAaV5iwsSc4sz0yFSpxh1OWZ+bTvALM
  SSl5+XKiXOmwuMTyEBkKKM0jy4EbDovsQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmFcZZAp
  PZl4J3KZXQEcwAR1x8qoTyBEliQgpqQam2Esat3LcZjsdfLsytDlyk2RV4cW+7OLVCVMPlUmq
  yBcEXd29auulN7JeGWUPUv4afz+TqMLqU7X9mk4X04mLbV4bVNRfZyTNs2jhmbiugnX2pfTPp
  5iMu8tuHFfXWvtN9PSzDNfulNOPBJ/sXpQq9L2jfMaE9kuxBZZ7EvqNp3y9V+KjmJ8RYLHL14
  JlTtVRP+PtU76vjU9Kj2OfsUOxcH3h+oTLnwrlvJ92c8mfOfFLvUcic+sWxuKNWT5bc3Kls45
  x1CyepX198a9TBm+vrZFe9fPqqr/zngVeCU6OXvpysg9D5rMNMsw9iwKrvzPo8Py0fH43/KW9
  rf+FowvUpl2Mzvu8QTlmyxFdndd3lViKMxINtZiLihMBQb20H2kDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-745.messagelabs.com!1665475582!1774!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26665 invoked from network); 11 Oct 2022 08:06:22 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-15.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 11 Oct 2022 08:06:22 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 520221000FB
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 09:06:22 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 451501000EE
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 09:06:22 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 11 Oct 2022 09:06:20 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libva: upgrade 2.15.0 -> 2.16.0
Date: Tue, 11 Oct 2022 16:05:55 +0800
Message-ID: <1665475558-16409-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1665475558-16409-1-git-send-email-wangmy@fujitsu.com>
References: <1665475558-16409-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 08:06:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171601

Changelog:
===========
    add: Add HierarchicalFlag & hierarchical_level_plus1 for AV1e.
    dep: Update README.md to remove badge links
    dep: Removed waffle-io badge from README to fix broken link
    dep: Drop mailing list, IRC and Slack
    autotools: use wayland-scanner private-code
    autotools: use the wayland-scanner.pc to locate the prog
    meson: use wayland-scanner private-code
    meson: request native wayland-scanner
    meson: use the wayland-scanner.pc to locate the prog
    meson: set HAVE_VA_X11 when applicable
    style:Correct slight coding style in several new commits
    trace: add Linux ftrace mode for va trace
    trace: Add missing pthread_mutex_destroy
    drm: remove no-longer needed X == X mappings
    drm: fallback to drm driver name == va driver name
    drm: simplify the mapping table
    x11: simplify the mapping table
    android: open() with O_CLOEXEC for device fd
    android: remove convoluted open_device() helper
    android: drop va_fool references
    ci: strengthen ci with -Werror
    ci: va/x11/nvctl: fix Wdeprecated-non-prototype on close_display
    ci: add clang-15 coverage and rearrange runners
    ci: upgrade FreeBSD to 13.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libva/{libva-initial_2.15.0.bb => libva-initial_2.16.0.bb}  | 0
 meta/recipes-graphics/libva/libva.inc                           | 2 +-
 .../recipes-graphics/libva/{libva_2.15.0.bb => libva_2.16.0.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libva/{libva-initial_2.15.0.bb => libva-initial_2.16.0.bb} (100%)
 rename meta/recipes-graphics/libva/{libva_2.15.0.bb => libva_2.16.0.bb} (100%)

diff --git a/meta/recipes-graphics/libva/libva-initial_2.15.0.bb b/meta/recipes-graphics/libva/libva-initial_2.16.0.bb
similarity index 100%
rename from meta/recipes-graphics/libva/libva-initial_2.15.0.bb
rename to meta/recipes-graphics/libva/libva-initial_2.16.0.bb
diff --git a/meta/recipes-graphics/libva/libva.inc b/meta/recipes-graphics/libva/libva.inc
index 735f2fca5b..0f16dacc98 100644
--- a/meta/recipes-graphics/libva/libva.inc
+++ b/meta/recipes-graphics/libva/libva.inc
@@ -18,7 +18,7 @@ LICENSE = "MIT"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/libva-${PV}.tar.bz2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
-SRC_URI[sha256sum] = "258ed409458d3e7a000e1908bc852619615ee6a933359c745fcd93eb3e461eca"
+SRC_URI[sha256sum] = "115faca0db2c417a37da49830870e260450fa13066f5e24e252a20c36d920a1c"
 
 S = "${WORKDIR}/libva-${PV}"
 
diff --git a/meta/recipes-graphics/libva/libva_2.15.0.bb b/meta/recipes-graphics/libva/libva_2.16.0.bb
similarity index 100%
rename from meta/recipes-graphics/libva/libva_2.15.0.bb
rename to meta/recipes-graphics/libva/libva_2.16.0.bb
-- 
2.25.1


