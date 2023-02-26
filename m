Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ACF9C6FA8E
	for <webhook@archiver.kernel.org>; Sun, 26 Feb 2023 17:02:36 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.69575.1677430954815609352
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Feb 2023 09:02:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=MlpXnNyF;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id ky4so4430764plb.3
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 09:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MWMi79EH1gDn7Eydgj/2DR3muAh142q0eE5bl72OeBI=;
        b=MlpXnNyF6GYXcQeBd3bxrFD6sFf7en9r8EcHiPcyI5qz9fBRXjcYslXZEeyeJ2u4nV
         oCVY4MAAZMBuvjN6S4M6sIDdSJM/uFLPwnilqOosrIMHUOCJu3Ie8GGOHiOC9j+mBt1m
         Aq9DEO9edIUKljUSrKDbYiU8+G5eejJZm+RCWDOzymlXJZJd3czVpfS6Lgz8fa8Aj11t
         qgkjMg4uraAeE6H45v3BYvCLK9VcQT/AXptJr1Yuq5DOnmIFz+ti80mZvvhmNy7GaS63
         D/HBhgm8CjqesmMgVOqOvwwo3BJaBC8oFq91Nmg/nbQtnJJ+XhbHw64uwjJOm+5Wtzbj
         hCDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MWMi79EH1gDn7Eydgj/2DR3muAh142q0eE5bl72OeBI=;
        b=R5uOqYBYSC5z4iClWurBRfeWPxmFrMLFV74Z/WQBbyWmRRvBKpHUMyHHyXVL0MsDvK
         k15rNbmT/RR9KJ2a51eVK3pQ94oZR92kIssrC7GJq7cJJIdJ0etUel0CWa+2ryPccwuY
         I+D8R60Bgf0KOakwjqsz73ujDOpP/SN/V/lyLdkmyQGq6TVQTaHFFUZgnRHiPM4h8M/h
         +uIfJJxOPP193U0m1KYFX4LDg2pb2mPJYJwejn5/I9OSUEOaX4rcuCU+/AYMEXnSuBJc
         rajV013VYKxyF1f9RRJ3Vffu6EUE8M0lbvNOhf9zH8n9XmSPdNazRSNxZA97KJ7DB90J
         OBrw==
X-Gm-Message-State: AO0yUKXKktVuKNlJW8bKeQnQ5WAWuwppJnRfcy6gVa84K/eEoMxPj/y8
	c/VJSUBcAn7ZeCpntkzjS5gNceCZhsQg7fBOps0=
X-Google-Smtp-Source: AK7set8dJOtE/o6V1LxWenphreMEYHUcJj/ZEI9VTxXrR+hGTt8RTaCGWPnNwU+37lyzrMt68hw8YQ==
X-Received: by 2002:a17:90b:3ec9:b0:237:d59d:5f89 with SMTP id rm9-20020a17090b3ec900b00237d59d5f89mr4300421pjb.4.1677430953863;
        Sun, 26 Feb 2023 09:02:33 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id s25-20020a63af59000000b004f1cb6ffe81sm2500856pgo.64.2023.02.26.09.02.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 09:02:33 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 02/28] xserver-xorg: 21.1.6 -> 21.1.7
Date: Sun, 26 Feb 2023 07:01:58 -1000
Message-Id: <0cb63762057bae8bf3b1ce088ba4d31f6ebd770f.1677430770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677430770.git.steve@sakoman.com>
References: <cover.1677430770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 17:02:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177740

From: Kai Kang <kai.kang@windriver.com>

According to the ANNOUNCE of xorg-server 21.1.7[1]:

This release contains the fix for CVE-2023-0494 in today's security
advisory: https://lists.x.org/archives/xorg-announce/2023-February/003320.html
It also fixes a second possible OOB access during EnqueueEvent and a
crasher caused by ResourceClientBits not correctly honouring the
MaxClients value in the configuration file.

Finally, a bunch of Xquartz updates including the ability to correctly detect
ssh-tunneled clients as remote.

[1]: https://lists.x.org/archives/xorg-announce/2023-February/003321.html

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 60737bee6466e206d8f3c751910dfce00b60d703)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{xserver-xorg_21.1.6.bb => xserver-xorg_21.1.7.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.6.bb => xserver-xorg_21.1.7.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.6.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.7.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.6.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.7.bb
index 256903ce5f..212c7d39c2 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.6.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.7.bb
@@ -3,7 +3,7 @@ require xserver-xorg.inc
 SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
            "
-SRC_URI[sha256sum] = "1eb86ed674d042b6c8b1f9135e59395cbbca35ed551b122f73a7d8bb3bb22484"
+SRC_URI[sha256sum] = "d9c60b2dd0ec52326ca6ab20db0e490b1ff4f566f59ca742d6532e92795877bb"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.34.1


