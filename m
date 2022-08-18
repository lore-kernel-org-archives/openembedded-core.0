Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACFB1C25B08
	for <webhook@archiver.kernel.org>; Thu, 18 Aug 2022 01:46:08 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web08.37323.1660787163716037422
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 18:46:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AlFZ9MgV;
 spf=pass (domain: gmail.com, ip: 209.85.167.53,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id w5so342746lfq.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 18:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc;
        bh=cts1GAUCb8Q54F/F+8aulDCpZfAHd0esdOd9hQw7uPo=;
        b=AlFZ9MgVqO0ES8u6ZQ8OGOxV6Z/qQrirg48LFBaQvWiIk/0wHFcIRuaXJnoEB86ISe
         5RxCzOLtU+SMr1nToopuFwrXIfJg3xa+I7aVLig1V4qh40WNu6/jWea39B2U9lCoOdnT
         rKqm9u+m97oLvchirFHo10Ye8D8laf1Y8cYF2D106NntJKFAJCnjhqyBwhxAzRxczxP7
         j4gMMMYv7I6CF5xQmyRwdcbP0l/lRrPC7oiDtxYuP017FjRucrdCUlwxzxzkmK/xSyOh
         D5vPjwADpgpnLbgxpGlV4JqFwWzpLJUuv01bkMu532TMYeFjoJznLSGkZEdeseFAr04h
         cLEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc;
        bh=cts1GAUCb8Q54F/F+8aulDCpZfAHd0esdOd9hQw7uPo=;
        b=2znI75UgUt8jQMe71OXnHbYxuO6n8W+YT1v5PzXv3Ld+DLinrtWjVK3CmjFO1NAX5p
         iUHKc0A5sVemjFrF41Axzr2eBn1aFlvdzqgawmu3RN0mmlSOuorZfF6nMnmaY51le0Aa
         s35k+nAUrD7fCpRmiJVKqusRmV4KXJkmm1ltrDZ+VSnyR4fPjpWZPano8Q0G6XXWYYtr
         SSs8N+lpcl+/bk3BPRU6pqjOvKAy4xKpqAGnC8+K/4Sn4haVkvx/UOALJ6pR13XXQOxB
         Q70D6WZM69lShgP/IL+X6qvjv5n9KpRQwL+cJRy1FyFaSCg/5IJ5MBq6GrujixFBLgLE
         soiw==
X-Gm-Message-State: ACgBeo1Z0/FdUOVG2QreheyR0eYFb2nLmvd5kx9agSzocJeY4sH6I8GG
	zpxDycMFlqQpL2SE1kIl3a/OunyQbH0=
X-Google-Smtp-Source: 
 AA6agR5La3qXwMoPzkhNRODs1zlRUoi2bwW0BpUemNdSfBurUKTruKkjZ7oycufdH5mK7ohJI9gO/Q==
X-Received: by 2002:a05:6512:2291:b0:48b:492e:ef35 with SMTP id
 f17-20020a056512229100b0048b492eef35mr266899lfu.494.1660787161524;
        Wed, 17 Aug 2022 18:46:01 -0700 (PDT)
Received: from localhost.localdomain (89-253-118-72.customers.ownit.se.
 [89.253.118.72])
        by smtp.gmail.com with ESMTPSA id
 a16-20020a056512391000b0048aa9d67483sm24162lfu.160.2022.08.17.18.46.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 18:46:00 -0700 (PDT)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-cython: Remove debug lines
Date: Thu, 18 Aug 2022 03:45:39 +0200
Message-Id: <20220818014539.6376-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Aug 2022 01:46:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169510

Fixes: ccbbed323b5a96bbdaec4411fdd26cb9dca583e8
       ("python3-cython: Update code to match debug path changes")
Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 meta/recipes-devtools/python/python3-cython_0.29.32.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-cython_0.29.32.bb b/meta/recipes-devtools/python/python3-cython_0.29.32.bb
index 28a1386310..8fed1cf94d 100644
--- a/meta/recipes-devtools/python/python3-cython_0.29.32.bb
+++ b/meta/recipes-devtools/python/python3-cython_0.29.32.bb
@@ -29,9 +29,7 @@ cython_fix_sources () {
 		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Runtime/refnanny.c \
 		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Tempita/_tempita.c \
 		${PKGD}${libdir}/${PYTHON_DIR}/site-packages/Cython*/SOURCES.txt; do
-		echo $f >> /tmp/rp5
 		if [ -e $f ]; then
-			echo sed -i -e 's#${WORKDIR}/Cython-${PV}#/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}#g'  >> /tmp/rp5
 			sed -i -e 's#${WORKDIR}/Cython-${PV}#/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}#g' $f
 		fi
 	done

