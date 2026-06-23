Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EF35CDB470
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 08:22:59 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16357.1782202972068351354
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 01:22:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=EFiZu2do;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+UacTfXKJBWvv7xcg3t9ENVNKTOoPnlh1e3oGaKzhS4=; b=EFiZu2doa+XrH3TT0WANaPldch
	TN73dV8tHyP1setr1bjxtz7VGPcNGyHhsrQds9lZAA0AEegp3BLvdFoHjgJyPb+ibgI3l9c/KAlHa
	/moeju8NB5fj0lv6YmOTcQAJibjqoCQ5dupfGlBe1f0H4SizScXF3tloSrO/RJA+HaQi6XB5W9vnv
	LcD9dj7yC5CoMiX0IfZ4jy6ItHV3gxBjFyhsZJmw/56Xm7dpEOVupILVqdjpj0jlpw0oXblhP4DtT
	BADwQB2Y8be4Qo6220Mx0XTAhqYB6DqcEfdB5Q6nM2ZXhtwmouf/J2W8VhpBbG9dkmTQh4C/jZNAz
	7kccPuAg==;
Received: from bras-base-otwaon0916w-grc-51-67-71-147-190.dsl.bell.ca ([67.71.147.190]:36122 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wbwPA-0000000CVyp-3psM
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Jun 2026 04:22:50 -0400
Date: Tue, 23 Jun 2026 04:22:41 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: [PATCH] recipes.txt: correct misspelled "utilties"
Message-ID: <664e91ff-13a6-d469-d92b-d6ab7b57a27d@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 08:22:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239340


Fix "utilties" to "utilities".

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/meta/recipes.txt b/meta/recipes.txt
index fb2c25014d..f79197df14 100644
--- a/meta/recipes.txt
+++ b/meta/recipes.txt
@@ -7,7 +7,7 @@ recipes-extended     - Applications which whilst not essential add features comp
 recipes-gnome        - All things related to the GTK+ application framework
 recipes-graphics     - X and other graphically related system libraries
 recipes-kernel       - The kernel and generic applications/libraries with strong kernel dependencies
-recipes-multimedia   - Codecs and support utilties for audio, images and video
+recipes-multimedia   - Codecs and support utilities for audio, images and video
 recipes-rt           - Provides package and image recipes for using and testing the PREEMPT_RT kernel
 recipes-sato         - The Sato demo/reference UI/UX, its associated apps and configuration
 recipes-support      - Recipes used by other recipes but that are not directly included in images

