Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55880CCA482
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 08:45:45 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web12.51544.1658306735539850883
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oWqYJmJf;
 spf=pass (domain: gmail.com, ip: 209.85.218.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id va17so31882371ejb.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e3r6RRbKy8EqoV4jiVjyHGP3OgaLj3HdglmX5hPSwsA=;
        b=oWqYJmJfehZZW0LQI9Y4jGl23dEcvbEUMFLn4/1PKPljbgg1IRf8CmIZckIEanJ09Z
         xp1N08ml9HAaeu0ss1JdzMSYsXE1Dw/RV+aYLgUhlCKaOHtK8/nC/5Q50U4yOR9HMqQx
         WviFGKAv2NWr5OKdgGcKBR3buuJtRpWBzkgFz0moxueDzB2D744vG4jItLwL50ybTgtk
         xF4FH/jfsM25763YehKBQMx+T6IR+mitpJlkNlU2yN1Jg1gqD8S0U5VjFx2pNHWHtCBM
         XANKl6s6djD2BjgAUTVD7ocTmjGLp/G8pBEh2JsTnjm667mJEyiIWOQduuaab6ckiJX+
         geQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e3r6RRbKy8EqoV4jiVjyHGP3OgaLj3HdglmX5hPSwsA=;
        b=8H5uYvA8+BIEv4Bp+Mz4EzO1k1rxk8oRICPd7rhat25Y/XSPQeB7fNTnBPij36vaj2
         +z5j74Q6lTY/2OYj9DF2BL+dNVR6YN4yg/ZCodye9ab+NMq6bulFBcWL3fhmN/ElUEKi
         oLC6LbjBe7NJsXgONp6smuPzAQ+qlhcuMQwgK9C6JNxJ3twIJVntFZXRPxJ1N7P5/+Pg
         Yc1RunGoNPC9pYwX3ok5LuAzN83CAZMlLyrVeBPeejXmIcX18gMhpqNd/L2iw8byyCJ9
         dZgE9cgu5kzc59P1vTV80sEOYzvUxltGl4MYLH4BMPGHw04wGxtt6eSRlB0+0rpmiU4k
         XN6w==
X-Gm-Message-State: AJIora9ekMcbqY/7egaA8+hgqkhzJDwamTZyl5eNKdUxGu8RtBJoLEEU
	cM3I1HxyOGcT/lL5LtG2EjKMu0PKkNo=
X-Google-Smtp-Source: 
 AGRyM1uSirS8agc5l0vQU/pFANS1MDNk800fLhfNShxO6zcPHI3ZjOG1kMh5KC4d+A6KzyYNUoJdwQ==
X-Received: by 2002:a17:907:7637:b0:72b:3a3b:7d68 with SMTP id
 jy23-20020a170907763700b0072b3a3b7d68mr33194490ejc.566.1658306734093;
        Wed, 20 Jul 2022 01:45:34 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 s9-20020a170906a18900b00722e5b234basm7781784ejy.179.2022.07.20.01.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 01:45:33 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 45/51] python3-zipp: upgrade 3.8.0 -> 3.8.1
Date: Wed, 20 Jul 2022 10:44:36 +0200
Message-Id: <20220720084442.2940187-45-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220720084442.2940187-1-alex@linutronix.de>
References: <20220720084442.2940187-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 08:45:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168339

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/{python3-zipp_3.8.0.bb => python3-zipp_3.8.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-zipp_3.8.0.bb => python3-zipp_3.8.1.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-zipp_3.8.0.bb b/meta/recipes-devtools/python/python3-zipp_3.8.1.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-zipp_3.8.0.bb
rename to meta/recipes-devtools/python/python3-zipp_3.8.1.bb
index f1fd383842..fa2f7bcf90 100644
--- a/meta/recipes-devtools/python/python3-zipp_3.8.0.bb
+++ b/meta/recipes-devtools/python/python3-zipp_3.8.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jaraco/zipp"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
 
-SRC_URI[sha256sum] = "56bf8aadb83c24db6c4b577e13de374ccfb67da2078beba1d037c17980bf43ad"
+SRC_URI[sha256sum] = "05b45f1ee8f807d0cc928485ca40a07cb491cf092ff587c0df9cb1fd154848d2"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-- 
2.30.2


