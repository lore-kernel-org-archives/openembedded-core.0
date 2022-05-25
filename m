Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDFBCC433EF
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 14:36:36 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web09.7491.1653489393222113283
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:36:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=D+mTkFyf;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id a13so8220933plh.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=GOKFpJfGpVb0D8zOa2xO4guyQePTR7l4qBIyyR3Vr4A=;
        b=D+mTkFyfmo5nTB41Nx5If+miOcByNcIy792VK/U05OZQLsTMDCtJCQoq8DRts9Ypbd
         9fSBSJECRmh8Sou9SO1Yxs+4xMYWP9NxcT9qTktyNMktMIbM2BS8CqWSJKVTcYQcqtVX
         m/2znje0zbBkSO8G/Hn2cx+73K430fRHpIH/Y/P1rQ/JpTnKfpVrP+xT1NL42VAlAr8W
         FQP2OU9Ugjhy50zBuOaWx5/lqwu1XHX3jgnp/CqgJMsa+36UqsWH/JPA2YY7RaPWXSs9
         cLCYzwzcHgmcfcx2A7Kb9M4IfcF1fyy+EDLEds/8TNBEJkJBCAqz96B4A5sXAOUcV9KV
         vUPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GOKFpJfGpVb0D8zOa2xO4guyQePTR7l4qBIyyR3Vr4A=;
        b=l5jJE7OEo9AKmyHq/Dqy7sGH0u2RXYWa6KRyXjdbFNWP8Lxv8XRJMfjt/lK7SN2lU7
         hu7T6nadQyavWj4uXSDHA0jV3ka+SMT1NkKdJX9leDgps88tNVkbLf5Ltm8r4lZ1JcSB
         ELXGCGlXy4lEkGw+Be/unDeoYkQRnsKKUqPDKKB51hh/KbHGCrM459/8+QWn+xdm/AEQ
         IIGTsVk1rOqVrp7pYW/Uxo6T/ZGZtdgZooqO29tyZ8/bWRKibhnU6oWcy+tiSP4V2U3P
         iUCjIOOgDNcXPS2+VA4Szu0MhbgDg8jZp6M4yF1cw36lxuXM71BXRMMs1fLCrekVikyL
         Qqpw==
X-Gm-Message-State: AOAM532YzoX7sSrTF/dUHcJhlo72lDYByBy6/fDHzHvHiem8ZxZhEkYI
	wa8G38/77nRX2WPsTxQlzMnGlUfNKJFSvL2L
X-Google-Smtp-Source: 
 ABdhPJzz/8qXBPoKx2ATK9yRSCoFc3xy8dzfMqTJEynNSi1fGb00DNVl6Tk9nHTjXtjjbAtKIfXRSg==
X-Received: by 2002:a17:90b:1a81:b0:1e0:3314:2447 with SMTP id
 ng1-20020a17090b1a8100b001e033142447mr10588366pjb.121.1653489392129;
        Wed, 25 May 2022 07:36:32 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h6-20020a170902f70600b0015eb200cc00sm9399287plo.138.2022.05.25.07.36.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 07:36:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/4] mobile-broadband-provider-info: upgrade
 20220315 -> 20220511
Date: Wed, 25 May 2022 04:36:10 -1000
Message-Id: 
 <9d5b4fdc7ce0458577af5a16b6d7277e3d812e36.1653489126.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1653489126.git.steve@sakoman.com>
References: <cover.1653489126.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 14:36:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166148

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f14c8094e7a049ac1b04c45b76855d0503559932)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../mobile-broadband-provider-info_git.bb                     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
index 781b9216c5..e6f216e5cb 100644
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
@@ -5,8 +5,8 @@ SECTION = "network"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=87964579b2a8ece4bc6744d2dc9a8b04"
 
-SRCREV = "4cbb44a9fe26aa6f0b28beb79f9488b37c097b5e"
-PV = "20220315"
+SRCREV = "3d5c8d0f7e0264768a2c000d0fd4b4d4a991e041"
+PV = "20220511"
 PE = "1"
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https;branch=main"
-- 
2.25.1


