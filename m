Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50B70F8FA8F
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 15:03:56 +0000 (UTC)
Received: from smtp-42aa.mail.infomaniak.ch (smtp-42aa.mail.infomaniak.ch [84.16.66.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33722.1776783826497760459
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 08:03:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@0leil.net header.s=20231125 header.b=i4mx61uE;
 spf=pass (domain: 0leil.net, ip: 84.16.66.170, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4g0Qbh0m72zpRg;
	Tue, 21 Apr 2026 17:03:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1776783823;
	bh=mFbccGHV5yu/GEmwpCPWdyLigmwdWxXgNB+fJX1tYSM=;
	h=From:Date:Subject:To:Cc:From;
	b=i4mx61uEcCvR0Lh+Yqtypzt5gkE110BXWuhNuZEKqsNZJhO0F4S4CK7oIRLv7TEyc
	 5/T7lQwgGf/wISKYc42miFIM1ZAB5sbHMnMbXzAqrsnySnpWUu6mc7Drej2iiMxhRK
	 rJWIYLq4K5KT71deXs4o4gqmFc4zi14oAZZzcdbus3rbYs7F13pTg94Wpa3i2Kcfba
	 ClnRaDSXgTFFuN7BWPMXlzJO+wPCHBxk3MQ2ECd9WFfuxx9LfqxR4rdsbUEx7cdmiw
	 lqm5idyAItJg0EsTDsX1YQENys2ON8z4tYh3pFwfnm1iakPnw7Ak+55KosOTzdrZbl
	 BhM1L0/FGXTqA==
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4g0Qbg0xbmzD7l;
	Tue, 21 Apr 2026 17:03:43 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Tue, 21 Apr 2026 17:03:30 +0200
Subject: [PATCH] mesa: upgrade 26.0.3 -> 26.0.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-mesa-26-0-5-v1-1-a971b5770c18@cherry.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEyND3dzU4kRdIzNdA11T3cTklDQTC2NzYyMjMyWgjoKi1LTMCrBp0bE
 QfnFpUlZqcgnICKXaWgCC/0MvbwAAAA==
X-Change-ID: 20260421-mesa-26-0-5-acdf48373226
To: openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 15:03:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235683

From: Quentin Schulz <quentin.schulz@cherry.de>

This bumps mesa to 26.0.5, the latest available version.

See https://docs.mesa3d.org/relnotes/26.0.4.html and
https://docs.mesa3d.org/relnotes/26.0.5.html for the Changelog and
checksum.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Runtime tested with kmscube on Panfrost and Panthor Mali GPUs.
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index b3ad9d8a54..01f7e3bcea 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -20,8 +20,8 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-gallivm-Fix-armhf-build-against-LLVM-22.patch \
 "
 
-SRC_URI[sha256sum] = "ddb7443d328e89aa45b4b6b80f077bf937f099daeca8ba48cabe32aab769e134"
-PV = "26.0.3"
+SRC_URI[sha256sum] = "d229c9937d9a25ca0a8958c59f425174563d300ec42acbea2dbe84a055023368"
+PV = "26.0.5"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 

---
base-commit: 9a83f0878b6bacbc7b322cfec076b4e79ad7b8fb
change-id: 20260421-mesa-26-0-5-acdf48373226

Best regards,
--  
Quentin Schulz <quentin.schulz@cherry.de>


