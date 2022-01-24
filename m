Return-Path: <nishaparrakat@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BBEBC433FE
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 17:16:33 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.83.1643044592229929896
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jan 2022 09:16:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pOOljT8B;
 spf=pass (domain: gmail.com, ip: 209.85.221.47,
 mailfrom: nishaparrakat@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id h29so12246019wrb.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jan 2022 09:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=EnFMfEawkxI7TECROxGI6IjCfJzqcsONxNLIjmoV7PQ=;
        b=pOOljT8By5R3PNtw9SR+If8+/lda8hjJa8vYxm6b/5Tcfa0hdyaHqCROdtxS/SrxvB
         qS+cSKTfKXhvi7kmHBaj2XsFWvhcwWBiE9mdGWZ2F2snlsO1C1ZXz13DeJ6idLLcijb1
         DyK2m1Uswr6fPPB/XwWDHb9ODD+NBkl9Hgzikd17noBJfFCM1JUnCqJBWAWdLClBH0Im
         nzKSVHyHbT59Z/zaEQLy1HiczIgYh05KGhXlcf7yHd+Zs0QE9ud4WrMpkfgAl9gk7uSw
         dAV2JlUBmddzILZ5YsyIKTSD4H8LJp/oGqr4RsB75jqc0h6nN5QPyhrY01it9eTJoVgL
         6pPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=EnFMfEawkxI7TECROxGI6IjCfJzqcsONxNLIjmoV7PQ=;
        b=5ZcO//kyyZNJL9a6nYTScKVVo6uGTVl32lOGY36av+b2Je5l5lLg3UZMbpGdhJGg+A
         SkzKBZdO55g0WKnqLPybFEguEse4v41T2+ZQWughn33bXPPOnX2dm+riSKGFTdNI0F3k
         9hkDqsfzDvfokSeqG/50Hijfhmw9JL4mt404Jur0YW16ppazLqDXKT2+zeEZERmHCIt5
         64OTmJny+5b1IHHM1+Dh6v343lKwkYT6JIB8oFAzstVkPREdp1aBkfIhD0uGz16rw/1U
         xNn8HJwZ934g1NNttilt18IXX4t/Jfzf/KxL7gnPhG2yRnGmSxZIYS+gzCSZDS0miRae
         6knQ==
X-Gm-Message-State: AOAM531lNqj/J5ljp9uLqB4mEAX/+8OszSZlZaEyRFGVy0HzqoCqIfjP
	DEBRojEuC9RFOePThDPNeIuQBNGlkVI=
X-Google-Smtp-Source: 
 ABdhPJwI0TTtDPxovTWC/G4U8YQUfEw4I6ZX5nm1TgkzasEk9IyGHCfQUICCYp23g6Amz+w0Shmn5Q==
X-Received: by 2002:a5d:4582:: with SMTP id p2mr14684229wrq.130.1643044590899;
        Mon, 24 Jan 2022 09:16:30 -0800 (PST)
Received: from nishap-at-office.bmw-carit.intra ([212.118.206.70])
        by smtp.googlemail.com with ESMTPSA id
 o14sm3085839wry.104.2022.01.24.09.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 09:16:30 -0800 (PST)
From: Nisha Parrakat <nishaparrakat@gmail.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: Joshua Watt <JPEWhacker@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [poky][dunfell][PATCH 5/6] shadow: Use specific BSD license variant
Date: Mon, 24 Jan 2022 18:16:08 +0100
Message-Id: <20220124171609.20282-5-nishaparrakat@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220124171609.20282-1-nishaparrakat@gmail.com>
References: <20220124171609.20282-1-nishaparrakat@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jan 2022 17:16:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160887

From: Joshua Watt <JPEWhacker@gmail.com>

Make the license more accurate by specifying the specific variant of BSD
license instead of the generic one. This helps with SPDX license
attribution as "BSD" is not a valid SPDX license.

(From OE-Core rev: 65e3b23e1b266653fd30c90222e953f7e37fba0c)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Nisha Parrakat <nishaparrakat@gmail.com>
---
 meta/recipes-extended/shadow/shadow.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 7061dc7505..bfe50c18f6 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://github.com/shadow-maint/shadow"
 DESCRIPTION = "${SUMMARY}"
 BUGTRACKER = "http://github.com/shadow-maint/shadow/issues"
 SECTION = "base/utils"
-LICENSE = "BSD | Artistic-1.0"
+LICENSE = "BSD-3-Clause | Artistic-1.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ed80ff1c2b40843cf5768e5229cf16e5 \
                     file://src/passwd.c;beginline=2;endline=30;md5=5720ff729a6ff39ecc9f64555d75f4af"
 
-- 
2.17.1


