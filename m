Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37CA8C433EF
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 19:41:40 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web09.1033.1651779699067133229
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 May 2022 12:41:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bE+4BZIY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id p189so3251727wmp.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 05 May 2022 12:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vfh37JfWG7rEKEDU1JR9ED7GNIHK1YWxMIMfg/FAg7c=;
        b=bE+4BZIYfKtsroXZB+ivOVsEYCQq0sIOorDmGG3FDZGqPRqC8XSq7NDUDGUP8NKC9/
         p+RDKjypyPBvYELQt4U6+JRuLj9OrdAtZ0nNLpogK81qZ3peuwpC2XaXo3IZV+zuAOPa
         5NtCMbZfWUrUw3QZbJDKCnK68kcg08x8163As=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vfh37JfWG7rEKEDU1JR9ED7GNIHK1YWxMIMfg/FAg7c=;
        b=7O8rJ8XVoYnLeN0L1/0997qkNCDqIfZsUIgUVdmDkDAhP2zmUcOBg2ePh0onuZlLC0
         7JdzXUQjadeo+HCyJZcWLy8YOJovlh49NAmd2ZRRcSGd2SOHxRfCv2p+drAMejUAWugR
         /uQu1zgEiL9oBLzbQpLufc1cCcPy+F5R9BvqSVNivYYR4Dxe7j6bgKATiuY/2ufu+29u
         YnTIKiDwZaRilBZtsAN+CNgL0qUinmaj5b/Fy5WoV7iCU8BlqhcvmnknIiRgkCQSHgDz
         /FfQK/EOb2kU12QpgxnRUfT8vefKFMNq7o7oIYKaGXSLL1SIYOiCAdvKrdTrkjYP6wzj
         /5Nw==
X-Gm-Message-State: AOAM530kXL7uAvdigCkrH0V5hYQ3BFtra6cYQXWjK6tBocY6HJa/r6nf
	1Evz+Na1EJ+HcSRVDpy2tCjtpiETj5xA0Q==
X-Google-Smtp-Source: 
 ABdhPJwtrzuqfYiHdS45mza4FcWaU2d6WHcbj7FsgmigmjF3BXRgbntTzNJ3KgINZmCJZZYkvpkDww==
X-Received: by 2002:a05:600c:3b15:b0:393:eb14:bb5 with SMTP id
 m21-20020a05600c3b1500b00393eb140bb5mr6512771wms.129.1651779696594;
        Thu, 05 May 2022 12:41:36 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:28a1:bf56:60b5:b14c])
        by smtp.gmail.com with ESMTPSA id
 c17-20020a7bc011000000b003942a244f40sm7165474wmb.25.2022.05.05.12.41.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 12:41:36 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libgcrypt: Drop GPLv3 license after upstream changes
Date: Thu,  5 May 2022 20:41:35 +0100
Message-Id: <20220505194135.3112104-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 19:41:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165310

Upstream removed the GPLv3 component to the license here:

https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgcrypt.git;a=commit;h=fbb26c3ac514189f50a31f72dde2a02ef7b41f9f

Update our metadata accordingly as there are now no GPLv3 components.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb
index 251e0d0348a..bc41b026d66 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb
@@ -7,10 +7,9 @@ BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
 SECTION = "libs"
 
 # helper program gcryptrnd and getrandom are under GPL, rest LGPL
-LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later & GPL-3.0-or-later"
+LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
 LICENSE:${PN} = "LGPL-2.1-or-later"
 LICENSE:${PN}-dev = "GPL-2.0-or-later & LGPL-2.1-or-later"
-LICENSE:dumpsexp-dev = "GPL-3.0-or-later"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff \
@@ -52,9 +51,6 @@ do_install:append() {
 	install -m 0644 ${B}/src/libgcrypt.pc ${D}/${libdir}/pkgconfig/
 }
 
-PACKAGES =+ "dumpsexp-dev"
-
-FILES:${PN}-dev += "${bindir}/hmac256"
-FILES:dumpsexp-dev += "${bindir}/dumpsexp"
+FILES:${PN}-dev += "${bindir}/hmac256 ${bindir}/dumpsexp"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.32.0


