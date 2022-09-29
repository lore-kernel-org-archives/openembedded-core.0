Return-Path: <florin.diaconescu009@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA493C433F5
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 14:38:06 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web09.11298.1664462283054164998
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 07:38:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EaKT4CiH;
 spf=pass (domain: gmail.com, ip: 209.85.160.181,
 mailfrom: florin.diaconescu009@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id gb14so877197qtb.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 07:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=kyrMRT/Mn5diOSmbaSQSAIhx3569z7eUTWk76y4wcaQ=;
        b=EaKT4CiHE1UjLvT6ljV28dH1iSE22upXTONq4n1tg7CXQnMaoD15DKFa5C8ftUCQW4
         obhezgqwQ02NJ67MvXJb4yziSV5LrUqILgs5da7/iFOKYuabZ1ETwloqLLN5Vt/uLVVR
         fZbXbD+M8b/XU69p15GCnvWuZPwbohzFY2HcWZ5TK7v0MAfYTAcrzjGg3/33eZC4tej2
         2oucR7o8nkVeutrug34I/+hGGrf63G3SH9xb6rQXTioz45bgeeMiwly5Hpl4yApVBxMf
         1H08f4JTm22Fvq5TWSBfSDLCLlo7fBz7WkjLuahBC3N+KgQuqOwhGKRQr+pkjHaH9Xnw
         LZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=kyrMRT/Mn5diOSmbaSQSAIhx3569z7eUTWk76y4wcaQ=;
        b=iqWvyZD9RlJ3P/bYfA3USch+eh0yde5UNhSS32EdF+mxt6fRY6/XrZKu0gU07phqWF
         eSHHdPHz3Olyf2zd8Lo7E5h7gNqqe18O4+8qcrJt7pMU8BLR4YmnREm5bmixXWb+TGDm
         +8j4i9wOWQWd/aVM+H0QjZ6Ir3Jo/hBW1ZmH9r5vmBflpk1jsakIn06RjmoNHQMvkIJ9
         AbH891cZx2cu+kxpwK6fr2K/HQgzLt9ZBwxuiW6JyLLNc0D1lpfOHT9EJH8H2/UAqPwg
         tnjkNZmyhH6GEroAqhAIZNiDh8Q9NNh3DCcAZ7JvQZ6AOa5glJadwLbiX5MPmRVOnMtP
         xfMQ==
X-Gm-Message-State: ACrzQf1wM1WPsXflttfU2IKFf3n3bfQMGQ8i6dmtEIgHbOF3e1eTrte6
	4JRJKQ7sdfFI3/ANRN9EFP2IA3NlgHrG8A==
X-Google-Smtp-Source: 
 AMsMyM6uhy1bGywXhfJlCbVIgffOMAgqDpzrk2zDCjKsfNfMgULCPM2oqou3js8J2E1QD13DwffYvQ==
X-Received: by 2002:ac8:588c:0:b0:35b:b351:f470 with SMTP id
 t12-20020ac8588c000000b0035bb351f470mr2717778qta.42.1664462281800;
        Thu, 29 Sep 2022 07:38:01 -0700 (PDT)
Received: from FDIACONESCU-KS0.lenovo.com ([92.87.113.18])
        by smtp.gmail.com with ESMTPSA id
 z25-20020ac81019000000b0035d432f5ba3sm5489587qti.17.2022.09.29.07.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 07:38:01 -0700 (PDT)
From: Florin Diaconescu <florin.diaconescu009@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Florin Diaconescu <florin.diaconescu009@gmail.com>
Subject: [kirkstone][PATCH] rsync: update 3.2.4 -> 3.2.5
Date: Thu, 29 Sep 2022 17:37:36 +0300
Message-Id: <20220929143735.766-1-florin.diaconescu009@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Sep 2022 14:38:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171189

Changelog: https://download.samba.org/pub/rsync/NEWS#3.2.5

Signed-off-by: Florin Diaconescu <florin.diaconescu009@gmail.com>
---
 meta/recipes-devtools/rsync/{rsync_3.2.4.bb => rsync_3.2.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/rsync/{rsync_3.2.4.bb => rsync_3.2.5.bb} (96%)

diff --git a/meta/recipes-devtools/rsync/rsync_3.2.4.bb b/meta/recipes-devtools/rsync/rsync_3.2.5.bb
similarity index 96%
rename from meta/recipes-devtools/rsync/rsync_3.2.4.bb
rename to meta/recipes-devtools/rsync/rsync_3.2.5.bb
index e6f917b5cd..e43f35ea2f 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.4.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.2.5.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://determism.patch \
            "
 
-SRC_URI[sha256sum] = "6f761838d08052b0b6579cf7f6737d93e47f01f4da04c5d24d3447b7f2a5fad1"
+SRC_URI[sha256sum] = "2ac4d21635cdf791867bc377c35ca6dda7f50d919a58be45057fd51600c69aba"
 
 # -16548 required for v3.1.3pre1. Already in v3.1.3.
 CVE_CHECK_IGNORE += " CVE-2017-16548 "
-- 
2.25.1


