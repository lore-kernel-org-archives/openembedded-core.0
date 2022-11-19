Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33412C43219
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 21:16:19 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.30678.1668892572433779748
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 13:16:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=PBToTFUp;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 136so7952480pga.1
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 13:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cKm6SB8OMMcP6Ul3AnwDgLWo15Y8KSBkgciqmPVwe+s=;
        b=PBToTFUpDjgiti6nwyeR1lBb1qqZsrLD//IJM6utoil7sVH/JL38K0B8PElR1XFE6k
         Y25YDBYS77KD/+Rye4E5vDNdLL0ekaa7cp2UABNRcsjyLjtNFcou5VuOYqC+DIfLRHRF
         cqlFF0aUEnIrAt1c2zaOuAEcTJMbr1Ohc96f7quPLp2weqK1LEWxXQWdPnGo6wVBG4WM
         KR5VnsxrZR81Hox7SfOqlGxXZx3rSYRDweV5onKymdISOsd1Yl7ZfT4YLUzp8oyzAflb
         DJUK1PkD60fePRmeJRgrTQ3zX6R2nwevn5iQzWF7nrbn+6KYxvZ9Yjza3mWt+gkEKg/v
         C/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cKm6SB8OMMcP6Ul3AnwDgLWo15Y8KSBkgciqmPVwe+s=;
        b=IOqBmC2seV1J2JJ/DjO6JrfTn8kEW18oRcsKWPNM8fEGfE/Wt3Epl9KbYizK2uB4rT
         qlEZX1dZlLRSNCfbsKa9LlseKsq0wesFv2wv4o90n2TWOk1qGdp3IyG/sGiBpBhYgMj8
         smJJLWfI6F2Ob65J5ylQ8iVMW7E9+PEq8ePenD8ix+fNUp/y0yhPMVllRG/y0Px/zNMv
         vTFWqTNFyTT/is596F4To91RTlPTGao6iEHn6dYQhfjoe7lNo3hiKaoZ+cvltPAJgfQm
         7OWUXOqUEX2VVTnXFh4a1uFu1KMqJp7uV88A5xUbEN7I+ATj+S4ycC9ujwgspKju5+qp
         iF2Q==
X-Gm-Message-State: ANoB5pmFiXhubfhAX8YQoG7j/0M+wgGNGomotTQpfsFg4SElHDKx/Iyw
	yfa2PC9QK2gHMNitBWB73cWQ4nuqXKiYUhFWKho=
X-Google-Smtp-Source: AA0mqf6J4PnzfIe3LK9RN+F4r9LuW8crVgts1nWHhhO4I9If5rrh7TRlmKa5zpl23vCeG6nd0tmgpg==
X-Received: by 2002:aa7:9159:0:b0:572:24c7:34da with SMTP id 25-20020aa79159000000b0057224c734damr13934570pfi.73.1668892571508;
        Sat, 19 Nov 2022 13:16:11 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s16-20020a170902a51000b001869f2120a5sm6197735plq.34.2022.11.19.13.16.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 13:16:11 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 26/35] bitbake.conf: Drop export of SOURCE_DATE_EPOCH_FALLBACK
Date: Sat, 19 Nov 2022 11:15:05 -1000
Message-Id: <5ae95506b7818f142e2cd8adf46bfd2d5282983d.1668892398.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668892398.git.steve@sakoman.com>
References: <cover.1668892398.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 21:16:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173566

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Whilst SDE definitely needs to be exported, the fallback does not as
it is only used in our python code via the datastore.

It was introduced as an export in 9a1dde74e794362399193dc3f81c9685a83d0776
but even then it doesn't look like it needed to be, likely just a copy and
paste mistake.

Drop the export.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 74fb6539dd06acb0dd6a9af4809152975e8473e6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 62cdd9aa9c..a1f0f624e9 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -676,7 +676,7 @@ export PYTHONHASHSEED = "0"
 export PERL_HASH_SEED = "0"
 export SOURCE_DATE_EPOCH ?= "${@get_source_date_epoch_value(d)}"
 # A SOURCE_DATE_EPOCH of '0' might be misinterpreted as no SDE
-export SOURCE_DATE_EPOCH_FALLBACK ??= "1302044400"
+SOURCE_DATE_EPOCH_FALLBACK ??= "1302044400"
 REPRODUCIBLE_TIMESTAMP_ROOTFS ??= "1520598896"
 
 ##################################################################
-- 
2.25.1


