Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24C5ECD37B6
	for <webhook@archiver.kernel.org>; Sat,  9 May 2026 22:46:11 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20868.1778366768340390243
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 May 2026 15:46:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=cCaFFx2T;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-2026050922460622decd4af600020768-j3yngd@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2026050922460622decd4af600020768
        for <openembedded-core@lists.openembedded.org>;
        Sun, 10 May 2026 00:46:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=iNGJC8vWjDm3z/aZqfx1sCbVWPgJK8pS2CNT9ne+ZSg=;
 b=cCaFFx2TICaMUVSXm8OyZVsJs6/p9QMTIiq0nxK/Rnf2CPhUV9jP5nh8dcYBeSMbjwiy2s
 m0q1bn7ckxdGHngM5II2VMZldhab0PU9Hb69vY4LohNkuYVWJzgGQuIWL4IK55v8/LYGDSCX
 qgGiuIfYwviJ3oYMqHDgZYlXHd2mjsKYZsyOTASTvOrUqYBhTGiEjP5Xqwr8EgZunwbCRoCM
 1fQbg+IbFAEctm4Ru3CAjBNVpRnUY3OQKG2gPMwyXl+QnPnprt2FG1N4t8dmQg/zvDMdyDoY
 mnz7sC36F1Sd1/gqFe/CXJMAZxf2xL3O7j2124XakOqv+8AbtAksxSgA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 2/4] libxml2: set status for CVE-2026-6732
Date: Sun, 10 May 2026 00:45:34 +0200
Message-ID: <20260509224536.27734-2-peter.marko@siemens.com>
In-Reply-To: <20260509224536.27734-1-peter.marko@siemens.com>
References: <20260509224536.27734-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 May 2026 22:46:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236763

From: Peter Marko <peter.marko@siemens.com>

This is a version-less RedHat CVE.
[1] points to [2] and [3].
These were backported as [4] and [5] in v2.15.3.

[1] https://security-tracker.debian.org/tracker/CVE-2026-6732
[2] https://gitlab.gnome.org/GNOME/libxml2/-/commit/226b560837b90dea9b14431eca6e6fda8fb01ab4
[3] https://gitlab.gnome.org/GNOME/libxml2/-/commit/7cea3fd1557437b88f2c7b5e1b71a2d5fb152b55
[4] https://gitlab.gnome.org/GNOME/libxml2/-/commit/ad0f009a8366860272acb8e05c41a401798f2855
[5] https://gitlab.gnome.org/GNOME/libxml2/-/commit/65d0fe61c6f36ee40431aeb041ea703e839ff60d

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/libxml/libxml2_2.15.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/libxml/libxml2_2.15.3.bb b/meta/recipes-core/libxml/libxml2_2.15.3.bb
index 5c2896d907..3b7a0e3cb5 100644
--- a/meta/recipes-core/libxml/libxml2_2.15.3.bb
+++ b/meta/recipes-core/libxml/libxml2_2.15.3.bb
@@ -24,6 +24,7 @@ SRC_URI[archive.sha256sum] = "78262a6e7ac170d6528ebfe2efccdf220191a5af6a6cd61ea4
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 CVE_STATUS[CVE-2025-6170] = "fixed-version: fixed in version 2.14.5"
+CVE_STATUS[CVE-2026-6732] = "fixed-version: fixed in version 2.15.3"
 
 BINCONFIG = "${bindir}/xml2-config"
 

