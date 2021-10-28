Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A829C433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Oct 2021 16:15:46 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web12.15186.1635437745853516024
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 09:15:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=URQ6KQ0W;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id x66so6409253pfx.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 09:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IIRE2UCveBdqJnZNyZqs1dc3pMnmm2WF8XQO4nsqHKk=;
        b=URQ6KQ0W7JN1xrMjuCIRUVfUC78NLVOu+5v+0yNgkVSaKwAfXFKMlQUvVkhUAijPZA
         9ZHy2NHCgqLi/sErQXRsuxRb9y3e4dyNrLHWrvxH+CBID9nloEc/kyxY1bEABgM8QpII
         iopiTlETdoI02/mb8mJLg9KykYrKWZ3RjFOrtnjk1FgkrIIwlMXkmRoW0bcxFyklD8oS
         FeFw4a3kSm0L1452vw8i6HYY/YUgzBwdKb5oZ03D9+qCgqRm8ufMLgppN9BYZsg+4l1k
         ogNtlGwzJ4RxyENYNzvWF1E1ADs0UQcrsVSDX9/dxPqm5Y5PaX/HSWbI6I4M2EreC0PV
         xsmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IIRE2UCveBdqJnZNyZqs1dc3pMnmm2WF8XQO4nsqHKk=;
        b=UCtjOx+pguVpmuFi0/ByE+fWKv681DVxUjQZtYOiETkPIS3mUVQluwCNeZTit7KYEV
         0C2hYWJDGYNsZiMbq5HdGtVOcuwXduq6vh++xCRI2Br4q7kYKXDwpqkqcIVoQkxcFMEA
         c5abX1lWPSUcvZtUWABTJg8R721thD73BR5U67pt/m1mcljfYgWRQ03sqmNfhcSAldIS
         kZrwAFLpH6XIE+CtjH0JE8V8p9oWPk+/LavCO1SsBmOXsjd0d1uS7kvWapBayEXhblP9
         6TgJGruNTewvTKR+Bo+g4wy7JWu09O5uwslNfhiJxLzv1UzinxpMY7N8LT0vGexUqb52
         Ubbg==
X-Gm-Message-State: AOAM5325ppOY+bdVw7cTTPqzherxX1++uoAIwwfFWLt8Q9WpwUb7ZJBA
	UVHKzqePQhesIq7MNu0tsJHIUTSaPoxVPfkhOlc=
X-Google-Smtp-Source: 
 ABdhPJy+lesGnO4eCTDbxmh8xHOa0q2ESmIR+tQ5R7eVY4tA9q0SbzO8lgKovjZ7VELdtWYd6q+wHw==
X-Received: by 2002:a63:9049:: with SMTP id a70mr3924182pge.228.1635437744288;
        Thu, 28 Oct 2021 09:15:44 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 me3sm8854434pjb.3.2021.10.28.09.15.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 09:15:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/4] Pull request (cover letter only)
Date: Thu, 28 Oct 2021 06:15:32 -1000
Message-Id: <cover.1635437681.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Oct 2021 16:15:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157599

The following changes since commit 62cdc20a2186ecd54d3a7131ec8f6937aa0229ed:

  uninative: Upgrade to 3.4 (2021-10-25 10:23:54 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Joshua Watt (1):
  classes/reproducible_build: Use atomic rename for SDE file

Richard Purdie (2):
  rpm: Deterministically set vendor macro entry
  reproducible_build: Work around caching issues

Steve Sakoman (1):
  selftest/reproducible: adjust exclusion list for dunfell

 meta/classes/reproducible_build.bbclass      | 24 +++++++++++---------
 meta/lib/oeqa/selftest/cases/reproducible.py |  5 ----
 meta/recipes-devtools/rpm/rpm_4.14.2.1.bb    |  3 ++-
 3 files changed, 15 insertions(+), 17 deletions(-)

-- 
2.25.1


