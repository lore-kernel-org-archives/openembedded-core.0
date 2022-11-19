Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27D6CC4332F
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 21:15:59 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.30660.1668892550270301456
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 13:15:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=khLasT61;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id t17so6676239pjo.3
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 13:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Rry59wqCucS1kUYTuByD4tU0tEsk4PxrnBwY6n5k3o=;
        b=khLasT619G5IDMmiaDOS1Af75GHLJs5pRJLlJYQw9cHkSWWLrMDUrVn8CPdlieoxho
         9fgCTrW7ENsAF/CIltDSGc7CLHGa0kzd9H2ZBK6aKkkLiFkqccVGv+R1/DGKSjtzu40C
         jWdnyTS2/L84ZW/Box6UDcbItNfMt5Ra0tOr0MP6C6ouOcMhcHOiERBim9bfpTuEwU87
         VaRiFpxLAfh6VqP1klgkwBD8K3bOJHg0xr2LwX1h7o2gKoM9kYtG8ixqpOd7ndhstMhL
         PRDFPbqmir6x7I2MlY/TiYsGtsnetqWGOC891+c9XRiFvOLgOlnjGtNkULjQ0556N7Bm
         Gbmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Rry59wqCucS1kUYTuByD4tU0tEsk4PxrnBwY6n5k3o=;
        b=Z8oOMy8ibnGxpNbHrEkAx5+3arsG3mPddkmZqX+ED1XnbQ2ipD/HxDK8FBD0CMAcA3
         BBc1O60eLHCDQXu0idc+sMbzn5YQq7Ot4aG1g130jyRnTsR4DijywPcwyB3bdWv1ZtX/
         VfMtkSL0aUvP1uo2DfEnliFofT32gHrBev2TTwlKt8CLm55Keke5IYsPYNbvUk2WunoJ
         L8D1MYHMPWFaZPHhwwhoAAixpuem0m98Wp1vahjzq1dkIHE7sgNBUgog/kjGGtoEYZgx
         el25RULUSK/OSMlf8mKk3+nrpEFEPAMsL9S2uJ8/pUctQ+xv2FrDVcmwaUIqtNdcrGVa
         9Khw==
X-Gm-Message-State: ANoB5pmItwhIx8+vli/MXGssHjZSbKUL4crL7eGQvyMzCvZrz8BfiCEa
	wVzMR8/8JLQbbXSxb+2EF7Y6CifbTzw4rgNDVKs=
X-Google-Smtp-Source: AA0mqf6Pw6NRbHEunPmoEdo5ZEid8TivNbw83KsmvvcTlflracxHvPynpEPyJvfykqnuJsh28p0ePw==
X-Received: by 2002:a17:903:31d5:b0:188:5581:c8de with SMTP id v21-20020a17090331d500b001885581c8demr664829ple.140.1668892549118;
        Sat, 19 Nov 2022 13:15:49 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s16-20020a170902a51000b001869f2120a5sm6197735plq.34.2022.11.19.13.15.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 13:15:48 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 14/35] groff: submit patches upstream
Date: Sat, 19 Nov 2022 11:14:53 -1000
Message-Id: <cd49ff1795363a7029c6c18f4524a4c4425d870f.1668892398.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668892398.git.steve@sakoman.com>
References: <cover.1668892398.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 21:15:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173554

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4269cfcd6c29be05964010d0406584b80822d1d1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../groff/files/0001-Make-manpages-mulitlib-identical.patch     | 2 +-
 .../groff/files/0001-replace-perl-w-with-use-warnings.patch     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/groff/files/0001-Make-manpages-mulitlib-identical.patch b/meta/recipes-extended/groff/files/0001-Make-manpages-mulitlib-identical.patch
index 9105da6457..c3cfc7cea8 100644
--- a/meta/recipes-extended/groff/files/0001-Make-manpages-mulitlib-identical.patch
+++ b/meta/recipes-extended/groff/files/0001-Make-manpages-mulitlib-identical.patch
@@ -3,7 +3,7 @@ From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Sat, 7 Mar 2020 00:59:13 +0000
 Subject: [PATCH] Make manpages mulitlib identical
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [by email to g.branden.robinson@gmail.com]
 Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
 ---
  Makefile.am | 2 +-
diff --git a/meta/recipes-extended/groff/files/0001-replace-perl-w-with-use-warnings.patch b/meta/recipes-extended/groff/files/0001-replace-perl-w-with-use-warnings.patch
index eda6a40f51..b028fa20aa 100644
--- a/meta/recipes-extended/groff/files/0001-replace-perl-w-with-use-warnings.patch
+++ b/meta/recipes-extended/groff/files/0001-replace-perl-w-with-use-warnings.patch
@@ -15,7 +15,7 @@ doesn't work:
 
 So replace "perl -w" with "use warnings" to make it work.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [by email to g.branden.robinson@gmail.com]
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 
-- 
2.25.1


