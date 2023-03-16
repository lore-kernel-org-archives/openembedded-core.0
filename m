Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B952C61DA4
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 01:12:14 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.2371.1678929133563337328
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 18:12:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fdnAxR+6;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id j13so184804pjd.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 18:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678929133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pM6rEhq5WDyFOsIm+YkO2A1s+etjSLyuleyxhdgy+E4=;
        b=fdnAxR+631EBoZ6uxLWwYxbNx68AYb5SB8QQf60LdeXSA4z0A7vtSio49vTR2OXzAD
         vp5HvFjXKzAuVvrcF/Czet6FqGrexuICz2uv4mMduK7dm0HO++tG2lA7bQC3UlLHfjhC
         UzFl191SPBEfJ+s7v2doGtBvKPQ2RDxTz6/OYgTEpt8nQl5g5tmZDBrzwa4As1e2OQLk
         Ci7h+V5pjT0jeNVluiVec+mtnlE/5l0jL1WSz8jSlrwut/iBP143mYjkFCRhFEun7FFM
         rZlYKe9vo+KcxAuSNmrlBpWSyYZB3OJPqF0y6fpXgK0RoKomME+RyVuKnRwyDReXPyyh
         R1yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678929133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pM6rEhq5WDyFOsIm+YkO2A1s+etjSLyuleyxhdgy+E4=;
        b=viGCA7Pav2y8Iact+SlGTInZo3Yaqt34iyb5U2PgWnAS+1rivnGOqUGh+W+JxCTwcr
         d5rW0AhauOs+UPYEsl+rhtB/2UNrwaWrpWLEpD4712IVknNYc1a4faTqazvztTA8RSss
         YDWlsGR7ovLWcDfoEDEU0VZNVISPMZBnWRsebsZP2USLkOYSI02UHtaU8Cxw9EP0IkDk
         BkNvtbD8+98mFshOhQ58qn8ZkvLDEmtSuC66dt6fYRY8Ag7Jcb45X51+UXz9NkRAebxU
         1ENQ8uwfdOTYWP+MReGTWeBdP0C+XAlztZdYhWCV3wIsDtMlzs62xerm2sRmwLX3u4Jq
         hRRw==
X-Gm-Message-State: AO0yUKXAaP3RHOSMwAiCINJd5v3IuZOrH2syjJ11glg90e1Ttrb0FFG2
	ufMlFLp9SZTJBcNYGiBO51ZuSlFBPCE=
X-Google-Smtp-Source: AK7set+q44wmUJgtOHM4ocsGe6mpdpe2GKxaSinbfUT6KvN/RTP8zRDZpFg/X/M1324GgM1QUNpoYQ==
X-Received: by 2002:a17:903:2887:b0:19e:6a5f:598a with SMTP id ku7-20020a170903288700b0019e6a5f598amr1179632plb.63.1678929132561;
        Wed, 15 Mar 2023 18:12:12 -0700 (PDT)
Received: from nereus.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:66f1:cb87:4495:5f63])
        by smtp.gmail.com with ESMTPSA id l10-20020a17090a598a00b00233e860f69esm1936732pji.56.2023.03.15.18.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 18:12:12 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [master][langdale][kirkstone][PATCH] cracklib: update github branch to 'main'
Date: Wed, 15 Mar 2023 18:12:00 -0700
Message-Id: <20230316011200.3628723-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 01:12:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178671

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-extended/cracklib/cracklib_2.9.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/cracklib/cracklib_2.9.8.bb b/meta/recipes-extended/cracklib/cracklib_2.9.8.bb
index 786940a7e0f..a3db6eb394b 100644
--- a/meta/recipes-extended/cracklib/cracklib_2.9.8.bb
+++ b/meta/recipes-extended/cracklib/cracklib_2.9.8.bb
@@ -9,7 +9,7 @@ DEPENDS = "cracklib-native zlib"
 
 EXTRA_OECONF = "--without-python --libdir=${base_libdir}"
 
-SRC_URI = "git://github.com/cracklib/cracklib;protocol=https;branch=master \
+SRC_URI = "git://github.com/cracklib/cracklib;protocol=https;branch=main \
            file://0001-packlib.c-support-dictionary-byte-order-dependent.patch \
            file://0002-craklib-fix-testnum-and-teststr-failed.patch \
            "
-- 
2.30.2


