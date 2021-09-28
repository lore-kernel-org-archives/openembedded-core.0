Return-Path: <purushottamchoudhary29@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49198C433F5
	for <webhook@archiver.kernel.org>; Tue, 28 Sep 2021 12:24:09 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.13041.1632831829517245415
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Sep 2021 05:23:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Sq/f/Cgm;
 spf=pass (domain: gmail.com, ip: 209.85.210.171,
 mailfrom: purushottamchoudhary29@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id g14so18820080pfm.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Sep 2021 05:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=Hq8kpzV2m3QXPBUPsH7Tz7PBcucwbeUPyVDLzRNvdT0=;
        b=Sq/f/CgmHIt+2QfuzT7k6AItnGv6Xy5ajQhYLhu+PPmDh4u9j9GxQPDIBSgspy/iaG
         7xHyPv49ZqHce/9TSjv/ecbUQJymdjWQr/luiiWgIYEb2KnFidQ69TRrH1vyVoiF4tse
         7p9KusRitXam4sQBbDqGJF11V7NHAiVe3Qq7RDzHQKnoQ3+fVRVetRdvceGU52tT08lV
         xdnDfALf45/ibyg56wLRPGSB33yGC99qwUMOOndurxZitU7ME46RFLD3OhjF43yIpSYq
         oLtz/GHbwKo1TXV4g29lQau19c/+6wqHq/teEztJFNVqs84lROoxsZuWy/9r6/YBL+nX
         HHWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Hq8kpzV2m3QXPBUPsH7Tz7PBcucwbeUPyVDLzRNvdT0=;
        b=U6djUnHgbT9MMY1qJ9u2R14vA15ahaIiW0B9CczXyNQtp7mDLRXISXjGh2TOj/LHXU
         ARqpGnWfmEmWYoz5WGDNwWtGicuI1ytJ4PCxJcCtS5KGBSjggIajMpZxgqUlJf3KciWe
         WO3bLUJwswY0ckV+Qx1HJ5ppgR7++K3xd9JUKZZPGrGeyCR8XJ+fsVprJll2P4uLWpOu
         Nrm8FrjrgMFNcHKRVWVcD4qofoD/Yo5/Gv+CzcvD91t6/KEwXl+ZNW03WbrLDhc9Uci6
         L7POoG9ZouuTZDSOJRSMQvqSMUFslpLxjqaZZi0rDwy5BveAuuwJeNLDMCyv5kfmZrte
         fCPA==
X-Gm-Message-State: AOAM532YxcUUatGOUNC9S7tWogW2YpEIN5und+bTxPuM+2P79HIPYJAB
	vz4v4xOnTAoEcxZftulS4v4lqfhEzOX45g==
X-Google-Smtp-Source: 
 ABdhPJxIXfKjXl+E/8/EX9aKdffQCdl9N72I7+HQGCK5xGsS++asi4vCPLqu9CBAuPAUxovXoZvurw==
X-Received: by 2002:aa7:8609:0:b0:44b:346a:7404 with SMTP id
 p9-20020aa78609000000b0044b346a7404mr5362748pfn.86.1632831828655;
        Tue, 28 Sep 2021 05:23:48 -0700 (PDT)
Received: from localhost.localdomain
 ([2405:201:a410:a032:8180:d55b:e649:74d7])
        by smtp.gmail.com with ESMTPSA id
 z14sm2081925pjq.48.2021.09.28.05.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 05:23:48 -0700 (PDT)
From: Purushottam Choudhary <purushottamchoudhary29@gmail.com>
To: openembedded-core@lists.openembedded.org,
	sakoman@gmail.com
Cc: mikko.rapeli@bmw.de,
	Purushottam Choudhary <purushottam.Choudhary@kpit.com>
Subject: [meta-OE][dunfell][PATCH] tcpdump: Update CVE-2020-8037 tag
Date: Tue, 28 Sep 2021 17:53:35 +0530
Message-Id: <20210928122335.2466-1-purushottamchoudhary29@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Sep 2021 12:24:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156415

CVE tag was missing inside the patch file
which is the remedy for CVE-2020-8037 and
tracked by cve-check.

Signed-off-by: Purushottam Choudhary <purushottam.Choudhary@kpit.com>
Signed-off-by: Purushottam Choudhary <purushottamchoudhary29@gmail.com>
---
 ...01-PPP-When-un-escaping-don-t-allocate-a-too-large-buff.patch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/0001-PPP-When-un-escaping-don-t-allocate-a-too-large-buff.patch b/meta-networking/recipes-support/tcpdump/tcpdump/0001-PPP-When-un-escaping-don-t-allocate-a-too-large-buff.patch
index 9b74e00c5..84d4716f3 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump/0001-PPP-When-un-escaping-don-t-allocate-a-too-large-buff.patch
+++ b/meta-networking/recipes-support/tcpdump/tcpdump/0001-PPP-When-un-escaping-don-t-allocate-a-too-large-buff.patch
@@ -9,6 +9,7 @@ if we haven't captured all of it.
 
 (backported from commit e4add0b010ed6f2180dcb05a13026242ed935334)
 
+CVE: CVE-2020-8037
 Upstream-Status: Backport
 Signed-off-by: Stacy Gaikovaia <stacy.gaikovaia@windriver.com>
 
-- 
2.17.1


