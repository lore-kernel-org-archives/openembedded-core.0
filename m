Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56194C433EF
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 11:24:54 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web08.26289.1653305086880785756
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 04:24:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SRnIUpAV;
 spf=pass (domain: gmail.com, ip: 209.85.221.49,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id r23so20918265wrr.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 04:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XCiTBm6ms3kAaqw8I+yjRmIKZwyPzxDbhICsk6iB1rE=;
        b=SRnIUpAVesOGAlr/cRldoSG6vbNfRJ73JdvAwDSG8WqEI4NXtMM8a6wAoQC4LOjrm7
         sCQGMusOwCm8ry5rYSzYZkVcStWlhPGzi4W4ybikBLT+gcXa7uKoqb1xyfvQ3Kncc3wg
         JhE8Bxi6IbR/CTx6tQI9+BLF6QbzjCybb2IzZZ8rUhuonxTCwwxeBQjRteI2HHR5MqM6
         Xka0XYlUFKDOY87Fy3ylAPZBCqo+lkRyPgi2U+ldzM8F/6RZpnH9RfpBRKBDiPX9IQf6
         iOfTUNyaFbRDfQfcL90XgaVxbj0qaE8kuZ/t+ddVa9vaqP21wqyJetuexPYAxfHgRlth
         93jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XCiTBm6ms3kAaqw8I+yjRmIKZwyPzxDbhICsk6iB1rE=;
        b=AjNPr/x7POrnEmd9Kvy/QrsEIxFe4+wxZkzCUC/TIaj+mbY5gSnZ7T0/fjx3OjHu/k
         FgNNKzIxhm4IXObGQA8F34NoKaT0Tw3OO4qK7ebj0+VQaggh8e3+U5AFjA6HERygqKSj
         ToYJ7WKjk2ifIseLY8RMAp/CTTcxudT8HdgG875edls8lbzihHBwOgmNGxcnPsyULWOY
         tm+OlaAE0holpDxPPIMu1HBppTW/IDCqXrniAoyn6MGuzJHRkI2GfjYE/v5Ueb78n2sR
         hzDgFe4HahtW5NwICWoXWHoNXX8r4iEA3vC4md2cKgxezBB1fmDS30pIs1mdS7HdvcX0
         1iJA==
X-Gm-Message-State: AOAM530EoQ2npSSsWFlqpp6KFUT75O+mned5rQ1TXKAlYeSIHQcveS3r
	pzLpufw7V9m05aa9oEmfRl+YtQ3jGqk=
X-Google-Smtp-Source: 
 ABdhPJyJnqg/9XavJc/Y14XlL4sYNxB/tLBxvaznYJ1UPhQeKg1V/Zz5lyt++iQVtavAnwk8vznCpw==
X-Received: by 2002:a05:6000:15c5:b0:20c:ff53:e24a with SMTP id
 y5-20020a05600015c500b0020cff53e24amr19214484wry.396.1653305085293;
        Mon, 23 May 2022 04:24:45 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 p6-20020a05600c358600b0039726cd3ae5sm10879883wmq.3.2022.05.23.04.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 04:24:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [RFC][PATCH] glibc-common.inc: add BSD-4-Clause-UC, BSD-3-Clause,
 ISC to LICENSE
Date: Mon, 23 May 2022 13:24:33 +0200
Message-Id: <20220523112433.383046-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 May 2022 11:24:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166005

* the main motivation is to get rid of this bbappend from 2014:
  https://github.com/openwebos/meta-webos/commit/8eb313e4303defbe495cf7f91974799046975fca
  which unfortunately doesn't explain which files under BSD license are included
  in which package and also uses ambiguous 'BSD' license which was
  removed from oe-core's common-licenses in:
  https://git.openembedded.org/openembedded-core/commit/?h=kirkstone&id=14d4c007c49652d836d325a12bdbcd3bfa42e6d5

* COPYING mentions only GPL-2.0-only & LGPL-2.1-only as our LICENSE variable says,
, but the LICENSES files lists various licenses with various Copyright
  holders, the ones I was able to figure out where:
  BSD-4-Clause-UC (but with 3rd clause explicitly removed)
  ISC
  BSD-3-Clause (with Intel Corportion copyright)
  BSD-3-Clause (with Oracle America copyright)
  which have just small formatting changes compared to corresponding
  license in common-licenses, but there are couple more, should we
  list them all (and create new common-licenses if needed)?

* there were only 7 changes in LICENSES file since 2002:
  https://sourceware.org/git/?p=glibc.git;a=history;f=LICENSES;h=530893b1dc9ea00755603c68fb36bd4fc38a7be8;hb=HEAD

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/glibc/glibc-common.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-common.inc b/meta/recipes-core/glibc/glibc-common.inc
index 90a6a534f3..7e3dc3b816 100644
--- a/meta/recipes-core/glibc/glibc-common.inc
+++ b/meta/recipes-core/glibc/glibc-common.inc
@@ -2,7 +2,7 @@ SUMMARY = "GLIBC (GNU C Library)"
 DESCRIPTION = "The GNU C Library is used as the system C library in most systems with the Linux kernel."
 HOMEPAGE = "http://www.gnu.org/software/libc/libc.html"
 SECTION = "libs"
-LICENSE = "GPL-2.0-only & LGPL-2.1-only"
+LICENSE = "GPL-2.0-only & LGPL-2.1-only & BSD-4-Clause-UC & BSD-3-Clause & ISC"
 
 LIC_FILES_CHKSUM ?= "file://LICENSES;md5=1541fd8f5e8f1579512bf05f533371ba \
       file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-- 
2.35.1


