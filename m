Return-Path: <nishaparrakat@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55207C433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Feb 2022 07:28:51 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.45855.1643700530043669431
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 23:28:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UF/xd1wi;
 spf=pass (domain: gmail.com, ip: 209.85.221.54,
 mailfrom: nishaparrakat@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id s9so30063552wrb.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 23:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=N5E0IhPAgzt4mS/rpxyjaw/klfct6P1KmC1fQMl3l9g=;
        b=UF/xd1wipXLON/9uiESzVJ5AnkuQ0toP94kABv+anGHL413IaKpTH/vFxrjxwyVkfx
         /XpY9E0r+2K8maHKKilJuDJsens9+yYXLBz0skZzWRg0eRuo0w+Vtt0jCrWDoEmbjEtI
         XxM46ZJ+liHAl0rCnC+HdU+nkDZfTW77uL4NJdhAzSQiv+WtPut+MA6uxRE4yhYsCSoQ
         FGzkfBQ1tNMMUqxV2q8fwO9pl6tjsanhyrciLuZUBDbwzPdBI1gSzyq/UuQBTP56lqos
         vkOVl9sT0dDMruyOrxFXqTqjCdvCpFGenGMAF7jxVULhpJZ1fwFgvWVzAeNQHvyFdIOn
         17pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=N5E0IhPAgzt4mS/rpxyjaw/klfct6P1KmC1fQMl3l9g=;
        b=L6OSaZa505zKuPKC64gWWK1lff4TDyZzZhKcxdgw8nHv/3edIInP4suXQD3ae3BMiX
         4itQAkpyjLOvb8dld/8Aq6gBzVn3TxcdhNiJB5209u5W2vGlPg0D6RdFftCwE8H9ms7u
         56ksg5oEOGFW6QFmFKxZ1LINNPB/2I1KJt60NNKiYtBcPiL1AtM8/eIkxNRAPwyk1mZ1
         yeyorpsTMS3PPOPlygpcoYfz3nn979+sso5dT9anHS9ojJzkwJ9Rf4hee4oUjSqZe0Tb
         hANr9DhLPt+i36jAzw5BZuXp0Ewgk9/zxUPSvuSg+aqluewsQLATEpeuuKbwNoRhSgGz
         Xs3g==
X-Gm-Message-State: AOAM530sA+QvE9d2MaB/eI7Cz/jK8RVnXv+jFpjxMqEyvAQBRiD6TFVF
	oQ892f148q51xX6vKVy5/p2FxmdkmH4=
X-Google-Smtp-Source: 
 ABdhPJz5pdi+INGivy3b02ykWUGf/77SY93d7I3qJzS+IiK8IEc2rLDKPxFfVvQtazDAxnCOtJunLg==
X-Received: by 2002:a5d:47ad:: with SMTP id 13mr232440wrb.297.1643700528595;
        Mon, 31 Jan 2022 23:28:48 -0800 (PST)
Received: from nishap-at-office.bmw-carit.intra ([212.118.206.70])
        by smtp.googlemail.com with ESMTPSA id
 n18sm13667370wrm.47.2022.01.31.23.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 23:28:48 -0800 (PST)
From: Nisha Parrakat <nishaparrakat@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Nisha Parrakat <nisha.m.parrakat@bmw.de>
Subject: [poky][dunfell][PATCH 4/8] e2fsprogs: Use specific BSD license
 variant
Date: Tue,  1 Feb 2022 08:28:27 +0100
Message-Id: <20220201072831.34695-4-nishaparrakat@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220201072831.34695-1-nishaparrakat@gmail.com>
References: <20220201072831.34695-1-nishaparrakat@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Feb 2022 07:28:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161148

From: Joshua Watt <JPEWhacker@gmail.com>

Make the license more accurate by specifying the specific variant of BSD
license instead of the generic one. This helps with SPDX license
attribution as "BSD" is not a valid SPDX license.

(From OE-Core rev: 966fb77981e4fed0ab7998439940b1e05dd0ee43)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Nisha Parrakat <nisha.m.parrakat@bmw.de>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs.inc | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
index 45fb9720ee..08fb30fc71 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
@@ -3,12 +3,12 @@ DESCRIPTION = "The Ext2 Filesystem Utilities (e2fsprogs) contain all of the stan
 fixing, configuring , and debugging ext2 filesystems."
 HOMEPAGE = "http://e2fsprogs.sourceforge.net/"
 
-LICENSE = "GPLv2 & LGPLv2 & BSD & MIT"
-LICENSE_e2fsprogs-dumpe2fs = "GPLv2"
-LICENSE_e2fsprogs-e2fsck = "GPLv2"
-LICENSE_e2fsprogs-mke2fs = "GPLv2"
-LICENSE_e2fsprogs-tune2fs = "GPLv2"
-LICENSE_e2fsprogs-badblocks = "GPLv2"
+LICENSE = "GPLv2 & LGPLv2 & BSD-3-Clause & MIT"
+LICENSE:e2fsprogs-dumpe2fs = "GPLv2"
+LICENSE:e2fsprogs-e2fsck = "GPLv2"
+LICENSE:e2fsprogs-mke2fs = "GPLv2"
+LICENSE:e2fsprogs-tune2fs = "GPLv2"
+LICENSE:e2fsprogs-badblocks = "GPLv2"
 LIC_FILES_CHKSUM = "file://NOTICE;md5=d50be0580c0b0a7fbc7a4830bbe6c12b \
                       file://lib/ext2fs/ext2fs.h;beginline=1;endline=9;md5=596a8dedcb4e731c6b21c7a46fba6bef \
                       file://lib/e2p/e2p.h;beginline=1;endline=7;md5=8a74ade8f9d65095d70ef2d4bf48e36a \
-- 
2.17.1


