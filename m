Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41949EDF161
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 13:23:13 +0000 (UTC)
Received: from smtp-42ab.mail.infomaniak.ch (smtp-42ab.mail.infomaniak.ch [84.16.66.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71317.1770988986332193959
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 05:23:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@0leil.net header.s=20231125 header.b=T/zrGve8;
 spf=pass (domain: 0leil.net, ip: 84.16.66.171, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4fCCXR51CDz69N;
	Fri, 13 Feb 2026 14:23:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1770988983;
	bh=pN5AEoArgAsQVQm63pQ+arAawmohw/iBRGDxc66Qs6k=;
	h=From:Subject:Date:To:Cc:From;
	b=T/zrGve8mfUfu0hpZAerWtmsufq1g9uTbxJEACxdYIor63ph2Lc85Ha6rfRkUiiy4
	 aYIYRe9J2zHfkQOePsky8+Y50ix3pA+muZl2mnByOwdbQaKa/QyGnRq6jS8jP3Kpft
	 qB72wz/AfrcmIPNfwU+S7Rr4lGM1aiTQ1o62l9LamrZamoPCtzDpErS+CA6TnA9ssy
	 tCiCyovN1eJslIIFiYXWlPNfP4P/tRAbtSEJ1NRmJJiszSIYUQbZcubzz6b4Lfvqxm
	 nn1IOQBO4BMwbdu8Iuf3QbulhbCFqaTbV8ocWIk5aSUKPHlmGIdUjXd0z5kMCgoFt5
	 8mtbtWWJJldWw==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4fCCXR1vf2zqQK;
	Fri, 13 Feb 2026 14:23:03 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH 0/2] mesa: bump to 26.0.0
Date: Fri, 13 Feb 2026 14:22:53 +0100
Message-Id: <20260213-mesa-26-v1-0-9e925e474091@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDI0Mj3dzU4kRdIzNdo7QUs6REc5MUg2RzJaDqgqLUtMwKsEnRsRB+cWl
 SVmpyCUg7VEVRamEp0IoSqLLaWgAKPAbOgAAAAA==
X-Change-ID: 20260212-mesa-26-2fd6ba74d0c7
To: openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 13:23:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231118

This fixes a small oversight of llvm missing for compiling i915 gallium
driver.

This bumps mesa to 26.0.0, the latest stable release.

This is based on top of
https://lore.kernel.org/openembedded-core/20260212-mesa-25-3-5-v1-1-d95fd99f10c2@cherry.de/

Tested on Rockchip RK3588, RK3399 and PX30 (panfrost/panthor) with
kmscube and clpeak.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Quentin Schulz (2):
      mesa: fix missing llvm dependency for i915
      mesa: upgrade 25.3.5 -> 26.0.0

 ...u-drop-file-names-from-the-generated-file.patch |  45 ---------
 ...eno-don-t-encode-build-path-into-binaries.patch | 107 +++++++--------------
 ...on-t-dump-genvk.py-args-to-generated-file.patch |  36 -------
 ...t-drop-file-names-from-the-generated-file.patch |  45 ---------
 meta/recipes-graphics/mesa/mesa.inc                |  14 ++-
 5 files changed, 42 insertions(+), 205 deletions(-)
---
base-commit: 84e278c4cd440fef82408bb23d7e503ab33ac5a7
change-id: 20260212-mesa-26-2fd6ba74d0c7

Best regards,
--  
Quentin Schulz <quentin.schulz@cherry.de>


