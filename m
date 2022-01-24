Return-Path: <nishaparrakat@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DF22C433EF
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 17:16:26 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.82.1643044585141170003
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jan 2022 09:16:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AGdifeXL;
 spf=pass (domain: gmail.com, ip: 209.85.128.53,
 mailfrom: nishaparrakat@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id
 r2-20020a1c2b02000000b0034f7b261169so338886wmr.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jan 2022 09:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=SJzWupsWcqr19OrI0X2pq8vF3flZfOOBsHlNNK1LE4s=;
        b=AGdifeXLat/bE/S6k4P9RoCqiTh0YcBmz0DD0nvUC5HUhgpAPcQj8n9wWUgCOegJKs
         VuPSp54xh31kbhB3AVZCRWt52J9Kaw9IJnDzZQSFvzuMCI5AHH9ntvjFZHMPuq5J3AAD
         7SAmHSZN7uIig5QgqDI7oJylsspOKEUV41VBSC8PfShV7BxvAVqylNq2uJc0ENNFK40n
         z9mFIqms/m57bLEkL4PfYB2B3+GshscB1Og9buRR0pks67+l5jJVEHnkXCY3Ln8gQ+yx
         lp8bUZE9eJKvPRuwgpj94N6phv5RgEGSGfo9jcWeBD8MbLgQEMkUB7IRoojMA8tQUOCH
         lj6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=SJzWupsWcqr19OrI0X2pq8vF3flZfOOBsHlNNK1LE4s=;
        b=nS3Gaix0oYD/CMpdK7EYD2XW9cmbdS+lNpZxYPeYSH6AG4D5HGG6X8ktsPyw9xOLKv
         DtEb1xQDL1Xfq65IC/EHAskexEY8KhNr5v4mpVS3O6Fl3Zh0jKZT/+mlS8Dsovl+FDZj
         5+WuEiOOa0TTZEAkGxRsnuY3Uf6sODlmFuzAzdgFULL2aJVMQg/iiqX8FOLe76oWaLD/
         ZY14G22UBynPhMEzw4rtSxd5FSgA97osH4rykpcEsUnoDhbtByUQx9sRwhS5PJ6sz+kF
         sdVHbVGfQ6dcHs1Feqv0RRrRzmovzVmVZFZil5mYgvAI7zaR0DiZ9kuSZ1YShAzrtlPh
         q4ww==
X-Gm-Message-State: AOAM5336OxMq8tnQiAxznbCQvTv3R1vSCLPdzTNMRTbHU06YbLC7ffVl
	rvKSMxlK8nrHHDrIwJY3rx0Y7TwBLSc=
X-Google-Smtp-Source: 
 ABdhPJwQF7i6A8LtsH8mjyeWUxWZ89V/2F5IdGircogjGENWjtcfABqu38YupUhjWbbxYXVl4ir9dQ==
X-Received: by 2002:a1c:1f16:: with SMTP id f22mr2642891wmf.183.1643044583622;
        Mon, 24 Jan 2022 09:16:23 -0800 (PST)
Received: from nishap-at-office.bmw-carit.intra ([212.118.206.70])
        by smtp.googlemail.com with ESMTPSA id
 o14sm3085839wry.104.2022.01.24.09.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 09:16:23 -0800 (PST)
From: Nisha Parrakat <nishaparrakat@gmail.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: Ross Burton <ross@burtonini.com>,
	Ross Burton <ross.burton@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [poky][dunfell][PATCH 1/6] lsof: correct LICENSE
Date: Mon, 24 Jan 2022 18:16:04 +0100
Message-Id: <20220124171609.20282-1-nishaparrakat@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jan 2022 17:16:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160883

From: Ross Burton <ross@burtonini.com>

The lsof LICENSE is superficially BSD-like, but it isn't BSD.  Now that
we have the full SPDX license set in oe-core, use Spencer-94.

(From OE-Core rev: 5c1d61d1d4dfacb643a366285c0392e6a31087ed)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Nisha Parrakat <nishaparrakat@gmail.com>
---
 meta/recipes-extended/lsof/lsof_4.91.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/lsof/lsof_4.91.bb b/meta/recipes-extended/lsof/lsof_4.91.bb
index b3adfd57af..7c85bf23fc 100644
--- a/meta/recipes-extended/lsof/lsof_4.91.bb
+++ b/meta/recipes-extended/lsof/lsof_4.91.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Lsof is a Unix-specific diagnostic tool. \
 Its name stands for LiSt Open Files, and it does just that."
 HOMEPAGE = "http://people.freebsd.org/~abe/"
 SECTION = "devel"
-LICENSE = "BSD"
+LICENSE = "Spencer-94"
 LIC_FILES_CHKSUM = "file://00README;beginline=645;endline=679;md5=964df275d26429ba3b39dbb9f205172a"
 
 # Upstream lsof releases are hosted on an ftp server which times out download
-- 
2.17.1


