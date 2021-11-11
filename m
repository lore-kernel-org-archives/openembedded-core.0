Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07C10C433EF
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 04:09:09 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web09.6221.1636603748036987378
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 20:09:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Q1K1jmWZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id k4so4692880plx.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 20:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ZHaoFptP0aFqugxVH2SMOhxuiJpZcAXn72h41B9MAfM=;
        b=Q1K1jmWZ80/pBnz9JgAN18ivy87In6E+HKvMVRybWFsgV0Q7do2wvXxkX+BEdCcfIG
         VbFRFJ8MSBpcsZRayjgPL9rq5PIWjIouQNyz9Ie1/XaItsmyqFZya+uj+AW1TRqYzOae
         SFnxeeh4lZ9BDO2U56cVXKZELzRiE9JIOth4YGdWPQEKovb4xcbE3w3qVwg9vuIepu4S
         FGjUcEvKna8oEa402EORhUQppbzDx+ff08HyI5uoLJ7JeYeCnbQ9okqn1anKVw0WOvvg
         NBy88tBj0iZ1lQHUpljDviN9Iji1aFuMXAVueCmPZeKOXOltRWDD+0N/mOCfoKPDH6hM
         0ZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZHaoFptP0aFqugxVH2SMOhxuiJpZcAXn72h41B9MAfM=;
        b=LiYBhktd/SyBKpQZt/UNcGGsUnHxnSNj6+u2yQjpJCkmkHCGcZuuWS/XR9QVmaiyTR
         3P7PvPr5PU/bOJ35C1Dio0ASURarDW1U1/8xfBIGLyqR/UCAUAPyeXRTPev++gIN8eEW
         8CTvMCZqeqNpaHepR2K4SShcxv6z0zN/XNBz5HB/Ar9bWusqjms1FopOb1QutENpqk6z
         J9P4CZmzBvgn/gYe1LcW1hTpGcPlTYQdeSHFADOFM/4UmzCT15biDuroRjoaaycplw61
         SlHO/ZRVU/hrkkitAxsrAiXdGmm5BD0dc8Q+m6bBgTx82MSAL4zzNcdMqWx0zpkemDLV
         h6UQ==
X-Gm-Message-State: AOAM533CFYaX8phEypsjtgNF3P26amPsxlY0a6NPCtNTQAU29yiSnLX0
	5WHWpOLjW+a+iikAteyt62L5j3nsxZ8XOs27riA=
X-Google-Smtp-Source: 
 ABdhPJznWYZV7xgVycxmn+BR/pIU8bGlgzdjg6ogvLxj0ADsA2PQptGbBphoQVdNQemkMkiu66Ud9w==
X-Received: by 2002:a17:90a:c398:: with SMTP id
 h24mr4960671pjt.73.1636603747032;
        Wed, 10 Nov 2021 20:09:07 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 i2sm1207686pfg.90.2021.11.10.20.09.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 20:09:06 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/14] python3-magic: add the missing rdepends
Date: Wed, 10 Nov 2021 18:08:28 -1000
Message-Id: 
 <ba5562d34653fa6b5819dbc8ca80a42167c38c96.1636591208.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1636591208.git.steve@sakoman.com>
References: <cover.1636591208.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 04:09:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158135

From: Mingli Yu <mingli.yu@windriver.com>

Add the missing rdepends to fix below error:
 # python3
 [snip]
 >>> import magic
 [snip]
 ModuleNotFoundError: No module named 'ctypes'
 ModuleNotFoundError: No module named 'tempfile'

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 115791844124bdddfbaec9d75bb887ef35c41f20)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3-magic_0.4.15.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-magic_0.4.15.bb b/meta/recipes-devtools/python/python3-magic_0.4.15.bb
index 698016ba4c..09b24fb7f3 100644
--- a/meta/recipes-devtools/python/python3-magic_0.4.15.bb
+++ b/meta/recipes-devtools/python/python3-magic_0.4.15.bb
@@ -14,6 +14,9 @@ inherit pypi setuptools3
 SRC_URI[md5sum] = "e384c95a47218f66c6501cd6dd45ff59"
 SRC_URI[sha256sum] = "f3765c0f582d2dfc72c15f3b5a82aecfae9498bd29ca840d72f37d7bd38bfcd5"
 
-RDEPENDS_${PN} += "file"
+RDEPENDS_${PN} += "file \
+                   ${PYTHON_PN}-ctypes \
+                   ${PYTHON_PN}-io \
+                   ${PYTHON_PN}-shell"
 
 BBCLASSEXTEND = "native"
-- 
2.25.1


