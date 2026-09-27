Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88175C9832F
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 16:23:56 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39334.1790526232804840302
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 09:23:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=FXDbisya;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-202609271623499326d0814700020710-v10pyu@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202609271623499326d0814700020710
        for <openembedded-core@lists.openembedded.org>;
        Sun, 27 Sep 2026 18:23:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=cki9Pb013URRQSE5GmZM6PiIhbJrViyRS6QMIra5aRU=;
 b=FXDbisyalebmG5zEEBvSMZ76YBQstO+NeD6On8Mv3jzz9d29wFx94HDQKQkzZgzsfbtIXa
 23/u4ZbVE0c9b7DYZjTwZgPyvYksSQjH091kfrTtyWglnu9CTufSp014s56xwHEPrQdgmB/z
 zwFE847AQ4BqAbUNDNg9hY4/O5XVfqWD6vlGSojcBf4c2rFo5v3PH4YkbWNmn+L/+lZ2X3bp
 ppZ32Dl0NQjLQ1p4l0ccfnbrfyIl0UpI75AxogbFHbzqIBIv+rFzBKNZRAdCinEaYgih1Zh6
 /2lnWgg0dM+AJbc0mmZnnnJ1D6A+U0ujDd9kqgSWKOqCbDTFCqPKf2FA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] libpwquality: add tag to git url
Date: Sun, 27 Sep 2026 18:23:43 +0200
Message-ID: <20260927162343.141485-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 16:23:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246690

From: Peter Marko <peter.marko@siemens.com>

This verifies that the git hash is correct and is current standard in
all other recipes.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-extended/libpwquality/libpwquality_1.4.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libpwquality/libpwquality_1.4.5.bb b/meta/recipes-extended/libpwquality/libpwquality_1.4.5.bb
index a303b9e758..707f789164 100644
--- a/meta/recipes-extended/libpwquality/libpwquality_1.4.5.bb
+++ b/meta/recipes-extended/libpwquality/libpwquality_1.4.5.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6bd2f1386df813a459a0c34fde676fc2"
 
 DEPENDS = "cracklib"
 
-SRC_URI = "git://github.com/libpwquality/libpwquality;branch=master;protocol=https \
+SRC_URI = "git://github.com/libpwquality/libpwquality;branch=master;protocol=https;tag=${BPN}-${PV} \
     file://0001-Use-setuptools-instead-of-distutils.patch \
     file://0002-Makefile.am-respect-PYTHONSITEDIR.patch \
 "

