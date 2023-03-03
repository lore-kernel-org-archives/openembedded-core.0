Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26B12C7EE37
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 16:17:47 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.27598.1677860256132335378
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Mar 2023 08:17:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=vkMt0j9i;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id n6so3190018plf.5
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 08:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1677860262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MWMi79EH1gDn7Eydgj/2DR3muAh142q0eE5bl72OeBI=;
        b=vkMt0j9iqog93rRAIYEaj17ig6G6uhTf8Af2p8ohHPeCzf0uiSrxPDf2lEMXzw2u8L
         SQcnRhfAgGoMPf44NGaaJAOy0Fuh+gjt0DVxmvry36inCSa9ojWF2ElA6EeF6jKbNmKv
         PxQuDwfN4LFEVpjaazSq2FIvSKQJWIgdxvDnx8nAcbGvyGqLDbwCfiNHCAaxwMyNPSEn
         T4sPJPOavT0r2t5uLK3v7zbHXkC7RG5YLxzWItRCfaoiidHr1WmbU7VaKO0xyL3fHelT
         fjTsD+bin2KFUQYzbd/STsG6zMiEY1yEryxHcKiOnnBvTCzkhApMKfmOyCyCMzC5O+tT
         CpKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677860262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MWMi79EH1gDn7Eydgj/2DR3muAh142q0eE5bl72OeBI=;
        b=Jk62rsc4twVKHJJhGt2y58Zh5tWb+REJusfpjZC+osBKLEKSIjJJMIa7XgU2nj7Z1a
         AeYJWdSwPC+/c4zOhE8Jt+5WLrpe+uxaCP6CrWSlJHhB4dn07x28UUvjeeVxZiNp8OaM
         zYVCM2Rz1LtulI8g02O+i9ZB/SZHKyZ/kFruheTT2Arf8YX2LPfKjNBQfdR7BJbjfoLl
         lsUkchsVbpe4Y8hnERsh281hIumK5xXQETwvSsJaYDBt/Ua3KR70qQ1i5drjcYBE0HgA
         we+X1zHaC/sFbLEpWRcDWo1ZqelOUuwhxBhwmhCs8ZgF0Fv0anf54s0irYdIb8Iq2oRz
         iiNQ==
X-Gm-Message-State: AO0yUKUVF3PrSndWAWkkhXdJfHNiu/L/m3KBUb5Bsf/UYmuUXOiU1FjF
	mrfF2JW1NDtLBBbEoxzbludUT3b74yk/lXBinKE=
X-Google-Smtp-Source: AK7set+05c/e/pA7cxd/KQUcVMyNoNzD1aoxthv2CH56YaJMo2Lmg3R752KhGNdXzLHDbBR5jL1mxQ==
X-Received: by 2002:a17:902:720b:b0:19c:cf89:b7ee with SMTP id ba11-20020a170902720b00b0019ccf89b7eemr2049648plb.69.1677860262251;
        Fri, 03 Mar 2023 08:17:42 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id ko4-20020a17090307c400b00186b7443082sm1702474plb.195.2023.03.03.08.17.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 08:17:41 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/29] xserver-xorg: 21.1.6 -> 21.1.7
Date: Fri,  3 Mar 2023 06:17:04 -1000
Message-Id: <cf43326913e18d82555878599c14d31a97cd19ea.1677859897.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677859897.git.steve@sakoman.com>
References: <cover.1677859897.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 16:17:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177995

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


